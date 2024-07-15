
// #define SendJobMessage(%0,%1) \ SendClientMessage(%0, 0xFF6347AA, "{FF6347}[CONG VIEC]:{FFFFFF}"%1)
// SendClientMessage(%0, 0xFF6347AA, "{FF6347}[CONG VIEC]:{FFFFFF}"%1)
func:SendJobMessage(playerid, msg[])
{
    return SendClientMessage(playerid, 0xFF6347AA, sprintf("{FF6347}[CONG VIEC]: %s{FFFFFF}",msg));
}
func:SetPlayerJob(playerid, job)
{
    Character[playerid][char_Job] = job;

    SendJobMessage(playerid, "Ban da nhan duoc cong viec roi , hay thay dong phuc va bat dau lam viec nhe !");
    return 1;
}
func:GetFreeVehRent()
{
    for (new i; i < MAX_VEHICLES; i++)
    {
        if (Veh_Rent[i][job_renter] == -1 && Veh_Rent[i][job_vehid] == -1)
        {
            return i;
        }
    }
    return -1;
}
func:GetJobName(_job)
{
    new _job_name[64];
    switch (_job)
    {
        case JOB_ROADREPAIR: _job_name = "Road Repair Worker";
        default:
            _job_name =  "Undef";
    }
    return _job_name;
}
func:IsRentVeh(_vehid)
{
    // new _rvehid = INVAILID_NUMBER;
    for (new i; i < MAX_VEHICLES; i++)
    {
        if (Veh_Rent[i][job_vehid] == _vehid) return i;
    }
    return -1;
}
func:RentJobCar(playerid, _job, _veh_model, _color)
{
    new _free_id = GetFreeVehRent();
    new Float:RentPos[4];
    GetPlayerPos(playerid, RentPos[0], RentPos[1], RentPos[2]);
    GetPlayerFacingAngle(playerid, RentPos[3]);

    Veh_Rent[_free_id][job_id] = _job;
    Veh_Rent[_free_id][job_renter] = playerid;
    Veh_Rent[_free_id][job_modelid] = _veh_model;
    Veh_Rent[_free_id][job_vehid] = CreateVehicle(_veh_model, RentPos[0], RentPos[1], RentPos[2], RentPos[3], _color, _color, 0, 0);
    PutPlayerInVehicle(playerid, Veh_Rent[_free_id][job_vehid], 0);

    new Text3D:Label_rent, lb_msg[1280];
    format(lb_msg, 1280, "{ffffff}[{ff0000}%s{ffffff}]", GetJobName(_job));
    Label_rent = Create3DTextLabel(lb_msg, COLOR_RED, RentPos[0], RentPos[1], RentPos[2], 5.0, 0);
    Attach3DTextLabelToVehicle(Label_rent, Veh_Rent[_free_id][job_vehid], 0, 0, 0);

    SendJobMessage(playerid, "Ban da thue thanh cong 1 chiec xe voi gia 100$ / 60 phut");
    SendJobMessage(playerid, "Su dung /traxe de tra xe va thanh toan so tien");

    Timer_Rent[Veh_Rent[_free_id][job_vehid]] = SetTimerEx("TimerVehRent", 1000, 1, "i", Veh_Rent[_free_id][job_vehid]);
    return Veh_Rent[_free_id][job_vehid];
}


forward TimerVehRent(_veh_rent_id);
public TimerVehRent(_veh_rent_id)
{
    new _rentid = _veh_rent_id;
    if (Veh_Rent[_rentid][job_traxe] == 0)
    {
        Veh_Rent[_rentid][job_time]++;
    }
    else if (Veh_Rent[_rentid][job_traxe] == 1)
    {
        new _renter = Veh_Rent[_rentid][job_renter];
        new _realtime = floatround(Veh_Rent[_rentid][job_time] / 60);
        Character[_renter][char_Cash] -= (_realtime * 100);

        SendJobMessage(_renter, sprintf("Ban da phai tra $%d cho chiec xe da thue cua minh", (_realtime * 100)));
        DestroyVehicle(Veh_Rent[_rentid][job_vehid]);
        Veh_Rent[_rentid][job_id] = INVAILID_NUMBER;
        Veh_Rent[_rentid][job_renter] = INVAILID_NUMBER;
        Veh_Rent[_rentid][job_modelid] = INVAILID_NUMBER;
        Veh_Rent[_rentid][job_vehid] = INVAILID_NUMBER;
        Veh_Rent[_rentid][job_time] = 0;
        Veh_Rent[_rentid][job_traxe] = 0;

        KillTimer(Timer_Rent[_rentid]);
    }
    return 1;
}


hook OnPlayerDisconnect(playerid, reason)
{
    for (new i; i < MAX_VEHICLES; i++)
    {
        if (Veh_Rent[i][job_renter] == playerid)
        {
            new _rentid = i;
            new _renter = Veh_Rent[_rentid][job_renter];
            new _realtime = floatround(Veh_Rent[_rentid][job_time] / 60);
            Character[_renter][char_Cash] -= (_realtime * 100);

            
            DestroyVehicle(Veh_Rent[_rentid][job_vehid]);
            Veh_Rent[_rentid][job_id] = INVAILID_NUMBER;
            Veh_Rent[_rentid][job_renter] = INVAILID_NUMBER;
            Veh_Rent[_rentid][job_modelid] = INVAILID_NUMBER;
            Veh_Rent[_rentid][job_vehid] = INVAILID_NUMBER;
            Veh_Rent[_rentid][job_time] = 0;
            Veh_Rent[_rentid][job_traxe] = 0;
        }
    }
}