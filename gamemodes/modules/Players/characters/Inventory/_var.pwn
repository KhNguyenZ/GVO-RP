#define INV_MAX_ITEM 1000
#define INV_PER_PAGE 25
#define MAX_OBJECT_DROP_ITEM 3000
#define 		MAX_DROP_ITEMS 					1000
#define DIALOG_REQUEST_TRADE 534
#define DIALOG_AMOUNT_TRADE 535
#define DIALOG_FINISH_TRADE 536

enum InventoryItem_Info
{
	item_id,
	item_txd[64],
	item_name[128],
	item_usage[1280],
    item_weight
}
new PlayerText:MainInv[MAX_PLAYERS][74];

new const itemInfo[][InventoryItem_Info] = {
	{0, "", "None", "None", 0},
	{1, "mdl-2007:item_9mm", "Sung 9MM", "Sung ngan, su dung dan Pistol,su dung vu khi va sau do su dung hop dan.", 700},
	{2, "mdl-2007:item_ak47", "Sung AK47", "Sung truong tu dong, su dung dan Rifle, su dung vu khi va sau do su dung hop dan.",3470},
	{3, "mdl-2007:item_spas", "Sung Spas",  "Shotgun ban tu dong, su dung dan Shotgun, su dung vu khi va sau do su dung hop dan.", 4400},
	{4, "mdl-2007:item_waterbottle", "Nuoc Loc", "Dung de uong.", 300},
	{5, "mdl-2007:item_mp5", "Sung MP5", "Sung tieu lien tu dong, su dung vu khi va sau do su dung hop dan.",2540},
	{6, "mdl-2007:item_m4", "Sung M4", "Sung truong tu dong, su dung dan Rifle, su dung vu khi va sau do su dung hop dan.",2880},
	{7, "mdl-2007:item_shotgun", "Sung Shotgun", "Sung shotgun , su dung dan Shotgun, su dung vu khi va sau do su dung hop dan.", 3250},
	{8, "mdl-2007:item_uzi", "Sung Uzi", "Sung tieu lien , nho gon , su dung cho cac nhiem vu tan cong bat ngo",3500},
	{9, "mdl-2007:item_tec9", "Sung Tec9", "Sung tieu lien , nho gon , su dung cho cac nhiem vu tan cong bat ngo", 1200},
	{10, "mdl-2007:item_de", "Sung DE", "Sung luc , nho gon , sat thuong cuc lon, de dang ha guc muc tieu", 2000},
	{11, "mdl-2007:item_smallshotgun", "Sawnoff Shotgun", "Sung shotgun loai nho , nho gon , su dung cho cac nhiem vu tan cong bat ngo", 2700},
	{12, "mdl-2007:item_sniperRifle", "Sinper Rifle", "Sung tia, su dung cho cac nhiem vu ho tro , ban tia tam xa",5},
	{13, "mdl-2007:item_tickdiscount10", "Counpon 10", "Ve giam gia 10 phan tram tai cac cua hang", 50},
	{14, "mdl-2007:item_tickdiscount15", "Counpon 15", "Ve giam gia 15 phan tram tai cac cua hang", 50},
	{15, "mdl-2007:item_tickdiscount25", "Counpon 10", "Ve giam gia 25 phan tram tai cac cua hang", 50},
	{16, "mdl-2007:item_dirtymoney", "Tien Ban", "Su dung de mua hang tai Black Market", 10},
	{17, "mdl-2007:item_cocacola", "Coca", "Dung de uong va tang the luc", 300},
	{18, "mdl-2007:item_sprite", "Sprite", "Dung de uong va tang the luc", 300},
	{19, "mdl-2007:item_pepper", "Pepper", "Dung de uong va tang the luc", 300},
	{20, "mdl-2007:item_prime", "Prime", "Dung de uong va tang the luc", 300},
	{21, "mdl-2007:driver_license", "Driver License", "Giay Phep Lai Xe",   100},
	{22, "mdl-2007:id_card", "CCCD", "Can Cuoc Cong Dan", 100},
	{23, "mdl-2007:weaponlicense", "Weapon License", "Giay phep su dung sung", 100}
};

enum PlayerInventory_Info
{
    pInv_ID,
	pInv_ItemID,
	pInv_Amount,
	pInv_SQLID
}
new PlayerInvItem[MAX_PLAYERS][PlayerInventory_Info][INV_MAX_ITEM];
enum InvUI_Info{
    PlayerText:Inv_ItemTD,
    Inv_ItemID
}
new PlayerInvUI[MAX_PLAYERS][InvUI_Info][50];


enum TradeUI_Info{
    PlayerText:Trade_ItemTD,
    Trade_ItemID
}
new PlayerTradeUI[MAX_PLAYERS][TradeUI_Info][50];

enum DropItem_Info{
	d_object,
	Text3D:d_label,
	d_id,
	d_uid,
	d_itemid,
	d_amount,
	d_time[128],
	Float:d_pos[3]
}
new DropItemInfo[MAX_DROP_ITEMS][DropItem_Info];

new PickingDropBox[MAX_PLAYERS];
new PickTimer[MAX_PLAYERS];

new PlayerPage[MAX_PLAYERS];

new Player_SelectID[MAX_PLAYERS];

enum Inv_Action_Data{
    inv_Selected,
    inv_SelectID,
    inv_SelectSQLID
}

new Inv_Action[MAX_PLAYERS][Inv_Action_Data];

new TradeTimer[MAX_PLAYERS];
new TradeResponse[MAX_PLAYERS];
new PlayerTrade[MAX_PLAYERS];

enum Trade_Data{
	t_ItemID,
	t_Amount
}
new TradeInfo[MAX_PLAYERS][Trade_Data][25];

new FinishTrade[MAX_PLAYERS][2];

new FinishTimer[MAX_PLAYERS];