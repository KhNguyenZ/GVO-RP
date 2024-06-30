new PlayerText:VehControllPTD[MAX_PLAYERS][4];
func:CreatePlayerControll(playerid){

    VehControllPTD[playerid][0] = CreatePlayerTextDraw(playerid, 552.000000, 289.000000, "mdl-2022:smartkey");
    PlayerTextDrawFont(playerid, VehControllPTD[playerid][0], 4);
    PlayerTextDrawLetterSize(playerid, VehControllPTD[playerid][0], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, VehControllPTD[playerid][0], 65.500000, 148.500000);
    PlayerTextDrawSetOutline(playerid, VehControllPTD[playerid][0], 1);
    PlayerTextDrawSetShadow(playerid, VehControllPTD[playerid][0], 0);
    PlayerTextDrawAlignment(playerid, VehControllPTD[playerid][0], 1);
    PlayerTextDrawColor(playerid, VehControllPTD[playerid][0], -1);
    PlayerTextDrawBackgroundColor(playerid, VehControllPTD[playerid][0], 255);
    PlayerTextDrawBoxColor(playerid, VehControllPTD[playerid][0], 50);
    PlayerTextDrawUseBox(playerid, VehControllPTD[playerid][0], 1);
    PlayerTextDrawSetProportional(playerid, VehControllPTD[playerid][0], 1);
    PlayerTextDrawSetSelectable(playerid, VehControllPTD[playerid][0], 0);

    VehControllPTD[playerid][1] = CreatePlayerTextDraw(playerid, 564.000000, 331.000000, "mdl-2022:lock");
    PlayerTextDrawFont(playerid, VehControllPTD[playerid][1], 4);
    PlayerTextDrawLetterSize(playerid, VehControllPTD[playerid][1], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, VehControllPTD[playerid][1], 42.500000, 38.000000);
    PlayerTextDrawSetOutline(playerid, VehControllPTD[playerid][1], 1);
    PlayerTextDrawSetShadow(playerid, VehControllPTD[playerid][1], 0);
    PlayerTextDrawAlignment(playerid, VehControllPTD[playerid][1], 1);
    PlayerTextDrawColor(playerid, VehControllPTD[playerid][1], -1);
    PlayerTextDrawBackgroundColor(playerid, VehControllPTD[playerid][1], 255);
    PlayerTextDrawBoxColor(playerid, VehControllPTD[playerid][1], 50);
    PlayerTextDrawUseBox(playerid, VehControllPTD[playerid][1], 1);
    PlayerTextDrawSetProportional(playerid, VehControllPTD[playerid][1], 1);
    PlayerTextDrawSetSelectable(playerid, VehControllPTD[playerid][1], 1);

    VehControllPTD[playerid][2] = CreatePlayerTextDraw(playerid, 560.000000, 388.000000, "mdl-2022:unlock");
    PlayerTextDrawFont(playerid, VehControllPTD[playerid][2], 4);
    PlayerTextDrawLetterSize(playerid, VehControllPTD[playerid][2], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, VehControllPTD[playerid][2], 27.000000, 38.000000);
    PlayerTextDrawSetOutline(playerid, VehControllPTD[playerid][2], 1);
    PlayerTextDrawSetShadow(playerid, VehControllPTD[playerid][2], 0);
    PlayerTextDrawAlignment(playerid, VehControllPTD[playerid][2], 1);
    PlayerTextDrawColor(playerid, VehControllPTD[playerid][2], -1);
    PlayerTextDrawBackgroundColor(playerid, VehControllPTD[playerid][2], 255);
    PlayerTextDrawBoxColor(playerid, VehControllPTD[playerid][2], 50);
    PlayerTextDrawUseBox(playerid, VehControllPTD[playerid][2], 1);
    PlayerTextDrawSetProportional(playerid, VehControllPTD[playerid][2], 1);
    PlayerTextDrawSetSelectable(playerid, VehControllPTD[playerid][2], 1);

    VehControllPTD[playerid][3] = CreatePlayerTextDraw(playerid, 584.000000, 388.000000, "mdl-2022:trunk");
    PlayerTextDrawFont(playerid, VehControllPTD[playerid][3], 4);
    PlayerTextDrawLetterSize(playerid, VehControllPTD[playerid][3], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, VehControllPTD[playerid][3], 27.000000, 38.000000);
    PlayerTextDrawSetOutline(playerid, VehControllPTD[playerid][3], 1);
    PlayerTextDrawSetShadow(playerid, VehControllPTD[playerid][3], 0);
    PlayerTextDrawAlignment(playerid, VehControllPTD[playerid][3], 1);
    PlayerTextDrawColor(playerid, VehControllPTD[playerid][3], -1);
    PlayerTextDrawBackgroundColor(playerid, VehControllPTD[playerid][3], 255);
    PlayerTextDrawBoxColor(playerid, VehControllPTD[playerid][3], 50);
    PlayerTextDrawUseBox(playerid, VehControllPTD[playerid][3], 1);
    PlayerTextDrawSetProportional(playerid, VehControllPTD[playerid][3], 1);
    PlayerTextDrawSetSelectable(playerid, VehControllPTD[playerid][3], 1);
    return 1;
}

func:OpenSmartKey(playerid)
{
    for(new i; i < 4; i++)
    {
        PlayerTextDrawShow(playerid, VehControllPTD[playerid][i]);
    }
    SelectTextDraw(playerid, COLOR_GREEN);
}
func:CloseSmartKey(playerid)
{
    for(new i; i < 4; i++)
    {
        PlayerTextDrawDestroy(playerid, VehControllPTD[playerid][i]);
    }
    CancelSelectTextDraw(playerid);
    return 1;
}

func:SmartKeyClick(playerid, PlayerText:playertextid)
{
    if(playertextid == VehControllPTD[playerid][1])
    {
        PlayerPlaySound(playerid, 1147 , 0.0, 0.0, 10.0);
        new vehicleid = GetNeraestVehicle(playerid, 10.0);
        new bool:engine, bool:lights, bool:alarm, bool:doors, bool:bonnet, bool:boot, bool:objective;
        GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
        SetVehicleParamsEx(vehicleid, engine, lights, alarm, VEHICLE_PARAMS_ON, bonnet, boot , objective);
        CloseSmartKey(playerid);
    }
    if(playertextid == VehControllPTD[playerid][2])
    {
        PlayerPlaySound(playerid, 1147 , 0.0, 0.0, 10.0);
        new vehicleid = GetNeraestVehicle(playerid, 10.0);
        new bool:engine, bool:lights, bool:alarm, bool:doors, bool:bonnet, bool:boot, bool:objective;
        GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
        SetVehicleParamsEx(vehicleid, engine, lights, alarm, VEHICLE_PARAMS_OFF, bonnet, boot , objective);
        CloseSmartKey(playerid);
    }
    if(playertextid == VehControllPTD[playerid][3])
    {
        PlayerPlaySound(playerid, 1147 , 0.0, 0.0, 10.0);
        new vehicleid = GetNeraestVehicle(playerid, 10.0);
        new bool:engine, bool:lights, bool:alarm, bool:doors, bool:bonnet, bool:boot, bool:objective;
        if(boot == VEHICLE_PARAMS_ON)
        {
            SetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, VEHICLE_PARAMS_OFF , objective);
            CloseSmartKey(playerid);
        }
        else 
        {
            SetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, VEHICLE_PARAMS_ON, objective);
            CloseSmartKey(playerid);
        }
    }
}