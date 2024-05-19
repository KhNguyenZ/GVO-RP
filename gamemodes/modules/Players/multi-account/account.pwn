const MAX_PASSWORD_LEN = 32;

#include <YSI_Coding\y_hooks>
hook OnGameModeInit()
{
    return 1;
}

hook OnPlayerConnect(playerid)
{
    ResetPlayerMoney(playerid);
    Clear_Chat(playerid);
    new query[1280];
    format(query, sizeof(query), "SELECT `Username`, `Password` FROM `accounts` WHERE `Username` = '%s'", player_get_name(playerid, false));
    mysql_tquery
    (
        Handle(), query,
        "OnAccountCheck",
        "d",
        playerid
    );
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    new result = 0;
    switch (dialogid)
    {
        case dialog_Register: // Dang ky
        {
            result = response ? 1 : -1;
            if (response)
            {
                new len = strlen(inputtext);

                if (len >= MAX_PASSWORD_LEN || inputtext[0] == EOS || len < 6)
                {
                    HienTextdraw(playerid, "Do dai mat khau tu 6 den 32 ki tu", 10000);
                    connectForm_Show(playerid, dialog_Register);
                }
                else
                {
                    new query[320];
                    mysql_format(Handle(), query, 320, "INSERT INTO `accounts` (Username, Password, Email) VALUES ('%s', '%s', '%s')", player_get_name(playerid, false), inputtext, Character[playerid][char_Email]);
                    mysql_tquery(Handle(), query, "OnAccountRegister", "i", playerid);
                    new queryzzz[1280], Cache:acc_cache;
                    mysql_format(Handle(), queryzzz, sizeof(queryzzz), "SELECT * FROM `accounts` WHERE `Username` = '%s'", player_get_name(playerid, false));
                    acc_cache = mysql_query(Handle(), queryzzz);
                    if (cache_num_rows())
                    {
                        cache_get_value_name_int(0, "id", Character[playerid][char_account_id]);
                    }
                    cache_delete(acc_cache);
                }
            }
        }
        case DLG_REGISTER:{
			if(response) {
				if(isnull(inputtext))
				{
					new login_string[1280];
					format(login_string, sizeof(login_string), "{ffffff}Chao mung {3366ff}%s{ffffff} den voi {3366ff}SSA{ffffff}\n{FF0000}Vui long nhap mat khau", player_get_name(playerid, 1));
					ShowPlayerDialog(playerid, DLG_REGISTER,DIALOG_STYLE_PASSWORD, "Dang ky", login_string, ">>", "<<");
					HienTextdraw(playerid, "~r~Vui long nhap mat khau", 3000);
				}
				if(strlen(inputtext) < 6 || strlen(inputtext) > 64)
				{
					new login_string[1280];
					format(login_string, sizeof(login_string), "{ffffff}Chao mung {3366ff}%s{ffffff} den voi {3366ff}SSA{ffffff}\n{FF0000}Mat khau phai dai hon 6 ki tu va ngan hon 64 ki tu", player_get_name(playerid, 1));
					ShowPlayerDialog(playerid, DLG_REGISTER,DIALOG_STYLE_PASSWORD, "Dang ky", login_string, ">>", "<<");
					HienTextdraw(playerid, "~r~Mat khau phai dai hon 6 ki tu va ngan hon 64 ki tu", 3000);
				}
				else{
					SetPVarString(playerid, "UserPassReg_", inputtext);
					new pass_string[128];
					for(new pass_hide = 0 ; pass_hide < strlen(inputtext); pass_hide++)
					{
						strcat(pass_string, ".");
					}
					PlayerTextDrawSetString(playerid, LoginPTD[playerid][8], pass_string);
					ReloadPlayerTextDraw(playerid, LoginPTD[playerid][8]);
				}
			}
			else Kick(playerid);
		}
        case DLG_LOGIN:
        {
            if (response)
            {
                if (isnull(inputtext))
                {
                    new login_string[128];
                    format(login_string, sizeof(login_string), "{ffffff}Chao mung {3366ff}%s{ffffff} tro lai voi {3366ff}SSA{ffffff}\nVui long nhap mat khau !", player_get_name(playerid, 1));
                    ShowPlayerDialog(playerid, DLG_LOGIN, DIALOG_STYLE_INPUT, "Dang Nhap", login_string, ">>", "<<");
                }
                if (strlen(inputtext) < 64)
                {
                    SetPVarInt(playerid, #InputPassworded, 1);
                    SetPVarString(playerid, "UserPass_", inputtext);
                    new pass_string[128];
                    for (new pass_hide = 0 ; pass_hide < strlen(inputtext); pass_hide++)
                    {
                        strcat(pass_string, ".");
                    }
                    PlayerTextDrawSetString(playerid, LoginPTD[playerid][8], pass_string);
                    ReloadPlayerTextDraw(playerid, LoginPTD[playerid][8]);
                }
                else
                {
                    new login_string[128];
                    format(login_string, sizeof(login_string), "{ffffff}Chao mung {3366ff}%s{ffffff} tro lai voi {3366ff}SSA{ffffff}\nMat khau qua dai !", player_get_name(playerid, 1));
                    ShowPlayerDialog(playerid, DLG_LOGIN, DIALOG_STYLE_INPUT, "Dang Nhap", login_string, ">>", "<<");
                }
            }
        }
        case 151:
        {
            if (strfind(inputtext, "@gmail.com", true) == -1)
            {
                SendErrorMessage(playerid, "May chu chi nhap nhan Email voi dinh dang 'mail@gmail.com'");
                ShowPlayerDialog(playerid, 151, DIALOG_STYLE_PASSWORD, "Dang ky", "Vui long nhap G-Mail de xac thuc tai khoan", ">>", "<<");
                return 1;
            }

            format(Character[playerid][char_Email], 128, "%s", inputtext);
            printf("%s", Character[playerid][char_Email]);
            PlayerTextDrawSetString(playerid, LoginPTD[playerid][10], inputtext);

            SetPVarString(playerid, #Email_Reg, inputtext);
        }
    }
    if (result == -1) Kick(playerid);
    return 1;
}

connectForm_Show(const playerid, const _case)
{
    if (_case == dialog_Login)
    {
        ShowPlayerDialog(playerid, dialog_Login, 3, "Nhap mat khau", "{ffffff}Vui long nhap mat khau tai khoan cua ban.{ffffff}", "Xac nhan", "Huy bo");
    }
    else
    {
        ShowPlayerDialog(playerid, dialog_Register, 3, "Dang ky", "{ffffff}Chao mung den voi may chu {3366ff}SSA-RP{ffffff}\n\
			Vui long nhap mat khau dang ky.", "Dang ky", "Thoat");
    }
}

account_get_password(const username[])
{
    new Cache:iCache, Key[129] = "Invalid User", query[128];

    mysql_format
    (
        Handle(), query, sizeof(query),
        "SELECT `Password` FROM `accounts` WHERE `Username` = '%s'", username
    );
    iCache = mysql_query(Handle(), query);
    if (cache_num_rows())
    {
        cache_get_value_name(0, "Password", Key);
    }
    cache_delete(iCache);
    return Key;
}

forward OnAccountCheck(const playerid);
public OnAccountCheck(const playerid)
{
    if (cache_num_rows())
    {
        ShowLoginPTD(playerid);
    }
    else
    {
        ShowPlayerMainRegister(playerid);
    }
    return 1;
}

forward OnAccountRegister(const playerid);
public OnAccountRegister(const playerid)
{
    character_Select(playerid);
    HienTextdraw(playerid, "Dang ky tai khoan thanh cong.", 5000);
    return 1;
}
func:LoadAccountInfo(playerid)
{
    new hour, minute, second, year, month, day;
    gettime(hour, minute, second);
    getdate(year, month, day);
    format(Character[playerid][char_LastLogin], 100, "%d:%d:%d %d-%d-%d", hour, minute, second, month, day, year);


    new queryzzz[128], Cache:acc_cache;
    mysql_format(Handle(), queryzzz, sizeof(queryzzz), "SELECT * FROM `accounts` WHERE `Username` = '%s'", player_get_name(playerid, false));
    acc_cache = mysql_query(Handle(), queryzzz);
    if (cache_num_rows())
    {
        cache_get_value_name_int(0, "id", Character[playerid][char_account_id]);
        cache_get_value_name(0, "DiscordID", Character[playerid][char_DCID]);
        cache_get_value_name(0, "Discord_Code", Character[playerid][char_DC_Code]);
        cache_get_value_name_int(0, "Discord_Auth", Character[playerid][char_DC_Auth]);
        cache_get_value_name_int(0, "OTP", Character[playerid][char_OTP]);

        cache_get_value_name(0, "Email", Character[playerid][char_Email]);
        cache_get_value_name(0, "Email_Code", Character[playerid][char_Email_Code]);
        cache_get_value_name_int(0, "Email_Status", Character[playerid][char_Email_Status]);
    }
    cache_delete(acc_cache);
}


func:LoginClick(playerid, PlayerText:playertextid)
{
    if (playertextid == LoginPTD[playerid][2])
    {
        new login_string[1280];
        format(login_string, sizeof(login_string), "{ffffff}Chao mung {3366ff}%s{ffffff} tro lai voi {3366ff}SSA{ffffff}", player_get_name(playerid, 1));
        ShowPlayerDialog(playerid, DLG_LOGIN, DIALOG_STYLE_PASSWORD, "Dang Nhap", login_string, ">>", "<<");
    }
    if (playertextid == LoginPTD[playerid][4])
    {
        new Pass_str[128];
        GetPVarString(playerid, "UserPass_", Pass_str, sizeof(Pass_str));

        if (isnull(Pass_str) || GetPVarInt(playerid, #InputPassworded) != 1)
        {
            SendErrorMessage(playerid, "Ban chua nhap mat khau !");
        }

        if (SERVER_TEST == 1 || (!strcmp(account_get_password(player_get_name(playerid, false)), Pass_str) && GetPVarInt(playerid, #InputPassworded) == 1))
        {
            LoadAccountInfo(playerid);

            character_Select(playerid);
            HideAuthPTD(playerid);

            Character[playerid][char_Login] = true;
        }
        else
        {
            HienTextdraw(playerid, "~r~Ban da nhap sai mat khau, vui long nhap lai.", 5000);
        }
    }
    return 1;
}

func:RegClick(playerid, PlayerText:playertextid)
{
    if (playertextid == LoginPTD[playerid][2])
    {
        new login_string[1280];
        format(login_string, sizeof(login_string), "{ffffff}Chao mung {3366ff}%s{ffffff} den voi {3366ff}SSA{ffffff}\nVui long nhap mat khau de tiep tuc", player_get_name(playerid, 1));
        ShowPlayerDialog(playerid, DLG_REGISTER, DIALOG_STYLE_PASSWORD, "Dang ky", login_string, ">>", "<<");
    }
    if (playertextid == LoginPTD[playerid][4])
    {
        printf("%s", Character[playerid][char_Email]);
        if(isnull(Character[playerid][char_Email]))
        {
            HienTextdraw(playerid, "Vui long nhap day du thong tin !!", 10000);
        }
        new pass_reg[128];
        GetPVarString(playerid, "UserPassReg_", pass_reg, sizeof(pass_reg));
        if (isnull(pass_reg))
        {
            HienTextdraw(playerid, "~r~Vui long nhap mat khau", 3000);
        }
        new reg_query[320];

        mysql_format(Handle(), reg_query, 320, "INSERT INTO `accounts` (Username, Password) VALUES ('%s', '%s')", player_get_name(playerid, false), pass_reg);
        mysql_tquery(Handle(), reg_query, "OnAccountRegister", "i", playerid);

        new reg_queryzzz[1280], Cache:acc_cache;
        mysql_format(Handle(), reg_queryzzz, sizeof(reg_queryzzz), "SELECT * FROM `accounts` WHERE `Username` = '%s'", player_get_name(playerid, false));
        acc_cache = mysql_query(Handle(), reg_queryzzz);
        if (cache_num_rows())
        {
            cache_get_value_name_int(0, "id", Character[playerid][char_account_id]);
        }
        cache_delete(acc_cache);
        HideAuthPTD(playerid);
    }
    if (playertextid == LoginPTD[playerid][3])
    {
        ShowPlayerDialog(playerid, 151, DIALOG_STYLE_PASSWORD, "Dang ky", "Vui long nhap G-Mail de xac thuc tai khoan", ">>", "<<");
    }
    return 1;
}
