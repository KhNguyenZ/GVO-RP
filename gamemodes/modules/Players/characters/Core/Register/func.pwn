
func:ShowPlayerMenuRegister(playerid)
{
	SetPVarInt(playerid, "SetupRegister_", 1);
	SelectTextDraw(playerid, -1);
	for(new reg_loop = 0 ; reg_loop < 8; reg_loop++)
	{
		PlayerTextDrawShow(playerid, RegisterPTD[playerid][reg_loop]);
	}
	for(new reg_loop = 13 ; reg_loop < 19; reg_loop++)
	{
		PlayerTextDrawShow(playerid, RegisterPTD[playerid][reg_loop]);
	}
	return 1;
}
func:HidePlayerMenuRegister(playerid)
{
	CancelSelectTextDraw(playerid);
	for(new reg_loop = 0; reg_loop < 19; reg_loop++)
	{
		PlayerTextDrawHide(playerid, RegisterPTD[playerid][reg_loop]);
	}
	return 1;
}
func:ShowPlayerMenuSkin(playerid)
{
	for(new reg_loop = 8 ; reg_loop < 14; reg_loop++)
	{
		PlayerTextDrawShow(playerid, RegisterPTD[playerid][reg_loop]);
	}
}
func:HidePlayerMenuSkin(playerid)
{
	for(new reg_loop = 8 ; reg_loop < 14; reg_loop++)
	{
		PlayerTextDrawHide(playerid, RegisterPTD[playerid][reg_loop]);
	}
}

