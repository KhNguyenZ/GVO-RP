#include <YSI\YSI_Coding\y_hooks>

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