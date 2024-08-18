
#pragma warning disable 213, 208, 219, 239, 240, 200, 203, 209, 214
#define YSI_NO_HEAP_MALLOC
#include <_open_mp>
#include <crashdetect>
#include <a_mysql>
#include <YSI\YSI_Coding\y_timers>
#include <YSI\YSI_Coding\y_hooks>
#include <streamer>
#include <ZCMD>
#include <sscanf2>
#include <YSI\YSI_Storage\y_ini>
#include <notify>
#include <DialogCenter>
#include <easyDialog>
#include <actor_plus>
#include <strlib>
#include <sampvoice>
#include <Pawn.RakNet>
#include <memory>
#include <VehiclePartPosition>
#include <PreviewModelDialog>
#include <profiler>
#include <zone>
#include <vehicle_plus>
#include <YSI\YSI_Data\y_iterate>
#undef MAX_PLAYERS
#define MAX_PLAYERS 500

#define  			MYSQL_HOST				"localhost"
#define  			MYSQL_USER				"root"
#define  			MYSQL_PASS				"123456" //123456
#define  			MYSQL_DB				"ssa" //ssa


new SERVER_TEST = 1; // 1: Server test ( bỏ qua login và nhiều anti khác) | 0: Mở server bình thường
new SERVER_API[20]    = "ssa-rp.xyz/api/",
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

    if (GetMaxPlayers() > MAX_PLAYERS)
    {
        print("> Error FIX MAXPLAYERS.");
        SendRconCommand("exit");
    }

    Profiler_Start();
}
#include "./modules/Server/Voice/main.pwn"
#include "./modules/Main/mysql.pwn"
#include "./modules/Main/_defines.pwn"
#include "./modules/Main/_var.pwn"
#include "./modules/Main/_functions.pwn"
#include "./modules/Main/_callback.pwn"
#include "./modules/Main/_textdraw.pwn"
#include "./modules/Main/color.pwn"

#include "./modules/Server/Discord/main.pwn"
#include "./modules/Server/Discord/_func.pwn"
#include "./modules/Server/Discord/command.pwn"

#include "./modules/Dev/build.pwn"

// login
#include "./modules/Players/characters/build.pwn"

#include "./modules/Players/characters/Hud/_textdraw.pwn"
// Text and time server
#include "./modules/Players/characters/Player/ServerTextAndTime/textdraw.pwn"
#include "./modules/Players/characters/Player/ServerTextAndTime/func.pwn"

#include "./modules/Players/characters/Inventory/build.pwn"

// core login
#include "./modules/Players/multi-account/account.pwn"
// core server
#include "./modules/Server/radio.pwn"
// dynamic
#include "./modules/Server/dynamic/build.pwn"

#include "./modules/Server/Vehicle/build.pwn"

#include "./modules/Server/Organization/build.pwn"

#include "./modules/Server/Banking/build.pwn"

// JOB
#include "./modules/Server/CongViec/build.pwn"
#include "./modules/Server/CongViec/Mechanic/build.pwn"

#include "./modules/Server/CheckClient/main.pwn"
#include "./modules/Server/ActiveMail/main.pwn"

#include "./modules/Server/Maps/build.pwn"

#include "./modules/Players/characters/Death/textdraw.pwn"
#include "./modules/Players/characters/Death/callback.pwn"

#include "./modules/Server/Dealership/build.pwn"


#include "./modules/Main/_core.pwn"
public OnGameModeInit()
{
    SetCrashDetectLongCallTime(1000000); // cái này crashdetect nó sẽ ưu tiên kiểm tra crash sẻver

    OnServerInit();
    AddSimpleModel(-1, 19379, -2001, "object.dff", "char.txd");
    AddSimpleModel(-1, 19379, -2002, "object.dff", "login.txd");
    AddSimpleModel(-1, 19379, -2004, "object.dff", "inv.txd");
    AddSimpleModel(-1, 19379, -2006, "object.dff", "247.txd");

    AddSimpleModel(-1, 19379, -2007, "object.dff", "Inventory.txd");
    AddSimpleModel(-1, 19379, -2008, "object.dff", "Hudz.txd");
    AddSimpleModel(-1, 19379, -2009, "object.dff", "Speedometter.txd");
    AddSimpleModel(-1, 19379, -2010, "object.dff", "Org.txd");
    AddSimpleModel(-1, 19379, -2011, "object.dff", "npctextbox.txd");
    AddSimpleModel(-1, 19379, -2012, "object.dff", "GuideBtn.txd");
    AddSimpleModel(-1, 19379, -2013, "object.dff", "Info.txd");
    AddSimpleModel(-1, 19379, -2014, "object.dff", "custom_hud.txd");
    AddSimpleModel(-1, 19379, -2018, "object.dff", "start.txd");
    AddSimpleModel(-1, 19379, -2019, "object.dff", "Death.txd");

    AddSimpleModel(-1, 19379, -2020, "object.dff", "Main_Banking.txd");
    AddSimpleModel(-1, 19379, -2021, "object.dff", "Tab_Banking.txd");
    AddSimpleModel(-1, 19379, -2022, "object.dff", "smartkey.txd");
    AddSimpleModel(-1, 19379, -2023, "object.dff", "puzzle.txd");
    AddSimpleModel(-1, 19379, -2024, "object.dff", "loading.txd");
    AddSimpleModel(-1, 19379, -2025, "object.dff", "electrician.txd");
    AddSimpleModel(-1, 19379, -2026, "object.dff", "porters.txd");


    AddSimpleModel(-1, 19379, -5000, "newbiespawn.dff", "newbiespawn.txd");
    AddSimpleModel(-1, 19379, -5001, "congvien.dff", "congvien.txd");
    AddSimpleModel(-1, 19379, -5002, "honuoc.dff", "honuoc.txd");
    return 1;
}
public SSA_Mysql_Intit()
{
    LoadOrgs();
    CreateInfo();

    LoadDealership();
    return 1;
}
public OnGameModeExit()
{
    for (new i; i < MAX_ORG; i++)
    {
        SaveOrg(i);
        SaveOrgVeh(i);
    }
    mysql_close(Handle());
    return 1;
}
public OnQueryError(errorid, const error[], const callback[], const query[], MySQL:handle)
{
    printf("[MySQL: OnQueryError (%d, %s, %s)]: Query: %s.", errorid, error, callback, query);
    switch (errorid)
    {
        case CR_COMMAND_OUT_OF_SYNC:
        {
            printf("[MySQL: Error:: Callback; %s]: Commands Out Of Sync For (Query: %s).", callback, query);
        }
        case ER_UNKNOWN_TABLE: printf("[MySQL: Error:: Callback; %s]: Unknown table '%s' (Query: %s).", callback, error, query);
        case ER_SYNTAX_ERROR: printf("[MySQL: Error:: Callback; %s]: Something is wrong in your syntax (Query: %s).", callback, query);
    }
    return 1;
}