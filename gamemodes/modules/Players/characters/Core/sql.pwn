forward OnCharacterSelectNews(playerid, slot_char);
public OnCharacterSelectNews(playerid, slot_char)
{
	new char_load[1280];
	if(cache_num_rows()) 
	{
		cache_get_value_name_int(0, "Skin", CharSelectInfo[playerid][cs_skin][slot_char]);
		cache_get_value_name_int(0, "Gender", CharSelectInfo[playerid][cs_gender][slot_char]);
		cache_get_value_name_int(0, "Level", CharSelectInfo[playerid][cs_level][slot_char]);
		cache_get_value_name(0, "LastLogin", CharSelectInfo[playerid][cs_lastlogin][slot_char]);
		format(char_load, sizeof(char_load), "Loaded_Char_%d", slot_char);
		SetPVarInt(playerid,char_load,1);
	}
	else{
		format(char_load, sizeof(char_load), "Loaded_Char_%d", slot_char);
		SetPVarInt(playerid,char_load,0);
	}
	return 1;
}

forward OnCharacterLoad(const playerid);
public OnCharacterLoad(const playerid)
{
	Character[playerid][char_Login] = true;

	cache_get_value_name_int(0, "id", Character[playerid][char_player_id]);
	cache_get_value_name_float(0, "PosX", Character[playerid][char_last_Pos][0]);
	cache_get_value_name_float(0, "PosY", Character[playerid][char_last_Pos][1]);
	cache_get_value_name_float(0, "PosZ", Character[playerid][char_last_Pos][2]);
	cache_get_value_name_float(0, "PosA", Character[playerid][char_last_Pos][3]);
	cache_get_value_name_float(0, "Health", Character[playerid][char_health]);
	cache_get_value_name_float(0, "Armour", Character[playerid][char_armour]);
	cache_get_value_name_int(0, "Skin", Character[playerid][char_Skin]);
	cache_get_value_name_int(0, "TanSo", Character[playerid][char_tanso]);
	cache_get_value_name_int(0, "Cash", Character[playerid][char_Cash]);
	cache_get_value_name_int(0, "AdminLevel", Character[playerid][char_Admin]);
	cache_get_value_name_int(0, "Interior", Character[playerid][char_Interior]);
	cache_get_value_name_int(0, "VW", Character[playerid][char_VW]);
	cache_get_value_name_int(0, "Level", Character[playerid][char_Level]);
	cache_get_value_name_int(0, "Gender", Character[playerid][char_GioiTinh]);
	cache_get_value_name_int(0, "QuocTich", Character[playerid][char_Nation]);
	cache_get_value_name(0, "Note", Character[playerid][char_Note]);

	cache_get_value_name_int(0, "BirthDay", Character[playerid][char_Birthday][0]);
	cache_get_value_name_int(0, "BirthMonth", Character[playerid][char_Birthday][1]);
	cache_get_value_name_int(0, "BirthYear", Character[playerid][char_Birthday][2]);

	cache_get_value_name_int(0, "Phone", Character[playerid][char_Phone]);
	cache_get_value_name_int(0, "DanhBa", Character[playerid][char_DanhBa]);
	cache_get_value_name_int(0, "Dice", Character[playerid][char_Dice]);
	cache_get_value_name_int(0, "CanXang", Character[playerid][char_CanXang]);
	cache_get_value_name_int(0, "DayThung", Character[playerid][char_DayThung]);
	cache_get_value_name_int(0, "XiGa", Character[playerid][char_XiGa]);
	cache_get_value_name_int(0, "Drink", Character[playerid][char_Drink]);
	cache_get_value_name_int(0, "BinhSonXe", Character[playerid][char_BinhSonXe]);
	cache_get_value_name_int(0, "Radio", Character[playerid][char_Radio]);
	cache_get_value_name_int(0, "MatNa", Character[playerid][char_MatNa]);


	cache_get_value_name_int(0, "OrgID", Character[playerid][char_OrgID]);
	cache_get_value_name_int(0, "OrgRank", Character[playerid][char_OrgRank]);
	cache_get_value_name_int(0, "Eat", Character[playerid][char_Eat]);

	cache_get_value_name_int(0, "Bank", Character[playerid][char_Bank]);
	cache_get_value_name_int(0, "BankSaving", Character[playerid][char_BankSaving]);
	cache_get_value_name_int(0, "LastLogin", Character[playerid][char_LastLogin]);

	cache_get_value_name(0, "HoursSaving", Character[playerid][char_HoursSaving]);

	cache_get_value_name(0, "ChiaKhoaXe", Character[playerid][char_ChiaKhoaXe]);

	cache_get_value_name(0, "Refer", Character[playerid][char_Refer]);

	cache_get_value_name_int(0, "Injured", Character[playerid][char_Injured]);
    return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
	if(player_Login(playerid))
	{
		new 
			query[3000] = "UPDATE `players` SET";
		
		new 
			Float:X, Float:Y, Float:Z, Float:R;
		
		GetPlayerPos(playerid, X, Y, Z);
		GetPlayerFacingAngle(playerid, R);
		GetPlayerHealth(playerid, Character[playerid][char_health]);
		GetPlayerArmour(playerid,Character[playerid][char_armour]);

		mysql_format(Handle(), query, sizeof(query), "%s PosX = '%f',", query, X);
		mysql_format(Handle(), query, sizeof(query), "%s PosY = '%f',", query, Y);
		mysql_format(Handle(), query, sizeof(query), "%s PosZ = '%f',", query, Z);
		mysql_format(Handle(), query, sizeof(query), "%s PosA = '%f',", query, R);
		mysql_format(Handle(), query, sizeof(query), "%s Health = '%f',", query, Character[playerid][char_health]);
		mysql_format(Handle(), query, sizeof(query), "%s Armour = '%f',", query, Character[playerid][char_armour]);
		mysql_format(Handle(), query, sizeof(query), "%s TanSo = '%d',", query, Character[playerid][char_tanso]);
		mysql_format(Handle(), query, sizeof(query), "%s Cash = '%d',", query, Character[playerid][char_Cash]);
		mysql_format(Handle(), query, sizeof(query), "%s AdminLevel = '%d',", query, Character[playerid][char_Admin]);
		mysql_format(Handle(), query, sizeof(query), "%s Interior = '%d',", query, Character[playerid][char_Interior]);
		mysql_format(Handle(), query, sizeof(query), "%s VW = '%d',", query, Character[playerid][char_VW]);
		
		
		mysql_format(Handle(), query, sizeof(query), "%s Phone = '%d',", query, Character[playerid][char_Phone]);
		mysql_format(Handle(), query, sizeof(query), "%s DanhBa = '%d',", query, Character[playerid][char_DanhBa]);
		mysql_format(Handle(), query, sizeof(query), "%s Dice = '%d',", query, Character[playerid][char_Dice]);
		mysql_format(Handle(), query, sizeof(query), "%s CanXang = '%d',", query, Character[playerid][char_CanXang]);
		mysql_format(Handle(), query, sizeof(query), "%s DayThung = '%d',", query, Character[playerid][char_DayThung]);
		mysql_format(Handle(), query, sizeof(query), "%s XiGa = '%d',", query, Character[playerid][char_XiGa]);
		mysql_format(Handle(), query, sizeof(query), "%s Drink = '%d',", query, Character[playerid][char_Drink]);
		mysql_format(Handle(), query, sizeof(query), "%s BinhSonXe = '%d',", query, Character[playerid][char_BinhSonXe]);
		mysql_format(Handle(), query, sizeof(query), "%s Radio = '%d',", query, Character[playerid][char_Radio]);
		mysql_format(Handle(), query, sizeof(query), "%s MatNa = '%d',", query, Character[playerid][char_MatNa]);


		mysql_format(Handle(), query, sizeof(query), "%s OrgID = '%d',", query, Character[playerid][char_OrgID]);
		mysql_format(Handle(), query, sizeof(query), "%s OrgRank = '%d',", query, Character[playerid][char_OrgRank]);
		mysql_format(Handle(), query, sizeof(query), "%s Eat = '%d',", query, Character[playerid][char_Eat]);

		mysql_format(Handle(), query, sizeof(query), "%s Refer = '%s',", query, Character[playerid][char_Refer]);

		mysql_format(Handle(), query, sizeof(query), "%s Bank = '%d',", query, Character[playerid][char_Bank]);
		mysql_format(Handle(), query, sizeof(query), "%s BankSaving = '%d',", query, Character[playerid][char_BankSaving]);
		mysql_format(Handle(), query, sizeof(query), "%s HoursSaving = '%d',", query, Character[playerid][char_HoursSaving]);

		mysql_format(Handle(), query, sizeof(query), "%s LastLogin = '%s',", query, Character[playerid][char_LastLogin]);
		mysql_format(Handle(), query, sizeof(query), "%s Injured = '%d',", query, Character[playerid][char_Injured]);		
		
		mysql_format(Handle(), query, sizeof(query), "%s Skin = %d WHERE `id` = '%d' LIMIT 1", query, Character[playerid][char_Skin], Character[playerid][char_player_id]);
		printf("%s",query);
		if(mysql_tquery(Handle(), query))
		{
			Character[playerid][char_Login] = false;
			printf("Character Save: %s | AccountID: %d", player_get_name(playerid), Character[playerid][char_player_id]);
		}
		else printf("Character Save Error: %s",player_get_name(playerid));
	}
	return 1;
}
