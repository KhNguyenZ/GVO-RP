CMD:traxe(playerid, params[])
{
    if(IsPlayerInAnyVehicle(playerid))
    {
        new _inveh = GetPlayerVehicleID(playerid);
        new _rentv = IsRentVeh(_inveh);

        if(_rentv != -1)
        {
            Veh_Rent[_rentv][job_traxe] = 1;
            SendJobMessage(playerid, "Dang tien hanh tra xe ...");
        }
    }
    return 1;
}