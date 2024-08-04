#define IsVaildInvItem(%0,%1) PlayerInvUI[%0][Inv_ItemID][%1]
func:RequestTrade(playerid, _targetid)
{
    if (GetPVarInt(playerid, #Trading) == 1 || GetPVarInt(_targetid, #Trading) == 1) return SendErrorMessage(playerid, "Nguoi choi nay dang trao doi !");

    SetPVarInt(playerid, #Request_Trade, 60);
    SetPVarInt(_targetid, #Request_Trade, 60);
    TradeTimer[playerid] = SetTimerEx("OnPlayerRequestTrade", 1000, 1, "ii", playerid, _targetid);
    return 1;
}

forward OnPlayerRequestTrade(playerid, _targetid);
public OnPlayerRequestTrade(playerid, _targetid)
{
    if (GetPVarInt(playerid, #Request_Trade) > 0)
    {
        if (TradeResponse[_targetid] == 0)
        {
            ShowPlayerDialog(playerid, 12214, DIALOG_STYLE_MSGBOX, "Yeu cau trao doi", sprintf("Thoi gian cho {fcba03}%s{FFFFFF} chap nhan con %ds", player_get_name(_targetid), GetPVarInt(playerid, #Request_Trade)), "...", "");
            ShowPlayerDialog(_targetid, DIALOG_REQUEST_TRADE, DIALOG_STYLE_MSGBOX, "Yeu cau trao doi", sprintf("{fcba03}%s{FFFFFF} da yeu cau trao doi voi ban, thoi gian tra loi con %ds", player_get_name(playerid), GetPVarInt(playerid, #Request_Trade)), "Dong y", "Khong");
        }
        else if (TradeResponse[_targetid] == 1)
        {
            // chặn ngt3 trade
            SetPVarInt(playerid, #Trading, 1);
            SetPVarInt(_targetid, #Trading, 1);

            PlayerTrade[playerid] = _targetid;
            PlayerTrade[_targetid] = playerid;

            ShowPlayerInv(playerid, 0, 1);
            ShowPlayerInv(_targetid, 0, 1);

            KillTimer(TradeTimer[playerid]);
            KillTimer(TradeTimer[_targetid]);
            TradeResponse[playerid] = 0;
            TradeResponse[_targetid] = 0;
        }
        else
        {
            SetPVarInt(playerid, #Trading, 0);
            SetPVarInt(_targetid, #Trading, 0);

            TradeResponse[playerid] = 0;
            TradeResponse[_targetid] = 0;
            SendClientMessage(playerid, -1, sprintf("%s da tu choi loi moi trao doi cua ban !", player_get_name(_targetid)));
            SendClientMessage(_targetid, -1, sprintf("Ban da tu choi loi moi trao doi cua %s !", player_get_name(playerid)));

            KillTimer(TradeTimer[playerid]);
            KillTimer(TradeTimer[_targetid]);
        }

        SetPVarInt(playerid, #Request_Trade, GetPVarInt(playerid, #Request_Trade) - 1);
        SetPVarInt(_targetid, #Request_Trade, GetPVarInt(_targetid, #Request_Trade) - 1);
    }
    else if (GetPVarInt(playerid, #Request_Trade) <= 0 && GetPVarInt(playerid, #Request_Trade) <= 0)
    {
        KillTimer(TradeTimer[playerid]);
        KillTimer(TradeTimer[_targetid]);

        TradeResponse[playerid] = 0;
        TradeResponse[_targetid] = 0;
    }
    return 1;
}
func:FindIDByItemID(playerid, _item_id)
{
    new __check = -1;
    for (new i; i < INV_MAX_ITEM; i++)
    {
        if (PlayerInvItem[playerid][pInv_ItemID][i] == _item_id) __check = i;
    }
    if (__check != -1) return __check;
    else GetFreePInvIndex(playerid);
}

func:PlayerSelectTrade(playerid, _slot)
{
    if (PlayerInvUI[playerid][Inv_ItemID][_slot] != 0)
    {
        Inv_Action[playerid][inv_Selected] = 1;
        Inv_Action[playerid][inv_SelectID] = _slot;
        Inv_Action[playerid][inv_SelectSQLID] = CalItemOfPage(playerid, PlayerInvUI[playerid][Inv_ItemID][_slot]);
    }
    return 1;
}
func:GetFreeTradeItem(playerid)
{
    for (new i = 25; i < 50; i++)
    {
        if (PlayerTradeUI[playerid][Trade_ItemID][i] == 0)
        {
            return i;
        }
    }
    return 0;
}
func:GetFreeTempTrade(playerid)
{
    for (new i; i < 25; i++)
    {
        if (TradeInfo[playerid][t_ItemID][i] == 0 && TradeInfo[playerid][t_Amount][i] == 0) return i;
    }
    return 0;
}
func:IsPlayerHasTradeItem(playerid, _item_id)
{
    for (new i = 25; i < 50; i++)
    {
        if (PlayerTradeUI[playerid][Trade_ItemID][i] == _item_id)
        {
            return 1;
        }
    }
    return 0;
}
func:CreateTradeInv(playerid, _item_id)
{
    new _index = GetFreeTradeItem(playerid);

    PlayerTextDrawSetString(playerid, PlayerInvUI[playerid][Trade_ItemTD][_index], itemInfo[_item_id][item_txd]);
    PlayerTradeUI[playerid][Trade_ItemID][_index] = _item_id;
    return 1;
}

func:InvTradeClick(playerid, PlayerText:playertextid)
{
    if (GetPVarInt(playerid, #Inv_Action) == 1)
    {
        for (new i; i < 25; i++)
        {
            if (playertextid == PlayerInvUI[playerid][Inv_ItemTD][i])
            {
                if (IsVaildInvItem(playerid, i) != 0)
                {
                    PlayerSelectTrade(playerid, i);
                    new _real_item_id = Inv_Action[playerid][inv_SelectSQLID];
                    new _item_amount = PlayerInvItem[playerid][pInv_Amount][_real_item_id];
                    ShowPlayerDialog(playerid, DIALOG_AMOUNT_TRADE, DIALOG_STYLE_INPUT, "Trao doi", sprintf("Nhap so luong can trao doi \nSo luong hien co: {fcba03}%d", _item_amount), ">>", "<<");
                }
            }
        }
        if (playertextid == MainInv[playerid][70])
        {
            PlayerFinishTrade(playerid);
        }
        if (playertextid == MainInv[playerid][71])
        {
            CancelTrade(playerid, PlayerTrade[playerid]);
        }
    }
    return 1;
}

func:PlayerFinishTrade(playerid)
{
    new _targetid = PlayerTrade[playerid],
        _code_trade = Random(1, 9999999999);
    
    FinishTrade[playerid][0] = _code_trade;
    FinishTrade[PlayerTrade[playerid]][0] = _code_trade;

    FinishTimer[playerid] = SetTimerEx("OnWaitFinishTrade", 1000, 1, "ii", playerid, PlayerTrade[playerid]);
    SetPVarInt(playerid, #FinishTime, 60);
    SetPVarInt(PlayerTrade[playerid], #FinishTime, 60);
    return 1;
}
func:DestroyTrade(playerid, _targetid)
{
    for (new i = 0; i < 50; i++)
    {
        PlayerTradeUI[playerid][Trade_ItemID][i] = 0;
        PlayerTradeUI[_targetid][Trade_ItemID][i] = 0;
        if (i > 24)
        {
            PlayerTextDrawSetString(_targetid, PlayerInvUI[_targetid][Trade_ItemTD][i], "");
            PlayerTextDrawSetString(playerid, PlayerInvUI[playerid][Trade_ItemTD][i], "");
        }
    }
    return 1;
}
func:SuccessTrade(playerid, _targetid)
{
    SetPVarInt(playerid, #Trading, 0);
    SetPVarInt(_targetid, #Trading, 0);
    for (new i; i < 25; i++)
    {
        if (TradeInfo[playerid][t_ItemID][i] > 0 && TradeInfo[playerid][t_Amount][i] > 0)
        {
            new __item = TradeInfo[playerid][t_ItemID][i],
                __amount = TradeInfo[playerid][t_Amount][i],
                __trade_index = FindIDByItemID(playerid, __item);
            PlayerInvItem[playerid][pInv_ItemID][__trade_index] = __item;
            PlayerInvItem[playerid][pInv_Amount][__trade_index] += __amount;
            SendClientMessage(playerid, -1, sprintf("{fcba03}%s{FFFFFF} da nhan duoc %d %s", player_get_name(playerid), __amount, itemInfo[__item][item_name]));
            TradeInfo[playerid][t_ItemID][i] = 0;
            TradeInfo[playerid][t_Amount][i] = 0;
        }
        if (TradeInfo[_targetid][t_ItemID][i] > 0 && TradeInfo[_targetid][t_Amount][i] > 0)
        {
            new __item = TradeInfo[_targetid][t_ItemID][i],
                __amount = TradeInfo[_targetid][t_Amount][i],
                __trade_index = FindIDByItemID(_targetid, __item);
            PlayerInvItem[_targetid][pInv_ItemID][__trade_index] = __item;
            PlayerInvItem[_targetid][pInv_Amount][__trade_index] += __amount;
            SendClientMessage(_targetid, -1, sprintf("{fcba03}%s{FFFFFF} da nhan duoc %d %s", player_get_name(_targetid), __amount, itemInfo[__item][item_name]));

            TradeInfo[_targetid][t_ItemID][i] = 0;
            TradeInfo[_targetid][t_Amount][i] = 0;
        }
    }
    SendClientMessage(playerid, -1, "Giao dich thanh cong!");
    SendClientMessage(_targetid, -1, "Giao dich thanh cong!");

    FinishTrade[playerid][1] = 0;
    FinishTrade[PlayerTrade[playerid]][1] = 0;
    PlayerTrade[playerid] = -1;
    PlayerTrade[_targetid] = -1;
    HidePlayerInv(playerid);
    HidePlayerInv(_targetid);
    DestroyTrade(playerid, _targetid);
}
func:CancelTrade(playerid, _targetid)
{
    SetPVarInt(playerid, #Trading, 0);
    SetPVarInt(_targetid, #Trading, 0);
    for (new i; i < 25; i++)
    {
        if (TradeInfo[playerid][t_ItemID][i] > 0 && TradeInfo[playerid][t_Amount][i] > 0)
        {
            new __item = TradeInfo[playerid][t_ItemID][i],
                __amount = TradeInfo[playerid][t_Amount][i],
                __trade_index = FindIDByItemID(playerid, __item);
            PlayerInvItem[_targetid][pInv_ItemID][__trade_index] = __item;
            PlayerInvItem[_targetid][pInv_Amount][__trade_index] += __amount;
            TradeInfo[playerid][t_ItemID][i] = 0;
            TradeInfo[playerid][t_Amount][i] = 0;
        }
        if (TradeInfo[_targetid][t_ItemID][i] > 0 && TradeInfo[_targetid][t_Amount][i] > 0)
        {
            new __item = TradeInfo[_targetid][t_ItemID][i],
                __amount = TradeInfo[_targetid][t_Amount][i],
                __trade_index = FindIDByItemID(_targetid, __item);
            // printf("2 | Item %d | Amount %d", __item, __amount);
            PlayerInvItem[playerid][pInv_ItemID][__trade_index] = __item;
            PlayerInvItem[playerid][pInv_Amount][__trade_index] += __amount;
            TradeInfo[_targetid][t_ItemID][i] = 0;
            TradeInfo[_targetid][t_Amount][i] = 0;
        }
    }
    FinishTrade[playerid][1] = 0;
    FinishTrade[PlayerTrade[playerid]][1] = 0;
    PlayerTrade[playerid] = -1;
    PlayerTrade[_targetid] = -1;
    HidePlayerInv(playerid);
    HidePlayerInv(_targetid);
    DestroyTrade(playerid, _targetid);

    SendErrorMessage(playerid, "1 trong 2 nguoi da tu choi giao dich nay");
    SendErrorMessage(_targetid, "1 trong 2 nguoi da tu choi giao dich nay");
    return 1;
}
forward OnWaitFinishTrade(playerid, _targetid);
public OnWaitFinishTrade(playerid, _targetid)
{
    if (GetPVarInt(playerid, #FinishTime) > 0)
    {
        if (FinishTrade[playerid][1] == 0)
        {
            ShowPlayerDialog(playerid, DIALOG_FINISH_TRADE, DIALOG_STYLE_MSGBOX, "Ket thuc giao dich", sprintf("{fcba03}%s{FFFFFF} dong y ket thuc giao dich chu?\nGiao dich se bi huy bo sau %ds", player_get_name(playerid), GetPVarInt(playerid, #FinishTime)), "Dong y", "Khong");
        }
        if (FinishTrade[PlayerTrade[playerid]][1] == 0)
        {
            ShowPlayerDialog(_targetid, DIALOG_FINISH_TRADE, DIALOG_STYLE_MSGBOX, "Ket thuc giao dich", sprintf("{fcba03}%s{FFFFFF} dong y ket thuc giao dich chu?\nGiao dich se bi huy bo sau %ds", player_get_name(_targetid), GetPVarInt(playerid, #FinishTime)), "Dong y", "Khong");
        }
        if (FinishTrade[playerid][1] == 1 && FinishTrade[PlayerTrade[playerid]][1] == 1)
        {
            SuccessTrade(playerid, _targetid);
            KillTimer(FinishTimer[playerid]);
            KillTimer(FinishTimer[_targetid]);
        }

        else if (FinishTrade[playerid][1] == -1 || FinishTrade[PlayerTrade[playerid]][1] == -1)
        {
            CancelTrade(playerid, _targetid);
            KillTimer(FinishTimer[playerid]);
            KillTimer(FinishTimer[_targetid]);
            return 1;
        }
        SetPVarInt(playerid, #FinishTime, GetPVarInt(playerid, #FinishTime) - 1);
        SetPVarInt(PlayerTrade[playerid], #FinishTime, GetPVarInt(playerid, #FinishTime) - 1);
    }
    else
    {
        KillTimer(FinishTimer[playerid]);
        KillTimer(FinishTimer[_targetid]);
    }
}
hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if (dialogid == DIALOG_FINISH_TRADE)
    {
        if (FinishTrade[PlayerTrade[playerid]][0] == FinishTrade[playerid][0])
        {
            if (!response) response = -1;
            if (PlayerTrade[PlayerTrade[playerid]] == playerid)
            {
                FinishTrade[playerid][1] = response;
            }
            else
            {
                FinishTrade[PlayerTrade[playerid]][1] = response;
            }
        }
    }
    if (dialogid == DIALOG_REQUEST_TRADE)
    {
        if (response)
        {
            TradeResponse[playerid] = 1;
            return 1;
        }
        else
        {
            TradeResponse[playerid] = -1;
            return 1;
        }
    }
    if (dialogid == DIALOG_AMOUNT_TRADE)
    {
        if (response)
        {
            new _amount = strval(inputtext),
                _real_item_id = Inv_Action[playerid][inv_SelectSQLID];

            new _item_amount = PlayerInvItem[playerid][pInv_Amount][_real_item_id],
                _item_id = PlayerInvItem[playerid][pInv_ItemID][_real_item_id];

            new _target_trader = PlayerTrade[playerid];
            if (_amount > _item_amount) return SendErrorMessage(playerid, "Ban khong du so luong de trao doi !");

            PlayerInvItem[playerid][pInv_Amount][_real_item_id] -= _amount;

            CreateTradeInv(playerid, PlayerInvItem[playerid][pInv_ItemID][_real_item_id]);
            CreateTradeInv(_target_trader, PlayerInvItem[playerid][pInv_ItemID][_real_item_id]);
            new _temp_index = GetFreeTempTrade(_target_trader);
            TradeInfo[_target_trader][t_ItemID][_temp_index] = _item_id;
            TradeInfo[_target_trader][t_Amount][_temp_index] = _amount;

            if (PlayerInvItem[playerid][pInv_Amount][_real_item_id] == 0)
            {
                RemoveUIItem(playerid, Inv_Action[playerid][inv_SelectID]);
            }
        }
    }
    return 1;
}
