enum Veh_Rent_Data{
    job_id,
    job_renter,
    job_modelid,
    job_vehid,
    job_time,
    job_traxe
};

new Veh_Rent[MAX_VEHICLES][Veh_Rent_Data];

new Timer_Rent[MAX_VEHICLES];


#define JOB_ROADREPAIR 1