if(GetPVarInt(playerid, #inventorystatus) == 1)
	{
		if(playertextid == InvPTD[playerid][4])
		{
	    	if(GetPVarInt(playerid, #inventorystatus) == 1)
	    	{
		    	if(GetPVarInt(playerid, #detailstatus) == 1)
		    	{
					for(new i = 5; i < 12; i++)
					{
						PlayerTextDrawHide(playerid, InvPTD[playerid][i]);
					}
					PlayerSelectSlot[playerid] = -1;
					SetPVarInt(playerid, #detailstatus, 0);
					SelectTextDraw(playerid, 0x0d142bAA);
					PlayerPlaySound(playerid, 1135, 0.0, 0.0, 0.0);
		    	}
		    	else{inventory_hide(playerid); PlayerPlaySound(playerid, 17803, 0.0, 0.0, 0.0);}
	    	}
		}
		if(playertextid == InvPTD[playerid][10])
		{
			ShowPlayerDialog(playerid, DLG_DeleteItem, DIALOG_STYLE_MSGBOX, "XOA VAT PHAM", "{ffffff}Ban co chac chan muon {B31312}XOA VAT PHAM{ffffff} nay khong\n\
				no se bien mat hoan toan, neu nhu xoa nham lan vui long bao ngay voi admin de nhan duoc su tro giup.", "Xac nhan", "Huy");
		}
		for(new i = 0; i < 20; i++)
		{
			if(playertextid == InvSlotPTD[playerid][i])
			{
				if(pInventory[playerid][invSlot][i] != 0 && GetPVarInt(playerid, #detailstatus) == 0)
				{
					new string[255];
					format(string, sizeof(string), "%s", iItem_info[pInventory[playerid][invSlot][i]][item_name]);
					PlayerTextDrawSetString(playerid, InvPTD[playerid][6], string);
					format(string, sizeof(string), "%s", iItem_info[pInventory[playerid][invSlot][i]][item_detail]);
					PlayerTextDrawSetString(playerid, InvPTD[playerid][8], string);
					format(string, sizeof(string), "%d", pInventory[playerid][invSlotAmount][i]);
					PlayerTextDrawSetString(playerid, InvPTD[playerid][7], string);
					format(string, sizeof(string), "%0.2f", iItem_info[pInventory[playerid][invSlot][i]][item_weight]*pInventory[playerid][invSlotAmount][i]);
					PlayerTextDrawSetString(playerid, InvPTD[playerid][11], string);
					PlayerPlaySound(playerid, 1130, 0.0, 0.0, 0.0);
					PlayerSelectSlot[playerid] = i;
					inventory_show(playerid);
					for(new j = 5; j < 12; j++)
					{
						PlayerTextDrawShow(playerid, InvPTD[playerid][j]);
					}
					SetPVarInt(playerid, #detailstatus, 1);
				}
				else if(pInventory[playerid][invSlot][i] == 0 && GetPVarInt(playerid, #detailstatus) == 1)
				{
					new tempAmount = pInventory[playerid][invSlotAmount][PlayerSelectSlot[playerid]], tempItem = pInventory[playerid][invSlot][PlayerSelectSlot[playerid]];
					pInventory[playerid][invSlot][PlayerSelectSlot[playerid]] = 0;
					pInventory[playerid][invSlotAmount][PlayerSelectSlot[playerid]] = 0;
					PlayerPlaySound(playerid, 1135, 0.0, 0.0, 0.0);
					for(new j = 5; j < 12; j++)
					{
						PlayerTextDrawHide(playerid, InvPTD[playerid][j]);
					}
					SetPVarInt(playerid, #detailstatus, 0);
					pInventory[playerid][invSlot][i] = tempItem;
					pInventory[playerid][invSlotAmount][i] = tempAmount;
					PlayerSelectSlot[playerid] = -1;
					inventory_show(playerid);
				}
				else if(pInventory[playerid][invSlot][PlayerSelectSlot[playerid]] != pInventory[playerid][invSlot][i] && pInventory[playerid][invSlot][PlayerSelectSlot[playerid]] != 0 && GetPVarInt(playerid, #detailstatus) == 1)
				{
					if(	iItem_info[pInventory[playerid][invSlot][i]][item_id] != iItem_info[PlayerSelectSlot[playerid]][item_id])
					{
						PlayerPlaySound(playerid, 1135, 0.0, 0.0, 0.0);
						new tempAmount = pInventory[playerid][invSlotAmount][PlayerSelectSlot[playerid]], tempItem = pInventory[playerid][invSlot][PlayerSelectSlot[playerid]];
						pInventory[playerid][invSlot][PlayerSelectSlot[playerid]] = pInventory[playerid][invSlot][i];
						pInventory[playerid][invSlotAmount][PlayerSelectSlot[playerid]] = pInventory[playerid][invSlotAmount][i];
						for(new j = 5; j < 12; j++)
						{
							PlayerTextDrawHide(playerid, InvPTD[playerid][j]);
						}
						SetPVarInt(playerid, #detailstatus, 0);
						pInventory[playerid][invSlot][i] = tempItem;
						pInventory[playerid][invSlotAmount][i] = tempAmount;
						PlayerSelectSlot[playerid] = -1;
						inventory_show(playerid);
					}
					else
					{
						if((pInventory[playerid][invSlotAmount][i]+pInventory[playerid][invSlotAmount][PlayerSelectSlot[playerid]]) <= iItem_info[pInventory[playerid][invSlot][i]][item_maxamount])
						{
							new string[555];
							PlayerPlaySound(playerid, 1135, 0.0, 0.0, 0.0);
							pInventory[playerid][invSlot][PlayerSelectSlot[playerid]] = 0;
							pInventory[playerid][invSlotAmount][i] += pInventory[playerid][invSlotAmount][PlayerSelectSlot[playerid]];
							pInventory[playerid][invSlotAmount][PlayerSelectSlot[playerid]] = 0 ;
							for(new j = 5; j < 12; j++)
							{
								PlayerTextDrawHide(playerid, InvPTD[playerid][j]);
							}
							SetPVarInt(playerid, #detailstatus, 0);
							format(string, sizeof(string), "[{212C58}SSA{ffffff}] Ban da ghep thanh cong vat pham {B31312}%s {ffffff}so luong hien co {64CCC5}%d{ffffff}.", iItem_info[pInventory[playerid][invSlot][i]][item_name], pInventory[playerid][invSlotAmount][i]);
							SendClientMessage(playerid, -1, string);
							PlayerSelectSlot[playerid] = -1;
							inventory_show(playerid);
						}
						else
						{
							new string[555];	
							format(string, sizeof(string), "[{212C58}SSA{ffffff}] Ban da ghep {B31312}KHONG {ffffff}thanh cong vat pham {B31312}%s {ffffff}do chi duoc phep co toi da {64CCC5}%d/%d{ffffff}.", iItem_info[pInventory[playerid][invSlot][i]][item_name], pInventory[playerid][invSlotAmount][i]+pInventory[playerid][invSlotAmount][PlayerSelectSlot[playerid]], iItem_info[pInventory[playerid][invSlot][i]][item_maxamount]);
							SendClientMessage(playerid, -1, string);
						}
					}

				}
			}
		}
	}