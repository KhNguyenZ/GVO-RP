hook OnGameModeInit()
{
    for(new i; i < MAX_VEHICLES; i++) {
        Veh_Rent[i][job_id] = -1;
        Veh_Rent[i][job_renter] = -1;
        Veh_Rent[i][job_modelid] = -1;
        Veh_Rent[i][job_vehid] = -1;
    }
    return 1;
}