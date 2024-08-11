#define IsPlayerInvSelected(%0) Inv_Action[%0][inv_Selected]
func:IsPlayerHasItem(playerid, _item_id)
{
    for (new i; i < 25; i++)
    {
        if (PlayerInvUI[playerid][Inv_ItemID][i] == _item_id)
        {
            return 1;
        }
    }
    return 0;
}
func:GetFreePInvIndex(playerid)
{
    for (new i; i < INV_MAX_ITEM; i++)
    {
        if (PlayerInvItem[playerid][pInv_ItemID][i] == 0 && PlayerInvItem[playerid][pInv_Amount][i] == 0) return i;
    }
    return 0;
}
func:GetInvCountItem(playerid)
{
    new _count;
    for (new i; i < INV_MAX_ITEM; i++)
    {
        if (PlayerInvItem[playerid][pInv_ItemID][i] > 0 && PlayerInvItem[playerid][pInv_Amount][i] > 0) _count++;
    }
    return _count;
}
func:CalPage(playerid)
{
    new _citem = GetInvCountItem(playerid);
    for (new i; i < 40; i++)
    {
        if (_citem > 25 * i && _citem < ((25 * i) + 25)) return i;
    }
    return 0;
}
func:CalColumn(_item_count)
{
    for (new i; i < _item_count; i++)
    {
        if (_citem > 5 * i && _citem < ((5 * i) + 5)) return i;
    }
    return 0;
}
func:GetFreeItem(playerid)
{
    for (new i; i < 25; i++)
    {
        if (PlayerInvUI[playerid][Inv_ItemID][i] == 0)
        {
            return i;
        }
    }
    return 0;
}
func:ShowPlayerInv(playerid, _page = 0, _action = 0)
{
    HidePlayerInv(playerid);

    SetPVarInt(playerid, #IsOpenInv, 1);
    new start_page, end_page;

    start_page = 25 * _page;
    end_page = 25 * _page + 25;
    for (new i = start_page; i < end_page; i++)
    {
        if (PlayerInvItem[playerid][pInv_ItemID][i] > 0 && PlayerInvItem[playerid][pInv_Amount][i] > 0)
        {
            CreateItemInv(playerid, PlayerInvItem[playerid][pInv_ItemID][i]);
        }
    }
    ShowPlayerMainInv(playerid);
    SetPVarInt(playerid, #Inv_Action, _action);
    switch (_action)
    {
        case 0: // drop
        {
            PlayerTextDrawHide(playerid, MainInv[playerid][56]);
            PlayerTextDrawSetString(playerid, MainInv[playerid][71], "mdl-2030:btn_drop");

        }
        case 1: // trade
        {
            PlayerTextDrawSetString(playerid, MainInv[playerid][73], sprintf("%s", player_get_name(PlayerTrade[playerid])));
            PlayerTextDrawHide(playerid, MainInv[playerid][55]);
            PlayerTextDrawHide(playerid, MainInv[playerid][72]);
            PlayerTextDrawSetString(playerid, MainInv[playerid][70], "mdl-2030:btn_trade");
            PlayerTextDrawSetString(playerid, MainInv[playerid][71], "mdl-2030:btn_close");
        }
    }
    return 1;
}
func:HidePlayerInv(playerid)
{
    DeletePVar(playerid, #PageItemCount);
    DeletePVar(playerid, #IsOpenInv);
    HidePlayerMainInv(playerid);
    return 1;
}
func:CreateItemInv(playerid, _item_id)
{
    if (!IsPlayerHasItem(playerid, _item_id))
    {
        SetPVarInt(playerid, #PageItemCount, GetPVarInt(playerid, #PageItemCount) + 1);
        new _index = GetFreeItem(playerid);

        PlayerTextDrawSetString(playerid, PlayerInvUI[playerid][Inv_ItemTD][_index], itemInfo[_item_id][item_txd]);
        PlayerInvUI[playerid][Inv_ItemID][_index] = _item_id;
    }
    return 1;
}
func:GetValueWeight(_weight)
{
    new Float:_V_Inv;
    switch (_weight)
    {
        case 20: _V_Inv = 2.75;
        case 30: _V_Inv = 1.84;
        case 40: _V_Inv = 1.375;
        case 50: _V_Inv = 1.1;
    }
    return _V_Inv;
}
CMD:additem(playerid, params[])
{
    new targetid, a_item_id, a_amount;
    if (sscanf(params, "iii", targetid, a_item_id, a_amount))
    {
        SendUsageMessage(playerid, "/additem [playerid] [item] [amount]");
        SendUsageMessage(playerid, "/listitem");
        return 1;
    }
    new _add_free_index = GetFreePInvIndex(playerid);

    PlayerInvItem[targetid][pInv_ItemID][_add_free_index] = a_item_id;
    PlayerInvItem[targetid][pInv_Amount][_add_free_index] = a_amount;

    // CreateItemInv(playerid, strval(params));
    ShowPlayerInv(targetid);
    return 1;
}
CMD:listitem(playerid)
{
    new _cmd_listitem[1280];
    strcat(_cmd_listitem, "ID\tName\tCan nang\n");
    for (new i; i < sizeof(itemInfo); i++)
    {
        new _cmd_ahz[1280];
        format(_cmd_ahz, 1280, "%d\t{d7f562}%s{FFFFFF}\t%dg\n", itemInfo[i][item_id], itemInfo[i][item_name], itemInfo[i][item_weight]);
        strcat(_cmd_listitem, _cmd_ahz);
    }
    strcat(_cmd_listitem, "END");
    ShowPlayerDialog(playerid, 12124, DIALOG_STYLE_TABLIST_HEADERS, "Help", _cmd_listitem, "..", "");
    return 1;
}

CMD:inv(playerid, params)
{
    if (!GetPVarInt(playerid, #IsOpenInv)) return ShowPlayerInv(playerid, 0, 0);
    else return HidePlayerInv(playerid);
    // return 1;
}
CMD:trade(playerid, params[])
{
    new targetid;
    if(sscanf(params, "i", targetid)) return SendUsageMessage(playerid, "/trade [playerid]");
    if(targetid == playerid || !IsPlayerConnected(targetid)) return SendErrorMessage(playerid, "Nguoi choi khong hop le !");
    RequestTrade(playerid, targetid);
    return 1;
}
func:CalInvWeight(playerid)
{
    new total_weight = 0;
    for (new i; i < INV_MAX_ITEM; i++)
    {
        if (PlayerInvItem[playerid][pInv_ItemID][i] > 0 && PlayerInvItem[playerid][pInv_Amount][i] > 0)
        {
            new _item_weight = itemInfo[PlayerInvItem[playerid][pInv_ItemID][i]][item_weight];
            total_weight += _item_weight;
        }
    }
    return total_weight;
}


func:ShowPlayerMainInv(playerid)
{
    new _default_p_weight = 20,
        Float:V_per_limit;
    switch (_default_p_weight)
    {
        case 20: V_per_limit = 2.75;
        case 30: V_per_limit = 1.84;
        case 40: V_per_limit = 1.375;
        case 50: V_per_limit = 1.1;
    }

    new Float:_weight_V = floatdiv(CalInvWeight(playerid), float(1000)),
        Float:Weight_Textsize = floatmul(_weight_V, V_per_limit) + 220;
    PlayerTextDrawTextSize(playerid, MainInv[playerid][65], Weight_Textsize, 51.000);

    PlayerTextDrawSetString(playerid, MainInv[playerid][66], sprintf("%.2f / %d", _weight_V, _default_p_weight));

    PlayerTextDrawSetString(playerid, MainInv[playerid][67], sprintf("Total Item: ~g~%d", GetInvCountItem(playerid)));

    for (new i; i < 74; i++)
    {
        if (MainInv[playerid][i] != 0) PlayerTextDrawShow(playerid, MainInv[playerid][i]);
    }
    for (new i; i < 50; i++) PlayerTextDrawShow(playerid, PlayerInvUI[playerid][Inv_ItemTD][i]);

    SelectTextDraw(playerid, 0xaa53fcFF);
    return 1;
}


func:HidePlayerMainInv(playerid)
{
    for (new i; i < 74; i++) PlayerTextDrawHide(playerid, MainInv[playerid][i]);
    for (new i; i < 50; i++) PlayerTextDrawHide(playerid, PlayerInvUI[playerid][Inv_ItemTD][i]);
    CancelSelectTextDraw(playerid);
    return 1;
}

func:CalItemOfPage(playerid, _item_slot)
{
    for (new i; i < INV_MAX_ITEM; i++)
    {
        if (PlayerInvItem[playerid][pInv_ItemID][i] == _item_slot) return i;
    }
    return 0;
}
func:SetInvItemInfo(playerid, _item_sqlid)
{
    new _item_id = PlayerInvItem[playerid][pInv_ItemID][_item_sqlid];
    new _item_amount = PlayerInvItem[playerid][pInv_Amount][_item_sqlid];

    new _item_txd[64],
        _item_name[64];

    strcat(_item_txd, itemInfo[_item_id][item_txd]);
    strcat(_item_name, itemInfo[_item_id][item_name]);

    PlayerTextDrawSetString(playerid, MainInv[playerid][59], sprintf("%s", _item_txd));
    PlayerTextDrawSetString(playerid, MainInv[playerid][60], sprintf("%s", _item_name));
    PlayerTextDrawSetString(playerid, MainInv[playerid][61], sprintf("Amount: ~y~%d", _item_amount));
    PlayerTextDrawSetString(playerid, MainInv[playerid][62], sprintf("Weight: ~p~%.2f", floatdiv(itemInfo[_item_id][item_weight], 1000)));
    return 1;
}
func:MoveItem(playerid, _cur_slot, _to_slot)
{
    // exits item in new slot?
    if (PlayerInvUI[playerid][Inv_ItemID][_to_slot] != 0 && PlayerInvUI[playerid][Inv_ItemTD][_to_slot] != 0) return 1;

    // move item to new slot
    new _item_move_id = PlayerInvUI[playerid][Inv_ItemID][_cur_slot];
    PlayerTextDrawSetString(playerid, PlayerInvUI[playerid][Inv_ItemTD][_to_slot], itemInfo[_item_move_id][item_txd]);
    PlayerInvUI[playerid][Inv_ItemID][_to_slot] = _item_move_id;

    // set current slot to default
    PlayerTextDrawSetString(playerid, PlayerInvUI[playerid][Inv_ItemTD][_cur_slot], "");
    PlayerInvUI[playerid][Inv_ItemID][_cur_slot] = 0;

    return 1;
}
func:PlayerSelectInv(playerid, _slot)
{
    if (PlayerInvUI[playerid][Inv_ItemID][_slot] != 0)
    {
        SetInvItemInfo(playerid, CalItemOfPage(playerid, PlayerInvUI[playerid][Inv_ItemID][_slot]));
        Inv_Action[playerid][inv_Selected] = 1;
        Inv_Action[playerid][inv_SelectID] = _slot;
        Inv_Action[playerid][inv_SelectSQLID] = CalItemOfPage(playerid, PlayerInvUI[playerid][Inv_ItemID][_slot]);
    }
    return 1;
}
func:InvMess(playerid, case_action, item)
{
    new szInvMess[1280];
    switch (case_action)
    {
        case 1:
        {
            format(szInvMess, sizeof(szInvMess), "{42f560}[INVENTORY]{ffffff}:Ban da su dung vat pham %s", itemInfo[item][item_name]);
        }
        case 2:
        {
            format(szInvMess, sizeof(szInvMess), "{42f560}[INVENTORY]{ffffff}:Ban da vut vat pham %s", itemInfo[item][item_name]);
        }
    }
    SendClientMessage(playerid, -1, szInvMess);
    return 1;
}
func:UseItem(playerid, itemid)
{
    switch (itemid)
    {
        case 1:
        {
            GivePlayerValidWeapon(playerid, 22, 60000);
        }
        case 2:
        {
            GivePlayerValidWeapon(playerid, 30, 60000);
        }
        case 3:
        {
            GivePlayerValidWeapon(playerid, 27, 60000);
        }
        case 4:
        {
            ApplyAnimation(playerid, "VENDING", "VEND_Drink2_P", 4.0, 0, 0, 0, 0, 0, 1);
        }
        case 5:
        {
            GivePlayerValidWeapon(playerid, 29, 60000);
        }
        case 6:
        {
            GivePlayerValidWeapon(playerid, 31, 60000);
        }
        case 7:
        {
            GivePlayerValidWeapon(playerid, 25, 60000);
        }
        case 8:
        {
            GivePlayerValidWeapon(playerid, 28, 60000);
        }
        case 9:
        {
            GivePlayerValidWeapon(playerid, 32, 60000);
        }
        case 10:
        {
            GivePlayerValidWeapon(playerid, 24, 60000);
        }
        case 11:
        {
            GivePlayerValidWeapon(playerid, 26, 60000);
        }
        case 12:
        {
            GivePlayerValidWeapon(playerid, 34, 60000);
        }
        case 17:
        {
            ApplyAnimation(playerid, "VENDING", "VEND_Drink2_P", 4.0, 0, 0, 0, 0, 0, 1);
        }
        case 18:
        {
            ApplyAnimation(playerid, "VENDING", "VEND_Drink2_P", 4.0, 0, 0, 0, 0, 0, 1);
        }
        case 19:
        {
            ApplyAnimation(playerid, "VENDING", "VEND_Drink2_P", 4.0, 0, 0, 0, 0, 0, 1);
        }
        case 20:
        {
            ApplyAnimation(playerid, "VENDING", "VEND_Drink2_P", 4.0, 0, 0, 0, 0, 0, 1);
        }
    }
    InvMess(playerid, 1, itemid);
    return 1;
}
func:RemoveUIItem(playerid, _slot)
{
    PlayerTextDrawSetString(playerid, PlayerInvUI[playerid][Inv_ItemTD][_slot], "");
    PlayerInvUI[playerid][Inv_ItemID][_slot] = 0;
    return 1;
}
func:DropItem(playerid, _slot)
{
    PlayerInvItem[playerid][pInv_Amount][_slot] = 0;
    PlayerInvItem[playerid][pInv_ItemID][_slot] = 0;
    return 1;
}

func:OnInvClick(playerid, PlayerText:playertextid)
{
    if (GetPVarInt(playerid, #Inv_Action) == 0)
    {
        for (new i; i < 25; i++)
        {
            if (playertextid == PlayerInvUI[playerid][Inv_ItemTD][i])
            {
                if (!IsPlayerInvSelected(playerid)) PlayerSelectInv(playerid, i);
                else if (Inv_Action[playerid][inv_SelectID] != i)
                {
                    MoveItem(playerid, Inv_Action[playerid][inv_SelectID], i);
                    PlayerSelectInv(playerid, i);
                }
            }
        }

        if (playertextid == MainInv[playerid][70])
        {
            if (!IsPlayerInvSelected(playerid)) return SendErrorMessage(playerid, "Ban chua chon vat pham can thao tac !");

            new _item_inv_id = Inv_Action[playerid][inv_SelectID];
            new _item_id = CalItemOfPage(playerid, PlayerInvUI[playerid][Inv_ItemID][_item_inv_id]);
            printf("ItemID %d | TXD ID %d", _item_id, _item_inv_id);
            UseItem(playerid, PlayerInvItem[playerid][pInv_ItemID][_item_id]);

            PlayerInvItem[playerid][pInv_Amount][_item_id] --;

            HidePlayerInv(playerid);
        }
        if (playertextid == MainInv[playerid][71])
        {
            if (!IsPlayerInvSelected(playerid)) return SendErrorMessage(playerid, "Ban chua chon vat pham can thao tac !");
            switch (GetPVarInt(playerid, #Inv_Action))
            {
                case 0: // drop
                {
                    new _item_inv_id = Inv_Action[playerid][inv_SelectID];
                    new _item_id = CalItemOfPage(playerid, PlayerInvUI[playerid][Inv_ItemID][_item_inv_id]);

                    InvMess(playerid, 1, PlayerInvItem[playerid][pInv_ItemID][_item_id]);
                    RemoveUIItem(playerid, _item_inv_id);
                    DropItem(playerid, _item_id);
                }
            }
        }
        if (playertextid == MainInv[playerid][72])
        {
            HidePlayerInv(playerid);
        }
        return 1;
    }
}