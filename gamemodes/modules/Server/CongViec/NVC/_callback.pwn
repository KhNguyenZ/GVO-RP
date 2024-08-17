hook OnPlayerConnect(playerid)
{
	DangLamViec[playerid] = 0;
	XeTruck[playerid] = 0;
	hangtrenxe[playerid][0] = 0;
	hangtrenxe[playerid][1] = 0;
	hangtrenxe[playerid][2] = 0;
	hangtrenxe[playerid][3] = 0;
	hangtrentay[playerid][0] = 0;
	hangtrentay[playerid][1] = 0;
	hangtrentay[playerid][2] = 0;
	hangtrentay[playerid][3] = 0;
	LuongHang[playerid] = 0;
	SetPVarInt(playerid, "idloaihang",0);
	SetPVarInt(playerid, "giatientruck",0);
}

hook OnGameModeInit()
{
	for(new xxx = 0; xxx < 14; xxx++) {
		new string[128];
		format(string,sizeof(string), "< DIEM BAN HANG >\n\nHang Nhan: %s(Khong nhan hang khac)\nSu Dung Y De Ban Hang",ThuMuaTruck[xxx][tenhang]);
		CreateDynamic3DTextLabel(string,COLOR_GREY,KhuVucThuMua[xxx][0],KhuVucThuMua[xxx][1],KhuVucThuMua[xxx][2],10.0);
	}
	// NPC 2749.7957,-2451.3630,13.6484,358.1701
    Create3DTextLabel("{00ff00}[TRUCKING]\n{FFFFFF}Su dung {ffff00}/layxelamviec{FFFFFF} de tim hieu.", COLOR_WHITE, 2760.9275,-2395.9385,13.6328, 30.0, 0, false); //LAYXELAMVIEC 
	Create3DTextLabel("{00ff00}[TRUCKING]\n{FFFFFF}Su dung {ffff00}Nhan Y{FFFFFF} de lay hang.", COLOR_WHITE, 2780.0386,-2413.1477,13.6356, 30.0, 0, false); // LAY HANG 
}


hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {
    if(dialogid == DLG_BANHANGTRUCK) {
		if(response) {
			ClearAnimations(playerid);
    		RemovePlayerAttachedObject(playerid, 6);
			SetPlayerSpecialAction(playerid, 0);
			GivePlayerMoney(playerid, GetPVarInt(playerid, "giatientruck"));
			new young = GetPVarInt(playerid, "idloaihang");
			hangtrentay[playerid][young-1] = 0;
			SetPVarInt(playerid,"idloaihang", 0);
			SetPVarInt(playerid,"giatientruck", 0);
			LuongHang[playerid] -= 1;
		}
	}
	if(dialogid == DLG_DIEMGIAOHANG) {
		if(response){
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, KhuVucThuMua[listitem][0], KhuVucThuMua[listitem][1], KhuVucThuMua[listitem][2], 5);
			CP[playerid] = 1;
			SendClientMessage(playerid, COLOR_GREY, "Trucker Delivery: {FFFFFF}Da danh dau diem ban hang.");
		}
	}
	if(dialogid == DLG_XEMHANG) {
		if(response)
		{
			if(hangtrenxe[playerid][listitem] == 0) return true;
			switch(listitem) {
				case 0:{
					if(hangtrenxe[playerid][listitem] == 0) return true;
					LuongHang[playerid] -= 1;
					hangtrenxe[playerid][listitem] -= 1;
					hangtrentay[playerid][0] = 1;
					SetPVarInt(playerid,"idloaihang", 1);
					ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.0, 1, 1, 1, 0, 1);
	    			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
	    			SetPlayerAttachedObject(playerid, 6, 1220, 1, 0.299822, 0.663485, -0.036337, 184.311355, 90.004089, 0.000000, 1.000000, 1.000000, 1.000000 );
				}
				case 1:{
					if(hangtrenxe[playerid][listitem] == 0) return true;
					hangtrenxe[playerid][listitem] -= 1;
					hangtrentay[playerid][1] = 1;
					LuongHang[playerid] -= 1;
					SetPVarInt(playerid,"idloaihang", 2);
					ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.0, 1, 1, 1, 0, 1);
	    			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
	    			SetPlayerAttachedObject(playerid, 6, 1220, 1, 0.299822, 0.663485, -0.036337, 184.311355, 90.004089, 0.000000, 1.000000, 1.000000, 1.000000 );
				}
				case 2:{
					if(hangtrenxe[playerid][listitem] == 0) return true;
					hangtrenxe[playerid][listitem] -= 1;
					hangtrentay[playerid][2] = 1;
					LuongHang[playerid] -= 1;
					SetPVarInt(playerid,"idloaihang", 3);
					ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.0, 1, 1, 1, 0, 1);
	    			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
	    			SetPlayerAttachedObject(playerid, 6, 1220, 1, 0.299822, 0.663485, -0.036337, 184.311355, 90.004089, 0.000000, 1.000000, 1.000000, 1.000000 );
				}
                case 3:{
					if(hangtrenxe[playerid][listitem] == 0) return true;
					hangtrenxe[playerid][listitem] -= 1;
					hangtrentay[playerid][3] = 1;
					LuongHang[playerid] -= 1;
					SetPVarInt(playerid,"idloaihang", 4);
					ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.0, 1, 1, 1, 0, 1);
	    			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
	    			SetPlayerAttachedObject(playerid, 6, 1220, 1, 0.299822, 0.663485, -0.036337, 184.311355, 90.004089, 0.000000, 1.000000, 1.000000, 1.000000 );
				}
			}
		}
	}
	if(dialogid == DLG_TRUCKERGVO) {
		if(response)
		{
			if(LuongHang[playerid] == 5) return SendClientMessage(playerid, COLOR_WHITE, "Da Toi Da So Luong Cho Phep");
			if(Character[playerid][char_Cash] < giatruck[listitem]) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du tien");
			switch(listitem) {
				case 0:{
					if(hangtrentay[playerid][0] == 1 || hangtrentay[playerid][1] == 1 || hangtrentay[playerid][2] == 1 || hangtrentay[playerid][3] == 1) return true;
					new young[64];
					format(young, sizeof(young), "Trucker: Ban Da Mua 1 Thung 'Thuc An' Voi Gia $%d", giatruck[0]);
					SendClientMessage(playerid, COLOR_WHITE, young);
					GivePlayerMoney(playerid, -giatruck[0]);
					hangtrentay[playerid][0] = 1;
					ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.0, 1, 1, 1, 0, 1);
	    			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
	    			SetPlayerAttachedObject(playerid, 6, 1220, 1, 0.299822, 0.663485, -0.036337, 184.311355, 90.004089, 0.000000, 1.000000, 1.000000, 1.000000 );
				}
				case 1:{
					if(hangtrentay[playerid][0] == 1 || hangtrentay[playerid][1] == 1 || hangtrentay[playerid][2] == 1 || hangtrentay[playerid][3] == 1) return true;
					new young[64];
					format(young, sizeof(young), "Trucker: Ban Da Mua 1 Thung 'Vat Pham' Voi Gia $%d", giatruck[1]);
					SendClientMessage(playerid, COLOR_WHITE, young);
					GivePlayerMoney(playerid, -giatruck[1]);
					hangtrentay[playerid][1] = 1;
					ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.0, 1, 1, 1, 0, 1);
	    			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
	    			SetPlayerAttachedObject(playerid, 6, 1220, 1, 0.299822, 0.663485, -0.036337, 184.311355, 90.004089, 0.000000, 1.000000, 1.000000, 1.000000 );
				}
				case 2:{
					if(hangtrentay[playerid][0] == 1 || hangtrentay[playerid][1] == 1 || hangtrentay[playerid][2] == 1 || hangtrentay[playerid][3] == 1) return true;
					new young[64];
					format(young, sizeof(young), "Trucker: Ban Da Mua 1 Thung 'Quan Ao' Voi Gia $%d", giatruck[2]);
					SendClientMessage(playerid, COLOR_WHITE, young);
					GivePlayerMoney(playerid, -giatruck[2]);
					hangtrentay[playerid][2] = 1;
					ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.0, 1, 1, 1, 0, 1);
	    			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
	    			SetPlayerAttachedObject(playerid, 6, 1220, 1, 0.299822, 0.663485, -0.036337, 184.311355, 90.004089, 0.000000, 1.000000, 1.000000, 1.000000 );
				}
				case 3:{
					if(hangtrentay[playerid][0] == 1 || hangtrentay[playerid][1] == 1 || hangtrentay[playerid][2] == 1 || hangtrentay[playerid][3] == 1) return true;
					new young[64];
					format(young, sizeof(young), "Trucker: Ban Da Mua 1 Thung Hang Cam '9mm' Voi Gia $%d", giatruck[3]);
					SendClientMessage(playerid, COLOR_WHITE, young);
					GivePlayerMoney(playerid, -giatruck[3]);
					hangtrentay[playerid][3] = 1;
					ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.0, 1, 1, 1, 0, 1);
	    			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
	    			SetPlayerAttachedObject(playerid, 6, 1220, 1, 0.299822, 0.663485, -0.036337, 184.311355, 90.004089, 0.000000, 1.000000, 1.000000, 1.000000 );
				}
			}
		}
	}
	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys) {
    	if ((newkeys & KEY_YES)) {
        if(IsPlayerInRangeOfPoint(playerid, 2.5, 2780.0386,-2413.1477,13.6356))
        {
        	if(DangLamViec[playerid] == 0) return true;
			new szDialog[1024], young[124];
			strcat(szDialog, "#\tHang Hoa\tGia\n");
			format(young, sizeof(young), "0\tThuc An\t{4dad2b}$%d\n", giatruck[0]);
			strcat(szDialog, young);
			format(young, sizeof(young), "1\tVat Pham\t{4dad2b}$%d\n", giatruck[1]);
			strcat(szDialog, young);
			format(young, sizeof(young), "2\tVu Khi\t{4dad2b}$%d\n", giatruck[2]);
			strcat(szDialog, young);
			format(young, sizeof(young), "3\tXang Dau\t{4dad2b}$%d\n", giatruck[3]);
			strcat(szDialog, young);
			ShowPlayerDialog(playerid, DLG_TRUCKERGVO, DIALOG_STYLE_TABLIST_HEADERS, "Trucker", szDialog, "Chon", "Close");
			return false;
        }
    	for(new z = 0; z < 14; z++) if(IsPlayerInRangeOfPoint(playerid, 3.0, KhuVucThuMua[z][0],KhuVucThuMua[z][1],KhuVucThuMua[z][2]))
    	{
    		if(DangLamViec[playerid] == 0) return true;
        	if(hangtrentay[playerid][0] == 0 && hangtrentay[playerid][1] == 0 && hangtrentay[playerid][2] == 0 && hangtrentay[playerid][3] == 0) return true;
        	for(new i = 0; i < 14; i++){
        		if(IsPlayerInRangeOfPoint(playerid, 3.0, KhuVucThuMua[i][0],KhuVucThuMua[i][1],KhuVucThuMua[i][2])) {
        			if(GetPVarInt(playerid, "idloaihang") == ThuMuaTruck[i][loaihang]) {
        				new string[128];
        				format(string,sizeof(string), "Tai Day Chung Toi Chi Nhan Hang Voi Gia $%d, ban co chac la muon ban?", ThuMuaTruck[i][giahang]);
        				ShowPlayerDialog(playerid, DLG_BANHANGTRUCK, DIALOG_STYLE_MSGBOX, "> Ban Hang", string,"BAN LUON","HUY");
        				SetPVarInt(playerid,"giatientruck", ThuMuaTruck[i][giahang]);
        			}
        			else {
        				ShowPlayerDialog(playerid, 0, DIALOG_STYLE_MSGBOX, "> Ban Hang", "O Day Chung Toi Khong Nhan Hang Hoa Nay","OK","HUY");
        			}
        		}
        	}
        	return false;
        }
        if(DangLamViec[playerid] == 1) {
        	new Float:x, Float:y,Float:z;
        	GetVehiclePos(XeTruck[playerid],x,y,z);
        	if(!IsPlayerInRangeOfPoint(playerid, 5.0, x,y,z)) return true;
        	if(hangtrentay[playerid][0] == 1)
        	{
        		hangtrenxe[playerid][0] += 1;
        		hangtrentay[playerid][0] = 0;
        		ClearAnimations(playerid);
        		RemovePlayerAttachedObject(playerid, 6);
				SetPlayerSpecialAction(playerid, 0);
				LuongHang[playerid] += 1;
				SetPVarInt(playerid,"idloaihang", 0);
				SendClientMessage(playerid, COLOR_GREY, "Trucker Delivery: {FFFFFF}Ban da chat hang len xe, su dung lenh '/xemhang' de xem hang");
        	}
        	if(hangtrentay[playerid][1] == 1){
        		hangtrenxe[playerid][1] += 1;
        		hangtrentay[playerid][1] = 0;
        		ClearAnimations(playerid);
        		RemovePlayerAttachedObject(playerid, 6);
				SetPlayerSpecialAction(playerid, 0);
				LuongHang[playerid] += 1;
				SetPVarInt(playerid,"idloaihang", 0);
				SendClientMessage(playerid, COLOR_GREY, "Trucker Delivery: {FFFFFF}Ban da chat hang len xe, su dung lenh '/xemhang' de xem hang");
        	}
        	if(hangtrentay[playerid][2] == 1){
        		hangtrenxe[playerid][2] += 1;
        		hangtrentay[playerid][2] = 0;
        		ClearAnimations(playerid);
        		RemovePlayerAttachedObject(playerid, 6);
				SetPlayerSpecialAction(playerid, 0);
				SetPVarInt(playerid,"idloaihang", 0);
				LuongHang[playerid] += 1;
				SendClientMessage(playerid, COLOR_GREY, "Trucker Delivery: {FFFFFF}Ban da chat hang len xe, su dung lenh '/xemhang' de xem hang");
        	}
            if(hangtrentay[playerid][3] == 1){
        		hangtrenxe[playerid][3] += 1;
        		hangtrentay[playerid][3] = 0;
        		ClearAnimations(playerid);
        		RemovePlayerAttachedObject(playerid, 6);
				SetPlayerSpecialAction(playerid, 0);
				SetPVarInt(playerid,"idloaihang", 0);
				LuongHang[playerid] += 1;
				SendClientMessage(playerid, COLOR_GREY, "Trucker Delivery: {FFFFFF}Ban da chat hang len xe, su dung lenh '/xemhang' de xem hang");
        	}
        	return false;
        }
	}
}