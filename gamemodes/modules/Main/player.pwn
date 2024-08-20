CMD:my(playerid, params[])
{
    new targetcmd[12];
    if (sscanf(params, "s[12]", targetcmd)) return SendUsageMessage(playerid, "/my (inv , veh)");
    if (!strcmp(targetcmd, "inv"))
    {
        if (!GetPVarInt(playerid, #IsOpenInv)) return ShowPlayerInv(playerid, 0, 0);
        else return HidePlayerInv(playerid);
    }
    else if (!strcmp(targetcmd, "veh"))
    {
        ShowPlayerVehStorage(playerid);
    }
}