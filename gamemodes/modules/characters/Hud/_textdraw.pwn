#include <YSI\y_hooks>
new PlayerText:PlayerTD[MAX_PLAYERS][3];
new PlayerText:HealthTextDraw_0[MAX_PLAYERS];
new PlayerText:HealthTextDraw_1[MAX_PLAYERS];
new PlayerText:ArmourTextDraw_1[MAX_PLAYERS];
new PlayerText:ArmourTextDraw_2[MAX_PLAYERS];
enum IconHud_Data{
	id_gun,
	txd_gun[128]
}
new const IconHud[][IconHud_Data] = {
	{ 30 ,"Hudz:ak47icon"},
	{ 5 ,"Hudz:baticon"},
	{ 1 ,"Hudz:BRASSKNUCKLEicon"},
	{ 43 ,"Hudz:Cameraicon"},
	{ 9 , "Hudz:chnsawicon"},
	{ 25 , "Hudz:chromegunicon"},
	{ 22 , "Hudz:colt45icon"},
	{ 33 , "Hudz:cuntgunicon"},
	{ 24 , "Hudz:desert_eagleicon"},
	{ 42 , "Hudz:fire_exicon"},
	{ 0 , "Hudz:fist"},
	{ 14 , "Hudz:floweraicon"},
	{ 2, "Hudz:golfclubicon"},
	{ 16, "Hudz:grenadeicon"},
	{ 15, "Hudz:gun_caneicon"},
	{ 46 , "Hudz:gun_paraIcon"},
	{ 36, "Hudz:heatseekicon"},
	{ 45, "Hudz:irgogglesicon"},
	{ 8, "Hudz:katanaicon"},
	{ 4, "Hudz:knifecuricon"},
	{ 31, "Hudz:M4icon"},
	{ 28, "Hudz:micro_uziicon"},
	{ 28, "Hudz:minigunicon"},
	{ 18, "Hudz:molotovicon"},
	{ 29, "Hudz:mp5lngicon"},
	{ 3 , "Hudz:nitestickicon"},
	{ 44 , "Hudz:nvgogglesicon"},
	{ 7 , "Hudz:poolcueicon"},
	{ 35, "Hudz:rocketlaicon"},
	{ 39 , "Hudz:satchelicon"},
	{ 26, "Hudz:sawnofficon"},
	{ 27, "Hudz:shotgspaicon"},
	{ 6, "Hudz:shovelicon"},
	{ 23, "Hudz:silencedicon"},
	{ 34, "Hudz:SNIPERicon"},
	{ 41, "Hudz:SPRAYCANicon"},
	{ 17, "Hudz:TearGasicon"},
	{ 32, "Hudz:tec9icon"}
};
hook OnPlayerConnect(playerid)
{
	PlayerTD[playerid][0] = CreatePlayerTextDraw(playerid, 455.000000, 43.000000, "Hudz:hud");
	PlayerTextDrawFont(playerid, PlayerTD[playerid][0], 4);
	PlayerTextDrawLetterSize(playerid, PlayerTD[playerid][0], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, PlayerTD[playerid][0], 166.000000, 46.500000);
	PlayerTextDrawSetOutline(playerid, PlayerTD[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, PlayerTD[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, PlayerTD[playerid][0], 1);
	PlayerTextDrawColor(playerid, PlayerTD[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, PlayerTD[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, PlayerTD[playerid][0], 50);
	PlayerTextDrawUseBox(playerid, PlayerTD[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, PlayerTD[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, PlayerTD[playerid][0], 0);

	PlayerTD[playerid][1] = CreatePlayerTextDraw(playerid, 571.000000, 52.000000, "Hudz:fist");
	PlayerTextDrawFont(playerid, PlayerTD[playerid][1], 4);
	PlayerTextDrawLetterSize(playerid, PlayerTD[playerid][1], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, PlayerTD[playerid][1], 25.000000, 26.000000);
	PlayerTextDrawSetOutline(playerid, PlayerTD[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, PlayerTD[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, PlayerTD[playerid][1], 1);
	PlayerTextDrawColor(playerid, PlayerTD[playerid][1], -1);
	PlayerTextDrawBackgroundColor(playerid, PlayerTD[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, PlayerTD[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, PlayerTD[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, PlayerTD[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, PlayerTD[playerid][1], 0);

	
	HealthTextDraw_0[playerid] = CreatePlayerTextDraw(playerid, 517.000000, 59.000000, "_");
	PlayerTextDrawFont(playerid, HealthTextDraw_0[playerid], 1);
	PlayerTextDrawLetterSize(playerid, HealthTextDraw_0[playerid], 0.600000, 0.349999);
	PlayerTextDrawTextSize(playerid, HealthTextDraw_0[playerid], 298.500000, 75.000000);
	PlayerTextDrawSetOutline(playerid, HealthTextDraw_0[playerid], 1);
	PlayerTextDrawSetShadow(playerid, HealthTextDraw_0[playerid], 0);
	PlayerTextDrawAlignment(playerid, HealthTextDraw_0[playerid], 2);
	PlayerTextDrawColor(playerid, HealthTextDraw_0[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, HealthTextDraw_0[playerid], 255);
	PlayerTextDrawBoxColor(playerid, HealthTextDraw_0[playerid], 135);
	PlayerTextDrawUseBox(playerid, HealthTextDraw_0[playerid], 1);
	PlayerTextDrawSetProportional(playerid, HealthTextDraw_0[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, HealthTextDraw_0[playerid], 0);

	HealthTextDraw_1[playerid] = CreatePlayerTextDraw(playerid, 479.500000, 59.000000, "_");
	PlayerTextDrawFont(playerid, HealthTextDraw_1[playerid], 1);
	PlayerTextDrawLetterSize(playerid, HealthTextDraw_1[playerid], 0.600000, 0.349999);
	PlayerTextDrawTextSize(playerid, HealthTextDraw_1[playerid], 477.000000, 75.000000);
	PlayerTextDrawSetOutline(playerid, HealthTextDraw_1[playerid], 1);
	PlayerTextDrawSetShadow(playerid, HealthTextDraw_1[playerid], 0);
	PlayerTextDrawAlignment(playerid, HealthTextDraw_1[playerid], 1);
	PlayerTextDrawColor(playerid, HealthTextDraw_1[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, HealthTextDraw_1[playerid], 255);
	PlayerTextDrawBoxColor(playerid, HealthTextDraw_1[playerid], -16777081);
	PlayerTextDrawUseBox(playerid, HealthTextDraw_1[playerid], 1);
	PlayerTextDrawSetProportional(playerid, HealthTextDraw_1[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, HealthTextDraw_1[playerid], 0);

	ArmourTextDraw_1[playerid] = CreatePlayerTextDraw(playerid, 517.000000, 69.000000, "_");
	PlayerTextDrawFont(playerid, ArmourTextDraw_1[playerid], 1);
	PlayerTextDrawLetterSize(playerid, ArmourTextDraw_1[playerid], 0.600000, 0.349999);
	PlayerTextDrawTextSize(playerid, ArmourTextDraw_1[playerid], 298.500000, 75.000000);
	PlayerTextDrawSetOutline(playerid, ArmourTextDraw_1[playerid], 1);
	PlayerTextDrawSetShadow(playerid, ArmourTextDraw_1[playerid], 0);
	PlayerTextDrawAlignment(playerid, ArmourTextDraw_1[playerid], 2);
	PlayerTextDrawColor(playerid, ArmourTextDraw_1[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, ArmourTextDraw_1[playerid], 255);
	PlayerTextDrawBoxColor(playerid, ArmourTextDraw_1[playerid], 135);
	PlayerTextDrawUseBox(playerid, ArmourTextDraw_1[playerid], 1);
	PlayerTextDrawSetProportional(playerid, ArmourTextDraw_1[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, ArmourTextDraw_1[playerid], 0);

	ArmourTextDraw_2[playerid] = CreatePlayerTextDraw(playerid, 479.500000, 69.000000, "_");
	PlayerTextDrawFont(playerid, ArmourTextDraw_2[playerid], 1);
	PlayerTextDrawLetterSize(playerid, ArmourTextDraw_2[playerid], 0.600000, 0.349999);
	PlayerTextDrawTextSize(playerid, ArmourTextDraw_2[playerid], 477.000000, 75.000000);
	PlayerTextDrawSetOutline(playerid, ArmourTextDraw_2[playerid], 1);
	PlayerTextDrawSetShadow(playerid, ArmourTextDraw_2[playerid], 0);
	PlayerTextDrawAlignment(playerid, ArmourTextDraw_2[playerid], 1);
	PlayerTextDrawColor(playerid, ArmourTextDraw_2[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, ArmourTextDraw_2[playerid], 255);
	PlayerTextDrawBoxColor(playerid, ArmourTextDraw_2[playerid], -121);
	PlayerTextDrawUseBox(playerid, ArmourTextDraw_2[playerid], 1);
	PlayerTextDrawSetProportional(playerid, ArmourTextDraw_2[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, ArmourTextDraw_2[playerid], 0);

	PlayerTD[playerid][2] = CreatePlayerTextDraw(playerid, 510.000000, 16.000000, "mdl-2001:logo");
	PlayerTextDrawFont(playerid, PlayerTD[playerid][2], 4);
	PlayerTextDrawLetterSize(playerid, PlayerTD[playerid][2], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, PlayerTD[playerid][2], 82.500000, 42.000000);
	PlayerTextDrawSetOutline(playerid, PlayerTD[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, PlayerTD[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, PlayerTD[playerid][2], 1);
	PlayerTextDrawColor(playerid, PlayerTD[playerid][2], -1);
	PlayerTextDrawBackgroundColor(playerid, PlayerTD[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, PlayerTD[playerid][2], 50);
	PlayerTextDrawUseBox(playerid, PlayerTD[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, PlayerTD[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, PlayerTD[playerid][2], 0);

	return 1;
}

hook OnPlayerSpawn(playerid)
{
	PlayerTextDrawShow(playerid, PlayerTD[playerid][0]);
	PlayerTextDrawShow(playerid, PlayerTD[playerid][1]);
	PlayerTextDrawShow(playerid, PlayerTD[playerid][2]);
	PlayerTextDrawShow(playerid, HealthTextDraw_0[playerid]);
	PlayerTextDrawShow(playerid, HealthTextDraw_1[playerid]);
	PlayerTextDrawShow(playerid, ArmourTextDraw_1[playerid]);
	PlayerTextDrawShow(playerid, ArmourTextDraw_2[playerid]);
}


func:SetPlayerIconHud(playerid)
{
	new pwpid = GetPlayerWeapon(playerid), id_txd;
	for(new i; i < sizeof(IconHud); i++)
	{
		if(pwpid == IconHud[i][id_gun])
		{
			id_txd = i;
			break;
		}
	}
	// printf("ID txd; %d | txd: %s", id_txd, IconHud[id_txd][txd_gun]);
	PlayerTextDrawSetString(playerid, PlayerTD[playerid][1], IconHud[id_txd][txd_gun]);
	PlayerTextDrawShow(playerid, PlayerTD[playerid][1]);
	return 1;
}

func:UpdatePlayerHealth(playerid)
{
	new Float:value_hud = 0.775;
	new Float:HudHealth, Float:HudArmour;
	GetPlayerHealth(playerid, HudHealth);
	GetPlayerArmour(playerid, HudArmour);
	PlayerTextDrawTextSize(playerid, HealthTextDraw_1[playerid], 477.000000+(value_hud*HudHealth), 75.000000);
	PlayerTextDrawTextSize(playerid, ArmourTextDraw_2[playerid], 477.000000+(value_hud*HudArmour), 75.000000);
	ReloadPlayerTextDraw(playerid, HealthTextDraw_1[playerid]);
	ReloadPlayerTextDraw(playerid, ArmourTextDraw_2[playerid]);
}


task UpdatePlayerHud[500]() 
{
	foreach(new playerid: Player){
		if(IsPlayerSpawned(playerid))
		{
			SetPlayerIconHud(playerid);
			UpdatePlayerHealth(playerid);
		}
	}
	return 1;
}