#define     Language   (2)  //   1 = TR --> Türkçe (Turkish)  |   2 = EN  -->  English

#define     MAX_ATM			(1000)     //  Maksimum ATM sayısı  --  Maximum number of ATMs
#define     ATM_OBJECT		(19324) //  Atm objesi  --  Atm object


enum aInfo
{
    ScriptID,
    ModelID,
    Float:X,
    Float:Y,
    Float:Z,
    Float:rX,
    Float:rY,
    Float:rZ
};

new ATM[MAX_ATM][aInfo];

func:LoadATM(){
	print("**Now loading CreateDynamicObject SQL**");
    mysql_tquery(Handle(), "SELECT * FROM `atms`", "LoadATMs", "");
	return 1;
}

forward LoadATMs(limit);
public LoadATMs(limit)
{
    for(new i; i < cache_num_rows(); i++)
    {
				cache_get_value_name_int(i, "id", ATM[i][ScriptID]);
                cache_get_value_name_float(i, "X", ATM[i][X]);
                cache_get_value_name_float(i, "Y", ATM[i][Y]);
                cache_get_value_name_float(i, "Z", ATM[i][Z]);
                cache_get_value_name_float(i, "rX", ATM[i][rX]);
                cache_get_value_name_float(i, "rY", ATM[i][rY]);
                cache_get_value_name_float(i, "rZ", ATM[i][rZ]);
                CreateDynamicObject(ATM_OBJECT, ATM[i][X], ATM[i][Y], ATM[i][Z], ATM[i][rX], ATM[i][rY], ATM[i][rZ]);
				new query[128];
				format(query, 128, "{FFFFFF}[ {00ff00}#%i {FFFFFF}]\n\
				{FFFFFF}Su dung\n\
				{ffff00} /atm{FFFFFF} de tim hieu.", ATM[i][ScriptID]);
				Create3DTextLabel(query, COLOR_WHITE, ATM[i][X], ATM[i][Y], ATM[i][Z], 7.0, 0, false);
	}
    
    return 1;
}

CMD:atm(playerid)
{
	for(new i; i < MAX_ATM; i++)
    {
		if(IsPlayerInRangeOfPoint(playerid, 5.0, ATM[i][X], ATM[i][Y], ATM[i][Z]))
		{
			if(Character[playerid][char_OTP] != EOS)
			{
				OpenBanking(playerid);
				SelectTextDraw(playerid, 0xFF00FF);
				
			}
			else 
			{
				SendClientMessage(playerid, COLOR_WHITE, "Ban chua cap nhat ma OTP [ {ff0000}/otp{ffffff} ] de cap nhat");    
			}
		}
	}
	return 1;
}

