func:IsVehicleEngineStarted(veh_id)
{
    new _v_output;
    Vehicle_GetEngineState(veh_id, _v_output);
    return _v_output;
}
func:SetVehicleEngine(_veh_id)
{
    if(!IsVehicleEngineStarted(_veh_id))
    {
        Vehicle_SetEngineState(_veh_id, VEHICLE_PARAMS_ON);
        return 1;
    }
    else{
        Vehicle_SetEngineState(_veh_id, VEHICLE_PARAMS_ON);
        return 0;
    }
}
func:GetClosestCar(iPlayer, iException = INVALID_VEHICLE_ID, Float: fRange = Float: 0x7F800000)
{

    new iReturnID = INVALID_VEHICLE_ID,
    Float:
        fVehiclePos[4];

    for (new i = 1; i <= MAX_VEHICLES; ++i) if (GetVehicleModel(i) && i != iException)
        {
            GetVehiclePos(i, fVehiclePos[0], fVehiclePos[1], fVehiclePos[2]);
            if ((fVehiclePos[3] = GetPlayerDistanceFromPoint(iPlayer, fVehiclePos[0], fVehiclePos[1], fVehiclePos[2])) < fRange)
            {
                fRange = fVehiclePos[3];
                iReturnID = i;
            }
        }
    return iReturnID;
}

func:SetVehicleLights(vehicleid, playerid)
{
    new engine, lights, alarm, doors, bonnet, boot, objective;
    GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
    if (lights == VEHICLE_PARAMS_ON)
    {
        SetVehicleParamsEx(vehicleid, engine, VEHICLE_PARAMS_OFF, alarm, doors, bonnet, boot, objective);
        SendClientMessage(playerid, COLOR_WHITE, "Den xe da tat thanh cong.");
    }
    else if (lights == VEHICLE_PARAMS_OFF || lights == VEHICLE_PARAMS_UNSET)
    {
        SetVehicleParamsEx(vehicleid, engine, VEHICLE_PARAMS_ON, alarm, doors, bonnet, boot, objective);
        SendClientMessage(playerid, COLOR_WHITE, "Den xe da bat thanh cong.");
    }
    return 1;
}

func:SetVehicleHood(vehicleid, playerid)
{
    new engine, lights, alarm, doors, bonnet, boot, objective;
    GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
    if (bonnet == VEHICLE_PARAMS_ON)
    {
        SetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, VEHICLE_PARAMS_OFF, boot, objective);
        SendClientMessage(playerid, COLOR_WHITE, "Mui xe dong thanh cong.");
    }
    else if (bonnet == VEHICLE_PARAMS_OFF || bonnet == VEHICLE_PARAMS_UNSET)
    {
        SetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, VEHICLE_PARAMS_ON, boot, objective);
        SendClientMessage(playerid, COLOR_WHITE, "Mui xe mo thanh cong.");
    }
    return 1;
}

func:SetVehicleTrunk(vehicleid, playerid)
{
    new engine, lights, alarm, doors, bonnet, boot, objective;
    GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
    if (boot == VEHICLE_PARAMS_ON)
    {
        SetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, VEHICLE_PARAMS_OFF, objective);
        SendClientMessage(playerid, COLOR_WHITE, "Thung xe dong thanh cong.");
    }
    else if (boot == VEHICLE_PARAMS_OFF || boot == VEHICLE_PARAMS_UNSET)
    {
        SetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, VEHICLE_PARAMS_ON, objective);
        SendClientMessage(playerid, COLOR_WHITE, "Thung xe mo thanh cong.");
    }
    return 1;
}

