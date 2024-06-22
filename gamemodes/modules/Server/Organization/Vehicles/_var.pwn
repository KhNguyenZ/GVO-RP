#define MAX_ORG_VEHICLES 1000
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
    ov_siren
}


new OrgVeh[MAX_PLAYERS][MAX_PLAYER_VEHICLES][PlayerVehicle_Data];