#define MAX_INV_PAGES 5
#define MAX_INV_ITEM 20
#define DAFAULT_INV_PAGE 0
// #define MAX_TRADE_PAGES 10
#define 		MAX_DROP_ITEMS 					1000
#define MAX_INV_TRADE 20
#define INV_MAX_ITEM 20
#define MAX_OBJECT_DROP_ITEM 3000

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

enum PlayerInventory_Info
{
	pInvItemID,
	pInvAmount
}
new PlayerInvItem[MAX_PLAYERS][MAX_INV_PAGES][PlayerInventory_Info][INV_MAX_ITEM];

enum PInventory_Info
{
	pSelectItemID,
	pCountItem,
	pTrade[MAX_INV_TRADE]
}
new PlayerInvInfo[MAX_PLAYERS][MAX_INV_PAGES][PInventory_Info];

enum Inventory_Info{
	invSlot[MAX_INV_ITEM]
}
new InventoryInfo[MAX_PLAYERS][MAX_INV_PAGES][Inventory_Info];

new CountAllItem[MAX_PLAYERS];
new PlayerPage[MAX_PLAYERS];

new TradeAllItem[MAX_PLAYERS];

enum InventoryItem_Info
{
	item_id,
	item_txd[64],
	item_name[128],
	item_usage[1280]
}
new const itemInfo[][InventoryItem_Info] = {
	{0, "", "None", "None"},
	{1, "mdl-2007:item_9mm", "Sung 9MM", "Sung ngan, su dung dan Pistol,su dung vu khi va sau do su dung hop dan."},
	{2, "mdl-2007:item_ak47", "Sung AK47", "Sung truong tu dong, su dung dan Rifle, su dung vu khi va sau do su dung hop dan."},
	{3, "mdl-2007:item_spas", "Sung Spas",  "Shotgun ban tu dong, su dung dan Shotgun, su dung vu khi va sau do su dung hop dan."},
	{4, "mdl-2007:item_waterbottle", "Nuoc Loc", "Dung de uong."},
	{5, "mdl-2007:item_mp5", "Sung MP5", "Sung tieu lien tu dong, su dung vu khi va sau do su dung hop dan."},
	{6, "mdl-2007:item_m4", "Sung M4", "Sung truong tu dong, su dung dan Rifle, su dung vu khi va sau do su dung hop dan."},
	{7, "mdl-2007:item_shotgun", "Sung Shotgun", "Sung shotgun , su dung dan Shotgun, su dung vu khi va sau do su dung hop dan."},
	{8, "mdl-2007:item_uzi", "Sung Uzi", "Sung tieu lien , nho gon , su dung cho cac nhiem vu tan cong bat ngo"},
	{9, "mdl-2007:item_tec9", "Sung Tec9", "Sung tieu lien , nho gon , su dung cho cac nhiem vu tan cong bat ngo"},
	{10, "mdl-2007:item_de", "Sung DE", "Sung luc , nho gon , sat thuong cuc lon, de dang ha guc muc tieu"},
	{11, "mdl-2007:item_smallshotgun", "Sawnoff Shotgun", "Sung shotgun loai nho , nho gon , su dung cho cac nhiem vu tan cong bat ngo"},
	{12, "mdl-2007:item_sniperRifle", "Sinper Rifle", "Sung tia, su dung cho cac nhiem vu ho tro , ban tia tam xa"},
	{13, "mdl-2007:item_tickdiscount10", "Counpon 10", "Ve giam gia 10 phan tram tai cac cua hang"},
	{14, "mdl-2007:item_tickdiscount15", "Counpon 15", "Ve giam gia 15 phan tram tai cac cua hang"},
	{15, "mdl-2007:item_tickdiscount25", "Counpon 10", "Ve giam gia 25 phan tram tai cac cua hang"},
	{16, "mdl-2007:item_dirtymoney", "Tien Ban", "Su dung de mua hang tai Black Market"},
	{17, "mdl-2007:item_cocacola", "Coca", "Dung de uong va tang the luc"},
	{18, "mdl-2007:item_sprite", "Sprite", "Dung de uong va tang the luc"},
	{19, "mdl-2007:item_pepper", "Pepper", "Dung de uong va tang the luc"},
	{20, "mdl-2007:item_prime", "Prime", "Dung de uong va tang the luc"},
	{21, "mdl-2007:driver_license", "Driver License", "Giay Phep Lai Xe"},
	{22, "mdl-2007:id_card", "CCCD", "Can Cuoc Cong Dan"},
	{23, "mdl-2007:weaponlicense", "Weapon License", "Giay phep su dung sung"}
};

new PlayerText: ItemBackground[MAX_PLAYERS][41];
// new PlayerText: TradeBackground[MAX_PLAYERS][21];

new PlayerText: btnInv[MAX_PLAYERS][4];

new PlayerText: WeightInv[MAX_PLAYERS][2];

new PlayerText: btnPage[MAX_PLAYERS][6];

new PlayerText: ItemInv[MAX_PLAYERS][MAX_INV_PAGES][MAX_INV_ITEM+1];
new PlayerText: ItemName[MAX_PLAYERS][MAX_INV_PAGES][MAX_INV_ITEM+1];

new PlayerText: TradeItem[MAX_PLAYERS][MAX_INV_TRADE];
new PlayerText: TradeName[MAX_PLAYERS][MAX_INV_TRADE];


new pSelect[MAX_PLAYERS];
new pCurrentSelect[MAX_PLAYERS];
new InvAmount[MAX_PLAYERS][MAX_INV_PAGES][MAX_INV_ITEM];

enum pInvTrade_Info{
	trade_id,
	trade_amount
}

new InvTradeInfo[MAX_PLAYERS][MAX_INV_TRADE];