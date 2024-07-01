

enum OrgVehicle_Data {
    ov_id,
    ov_orgid,
    ov_model,
    Float:ovPosX,
    Float:ovPosY,
    Float:ovPosZ,
    Float:ovPosR,
    ov_lock,
    ov_paintjob,
    ov_color1,
    ov_color2,
    ov_fuel,
    ov_vw,
    ov_int,
    ov_spawned,
    ov_vehid,
    Float:ov_health,
    ov_odo,
    ov_siren,
    ov_sqlid
}

new OrgVeh[MAX_ORG][MAX_ORG_VEHICLES][OrgVehicle_Data];

new OrgVehMap[MAX_ORG * MAX_ORG_VEHICLES][2];