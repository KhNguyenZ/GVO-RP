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
#include <easyDialog>
#include <Veh-Lib\tdw_vyengine> 
#include <sampp>
#include <actor_plus>
#include <discord-connector>
#include <strlib>
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
#include "./modules/Main/mysql.pwn"
#include "./modules/Main/_var.pwn"
#include "./modules/Main/_defines.pwn"
#include "./modules/Main/_functions.pwn"
#include "./modules/Main/_callback.pwn"
#include "./modules/Main/_core.pwn"
#include "./modules/Main/_textdraw.pwn"
#include "./modules/Main/color.pwn"

#include "./modules/Dev/build.pwn"

#include "./modules/Server/ProgressLoad.pwn"

// login
#include "./modules/Players/characters/build.pwn"

#include "./modules/Players/characters/Hud/_textdraw.pwn"
// Text and time server
#include "./modules/Players/characters/Player/ServerTextAndTime/textdraw.pwn"
#include "./modules/Players/characters/Player/ServerTextAndTime/func.pwn"

// core login
#include "./modules/Players/multi-account/account.pwn"
// core server
#include "./modules/Server/radio.pwn"
// dynamic
#include "./modules/Server/dynamic/build.pwn"

#include "./modules/Server/Vehicle/build.pwn"

#include "./modules/Server/Organization/build.pwn"

#include "./modules/Server/Discord/main.pwn"
#include "./modules/Server/Discord/_func.pwn"
#include "./modules/Server/Discord/command.pwn"

public SSA_Mysql_Intit()
{
	for(new i; i < 1000; i++) LoadOrg(i);
	LoadInventoryDrop();
	CreateInfo(); 
	printf("Loaded %d Organization", OrgCount);

	return 1; 
}
public OnGameModeExit()
{
	mysql_close(Handle());
	return 1;
}