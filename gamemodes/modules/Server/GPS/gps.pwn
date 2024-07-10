#define daxogdeodaumacodialog 10000
CMD:map(playerid, params[])
{
   return ShowPlayerDialog(playerid, daxogdeodaumacodialog, DIALOG_STYLE_LIST, "GPS ","CONG VIEC\nTIM DUONG\nATM\nDoor\nHouse\nBiz", "Chon", "Huy bo");
}
