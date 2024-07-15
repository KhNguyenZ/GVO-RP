#define SendHospitalMessage(%0,%1) \
    SendClientMessage(%0, 0xFF6347AA, "{f76565}BENH VIEN:{FFFFFF}"%1)
func:IsFreeInjuredBed()
{
    new _id_free = INVAILID_NUMBER;
    for(new i; i < 10; i++)
    {
        if(CountBed[i] == -1)
        {
            _id_free = i;break;
        }
    }
    return _id_free;
}
func:DeliverPatient(playerid)
{
    new _bed_id = IsFreeInjuredBed(); 
    
    if (_bed_id == -1)
    {
        SendErrorMessage(playerid, "Giuong benh dang bi qua tai !");
        return 0; 
    }
    SetPlayerPos(playerid, InjuredBed[_bed_id][0],
                 InjuredBed[_bed_id][1],
                 InjuredBed[_bed_id][2]);
    SetPlayerFacingAngle(playerid, InjuredBed[_bed_id][3]);
    PlayAnimEx(playerid, "SWAT", "gnstwall_injurd", 4.0, 1, 0, 0, 0, 0, 1);

    SetPVarInt(playerid, #TimerInjured, 60);
    InjuredTimer[playerid] = SetTimerEx("OnPlayerInjured", 1000, 1, "i", playerid);

    return 1;
}
forward OnPlayerInjured(playerid);
public OnPlayerInjured(playerid)
{
    if(GetPVarInt(playerid, #TimerInjured) <= 0)
    {
        ClearAnimations(playerid);
        TogglePlayerControllable(playerid, 1);
        DeletePVar(playerid, #TimerInjured);

        Character[playerid][char_Cash] -= 100;
        OrgData[0][org_safe] += 100;
        SendOrgMessage(0, "[{f76565}Hoa Don{FFFFFF}]: Hoa don thanh toan $100 (Xuat vien)");
        SendHospitalMessage(playerid, "Ban da tra 100$ cho phi nhap vien cua minh");
        KillTimer(InjuredTimer[playerid]);
    }

    new _Injured_msg[1280];
    format(_Injured_msg, 1280, "Thoi gian hoi phuc cua ban con ~r~%d~w~ giay nua", GetPVarInt(playerid, #TimerInjured));

    SetPVarInt(playerid, #TimerInjured, GetPVarInt(playerid, #TimerInjured)-1);
    PlayAnimEx(playerid, "SWAT", "gnstwall_injurd", 4.0, 1, 0, 0, 0, 0, 1);
    TogglePlayerControllable(playerid, 0);
    return 1;
}