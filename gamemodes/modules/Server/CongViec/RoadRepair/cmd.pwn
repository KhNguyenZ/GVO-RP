CMD:suaduong(playerid, params[])
{
    if(!IsPlayerRoadRepair(playerid)) return SendErrorMessage(playerid, "Ban khong phai nhan vien");
    PlayerLoading(playerid, Random(2,10), 2);
    return 1;
}

// func:SetPlayerDamagePoint