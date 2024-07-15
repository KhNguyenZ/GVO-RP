#include <YSI_Coding\y_hooks>

/* DIALOG */
#define DLG_BANHANGTRUCK 20
#define DLG_XEMHANG 21
#define DLG_DIEMGIAOHANG 22
#define DLG_TRUCKERGVO 23

new giatruck[4],hangtrentay[MAX_PLAYERS][4],hangtrenxe[MAX_PLAYERS][4], XeTruck[MAX_PLAYERS], DangLamViec[MAX_PLAYERS], LuongHang[MAX_PLAYERS], Text3D:textvehicletruck[MAX_VEHICLES];

enum thumuaenum
{
	idhang,
	giahang,
	tenhang[24],
	KhuVuc[24],
	loaihang
};

new ThuMuaTruck[14][thumuaenum] = {
	{1,500, "Thuc An", "Los Santos",1},
	{2,500, "Thuc An", "Los Santos",1},
	{3,500, "Thuc An", "San Fierro",1},
	{4,500, "Thuc An", "Los Santos",1},
	{5,500, "Vat Pham", "Los Santos",2},
	{6,500, "Vat Pham", "San Fierro",2},
	{7,500, "Vat Pham", "Los Santos",2},
	{8,500, "Vat Pham", "Los Santos",2},
	{9,500, "Quan Ao", "Los Santos",3},
	{10,500, "Quan Ao", "San Fierro",3},
	{11,500, "Quan Ao", "Los Santos",3},
 	{12,500, "Quan Ao", "Los Santos",3},
 	{13,1000, "9mm", "San Fierro",4},
 	{14,1000, "9mm", "San Fierro",4}
};

new Float:KhuVucThuMua[14][3] = {
	{2403.2021,-1491.8057,24.0000},
	{2125.3787,-1803.1359,13.5547},
	{-1912.40,827.89,35.22},
	{1183.8794,-891.5706,43.2536},
	{1669.0544,-1583.2032,13.5469},
	{-2442.62,755.03,35.17},
	{1342.4152,-1770.9044,13.5004},
	{1327.2202,-877.1736,39.5781},
	{491.9594,-1361.5198,17.4150},
	{-1702.70,950.70,24.89},
	{2251.3237,-1666.5189,15.4766},
	{456.1948,-1486.8076,31.0830},
	{-2134.5537,281.8395,35.2781},
	{-2620.5896,1413.3735,7.0938}
};

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
	if(dialogid == DLG_DIEMGIAOHANG) {
		if(response){
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, KhuVucThuMua[listitem][0], KhuVucThuMua[listitem][1], KhuVucThuMua[listitem][2], 5);
			CP[playerid] = 1;
			SendClientMessage(playerid, COLOR_GREY, "Trucker Delivery: {FFFFFF}Da danh dau diem ban hang.");
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