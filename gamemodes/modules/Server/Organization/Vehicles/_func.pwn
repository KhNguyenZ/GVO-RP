
func:LoadOrgVehicle(_org_id)
{
    new v_query[1280];
    format(v_query, sizeof(v_query), "SELECT * FROM `orgvehs` WHERE `orgid` = '%d'", _org_id);
    mysql_tquery(Handle(), v_query, "OnLoadOrgVehicle", "i", _org_id);
    return 1;
}
func:SaveOrgVeh(_sorg_id)
{
    for (new i; i < MAX_ORG_VEHICLES; i++)
    {
        GetVehiclePos(OrgVeh[_sorg_id][i][ov_vehid],
                      OrgVeh[_sorg_id][i][ovPosX],
                      OrgVeh[_sorg_id][i][ovPosY],
                      OrgVeh[_sorg_id][i][ovPosZ]);
        GetVehicleZAngle(OrgVeh[_sorg_id][i][ov_vehid], OrgVeh[_sorg_id][i][ovPosR]);
        GetVehicleHealth(OrgVeh[_sorg_id][i][ov_vehid], OrgVeh[_sorg_id][i][ov_health]);
        OrgVeh[_sorg_id][i][ov_vw] = GetVehicleVirtualWorld(OrgVeh[_sorg_id][i][ov_vehid]);
        new v_save[1280];
        format(v_save, sizeof(v_save), "UPDATE `orgvehs` SET \
            `model`  = '%d', \
            `pos_x`= '%f', \
            `pos_y` = '%f' ,\
            `pos_z`= '%f' ,\
            `pos_r`= '%f', \
            `lock`  = '%d', \
            `paintjob`  = '%d', \
            `color1`  = '%d', \
            `color2`  = '%d', \
            `fuel` = '%d', \
            `vw` = '%d', \
            `int`  = '%d', \
            `health` = '%d', \
            `odo` = '%d', \
            `siren` = '%d'\
            WHERE `orgid` = '%d' ",
               OrgVeh[_sorg_id][i][ov_model],
               OrgVeh[_sorg_id][i][ovPosX],
               OrgVeh[_sorg_id][i][ovPosY],
               OrgVeh[_sorg_id][i][ovPosZ],
               OrgVeh[_sorg_id][i][ovPosR],

               OrgVeh[_sorg_id][i][ov_lock],
               OrgVeh[_sorg_id][i][ov_paintjob],
               OrgVeh[_sorg_id][i][ov_color1],
               OrgVeh[_sorg_id][i][ov_color2],
               OrgVeh[_sorg_id][i][ov_fuel],
               OrgVeh[_sorg_id][i][ov_vw],
               OrgVeh[_sorg_id][i][ov_int],
               OrgVeh[_sorg_id][i][ov_health],
               OrgVeh[_sorg_id][i][ov_odo],
               OrgVeh[_sorg_id][i][ov_siren],
               OrgVeh[_sorg_id][i][ov_id]);

        mysql_tquery(Handle(), v_save, "");
        break;
    }
    return 1;
}



func:CreateOrgVehicle(playerid, _org_id, _vmodel, lock, paintjob, color1, color2, siren = 0)
{
    new Float:v_Pos[4];
    GetPlayerPos(playerid, v_Pos[0], v_Pos[1], v_Pos[2]);
    GetPlayerFacingAngle(playerid, v_Pos[3]);

    new fuel_v = 100;
    // if(model < 611) fuel_v = MaxVehicleFuel[model-400];
    // else fuel_v = 100;
    new v_save[1280];
    format(v_save, sizeof(v_save), "INSERT INTO `orgvehs` SET \
    `orgid`  = '%d', \
    `model`  = '%d', \
    `pos_x`= '%f', \
    `pos_y` = '%f', \
    `pos_z`= '%f', \
    `pos_r`= '%f', \
    `lock`  = '%d', \
    `paintjob`  = '%d', \
    `color1`  = '%d', \
    `color2`  = '%d', \
    `fuel` = '%d', \
    `vw` = '%d', \
    `siren` = '%d',\
    `int`  = '%d'",
           _org_id,
           _vmodel,
           v_Pos[0], v_Pos[1], v_Pos[2], v_Pos[3],
           lock,
           paintjob,
           color1,
           color2,
           fuel_v,
           GetPlayerVirtualWorld(playerid),
           siren,
           GetPlayerInterior(playerid));
    printf("%s", v_save);
    mysql_tquery(Handle(), v_save, "OnCreateVehOrg", "iiiiiiii", playerid, _org_id, _vmodel, lock, paintjob, color1, color2, siren);
    return 1;
}

