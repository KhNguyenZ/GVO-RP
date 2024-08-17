func:CreateDealershipVehicle(_slot)
{
    Vehicle_Selling[_slot] = CreateVehicle(Dealership[_slot][d_model],
    Dealership[_slot][d_PosX],
    Dealership[_slot][d_PosY],
    Dealership[_slot][d_PosZ],
    Dealership[_slot][d_PosA],
    1, 1, 1000, 0);
    Dealership[_slot][d_Label] = Create3DTextLabel(sprintf("Chiec xe %s nay dang ban voi gia %s", GetVehicleName(Dealership[_slot][d_model]), convertNumber(Dealership[_slot][d_price])),
        -1,
        Dealership[_slot][d_PosX],
        Dealership[_slot][d_PosY],
        Dealership[_slot][d_PosZ],
        50, 0 ,0);
    Attach3DTextLabelToVehicle(Dealership[_slot][d_Label], Vehicle_Selling[_slot], 0,0,0);

    Iter_Add(Vehicle_Dealership, Vehicle_Selling[_slot]);
}


func:NewDealershipVehicle(playerid, _price)
{
    if(!IsPlayerInAnyVehicle(playerid)) return 1;
    for(new i; i < MAX_DEALERSHIP_VEH; i++)
    {
        if(Dealership[i][d_model] == 0 && Dealership[i][d_price] == 0)
        {
            new _d_vehid = GetPlayerVehicleID(playerid);
            Dealership[i][d_id] = i;
            Dealership[i][d_model] = GetVehicleModel(_d_vehid);
            
            GetVehiclePos(_d_vehid,
                Dealership[i][d_PosX],
                Dealership[i][d_PosY],
                Dealership[i][d_PosZ]);

            GetPlayerFacingAngle(playerid,Dealership[i][d_PosA]);

            Dealership[i][d_price] = _price;

            Iter_Add(Vehicle_Dealership, _d_vehid);
            printf("ID: %d | Model: %d", Dealership[i][d_id],Dealership[i][d_model]);
            printf(sprintf("INSERT INTO `dealership` (Model, Type, Price,PositionX,PositionY,PositionZ,PositionA) VALUES (%d, 0, %d, %.2f,%.2f,%.2f,%.2f)",
            Dealership[i][d_model],
            Dealership[i][d_price],
            Dealership[i][d_PosX],
            Dealership[i][d_PosY],
            Dealership[i][d_PosZ],
            Dealership[i][d_PosA]));
            mysql_query(Handle(), sprintf("INSERT INTO `dealership` (Model, Type, Price,PositionX,PositionY,PositionZ,PositionA) VALUES (%d, 0, %d, %.2f,%.2f,%.2f,%.2f)",
            Dealership[i][d_model],
            Dealership[i][d_price],
            Dealership[i][d_PosX],
            Dealership[i][d_PosY],
            Dealership[i][d_PosZ],
            Dealership[i][d_PosA]));

            CreateDealershipVehicle(i);
            DestroyVehicle(GetPlayerVehicleID(playerid));
            return 1;
        }
    }
    return 0;
}

func:DealerPutNewVehicle(playerid, _price)
{
    if(!IsPlayerInAnyVehicle(playerid)) return 1;
    new _veh_id = GetPlayerVehicleID(playerid);
    new _model_id = GetVehicleModel(_veh_id);
    NewDealershipVehicle(playerid, _price);
    return 1;
}

CMD:createdealerveh(playerid, params[])
{
    new _dmodel, _dprice;

    if(sscanf(params, "ii", _dmodel, _dprice)) return SendUsageMessage(playerid, "/createdealerveh [Model ID] [Price]");
    new Float:_VPos[3];
    GetPlayerPos(playerid, _VPos[0],_VPos[1],_VPos[2]);
    new _temp_veh = CreateVehicle(_dmodel, _VPos[0],_VPos[1],_VPos[2], 0, 1, 1, 500, 0);
    PutPlayerInVehicle(playerid, _temp_veh, 0);
    SetPVarInt(playerid, #PutNewVehicles, 1);
    SetPVarInt(playerid, #DealerNewVehPrice, _dprice);
    SendUsageMessage(playerid, "Su dung [N] de dat xe tai dia diem ban muon trung bay !");
    return 1;
}
