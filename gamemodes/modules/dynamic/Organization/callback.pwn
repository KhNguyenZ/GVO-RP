#include <YSI_Coding\y_hooks>

hook OnPlayerDisconnect(playerid, reason)
{
  SavePlayer(playerid);
  return 1;
}
hook OnGameModeInit()
{
  
}
forward Organization_Load();
public Organization_Load
{
  
}