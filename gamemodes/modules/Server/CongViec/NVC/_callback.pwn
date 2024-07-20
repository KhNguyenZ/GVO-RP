hook OnGameModeInit()
{
	// NPC 2749.7957,-2451.3630,13.6484,358.1701
    Create3DTextLabel("{00ff00}[TRUCKING]\n{FFFFFF}Su dung {ffff00}/layxelamviec{FFFFFF} de tim hieu.", COLOR_WHITE, 2760.9275,-2395.9385,13.6328, 30.0, 0, false); //LAYXELAMVIEC 
	Create3DTextLabel("{00ff00}[TRUCKING]\n{FFFFFF}Su dung {ffff00}Nhan Y{FFFFFF} de lay hang.", COLOR_WHITE, 2744.5603,-2425.2952,13.6286, 30.0, 0, false); // LAY HANG 
}
hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys) {
    	if ((newkeys & KEY_YES)) {
        if(IsPlayerInRangeOfPoint(playerid, 2.5, 2744.5603,-2425.2952,13.6286))
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