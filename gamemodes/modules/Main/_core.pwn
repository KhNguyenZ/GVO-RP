func:OnServerInit()
{
    for (new i; i < 1000; i++)
    {
        InteractiveNPCs_Data[i][iNPC_ID] = INVAILID_NUMBER;
    }
    for (new i; i < MAX_VEHICLES; i++)
    {
        Veh_Rent[i][job_id] = INVAILID_NUMBER;
        Veh_Rent[i][job_renter] = INVAILID_NUMBER;
        Veh_Rent[i][job_modelid] = INVAILID_NUMBER;
        Veh_Rent[i][job_vehid] = INVAILID_NUMBER;

        iCreate[i] = INVAILID_NUMBER;
    }

    for (new i = 0 ; i < MAX_DYNAMIC_DOORS ; i++)
    {
        BizInfo[i][biz_id] = INVAILID_NUMBER;
        DoorInfo[i][door_id] = INVAILID_NUMBER;
    }
    for (new i; i < 10; i++) 
	{
		CountBed[i] = INVAILID_NUMBER;
	}

    LogBank = DCC_FindChannelById("1253565213446373397");

    LogMoney = DCC_FindChannelById("1253565213446373397");
    LogAuth = DCC_FindChannelById("1253565213446373397");

    SSA_GUILD_ID = DCC_FindGuildById("1235864057278365756");
    SSA_CMD = DCC_Channel:DCC_FindChannelById("1253178296741400596");
    SSA_MAINTAINCE = DCC_Channel:DCC_FindChannelById("1253565054675320893");
    AuthMember = DCC_Role:DCC_FindRoleById("1234182795459297300");
    if (SERVER_TEST == 0) DISCORD_MSG(SSA_MAINTAINCE, "Máy chủ đã được khởi động \nNgười chơi có thể connect rồi đóooooo\n_SV.GVO.VN:7777_");
}

task ServerHeartBeat[1000]()
{
    foreach (new playerid: Player)
    {
        if (IsPlayerSpawned(playerid))
        {
            SetPlayerIconHud(playerid);
            UpdatePlayerHealth(playerid);
        }

        if (Character[playerid][char_Cash] != GetPlayerMoney(playerid))
        {
            ResetPlayerMoney(playerid);
            GivePlayerMoney(playerid, Character[playerid][char_Cash]);
        }

        if(Character[playerid][char_Injured] == 1)
        {
            CountdownTimer(playerid);
        }


        UpdateOdo(playerid);
        UpdateFuel(playerid);
    }
}


public OnGameModeInit()
{
    OnServerInit();
    return 1;
}
