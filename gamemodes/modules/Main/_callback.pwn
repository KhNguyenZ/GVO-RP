forward SSA_Mysql_Intit();

forward Mysql_PlayerInit(playerid);
public Mysql_PlayerInit(playerid)
{

    return 1;
}
public OnPlayerConnect(playerid)
{
    PlayerSelectSlot[playerid] = -1;
    CountGuide[playerid] = 0;
    // InvWeight[playerid] = 0.0;
    // InvMaxWeight[playerid] = 10.0;
    CreateFadeEffectTextDraw(playerid);
    CreateHienTextDraw(playerid);
    SetPVarString(playerid, "Current_IC_@", player_get_name(playerid));
    TogglePlayerSpectating(playerid, 0);

    CreatePlayerInfo(playerid);
    InitPlayerVehMap();

    return 1;
}


hook OnPlayerText(playerid, text[])
{
    return 0;
}

public OnPlayerText(playerid, text[])
{
    if (player_Login(playerid))
    {
        if (Character[playerid][char_DC_Auth] == 0) return SendErrorMessage(playerid, "[!] Vui long xac thuc tai khoan discord");
        SendRangeMessage(playerid, 10, text);
        Log("log/chat.log", text);
        return 1;
    }
    else SendClientMessage(playerid, -1, "Ban vui long dang nhap");
    return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
    if (!player_Login(playerid))
    {
        if (Character[playerid][char_DC_Auth] == 0) return SendErrorMessage(playerid, "[!] Vui long xac thuc tai khoan discord");
        SendClientMessage(playerid, 0xFF0000FF, "Ban chua dang nhap");
        Log("log/cmd.log", cmdtext);
        return 0;
    }
    return 1;
}

public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
    SmartKeyClick(playerid, PlayerText:playertextid);
    BankingClick(playerid, PlayerText:playertextid);
    InvClick(playerid, PlayerText:playertextid);
    Org_Click(playerid, PlayerText:playertextid);
    RegMenuClick(playerid, PlayerText:playertextid);
    CharacterSelect_Click(playerid, PlayerText:playertextid);

    if (GetPVarInt(playerid, #Auth_Case) == 1)
    {
        LoginClick(playerid, PlayerText:playertextid);
    }

    if (GetPVarInt(playerid, #Auth_Case) == 0)
    {
        RegClick(playerid, PlayerText:playertextid);
    }

    InteractiveNPCs_Click(playerid, PlayerText:playertextid);
    return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    SettingOrgDialog(playerid, dialogid, response, listitem, inputtext);
    return 1;
}

public OnPlayerUpdate(playerid)
{
    if (IsPlayerSpawned(playerid))
    {
        GetPlayerPos(playerid, Character[playerid][char_last_Pos][0],
                     Character[playerid][char_last_Pos][1],
                     Character[playerid][char_last_Pos][2]);
        GetPlayerFacingAngle(playerid, Character[playerid][char_last_Pos][3]);
    }

    // UpdateTextTime(playerid);

    new info_f[128];
    format(info_f, 128, "ID: ~w~%d", playerid);
    PlayerTextDrawSetString(playerid, InfoPTD[playerid][0], info_f);

    format(info_f, 128, "%s", FormatMoney(GetPlayerMoney(playerid)));
    PlayerTextDrawSetString(playerid, InfoPTD[playerid][1], info_f);

    format(info_f, 128, "%d", GetTotalPlayerOnline());
    TextDrawSetString(InfoTD[1], info_f);
    TextDrawShowForPlayer(playerid, InfoTD[1]);

    ReloadPlayerTextDraw(playerid, InfoPTD[playerid][0]);
    ReloadPlayerTextDraw(playerid, InfoPTD[playerid][1]);
    return 1;
}
public OnPlayerSpawn(playerid)
{
    if (Character[playerid][char_Injured] == 0)
    {
        SetPlayerSkin(playerid, Character[playerid][char_Skin]);
        ResetPlayerWeapons(playerid);
        GivePlayerMoney(playerid, Character[playerid][char_Cash]);
        SetPlayerHealth(playerid, Character[playerid][char_health]);
        SetPlayerArmour(playerid, Character[playerid][char_armour]);
        SetPlayerVirtualWorld(playerid, Character[playerid][char_VW]);
        SetPlayerInterior(playerid, Character[playerid][char_Interior]);


        TextDrawShowForPlayer(playerid, InfoTD[0]);
        TextDrawShowForPlayer(playerid, InfoTD[1]);
        TextDrawShowForPlayer(playerid, InfoTD[2]);


        LoadPlayerInventory(playerid);
    }

    return 1;
}
forward OnPlayerLoad(playerid);
public OnPlayerLoad(playerid)
{
    TogglePlayerSpectating(playerid, 0);
    Clear_Chat(playerid);
    new sdm[1280];
    mysql_format(Handle(), sdm, sizeof(sdm), "[{212c58}SSA{ffffff}] Chao mung ban den voi may chu, {0066ff}%s.", player_get_name(playerid));
    SendClientMessage(playerid, -1, sdm);
    PlayerSetupping[playerid] = 0;
    if (Character[playerid][char_Admin] > 0)
    {
        new msgzz[1280];
        format(msgzz, sizeof(msgzz), "Xin Chao {0000EE}%s{FFFFFF}, ban la %s.", player_get_name(playerid), GetAdmin(playerid));
        SendClientMessage(playerid, -1, msgzz);
    }


    CallRemoteFunction("Mysql_PlayerInit", "i", playerid);
    return 1;
}

forward ForceSpawn(playerid);
public ForceSpawn(playerid)
{
    SpawnPlayer(playerid);
}

public OnPlayerRequestClass(playerid, classid)
{
    if (Character[playerid][char_Login] == true)
    {
        TogglePlayerSpectating(playerid, 0);
        SetTimerEx("ForceSpawn", 1000, 0, "i", playerid);
    }
    if (Character[playerid][char_Login] == false)
    {
        TogglePlayerSpectating(playerid, 1);
        SetPlayerJoinCamera(playerid);
    }
    return 1;
}
