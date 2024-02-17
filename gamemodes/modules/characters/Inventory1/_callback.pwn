#include <YSI\y_hooks>


hook OnPlayerConnect(playerid)
{
	PlayerPage[playerid] = 1;
	mysql_tquery(Handle(), "SELECT * FROM `inventory_drop`", "OnLoadDropInv", "");
	return 1;
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


forward OnLoadDropInv(playerid);
public OnLoadDropInv(playerid)
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
}