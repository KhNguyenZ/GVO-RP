#include <YSI\y_hooks>

hook OnPlayerConnect(playerid)
{
	PlayerPage[playerid] = 1;
	return 1;
}
func:LoadInventoryDrop()
{
	mysql_tquery(Handle(), "SELECT * FROM `inventory_drop`", "OnLoadDropInv", "");
	return 1;
}
hook OnPlayerKeyStateChange(playerid, KEY:newkeys, KEY:oldkeys)
{
	if(newkeys == KEY_CTRL_BACK)
	{
		PickDropBox(playerid);
	}
}
InvClick(playerid, PlayerText:playertextid)
{
	for(new i = 0; i < 21; i++)
	{
		if(playertextid == ItemBackground[playerid][i]){
			new invSlotClick[MAX_PLAYERS];
			invSlotClick[playerid] = InventoryInfo[playerid][PlayerPage[playerid]][invSlot][i];
			// pSelect[playerid] = PlayerInvInfo[playerid][PlayerPage[playerid]][pSelectItemID];

			if(invSlotClick[playerid] != 0)
			{
				pCurrentSelect[playerid] = PlayerInvInfo[playerid][PlayerPage[playerid]][pSelectItemID];
				if(pCurrentSelect[playerid] > 0)
				{
					PlayerTextDrawColor(playerid, ItemInv[playerid][PlayerPage[playerid]][pCurrentSelect[playerid]-1], -1);
					ReloadPlayerTextDraw(playerid, ItemInv[playerid][PlayerPage[playerid]][pCurrentSelect[playerid]-1]);
				}

				PlayerInvInfo[playerid][PlayerPage[playerid]][pSelectItemID] = i;
				pSelect[playerid] = PlayerInvInfo[playerid][PlayerPage[playerid]][pSelectItemID];
				PlayerSelectItem(playerid, 1);

				if(pCurrentSelect[playerid] == pSelect[playerid]) { // Cancel Select
					
					PlayerTextDrawColor(playerid, ItemInv[playerid][PlayerPage[playerid]][pCurrentSelect[playerid]-1], -1);
					ReloadPlayerTextDraw(playerid, ItemInv[playerid][PlayerPage[playerid]][pCurrentSelect[playerid]-1]);

					PlayerInvInfo[playerid][PlayerPage[playerid]][pSelectItemID] = 0;
					pCurrentSelect[playerid] = 0;
				}
			}
		}
	}
	if(playertextid == btnInv[playerid][0])
	{
		new pSelectID[MAX_PLAYERS];
		pSelectID[playerid] = PlayerInvInfo[playerid][PlayerPage[playerid]][pSelectItemID];
		new invSlotClick[MAX_PLAYERS];
		invSlotClick[playerid] = InventoryInfo[playerid][PlayerPage[playerid]][invSlot][pSelectID[playerid]];

		UseItem(playerid, itemInfo[invSlotClick[playerid]][item_id]);
		HidePlayerIndexInv(playerid);
		// printf("Use | pSelect: %d\n",PlayerInvInfo[playerid][PlayerPage[playerid]][pSelectItemID]);
	}
	if(playertextid == btnPage[playerid][0])
	{
		if(PlayerPage[playerid] > 1)
		{
			PlayerPage[playerid] -=1;
			HidePlayerIndexInv(playerid);
			ReloadInv(playerid);
		}
	}
	if(playertextid == btnInv[playerid][3])
	{
		new pSelectID[MAX_PLAYERS];
		pSelectID[playerid] = PlayerInvInfo[playerid][PlayerPage[playerid]][pSelectItemID];
		new invSlotClick[MAX_PLAYERS];
		invSlotClick[playerid] = InventoryInfo[playerid][PlayerPage[playerid]][invSlot][pSelectID[playerid]];

		new szInfoInv[1280];
		format(szInfoInv, sizeof(szInfoInv), 
		"\\cThong Tin Vat Pham \n\
		\\cTen: %s \n\
		\\cSo luong: %d \n\
		\\cHuong dan su dung: %s",
		itemInfo[invSlotClick[playerid]][item_name],
		InvAmount[playerid][PlayerPage[playerid]][pSelectID[playerid]-1],
		itemInfo[invSlotClick[playerid]][item_usage]);
		ShowPlayerDialog(playerid, 10000, DIALOG_STYLE_MSGBOX, "Thong tin vat pham", szInfoInv, "OK", "");
	}
	if(playertextid == btnPage[playerid][1])
	{
		if(PlayerPage[playerid] >= 0 && PlayerPage[playerid] < GetPlayerPage(playerid)+1)
		{
			PlayerPage[playerid] +=1;
			HidePlayerIndexInv(playerid);
			ReloadInv(playerid);
		}
	}
	if(playertextid == btnInv[playerid][1])
	{
		new pSelectID[MAX_PLAYERS];
		pSelectID[playerid] = PlayerInvInfo[playerid][PlayerPage[playerid]][pSelectItemID];

		DestroyInvItem(playerid, PlayerPage[playerid], pSelectID[playerid]-1);
	}
	return 1;
}


