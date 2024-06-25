#include <YSI_Coding\y_hooks>

CMD:placevehicle(playerid){
    PlaceVehicle(playerid);
    return 1;
}

CMD:vdame(playerid, params[])
{
    new vehicleid = GetPlayerVehicleID(playerid);
    UpdateVehicleDamageStatus(vehicleid, panels, doors, lights, 15);
    return 1;
}
CMD:vstatus(playerid){
    new 
    vehicleid = GetPlayerVehicleID(playerid),
    Float:health,
    string[128];
    GetVehicleHealth(vehicleid, health);
    GetVehicleDamageStatus(vehicleid, panels, doors, lights, tires);
    new vhealth = health / 10; 
    format(string, 128, "Vehicle Status: [Tires]: %d       [Health]: %f", tires, vhealth);
    SendClientMessage(playerid, COLOR_WHITE, string);
    return 1;
}
CMD:fixvehicle(playerid){
    new vehicleid = GetNeraestVehicle(playerid, 10.0);
    //printf("%d", GetNeraestVehicle(playerid, 10.0));
    new 
    rear_right = tires & 1,
    front_right = tires >> 1 & 1,
    rear_left = tires >> 2 & 1,
    front_left = tires >> 3 & 1,
    Float:health;
    if (GetPVarInt(playerid, "placevehicle") == 1)
    {
        if(IsPlayerNearVehiclePart(playerid, vehicleid, VEH_PART_HOOD, 0.5, 0))
        {
            GetVehicleHealth(vehicleid, Float:health);
            if(health > 800.0)
            {
                SendClientMessage(playerid, COLOR_WHITE, "[Mechanic] | Dong co khong gap van de gi");
            }
            else FixEngine(playerid);
        }
        if(IsPlayerNearVehiclePart(playerid, vehicleid, VEH_PART_LFTIRE, 1, 0))
        {
            if(front_left << 3) // FRONT_LEFT
            {
            FixLeftFrontTire(playerid);
            }
            else SendClientMessage(playerid, COLOR_WHITE, "[Mechanic] | Banh xe khong gap van de gi");
        }
        if(IsPlayerNearVehiclePart(playerid, vehicleid, VEH_PART_RFTIRE, 1, 0))
        {
            if(front_right << 1) // FRONT_RIGHT
            {
            FixRightFrontTire(playerid);
            }
            else SendClientMessage(playerid, COLOR_WHITE, "[Mechanic] | Banh xe khong gap van de gi");
        }
        if(IsPlayerNearVehiclePart(playerid, vehicleid, VEH_PART_LRTIRE, 1, 0))
        {
            if(rear_left << 2) // REAR_LEFT
            {
                FixLeftRearTire(playerid);
            }
            else SendClientMessage(playerid, COLOR_WHITE, "[Mechanic] | Banh xe khong gap van de gi");
        }
        if(IsPlayerNearVehiclePart(playerid, vehicleid, VEH_PART_RRTIRE, 1, 0))
        {
            if(rear_right) // REAR_RIGHT
            {
                FixRightRearTire(playerid);
            }
            else SendClientMessage(playerid, COLOR_WHITE, "[Mechanic] | Banh xe khong gap van de gi");
        }
    }
    return 1;
}