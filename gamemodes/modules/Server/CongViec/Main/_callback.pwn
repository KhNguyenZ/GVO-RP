hook OnGameModeInit()
{
    for(new i; i < MAX_VEHICLES; i++) {
        Veh_Rent[i][job_id] = INVAILID_NUMBER;
        Veh_Rent[i][job_renter] = INVAILID_NUMBER;
        Veh_Rent[i][job_modelid] = INVAILID_NUMBER;
        Veh_Rent[i][job_vehid] = INVAILID_NUMBER;
    }
    return 1;
}