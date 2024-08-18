#include <YSI\YSI_Coding\y_hooks>
hook OnGameModeInit()
{
    for (new i = 0; i < MAX_HOUSES; i++)
    {
        HouseData[i][Save] = INVALID_NUMBER;
    }
    mysql_tquery(Handle(), "SELECT * FROM `houses`", "LoadHouses", "");
    mysql_tquery(Handle(), "SELECT * FROM `housefurnitures`", "LoadFurnitures", "");
    return 1;
}

hook OnGameModeExit()
{
    foreach (new i : Houses)
    {
        if (HouseData[i][Save]) SaveHouseData(i);
    }

    KillTimer(HouseTimer);
    return 1;
}
hook OnPlayerConnect(playerid)
{
    InHouse[playerid] = INVALID_NUMBER;
    SelectMode[playerid] = SELECT_MODE_EDIT;
    return 1;
}

hook OnPlayerSpawn(playerid)
{
    InHouse[playerid] = INVALID_NUMBER;
    return 1;
}

public OnPlayerPickUpDynamicPickup(playerid, pickupid)
{
    if (GetPVarInt(playerid, "HousePickupCooldown") < tickcount())
    {
        if (InHouse[playerid] == INVALID_NUMBER)
        {
            foreach (new i : Houses)
            {
                if (pickupid == HouseData[i][HousePickup])
                {
                    SetPVarInt(playerid, "HousePickupCooldown", tickcount() + 8000);
                    SetPVarInt(playerid, "PickupHouseID", i);
                    if (!strcmp(HouseData[i][Owner], "-"))
                    {
                        new string[64];
                        format(string, sizeof(string), "nha dang duoc rao ban\n\nPrice: {2ECC71}$%s", FormatMoney(HouseData[i][Price]));
                        ShowPlayerDialog(playerid, DIALOG_HOUSE, DIALOG_STYLE_MSGBOX, "Nha dang rao ban!", string, "Buy", "Close");
                    }
                    else
                    {
                        switch (HouseData[i][LockMode])
                        {
                            case LOCK_MODE_NOLOCK: SendToHouse(playerid, i);
                            case LOCK_MODE_PASSWORD: ShowPlayerDialog(playerid, DIALOG_HOUSE+1, DIALOG_STYLE_INPUT, "Mat Khau Nha", "Ngoi nha nay duoc bao ve bang mat khau.\n\nNhap mat khau nha:", "Nhap", "Thoat");

                            case LOCK_MODE_OWNER:
                            {
                                new name[MAX_PLAYER_NAME];
                                GetPlayerName(playerid, name, MAX_PLAYER_NAME);
                                if (!strcmp(HouseData[i][Owner], name))
                                {
                                    SetPVarInt(playerid, "HousePickupCooldown", tickcount() + 8000);
                                    SendToHouse(playerid, i);
                                }
                                else
                                {
                                    SendClientMessage(playerid, 0xE74C3CFF, "He Thong House: chi co chu so huu moi co the vao ngoi nha nay.");
                                }
                            }
                        }
                    }

                    return 1;
                }
            }
        }
        else
        {
            for (new i; i < sizeof(HouseInteriors); ++i)
            {
                if (pickupid == HouseInteriors[i][intPickup])
                {
                    SetPVarInt(playerid, "HousePickupCooldown", tickcount() + 8000);
                    SetPlayerVirtualWorld(playerid, 0);
                    SetPlayerInterior(playerid, 0);
                    SetPlayerPos(playerid, HouseData[ InHouse[playerid] ][houseX], HouseData[ InHouse[playerid] ][houseY], HouseData[ InHouse[playerid] ][houseZ]);
                    InHouse[playerid] = INVALID_NUMBER;
                    return 1;
                }
            }
        }
    }

    return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if (dialogid == DIALOG_HOUSE)
    {
        if (!response) return 1;
        new id = GetPVarInt(playerid, "PickupHouseID");
        if (!IsPlayerInRangeOfPoint(playerid, 2.0, HouseData[id][houseX], HouseData[id][houseY], HouseData[id][houseZ])) return SendClientMessage(playerid, 0xE74C3CFF, "He Thong House: Ban khong o gan bat ky ngoi nha nao.");
        if (HouseData[id][Price] > GetPlayerMoney(playerid)) return SendClientMessage(playerid, 0xE74C3CFF, "He Thong House: Ban khong the mua duoc ngoi nha nay.");
        GivePlayerMoney(playerid, -HouseData[id][Price]);
        GetPlayerName(playerid, HouseData[id][Owner], MAX_PLAYER_NAME);
        HouseData[id][Save] = true;

        new label[200];
        format(label, sizeof(label), "{E67E22}%s's House (ID: %d)\n{FFFFFF}%s\n{FFFFFF}%s\n%s", HouseData[id][Owner], id, HouseData[id][Name], HouseInteriors[ HouseData[id][Interior] ][IntName], LockNames[ HouseData[id][LockMode] ]);
        UpdateDynamic3DTextLabelText(HouseData[id][HouseLabel], 0xFFFFFFFF, label);
        Streamer_SetIntData(STREAMER_TYPE_PICKUP, HouseData[id][HousePickup], E_STREAMER_MODEL_ID, 19522);
        Streamer_SetIntData(STREAMER_TYPE_MAP_ICON, HouseData[id][HouseIcon], E_STREAMER_TYPE, 32);
        SendToHouse(playerid, id);
        SaveHouseData(id);
        SaveHouseFurnitureData(id);
        return 1;
    }

    if (dialogid == DIALOG_HOUSE + 1)
    {
        if (!response) return 1;
        new id = GetPVarInt(playerid, "PickupHouseID");
        if (!IsPlayerInRangeOfPoint(playerid, 2.0, HouseData[id][houseX], HouseData[id][houseY], HouseData[id][houseZ])) return SendClientMessage(playerid, 0xE74C3CFF, "He Thong House: Ban khong o gan bat ky ngoi nha nao.");
        if (!(1 <= strlen(inputtext) <= MAX_HOUSE_PASSWORD)) return ShowPlayerDialog(playerid, DIALOG_HOUSE + 1, DIALOG_STYLE_INPUT, "Mat khau nha", "Ngoi nha nay duoc bao ve bang mat khau\n\nNhap Mat khau nha:\n\n{E74C3C}Mat khau ban nhap qua ngan hoac qua dai", "Thu lai", "Thoat");
        if (strcmp(HouseData[id][Password], inputtext)) return ShowPlayerDialog(playerid, DIALOG_HOUSE + 1, DIALOG_STYLE_INPUT, "Mat khau nha", "Ngoi nha nay duoc bao ve bang mat khau\n\nNhap Mat khau nha:\n\n{E74C3C}Mat khau sai.", "Thu lai", "Thoat");
        SendToHouse(playerid, id);
        SaveHouseData(id);
        SaveHouseFurnitureData(id);
        return 1;
    }

    if (dialogid == DIALOG_HOUSE + 2)
    {
        if (!response) return 1;
        new id = InHouse[playerid], name[24];
        if (id == INVALID_NUMBER) return SendClientMessage(playerid, 0xE74C3CFF, "He Thong House: Ban khong o trong mot ngoi nha nao.");
        GetPlayerName(playerid, name, MAX_PLAYER_NAME);
        if (strcmp(HouseData[id][Owner], name)) return SendClientMessage(playerid, 0xE74C3CFF, "He Thong House: Ban khong phai la chu so huu cua ngoi nha nay.");

        if (listitem == 0) ShowPlayerDialog(playerid, DIALOG_HOUSE + 3, DIALOG_STYLE_INPUT, "Ten Ngoi Nha", "Viet ten moi cho ngoi nha nay:", "Doi", "Tro ve");
        if (listitem == 1) ShowPlayerDialog(playerid, DIALOG_HOUSE + 4, DIALOG_STYLE_INPUT, "Mat khau nha", "Write a new password for this house:", "Doi", "Tro ve");
        if (listitem == 2) ShowPlayerDialog(playerid, DIALOG_HOUSE + 5, DIALOG_STYLE_LIST, "Khoa Ngoi Nha", "Chua Bi Khoa\nKhoa Mat Khau\nChi Chu So Huu", "Doi", "Tro ve");
        if (listitem == 3)
        {
            new string[128];
            format(string, sizeof(string), "Lay tien tu ket sat {2ECC71}($%s)\nDat tien vao ket sat {2ECC71}($%s)", FormatMoney(HouseData[id][SafeMoney]), FormatMoney(GetPlayerMoney(playerid)));
            ShowPlayerDialog(playerid, DIALOG_HOUSE + 6, DIALOG_STYLE_LIST, "Ket Sat", string, "Chon", "Tro ve");
        }

        if (listitem == 4) ShowPlayerDialog(playerid, DIALOG_HOUSE + 11, DIALOG_STYLE_LIST, "Noi That", "Mua Noi That\nChinh Sua Noi That\nBan Noi That\nBan Tat Ca Noi That", "Chon", "Tro ve");
        if (listitem == 5) ShowPlayerDialog(playerid, DIALOG_HOUSE + 9, DIALOG_STYLE_LIST, "Vu Khi", "Cat Vu Khi\nLay Vu Khi", "Chon", "Tro ve");
        if (listitem == 6)
        {
            new money = floatround(HouseData[id][Price] * 0.85) + HouseData[id][SafeMoney];
            GivePlayerMoney(playerid, money);
            ResetHouse(id);
            SaveHouseData(id);
            SaveHouseFurnitureData(id);
        }

        return 1;
    }

    if (dialogid == DIALOG_HOUSE + 3)
    {
        if (!response) return ShowHouseMenu(playerid);
        new id = InHouse[playerid], name[24];
        if (id == INVALID_NUMBER) return SendClientMessage(playerid, 0xE74C3CFF, "He Thong House: Ban khong o trong mot ngoi nha nao.");
        GetPlayerName(playerid, name, MAX_PLAYER_NAME);
        if (strcmp(HouseData[id][Owner], name)) return SendClientMessage(playerid, 0xE74C3CFF, "He Thong House: Ban khong phai la chu so huu cua ngoi nha nay.");
        if (!(1 <= strlen(inputtext) <= MAX_HOUSE_NAME)) return ShowPlayerDialog(playerid, DIALOG_HOUSE + 3, DIALOG_STYLE_INPUT, "Ten Ngoi Nha", "Viet ten moi cho ngoi nha nay:\n\n{E74C3C}Ten ban nhap qua ngan hoac qua dai.", "Doi", "Tro ve");
        format(HouseData[id][Name], MAX_HOUSE_NAME, "%s", inputtext);
        HouseData[id][Save] = true;

        new label[200];
        format(label, sizeof(label), "{E67E22}%s's House (ID: %d)\n{FFFFFF}%s\n{FFFFFF}%s\n%s", HouseData[id][Owner], id, HouseData[id][Name], HouseInteriors[ HouseData[id][Interior] ][IntName], LockNames[ HouseData[id][LockMode] ]);
        UpdateDynamic3DTextLabelText(HouseData[id][HouseLabel], 0xFFFFFFFF, label);
        ShowHouseMenu(playerid);
        return 1;
    }

    if (dialogid == DIALOG_HOUSE + 4)
    {
        if (!response) return ShowHouseMenu(playerid);
        new id = InHouse[playerid], name[24];
        if (id == INVALID_NUMBER) return SendClientMessage(playerid, 0xE74C3CFF, "He Thong House: Ban khong o trong mot ngoi nha nao.");
        GetPlayerName(playerid, name, MAX_PLAYER_NAME);
        if (strcmp(HouseData[id][Owner], name)) return SendClientMessage(playerid, 0xE74C3CFF, "He Thong House: Ban khong phai la chu so huu cua ngoi nha nay.");
        if (!(1 <= strlen(inputtext) <= MAX_HOUSE_PASSWORD)) return ShowPlayerDialog(playerid, DIALOG_HOUSE + 3, DIALOG_STYLE_INPUT, "Ten Ngoi Nha", "Viet ten moi cho ngoi nha nay:\n\n{E74C3C}Ten ban nhap qua ngan hoac qua dai.", "Doi", "Tro Ve");
        format(HouseData[id][Password], MAX_HOUSE_PASSWORD, "%s", inputtext);
        HouseData[id][Save] = true;
        ShowHouseMenu(playerid);
        return 1;
    }

    if (dialogid == DIALOG_HOUSE + 5)
    {
        if (!response) return ShowHouseMenu(playerid);
        new id = InHouse[playerid], name[24];
        if (id == INVALID_NUMBER) return SendClientMessage(playerid, 0xE74C3CFF, "He Thong House: Ban khong o trong mot ngoi nha nao.");
        GetPlayerName(playerid, name, MAX_PLAYER_NAME);
        if (strcmp(HouseData[id][Owner], name)) return SendClientMessage(playerid, 0xE74C3CFF, "He Thong House: Ban khong phai la chu so huu cua ngoi nha nay.");
        HouseData[id][LockMode] = listitem;
        HouseData[id][Save] = true;

        new label[200];
        format(label, sizeof(label), "{E67E22}%s's House (ID: %d)\n{FFFFFF}%s\n{FFFFFF}%s\n%s", HouseData[id][Owner], id, HouseData[id][Name], HouseInteriors[ HouseData[id][Interior] ][IntName], LockNames[ HouseData[id][LockMode] ]);
        UpdateDynamic3DTextLabelText(HouseData[id][HouseLabel], 0xFFFFFFFF, label);
        ShowHouseMenu(playerid);
        return 1;
    }

    if (dialogid == DIALOG_HOUSE + 6)
    {
        if (!response) return ShowHouseMenu(playerid);
        if (listitem == 0) ShowPlayerDialog(playerid, DIALOG_HOUSE + 7, DIALOG_STYLE_INPUT, "Ket Sat: Lay Tien", "Nhap so tien ban muon lay tu ket sat:", "Lay", "Tro Ve");
        if (listitem == 1) ShowPlayerDialog(playerid, DIALOG_HOUSE + 8, DIALOG_STYLE_INPUT, "Ket Sat: Cat Tien", "Nhap so tien ban muon cat vao ket sat:", "Cat", "Tro Ve");
        return 1;
    }

    if (dialogid == DIALOG_HOUSE + 7)
    {
        if (!response) return ShowHouseMenu(playerid);
        new id = InHouse[playerid], name[24];
        if (id == INVALID_NUMBER) return SendClientMessage(playerid, 0xE74C3CFF, "He Thong House: Ban khong o trong mot ngoi nha nao.");
        GetPlayerName(playerid, name, MAX_PLAYER_NAME);
        if (strcmp(HouseData[id][Owner], name)) return SendClientMessage(playerid, 0xE74C3CFF, "He Thong House: Ban khong phai la chu so huu cua ngoi nha nay.");
        new amount = strval(inputtext);
        if (!(1 <= amount <= 10000000)) return ShowPlayerDialog(playerid, DIALOG_HOUSE + 7, DIALOG_STYLE_INPUT, "Ket Sat: Lay Tien", "Nhap so tien ban muon lay tu ket sat:\n\n{E74C3C}So tien khong hop le. Ban co the nhan tu $1 - $10,000,000 mot lan rut", "Lay", "Tro Ve");
        if (amount > HouseData[id][SafeMoney]) return ShowPlayerDialog(playerid, DIALOG_HOUSE + 7, DIALOG_STYLE_INPUT, "Ket Sat: Lay Tien", "Nhap so tien ban muon lay tu ket sat:\n\n{E74C3C}Ban khong the rut nhieu hon so tien trong ket sat cua minh", "Lay", "Tro Ve");
        GivePlayerMoney(playerid, amount);
        HouseData[id][SafeMoney] -= amount;
        HouseData[id][Save] = true;
        ShowHouseMenu(playerid);
        SaveHouseData(id);
        SaveHouseFurnitureData(id);
        return 1;
    }

    if (dialogid == DIALOG_HOUSE + 8)
    {
        if (!response) return ShowHouseMenu(playerid);
        new id = InHouse[playerid], name[24];
        if (id == INVALID_NUMBER) return SendClientMessage(playerid, 0xE74C3CFF, "He Thong House: Ban khong o trong mot ngoi nha nao.");
        GetPlayerName(playerid, name, MAX_PLAYER_NAME);
        if (strcmp(HouseData[id][Owner], name)) return SendClientMessage(playerid, 0xE74C3CFF, "He Thong House: Ban khong phai la chu so huu cua ngoi nha nay.");
        new amount = strval(inputtext);
        if (!(1 <= amount <= 10000000)) return ShowPlayerDialog(playerid, DIALOG_HOUSE + 8, DIALOG_STYLE_INPUT, "Ket Sat: Cat Tien", "Nhap so tien ban muon cat vao trong ket sat::\n\n{E74C3C}So tien khong hop le. Ban co the nhan tu $1 - $10,000,000 mot lan cat", "Put", "Tro Ve");
        if (amount > GetPlayerMoney(playerid)) return ShowPlayerDialog(playerid, DIALOG_HOUSE + 8, DIALOG_STYLE_INPUT, "Ket Sat: Cat Tien", "Nhap so tien ban muon cat vao trong ket sat::\n\n{E74C3C}Ban khong the cat nhieu hon so tien tren nguoi.", "Cat", "Tro Ve");
        GivePlayerMoney(playerid, -amount);
        HouseData[id][SafeMoney] += amount;
        HouseData[id][Save] = true;
        ShowHouseMenu(playerid);
        SaveHouseData(id);
        SaveHouseFurnitureData(id);
        return 1;
    }

    if (dialogid == DIALOG_HOUSE + 9)
    {
        if (!response) return ShowHouseMenu(playerid);
        new id = InHouse[playerid], name[24];
        if (id == INVALID_NUMBER) return SendClientMessage(playerid, 0xE74C3CFF, "He Thong House: Ban khong o trong mot ngoi nha nao.");
        GetPlayerName(playerid, name, MAX_PLAYER_NAME);
        if (strcmp(HouseData[id][Owner], name)) return SendClientMessage(playerid, 0xE74C3CFF, "He Thong House: Ban khong phai la chu so huu cua ngoi nha nay.");
        if (listitem == 0)
        {
            if (GetPlayerWeapon(playerid) == 0) return SendClientMessage(playerid, 0xE74C3CFF, "He Thong House: Ban khong the dat nam dam cua ban trong ngoi nha cua ban");
            new query[128], weapon = GetPlayerWeapon(playerid), ammo = GetPlayerAmmo(playerid);
            RemovePlayerWeapons(playerid, weapon);
            mysql_format(Handle(), query, sizeof(query), "INSERT INTO houseguns VALUES (%d, %d, %d) ON DUPLICATE KEY UPDATE Ammo=Ammo+%d", id, weapon, ammo, ammo);
            mysql_tquery(Handle(), query, "", "");
            ShowHouseMenu(playerid);
            SaveHouseData(id);
            SaveHouseFurnitureData(id);
        }

        if (listitem == 1)
        {
            new query[80], Cache:
            weapons;
            mysql_format(Handle(), query, sizeof(query), "SELECT WeaponID, Ammo FROM houseguns WHERE HouseID=%d ORDER BY WeaponID ASC", id);
            weapons = mysql_query(Handle(), query);
            new rows = cache_num_rows();
            if (rows)
            {
                new list[512], weapname[32];
                for (new i; i < rows; ++i)
                {
                    new _wid, _ammo;
                    cache_get_value_name_int(i, "WeaponID", _wid);
                    cache_get_value_name_int(i, "Ammo", _ammo);
                    GetWeaponName(_wid, weapname, sizeof(weapname));
                    format(list, sizeof(list), "%d. %s - %d Ammo\n", i + 1, weapname, _ammo);
                }

                ShowPlayerDialog(playerid, DIALOG_HOUSE + 10, DIALOG_STYLE_LIST, "Kho Vu Khi", list, "Lay", "Tro Ve");
            }
            else
            {
                SendClientMessage(playerid, 0xE74C3CFF, "He Thong House: Nha ban khong co vu khi.");
            }

            cache_delete(weapons);
            SaveHouseData(id);
            SaveHouseFurnitureData(id);
        }

        return 1;
    }

    if (dialogid == DIALOG_HOUSE + 10)
    {
        if (!response) return ShowHouseMenu(playerid);
        new id = InHouse[playerid], name[24];
        if (id == INVALID_NUMBER) return SendClientMessage(playerid, 0xE74C3CFF, "He Thong House: Ban khong o trong mot ngoi nha nao.");
        GetPlayerName(playerid, name, MAX_PLAYER_NAME);
        if (strcmp(HouseData[id][Owner], name)) return SendClientMessage(playerid, 0xE74C3CFF, "He Thong House: Ban khong phai la chu so huu cua ngoi nha nay.");
        new query[96], Cache:weapon;
        mysql_format(Handle(), query, sizeof(query), "SELECT WeaponID, Ammo FROM houseguns WHERE HouseID=%d ORDER BY WeaponID ASC LIMIT %d, 1", id, listitem);
        weapon = mysql_query(Handle(), query);
        new rows = cache_num_rows();
        if (rows)
        {
            new string[64], weapname[32], weaponid, _Ammo;
            cache_get_value_name_int(0, "WeaponID", weaponid);
            cache_get_value_name_int(0, "Ammo", _Ammo);
            GetWeaponName(weaponid, weapname, sizeof(weapname));
            GivePlayerWeapon(playerid, weaponid, _Ammo);
            format(string, sizeof(string), "He Thong House: Ban da lay %s tu nha cua ban.", weapname);
            SendClientMessage(playerid, 0xFFFFFFFF, string);
            mysql_format(Handle(), query, sizeof(query), "DELETE FROM houseguns WHERE HouseID=%d AND WeaponID=%d", id, weaponid);
            mysql_tquery(Handle(), query, "", "");
        }
        else
        {
            SendClientMessage(playerid, 0xE74C3CFF, "He Thong House: Khong the tim thay vu khi do.");
        }

        cache_delete(weapon);
        SaveHouseData(id);
        SaveHouseFurnitureData(id);
        return 1;
    }

    if (dialogid == DIALOG_HOUSE + 11)
    {
        if (!response) return ShowHouseMenu(playerid);
        new id = InHouse[playerid], name[24];
        if (id == INVALID_NUMBER) return SendClientMessage(playerid, 0xE74C3CFF, "He Thong House: Ban khong o trong mot ngoi nha nao.");
        GetPlayerName(playerid, name, MAX_PLAYER_NAME);
        if (strcmp(HouseData[id][Owner], name)) return SendClientMessage(playerid, 0xE74C3CFF, "He Thong House: Ban khong phai la chu so huu cua ngoi nha nay.");

        if (listitem == 0)
        {
            new list[512];
            for (new i; i < sizeof(HouseFurnitures); ++i)
            {
                format(list, sizeof(list), "%s%d\tID: %d\t%s\n", list, HouseFurnitures[i][Name], i + 1, FormatMoney(HouseFurnitures[i][Price]));
            }

            ShowPlayerDialog(playerid, DIALOG_HOUSE + 12, DIALOG_STYLE_PREVIEW_MODEL, "Mua Noi That", list, "Mua", "Tro Ve");
        }

        if (listitem == 1)
        {
            SelectMode[playerid] = SELECT_MODE_EDIT;
            BeginObjectSelecting(playerid);
            SendClientMessage(playerid, 0xFFFFFFFF, "He Thong House: Bam vao do noi that ban muon chinh sua.");
        }

        if (listitem == 2)
        {
            SelectMode[playerid] = SELECT_MODE_SELL;
            BeginObjectSelecting(playerid);
            SendClientMessage(playerid, 0xFFFFFFFF, "He Thong House: Bam vao do noi that ban muon ban.");
        }

        if (listitem == 3)
        {
            new money, sold, data[e_furniture], query[64];
            for (new i; i < Streamer_GetUpperBound(STREAMER_TYPE_OBJECT); ++i)
            {
                if (!IsValidDynamicObject(i)) continue;
                Streamer_GetArrayData(STREAMER_TYPE_OBJECT, i, E_STREAMER_EXTRA_ID, data);
                if (data[SQLID] > 0 && data[HouseID] == id)
                {
                    sold++;
                    money += HouseFurnitures[ data[ArrayID] ][Price];
                    DestroyDynamicObject(i);
                }
            }

            new string[64];
            format(string, sizeof(string), "He Thong House: Da ban %d noi that voi gia $%s", sold, FormatMoney(money));
            SendClientMessage(playerid, -1, string);
            GivePlayerMoney(playerid, money);

            mysql_format(Handle(), query, sizeof(query), "DELETE FROM housefurnitures WHERE HouseID=%d", id);
            mysql_tquery(Handle(), query, "", "");
            SaveHouseData(id);
            SaveHouseFurnitureData(id);
        }

        return 1;
    }

    if (dialogid == DIALOG_HOUSE + 12)
    {
        if (!response) return ShowHouseMenu(playerid);
        new id = InHouse[playerid], name[24];
        if (id == INVALID_NUMBER) return SendClientMessage(playerid, 0xE74C3CFF, "He Thong House: Ban khong o trong mot ngoi nha nao.");
        GetPlayerName(playerid, name, MAX_PLAYER_NAME);
        if (strcmp(HouseData[id][Owner], name)) return SendClientMessage(playerid, 0xE74C3CFF, "He Thong House: Ban khong phai la chu so huu cua ngoi nha nay.");
        if (HouseFurnitures[listitem][Price] > GetPlayerMoney(playerid)) return SendClientMessage(playerid, 0xE74C3CFF, "He Thong House: Ban khong the mua duoc do noi that nay");
        GivePlayerMoney(playerid, -HouseFurnitures[listitem][Price]);
        new Float:
        x, Float:
        y, Float:
                z;
        GetPlayerPos(playerid, x, y, z);
        GetXYInFrontOfPlayer(playerid, x, y, 3.0);
        new objectid = CreateDynamicObject(HouseFurnitures[listitem][ModelID], x, y, z, 0.0, 0.0, 0.0, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid)), query[256];
        mysql_format(Handle(), query, sizeof(query), "INSERT INTO housefurnitures SET HouseID=%d, FurnitureID=%d, FurnitureX=%f, FurnitureY=%f, FurnitureZ=%f, FurnitureVW=%d, FurnitureInt=%d", id, listitem, x, y, z, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
        new Cache:
            add = mysql_query(Handle(), query), data[e_furniture];
        data[SQLID] = cache_insert_id();
        data[HouseID] = id;
        data[ArrayID] = listitem;
        data[furnitureX] = x;
        data[furnitureY] = y;
        data[furnitureZ] = z;
        data[furnitureRX] = 0.0;
        data[furnitureRY] = 0.0;
        data[furnitureRZ] = 0.0;
        cache_delete(add);
        Streamer_SetArrayData(STREAMER_TYPE_OBJECT, objectid, E_STREAMER_EXTRA_ID, data);
        EditDynamicObject(playerid, objectid);
        SaveHouseData(id);
        SaveHouseFurnitureData(id);
        return 1;
    }

    if (dialogid == DIALOG_HOUSE + 13)
    {
        if (!response) return 1;
        new id = InHouse[playerid], name[24];
        if (id == INVALID_NUMBER) return SendClientMessage(playerid, 0xE74C3CFF, "He Thong House: Ban khong o trong mot ngoi nha nao.");
        GetPlayerName(playerid, name, MAX_PLAYER_NAME);
        if (strcmp(HouseData[id][Owner], name)) return SendClientMessage(playerid, 0xE74C3CFF, "He Thong House: Ban khong phai la chu so huu cua ngoi nha nay.");
        new objectid = GetPVarInt(playerid, "SelectedFurniture"), query[64], data[e_furniture];
        Streamer_GetArrayData(STREAMER_TYPE_OBJECT, objectid, E_STREAMER_EXTRA_ID, data);
        GivePlayerMoney(playerid, HouseFurnitures[ data[ArrayID] ][Price]);
        mysql_format(Handle(), query, sizeof(query), "DELETE FROM housefurnitures WHERE ID=%d", data[SQLID]);
        mysql_tquery(Handle(), query, "", "");
        DestroyDynamicObject(objectid);
        DeletePVar(playerid, "SelectedFurniture");
        SaveHouseData(id);
        SaveHouseFurnitureData(id);
        return 1;
    }

    return 0;
}