func:SetVehicleDoors(vehicleid, playerid)
{
    new engine, lights, alarm, doors, bonnet, boot, objective;
    GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
    if (doors == VEHICLE_PARAMS_ON)
    {
        SetVehicleParamsEx(vehicleid, engine, lights, alarm, VEHICLE_PARAMS_OFF, bonnet, boot, objective);
        SendClientMessage(playerid, COLOR_WHITE, "Cua {AA3333}xe {FFFFFF}dong {33AA33}thanh cong{FFFFFF}.");
    }
    else if (doors == VEHICLE_PARAMS_OFF || doors == VEHICLE_PARAMS_UNSET)
    {
        SetVehicleParamsEx(vehicleid, engine, lights, alarm, VEHICLE_PARAMS_ON, bonnet, boot, objective);
        SendClientMessage(playerid, COLOR_WHITE, "Cua {AA3333}xe {FFFFFF}mo {33AA33}thanh cong{FFFFFF}.");
    }
    return 1;
}


func:LoadPlayerVehicle(playerid)
{
    new v_query[1280];
    PlayerVehicleCount[playerid] = 0;
    format(v_query, sizeof(v_query), "SELECT * FROM `vehicle` WHERE `sqlid` = '%d'", GetPlayerSQLID(playerid));
    mysql_tquery(Handle(), v_query, "OnLoadPlayerVehicle", "i", playerid);

    // printf("%s", v_query);
    return 1;
}

func:ReloadPlayerVehicle(playerid)
{
    for (new i; i < MAX_PLAYER_VEHICLES; i++)
    {
        PlayerVehicle[playerid][i][pv_id] = INVALID_NUMER;
        PlayerVehicle[playerid][i][pv_model] = INVALID_NUMER;
        PlayerVehicle[playerid][i][pvPosX] = INVALID_NUMER;
        PlayerVehicle[playerid][i][pvPosY] = INVALID_NUMER;
        PlayerVehicle[playerid][i][pvPosZ] = INVALID_NUMER;
        PlayerVehicle[playerid][i][pvPosR] = INVALID_NUMER;
        PlayerVehicle[playerid][i][pv_color1] = INVALID_NUMER;
        PlayerVehicle[playerid][i][pv_color2] = INVALID_NUMER;
        PlayerVehicle[playerid][i][pv_vw] = INVALID_NUMER;
        PlayerVehicle[playerid][i][pv_int] = INVALID_NUMER;
    }
    LoadPlayerVehicle(playerid);
    return 1;
}


func:SavePlayerVehicle(playerid, vehsqlid)
{
    for (new i; i < MAX_PLAYER_VEHICLES; i++)
    {
        if (PlayerVehicle[playerid][i][pv_id] == vehsqlid)
        {
            new v_save[1280];
            format(v_save, sizeof(v_save), "UPDATE `vehicle` SET \
            `model`  = '%d', \
            `pos_x`= '%f', \
            `pos_y` = '%f' ,\
            `pos_z`= '%f' ,\
            `pos_r`= '%f', \
            `lock`  = '%d', \
            `paintjob`  = '%d', \
            `color1`  = '%d', \
            `color2`  = '%d', \
            `ticket`  = '%d', \
            `restricted` = '%d', \
            `fuel` = '%d', \
            `impound` = '%d', \
            `vw` = '%d', \
            `int`  = '%d', \
            `health` = '%f', \
            `odo` = '%d' \
            WHERE `id` = '%d' ",
                   PlayerVehicle[playerid][i][pv_model],
                   PlayerVehicle[playerid][i][pvPosX],
                   PlayerVehicle[playerid][i][pvPosY],
                   PlayerVehicle[playerid][i][pvPosZ],
                   PlayerVehicle[playerid][i][pvPosR],

                   PlayerVehicle[playerid][i][pv_lock],
                   PlayerVehicle[playerid][i][pv_paintjob],
                   PlayerVehicle[playerid][i][pv_color1],
                   PlayerVehicle[playerid][i][pv_color2],
                   PlayerVehicle[playerid][i][pv_ticket],
                   PlayerVehicle[playerid][i][pv_restricted],
                   PlayerVehicle[playerid][i][pv_fuel],
                   PlayerVehicle[playerid][i][pv_impound],
                   PlayerVehicle[playerid][i][pv_vw],
                   PlayerVehicle[playerid][i][pv_int],
                   PlayerVehicle[playerid][i][pv_health],
                   PlayerVehicle[playerid][i][pv_odo],
                   PlayerVehicle[playerid][i][pv_id]);
            // printf("%s", v_save);
            mysql_tquery(Handle(), v_save, "");
            break;
        }
    }
    return 1;
}

