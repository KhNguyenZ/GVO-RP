hook OnGameModeInit()
{
    for(new i; i < MAX_VEHICLES; i++) {
        Veh_Rent[i][job_id] = INVALID_NUMBER;
        Veh_Rent[i][job_renter] = INVALID_NUMBER;
        Veh_Rent[i][job_modelid] = INVALID_NUMBER;
        Veh_Rent[i][job_vehid] = INVALID_NUMBER;
    }
    return 1;
}