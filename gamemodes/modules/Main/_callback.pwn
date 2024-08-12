forward SSA_Mysql_Intit();

forward Mysql_PlayerInit(playerid);
public Mysql_PlayerInit(playerid)
{

    return 1;
}
public OnPlayerConnect(playerid)
{
    CountGuide[playerid] = 0;
    CreateFadeEffectTextDraw(playerid);
    CreateHienTextDraw(playerid);
    SetPVarString(playerid, "Current_IC_@", player_get_name(playerid));
    TogglePlayerSpectating(playerid, 1);

    CreatePlayerInfo(playerid);
    Character[playerid][char_Login] = false;
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
        if (Character[playerid][char_DC_Auth] == 0)
        {
            SendErrorMessage(playerid, "[!] Vui long xac thuc tai khoan discord");
            return 1;
        }
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
    OnPlayerClickPorters(playerid, PlayerText:playertextid);
    ElectricianClick(playerid, PlayerText:playertextid);
    // SmartKeyClick(playerid, PlayerText:playertextid);
    BankingClick(playerid, PlayerText:playertextid);
    OnInvClick(playerid, PlayerText:playertextid);
    Org_Click(playerid, PlayerText:playertextid);
    RegMenuClick(playerid, PlayerText:playertextid);
    CharacterSelect_Click(playerid, PlayerText:playertextid);

    if (GetPVarInt(playerid, #Auth_Case) == 1)
    {
        LoginClick(playerid, PlayerText:playertextid);
    }
    else
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

    new info_f[128];
    format(info_f, 128, "ID: ~w~%d", playerid);
    PlayerTextDrawSetString(playerid, InfoPTD[playerid][0], info_f);

    format(info_f, 128, "%s", FormatMoney(GetPlayerMoney(playerid)));
    PlayerTextDrawSetString(playerid, InfoPTD[playerid][1], info_f);

    format(info_f, 128, "%d", GetTotalPlayerOnline());
    TextDrawSetString(InfoTD[1], info_f);
    TextDrawShowForPlayer(playerid, InfoTD[1]);
    return 1;
}
public OnPlayerSpawn(playerid)
{
    if (Character[playerid][char_Injured] == 0)
    {
        SetPlayerPos(playerid, Character[playerid][char_last_Pos][0], Character[playerid][char_last_Pos][1], Character[playerid][char_last_Pos][2]);
        SetPlayerFacingAngle(playerid, Character[playerid][char_last_Pos][3]);
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
    }

    return 1;
}
forward OnPlayerLoad(playerid);
public OnPlayerLoad(playerid)
{
    LoadPlayerInventory(playerid);
    Clear_Chat(playerid);
    SendClientMessage(playerid, -1, sprintf("[{212c58}GVO{ffffff}] Chao mung ban den voi may chu, {0066ff}%s.", player_get_name(playerid)));
    PlayerSetupping[playerid] = 0;
    printf("Admin: %d", Character[playerid][char_Admin]);
    if (Character[playerid][char_Admin] > 0)
    {
        SendClientMessage(playerid, -1, sprintf("Xin Chao {0000EE}%s{FFFFFF}, ban la %s.", player_get_name(playerid), GetAdmin(playerid)));
    }

    CallRemoteFunction("Mysql_PlayerInit", "i", playerid);
    return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
    if (IsPlayerNPC(playerid)) return 1;
    if (Character[playerid][char_Login] == true)
    {
        SetSpawnInfo(playerid, 0, Character[playerid][char_Skin], Character[playerid][char_last_Pos][0], Character[playerid][char_last_Pos][1], Character[playerid][char_last_Pos][2], Character[playerid][char_last_Pos][3], 0, 0, 0, 0, 0, 0);
        TogglePlayerSpectating(playerid, 0);
        return 1;
    }
    else
    {
        SetPlayerJoinCamera(playerid);
    }
    return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
    OnPlayerEnterCheckpointElectrician(playerid);
    if (CP[playerid] == 1)
    {
        CP[playerid] = 0;
        PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
        DisablePlayerCheckpoint(playerid);
    }
    if (CP[playerid] == 252000)
    {
        CP[playerid] = 0;
        PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
        DisablePlayerCheckpoint(playerid);
    }
}


public OnPlayerDisconnect(playerid, reason)
{
    Character[playerid][char_Login] = false;
    return 1;
}