func:SpawnPlayerVehicle(playerid, sqlid)
{
    for (new i; i < MAX_PLAYER_VEHICLES; i++)
    {
        if (PlayerVehicle[playerid][i][pv_id] == sqlid)
        {
            new ssa_vehicle;
            ssa_vehicle =
                CreateVehicle(PlayerVehicle[playerid][i][pv_model],
                              PlayerVehicle[playerid][i][pvPosX],
                              PlayerVehicle[playerid][i][pvPosY],
                              PlayerVehicle[playerid][i][pvPosZ],
                              PlayerVehicle[playerid][i][pvPosR],
                              PlayerVehicle[playerid][i][pv_color1],
                              PlayerVehicle[playerid][i][pv_color2],
                              0, 0);
            SetVehicleVirtualWorld(ssa_vehicle, PlayerVehicle[playerid][i][pv_vw]);
            LinkVehicleToInterior(ssa_vehicle, PlayerVehicle[playerid][i][pv_int]);

            PlayerVehicle[playerid][i][pv_vehid] = ssa_vehicle;
            PlayerVehicle[playerid][i][pv_spawned] = 1;

            VehicleFuel[ssa_vehicle] = PlayerVehicle[playerid][i][pv_fuel];

            SendClientMessage(playerid, -1, "Xe da duoc spawn ra !");
            break;
        }
    }
    return 1;
}

func:DestroyPlayerVehicle(playerid, sqlid)
{
    for (new i; i < MAX_PLAYER_VEHICLES; i++)
    {
        if (PlayerVehicle[playerid][i][pv_id] == sqlid)
        {
            GetVehiclePos(PlayerVehicle[playerid][i][pv_vehid], PlayerVehicle[playerid][i][pvPosX], PlayerVehicle[playerid][i][pvPosY], PlayerVehicle[playerid][i][pvPosZ]);
            DestroyVehicle(PlayerVehicle[playerid][i][pv_vehid]);


            PlayerVehicle[playerid][i][pv_vehid] = INVALID_NUMBER;
            PlayerVehicle[playerid][i][pv_spawned] = 0;
        }
    }
    return 1;
}

func:CreatePlayerVehicle(playerid, model, lock, paintjob, color1, color2)
{
    new Float:v_Pos[4];
    GetPlayerPos(playerid, v_Pos[0], v_Pos[1], v_Pos[2]);
    GetPlayerFacingAngle(playerid, v_Pos[3]);

    new fuel_v = 100;
    // if(model < 611) fuel_v = MaxVehicleFuel[model-400];
    // else fuel_v = 100;
    new v_save[1280];
    format(v_save, sizeof(v_save), "INSERT INTO `vehicle` SET \
    `sqlid`  = '%d', \
    `model`  = '%d', \
    `pos_x`= '%f', \
    `pos_y` = '%f', \
    `pos_z`= '%f', \
    `pos_r`= '%f', \
    `lock`  = '%d', \
    `paintjob`  = '%d', \
    `color1`  = '%d', \
    `color2`  = '%d', \
    `ticket`  = '0', \
    `restricted` = '0', \
    `fuel` = '%d', \
    `impound` = '0', \
    `health` = '1000',\
    `vw` = '%d', \
    `int`  = '%d'",
           GetPlayerSQLID(playerid),
           model,
           v_Pos[0], v_Pos[1], v_Pos[2], v_Pos[3],
           lock,
           paintjob,
           color1,
           color2,
           fuel_v,
           GetPlayerVirtualWorld(playerid),
           GetPlayerInterior(playerid));
    // printf("%s", v_save);
    if (mysql_tquery(Handle(), v_save, "")) ReloadPlayerVehicle(playerid);

    return 1;
}

