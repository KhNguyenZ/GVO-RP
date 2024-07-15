
#define SendUsageMessage(%0,%1) \
    SendClientMessage(%0, 0xFF6347AA, "{FF6347}USE:{FFFFFF}"%1)
    
#define SendErrorMessage(%0,%1) \
    SendClientMessage(%0, 0xFF6347AA, "{FF6347}ERROR:{FFFFFF}"%1)

#define SendServerMessage(%0,%1) \
    SendClientMessage(%0, 0xFF6347AA, "{FF6347}SERVER:{FFFFFF}"%1)

#define SendSelectMessage(%0,%1) \
    SendClientMessage(%0, 0xFF6347AA, "{FF6347}TUY CHON:{FFFFFF}"%1)

func:IsPlayerSpawned(playerid)
{ 
    switch(GetPlayerState(playerid))
    {
        case PLAYER_STATE_ONFOOT, PLAYER_STATE_DRIVER, PLAYER_STATE_PASSENGER, PLAYER_STATE_SPAWNED:
            return 1; 
    } 
    return 0; 
} 
func:player_Login(const playerid)
{
	if(IsPlayerConnected(playerid) && Character[playerid][char_Login])
	{
		return 1;
	}
	return 0;
}
func:KickDelay(playerid, time_kick)
{
	new Kick_msg[128];
	format(Kick_msg, 128, "Ban se bi kick sau %d giay", floatround(time_kick/1000));
	SendClientMessage(playerid,-1, Kick_msg);

	SetTimerEx("C_KickDelay", time_kick, 0,"i", playerid);
}
func:GetAccountName(playerid)
{
	new query[1280], Cache:clientCache;
	format(query, 1280, "SELECT * FROM `accounts` WHERE `CharName%d` = '%s'",GetPVarInt(playerid,"CharSelected_")-1, player_get_name(playerid, false));
	clientCache = mysql_query(Handle(),query);
	new CharName_Check[MAX_PLAYER_NAME];
	if(cache_num_rows() > 0)
	{
		cache_get_value_name(0, "Username", CharName_Check);
	}
	cache_delete(clientCache);
	return CharName_Check;
}
forward C_KickDelay(playerid);
public C_KickDelay(playerid)
{
	Kick(playerid);
	return 1;
}
func:RandomEx(min, max)
{
    new a = random(max - min) + min;
    return a;
}
func:GetPlayerNameEx(playerid) {

	new
		szName[MAX_PLAYER_NAME],
		iPos;

	GetPlayerName(playerid, szName, MAX_PLAYER_NAME);
	while ((iPos = strfind(szName, "_", false, iPos)) != -1) szName[iPos] = ' ';
	return szName;
}

