#include <YSI\YSI_Coding\y_hooks>

hook OnGameModeInit()
{
    return 1;
}

hook OnGameModeExit()
{
    return 1;
}

hook OnPlayerSpawn(playerid)
{
    LoadPlayerWeapons(playerid);
    return 1;
}