forward OnCreateVehOrg(playerid, _org_id, _vmodel, lock, paintjob, color1, color2, siren);
public OnCreateVehOrg(playerid, _org_id, _vmodel, lock, paintjob, color1, color2, siren)
{

    new Float:v_Pos[4];
    GetPlayerPos(playerid, v_Pos[0], v_Pos[1], v_Pos[2]);
    GetPlayerFacingAngle(playerid, v_Pos[3]);

    new _vid = cache_insert_id();
    printf("Cache insert id: %d", _vid);
    OrgVeh[_org_id][_vid][ov_model] = _vmodel;
    OrgVeh[_org_id][_vid][ovPosX] = v_Pos[0];
    OrgVeh[_org_id][_vid][ovPosY] = v_Pos[1];
    OrgVeh[_org_id][_vid][ovPosZ] = v_Pos[2];
    OrgVeh[_org_id][_vid][ovPosR] = v_Pos[3];

    OrgVeh[_org_id][_vid][ov_lock] = lock;
    OrgVeh[_org_id][_vid][ov_paintjob] = paintjob;
    OrgVeh[_org_id][_vid][ov_color1] = color1;
    OrgVeh[_org_id][_vid][ov_color2] = color2;
    OrgVeh[_org_id][_vid][ov_fuel] = 100;
    OrgVeh[_org_id][_vid][ov_vw] = GetPlayerVirtualWorld(playerid);
    OrgVeh[_org_id][_vid][ov_int] = GetPlayerInterior(playerid);
    OrgVeh[_org_id][_vid][ov_health] = 3000;
    OrgVeh[_org_id][_vid][ov_odo] = 0;
    OrgVeh[_org_id][_vid][ov_id] = _vid;

    
    // printf("Model: %d\n", OrgVeh[_org_id][_vid][ov_model]); // Assuming ov_model is at index 0
    // printf("Position X: %.2f\n", OrgVeh[_org_id][_vid][ovPosX]); // Assuming ovPosX is at index 1
    // printf("Position Y: %.2f\n", OrgVeh[_org_id][_vid][ovPosY]); // Assuming ovPosY is at index 2
    // printf("Position Z: %.2f\n", OrgVeh[_org_id][_vid][ovPosZ]); // Assuming ovPosZ is at index 3
    // printf("Position R: %.2f\n", OrgVeh[_org_id][_vid][ovPosR]); // Assuming ovPosR is at index 4

    // printf("Lock: %d\n", OrgVeh[_org_id][_vid][ov_lock]); // Assuming ov_lock is at index 5
    // printf("Paintjob: %d\n", OrgVeh[_org_id][_vid][ov_paintjob]); // Assuming ov_paintjob is at index 6
    // printf("Fuel: %0.2f\n", OrgVeh[_org_id][_vid][ov_fuel]); // Assuming ov_fuel is at index 9
    // printf("Virtual World: %d\n", OrgVeh[_org_id][_vid][ov_vw]); // Assuming ov_vw is at index 10
    // printf("Interior: %d\n", OrgVeh[_org_id][_vid][ov_int]); // Assuming ov_int is at index 11
    // printf("Health: %d\n", OrgVeh[_org_id][_vid][ov_health]); // Assuming ov_health is at index 12
    // printf("Odometer: %d\n", OrgVeh[_org_id][_vid][ov_odo]); // Assuming ov_odo is at index 13
    // printf("Siren: %d\n", OrgVeh[_org_id][_vid][ov_siren]); // Assuming ov_siren is at index 14
    // printf("ID: %d\n", OrgVeh[_org_id][_vid][ov_id]); // Assuming ov_id is at index 15

    OrgVeh[_org_id][_vid][ov_vehid] = CreateVehicle(_vmodel, v_Pos[0], v_Pos[1], v_Pos[2], v_Pos[3], color1, color2, 500, siren);
    SetVehicleHealth(OrgVeh[_org_id][_vid][ov_vehid], OrgVeh[_org_id][_vid][ov_health]);
    return 1;
}
public OnPlayerStateChange(playerid, newstate, oldstate)
{
    if(newstate == PLAYER_STATE_DRIVER)
    {
        for (new i; i < MAX_ORG; i++)
        {
            for (new j; j < MAX_ORG_VEHICLES; j++)
            {
                new _check_veh = GetPlayerVehicleID(playerid);
                if (_check_veh == OrgVeh[i][j][ov_vehid])
                {
                    if (Character[playerid][char_OrgID] != i)
                    {
                        RemovePlayerFromVehicle(playerid);
                        new tb_msg[1280];
                        format(tb_msg, 1280, "Chiec xe nay thuoc to chuc '%s'. Ban khong co quyen lai chiec xe nay", OrgData[i][org_name]);
                        SendClientMessage(playerid, -1, tb_msg);
                        break;
                    }
                }
            }
        }
    }
    return 1;
}

func:InitOrgVehMap() {
    for (new j = 0; j < MAX_ORG; j++) {
        for (new z = 0; z < MAX_ORG_VEHICLES; z++) {
            OrgVehMap[OrgVeh[j][z][ov_vehid]][0] = j;
            OrgVehMap[OrgVeh[j][z][ov_vehid]][1] = z;
        }
    }
}