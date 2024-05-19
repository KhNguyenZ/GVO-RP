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

    return 1;
}