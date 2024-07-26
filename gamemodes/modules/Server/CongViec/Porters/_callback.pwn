#include <YSI\YSI_Coding\y_hooks>
hook OnPlayerConnect(playerid)
{
    OnPlayerLoadPortersJobTD(playerid);
    return 1;
}
hook OnGameModeInit()
{    	
    Create3DTextLabel("[{33ff00}Porters Job{ffffff}]\nNhan {33ff00}Y{ffffff}\n de thao tac", COLOR_WHITE, 2194.3594,-2230.9106,13.5316, 15.0, 0);
    Create3DTextLabel("[{33ff00}Porters Job{ffffff}]\nNhan {33ff00}Y{ffffff}\n de thao tac", COLOR_WHITE, 2201.4773,-2223.7122,13.5469, 15.0, 0);
    Create3DTextLabel("[{33ff00}Porters Job{ffffff}]\nNhan {33ff00}Y{ffffff}\n de thao tac", COLOR_WHITE, 2209.0471,-2216.5164,13.5469, 15.0, 0);
    Create3DTextLabel("[{33ff00}Porters Job{ffffff}]\nNhan {33ff00}Y{ffffff}\n de thao tac", COLOR_WHITE, 2216.3455,-2210.0254,13.5469, 15.0, 0);
    return 1;
}
hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if(newkeys == KEY_YES)
    {
       if(IsPlayerInRangeOfPoint(playerid, 5.0, 2194.3594,-2230.9106,13.5316) || IsPlayerInRangeOfPoint(playerid, 5.0, 2201.4773,-2223.7122,13.5469) || IsPlayerInRangeOfPoint(playerid, 5.0, 2209.0471,-2216.5164,13.5469) || IsPlayerInRangeOfPoint(playerid, 5.0, 2216.3455,-2210.0254,13.5469))
        {
            ShowPortersTD(playerid);
        }    
    }
    return 1;
}
hook OnPlayerEnterCheckpoint(playerid)
{
    if(PlayerPortersCP[playerid] == true)
    {
        DisablePlayerCheckpoint(playerid);
        PlayerPortersCP[playerid] = false;
        SendClientMessage(playerid, -1, "Ban da be thung hang vao kho");
        ApplyAnimation(playerid, "CARRY", "PUTDWN", 4.0, 0, 0, 0, 0,0);
        RemovePlayerAttachedObject(playerid,9);
    }
}
func:OnPlayerClickPorters(playerid, PlayerText:playertextid)
{
    if(playertextid == PortersTD[playerid][1])
    {
        SendClientMessage(playerid, -1, "Ban da be thung hang xuong xe");
        HidePortersTD(playerid);
        ApplyAnimation(playerid, "CARRY", "LIFTUP", 4.0, 0, 0, 0, 0,0);
        SetTimerEx("Carry", 1000, false, "i", playerid);
        SetPlayerAttachedObject(playerid, 9, 2912, 1, 0.031999,0.589000,0.000000, 0.000000, 93.700012, 0.000000, 1, 1, 1, 0, 0);
    }
    return 1;
}
