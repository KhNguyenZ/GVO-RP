func:LoadPlayerInventory(playerid)
{
	new invQuery[1280];
	format(invQuery, sizeof(invQuery), "SELECT * FROM `inventory` WHERE `uid` = '%d'", GetPlayerSQLID(playerid));
	mysql_tquery(Handle(), invQuery, "OnLoadPlayerInventory", "i", playerid);
	return 1;
}

forward OnLoadPlayerInventory(playerid);
public OnLoadPlayerInventory(playerid)
{
	if(cache_num_rows() > 0)
	{
        printf("Loaded Inventory's %s", player_get_name(playerid));
		new countitem[MAX_PLAYERS] = 0;
		for(new i = 0; i < cache_num_rows(); i++)
		{
			cache_get_value_name_int(i,  "id", PlayerInvItem[playerid][pInv_SQLID][countitem[playerid]]);
			cache_get_value_name_int(i,  "item", PlayerInvItem[playerid][pInv_ItemID][countitem[playerid]]);
			cache_get_value_name_int(i,  "amount", PlayerInvItem[playerid][pInv_Amount][countitem[playerid]]);
			countitem[playerid]++;
		}
	}
}

