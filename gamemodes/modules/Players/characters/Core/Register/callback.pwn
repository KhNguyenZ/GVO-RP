hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    switch (dialogid)
    {
        case DLG_REG_DAY:
        {
            if (response)
            {
                Character[playerid][char_Birthday][0] = listitem + 1;
                new reg_day[1280], fm_reg[1280];
                for (new i = 1 ; i < 12 ; i++)
                {
                    format(fm_reg, sizeof(fm_reg), "%d\n", i);
                    strcat(reg_day, fm_reg);
                }
                strcat(reg_day, "12");
                ShowPlayerDialog(playerid, DLG_REG_MONTH, DIALOG_STYLE_LIST, "Cai dat thang sinh", reg_day, ">>", "<<");

            }
            else
            {
                new reg_day[1280], fm_reg[1280];
                for (new i = 1 ; i < 31 ; i++)
                {
                    format(fm_reg, sizeof(fm_reg), "%d\n", i);
                    strcat(reg_day, fm_reg);
                }
                strcat(reg_day, "31");
                ShowPlayerDialog(playerid, DLG_REG_DAY, DIALOG_STYLE_LIST, "Cai dat ngay sinh", reg_day, ">>", "<<");
            }
        }
        case DLG_REG_MONTH:
        {
            if (response)
            {
                Character[playerid][char_Birthday][1] = listitem + 1;
                new reg_day[1280], fm_reg[1280];
                for (new i = 2010 ; i > 1980 ; i--)
                {
                    format(fm_reg, sizeof(fm_reg), "%d\n", i);
                    strcat(reg_day, fm_reg);
                }
                strcat(reg_day, "1980");
                ShowPlayerDialog(playerid, DLG_REG_YEAR, DIALOG_STYLE_LIST, "Cai dat nam sinh", reg_day, ">>", "<<");
            }
            else
            {
                new reg_day[1280], fm_reg[1280];
                for (new i = 1 ; i < 12 ; i++)
                {
                    format(fm_reg, sizeof(fm_reg), "%d\n", i);
                    strcat(reg_day, fm_reg);
                }
                strcat(reg_day, "12");
                ShowPlayerDialog(playerid, DLG_REG_MONTH, DIALOG_STYLE_LIST, "Cai dat thang sinh", reg_day, ">>", "<<");
            }
        }
        case DLG_REG_YEAR:
        {
            if (response)
            {
                Character[playerid][char_Birthday][2] = 2010 - listitem;
                SendClientMessage(playerid, -1, "[!] Cai dat ngay sinh nhan vat thanh cong");
                HienTextdraw(playerid, "~g~Cai dat ngay sinh nhan vat thanh cong", 3000);

				new format_txd[1280];
                format(format_txd, 1280, "%d-%d-%d", Character[playerid][char_Birthday][0], Character[playerid][char_Birthday][1], Character[playerid][char_Birthday][2]);
                PlayerTextDrawSetString(playerid, RegisterPTD[playerid][13], format_txd);
            }
            else
            {
                new reg_day[1280], fm_reg[1280];
                for (new i = 2010 ; i > 1980 ; i--)
                {
                    format(fm_reg, sizeof(fm_reg), "%d\n", i);
                    strcat(reg_day, fm_reg);
                }
                strcat(reg_day, "1980");
                ShowPlayerDialog(playerid, DLG_REG_YEAR, DIALOG_STYLE_LIST, "Cai dat nam sinh", reg_day, ">>", "<<");

            }
        }
        case DLG_NOTE:
        {
            if (response)
            {
                if (isnull(inputtext))
                {
                    SendClientMessage(playerid, -1, "[!] Vui long nhap mo ta nhan vat");
                    HienTextdraw(playerid, "~r~Vui long nhap mo ta nhan vat", 3000);
                }
                strcat(Character[playerid][char_Note], inputtext);
                SendClientMessage(playerid, -1, "[!] Cai dat mo ta nhan vat thanh cong");
                HienTextdraw(playerid, "~g~Cai dat mo ta nhan vat thanh cong", 3000);


                new format_txd[1280];
                format(format_txd, 1280, "%s", Character[playerid][char_Note]);
                PlayerTextDrawSetString(playerid, RegisterPTD[playerid][17], format_txd);
            }
            else
            {
                ShowPlayerDialog(playerid, DLG_NOTE, DIALOG_STYLE_INPUT, "Cai dat ( mo ta nhan vat )", "Nhap mo ta", ">>", "<<");
            }
        }
        case DLG_REFER:
        {
            format(Character[playerid][char_Refer], MAX_PLAYER_NAME, "%s", inputtext);

            new format_txd[1280];
            format(format_txd, 1280, "%s", Character[playerid][char_Refer]);
            PlayerTextDrawSetString(playerid, RegisterPTD[playerid][18], format_txd);
        }
        case DLG_NATION:
        {
            if (response)
            {
                Character[playerid][char_Nation] = 1;
                SendClientMessage(playerid, -1, "[!] Ban da cai dat quoc tinh thanh cong ( Viet Nam )");
                HienTextdraw(playerid, "~g~Ok, vat quoc tich cua ban la Viet Nam");

	            PlayerTextDrawSetString(playerid, RegisterPTD[playerid][15], "~r~Viet Nam");
            }
            else
            {
                ShowPlayerDialog(playerid, DLG_NATION, DIALOG_STYLE_LIST, "Cai dat ( quoc tich )", "Viet Nam", ">>", "<<");
            }
        }
        case DLG_GIOITINH:
        {
            if (response)
            {
                switch (listitem)
                {
                    case 0:
                    {
                        Character[playerid][char_GioiTinh] = 1;
                        SendClientMessage(playerid, -1, "Ok, vay ban la nam");
                        HienTextdraw(playerid, "~g~Ok, vay ban la nam", 3000);
						PlayerTextDrawSetString(playerid, RegisterPTD[playerid][14], "Nam");
                    }
                    case 1:
                    {
                        Character[playerid][char_GioiTinh] = 2;
                        SendClientMessage(playerid, -1, "Ok, vay ban la nu");
                        HienTextdraw(playerid, "~g~Ok, vay ban la nu", 3000);
						PlayerTextDrawSetString(playerid, RegisterPTD[playerid][14], "Nu");
                    }
                    case 2:
                    {
                        Character[playerid][char_GioiTinh] = 3;
                        SendClientMessage(playerid, -1, "Ok, vay ban la LGBT");
                        HienTextdraw(playerid, "~g~Ok, vay ban la LGBT", 3000);
						PlayerTextDrawSetString(playerid, RegisterPTD[playerid][14], "LGBT");
                    }
                }
            }
            else
            {
                ShowPlayerDialog(playerid, DLG_GIOITINH, DIALOG_STYLE_LIST, "Cai dat ( gioi tinh )", "Nam\nNu\nLGBT", ">>", "<<");
            }
        }
    }
}