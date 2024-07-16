CMD:diemgiaohang(playerid, params[]) {
	new string[500],szDialog[500];
	strcat(szDialog,"#\tLoai\tKhu Vuc\tKhoang Cach\n");
	for(new i = 0; i < 14; i++)

	{
		format(string,sizeof(string), "%d\t%s\t%s\t%0.1fm\n",ThuMuaTruck[i][idhang],ThuMuaTruck[i][tenhang],ThuMuaTruck[i][KhuVuc],GetPlayerDistanceFromPoint(playerid, KhuVucThuMua[i][0],KhuVucThuMua[i][1],KhuVucThuMua[i][2]));
		strcat(szDialog, string);
	}
	ShowPlayerDialog(playerid, DLG_DIEMGIAOHANG, DIALOG_STYLE_TABLIST_HEADERS, "Dia Diem Giao Hang",szDialog,"Den", "Huy");
	return true;
}
CMD:reloadgiathumua(playerid, params[]) {
	if (!CheckAdmin(playerid, 2))
	for(new i = 0; i < 14; i++)
    {
		new rand = 150 + random(450);
		ThuMuaTruck[i][giahang] = rand;
		if(i == 12) ThuMuaTruck[12][giahang] = 190 + rand;
		if(i == 13) ThuMuaTruck[13][giahang] = 190 + rand;
	}
	new gString[64];
	format(gString, 120, "Trucker Admin: %s da reload gia thu mua cua trucker.", GetPlayerNameEx(playerid));
	foreach(new i: Player)
	{
	    if (!CheckAdmin(playerid, 2))
	    {
	        SendClientMessage(i, COLOR_RED, gString);
	    }
	}
	SendClientMessageToAll(COLOR_GREY, "Trucker Delivery: {FFFFFF}Cac Cua Hang Da Thay Doi Gia Thu Mua");
	return true;
}
CMD:chinhgiatruck(playerid, params[]) {
	if (!CheckAdmin(playerid, 2))
		return true;

	new type, value;
	if(sscanf(params, "iii", type, value)) {
		SendClientMessage(playerid, COLOR_GREY, "Su Dung: {FFFFFF}/chinhgiatruck [Loai] [Gia]");
		SendClientMessage(playerid, COLOR_WHITE, "Thuc An (0) | Vat Pham (1) | Quan Ao (2) | 9mm (3)");
		return true;
	}

	giatruck[type] = value;

	new NameTruck[64];
	switch(type) {
		case 0: NameTruck = "Thuc An";
		case 1: NameTruck = "Vat Pham";
		case 2: NameTruck = "Quan Ao";
		case 3: NameTruck = "9mm";
	}
	new gString[64];
	format(gString, 120, "Trucker Admin: %s da thay doi gia cua %s thanh %d.", GetPlayerNameEx(playerid), NameTruck , value);
	foreach(new i: Player)
	{
	    if (!CheckAdmin(playerid, 2))
	    {
	        SendClientMessage(i, COLOR_RED, gString);
	    }
	}
	return true;
}
CMD:xemhang(playerid, params[]) {
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_RED, "VUI LONG XUONG XE!");
	if(DangLamViec[playerid] == 0) return true;
	if(hangtrentay[playerid][0] == 1 || hangtrentay[playerid][1] == 1 || hangtrentay[playerid][2] == 1) return true;
	//new Float:X, Float:Y, Float:Z;
    //GetVehiclePos(XeTruck[playerid], X, Y, Z);
	if(IsPlayerInRangeOfPoint(playerid, 4.0,  X, Y, Z)) {
		new szDialog[512], string[512];
		strcat(szDialog, "#\tHang Hoa\tSo Luong\n");
		format(string, sizeof(string), "1\tThuc An\t%d\n", hangtrenxe[playerid][0]);
		strcat(szDialog, string);
		format(string, sizeof(string), "2\tVat Pham\t%d\n", hangtrenxe[playerid][1]);
		strcat(szDialog, string);
		format(string, sizeof(string), "3\tQuan Ao\t%d\n", hangtrenxe[playerid][2]);
		strcat(szDialog, string);
		format(string, sizeof(string), "4\t9mm\t%d\n", hangtrenxe[playerid][3]);
		strcat(szDialog, string);
		ShowPlayerDialog(playerid, DLG_XEMHANG, DIALOG_STYLE_TABLIST_HEADERS, "Hang Hoa", szDialog, "Lay", "Huy bo");
	}
	return true;
}
CMD:layxelamviec(playerid, params[]) {
	if(DangLamViec[playerid] == 1) return SendClientMessage(playerid, COLOR_GREY, "Xe Cua Ban Van Con O Dau Do Ngoai Kia.");
	new rand = random(4);
	if(!IsPlayerInRangeOfPoint(playerid, 5.0, -1547.13,125.99,3.55)) return true;
	switch(rand) {
		case 0: XeTruck[playerid] = CreateVehicle(414, -1572.34008789,129.09317017,3.69948244,225.00000000, 1, 1,-1);
		case 1: XeTruck[playerid] = CreateVehicle(414, -1591.30224609,109.38220215,3.79948235,225.00000000, 1, 1,-1);
		case 2: XeTruck[playerid] = CreateVehicle(414, -1595.57812500,105.83326721,3.79948235,225.00000000, 1, 1,-1);
		case 3: XeTruck[playerid] = CreateVehicle(414, -1599.55334473,102.00447845,3.79948235,225.00000000, 1, 1,-1);
	}
	new string[64];
	format(string,sizeof(string),"Trucker Delivery\nPhuong Tien Cua %s", GetPlayerNameEx(playerid));
	textvehicletruck[XeTruck[playerid]] = Create3DTextLabel(string, 0xFFFFFFFF, 0.0, 0.0, 0.0, 50.0, 0, 1 );
	Attach3DTextLabelToVehicle(textvehicletruck[XeTruck[playerid]] , XeTruck[playerid], 0.0, 0.0, 0.7);
	PutPlayerInVehicle(playerid, XeTruck[playerid], 0);
	DangLamViec[playerid] = 1;
	return true;
}
CMD:dungviec(playerid, params[]) {
	if(DangLamViec[playerid] == 0) return true;
	DangLamViec[playerid] = 0;
	DestroyVehicle(XeTruck[playerid]);
	XeTruck[playerid] = 0;
	hangtrenxe[playerid][0] = 0;
	hangtrenxe[playerid][1] = 0;
	hangtrenxe[playerid][2] = 0;
	hangtrentay[playerid][0] = 0;
	hangtrentay[playerid][1] = 0;
	hangtrentay[playerid][2] = 0;
	LuongHang[playerid] = 0;
	SetPVarInt(playerid, "idloaihang",0);
	SetPVarInt(playerid, "giatientruck",0);
	ClearAnimations(playerid);
	RemovePlayerAttachedObject(playerid, 6);
	SetPlayerSpecialAction(playerid, 0);
	SendClientMessage(playerid, COLOR_WHITE, "Da Dung Lai Cong Viec Trucker!");
	return true;
}