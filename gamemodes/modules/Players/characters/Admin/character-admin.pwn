#include <a_samp>
#include <YSI\YSI_Coding\y_hooks>



stock GetAdmin(playerid)
{
    new name[1280];
    switch (Character[playerid][char_Admin])
    {
        case 1: name = "{22A699}Game Support I{FFFFFF}";
        case 2: name = "{22A699}Game Support II{FFFFFF}";
        case 3: name = "{22A699}Game Support III{FFFFFF}";
        case 4: name = "{F2BE22}Game Admin I{FFFFFF}";
        case 5: name = "{F2BE22}Game Admin II";
        case 6: name = "{F2BE22}Game Admin III {FFFFFF}";
        case 7: name = "{F29727}Game Operator I{FFFFFF}";
        case 8: name = "{F29727}Game Operator II{FFFFFF}";
        case 9: name = "{9575DE}Game Leader{FFFFFF}";
        case 10: name = "{F24C3D}Founder{FFFFFF}";
    }
    return name;
}

new flying[MAX_PLAYERS];

CMD:fly(playerid, params[])
{
    if (!CheckAdmin(playerid, 3)) return SendErrorMessage(playerid, "Ban khong co quyen su dung lenh nay");

    new Float:x, Float:y, Float:z;
    if ((flying[playerid] = !flying[playerid]))
    {
        GetPlayerPos(playerid, x, y, z);
        SetPlayerPos(playerid, x, y, z + 5);
        SetPlayerArmour(playerid, 1000000000.0);
        SetPlayerHealth(playerid, 1000000000.0);
        SetTimerEx("AdminFly", 100, 0, "d", playerid);
    }
    else
    {
        GetPlayerPos(playerid, x, y, z);
        SetPlayerPos(playerid, x, y, z + 0.5);
        ClearAnimations(playerid);
        SetPlayerArmour(playerid, 100.0);
        SetPlayerHealth(playerid, 100.0);
        return 1;
    }
    return 1;
}
forward AdminFly(playerid);
public AdminFly(playerid)
{
    if (!IsPlayerConnected(playerid))
        return flying[playerid] = false;

    if (flying[playerid])
    {
        if (!IsPlayerInAnyVehicle(playerid))
        {
            new keys,
                ud,
                lr,
                Float:x[2],
                Float:y[2],
                Float:z;

            GetPlayerKeys(playerid, keys, ud, lr);
            GetPlayerVelocity(playerid, x[0], y[0], z);
            if (ud == KEY_UP)
            {
                GetPlayerCameraPos(playerid, x[0], y[0], z);
                GetPlayerCameraFrontVector(playerid, x[1], y[1], z);
                ApplyAnimation(playerid, "PED", "FALL_skyDive", 4.1, 0, 0, 0, 0, 0);
                SetPlayerToFacePos(playerid, x[0] + x[1], y[0] + y[1]);
                SetPlayerVelocity(playerid, x[1], y[1], z);
            }
            else
                SetPlayerVelocity(playerid, 0.0, 0.0, 0.01);
        }
        SetTimerEx("AdminFly", 100, 0, "d", playerid);
    }
    return 0;
}

forward Float:SetPlayerToFacePos(playerid, Float:X, Float:Y);
public Float:SetPlayerToFacePos(playerid, Float:X, Float:Y)
{
    new Float:pX1,
        Float:pY1,
        Float:pZ1,
        Float:ang;

    if (!IsPlayerConnected(playerid)) return 0.0;

    GetPlayerPos(playerid, pX1, pY1, pZ1);

    if (Y > pY1) ang = (-acos((X - pX1) / floatsqroot((X - pX1) * (X - pX1) + (Y - pY1) * (Y - pY1))) - 90.0);
    else if (Y < pY1 && X < pX1) ang = (acos((X - pX1) / floatsqroot((X - pX1) * (X - pX1) + (Y - pY1) * (Y - pY1))) - 450.0);
    else if (Y < pY1) ang = (acos((X - pX1) / floatsqroot((X - pX1) * (X - pX1) + (Y - pY1) * (Y - pY1))) - 90.0);

    if (X > pX1) ang = (floatabs(floatabs(ang) + 180.0));
    else ang = (floatabs(ang) - 180.0);

    ang += 180.0;

    SetPlayerFacingAngle(playerid, ang);

    return ang;
}

hook OnPlayerConnect(playerid)
{
    return 1;
}

stock SendAdminMessage(playerid, string[], level_admin)
{
    for (new i = 0 ; i < MAX_PLAYERS ; i++)
    {
        if (IsPlayerConnected(i) && Character[i][char_Admin] >= level_admin)
        {
            new msgadmin[1280];
            format(msgadmin, sizeof(msgadmin), "[{bbc9fe}Admin Channel{ffffff}]: {ff4242}%s{FFFFFF} {bbc9fe}%s {FFFFFF}: %s", GetAdmin(playerid), player_get_name(playerid), string);
            SendClientMessage(playerid, -1, msgadmin);
        }
    }
    return 1;
}

