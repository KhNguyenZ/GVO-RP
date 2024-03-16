forward LoadOrg_data(playerid,name[],value[]);
public LoadOrg_data(playerid,name[],value[])
{
    INI_Int("Leader",Organization[playerid][oLeader]);
    INI_Int("Clan",Organization[playerid][oClan]);
    INI_Int("Rank",Organization[playerid][oRank]);
    INI_Int("Skin", Organization[playerid][oSkin]);
    return 1;
}
func:SavePlayer(playerid)
{
    new INI:File = INI_Open(PlayerPath(playerid));
    INI_SetTag(File, "data");
    INI_WriteInt(File, "Leader", Organization[playerid][oLeader]);
    INI_WriteInt(File, "Clan", Organization[playerid][oClan]);
    INI_WriteInt(File, "Rank", Organization[playerid][oRank]);
        INI_WriteInt(File, "Skin", Organization[playerid][oSkin]);
    INI_Close(File);
    return 1;
}
 
func:GetName(playerid)
{
    new
        pName[MAX_PLAYER_NAME];
 
    GetPlayerName(playerid, pName, MAX_PLAYER_NAME);
    return pName;
}
func:PlayerPath(playerid)
{
    new string[128], PlayerName[MAX_PLAYER_NAME];
    GetPlayerName(playerid, PlayerName, sizeof(PlayerName));
    format(string, sizeof(string), PLAYER_DATA, PlayerName);
    return string;
}