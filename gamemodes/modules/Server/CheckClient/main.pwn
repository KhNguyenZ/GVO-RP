#include <YSI\YSI_Coding\y_hooks>

new CheckTimer[MAX_PLAYERS];
hook OnPlayerConnect(playerid)
{
    SetPVarInt(playerid, #Check_Client, 0);
    return 1;
}
hook OnPlayerSpawn(playerid){
    if(SERVER_TEST == 0 && GetPVarInt(playerid, #Check_Client) == 0)
    {
        new Float:CheckPos[MAX_PLAYERS][3];
        GetPlayerPos(playerid, CheckPos[playerid][0], CheckPos[playerid][1], CheckPos[playerid][2]);
        SetPlayerPos(playerid,CheckPos[playerid][0], CheckPos[playerid][1], CheckPos[playerid][2]+0.5);

        ShowPlayerDialog(playerid, 1239, DIALOG_STYLE_MSGBOX,"Kiem tra Client", "Qua trinh kiem tra client dang tien hanh !","OK", "");
        SetPVarInt(playerid, #ClientTimer, 2);
        CheckTimer[playerid] = SetTimerEx("OnTimerCheckClient", 500, 1,"i", playerid);
    }
    return 1;
}
forward OnTimerCheckClient(playerid);
public OnTimerCheckClient(playerid){
    TogglePlayerControllable(playerid, 0);
    if(GetPVarInt(playerid, #ClientTimer) > 0){
        new check_msg[1280];
        format(check_msg, 1280, "Trinh kiem tra client dang tien hanh , thoi gian con %ds",GetPVarInt(playerid, #ClientTimer));
        HienTextdraw(playerid, check_msg,1000);
        SetPVarInt(playerid, #ClientTimer, GetPVarInt(playerid, #ClientTimer)-1);
    }
    else if(GetPVarInt(playerid, #ClientTimer) == 0){
        CheckPlayerPrivateClient(playerid);
        KillTimer(CheckTimer[playerid]);
    }
}
func:CheckPlayerPrivateClient(playerid)
{
    new query[1280], Cache:clientCache;
    format(query, 1280, "SELECT * FROM `accounts` WHERE `CharName%d` = '%s'",GetPVarInt(playerid,"CharSelected_")-1, player_get_name(playerid, false));
    clientCache = mysql_query(Handle(),query);
    new CharName_Check[MAX_PLAYER_NAME];
    if(cache_num_rows() > 0)
    {
        cache_get_value_name(0, "Username", CharName_Check);
    }
    cache_delete(Cache:clientCache);
    new check_url[128];
    format(check_url, 128,"%snet.php?Check=%s", SERVER_API, CharName_Check);
    HTTP(playerid, HTTP_GET,check_url , "", "CheckPlayerClient");

    SetPVarInt(playerid, #Check_Client, 1);

    return 1;
}

forward CheckPlayerClient(index, response_code, data[]);
public CheckPlayerClient(index, response_code, data[]){

    if(response_code != 200) {
        SendErrorMessage(index, "Mat ket noi voi may chu 'API' , hay bao cho Quan tri vien nhanh nhe !");
        KickDelay(index, 2000);
        return 1;
    }

    if(strcmp(data, "1")){
        SendErrorMessage(index, "Client cua ban khong phai client do SSA phat hanh , hay su dung SSA-Launcher/SSA-Mobile nhe");
        ShowPlayerDialog(index, 1239, DIALOG_STYLE_MSGBOX,"Kiem tra Client", "Client cua ban khong phai client do SSA phat hanh\nHay su dung SSA-Launcher/SSA-Mobile nhe","OK", "");

        KickDelay(index, 2000);
    }
    else{
        TogglePlayerControllable(index, 1);
        SendServerMessage(index,"Ban dang su dung Client cua SSA");
    }
    return 1;
}