forward OnInvDropItem(playerid, itemid, amount);
public OnInvDropItem(playerid, itemid, amount)
{
	new invlog[1280];
	format(invlog, sizeof(invlog), "%s da vut %s (Amount: %d)", player_get_name(playerid),itemInfo[itemid][item_name], amount);
	Log("dropitem.log", invlog);
	return 1;
}

forward OnLoadPlayerInventory(playerid);
public OnLoadPlayerInventory(playerid)
{
	if(cache_num_rows() > 0)
	{
		new pinvpage = PlayerPage[playerid], countitem[MAX_PLAYERS] = 0;
		for(new i = 0; i < cache_num_rows(); i++)
		{
			if(i > 19*pinvpage) {
				pinvpage++;
				countitem[playerid] = 0;
			}

			cache_get_value_name_int(i,  "item", PlayerInvItem[playerid][pinvpage][pInvItemID][countitem[playerid]]);
			cache_get_value_name_int(i,  "amount", PlayerInvItem[playerid][pinvpage][pInvAmount][countitem[playerid]]);
			countitem[playerid]++;
		}
	}
}
forward OnPlayerAddItem(playerid);
public OnPlayerAddItem(playerid)
{
	ReLoadPlayerInventory(playerid);
}

forward OnLoadDropInv();
public OnLoadDropInv()
{
	for(new i = 0; i < cache_num_rows(); i++)
	{
		
		cache_get_value_name_int(i, "id", DropItemInfo[i][d_id]);
		cache_get_value_name_int(i, "item", DropItemInfo[i][d_itemid]);
		cache_get_value_name_int(i, "amount", DropItemInfo[i][d_amount]);
		cache_get_value_name_int(i, "uid", DropItemInfo[i][d_uid]);
		
		cache_get_value_name_float(i, "posx", DropItemInfo[i][d_pos][0]);
		cache_get_value_name_float(i, "posy", DropItemInfo[i][d_pos][1]);
		cache_get_value_name_float(i, "posz", DropItemInfo[i][d_pos][2]);

		CreateDropObject(DropItemInfo[i][d_id], DropItemInfo[i][d_itemid],DropItemInfo[i][d_amount],DropItemInfo[i][d_pos][0],DropItemInfo[i][d_pos][1],DropItemInfo[i][d_pos][2]);
	}
	new load_msg[128];
	format(load_msg, sizeof(load_msg),"Da load thanh cong %d DropBox", cache_num_rows());
	LogConsole(load_msg, "SQL");
}


forward OnPlayerPickDropBox(playerid);
public OnPlayerPickDropBox(playerid)
{
	new PickDropBox_msg[1280];
	new dropid = GetPVarInt(playerid, #DropBoxID);
	new 
		itemid = DropItemInfo[dropid][d_itemid],
		amount = DropItemInfo[dropid][d_amount],
		sqlid  = DropItemInfo[dropid][d_id]; 
	if(GetPVarInt(playerid, #PickingTime) > 0)
	{
		if(PickingDropBox[playerid] == 0) return KillTimer(PickTimer[playerid]);

		ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, 0, 1);

		format(PickDropBox_msg, sizeof(PickDropBox_msg), "~y~Thoi gian nhat con ~g~%d~y~ giay nua !",GetPVarInt(playerid, #PickingTime));
		HienTextdraw(playerid, PickDropBox_msg, 800);

		SetPVarInt(playerid, #PickingTime, GetPVarInt(playerid, #PickingTime)-1);


		PickTimer[playerid] = SetTimerEx("OnPlayerPickDropBox", 1000, 0, "iii", playerid,  itemid, amount);
	}
	else {

		AddPlayerItem(playerid, itemid, amount);
		format(PickDropBox_msg, sizeof(PickDropBox_msg), "Ban da nhan duoc vat pham %s , so luong la %d", itemInfo[itemid][item_name], amount);
		SendClientMessage(playerid, -1, PickDropBox_msg);
		HienTextdraw(playerid, PickDropBox_msg, 5000);
		PickingDropBox[playerid] = 0;
		DeletePVar(playerid, #PickingTime);

		new drop_query[1280];
		format(drop_query, sizeof(drop_query), "DELETE FROM `inventory_drop` WHERE `id` = '%d'",DropItemInfo[dropid][d_id]);
		printf("%s", drop_query);
		mysql_tquery(Handle(), drop_query, "OnDeleteDropItem", "");

		DestroyDynamicObject(DropItemInfo[sqlid][d_object]);
		DestroyDynamic3DTextLabel(DropItemInfo[sqlid][d_label]);

		KillTimer(PickTimer[playerid]);
	}
	return 1;
}