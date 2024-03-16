#include <YSI_Coding\y_hooks>

new PlayerText:p_BarTextDraw[MAX_PLAYERS][1];
new PlayerText:p_LocationTextdraw[MAX_PLAYERS][19];
new PlayerText:p_DirectionTextDraw[MAX_PLAYERS][19];

new bool:p_Direction[MAX_PLAYERS];
new p_TextDirection[8][MAX_PLAYERS];

#define COLOR_BLUE		0x2641FEFF
#define COL_BLUE		"{2641FE}"

#define COLOR_GREEN     0x00FF00FF
#define COL_GREEN       "{00FF00}"

#define COLOR_RED       0xFF0000FF
#define COL_RED         "{FF0000}"

enum e_ZONE_INFO {
	e_ZONE_NAME_1[64],
	e_ZONE_NAME_2[64],
	Float:e_ZONE_MIN_X,
	Float:e_ZONE_MIN_Y,
	Float:e_ZONE_MAX_X,
	Float:e_ZONE_MAX_Y,
	e_ZONE_COLOR,
	e_ZONE_GANGZONE,
	e_ZONE_RECTANGLE
};

new Float:eZones[][e_ZONE_INFO] = {
{ "Ganton_Blue_Projects", "Ganton,_Los_Santos_County", 2223.0, -1825.0, 2408.0, -1739.0, 0x0000FFFF },
{ "East_Beach_Stadium", "East_Beach,_Los_Santos_County", 2622.0, -1900.0, 2814.0, -1651.0, 0x00FF7FFF },
{ "Alhambra_Club", "Commerce,_Los_Santos_County", 1813.0, -1757.0, 1949.0, -1605.0, 0x00FF7FFF },
{ "Idlewood_415", "Idlewood,_Los_Santos_County", 1949.0, -1758.0, 2095.0, -1605.0, 0xFF0000FF },
{ "Pizza_Stacks", "Idlewood,_Los_Santos_County", 2095.0, -1830.0, 2136.0, -1745.0, 0xFF7F00FF },
{ "Idlewood_Motel", "Idlewood,_Los_Santos_County", 2136.0, -1830.0, 2193.0, -1745.0, 0xFF0000FF },
{ "Crystal_Gardens", "Idlewood,_Los_Santos_County", 2095.0, -1745.0, 2179.0, -1637.0, 0xFF0000FF },
{ "Idlewood_Gas", "Idlewood,_Los_Santos_County", 1902.0, -1792.0, 1953.0, -1757.0, 0x00FFFFFF },
{ "Eastern_Idlewood_Sewers", "Los_Santos,_Los_Santos_County", 2543.0, -2142.0, 2622.0, -1628.0, 0xFF7F00FF },
{ "Northern_Idlewood_Sewers", "East_Beach,_Los_Santos_County", 2545.0, -1595.0, 2636.0, -1572.0, 0xFF7F00FF },
{ "Northern_Idlewood_Sewers", "East_Beach,_Los_Santos_County", 2560.0, -1572.0, 2636.0, -1529.0, 0xFF7F00FF },
{ "Northern_Idlewood_Sewers", "East_Beach,_Los_Santos_County", 2581.0, -1529.0, 2636.0, -1458.0, 0xFF7F00FF },
{ "Playa_Del_Seville", "East_Beach,_Los_Santos_County", 2622.0, -2040.0, 2814.0, -1900.0, 0xFF0000FF },
{ "Outer_Playa_Del_Seville", "East_Beach,_Los_Santos_County", 2622.0, -2143.0, 2722.0, -2040.0, 0xFF0000FF },
{ "Outer_Playa_Del_Seville", "East_Beach,_Los_Santos_County", 2722.0, -2090.0, 2814.0, -2040.0, 0xFF0000FF },
{ "Outer_Playa_Del_Seville", "East_Beach,_Los_Santos_County", 2722.0, -2106.0, 2808.0, -2090.0, 0xFF0000FF },
{ "Outer_Playa_Del_Seville", "East_Beach,_Los_Santos_County", 2722.0, -2128.0, 2794.0, -2106.0, 0xFF0000FF },
{ "Unity_Station", "Idlewood,_Los_Santos_County", 1699.0, -1948.0, 1811.0, -1846.0, 0x00FFFFFF },
{ "Unity_Station", "Idlewood,_Los_Santos_County", 1684.0, -1947.0, 1699.0, -1868.0, 0x00FFFFFF },
{ "Altura_Street", "Commerce,_Los_Santos_County", 1699.0, -1847.0, 1811.0, -1804.0, 0x00FFFFFF },
{ "Glen_Park_Bridge", "Glen_Park,_Los_Santos_County", 1961.0, -1251.0, 1984.0, -1142.0, 0xFF0000FF },
{ "Glen_Park", "Glen_Park,_Los_Santos_County", 1984.0, -1251.0, 2056.0, -1142.0, 0xFF0000FF },
{ "Glen_Park", "Glen_Park,_Los_Santos_County", 1877.0, -1250.0, 1961.0, -1142.0, 0xFF0000FF },
{ "Northern_Glen_Park", "Glen_Park,_Los_Santos_County", 1878.0, -1142.0, 2056.0, -1122.0, 0xFF0000FF },
{ "Southern_Glen_Park", "Glen_Park,_Los_Santos_County", 1878.0, -1271.0, 2056.0, -1251.0, 0xFF0000FF },
{ "El_Corona_Dead_End", "El_Corona,_Los_Santos_County", 1657.0, -2105.0, 1814.0, -2066.0, 0xFF0000FF },
{ "Western_Glen_Park", "Glen_Park,_Los_Santos_County", 1839.0, -1271.0, 1877.0, -1122.0, 0xFF0000FF },
{ "Eastern_Glen_Park", "Glen_Park,_Los_Santos_County", 2056.0, -1271.0, 2084.0, -1096.0, 0xFF0000FF },
{ "LSIX_Pond", "Los_Santos_International,_Los_Santos_County", 1192.0, -2419.0, 1289.0, -2343.0, 0x0000FFFF },
{ "LSIX_Runway_69L", "Los_Santos_International,_Los_Santos_County", 810.0, -2518.0, 2134.0, -2466.0, 0xFFFF00FF },
{ "LSIX_Runway_Swapover", "Los_Santos_International,_Los_Santos_County", 2081.0, -2566.0, 2134.0, -2518.0, 0xFF0000FF },
{ "LSIX_Runway_69R", "Los_Santos_International,_Los_Santos_County", 810.0, -2624.0, 2134.0, -2566.0, 0xFFFF00FF },
{ "LSIX_Runway_Offramp", "Los_Santos_International,_Los_Santos_County", 1396.0, -2566.0, 2082.0, -2518.0, 0xFF0000FF },
{ "LSIX_Hanger_Row", "Los_Santos_International,_Los_Santos_County", 1422.0, -2653.0, 2082.0, -2624.0, 0xFF00FFFF },
{ "Grove_Circle", "Ganton,_Los_Santos_County", 2443.0, -1722.0, 2543.0, -1628.0, 0xFF0000FF },
{ "Ganton_Boulevard", "Ganton,_Los_Santos_County", 2223.0, -1739.0, 2542.0, -1723.0, 0xFF0000FF },
{ "Grove_Street", "Ganton,_Los_Santos_County", 2336.0, -1723.0, 2443.0, -1649.0, 0xFF0000FF },
{ "Ganton_Gym", "Ganton,_Los_Santos_County", 2212.0, -1723.0, 2300.0, -1663.0, 0xFF0000FF },
{ "Grove_Street", "Ganton,_Los_Santos_County", 2212.0, -1663.0, 2335.0, -1649.0, 0xFF0000FF },
{ "Ten_Green_Bottles_Bar", "Ganton,_Los_Santos_County", 2296.0, -1649.0, 2336.0, -1630.0, 0xFF0000FF },
{ "Grove_Street", "Ganton,_Los_Santos_County", 2226.0, -1649.0, 2296.0, -1621.0, 0xFF0000FF },
{ "Grove_Housing", "Ganton,_Los_Santos_County", 2300.0, -1723.0, 2336.0, -1663.0, 0xFF0000FF },
{ "Willowfield_Dead_End", "Willowfield,_Los_Santos_County", 2427.0, -2039.0, 2543.0, -1978.0, 0xFF0000FF },
{ "LSIX_Terminal", "Los_Santos_International,_Los_Santos_County", 1565.0, -2335.0, 1823.0, -2239.0, 0xFFFF00FF },
{ "El_Corona_Flats", "El_Corona,_Los_Santos_County", 1806.0, -2045.0, 1956.0, -1963.0, 0xFF0000FF },
{ "El_Corona_Housing", "El_Corona,_Los_Santos_County", 1831.0, -2158.0, 1921.0, -2061.0, 0xFF0000FF },
{ "El_Corona_Sex_Shop", "El_Corona,_Los_Santos_County", 1921.0, -2158.0, 1954.0, -2061.0, 0xFF0000FF },
{ "Lucas_Avenue", "Commerce,_Los_Santos_County", 1683.0, -1868.0, 1699.0, -1597.0, 0xFF0000FF },
{ "El_Corona_Dead_End", "El_Corona,_Los_Santos_County", 1657.0, -2156.0, 1814.0, -2117.0, 0xFF0000FF },
{ "18th_Street", "El_Corona,_Los_Santos_County", 1657.0, -2117.0, 1814.0, -2105.0, 0xFF00FFFF },
{ "Palmwood_Avenue", "Idlewood,_Los_Santos_County", 2179.0, -1745.0, 2197.0, -1651.0, 0xFF0000FF },
{ "Palmwood_Avenue_/_~w~Idlewood_Tracks", "Ganton,_Los_Santos_County", 2197.0, -1745.0, 2212.0, -1651.0, 0xFF0000FF },
{ "Idlewood_Tracks", "Idlewood,_Los_Santos_County", 2193.0, -1906.0, 2211.0, -1745.0, 0xFF0000FF },
{ "Willowfield_Avenue", "Ganton,_Los_Santos_County", 2211.0, -1825.0, 2223.0, -1745.0, 0xFF0000FF },
{ "Willowfield_Avenue_/_~w~Ganton Boulevard", "Idlewood,_Los_Santos_County", 2211.0, -1745.0, 2223.0, -1723.0, 0xFF0000FF },
{ "Gilmore_Avenue", "Idlewood,_Los_Santos_County", 2074.0, -1842.0, 2095.0, -1758.0, 0xFF0000FF },
{ "Gilmore_Avenue", "Idlewood,_Los_Santos_County", 2074.0, -1936.0, 2090.0, -1865.0, 0xFF0000FF },
{ "Dona_Avenue", "Idlewood,_Los_Santos_County", 1967.0, -1819.0, 2074.0, -1803.0, 0xFF0000FF }
};

