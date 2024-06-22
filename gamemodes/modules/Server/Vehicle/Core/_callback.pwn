#include <YSI_Coding\y_hooks>

hook Mysql_PlayerInit(playerid){
    for(new i = 0; i < MAX_PLAYER_VEHICLES; i++)
    {
        PlayerVehicle[playerid][i][pv_id] = -1;
    }
    LoadPlayerVehicle(playerid);
    return 1;
}
hook OnPlayerConnect(playerid)
{
    OnPlayerCreateSpeedo(playerid);
    return 1;
}
hook OnPlayerDisconnect(playerid, reason)
{
    for(new i = 0; i < MAX_PLAYER_VEHICLES; i++)
    {
        if(PlayerVehicle[playerid][i][pv_id] != -1) SavePlayerVehicle(playerid, PlayerVehicle[playerid][i][pv_id]);
    }
    return 1;
}
forward OnLoadPlayerVehicle(playerid);
public OnLoadPlayerVehicle(playerid)
{
    new v_count;
    cache_get_row_count(v_count);
    PlayerVehicleCount[playerid] = v_count;
    printf("Loaded %d vehicle for %s", v_count, player_get_name(playerid, false));
    for(new i; i < v_count; i++)
    {
        cache_get_value_name_int(i, "id", PlayerVehicle[playerid][i][pv_id]);
        cache_get_value_name_int(i, "sqlid", PlayerVehicle[playerid][i][pv_sqlid]);
        cache_get_value_name_int(i, "model", PlayerVehicle[playerid][i][pv_model]);
        cache_get_value_name_float(i, "pos_x", PlayerVehicle[playerid][i][pvPosX]);
        cache_get_value_name_float(i, "pos_y", PlayerVehicle[playerid][i][pvPosY]);
        cache_get_value_name_float(i, "pos_z", PlayerVehicle[playerid][i][pvPosZ]);
        cache_get_value_name_float(i, "pos_r", PlayerVehicle[playerid][i][pvPosR]);

        cache_get_value_name_int(i, "lock", PlayerVehicle[playerid][i][pv_lock]);
        cache_get_value_name_int(i, "paintjob", PlayerVehicle[playerid][i][pv_paintjob]);
        cache_get_value_name_int(i, "color1", PlayerVehicle[playerid][i][pv_color1]);
        cache_get_value_name_int(i, "color2", PlayerVehicle[playerid][i][pv_color2]);
        cache_get_value_name_int(i, "ticket", PlayerVehicle[playerid][i][pv_ticket]);
        cache_get_value_name_int(i, "restricted", PlayerVehicle[playerid][i][pv_restricted]);
        cache_get_value_name_int(i, "fuel", PlayerVehicle[playerid][i][pv_fuel]);
        cache_get_value_name_int(i, "impound", PlayerVehicle[playerid][i][pv_impound]);
        cache_get_value_name_int(i, "vw", PlayerVehicle[playerid][i][pv_vw]);
        cache_get_value_name_int(i, "int", PlayerVehicle[playerid][i][pv_int]);

        cache_get_value_name_float(i, "health", PlayerVehicle[playerid][i][pv_health]);
        cache_get_value_name_int(i, "odo", PlayerVehicle[playerid][i][pv_odo]);

    }
}


hook OnGameModeInit()
{
    for(new i ; i < MAX_VEHICLES; i++) iCreate[i] = -1;
}