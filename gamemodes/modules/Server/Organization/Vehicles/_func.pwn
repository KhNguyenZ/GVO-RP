
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
        GetVehicleZAngle(OrgVeh[_sorg_id][i][ov_vehid],, OrgVeh[_sorg_id][i][ovPosR]);
        GetVehicleHealth(OrgVeh[_sorg_id][i][ov_vehid],, OrgVeh[_sorg_id][i][ov_health]);
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
               OrgVeh[_sorg_id][i][ov_sqlid]);

        mysql_tquery(Handle(), v_save, "");
        break;
    }
    return 1;
}



func:CreateOrgVehicle(playerid, _org_id, model, lock, paintjob, color1, color2, siren = 0)
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
           model,
           v_Pos[0], v_Pos[1], v_Pos[2], v_Pos[3],
           lock,
           paintjob,
           color1,
           color2,
           fuel_v,
           GetPlayerVirtualWorld(playerid),
           siren,
           GetPlayerInterior(playerid));
    if (mysql_tquery(Handle(), v_save, ""))
    {
        new _vid = cache_insert_id();

        OrgVeh[_org_id][_vid][ov_model] = model;
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
        OrgVeh[_org_id][_vid][ov_sqlid] = _vid;


        OrgVeh[_org_id][_vid][ov_vehid] = CreateVehicle(model, v_Pos[0], v_Pos[1], v_Pos[2], v_Pos[3], color1, color2, 500, siren);
        SetVehicleHealth(OrgVeh[_org_id][_vid][ov_vehid], OrgVeh[_org_id][_vid][ov_health]);
        return 1;
    }
    return 0;
}