hook OnGameModeInit() {
	for(new i = 0; i < sizeof eZones; i++) {
		eZones[i][e_ZONE_GANGZONE] = GangZoneCreate(eZones[i][e_ZONE_MIN_X], eZones[i][e_ZONE_MIN_Y], 
			eZones[i][e_ZONE_MAX_X], eZones[i][e_ZONE_MAX_Y]);

		eZones[i][e_ZONE_RECTANGLE] = CreateDynamicRectangle(eZones[i][e_ZONE_MIN_X], eZones[i][e_ZONE_MIN_Y], 
			eZones[i][e_ZONE_MAX_X], eZones[i][e_ZONE_MAX_Y]);

        Streamer_SetIntData(STREAMER_TYPE_AREA, eZones[i][e_ZONE_RECTANGLE], E_STREAMER_EXTRA_ID, i);
	}

	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++) {
		if (IsPlayerConnected(i)) {
			CreateTextDraws(i);
		}
	}

	return 1;
}

hook OnGameModeExit() {
	for(new i = 0; i < sizeof eZones; i++) {
		GangZoneDestroy(eZones[i][e_ZONE_GANGZONE]);
	}

	return 1;
}

forward CreateTextDraws(playerid);
public CreateTextDraws(playerid) {
	p_BarTextDraw[playerid][0] = CreatePlayerTextDraw(playerid, 447.000, 300.000, "mdl-2009:main");
	PlayerTextDrawTextSize(playerid, p_DirectionTextDraw[playerid][0], 174.000, 34.000);
	PlayerTextDrawAlignment(playerid, p_DirectionTextDraw[playerid][0], 1);
	PlayerTextDrawColor(playerid, p_DirectionTextDraw[playerid][0], -1);
	PlayerTextDrawSetShadow(playerid, p_DirectionTextDraw[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, p_DirectionTextDraw[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, p_DirectionTextDraw[playerid][0], 255);
	PlayerTextDrawFont(playerid, p_DirectionTextDraw[playerid][0], 4);
	PlayerTextDrawSetProportional(playerid, p_DirectionTextDraw[playerid][0], 1);

	p_DirectionTextDraw[playerid][1] = CreatePlayerTextDraw(playerid, 597.000, 307.000, "mdl-2009:S");
	PlayerTextDrawTextSize(playerid, p_DirectionTextDraw[playerid][1], 14.000, 19.000);
	PlayerTextDrawAlignment(playerid, p_DirectionTextDraw[playerid][1], 1);
	PlayerTextDrawColor(playerid, p_DirectionTextDraw[playerid][1], -1);
	PlayerTextDrawSetShadow(playerid, p_DirectionTextDraw[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, p_DirectionTextDraw[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, p_DirectionTextDraw[playerid][1], 255);
	PlayerTextDrawFont(playerid, p_DirectionTextDraw[playerid][1], 4);
	PlayerTextDrawSetProportional(playerid, p_DirectionTextDraw[playerid][1], 1);

	p_DirectionTextDraw[playerid][2] = CreatePlayerTextDraw(playerid, 597.000, 307.000, "mdl-2009:W");
	PlayerTextDrawTextSize(playerid, p_DirectionTextDraw[playerid][2], 14.000, 19.000);
	PlayerTextDrawAlignment(playerid, p_DirectionTextDraw[playerid][2], 1);
	PlayerTextDrawColor(playerid, p_DirectionTextDraw[playerid][2], -1);
	PlayerTextDrawSetShadow(playerid, p_DirectionTextDraw[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, p_DirectionTextDraw[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, p_DirectionTextDraw[playerid][2], 255);
	PlayerTextDrawFont(playerid, p_DirectionTextDraw[playerid][2], 4);
	PlayerTextDrawSetProportional(playerid, p_DirectionTextDraw[playerid][2], 1);

	p_DirectionTextDraw[playerid][3] = CreatePlayerTextDraw(playerid, 597.000, 307.000, "mdl-2009:N");
	PlayerTextDrawTextSize(playerid, p_DirectionTextDraw[playerid][3], 14.000, 19.000);
	PlayerTextDrawAlignment(playerid, p_DirectionTextDraw[playerid][3], 1);
	PlayerTextDrawColor(playerid, p_DirectionTextDraw[playerid][3], -1);
	PlayerTextDrawSetShadow(playerid, p_DirectionTextDraw[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, p_DirectionTextDraw[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, p_DirectionTextDraw[playerid][3], 255);
	PlayerTextDrawFont(playerid, p_DirectionTextDraw[playerid][3], 4);
	PlayerTextDrawSetProportional(playerid, p_DirectionTextDraw[playerid][3], 1);

	p_DirectionTextDraw[playerid][4] = CreatePlayerTextDraw(playerid, 597.000, 307.000, "mdl-2009:E");
	PlayerTextDrawTextSize(playerid, p_DirectionTextDraw[playerid][4], 14.000, 19.000);
	PlayerTextDrawAlignment(playerid, p_DirectionTextDraw[playerid][4], 1);
	PlayerTextDrawColor(playerid, p_DirectionTextDraw[playerid][4], -1);
	PlayerTextDrawSetShadow(playerid, p_DirectionTextDraw[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, p_DirectionTextDraw[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, p_DirectionTextDraw[playerid][4], 255);
	PlayerTextDrawFont(playerid, p_DirectionTextDraw[playerid][4], 4);
	PlayerTextDrawSetProportional(playerid, p_DirectionTextDraw[playerid][4], 1);

	p_DirectionTextDraw[playerid][5] = CreatePlayerTextDraw(playerid, 593.000, 308.000, "mdl-2009:SW");
	PlayerTextDrawTextSize(playerid, p_DirectionTextDraw[playerid][5], 23.000, 18.000);
	PlayerTextDrawAlignment(playerid, p_DirectionTextDraw[playerid][5], 1);
	PlayerTextDrawColor(playerid, p_DirectionTextDraw[playerid][5], -1);
	PlayerTextDrawSetShadow(playerid, p_DirectionTextDraw[playerid][5], 0);
	PlayerTextDrawSetOutline(playerid, p_DirectionTextDraw[playerid][5], 0);
	PlayerTextDrawBackgroundColor(playerid, p_DirectionTextDraw[playerid][5], 255);
	PlayerTextDrawFont(playerid, p_DirectionTextDraw[playerid][5], 4);
	PlayerTextDrawSetProportional(playerid, p_DirectionTextDraw[playerid][5], 1);

	p_DirectionTextDraw[playerid][6] = CreatePlayerTextDraw(playerid, 593.000, 308.000, "mdl-2009:NE");
	PlayerTextDrawTextSize(playerid, p_DirectionTextDraw[playerid][6], 23.000, 18.000);
	PlayerTextDrawAlignment(playerid, p_DirectionTextDraw[playerid][6], 1);
	PlayerTextDrawColor(playerid, p_DirectionTextDraw[playerid][6], -1);
	PlayerTextDrawSetShadow(playerid, p_DirectionTextDraw[playerid][6], 0);
	PlayerTextDrawSetOutline(playerid, p_DirectionTextDraw[playerid][6], 0);
	PlayerTextDrawBackgroundColor(playerid, p_DirectionTextDraw[playerid][6], 255);
	PlayerTextDrawFont(playerid, p_DirectionTextDraw[playerid][6], 4);
	PlayerTextDrawSetProportional(playerid, p_DirectionTextDraw[playerid][6], 1);

	p_DirectionTextDraw[playerid][7] = CreatePlayerTextDraw(playerid, 593.000, 308.000, "mdl-2009:SE");
	PlayerTextDrawTextSize(playerid, p_DirectionTextDraw[playerid][7], 23.000, 18.000);
	PlayerTextDrawAlignment(playerid, p_DirectionTextDraw[playerid][7], 1);
	PlayerTextDrawColor(playerid, p_DirectionTextDraw[playerid][7], -1);
	PlayerTextDrawSetShadow(playerid, p_DirectionTextDraw[playerid][7], 0);
	PlayerTextDrawSetOutline(playerid, p_DirectionTextDraw[playerid][7], 0);
	PlayerTextDrawBackgroundColor(playerid, p_DirectionTextDraw[playerid][7], 255);
	PlayerTextDrawFont(playerid, p_DirectionTextDraw[playerid][7], 4);
	PlayerTextDrawSetProportional(playerid, p_DirectionTextDraw[playerid][7], 1);

	p_DirectionTextDraw[playerid][8] = CreatePlayerTextDraw(playerid, 593.000, 308.000, "mdl-2009:NW");
	PlayerTextDrawTextSize(playerid, p_DirectionTextDraw[playerid][8], 23.000, 18.000);
	PlayerTextDrawAlignment(playerid, p_DirectionTextDraw[playerid][8], 1);
	PlayerTextDrawColor(playerid, p_DirectionTextDraw[playerid][8], -1);
	PlayerTextDrawSetShadow(playerid, p_DirectionTextDraw[playerid][8], 0);
	PlayerTextDrawSetOutline(playerid, p_DirectionTextDraw[playerid][8], 0);
	PlayerTextDrawBackgroundColor(playerid, p_DirectionTextDraw[playerid][8], 255);
	PlayerTextDrawFont(playerid, p_DirectionTextDraw[playerid][8], 4);
	PlayerTextDrawSetProportional(playerid, p_DirectionTextDraw[playerid][8], 1);

	p_DirectionTextDraw[playerid][9] = CreatePlayerTextDraw(playerid, 593.000, 310.000, "mdl-2009:NNE");
	PlayerTextDrawTextSize(playerid, p_DirectionTextDraw[playerid][9], 23.000, 12.000);
	PlayerTextDrawAlignment(playerid, p_DirectionTextDraw[playerid][9], 1);
	PlayerTextDrawColor(playerid, p_DirectionTextDraw[playerid][9], -1);
	PlayerTextDrawSetShadow(playerid, p_DirectionTextDraw[playerid][9], 0);
	PlayerTextDrawSetOutline(playerid, p_DirectionTextDraw[playerid][9], 0);
	PlayerTextDrawBackgroundColor(playerid, p_DirectionTextDraw[playerid][9], 255);
	PlayerTextDrawFont(playerid, p_DirectionTextDraw[playerid][9], 4);
	PlayerTextDrawSetProportional(playerid, p_DirectionTextDraw[playerid][9], 1);

	p_DirectionTextDraw[playerid][10] = CreatePlayerTextDraw(playerid, 593.000, 310.000, "mdl-2009:ENE");
	PlayerTextDrawTextSize(playerid, p_DirectionTextDraw[playerid][10], 23.000, 12.000);
	PlayerTextDrawAlignment(playerid, p_DirectionTextDraw[playerid][10], 1);
	PlayerTextDrawColor(playerid, p_DirectionTextDraw[playerid][10], -1);
	PlayerTextDrawSetShadow(playerid, p_DirectionTextDraw[playerid][10], 0);
	PlayerTextDrawSetOutline(playerid, p_DirectionTextDraw[playerid][10], 0);
	PlayerTextDrawBackgroundColor(playerid, p_DirectionTextDraw[playerid][10], 255);
	PlayerTextDrawFont(playerid, p_DirectionTextDraw[playerid][10], 4);
	PlayerTextDrawSetProportional(playerid, p_DirectionTextDraw[playerid][10], 1);

	p_DirectionTextDraw[playerid][11] = CreatePlayerTextDraw(playerid, 593.000, 310.000, "mdl-2009:ESE");
	PlayerTextDrawTextSize(playerid, p_DirectionTextDraw[playerid][11], 23.000, 12.000);
	PlayerTextDrawAlignment(playerid, p_DirectionTextDraw[playerid][11], 1);
	PlayerTextDrawColor(playerid, p_DirectionTextDraw[playerid][11], -1);
	PlayerTextDrawSetShadow(playerid, p_DirectionTextDraw[playerid][11], 0);
	PlayerTextDrawSetOutline(playerid, p_DirectionTextDraw[playerid][11], 0);
	PlayerTextDrawBackgroundColor(playerid, p_DirectionTextDraw[playerid][11], 255);
	PlayerTextDrawFont(playerid, p_DirectionTextDraw[playerid][11], 4);
	PlayerTextDrawSetProportional(playerid, p_DirectionTextDraw[playerid][11], 1);

	p_DirectionTextDraw[playerid][12] = CreatePlayerTextDraw(playerid, 593.000, 310.000, "mdl-2009:SSE");
	PlayerTextDrawTextSize(playerid, p_DirectionTextDraw[playerid][12], 23.000, 12.000);
	PlayerTextDrawAlignment(playerid, p_DirectionTextDraw[playerid][12], 1);
	PlayerTextDrawColor(playerid, p_DirectionTextDraw[playerid][12], -1);
	PlayerTextDrawSetShadow(playerid, p_DirectionTextDraw[playerid][12], 0);
	PlayerTextDrawSetOutline(playerid, p_DirectionTextDraw[playerid][12], 0);
	PlayerTextDrawBackgroundColor(playerid, p_DirectionTextDraw[playerid][12], 255);
	PlayerTextDrawFont(playerid, p_DirectionTextDraw[playerid][12], 4);
	PlayerTextDrawSetProportional(playerid, p_DirectionTextDraw[playerid][12], 1);

	p_DirectionTextDraw[playerid][13] = CreatePlayerTextDraw(playerid, 593.000, 310.000, "mdl-2009:SSW");
	PlayerTextDrawTextSize(playerid, p_DirectionTextDraw[playerid][13], 23.000, 12.000);
	PlayerTextDrawAlignment(playerid, p_DirectionTextDraw[playerid][13], 1);
	PlayerTextDrawColor(playerid, p_DirectionTextDraw[playerid][13], -1);
	PlayerTextDrawSetShadow(playerid, p_DirectionTextDraw[playerid][13], 0);
	PlayerTextDrawSetOutline(playerid, p_DirectionTextDraw[playerid][13], 0);
	PlayerTextDrawBackgroundColor(playerid, p_DirectionTextDraw[playerid][13], 255);
	PlayerTextDrawFont(playerid, p_DirectionTextDraw[playerid][13], 4);
	PlayerTextDrawSetProportional(playerid, p_DirectionTextDraw[playerid][13], 1);

	p_DirectionTextDraw[playerid][14] = CreatePlayerTextDraw(playerid, 593.000, 310.000, "mdl-2009:WSW");
	PlayerTextDrawTextSize(playerid, p_DirectionTextDraw[playerid][14], 23.000, 12.000);
	PlayerTextDrawAlignment(playerid, p_DirectionTextDraw[playerid][14], 1);
	PlayerTextDrawColor(playerid, p_DirectionTextDraw[playerid][14], -1);
	PlayerTextDrawSetShadow(playerid, p_DirectionTextDraw[playerid][14], 0);
	PlayerTextDrawSetOutline(playerid, p_DirectionTextDraw[playerid][14], 0);
	PlayerTextDrawBackgroundColor(playerid, p_DirectionTextDraw[playerid][14], 255);
	PlayerTextDrawFont(playerid, p_DirectionTextDraw[playerid][14], 4);
	PlayerTextDrawSetProportional(playerid, p_DirectionTextDraw[playerid][14], 1);

	p_DirectionTextDraw[playerid][15] = CreatePlayerTextDraw(playerid, 593.000, 310.000, "mdl-2009:WNW");
	PlayerTextDrawTextSize(playerid, p_DirectionTextDraw[playerid][15], 23.000, 12.000);
	PlayerTextDrawAlignment(playerid, p_DirectionTextDraw[playerid][15], 1);
	PlayerTextDrawColor(playerid, p_DirectionTextDraw[playerid][15], -1);
	PlayerTextDrawSetShadow(playerid, p_DirectionTextDraw[playerid][15], 0);
	PlayerTextDrawSetOutline(playerid, p_DirectionTextDraw[playerid][15], 0);
	PlayerTextDrawBackgroundColor(playerid, p_DirectionTextDraw[playerid][15], 255);
	PlayerTextDrawFont(playerid, p_DirectionTextDraw[playerid][15], 4);
	PlayerTextDrawSetProportional(playerid, p_DirectionTextDraw[playerid][15], 1);

	p_DirectionTextDraw[playerid][16] = CreatePlayerTextDraw(playerid, 593.000, 310.000, "mdl-2009:NNW");
	PlayerTextDrawTextSize(playerid, p_DirectionTextDraw[playerid][16], 23.000, 12.000);
	PlayerTextDrawAlignment(playerid, p_DirectionTextDraw[playerid][16], 1);
	PlayerTextDrawColor(playerid, p_DirectionTextDraw[playerid][16], -1);
	PlayerTextDrawSetShadow(playerid, p_DirectionTextDraw[playerid][16], 0);
	PlayerTextDrawSetOutline(playerid, p_DirectionTextDraw[playerid][16], 0);
	PlayerTextDrawBackgroundColor(playerid, p_DirectionTextDraw[playerid][16], 255);
	PlayerTextDrawFont(playerid, p_DirectionTextDraw[playerid][16], 4);
	PlayerTextDrawSetProportional(playerid, p_DirectionTextDraw[playerid][16], 1);

	p_LocationTextdraw[playerid][17] = CreatePlayerTextDraw(playerid, 585.000, 305.000, "Idlewood,_Los_Santos_County");
	PlayerTextDrawLetterSize(playerid, p_LocationTextdraw[playerid][17], 0.200, 1.199);
	PlayerTextDrawTextSize(playerid, p_LocationTextdraw[playerid][17], -40.000, 14.000);
	PlayerTextDrawAlignment(playerid, p_LocationTextdraw[playerid][17], 3);
	PlayerTextDrawColor(playerid, p_LocationTextdraw[playerid][17], -2686721);
	PlayerTextDrawSetShadow(playerid, p_LocationTextdraw[playerid][17], 0);
	PlayerTextDrawSetOutline(playerid, p_LocationTextdraw[playerid][17], 0);
	PlayerTextDrawBackgroundColor(playerid, p_LocationTextdraw[playerid][17], 150);
	PlayerTextDrawFont(playerid, p_LocationTextdraw[playerid][17], 1);
	PlayerTextDrawSetProportional(playerid, p_LocationTextdraw[playerid][17], 1);

	p_LocationTextdraw[playerid][18] = CreatePlayerTextDraw(playerid, 585.000, 316.000, "Northern_Idlewood_Sewers");
	PlayerTextDrawLetterSize(playerid, p_LocationTextdraw[playerid][18], 0.280, 1.299);
	PlayerTextDrawTextSize(playerid, p_LocationTextdraw[playerid][18], -40.000, 14.000);
	PlayerTextDrawAlignment(playerid, p_LocationTextdraw[playerid][18], 3);
	PlayerTextDrawColor(playerid, p_LocationTextdraw[playerid][18], -1);
	PlayerTextDrawSetShadow(playerid, p_LocationTextdraw[playerid][18], 0);
	PlayerTextDrawSetOutline(playerid, p_LocationTextdraw[playerid][18], 0);
	PlayerTextDrawBackgroundColor(playerid, p_LocationTextdraw[playerid][18], 150);
	PlayerTextDrawFont(playerid, p_LocationTextdraw[playerid][18], 1);
	PlayerTextDrawSetProportional(playerid, p_LocationTextdraw[playerid][18], 1);

/*	#if defined SHOW_GANGZONES
	for(new i = 0; i < sizeof eZones; i++) {
		GangZoneShowForPlayer(playerid, eZones[i][e_ZONE_GANGZONE], eZones[i][e_ZONE_COLOR]);
	}
	#endif
*/
	PlayerTextDrawShow(playerid, p_BarTextDraw[playerid][0]);

	PlayerTextDrawShow(playerid, p_LocationTextdraw[playerid][17]);
	PlayerTextDrawShow(playerid, p_LocationTextdraw[playerid][18]);

//	PlayerTextDrawShow(playerid, p_DirectionTextDraw[playerid][]);


	p_Direction[playerid] = true;

	return 1;
}

hook OnPlayerConnect(playerid) {
	CreateTextDraws(playerid);	
	return 1;
}

hook OnPlayerUpdate(playerid) {
	if(p_Direction[playerid] == false) 
		return 1;

	new Float:rz;
	new p_PreviousDirection[8];

	strcat((p_PreviousDirection[0] = EOS, p_PreviousDirection), p_TextDirection[playerid]);

	if(IsPlayerInAnyVehicle(playerid)) {
		GetVehicleZAngle(GetPlayerVehicleID(playerid), rz);
	}
	else {
		GetPlayerFacingAngle(playerid, rz);
	}

	/*if(angle >= 355.0 || angle <= 5.0) PlayerTextDrawSetString(playerid, p_DirectionTextDraw[playerid], "N");
	else if(angle >= 265.0 && angle <= 275.0) PlayerTextDrawSetString(playerid, p_DirectionTextDraw[playerid], "E");
	else if(angle >= 175.0 && angle <= 185.0) PlayerTextDrawSetString(playerid, p_DirectionTextDraw[playerid], "S");
	else if(angle >= 85.0 && angle <= 95.0) PlayerTextDrawSetString(playerid, p_DirectionTextDraw[playerid], "W");*/

	if(rz >= 348.75 || rz < 11.25) PlayerTextDrawShow(playerid, p_DirectionTextDraw[playerid][3]);
	else if(rz >= 326.25 && rz < 348.75) PlayerTextDrawShow(playerid, p_DirectionTextDraw[playerid][9]);
	else if(rz >= 303.75 && rz < 326.25) PlayerTextDrawShow(playerid, p_DirectionTextDraw[playerid][6]);
	else if(rz >= 281.25 && rz < 303.75) PlayerTextDrawShow(playerid, p_DirectionTextDraw[playerid][10]);
	else if(rz >= 258.75 && rz < 281.25) PlayerTextDrawShow(playerid, p_DirectionTextDraw[playerid][4]);
	else if(rz >= 236.25 && rz < 258.75) PlayerTextDrawShow(playerid, p_DirectionTextDraw[playerid][11]);
	else if(rz >= 213.75 && rz < 236.25) PlayerTextDrawShow(playerid, p_DirectionTextDraw[playerid][7]);
	else if(rz >= 191.25 && rz < 213.75) PlayerTextDrawShow(playerid, p_DirectionTextDraw[playerid][12]);
	else if(rz >= 168.75 && rz < 191.25) PlayerTextDrawShow(playerid, p_DirectionTextDraw[playerid][1]);
	else if(rz >= 146.25 && rz < 168.75) PlayerTextDrawShow(playerid, p_DirectionTextDraw[playerid][13]);
	else if(rz >= 123.25 && rz < 146.25) PlayerTextDrawShow(playerid, p_DirectionTextDraw[playerid][5]);
	else if(rz >= 101.25 && rz < 123.25) PlayerTextDrawShow(playerid, p_DirectionTextDraw[playerid][14]);
	else if(rz >= 78.75 && rz < 101.25) PlayerTextDrawShow(playerid, p_DirectionTextDraw[playerid][2]);
	else if(rz >= 56.25 && rz < 78.75) PlayerTextDrawShow(playerid, p_DirectionTextDraw[playerid][15]);
	else if(rz >= 33.75 && rz < 56.25) PlayerTextDrawShow(playerid, p_DirectionTextDraw[playerid][8]);
	else if(rz >= 11.5 && rz < 33.75) PlayerTextDrawShow(playerid, p_DirectionTextDraw[playerid][16]);
	// Credits to Pottus for the above.

	if(strcmp(p_PreviousDirection, p_TextDirection[playerid]))
		return 1;


	return 1;
}

hook OnPlayerEnterDynamicArea(playerid, areaid) {
    new i = Streamer_GetIntData(STREAMER_TYPE_AREA, areaid, E_STREAMER_EXTRA_ID);

    PlayerTextDrawSetString(playerid, p_LocationTextdraw[playerid][18], eZones[i][e_ZONE_NAME_1]);
    PlayerTextDrawSetString(playerid, p_LocationTextdraw[playerid][17], eZones[i][e_ZONE_NAME_2]);
    return 1;
}

hook OnPlayerLeaveDynamicArea(playerid, areaid) {
    if (!IsPlayerInAnyDynamicArea(playerid)) {
		PlayerTextDrawSetString(playerid, p_LocationTextdraw[playerid][18], "Unknown_Location");
		PlayerTextDrawSetString(playerid, p_LocationTextdraw[playerid][17], "Undefined,_San_Andreas");
    }
    return 1;
}

/*public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid) {
	for(new i=0; i< 20; i++)
    if(playertextid == p_DirectionTextDraw[playerid][i]) {
		ShowPlayerDialog(playerid, 0, DIALOG_STYLE_MSGBOX, "Player Location Display", "Player Location Display\nCreated by Infinity\n\
			With help from Gravityfalls!", "Okay", "");
	}
}*/
CMD:pld(playerid, params[]) {
	switch (p_Direction[playerid]) {
		case 0: {
			p_Direction[playerid] = true;
			SendClientMessage(playerid, COLOR_BLUE, "PLD:{FFFFFF} PLD is now turned "COL_GREEN"ON{FFFFFF}.");
		}
		case 1: {
			p_Direction[playerid] = false;
			SendClientMessage(playerid, COLOR_BLUE, "PLD:{FFFFFF} PLD is now turned "COL_RED"OFF{FFFFFF}.");
		}
	}
	return 1;
}