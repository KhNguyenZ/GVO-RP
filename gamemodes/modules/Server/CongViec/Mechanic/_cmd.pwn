#include <YSI_Coding\y_hooks>

CMD:placevehicle(playerid){
    if(IsPlayerValidFixer(playerid))
    {
        PlaceVehicle(playerid);
    }
    return 1;
}

CMD:vdame(playerid, params[])
{
    new vehicleid = GetPlayerVehicleID(playerid);
    UpdateVehicleDamageStatus(vehicleid, panels, doors, lights, 15);
    SetVehicleHealth(vehicleid, 300.0);
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
CMD:repairtool(playerid)
{
    RepairTool(playerid);
    return 1;
}
CMD:fixvehicle(playerid){
    FixPVehicle(playerid);
    return 1;
}
CMD:mechanic(playerid, params[])
{
    if(IsPlayerValidFixer(playerid) && IsPlayerInRangeOfPoint(playerid, 2.0, 1770.8954,-1689.1117,13.5253))
    {
        new query[128];
        format(query, sizeof(query), "[ Iron ]\t[ {33ff00}%d{ffffff} ]\n\
        [ Rubber ]\t[ {33ff00}%d{ffffff} ]\n\
        [ Plastic ]\t[ {33ff00}%d{ffffff} ]", Mechanic[1][mValue], Mechanic[2][mValue], Mechanic[3][mValue]);
        ShowPlayerDialog(playerid, DIALOG_MECHANIC, DIALOG_STYLE_TABLIST, "Caption", query,"Choose", "Cancel");
    }
    return 1;
}