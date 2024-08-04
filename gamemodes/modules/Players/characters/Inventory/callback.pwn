#include <YSI\YSI_Coding\y_hooks>
hook OnGameModeInit()
{
    // LoadInventoryDrop();
    return 1;
}


hook OnPlayerDisconnect(playerid, reason)
{
    for (new i; i < 25; i++)
    {
        PlayerTextDrawSetString(playerid, PlayerInvUI[playerid][Inv_ItemTD][i], "");
        PlayerInvUI[playerid][Inv_ItemID][i] = 0;
    }
    return 1;
}