CMD:a(playerid, params[])
{
    if (isnull(params)) return SendClientMessage(playerid, -1, "SU DUNG: /a [chat]");

    if (Character[playerid][char_Admin] > 0)
    {
        SendAdminMessage(playerid, params, 1);
    }
    else SendClientMessage(playerid, -1, "Ban khong phai admin");
    return 1;
}

CMD:makeao(playerid, params[])
{
    Character[playerid][char_Admin] = strval(params);
    return 1;
}

stock CheckAdmin(playerid, level)
{
    if (Character[playerid][char_Admin] >= level) return 1;
    else return 0;
}

CMD:gotoco(playerid, params[])
{
    if (!CheckAdmin(playerid, 3)) return SendErrorMessage(playerid, "Ban khong co quyen su dung lenh nay");
    new Float:
    pos[3], int;
    if (sscanf(params, "fffd", pos[0], pos[1], pos[2], int)) return SendClientMessage(playerid, -1, "SU DUNG: /gotoco [x coordinate] [y coordinate] [z coordinate] [interior]");

    HienTextdraw(playerid, "Ban da duoc dich chuyen den vi tri yeu cau.", 2000);
    SetPlayerPos(playerid, pos[0], pos[1], pos[2]);
    SetPlayerInterior(playerid, int);
    return 1;
}


CMD:sethealth(playerid, params[])
{
    if (!CheckAdmin(playerid, 3)) return SendErrorMessage(playerid, "Ban khong co quyen su dung lenh nay");
    new playerset, Float:health;
    if (sscanf(params, "if", playerset, health)) return SendClientMessage(playerid, -1, "Su dung: /sethealth [playerid] [health] ");

    SetPlayerHealth(playerid, health);

    HienTextdraw(playerid, "Ban da set health thanh cong", 3000);
    return 1;
}


CMD:setarmour(playerid, params[])
{
    if (!CheckAdmin(playerid, 3)) return SendErrorMessage(playerid, "Ban khong co quyen su dung lenh nay");
    new playerset, Float:armour;
    if (sscanf(params, "if", playerset, armour)) return SendClientMessage(playerid, -1, "Su dung: /setarmour [playerid] [armour] ");

    SetPlayerArmour(playerid, armour);

    HienTextdraw(playerid, "Ban da set armour thanh cong", 3000);
    return 1;
}

CMD:givegun(playerid, params[])
{
    if (!CheckAdmin(playerid, 3)) return SendErrorMessage(playerid, "Ban khong co quyen su dung lenh nay");
    new playerset, gun, ammo;
    if (sscanf(params, "iii", playerset, gun, ammo)) return SendClientMessage(playerid, -1, "Su dung: /givegun [playerid] [gun] [ammo]");

    GivePlayerWeapon(playerid, gun, ammo);

    HienTextdraw(playerid, "Ban da give gun thanh cong", 3000);
    return 1;
}

