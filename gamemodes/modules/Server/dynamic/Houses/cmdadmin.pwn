#include <a_samp>
#include <YSI\YSI_Coding\y_hooks>

CMD:money(playerid, params[])
{
    Character[playerid][char_Cash] += 1000000;
    return 1;
}

CMD:house(playerid, params[])
{
    foreach (new i: Houses)
    {
        if (IsPlayerInRangeOfPoint(playerid, 2.0, HouseInteriors[HouseData[i][Interior]][intX], HouseInteriors[HouseData[i][Interior]][intY], HouseInteriors[HouseData[i][Interior]][intZ]))
        {
            ShowHouseMenu(playerid);
            break;
        }
    }
    return 1;
}

CMD:createhouse(playerid, params[])
{
    if(!CheckAdmin(playerid, 4)) return SendErrorMessage(playerid, "Ban khong co quyen dung lenh nay");
    new interior, price;
    if (sscanf(params, "ii", price, interior)) return SendClientMessage(playerid, 0xE74C3CFF, "USAGE: /createhouse [gia] [id noi that]");
    if (!(0 <= interior <= sizeof(HouseInteriors) - 1)) return SendClientMessage(playerid, 0xE74C3CFF, "He Thong House: ID noi that ban da nhap khong ton tai.");
    new id = Iter_Free(Houses);
    if (id == -1) return SendClientMessage(playerid, 0xE74C3CFF, "He Thong House: Ban khong the tao them nha.");
    SetPVarInt(playerid, "HousePickupCooldown", tickcount() + 8000);
    format(HouseData[id][Name], MAX_HOUSE_NAME, "Nha Dang Rao Ban!");
    format(HouseData[id][Owner], MAX_PLAYER_NAME, "-");
    format(HouseData[id][Password], MAX_HOUSE_PASSWORD, "-");
    GetPlayerPos(playerid, HouseData[id][houseX], HouseData[id][houseY], HouseData[id][houseZ]);
    HouseData[id][ExVW] = GetPlayerVirtualWorld(playerid);
    HouseData[id][ExInterior] = GetPlayerInterior(playerid);
    HouseData[id][Price] = price;
    HouseData[id][Interior] = interior;
    HouseData[id][LockMode] = LOCK_MODE_NOLOCK;
    HouseData[id][SafeMoney] = 0;
    HouseData[id][LastEntered] = 0;
    HouseData[id][Save] = true;

    new label[200];
    format(label, sizeof(label), "{2ECC71}Nha Dang Rao Ban (ID: %d)\n{FFFFFF}%s\n{F1C40F}Gia ban: {2ECC71}$%s", id, HouseInteriors[interior][IntName], convertNumber(price));
    HouseData[id][HouseLabel] = CreateDynamic3DTextLabel(label, 0xFFFFFFFF, HouseData[id][houseX], HouseData[id][houseY], HouseData[id][houseZ] + 0.35, 15.0, .testlos = 1);
    HouseData[id][HousePickup] = CreateDynamicPickup(1273, 1, HouseData[id][houseX], HouseData[id][houseY], HouseData[id][houseZ]);
    HouseData[id][HouseIcon] = CreateDynamicMapIcon(HouseData[id][houseX], HouseData[id][houseY], HouseData[id][houseZ], 31, 0);

    new query[1080];
    mysql_format(Handle(), query, sizeof(query), "INSERT INTO houses SET id=%d, HouseX=%f, HouseY=%f, HouseZ=%f, HousePrice=%d, HouseInterior=%d", id, HouseData[id][houseX], HouseData[id][houseY], HouseData[id][houseZ], price, interior);
    printf("%s",query);
    mysql_tquery(Handle(), query);
    Iter_Add(Houses, id);
    SaveHouseData(id);
    SaveHouseFurnitureData(id);
    return 1;
}

CMD:hinterior(playerid, params[])
{
    if(!CheckAdmin(playerid, 4)) return SendErrorMessage(playerid, "Ban khong co quyen dung lenh nay");
    new id, interior;
    if (sscanf(params, "ii", id, interior)) return SendClientMessage(playerid, 0xE74C3CFF, "USAGE: /hinterior [house id] [id noi that]");
    if (!Iter_Contains(Houses, id)) return SendClientMessage(playerid, 0xE74C3CFF, "He Thong House: ID noi that ban da nhap khong ton tai.");
    if (!(0 <= interior <= sizeof(HouseInteriors) - 1)) return SendClientMessage(playerid, 0xE74C3CFF, "He Thong House: ID noi that ban da nhap khong ton tai.");
    HouseData[id][Interior] = interior;

    new query[64], label[200];
    mysql_format(Handle(), query, sizeof(query), "UPDATE houses SET HouseInterior=%d WHERE ID=%d", interior, id);
    mysql_tquery(Handle(), query, "", "");

    if (!strcmp(HouseData[id][Owner], "-"))
    {
        format(label, sizeof(label), "{2ECC71}Nha Dang Rao Ban (ID: %d)\n{FFFFFF}%s\n{F1C40F}Price: {2ECC71}$%s", id, HouseInteriors[interior][IntName], convertNumber(HouseData[id][Price]));
    }
    else
    {
        format(label, sizeof(label), "{E67E22}%s's House (ID: %d)\n{FFFFFF}%s\n{FFFFFF}%s\n%s", HouseData[id][Owner], id, HouseData[id][Name], HouseInteriors[interior][IntName], LockNames[ HouseData[id][LockMode] ]);
    }

    UpdateDynamic3DTextLabelText(HouseData[id][HouseLabel], 0xFFFFFFFF, label);
    SendClientMessage(playerid, -1, "He Thong House: Noi that da duoc cap nhat.");
    SaveHouseData(id);
    SaveHouseFurnitureData(id);
    return 1;
}