public OnPlayerSelectDynamicObject(playerid, objectid, modelid, Float: x, Float: y, Float: z)
{
    switch (SelectMode[playerid])
    {
        case SELECT_MODE_EDIT: EditDynamicObject(playerid, objectid);
        case SELECT_MODE_SELL:
        {
            EndObjectEditing(playerid);
            new data[e_furniture], string[128];
            SetPVarInt(playerid, "SelectedFurniture", objectid);
            Streamer_GetArrayData(STREAMER_TYPE_OBJECT, objectid, E_STREAMER_EXTRA_ID, data);
            format(string, sizeof(string), "Ban co muon ban %s cua minh khong?\nBan se nhan duoc {2ECC71}$%s.", HouseFurnitures[ data[ArrayID] ][Name], FormatMoney(HouseFurnitures[ data[ArrayID] ][Price]));
            ShowPlayerDialog(playerid, DIALOG_HOUSE + 13, DIALOG_STYLE_MSGBOX, "Xac nhan ban hang", string, "Ban", "Dong");
        }
    }

    return 1;
}

hook OnPlayerEditDynamicObject(playerid, objectid, response, Float: x, Float: y, Float: z, Float: rx, Float: ry, Float: rz)
{
    switch (response)
    {
        case EDIT_RESPONSE_CANCEL:
        {
            new data[e_furniture];
            Streamer_GetArrayData(STREAMER_TYPE_OBJECT, objectid, E_STREAMER_EXTRA_ID, data);
            SetDynamicObjectPos(objectid, data[furnitureX], data[furnitureY], data[furnitureZ]);
            SetDynamicObjectRot(objectid, data[furnitureRX], data[furnitureRY], data[furnitureRZ]);
        }

        case EDIT_RESPONSE_FINAL:
        {
            new data[e_furniture], query[256];
            Streamer_GetArrayData(STREAMER_TYPE_OBJECT, objectid, E_STREAMER_EXTRA_ID, data);
            data[furnitureX] = x;
            data[furnitureY] = y;
            data[furnitureZ] = z;
            data[furnitureRX] = rx;
            data[furnitureRY] = ry;
            data[furnitureRZ] = rz;
            SetDynamicObjectPos(objectid, data[furnitureX], data[furnitureY], data[furnitureZ]);
            SetDynamicObjectRot(objectid, data[furnitureRX], data[furnitureRY], data[furnitureRZ]);
            Streamer_SetArrayData(STREAMER_TYPE_OBJECT, objectid, E_STREAMER_EXTRA_ID, data);

            mysql_format(Handle(), query, sizeof(query), "UPDATE housefurnitures SET FurnitureX=%f, FurnitureY=%f, FurnitureZ=%f, FurnitureRX=%f, FurnitureRY=%f, FurnitureRZ=%f WHERE ID=%d", data[furnitureX], data[furnitureY], data[furnitureZ], data[furnitureRX], data[furnitureRY], data[furnitureRZ], data[SQLID]);
            mysql_tquery(Handle(), query, "", "");
        }
    }

    return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if (newkeys == KEY_CTRL_BACK)
    {
        EnterHouse(playerid);
        ExitHouse(playerid);
    }
    return 1;
}