func:IsPlayerInRangeOfVehicle(playerid, vehicleid, Float: radius) {

	new
		Float:Floats[3];

	GetVehiclePos(vehicleid, Floats[0], Floats[1], Floats[2]);
	return IsPlayerInRangeOfPoint(playerid, radius, Floats[0], Floats[1], Floats[2]);
}
func:IsNumeric(szInput[]) {

	new
		iChar,
		i = 0;

	while ((iChar = szInput[i++])) if (!('0' <= iChar <= '9')) return 0;
	return 1;
}
func:GetIntegersFromString(szInput[], output[]) {
    new
        iChar,
        i = 0,
        j = 0;

    new num = 0;
    new hasNumber = false;

    while ((iChar = szInput[i++])) {
        if ('0' <= iChar <= '9') {
            num = num * 10 + (iChar - '0');
            hasNumber = true;
        } else {
            if (hasNumber) {
                output[j++] = num;
                num = 0;
                hasNumber = false;
            }
        }
    }

    // Check for a number at the end of the string
    if (hasNumber) {
        output[j++] = num;
    }

    // Terminate the output array
    output[j] = INVAILID_NUMBER;
}
func:player_get_name(const playerid, bool:fix_ = true) 
{
	new 
		player_name[MAX_PLAYER_NAME];
	
	GetPlayerName(playerid, player_name, MAX_PLAYER_NAME);
	if(fix_) 
	{
		new 
			fix_pos = 0;
		
		while ((fix_pos = strfind(player_name, "_", false, fix_pos)) != -1) 
		{
			player_name[fix_pos] = ' ';   
		} 	
	}
	return player_name;
}
ProxDetector(Float: f_Radius, playerid, string[],col1,col2,col3,col4,col5)
{

	new
		Float: f_playerPos[3];

	GetPlayerPos(playerid, f_playerPos[0], f_playerPos[1], f_playerPos[2]);
	foreach(new i: Player)
	{
		if(GetPlayerVirtualWorld(i) == GetPlayerVirtualWorld(playerid)) 
		{
			if(IsPlayerInRangeOfPoint(i, f_Radius / 16, f_playerPos[0], f_playerPos[1], f_playerPos[2])) {
				SendClientMessage(i, col1, string);
			}
			else if(IsPlayerInRangeOfPoint(i, f_Radius / 8, f_playerPos[0], f_playerPos[1], f_playerPos[2])) {
				SendClientMessage(i, col2, string);
			}
			else if(IsPlayerInRangeOfPoint(i, f_Radius / 4, f_playerPos[0], f_playerPos[1], f_playerPos[2])) {
				SendClientMessage(i, col3, string);
			}
			else if(IsPlayerInRangeOfPoint(i, f_Radius / 2, f_playerPos[0], f_playerPos[1], f_playerPos[2])) {
				SendClientMessage(i, col4, string);
			}
			else if(IsPlayerInRangeOfPoint(i, f_Radius, f_playerPos[0], f_playerPos[1], f_playerPos[2])) {
				SendClientMessage(i, col5, string);
			}
		}
	}
	return 1;
}
func:Clear_Chat(const playerid) 
{
	if(IsPlayerConnected(playerid)) 
	{
		for(new i = 0; i < 100; i ++) 
		{
			SendClientMessage(playerid, -1, #);
		}
		return 1;
	}
	return 0;
}
func:GivePlayerValidWeapon( playerid, WeaponID, Ammo )
{
    #if defined zombiemode
   	if(zombieevent == 1 && GetPVarType(playerid, "pIsZombie")) return SendClientMessage(playerid, COLOR_GREY, "Zombie khong the co sung.");
	#endif
	switch( WeaponID )
	{
  		case 0, 1:
		{
			// PlayerInfo[playerid][pGuns][ 0 ] = WeaponID;
			GivePlayerWeapon( playerid, WeaponID, Ammo );
		}
		case 2, 3, 4, 5, 6, 7, 8, 9:
		{
			// PlayerInfo[playerid][pGuns][ 1 ] = WeaponID;
			GivePlayerWeapon( playerid, WeaponID, Ammo );
		}
		case 22, 23, 24:
		{
			// PlayerInfo[playerid][pGuns][ 2 ] = WeaponID;
			GivePlayerWeapon( playerid, WeaponID, Ammo );
		}
		case 25, 26, 27:
		{
			// PlayerInfo[playerid][pGuns][ 3 ] = WeaponID;
			GivePlayerWeapon( playerid, WeaponID, Ammo );
		}
		case 28, 29, 32:
		{
			// PlayerInfo[playerid][pGuns][ 4 ] = WeaponID;
			GivePlayerWeapon( playerid, WeaponID, Ammo );
		}
		case 30, 31:
		{
			// PlayerInfo[playerid][pGuns][ 5 ] = WeaponID;
			GivePlayerWeapon( playerid, WeaponID, Ammo );
		}
		case 33, 34:
		{
			// PlayerInfo[playerid][pGuns][ 6 ] = WeaponID;
		 	GivePlayerWeapon( playerid, WeaponID, Ammo );
		}
		case 35, 36, 37, 38:
		{
		 	//PlayerInfo[playerid][pGuns][ 7 ] = WeaponID;
			GivePlayerWeapon( playerid, WeaponID, Ammo );
		}
		case 16, 17, 18, 39, 40:
		{
			// PlayerInfo[playerid][pGuns][ 8 ] = WeaponID;
			GivePlayerWeapon( playerid, WeaponID, Ammo );
		}
		case 41, 42, 43:
		{
			// PlayerInfo[playerid][pGuns][ 9 ] = WeaponID;
			GivePlayerWeapon( playerid, WeaponID, Ammo );
		}
		case 10, 11, 12, 13, 14, 15:
		{
			// PlayerInfo[playerid][pGuns][ 10 ] = WeaponID;
			GivePlayerWeapon( playerid, WeaponID, Ammo );
		}
		case 44, 45, 46:
		{
			// PlayerInfo[playerid][pGuns][ 11 ] = WeaponID;
			GivePlayerWeapon( playerid, WeaponID, Ammo );
		}
	}
	return 1;
}

func:ReturnName(playerid)
{
	new pname[MAX_PLAYER_NAME];
	return GetPlayerName(playerid, pname, sizeof(pname));
}

func:LogConsole(string[], type[])
{
	printf("[KNCMS][Log-%s]:%s",type, string);
	return 1;
}


func:Log(sz_fileName[], sz_input[]) {

    new 
    	File: logfile,
    	i_dateTime[2][3],
    	sz_logEntry[180];

    gettime(i_dateTime[0][0], i_dateTime[0][1], i_dateTime[0][2]);
    getdate(i_dateTime[1][0], i_dateTime[1][1], i_dateTime[1][2]);
 
    format(sz_logEntry, sizeof(sz_logEntry), "[%i/%i/%i - %i:%02i:%02i] %s\r\n", i_dateTime[1][0], i_dateTime[1][1], i_dateTime[1][2], i_dateTime[0][0], i_dateTime[0][1], i_dateTime[0][2], sz_input);
    if(!fexist(sz_fileName)) logfile = fopen(sz_fileName, io_write);
    else logfile = fopen(sz_fileName, io_append);
    if(logfile)
    {
        fwrite(logfile, sz_logEntry);
        fclose(logfile);
    }
    return 1;
}

func:ReloadPlayerTextDraw(playerid, PlayerText:reload_ptd)
{
	PlayerTextDrawHide(playerid, reload_ptd);
	PlayerTextDrawShow(playerid, reload_ptd);
	return 1;
}

func:HienTextdraw(playerid, string[], time = 2000)
{
    PlayerTextDrawSetString(playerid, scm_PTD[playerid], " ");
    PlayerTextDrawHide(playerid, scm_PTD[playerid]);
    //SCMText(playerid);
    PlayerTextDrawSetString(playerid, scm_PTD[playerid], string);
    PlayerTextDrawShow(playerid, scm_PTD[playerid]);
    if(HienThi[playerid] == 0)
    {
        SetTimerEx("XoaTextDraw", time, false, "i", playerid);
        HienThi[playerid] = 1;
    }
    return 1;
}

forward XoaTextDraw(playerid);
public XoaTextDraw(playerid)
{
    PlayerTextDrawSetString(playerid, scm_PTD[playerid], " ");
    PlayerTextDrawHide(playerid, scm_PTD[playerid]);
    //PlayerTextDrawHide(playerid, scm_PTD[playerid]);
    HienThi[playerid] = 0;
    //SCM(playerid, COLOR_WHITE, "Textdraw da duoc xoa bo.");
    return 1;
}
func:FadeInPlayerScreen(playerid)
{
	SetPVarInt(playerid, "phatfadein", 255);
	PlayerTextDrawColor(playerid, FadeEffect[playerid][0], GetPVarInt(playerid, "phatfadein"));
 	PlayerTextDrawShow(playerid, FadeEffect[playerid][0]);
	SetTimerEx("fadein1", 25, false, "i", playerid);
}

forward fadein1(playerid);
public fadein1(playerid)
{
	if(GetPVarInt(playerid, "phatfadein") > 0)
	{
	    new fadeplus = GetPVarInt(playerid, "phatfadein");
		SetPVarInt(playerid, "phatfadein", fadeplus-=15);
		SetTimerEx("fadein2", 25, false, "i", playerid);
		PlayerTextDrawColor(playerid, FadeEffect[playerid][0], GetPVarInt(playerid, "phatfadein"));
	 	PlayerTextDrawShow(playerid, FadeEffect[playerid][0]);
	}
	return 1;
}

forward fadein2(playerid);
public fadein2(playerid)
{
	if(GetPVarInt(playerid, "phatfadein") > 0)
	{
	    new fadeplus = GetPVarInt(playerid, "phatfadein");
		SetPVarInt(playerid, "phatfadein", fadeplus-=15);
		SetTimerEx("fadein1", 25, false, "i", playerid);
		PlayerTextDrawColor(playerid, FadeEffect[playerid][0], GetPVarInt(playerid, "phatfadein"));
	 	PlayerTextDrawShow(playerid, FadeEffect[playerid][0]);
	}
	return 1;
}





func:FadeOutPlayerScreen(playerid)
{
	SetPVarInt(playerid, "phatfade", 0);
	PlayerTextDrawColor(playerid, FadeEffect[playerid][0], GetPVarInt(playerid, "phatfade"));
 	PlayerTextDrawShow(playerid, FadeEffect[playerid][0]);
	SetTimerEx("fadeout1", 25, false, "i", playerid);
}

forward fadeout1(playerid);
public fadeout1(playerid)
{
	if(GetPVarInt(playerid, "phatfade") < 255)
	{
	    new fadeplus = GetPVarInt(playerid, "phatfade");
		SetPVarInt(playerid, "phatfade", fadeplus+=15);
		SetTimerEx("fadeout2", 25, false, "i", playerid);
		PlayerTextDrawColor(playerid, FadeEffect[playerid][0], GetPVarInt(playerid, "phatfade"));
	 	PlayerTextDrawShow(playerid, FadeEffect[playerid][0]);
	}
	return 1;
}
forward fadeout2(playerid);
public fadeout2(playerid)
{
	if(GetPVarInt(playerid, "phatfade") < 255)
	{
	    new fadeplus = GetPVarInt(playerid, "phatfade");
		SetPVarInt(playerid, "phatfade", fadeplus+=15);
		SetTimerEx("fadeout1", 25, false, "i", playerid);
		PlayerTextDrawColor(playerid, FadeEffect[playerid][0], GetPVarInt(playerid, "phatfade"));
	 	PlayerTextDrawShow(playerid, FadeEffect[playerid][0]);
	}
	return 1;
}

forward PlayerJoinGameReal(playerid);
public PlayerJoinGameReal(playerid)
{
	FadeInPlayerScreen(playerid);
    return 1;
}

stock SetPlayerJoinCamera(playerid)
{
	InterpolateCameraPos(playerid, 1475.2776,-1714.8265,45.0341, 1475.2776,-1714.8265,45.0341+20, 20000);
    InterpolateCameraLookAt(playerid, 1481.8513,-1752.0916,25.2723,1481.8513,-1752.0916,25.2723, 20000);
	return 1;
}

func:UpdateInteger(table[], field[], value)
{
	new query_build[1280];
	mysql_format(Handle(), query_build, sizeof(query_build), "UPDATE `%s` SET `%s` = '%d'", table, field, strval(value));
	mysql_query(Handle(), query_build, false);
	return 1;
}

func:UpdateString(table[], field[], value[])
{
	new query_build[1280];
	mysql_format(Handle(), query_build, sizeof(query_build), "UPDATE `%s` SET `%s` = '%s'", table, field, value);
	mysql_query(Handle(), query_build, false);
	return 1;
}
func:UpdateFloat(table[], field[], Float:value)
{
	new query_build[1280];
	mysql_format(Handle(), query_build, sizeof(query_build), "UPDATE `%s` SET `%s` = '%f'", table, field, value);
	mysql_query(Handle(), query_build, false);
	return 1;
}

func:GetNameFromDB(sqlid)
{
    new query[1280], namedb[123];
    format(query, sizeof(query), "SELECT * FROM `players` WHERE `id` = '%d'",sqlid);
    new Cache:iGetNameFromDB;
    iGetNameFromDB = mysql_query(Handle(),query);

	cache_get_value_name(0, "PlayerName",namedb);
    cache_delete(iGetNameFromDB);
    return namedb;
}

stock FormatMoney(amount)
{
	new output[1220];
    new formatted_str[32];
    format(formatted_str, sizeof(formatted_str), "%d", amount);

    new i = 0, j = 0;
    new len = strlen(formatted_str);
    new comma_pos = len % 3;
    
    for (i = 0; i < len; i++)
    {
        if (i > 0 && (i - comma_pos) % 3 == 0)
        {
            output[j] = ',';
            j++;
        }
        
        output[j] = formatted_str[i];
        j++;
    }
    output[j] = EOS;
	return output;
}



func:GetTotalPlayerOnline()
{
	new total_p;
	foreach(new i:Player)
	{
		if(IsPlayerConnected(i)) total_p++;
	}
	return total_p;
}