CMD:hsetprice(playerid, params[])
{
    if(!CheckAdmin(playerid, 4)) return SendErrorMessage(playerid, "Ban khong co quyen dung lenh nay");
    if (!IsPlayerAdmin(playerid)) return SendClientMessage(playerid, 0xE74C3CFF, "He Thong House: Ban khong the su dung lenh nay.");
    new id, price;
    if (sscanf(params, "ii", id, price)) return SendClientMessage(playerid, 0xE74C3CFF, "USAGE: /hsetprice [house id] [gia]");
    if (!Iter_Contains(Houses, id)) return SendClientMessage(playerid, 0xE74C3CFF, "He Thong House: ID nha ban da nhap khong ton tai");
    HouseData[id][Price] = price;

    new query[64], label[200];
    mysql_format(Handle(), query, sizeof(query), "UPDATE houses SET HousePrice=%d WHERE ID=%d", price, id);
    mysql_tquery(Handle(), query, "", "");

    if (!strcmp(HouseData[id][Owner], "-"))
    {
        format(label, sizeof(label), "{2ECC71}Nha Dang Rao Ban (ID: %d)\n{FFFFFF}%s\n{F1C40F}Price: {2ECC71}$%s", id, HouseInteriors[ HouseData[id][Interior] ][IntName], convertNumber(price));
    }
    else
    {
        format(label, sizeof(label), "{E67E22}%s's House (ID: %d)\n{FFFFFF}%s\n{FFFFFF}%s\n%s", HouseData[id][Owner], id, HouseData[id][Name], HouseInteriors[ HouseData[id][Interior] ][IntName], LockNames[ HouseData[id][LockMode] ]);
    }

    UpdateDynamic3DTextLabelText(HouseData[id][HouseLabel], 0xFFFFFFFF, label);
    SendClientMessage(playerid, -1, "He Thong House: Da cap nhat gia ban nha.");
    SaveHouseData(id);
    SaveHouseFurnitureData(id);
    return 1;
}

CMD:resethouse(playerid, params[])
{
    if(!CheckAdmin(playerid, 4)) return SendErrorMessage(playerid, "Ban khong co quyen dung lenh nay");
    if (!IsPlayerAdmin(playerid)) return SendClientMessage(playerid, 0xE74C3CFF, "He Thong House: Ban khong the su dung lenh nay.");
    new id;
    if (sscanf(params, "i", id)) return SendClientMessage(playerid, 0xE74C3CFF, "USAGE: /resethouse [house id]");
    if (!Iter_Contains(Houses, id)) return SendClientMessage(playerid, 0xE74C3CFF, "He Thong House: ID nha ban da nhap khong ton tai");
    ResetHouse(id);
    SendClientMessage(playerid, -1, "He Thong House: Dat lai nha.");
    SaveHouseData(id);
    SaveHouseFurnitureData(id);
    return 1;
}

CMD:deletehouse(playerid, params[])
{
    if(!CheckAdmin(playerid, 4)) return SendErrorMessage(playerid, "Ban khong co quyen dung lenh nay");

    if (!IsPlayerAdmin(playerid)) return SendClientMessage(playerid, 0xE74C3CFF, "He Thong House: Ban khong the su dung lenh nay.");
    new id;
    if (sscanf(params, "i", id)) return SendClientMessage(playerid, 0xE74C3CFF, "USAGE: /deletehouse [house id]");
    if (!Iter_Contains(Houses, id)) return SendClientMessage(playerid, 0xE74C3CFF, "He Thong House: ID nha ban da nhap khong ton tai");
    ResetHouse(id);
    DestroyDynamic3DTextLabel(HouseData[id][HouseLabel]);
    DestroyDynamicPickup(HouseData[id][HousePickup]);
    DestroyDynamicMapIcon(HouseData[id][HouseIcon]);
    Iter_Remove(Houses, id);
    HouseData[id][HouseLabel] = Text3D: INVALID_3DTEXT_ID;
    HouseData[id][HousePickup] = -1;
    HouseData[id][HouseIcon] = -1;
    HouseData[id][Save] = false;

    new query[64];
    mysql_format(Handle(), query, sizeof(query), "DELETE FROM houses WHERE ID=%d", id);
    mysql_tquery(Handle(), query, "", "");
    SendClientMessage(playerid, -1, "He Thong House: Nha da bi xoa.");
    SaveHouseData(id);
    SaveHouseFurnitureData(id);

    return 1;
}


CMD:gotohouse(playerid, params[])
{
    if(!CheckAdmin(playerid, 4)) return SendErrorMessage(playerid, "Ban khong co quyen dung lenh nay");

    new housenum, string[128];
    if (sscanf(params, "d", housenum)) return SendClientMessage(playerid, COLOR_GREY, "USAGE: /gotohouse [housenumber]");

    if (housenum <= 0 || housenum >= MAX_HOUSES)
    {
        format(string, sizeof(string), "He Thong House: ID Nha phai nam trong khoan tu 1 den %d.", MAX_HOUSES - 1);
        return SendClientMessage(playerid, COLOR_GREY, string);
    }

    SetPlayerPos(playerid, HouseData[housenum][houseX], HouseData[housenum][houseY], HouseData[housenum][houseZ]);
    Character[playerid][char_Interior] = HouseData[housenum][Interior];
    SetPlayerInterior(playerid, HouseData[housenum][Interior]);
    Character[playerid][char_VW] = HouseData[housenum][furnitureVW];
    SetPlayerVirtualWorld(playerid, HouseData[housenum][furnitureVW]);
    GameTextForPlayer(playerid, "~w~Teleporting", 5000, 1);
    SetPlayerInterior(playerid, 0);
    Character[playerid][char_Interior] = 0;

    return 1;
}