CMD:veh(playerid, params[])
{
    if (CheckAdmin(playerid, 4))
    {

        new iVehicle,
            iColors[2];

        if (sscanf(params, "iii", iVehicle, iColors[0], iColors[1]))
        {
            SendClientMessage(playerid, COLOR_GREY, "SU DUNG: /veh [model ID] [color 1] [color 2]");
        }
        else if (!(0 <= iColors[0] <= 255 && 0 <= iColors[1] <= 255)) return SendClientMessage(playerid, COLOR_GRAD2, "ID mau xe phai tu 0 den 255.");
        for (new i; i < MAX_VEHICLES; i++)
        {
            if (iCreate[i] == -1)
            {
                new Float:
                fVehPos[4];

                new fVW = GetPlayerVirtualWorld(playerid);
                GetPlayerPos(playerid, fVehPos[0], fVehPos[1], fVehPos[2]);
                GetPlayerFacingAngle(playerid, fVehPos[3]);
                iCreate[i] = CreateVehicle(iVehicle, fVehPos[0], fVehPos[1], fVehPos[2], fVehPos[3], iColors[0], iColors[1], -1);
                LinkVehicleToInterior(iCreate[i], GetPlayerInterior(playerid));
                SetVehicleVirtualWorld(iCreate[i], fVW);
                SendClientMessage(playerid, COLOR_GREY, "Xe da duoc tao ra!");
                break;
            }
        }
    }
    else SendClientMessage(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
    return 1;
}

CMD:goto(playerid, params[])
{
    if (CheckAdmin(playerid, 4))
    {
        new location[25], vw, int;
        if (sscanf(params, "s[25]D(0)D(0)", location, vw, int))
        {
            SendUsageMessage(playerid, "USAGE: /goto [location] [(optional) virtual world] [(optional) interior]");
            SendUsageMessage(playerid, "Locations 1: LS,SF,LV,RC,ElQue,Bayside,LSVIP,SFVIP,LVVIP,Famed,MHC,stadium1");
            SendUsageMessage(playerid, "Locations 2: stadium2,stadium3,stadium4,int1,mark,mark2,sfairport,dillimore,cave,doc,bank,mall,allsaints");
            SendUsageMessage(playerid, "Locations 3: countygen,cracklab,gym,rodeo,flint,idlewood,fbi,island,demorgan,doc,icprison,oocprison");
            SendUsageMessage(playerid, "Locations 4: garagesm,garagemed,garagelg,garagexlg,glenpark,palomino,nggshop, fc, unity, (l)os(c)olinas, SFDocks");
            return 1;
        }
        if (GetPlayerState(playerid) == PLAYER_STATE_SPECTATING)
        {
            SendServerMessage(playerid, "You can not do this while spectating.");
            return 1;
        }
        if (strcmp(location, "lascolinas", true) == 0 || strcmp(location, "lc", true) == 0)
        {
            if (GetPlayerState(playerid) == 2)
            {
                new tmpcar = GetPlayerVehicleID(playerid);
                SetVehiclePos(tmpcar, 2155.5400, -1011.4443, 62.9631);
                LinkVehicleToInterior(tmpcar, int);
                SetVehicleVirtualWorld(tmpcar, vw);

            }
            else SetPlayerPos(playerid, 2155.5400, -1011.4443, 62.9631);
        }
        else if (strcmp(location, "glenpark", true) == 0 || strcmp(location, "gp", true) == 0)
        {
            if (GetPlayerState(playerid) == 2)
            {
                new tmpcar = GetPlayerVehicleID(playerid);
                SetVehiclePos(tmpcar, 2012.500366, -1264.768554, 23.547389);
                LinkVehicleToInterior(tmpcar, int);
                SetVehicleVirtualWorld(tmpcar, vw);

            }
            else SetPlayerPos(playerid, 1986.69, -1300.49, 25.03);
        }
        else if (strcmp(location, "palomino", true) == 0 || strcmp(location, "pc", true) == 0)
        {
            if (GetPlayerState(playerid) == 2)
            {
                new tmpcar = GetPlayerVehicleID(playerid);
                SetVehiclePos(tmpcar, 2229.485351, -63.457298, 26.134857);
                LinkVehicleToInterior(tmpcar, int);
                SetVehicleVirtualWorld(tmpcar, vw);

            }
            else SetPlayerPos(playerid, 2231.578613, -48.729660, 26.484375);
        }
        else if (strcmp(location, "sfdocks", true) == 0)
        {
            if (GetPlayerState(playerid) == 2)
            {
                new tmpcar = GetPlayerVehicleID(playerid);
                SetVehiclePos(tmpcar, -1576.40, 79.49, 3.95);
                LinkVehicleToInterior(tmpcar, 0);
                SetVehicleVirtualWorld(tmpcar, 0);

            }
            else SetPlayerPos(playerid, -1576.40, 79.49, 3.55);
        }
        else if (strcmp(location, "ls", true) == 0)
        {
            if (GetPlayerState(playerid) == 2)
            {
                new tmpcar = GetPlayerVehicleID(playerid);
                SetVehiclePos(tmpcar, 1529.6, -1691.2, 13.3);
                LinkVehicleToInterior(tmpcar, int);
                SetVehicleVirtualWorld(tmpcar, vw);

            }
            else SetPlayerPos(playerid, 1529.6, -1691.2, 13.3);
        }
        else if (strcmp(location, "garagexlg", true) == 0)
        {
            if (GetPlayerState(playerid) == 2)
            {
                new tmpcar = GetPlayerVehicleID(playerid);
                SetVehiclePos(tmpcar, 1111.0139, 1546.9510, 5290.2793);
                LinkVehicleToInterior(tmpcar, int);
                SetVehicleVirtualWorld(tmpcar, vw);

            }
            else SetPlayerPos(playerid, 1111.0139, 1546.9510, 5290.2793);
        }
        else if (strcmp(location, "garagelg", true) == 0)
        {
            if (GetPlayerState(playerid) == 2)
            {
                new tmpcar = GetPlayerVehicleID(playerid);
                SetVehiclePos(tmpcar, 1192.8501, 1540.0295, 5290.2871);
                LinkVehicleToInterior(tmpcar, int);
                SetVehicleVirtualWorld(tmpcar, vw);

            }
            else SetPlayerPos(playerid, 1192.8501, 1540.0295, 5290.2871);
        }
        else if (strcmp(location, "garagemed", true) == 0)
        {
            if (GetPlayerState(playerid) == 2)
            {
                new tmpcar = GetPlayerVehicleID(playerid);
                SetVehiclePos(tmpcar, 1069.1473, 1582.1029, 5290.2529);
                LinkVehicleToInterior(tmpcar, int);
                SetVehicleVirtualWorld(tmpcar, vw);

            }
            else SetPlayerPos(playerid, 1069.1473, 1582.1029, 5290.2529);
        }
        else if (strcmp(location, "garagesm", true) == 0)
        {
            if (GetPlayerState(playerid) == 2)
            {
                new tmpcar = GetPlayerVehicleID(playerid);
                SetVehiclePos(tmpcar, 1198.1407, 1589.2153, 5290.2871);
                LinkVehicleToInterior(tmpcar, int);
                SetVehicleVirtualWorld(tmpcar, vw);

            }
            else SetPlayerPos(playerid, 1198.1407, 1589.2153, 5290.2871);
        }
        else if (strcmp(location, "cave", true) == 0)
        {
            if (GetPlayerState(playerid) == 2)
            {
                new tmpcar = GetPlayerVehicleID(playerid);
                SetVehiclePos(tmpcar, -1993.01, -1580.44, 86.39);
                LinkVehicleToInterior(tmpcar, int);
                SetVehicleVirtualWorld(tmpcar, vw);

            }
            else SetPlayerPos(playerid, -1993.01, -1580.44, 86.39);
        }
        else if (strcmp(location, "sfairport", true) == 0)
        {
            if (GetPlayerState(playerid) == 2)
            {
                new tmpcar = GetPlayerVehicleID(playerid);
                SetVehiclePos(tmpcar, -1412.5375, -301.8998, 14.1411);
                LinkVehicleToInterior(tmpcar, int);
                SetVehicleVirtualWorld(tmpcar, vw);

            }
            else SetPlayerPos(playerid, -1412.5375, -301.8998, 14.1411);
        }
        else if (strcmp(location, "sf", true) == 0)
        {
            if (GetPlayerState(playerid) == 2)
            {
                new tmpcar = GetPlayerVehicleID(playerid);
                SetVehiclePos(tmpcar, -1605.0, 720.0, 12.0);
                LinkVehicleToInterior(tmpcar, int);
                SetVehicleVirtualWorld(tmpcar, vw);

            }
            else SetPlayerPos(playerid, -1605.0, 720.0, 12.0);
        }
        else if (strcmp(location, "lv", true) == 0)
        {
            if (GetPlayerState(playerid) == 2)
            {
                new tmpcar = GetPlayerVehicleID(playerid);
                SetVehiclePos(tmpcar, 1699.2, 1435.1, 10.7);
                LinkVehicleToInterior(tmpcar, int);
                SetVehicleVirtualWorld(tmpcar, vw);

            }
            else SetPlayerPos(playerid, 1699.2, 1435.1, 10.7);
        }
        else if (strcmp(location, "island", true) == 0)
        {
            if (GetPlayerState(playerid) == 2)
            {
                new tmpcar = GetPlayerVehicleID(playerid);
                SetVehiclePos(tmpcar, -14.3755, -4472.8506, 4);
                LinkVehicleToInterior(tmpcar, int);
                SetVehicleVirtualWorld(tmpcar, vw);

            }
            else SetPlayerPos(playerid, -14.3755, -4472.8506, 4);
        }
        else if (strcmp(location, "cracklab", true) == 0)
        {
            if (GetPlayerState(playerid) == 2)
            {
                new tmpcar = GetPlayerVehicleID(playerid);
                SetVehiclePos(tmpcar, 2348.2871, -1146.8298, 27.3183);
                LinkVehicleToInterior(tmpcar, int);
                SetVehicleVirtualWorld(tmpcar, vw);

            }
            else SetPlayerPos(playerid, 2348.2871, -1146.8298, 27.3183);
        }
        else if (strcmp(location, "bank", true) == 0)
        {
            if (GetPlayerState(playerid) == 2)
            {
                new tmpcar = GetPlayerVehicleID(playerid);
                SetVehiclePos(tmpcar, 1487.91, -1030.60, 23.66);
                LinkVehicleToInterior(tmpcar, int);
                SetVehicleVirtualWorld(tmpcar, vw);

            }
            else SetPlayerPos(playerid, 1487.91, -1030.60, 23.66);
        }
        else if (strcmp(location, "allsaints", true) == 0)
        {
            if (GetPlayerState(playerid) == 2)
            {
                new tmpcar = GetPlayerVehicleID(playerid);
                SetVehiclePos(tmpcar, 1192.78, -1292.68, 13.38);
                LinkVehicleToInterior(tmpcar, int);
                SetVehicleVirtualWorld(tmpcar, vw);

            }
            else SetPlayerPos(playerid, 1192.78, -1292.68, 13.38);
        }
        else if (strcmp(location, "countygen", true) == 0)
        {
            if (GetPlayerState(playerid) == 2)
            {
                new tmpcar = GetPlayerVehicleID(playerid);
                SetVehiclePos(tmpcar, 2000.05, -1409.36, 16.99);
                LinkVehicleToInterior(tmpcar, int);
                SetVehicleVirtualWorld(tmpcar, vw);

            }
            else SetPlayerPos(playerid, 2000.05, -1409.36, 16.99);
        }
        else if (strcmp(location, "gym", true) == 0)
        {
            if (GetPlayerState(playerid) == 2)
            {
                new tmpcar = GetPlayerVehicleID(playerid);
                SetVehiclePos(tmpcar, 2227.60, -1674.89, 14.62);
                LinkVehicleToInterior(tmpcar, int);
                SetVehicleVirtualWorld(tmpcar, vw);

            }
            else SetPlayerPos(playerid, 2227.60, -1674.89, 14.62);
        }
        else if (strcmp(location, "fbi", true) == 0)
        {
            if (GetPlayerState(playerid) == 2)
            {
                new tmpcar = GetPlayerVehicleID(playerid);
                SetVehiclePos(tmpcar, 344.77, -1526.08, 33.28);

            }
            else SetPlayerPos(playerid, 344.77, -1526.08, 33.28);
        }
        else if (strcmp(location, "rc", true) == 0)
        {
            if (GetPlayerState(playerid) == 2)
            {
                new tmpcar = GetPlayerVehicleID(playerid);
                SetVehiclePos(tmpcar, 1253.70, 343.73, 19.41);
                LinkVehicleToInterior(tmpcar, int);
                SetVehicleVirtualWorld(tmpcar, vw);

            }
            else SetPlayerPos(playerid, 1253.70, 343.73, 19.41);
        }
        else if (strcmp(location, "lsvip", true) == 0)
        {
            if (GetPlayerState(playerid) == 2)
            {
                new tmpcar = GetPlayerVehicleID(playerid);
                SetVehiclePos(tmpcar, 1810.39, -1601.15, 13.54);
                LinkVehicleToInterior(tmpcar, int);
                SetVehicleVirtualWorld(tmpcar, vw);

            }
            else SetPlayerPos(playerid, 1810.39, -1601.15, 13.54);
        }
        else if (strcmp(location, "sfvip", true) == 0)
        {
            if (GetPlayerState(playerid) == 2)
            {
                new tmpcar = GetPlayerVehicleID(playerid);
                SetVehiclePos(tmpcar, -2433.63, 511.45, 30.38);
                LinkVehicleToInterior(tmpcar, int);
                SetVehicleVirtualWorld(tmpcar, vw);

            }
            else SetPlayerPos(playerid, -2433.63, 511.45, 30.38);
        }
        else if (strcmp(location, "lvvip", true) == 0)
        {
            if (GetPlayerState(playerid) == 2)
            {
                new tmpcar = GetPlayerVehicleID(playerid);
                SetVehiclePos(tmpcar, 1875.7731, 1366.0796, 16.8998);
                LinkVehicleToInterior(tmpcar, int);
                SetVehicleVirtualWorld(tmpcar, vw);

            }
            else SetPlayerPos(playerid, 1875.7731, 1366.0796, 16.8998);
        }
        else if (strcmp(location, "demorgan", true) == 0)
        {
            if (GetPlayerState(playerid) == 2)
            {
                new tmpcar = GetPlayerVehicleID(playerid);
                SetVehiclePos(tmpcar, 112.67, 1917.55, 18.72);
                LinkVehicleToInterior(tmpcar, int);
                SetVehicleVirtualWorld(tmpcar, vw);

            }
            else SetPlayerPos(playerid, 112.67, 1917.55, 18.72);
        }
        else if (strcmp(location, "icprison", true) == 0)
        {
            //Player_StreamPrep(playerid, 558.1121,1458.6663,6000.4712, FREEZE_TIME);
            SetPlayerInterior(playerid, 1);
            Character[playerid][char_Interior] = 1;
            SetPlayerVirtualWorld(playerid, 0);
            Character[playerid][char_VW] = 0;
            SendServerMessage(playerid, "Ban da dich chuyen!");
            return 1;
        }
        else if (strcmp(location, "doc", true) == 0)
        {
            if (GetPlayerState(playerid) == 2)
            {
                new tmpcar = GetPlayerVehicleID(playerid);
                SetVehiclePos(tmpcar, 1435.95, -2695.33, 13.90);
                LinkVehicleToInterior(tmpcar, int);
                SetVehicleVirtualWorld(tmpcar, vw);

            }
            else SetPlayerPos(playerid, 1435.95, -2695.33, 13.59);
        }
        else if (strcmp(location, "oocprison", true) == 0)
        {
            //Player_StreamPrep(playerid, -1158.285644, 2894.152343, 9993.131835, FREEZE_TIME);
            SetPlayerInterior(playerid, 1);
            Character[playerid][char_Interior] = 1;
            SetPlayerVirtualWorld(playerid, 0);
            Character[playerid][char_VW] = 0;
            SendServerMessage(playerid, "Ban da dich chuyen!");
            return 1;
        }
        else if (strcmp(location, "stadium1", true) == 0)
        {
            if (GetPlayerState(playerid) == 2)
            {
                new tmpcar = GetPlayerVehicleID(playerid);
                SetVehiclePos(tmpcar, -1424.93, -664.59, 1059.86);
                LinkVehicleToInterior(tmpcar, 4);
                SetVehicleVirtualWorld(tmpcar, vw);

            }
            else
            {
                SetPlayerPos(playerid, -1424.93, -664.59, 1059.86);
                SetPlayerInterior(playerid, 4);
                SetPlayerVirtualWorld(playerid, vw);
                SendServerMessage(playerid, "Ban da dich chuyen!");
                return 1;
            }
        }
        else if (strcmp(location, "stadium2", true) == 0)
        {
            if (GetPlayerState(playerid) == 2)
            {
                new tmpcar = GetPlayerVehicleID(playerid);
                SetVehiclePos(tmpcar, -1395.96, -208.20, 1051.28);
                LinkVehicleToInterior(tmpcar, 7);
                SetVehicleVirtualWorld(tmpcar, vw);

            }
            else
            {
                SetPlayerPos(playerid, -1395.96, -208.20, 1051.28);
                SetPlayerInterior(playerid, 7);
                SetPlayerVirtualWorld(playerid, vw);
                SendServerMessage(playerid, "Ban da dich chuyen!");
                return 1;
            }
        }
        else if (strcmp(location, "stadium3", true) == 0)
        {
            if (GetPlayerState(playerid) == 2)
            {
                new tmpcar = GetPlayerVehicleID(playerid);
                SetVehiclePos(tmpcar, -1410.72, 1591.16, 1052.53);
                LinkVehicleToInterior(tmpcar, 14);
                SetVehicleVirtualWorld(tmpcar, vw);

            }
            else
            {
                SetPlayerPos(playerid, -1410.72, 1591.16, 1052.53);
                SetPlayerInterior(playerid, 14);
                SetPlayerVirtualWorld(playerid, vw);
                SendServerMessage(playerid, "Ban da dich chuyen!");
                return 1;
            }
        }
        else if (strcmp(location, "stadium4", true) == 0)
        {
            if (GetPlayerState(playerid) == 2)
            {
                new tmpcar = GetPlayerVehicleID(playerid);
                SetVehiclePos(tmpcar, -1394.20, 987.62, 1023.96);
                LinkVehicleToInterior(tmpcar, 15);
                SetVehicleVirtualWorld(tmpcar, vw);

            }
            else
            {
                SetPlayerPos(playerid, -1394.20, 987.62, 1023.96);
                SetPlayerInterior(playerid, 15);
                SetPlayerVirtualWorld(playerid, vw);
                SendServerMessage(playerid, "Ban da dich chuyen!");
                return 1;
            }
        }
        else if (strcmp(location, "int1", true) == 0)
        {
            if (GetPlayerState(playerid) == 2)
            {
                new tmpcar = GetPlayerVehicleID(playerid);
                SetVehiclePos(tmpcar, 1416.107000, 0.268620, 1000.926000);
                LinkVehicleToInterior(tmpcar, 1);
                SetVehicleVirtualWorld(tmpcar, vw);

            }
            else
            {
                SetPlayerPos(playerid, 1416.107000, 0.268620, 1000.926000);
                SetPlayerInterior(playerid, 1);
                SetPlayerVirtualWorld(playerid, vw);
                SendServerMessage(playerid, "Ban da dich chuyen!");
                return 1;
            }
        }
        else if (strcmp(location, "mark", true) == 0)
        {
            if (GetPlayerState(playerid) == 2)
            {
                new tmpcar = GetPlayerVehicleID(playerid);
                SetVehiclePos(tmpcar, GetPVarFloat(playerid, "tpPosX1"), GetPVarFloat(playerid, "tpPosY1"), GetPVarFloat(playerid, "tpPosZ1"));
                LinkVehicleToInterior(tmpcar, GetPVarInt(playerid, "tpInt1"));
            }
            else
            {
                SetPlayerPos(playerid, GetPVarFloat(playerid, "tpPosX1"), GetPVarFloat(playerid, "tpPosY1"), GetPVarFloat(playerid, "tpPosZ1"));
            }
            SetPlayerInterior(playerid, GetPVarInt(playerid, "tpInt1"));
            SendServerMessage(playerid, "Ban da dich chuyen!");
            return 1;
        }
        else if (strcmp(location, "mark2", true) == 0)
        {
            if (GetPlayerState(playerid) == 2)
            {
                new tmpcar = GetPlayerVehicleID(playerid);
                SetVehiclePos(tmpcar, GetPVarFloat(playerid, "tpPosX2"), GetPVarFloat(playerid, "tpPosY2"), GetPVarFloat(playerid, "tpPosZ2"));
                LinkVehicleToInterior(tmpcar, GetPVarInt(playerid, "tpInt2"));
            }
            else
            {
                SetPlayerPos(playerid, GetPVarFloat(playerid, "tpPosX2"), GetPVarFloat(playerid, "tpPosY2"), GetPVarFloat(playerid, "tpPosZ2"));
            }
            SetPlayerInterior(playerid, GetPVarInt(playerid, "tpInt2"));
            SendServerMessage(playerid, "Ban da dich chuyen!");
            return 1;
        }
        else if (strcmp(location, "mall", true) == 0)
        {
            if (GetPlayerState(playerid) == 2)
            {
                new tmpcar = GetPlayerVehicleID(playerid);
                SetVehiclePos(tmpcar, 1133.71, -1464.52, 15.77);
                LinkVehicleToInterior(tmpcar, int);
                SetVehicleVirtualWorld(tmpcar, vw);

            }
            else SetPlayerPos(playerid, 1133.71, -1464.52, 15.77);
        }
        else if (strcmp(location, "elque", true) == 0)
        {
            if (GetPlayerState(playerid) == 2)
            {
                new tmpcar = GetPlayerVehicleID(playerid);
                SetVehiclePos(tmpcar, -1446.5997, 2608.4478, 55.8359);
                LinkVehicleToInterior(tmpcar, int);
                SetVehicleVirtualWorld(tmpcar, vw);

            }
            else SetPlayerPos(playerid, -1446.5997, 2608.4478, 55.8359);
        }
        else if (strcmp(location, "bayside", true) == 0)
        {
            if (GetPlayerState(playerid) == 2)
            {
                new tmpcar = GetPlayerVehicleID(playerid);
                SetVehiclePos(tmpcar, -2465.1348, 2333.6572, 4.8359);
                LinkVehicleToInterior(tmpcar, int);
                SetVehicleVirtualWorld(tmpcar, vw);

            }
            else SetPlayerPos(playerid, -2465.1348, 2333.6572, 4.8359);
        }
        else if (strcmp(location, "dillimore", true) == 0)
        {
            if (GetPlayerState(playerid) == 2)
            {
                new tmpcar = GetPlayerVehicleID(playerid);
                SetVehiclePos(tmpcar, 634.9734, -594.6402, 16.3359);
                LinkVehicleToInterior(tmpcar, int);
                SetVehicleVirtualWorld(tmpcar, vw);

            }
            else SetPlayerPos(playerid, 634.9734, -594.6402, 16.3359);
        }
        else if (strcmp(location, "famed", true) == 0)
        {
            if (GetPlayerState(playerid) == 2)
            {
                new tmpcar = GetPlayerVehicleID(playerid);
                SetVehiclePos(tmpcar, 1020.29, -1129.06, 23.87);
                LinkVehicleToInterior(tmpcar, int);
                SetVehicleVirtualWorld(tmpcar, vw);

            }
            else SetPlayerPos(playerid, 1020.29, -1129.06, 23.87);
        }
        else if (strcmp(location, "rodeo", true) == 0)
        {
            if (GetPlayerState(playerid) == 2)
            {
                new tmpcar = GetPlayerVehicleID(playerid);
                SetVehiclePos(tmpcar, 587.0106, -1238.3374, 17.8049);
                LinkVehicleToInterior(tmpcar, int);
                SetVehicleVirtualWorld(tmpcar, vw);

            }
            else SetPlayerPos(playerid, 587.0106, -1238.3374, 17.8049);
        }
        else if (strcmp(location, "flint", true) == 0)
        {
            if (GetPlayerState(playerid) == 2)
            {
                new tmpcar = GetPlayerVehicleID(playerid);
                SetVehiclePos(tmpcar, -108.1058, -1172.5293, 2.8906);
                LinkVehicleToInterior(tmpcar, int);
                SetVehicleVirtualWorld(tmpcar, vw);

            }
            else SetPlayerPos(playerid, -108.1058, -1172.5293, 2.8906);
        }
        else if (strcmp(location, "idlewood", true) == 0)
        {
            if (GetPlayerState(playerid) == 2)
            {
                new tmpcar = GetPlayerVehicleID(playerid);
                SetVehiclePos(tmpcar, 1955.1357, -1796.8896, 13.5469);
                LinkVehicleToInterior(tmpcar, int);
                SetVehicleVirtualWorld(tmpcar, vw);

            }
            else SetPlayerPos(playerid, 1955.1357, -1796.8896, 13.5469);
        }
        else if (strcmp(location, "mhc", true) == 0)
        {
            if (GetPlayerState(playerid) == 2)
            {
                new tmpcar = GetPlayerVehicleID(playerid);
                //Player_StreamPrep(playerid, 1700.2124, 1461.1771, 1145.7766, FREEZE_TIME);
                SetVehiclePos(tmpcar, 1700.2124, 1461.1771, 1145.7766);
                LinkVehicleToInterior(tmpcar, int);
                SetVehicleVirtualWorld(tmpcar, vw);

            }
            //else//Player_StreamPrep(playerid, 1649.7531, 1463.1614, 1151.9687, FREEZE_TIME);
        }
        else if (strcmp(location, "fc", true) == 0)
        {
            if (GetPlayerState(playerid) == 2)
            {
                new tmpcar = GetPlayerVehicleID(playerid);
                SetVehiclePos(tmpcar, -203.2537, 1105.27, 18.73);
                LinkVehicleToInterior(tmpcar, int);
                SetVehicleVirtualWorld(tmpcar, vw);

            }
            else SetPlayerPos(playerid, -203.2537, 1105.27, 18.73);

        }
        else if (strcmp(location, "unity", true) == 0)
        {
            if (GetPlayerState(playerid) == 2)
            {
                new tmpcar = GetPlayerVehicleID(playerid);
                SetVehiclePos(tmpcar, 1811.48, -1891.17, 12.3936);
                LinkVehicleToInterior(tmpcar, int);
                SetVehicleVirtualWorld(tmpcar, vw);

            }
            else SetPlayerPos(playerid, 1811.48, -1891.17, 12.3936);
        }
        else
        {
            SendServerMessage(playerid, "USAGE: /goto [location] [(optional) virtual world] [(optional) interior]");
            SendServerMessage(playerid, "Locations 1: LS,SF,LV,RC,ElQue,Bayside,LSVIP,SFVIP,LVVIP,Famed,MHC,stadium1");
            SendServerMessage(playerid, "Locations 2: stadium2,stadium3,stadium4,int1,mark,mark2,sfairport,dillimore,cave,doc,bank,mall,allsaints");
            SendServerMessage(playerid, "Locations 3: countygen,cracklab,gym,rodeo,flint,idlewood,fbi,island,demorgan,doc,icprison,oocprison");
            SendServerMessage(playerid, "Locations 4: garagesm,garagemed,garagelg,garagexlg,glenpark,palomino,nggshop, fc, unity, (l)os(c)olinas");
            return 1;
        }
        SetPlayerVirtualWorld(playerid, vw);
        SetPlayerInterior(playerid, int);
        Character[playerid][char_VW] = vw;
        Character[playerid][char_Interior] = int;

        SendServerMessage(playerid, "Ban da dich chuyen!");
    }
    else
    {
        SendServerMessage(playerid, "You are not authorized to use that command.");
    }
    return 1;
}

CMD:setmoney(playerid, params[])
{
    if (!CheckAdmin(playerid, 3)) return SendErrorMessage(playerid, "Ban khong co quyen su dung lenh nay");
	new targetid, amount_set;

	if(sscanf(params, "ii", targetid, amount_set)) return SendUsageMessage(playerid, "/setmoney [PlayerID][Amount]");
	Character[playerid][char_Cash] = amount_set;

	new logdisc[1280];
	format(logdisc, 1280, "Admin [%s] da set cho tai khoan [%s] so tien $%s", player_get_name(playerid), player_get_name(targetid), FormatMoney(amount_set));
	DISCORD_SendEmbedMsg(LogMoney, "Lịch sử 'SET MONEY'",logdisc, 0x2ac7ff);
	return 1;
}


CMD:givemoney(playerid, params[])
{
    if (!CheckAdmin(playerid, 3)) return SendErrorMessage(playerid, "Ban khong co quyen su dung lenh nay");
	new targetid, amount_set;

	if(sscanf(params, "ii", targetid, amount_set)) return SendUsageMessage(playerid, "/givemoney [PlayerID][Amount]");
	Character[playerid][char_Cash] += amount_set;
	
	new logdisc[1280];
	format(logdisc, 1280, "Admin [%s] da set cho tai khoan [%s] so tien $%s", player_get_name(playerid), player_get_name(targetid), FormatMoney(amount_set));
	DISCORD_SendEmbedMsg(LogMoney, "Lịch sử 'GIVE MONEY'",logdisc, 0x2ac7ff);
	return 1;
}


CMD:setint(playerid, params[])
{
    if (!CheckAdmin(playerid, 3)) return SendErrorMessage(playerid, "Ban khong co quyen su dung lenh nay");
    new targetid, _cint;
    if(sscanf(params, "ii", targetid,_cint)) return SendUsageMessage(playerid, "/setint [Playerid] [Interior]");
    SetPlayerInterior(playerid,_cint);
    HienTextdraw(playerid, "Cap nhat interior cho nguoi choi thanh cong", 3000);
    return 1;
}

CMD:setvw(playerid, params[])
{
    if (!CheckAdmin(playerid, 3)) return SendErrorMessage(playerid, "Ban khong co quyen su dung lenh nay");
    new targetid, _cvw;
    if(sscanf(params, "ii", targetid,_cvw)) return SendUsageMessage(playerid, "/setvw [Playerid] [VW]");
    SetPlayerVirtualWorld(playerid,_cvw);
    HienTextdraw(playerid, "Cap nhat VW cho nguoi choi thanh cong", 3000);
    return 1;
}