func:GetVehicleName(modelid)
{
    new vehicle_name[256];
    if (modelid < 612)
    {
        format(vehicle_name, sizeof(vehicle_name), "%s", VehicleName[modelid - 400]);
    }
    else
    {
        for (new i = 0; i < sizeof(VehicleCustomName); i++)
        {
            if (modelid == VehicleCustomName[i][vc_id])
            {
                format(vehicle_name, sizeof(vehicle_name), "%s", VehicleCustomName[i][vc_name]);
                break;
            }
        }
    }
    return vehicle_name;
}


func:GetVehicleStatus(playerid, vehid)
{
    new status_v[128];
    for (new i; i < MAX_PLAYER_VEHICLES; i++)
    {
        if (PlayerVehicle[playerid][i][pv_vehid] == vehid)
        {
            if (PlayerVehicle[playerid][i][pv_spawned] == 0) status_v = "Trong kho";
            if (PlayerVehicle[playerid][i][pv_spawned] == 1) status_v = "Da lay ra";
            if (PlayerVehicle[playerid][i][pv_impound] == 1 && PlayerVehicle[playerid][i][pv_spawned] == 0) status_v = "Tam giu";
            if (PlayerVehicle[playerid][i][pv_restricted] == 1 && PlayerVehicle[playerid][i][pv_spawned] == 0) status_v = "Han che";
        }
    }
    return status_v;
}

func:IsVehicleAdminSpawn(vehid)
{
    for (new i; i < MAX_VEHICLES; i++)
    {
        if (iCreate[i] == vehid) return 1;
    }
    return 0;
}

func:IsABoat(carid)
{
    switch (GetVehicleModel(carid))
    {
        case 472, 473, 493, 484, 430, 454, 453, 452, 446, 595:
            return 1;
    }
    return 0;
}

func:IsABike(carid)
{
    switch (GetVehicleModel(carid))
    {
        case 509, 481, 510, 462, 448, 581, 522, 461, 521, 523, 463, 586, 468, 471:
            return 1;
    }
    return 0;
}

func:IsATrain(modelid)
{
    switch (modelid)
    {
        case 538, 537, 449, 590, 569, 570:
            return 1;
    }
    return 0;
}

func:IsASpawnedTrain(carid)
{
    switch (GetVehicleModel(carid))
    {
        case 538, 537, 449, 590, 569, 570:
            return 1;
    }
    return 0;
}

func:IsAPlane(carid, type = 0)
{
    if (type == 0)
    {
        switch (GetVehicleModel(carid))
        {
            case 592, 577, 511, 512, 593, 520, 553, 476, 519, 460, 513, 548, 425, 417, 487, 488, 497, 563, 447, 469:
                return 1;
        }
    }
    else
    {
        switch (carid)
        {
            case 592, 577, 511, 512, 593, 520, 553, 476, 519, 460, 513, 548, 425, 417, 487, 488, 497, 563, 447, 469:
                return 1;
        }
    }
    return 0;
}

func:IsRestrictedVehicle(modelid)
{
    switch (modelid)
    {
        case 406, 407, 408, 416, 425, 430, 432, 433, 447, 464, 465, 476, 486, 488, 490, 497, 501, 520, 523, 524, 525, 528, 532, 544, 548, 552, 563, 564, 577, 582, 592, 594, 596, 597, 598, 599, 601, 610, 611:
            return 1;
    }
    return 0;
}

func:InitPlayerVehMap()
{
    for (new i = 0; i < MAX_PLAYERS; i++)
    {
        for (new j = 0; j < MAX_PLAYER_VEHICLES; j++)
        {
            PlayerVehMap[i][PlayerVehicle[i][j][pv_vehid]] = j;
        }
    }
}
func:IsPersonalVehicle(_c_vehid)
{
    foreach (new i:Player)
    {
        for (new j; j < MAX_PLAYER_VEHICLES; j++)
        {
            if (_c_vehid == PlayerVehicle[i][j][pv_vehid]) return 1;
        }
    }
    return 0;
}