func:RegMenuClick(playerid, PlayerText:playertextid)
{
	if(playertextid == RegisterPTD[playerid][1]) // ngay sinh
	{
		new reg_day[1280], fm_reg[1280];
		for(new i = 1 ; i < 31 ; i++)
		{
			format(fm_reg, sizeof(fm_reg), "%d\n", i);
			strcat(reg_day, fm_reg);
		}
		strcat(reg_day, "31");
		ShowPlayerDialog(playerid, DLG_REG_DAY, DIALOG_STYLE_LIST, "Cai dat ngay sinh", reg_day, ">>", "<<");
	}
	if(playertextid == RegisterPTD[playerid][2]) // gioi tinh
	{
		ShowPlayerDialog(playerid, DLG_GIOITINH, DIALOG_STYLE_LIST, "Cai dat ( gioi tinh )", "Nam\nNu\nLGBT", ">>", "<<");
	}
	if(playertextid == RegisterPTD[playerid][3]) // quoc tich
	{
		ShowPlayerDialog(playerid, DLG_NATION, DIALOG_STYLE_LIST, "Cai dat ( quoc tich )", "Viet Nam", ">>", "<<");
	}
	if(playertextid == RegisterPTD[playerid][4]) // skin
	{
		ShowPlayerMenuSkin(playerid);
		SetPVarInt(playerid, "SelectSkin_", 1);
	}
	if(playertextid == RegisterPTD[playerid][10]) // lui 
	{
		if(CharSkinSelect[playerid] > 1)
		{
			CharSkinSelect[playerid]-=1;
			PlayerTextDrawSetPreviewModel(playerid, RegisterPTD[playerid][12], CharSkinSelect[playerid]);
			ReloadPlayerTextDraw(playerid, RegisterPTD[playerid][12]);
		}
		else{
			SendClientMessage(playerid, -1, "Ban khong the thuc hien thao tac");
			HienTextdraw(playerid, "Ban khong the thuc hien thao tac", 3000);
		}
	}
	if(playertextid == RegisterPTD[playerid][11]) // toi 
	{
		if(CharSkinSelect[playerid] < 300)
		{
			CharSkinSelect[playerid]+=1;
			PlayerTextDrawSetPreviewModel(playerid,RegisterPTD[playerid][12], CharSkinSelect[playerid]);
			ReloadPlayerTextDraw(playerid, RegisterPTD[playerid][12]);
		}
		else{
			SendClientMessage(playerid, -1, "Ban khong the thuc hien thao tac");
			HienTextdraw(playerid, "Ban khong the thuc hien thao tac", 3000);
		}
	}

	if(playertextid == RegisterPTD[playerid][9])
	{
		if(GetPVarInt(playerid, "SelectSkin_")==1)
		{
			Character[playerid][char_Skin] = CharSkinSelect[playerid];
			SendClientMessage(playerid, -1, "[!] Cai dat thanh cong");
			HienTextdraw(playerid, "~g~Cai dat skin thanh cong", 3000);
			HidePlayerMenuSkin(playerid);
			DeletePVar(playerid, "SelectSkin_");
		}
	}
	if(playertextid == RegisterPTD[playerid][5])
	{
		if(GetPVarInt(playerid, "SelectSkin_")==0)
		{
			ShowPlayerDialog(playerid, DLG_NOTE, DIALOG_STYLE_INPUT, "Cai dat ( mo ta nhan vat )", "Nhap mo ta", ">>", "<<");
		}
		else{
			SendClientMessage(playerid, -1, "[!] Ban dang chon skin , khong the thuc hien thao tac khac");
			HienTextdraw(playerid, "~r~Ban dang chon skin , khong the thuc hien thao tac khac", 3000);
		}
	}
	if(playertextid == RegisterPTD[playerid][6])
	{
		if(GetPVarInt(playerid, "SelectSkin_")==0)
		{
			ShowPlayerDialog(playerid, DLG_REFER, DIALOG_STYLE_INPUT, "Cai dat ( nguoi gioi thieu )", "Nhap ten: (VD: Khoi_Nguyen) \nLuu y:Khong bat buoc nhap", ">>", "<<");
		}
		else{
			SendClientMessage(playerid, -1, "[!] Ban dang chon skin , khong the thuc hien thao tac khac");
			HienTextdraw(playerid, "~r~Ban dang chon skin , khong the thuc hien thao tac khac", 3000);
		}
	}
	if(playertextid == RegisterPTD[playerid][7])
	{
		if(isnull(Character[playerid][char_Note])) SendClientMessage(playerid, -1, "[!] Ban chua cai dat mo ta nhan vat");
		if(Character[playerid][char_Birthday][0] <= 0 || Character[playerid][char_Birthday][1] <= 0 || Character[playerid][char_Birthday][2] <= 0) SendClientMessage(playerid, -1, "[!] Ban chua cai dat tuoi");
		if(Character[playerid][char_GioiTinh]!=1 && Character[playerid][char_GioiTinh]!=2 && Character[playerid][char_GioiTinh]!=3) SendClientMessage(playerid, -1, "[!] Ban chua cai dat gioi tinh");
		if(Character[playerid][char_Nation] != 1) SendClientMessage(playerid, -1, "[!] Ban chua cai dat quoc tich");
		if(Character[playerid][char_Skin] == 0) SendClientMessage(playerid, -1, "[!] Ban chua cai dat skin");
		new query_reg[1280];
		mysql_format(Handle(), query_reg, sizeof(query_reg), "UPDATE `players` SET \
			`BirthDay` = '%d', \
			`BirthMonth` = '%d', \
			`BirthYear` = '%d', \
			`Gender` = '%d', \
			`QuocTich` = '%d',\
			`Skin` = '%d', `Note` = '%s' WHERE `PlayerName` = '%s'",
			Character[playerid][char_Birthday][0],
			Character[playerid][char_Birthday][1],
			Character[playerid][char_Birthday][2],
			Character[playerid][char_GioiTinh],
			Character[playerid][char_Nation],
			Character[playerid][char_Skin],
			Character[playerid][char_Note],
			player_get_name(playerid, false));
		new Cache:UpdateCache;
		UpdateCache = mysql_query(Handle(), query_reg);
		SendClientMessage(playerid, -1, "Hoan tat cai dat");
		HidePlayerMenuRegister(playerid);
		
		new query[240];
		format(query, sizeof(query), "SELECT * FROM `players` WHERE `AccID` = '%s'", Character[playerid][char_account_id]);
		mysql_tquery(Handle(), query, "OnCharacterLoad", "i", playerid);

		print(query_reg);
		cache_delete(UpdateCache);


		SetSpawnInfo(playerid, 0, Character[playerid][char_Skin], 1754.7391,-1895.4344,13.5870,0,0, 0,0, 0,0, 0);
		PlayerSetupping[playerid] = 0;
		OnPlayerLoad(playerid);
	}
}