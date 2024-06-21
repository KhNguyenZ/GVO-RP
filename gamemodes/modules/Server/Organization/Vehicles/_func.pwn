
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



func:CreateOrgVehicle(playerid,_org_id, model, lock, paintjob , color1, color2, siren = 0)
{
    new Float:v_Pos[4];
    GetPlayerPos(playerid, v_Pos[0],v_Pos[1],v_Pos[2]);
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
    v_Pos[0],v_Pos[1],v_Pos[2], v_Pos[3],
    lock,
    paintjob,
    color1,
    color2,
    fuel_v,
    GetPlayerVirtualWorld(playerid),
    siren,
    GetPlayerInterior(playerid));
    printf("%s", v_save);
    if(mysql_tquery(Handle(), v_save, "")) {
        CreateVehicle(model, v_Pos[0],v_Pos[1],v_Pos[2], v_Pos[3],color1, color2, 500, siren);
        return 1;
    }
    return 0;
}
