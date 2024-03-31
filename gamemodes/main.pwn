#include <a_samp>
#include <a_samp>
#include <crashdetect>
#include <a_mysql>
#include <YSI_Coding\y_timers>
#include <YSI_Coding\y_hooks>
#include <streamer>
#include <ZCMD>
#include <sscanf2>
#include <YSI\y_ini>
#include <notify>
#include <DialogCenter>
#include <Veh-Lib\tdw_vyengine> 
// #include <easyDialog>
#undef MAX_PLAYERS
#define MAX_PLAYERS 500
#pragma disablerecursion
#pragma warning disable 213, 208, 219, 239, 240, 200

#define  			MYSQL_HOST				"localhost"
#define  			MYSQL_USER				"root"
#define  			MYSQL_PASS				"123456"
#define  			MYSQL_DB				"ssa"

main()
{
	SetGameModeText("KhNguyen Dev");
	EnableStuntBonusForAll(0);
	DisableInteriorEnterExits();
	SetNameTagDrawDistance(25.0);
	ManualVehicleEngineAndLights();
	ShowPlayerMarkers(PLAYER_MARKERS_MODE_OFF);
	AddPlayerClass(265, 1958.3783, 1343.1572, 15.3746, 270.1425, 0, 0, 0, 0, -1, -1);
	
	if(GetMaxPlayers() > MAX_PLAYERS)
	{
		print("> Error FIX MAXPLAYERS.");
        SendRconCommand("exit");
	}
}
#include "./modules/mysql.pwn"
#include "./modules/_var.pwn"
#include "./modules/_defines.pwn"
#include "./modules/_functions.pwn"
#include "./modules/_callback.pwn"
#include "./modules/_core.pwn"
#include "./modules/_textdraw.pwn"
#include "./modules/color.pwn"

#include "./modules/server/ProgressLoad.pwn"

// login
#include "./modules/characters/build.pwn"

#include "./modules/characters/Hud/_textdraw.pwn"
// Text and time server
#include "./modules/characters/Player/ServerTextAndTime/textdraw.pwn"
#include "./modules/characters/Player/ServerTextAndTime/func.pwn"

// core login
#include "./modules/multi-account/account.pwn"
// core server
#include "./modules/server/radio.pwn"
// dynamic
#include "./modules/dynamic/build.pwn"

#include "./modules/Vehicle/build.pwn"

#include "./modules/Organization/_var.pwn"
#include "./modules/Organization/_function.pwn"
#include "./modules/Organization/_callback.pwn"
#include "./modules/Organization/_textdraw.pwn"

public SSA_Mysql_Intit()
{
	for(new i; i < 1000; i++) LoadOrg(i);
	LoadInventoryDrop();

	printf("Loaded %d Organization", OrgCount);
}
public OnGameModeExit()
{
	mysql_close(Handle());
	return 1;
}