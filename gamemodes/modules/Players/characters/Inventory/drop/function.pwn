forward OnLoadDropInv_();
public OnLoadDropInv_()
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
		// HienTextdraw(playerid, PickDropBox_msg, 800);
		SetPVarInt(playerid, #PickingTime, GetPVarInt(playerid, #PickingTime)-1);


		PickTimer[playerid] = SetTimerEx("OnPlayerPickDropBox", 1000, 0, "iii", playerid,  itemid, amount);
	}
	else {
		format(PickDropBox_msg, sizeof(PickDropBox_msg), "Ban da nhan duoc vat pham %s , so luong la %d", itemInfo[itemid][item_name], amount);
		SendClientMessage(playerid, -1, PickDropBox_msg);
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
func:CreateDropObject(objid, objitemid, objamount, Float:DropObjX, Float:DropObjY, Float:DropObjZ)
{
    new szDrop[1280];
    format(szDrop, sizeof(szDrop), "{53f55b}#%d \n%s (Amount: %d) {ffffff}\nSu dung {53f55b}H{ffffff} de nhat", objid, itemInfo[objitemid][item_name], objamount);
    DropItemInfo[objid][d_object] = CreateDynamicObject(2969, DropObjX, DropObjY, DropObjZ - 1, 0.0, 0.0, 0.0);
    DropItemInfo[objid][d_label] = CreateDynamic3DTextLabel(szDrop, -1, DropObjX, DropObjY, DropObjZ - 1, 100);
    return 1;
}
func:DropItem(playerid, drop_sqlid, dropitem_id, dropamount)
{
	new Float:DropObject[4], DropIDz, szDropQuery[1280];

	DropIDz = GetDropIDFree();
	DropItemInfo[DropIDz][d_id] = DropIDz;
	DropItemInfo[DropIDz][d_uid] = Character[playerid][char_player_id];
	DropItemInfo[DropIDz][d_itemid] = dropitem_id;
	DropItemInfo[DropIDz][d_amount] = dropamount;
	format(szDropQuery, sizeof(szDropQuery), "DELETE FROM `inventory` WHERE `item` = '%d' AND `amount` = '%d' AND `uid` = '%d'", 
		DropItemInfo[DropIDz][d_itemid],
		DropItemInfo[DropIDz][d_amount],
		Character[playerid][char_player_id]
	);
	mysql_query(Handle(), szDropQuery);

	GetPlayerPos(playerid, DropObject[0], DropObject[1], DropObject[2]);
	format(szDropQuery, sizeof(szDropQuery), "INSERT INTO `inventory_drop` SET \
		`item` = '%d', `amount` = '%d', `uid` = '%d', `posx` = '%0.2f', `posy` = '%0.2f', `posz` = '%0.2f'",
		DropItemInfo[DropIDz][d_itemid],
		DropItemInfo[DropIDz][d_amount],
		DropItemInfo[DropIDz][d_uid],
		DropObject[0], DropObject[1], DropObject[2]);

	mysql_tquery(Handle(), szDropQuery, "OnInvDropItem", "iii", playerid,DropItemInfo[DropIDz][d_itemid],DropItemInfo[DropIDz][d_amount]);
	CreateDropObject(DropItemInfo[DropIDz][d_id], DropItemInfo[DropIDz][d_itemid],DropItemInfo[DropIDz][d_amount], DropObject[0], DropObject[1], DropObject[2]);
	HidePlayerIndexInv(playerid);
}


func:LoadInventoryDrop()
{
	mysql_tquery(Handle(), "SELECT * FROM `inventory_drop`", "OnLoadDropInv_", "");
	return 1;
}