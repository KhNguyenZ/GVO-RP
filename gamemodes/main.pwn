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
#include <actor_plus>
#include <strlib>
#include <sampvoice>
#include <Pawn.RakNet>
#undef MAX_PLAYERS
#define MAX_PLAYERS 500
#pragma disablerecursion
#pragma warning disable 213, 208, 219, 239, 240, 200

#define  			MYSQL_HOST				"localhost"
#define  			MYSQL_USER				"root"
#define  			MYSQL_PASS				"12346789" //123123
#define  			MYSQL_DB				"gvo" //ssa


new SERVER_TEST = 1; // 1: Server test ( bỏ qua login và nhiều anti khác) | 0: Mở server bình thường 
new SERVER_API[20]    = "ssa-rp.xyz/api/",
	SERVER_COMPONET[30]   = "ssa-rp.xyz/server/component/",
	SEVRER_CONTROLLER[30] = "ssa-rp.xyz/server/controller/";
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
#include "./modules/Server/Voice/main.pwn"
#include "./modules/Main/mysql.pwn"
#include "./modules/Main/_var.pwn"
#include "./modules/Main/_defines.pwn"
#include "./modules/Main/_functions.pwn"
#include "./modules/Main/_callback.pwn"
#include "./modules/Main/_core.pwn"
#include "./modules/Main/_textdraw.pwn"
#include "./modules/Main/color.pwn"

#include "./modules/Server/Discord/main.pwn"
#include "./modules/Server/Discord/_func.pwn"
#include "./modules/Server/Discord/command.pwn"

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

#include "./modules/Server/Banking/build.pwn"

#include "./modules/Server/CheckClient/main.pwn"
#include "./modules/Server/ActiveMail/main.pwn"

#include "./modules/Server/Maps/build.pwn"

#include "./modules/Players/characters/Death/textdraw.pwn"
#include "./modules/Players/characters/Death/callback.pwn" 

public SSA_Mysql_Intit()
{
	LoadOrgs();
	LoadInventoryDrop();
	CreateInfo(); 

	return 1; 
}
public OnGameModeExit()
{
	for(new i; i < MAX_ORG; i++) SaveOrg(i);
	mysql_close(Handle());
	return 1;
}


public OnQueryError(errorid, const error[], const callback[], const query[], MySQL:handle)
{
    printf("[MySQL: OnQueryError (%d, %s, %s)]: Query: %s.", errorid, error, callback, query);
    switch(errorid)
    {
        case CR_COMMAND_OUT_OF_SYNC: {
            printf("[MySQL: Error:: Callback; %s]: Commands Out Of Sync For (Query: %s).", callback, query);
        }
        case ER_UNKNOWN_TABLE: printf("[MySQL: Error:: Callback; %s]: Unknown table '%s' (Query: %s).", callback, error, query);
        case ER_SYNTAX_ERROR: printf("[MySQL: Error:: Callback; %s]: Something is wrong in your syntax (Query: %s).", callback, query);
        // case CR_SERVER_GONE_ERROR, CR_SERVER_LOST, CR_SERVER_LOST_EXTENDED: mysql_reconnect();
        //case 2003: Can't connect to MySQL server on 
    }
    return 1;
}