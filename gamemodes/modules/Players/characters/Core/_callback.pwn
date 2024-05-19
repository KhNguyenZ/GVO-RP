#define GetPlayerSQLID(playerid) Character[playerid][char_player_id]

stock character_Select(const playerid) 
{
	Clear_Chat(playerid);
	new query[1280];
	mysql_format(Handle(), query, sizeof(query), "SELECT * FROM `accounts` WHERE `Username` = '%s'", player_get_name(playerid, false));
	if(mysql_tquery(Handle(),query, "character_List","i", playerid))
	{
		new find[1280];
		format(find, sizeof(find), "Dang tim nhan vat cua %s", player_get_name(playerid, false));
		HienTextdraw(playerid, find, 5000);

	}
	else HienTextdraw(playerid, "Loi tim tai khoan", 5000);
	return 1;
}

forward character_List(const playerid);
public character_List(const playerid)
{
	PlayerSetupping[playerid] = 1;
	HienTextdraw(playerid, "Xin vui long chon nhan vat.", 5000);

	if(cache_num_rows()) 
	{
		for(new i = 0; i < 3; i ++)
		{
			new charname[1280];
			format(charname, sizeof(charname), "CharName%d", i);
			cache_get_value_name(0,charname, character_Name_data[playerid][i]);
			new query[240];
			format(query, sizeof(query), "SELECT * FROM `players` WHERE `PlayerName` = '%s'", character_Name_data[playerid][i]);
			mysql_tquery(Handle(), query, "OnCharacterSelectNews", "ii", playerid,i);
			HienTextdraw(playerid, "Dang load du lieu , vui long doi trong giay lat", 2000);
			SetTimerEx("ShowCharSelect_", 2000, 0, "i", playerid);
		}
	}
	return 1;
}
forward ShowCharSelect_(playerid);
public ShowCharSelect_(playerid)
{
	ShowCharacterSelect(playerid);
	return 1;
}


forward OnCharacterCreate(const playerid);
public OnCharacterCreate(const playerid)
{
	Clear_Chat(playerid);
	SendClientMessage(playerid, -1, "|____ Character Create ____|");
	new sdm[1280];
	mysql_format(Handle(), sdm, sizeof(sdm), "Name: %s", player_get_name(playerid));
	SendClientMessage(playerid, -1, sdm);
	
	PlayerSetupping[playerid] = 1;
	ShowPlayerMenuRegister(playerid);

	new reg_log[1280];
	format(reg_log, sizeof(reg_log), "Nguoi choi %s vua dang ky tai khoan", player_get_name(playerid));
	LogConsole(reg_log, "Register");
	return 1;
}

#include <YSI\y_hooks>
hook OnPlayerConnect(playerid)
{
	for(new i = 0; i < 3; i ++) 
		format(character_Name_data[playerid][i], MAX_PLAYER_NAME, "KHONG_XAC_DINH");
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	static i;

	if(dialogid == dialog_charSelect) 
	{
		if(response)
		{	
			i = listitem;
			if(!strcmp(character_Name_data[playerid][i], "Tao nhan vat", true))
			{
				SetPVarInt(playerid, "CharSelect_",listitem);
				ShowPlayerDialog(playerid, dialog_charCreate, DIALOG_STYLE_INPUT, "Tao nhan vat.", "Nhap ten nhan vat ban muon tao.", "Tao", "Tro lai");
			}
			else // Da co nhan vat
			{
				SetPlayerName(playerid, character_Name_data[playerid][i]);
				
				new query[240];
				format(query, sizeof(query), "SELECT * FROM `players` WHERE `PlayerName` = '%s'", player_get_name(playerid, false));
				mysql_tquery(Handle(), query, "OnCharacterLoad", "i", playerid);
				SetPVarInt(playerid,"CharSelected_", 1);
			}
		}
		return ~1;
	}
	else if(dialogid == dialog_charCreate)
	{
		if(response)
		{
			new 
				len = strlen(inputtext);
			if(len >= MAX_PLAYER_NAME || inputtext[0] == EOS || len <= 4)
			{
				SendClientMessage(playerid, -1, "Ten khong hop le.");
				ShowPlayerDialog(playerid, dialog_charCreate, DIALOG_STYLE_INPUT, "Tao nhan vat.", "Nhap ten nhan vat ban muon tao.\nListitem: %d", "Tao", "Tro lai");	
			}
			else if(strfind(inputtext, "_", true) == -1 || strfind(inputtext, " ", true) != -1)
			{
				SendClientMessage(playerid, -1, "Ten nhan vat phai co '_' trong ten.");
				ShowPlayerDialog(playerid, dialog_charCreate, DIALOG_STYLE_INPUT, "Tao nhan vat.","Nhap ten nhan vat ban muon tao.","Tao", "Tro lai");	
			}
			else 
			{
				new 
					Cache:iCache, _query[200];
				new query[240];
				format(query, sizeof(query), "SELECT * FROM `players` WHERE `PlayerName` = '%s'", inputtext);
				iCache = mysql_query
				(
					Handle(),
					query,
					true
				);
				if(cache_num_rows())
				{
					ShowPlayerDialog(playerid, dialog_charCreate, DIALOG_STYLE_INPUT, "Tao nhan vat.", "Nhap lai ten nhan vat ban muon tao. Ten nhan vat nay da duoc tao", "Tao", "Tro lai");							
				}
				else
				{
					new queyz[1280], Cache:update_cache;
					format(queyz, sizeof(queyz), "UPDATE `accounts` SET `CharName%d` = '%s' WHERE `Username` = '%s'", GetPVarInt(playerid,"CharSelect_"), inputtext, player_get_name(playerid, false));
					update_cache = mysql_query(Handle(),queyz);
					cache_delete(update_cache);
					DeletePVar(playerid,"CharSelect_");
					
					SetPlayerName(playerid, inputtext);
					mysql_format(Handle(), _query, 200, "INSERT INTO `players` (`AccID`, `PlayerName`) VALUES ('%d', '%s')", strval(Character[playerid][char_account_id]), inputtext);
					mysql_tquery(Handle(), _query, "OnCharacterCreate", "i", playerid);
				}
				cache_delete(iCache);
			}
		}
		else 
			return ~character_Select(playerid);
	}
	return 1;
}


