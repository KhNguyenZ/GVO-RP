#include <YSI_Coding\y_hooks>
#include <YSI\y_timers>


forward FreezeTime(playerid);
public FreezeTime(playerid)
{
    //TogglePlayerControllable(playerid, 1);
    ClearAnimations(playerid);
    gPlayerUsingLoopingAnim[playerid] = 0;
    //ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.0, 1, 0, 0, 0, 0, 1);
    SendClientMessage(playerid, -1, "[Mechanic] | Ban da sua thanh cong");
    return 1;
}
forward PlusMechanicItems(playerid, amount, id);
public PlusMechanicItems(playerid, amount, id)
{
    new value = Mechanic[id][mValue] + amount;
    new query[1280];
    format(query, 1280, "UPDATE `mechanic` SET `value` = '%d' WHERE `id` = '%i'", value, id);
    mysql_tquery(Handle(), query);
    OnLoadMechanic();
    return 1;
}
forward MinusMechanicItems(playerid, amount, id);
public MinusMechanicItems(playerid, amount, id)
{
    new value = Mechanic[id][mValue] - amount;
    if(value < 0)
    {
        SendClientMessage(playerid, -1, "Khong du vat lieu de thuoc hien");
    }
    else
    {
        new query[1280];
        format(query, 1280, "UPDATE `mechanic` SET `value` = '%d' WHERE `id` = '%i'", value, id);
        mysql_tquery(Handle(), query);
        OnLoadMechanic();
    }
    
    return 1;
}
func:OnLoadMechanic()
{
    for(new i; i < MECHANIC_ITEMS; i++)
    {
        LoadMechanic(i);
    }
    printf("Loaded Mechanic");
}
forward LoadMechanic(Items);
public LoadMechanic(Items)
{
    new query[1280];
    format(query, sizeof(query), "SELECT * FROM `mechanic` WHERE `id` = '%d'", Items);
    return mysql_tquery(Handle(), query, "OnLoadMechanicItems", "i", Items);
    
}
forward OnLoadMechanicItems(Item);
public OnLoadMechanicItems(Item)
{
    if (cache_num_rows() > 0)
    {
        
        cache_get_value_name_int(0,  "id", Mechanic[Item][mId]);
        cache_get_value_name(0,  "name", Mechanic[Item][mName]);
        cache_get_value_name_int(0,  "value", Mechanic[Item][mValue]);
        return 1;
    }
    return 0;
}
func:ActiveVehicleObject(vehicleid)
{
    SetVehicleParamsEx(vehicleid, engine, VEHICLE_PARAMS_ON, alarm, doors, VEHICLE_PARAMS_ON, VEHICLE_PARAMS_ON, objective);
    SetVehicleParamsCarDoors(vehicleid, 1,1,1,1);
    return 1;
}
func:DisableVehicleObject(vehicleid)
{
    SetVehicleParamsEx(vehicleid, engine, VEHICLE_PARAMS_OFF, alarm, doors, VEHICLE_PARAMS_OFF, VEHICLE_PARAMS_OFF, objective);
    SetVehicleParamsCarDoors(vehicleid, 0,0,0,0);
    return 1;
}
func:VehicleStatus(vehicleid)
{
	new Float:pos[3], Float:health;
    GetVehicleDamageStatus(vehicleid, panels, doors, lights, tires);
    GetVehicleHealth(vehicleid, Float:health);
    new 
    rear_right = tires & 1,
    front_right = tires >> 1 & 1,
    rear_left = tires >> 2 & 1,
    front_left = tires >> 3 & 1;
    if(front_left << 3) // FRONT_LEFT
    {
        GetVehiclePartPos(vehicleid, VEH_PART_LFTIRE, pos[0], pos[1], pos[2]);
        vtext[1] = Create3DTextLabel("{ffffff}[ {ff0000}Left Front Tire {ffffff}]", COLOR_RED, pos[0], pos[1], pos[2], 5.0, 0);
        Attach3DTextLabelToVehicle(vtext[1], vehicleid, pos[0], pos[1], pos[2]);
    }
    else
    {
        GetVehiclePartPos(vehicleid, VEH_PART_LFTIRE, pos[0], pos[1], pos[2]);
        vtext[1] = Create3DTextLabel("{ffffff}[ {33ff00}Left Front Tire {ffffff}]", COLOR_RED, pos[0], pos[1], pos[2], 5.0, 0);
        Attach3DTextLabelToVehicle(vtext[1], vehicleid, pos[0], pos[1], pos[2]);
    }
    if(front_right << 1) // FRONT_RIGHT
    {
        GetVehiclePartPos(vehicleid, VEH_PART_RFTIRE, pos[0], pos[1], pos[2]);
        vtext[2] = Create3DTextLabel("{ffffff}[ {ff0000}Right Front Tire {ffffff}]", COLOR_RED, pos[0], pos[1], pos[2], 5.0, 0);
        Attach3DTextLabelToVehicle(vtext[2], vehicleid, pos[0], pos[1], pos[2]);
    }
    else
    {
        GetVehiclePartPos(vehicleid, VEH_PART_RFTIRE, pos[0], pos[1], pos[2]);
        vtext[2] = Create3DTextLabel("{ffffff}[ {33ff00}Right Front Tire {ffffff}]", COLOR_RED, pos[0], pos[1], pos[2], 5.0, 0);
        Attach3DTextLabelToVehicle(vtext[2], vehicleid, pos[0], pos[1], pos[2]);
    }
    if(rear_left << 2) // REAR_LEFT
    {
        GetVehiclePartPos(vehicleid, VEH_PART_LRTIRE, pos[0], pos[1], pos[2]);
        vtext[3] = Create3DTextLabel("{ffffff}[ {ff0000}Left Rear Tire {ffffff}]", COLOR_GREEN, pos[0], pos[1], pos[2], 5.0, 0);
        Attach3DTextLabelToVehicle(vtext[3], vehicleid, pos[0], pos[1], pos[2]);
    }
    else
    {
        GetVehiclePartPos(vehicleid, VEH_PART_LRTIRE, pos[0], pos[1], pos[2]);
        vtext[3] = Create3DTextLabel("{ffffff}[ {33ff00}Left Rear Tire {ffffff}]", COLOR_GREEN, pos[0], pos[1], pos[2], 5.0, 0);
        Attach3DTextLabelToVehicle(vtext[3], vehicleid, pos[0], pos[1], pos[2]);
    }
    if(rear_right) // REAR_RIGHT
    {
        GetVehiclePartPos(vehicleid,VEH_PART_RRTIRE, pos[0], pos[1], pos[2]);
        vtext[4] = Create3DTextLabel("{ffffff}[ {ff0000}Right Rear Tire {ffffff}]", COLOR_RED, pos[0], pos[1], pos[2], 5.0, 0);
        Attach3DTextLabelToVehicle(vtext[4], vehicleid, pos[0], pos[1], pos[2]);
    }
    else
    {
        GetVehiclePartPos(vehicleid,VEH_PART_RRTIRE, pos[0], pos[1], pos[2]);
        vtext[4] = Create3DTextLabel("{ffffff}[ {33ff00}Right Rear Tire {ffffff}]", COLOR_RED, pos[0], pos[1], pos[2], 5.0, 0);
        Attach3DTextLabelToVehicle(vtext[4], vehicleid, pos[0], pos[1], pos[2]);
    }
    //new vhealth = health / 10; 
    if(700.0 <= health)
    {
        //printf("%f", health);
        GetVehiclePartPos(vehicleid, VEH_PART_HOOD, pos[0], pos[1], pos[2]);
        vtext[5] = Create3DTextLabel("{ffffff}[ {33ff00}Engine {ffffff}]", COLOR_GREEN, pos[0], pos[1], pos[2], 5.0, 0);
        Attach3DTextLabelToVehicle(vtext[5], vehicleid, pos[0], pos[1], pos[2]);
    }
    else if(300.0 < health < 700.0)
    {
        //printf("%f", health);
        GetVehiclePartPos(vehicleid, VEH_PART_HOOD, pos[0], pos[1], pos[2]);
        vtext[5] = Create3DTextLabel("{ffffff}[ {FFFF00}Engine {ffffff}]", COLOR_GREEN, pos[0], pos[1], pos[2], 5.0, 0);
        Attach3DTextLabelToVehicle(vtext[5], vehicleid, pos[0], pos[1], pos[2]);
        Update3DTextLabelText(vtext[5] , 0xFF0000FF, "{ffffff}[ {FFFF00}Engine {ffffff}]");
    }
    else if(health <= 300.0)
    {
        //printf("%f", health);
        GetVehiclePartPos(vehicleid, VEH_PART_HOOD, pos[0], pos[1], pos[2]);
        vtext[5] = Create3DTextLabel("{ffffff}[ {ff0000}Engine {ffffff}]", COLOR_GREEN, pos[0], pos[1], pos[2], 5.0, 0);
        Attach3DTextLabelToVehicle(vtext[5], vehicleid, pos[0], pos[1], pos[2]);
        Update3DTextLabelText(vtext[5] , 0xFF0000FF, "{ffffff}[ {ff0000}Engine {ffffff}]");
    }

/*	//Front Tire - Bikes
	GetVehiclePartPos(vehicleid, VEH_PART_FTIRE, pos[0], pos[1], pos[2]);
	vtext = Create3DTextLabel("Front Tire", COLOR_GREEN, pos[0], pos[1], pos[2], 5.0, 0);
	Attach3DTextLabelToVehicle(vtext, vehicleid, pos[0], pos[1], pos[2]);

	//Rear Tire - Bikes
	GetVehiclePartPos(vehicleid, VEH_PART_RTIRE, pos[0], pos[1], pos[2]);
	vtext = Create3DTextLabel("Rear Tire", COLOR_GREEN, pos[0], pos[1], pos[2], 5.0, 0);
	Attach3DTextLabelToVehicle(vtext, vehicleid, pos[0], pos[1], pos[2]);
*/
    return 1;
}
func:PlaceVehicle(playerid)
{
    new vehicleid = GetPlayerVehicleID(playerid);
    if(IsValidVehicle(vehicleid))
    {
        if(IsPlayerInRangeOfPoint(playerid, 5.0, 1796.4661,-1692.3882,13.5663)) 
        {
            SetPlayerNearVehiclePart(playerid, vehicleid, VEH_PART_PCAP);
            SetVehiclePos(vehicleid, 1796.5164,-1692.8284,13.8737);
            SetVehicleZAngle(vehicleid, 0.1911);
            StopVehicleEngine(vehicleid);
            ActiveVehicleObject(vehicleid);
            VehicleStatus(vehicleid);
            SetPVarInt(playerid, "placevehicle", 1);
        } 
        else if(IsPlayerInRangeOfPoint(playerid, 3.0, 1803.5209,-1692.2703,13.5663)) 
        {
            SetPlayerNearVehiclePart(playerid, vehicleid, VEH_PART_PCAP);
            SetVehiclePos(vehicleid, 1803.5920,-1692.2446,13.3448);
            SetVehicleZAngle(vehicleid, 0.8215);
            StopVehicleEngine(vehicleid);
            ActiveVehicleObject(vehicleid);
            VehicleStatus(vehicleid);
            SetPVarInt(playerid, "placevehicle", 1);
        } 
        else if(IsPlayerInRangeOfPoint(playerid, 3.0, 1807.7323,-1692.1379,13.5663)) 
        {
            SetPlayerNearVehiclePart(playerid, vehicleid, VEH_PART_PCAP);
            SetVehiclePos(vehicleid, 1807.6543,-1691.8947,13.3455);
            SetVehicleZAngle(vehicleid, 0.5379);
            StopVehicleEngine(vehicleid);
            ActiveVehicleObject(vehicleid);
            VehicleStatus(vehicleid);
            SetPVarInt(playerid, "placevehicle", 1);
        } 
        else SendClientMessage(playerid, COLOR_WHITE, "Ban khong o noi sua xe");
    }
    else SendClientMessage(playerid, COLOR_WHITE, "Ban khong o tren xe"); 
}
func:FixEngine(playerid)
{
    new vehicleid = GetNeraestVehicle(playerid, 10.0);
    new engine,lights,alarm,doors,bonnet,boot,objective,Float:health;
    GetVehicleParamsEx(vehicleid,engine,lights,alarm,doors,bonnet,boot,objective);
    GetVehicleHealth(vehicleid, Float:health);
    PlayAnimEx(playerid, "BD_FIRE", "wash_up", 4.0, 1, 0, 0, 0, 0, 1);
    ////TogglePlayerControllable(playerid, 0);
    SetTimer("FreezeTime", 7000, false);
    SetVehicleHealth(vehicleid, 1000.0);
    Update3DTextLabelText(vtext[5], 0xFF0000FF, "{ffffff}[ {33ff00}Engine {ffffff}]");
    SendClientMessage(playerid, -1, "[Mechanic] | Ban dang sua {ffffff}[ {33ff00}Engine {ffffff}]");
    if(GetPVarInt(playerid, "placevehicle")  != 2)
    {
        MinusMechanicItems(playerid, 50, 1);
        MinusMechanicItems(playerid, 30, 3);
    }
    
    return 1;
}
func:FixLeftFrontTire(playerid)
{
    new 
    rear_right = tires & 1,
    front_right = tires >> 1 & 1,
    rear_left = tires >> 2 & 1;
    PlayAnim(playerid, "BOMBER", "BOM_Plant", 4.0, 1, 0, 0, 0, 0, 1);
    //TogglePlayerControllable(playerid, 0);
    SetTimer("FreezeTime", 5000, false);
    new vehicleid = GetNeraestVehicle(playerid, 10.0);
    GetVehicleDamageStatus(vehicleid, panels, doors, lights, tires);
    SetVehicleTires(vehicleid,0,front_right,rear_left,rear_right);
    Update3DTextLabelText(vtext[1], 0xFF0000FF, "{ffffff}[ {33ff00}Left Front Tire {ffffff}]");
    SendClientMessage(playerid, -1, "[Mechanic] | Ban dang sua {ffffff}[ {33ff00}Left Front Tire {ffffff}]");
    if(GetPVarInt(playerid, "placevehicle")  != 2)
    {
        MinusMechanicItems(playerid, 15, 1);
        MinusMechanicItems(playerid, 15, 2);
    }
    return 1;
}
func:FixRightFrontTire(playerid)
{
    new 
    rear_right = tires & 1,
    rear_left = tires >> 2 & 1,
    front_left = tires >> 3 & 1;
    PlayAnim(playerid, "BOMBER", "BOM_Plant", 4.0, 1, 0, 0, 0, 0, 1);
    //TogglePlayerControllable(playerid, 0);
    SetTimer("FreezeTime", 5000, false);
    new vehicleid = GetNeraestVehicle(playerid, 10.0);
    GetVehicleDamageStatus(vehicleid, panels, doors, lights, tires);
    SetVehicleTires(vehicleid,front_left,0,rear_left,rear_right);
    Update3DTextLabelText(vtext[2], 0xFF0000FF, "{ffffff}[ {33ff00}Right Front Tire {ffffff}]");
    SendClientMessage(playerid, -1, "[Mechanic] | Ban dang sua {ffffff}[ {33ff00}Right Front Tire {ffffff}]");
    if(GetPVarInt(playerid, "placevehicle")  != 2)
    {
        MinusMechanicItems(playerid, 15, 1);
        MinusMechanicItems(playerid, 15, 2);
    }
    return 1;
}
func:FixLeftRearTire(playerid)
{
    new 
    rear_right = tires & 1,
    front_right = tires >> 1 & 1,
    front_left = tires >> 3 & 1;
    PlayAnim(playerid, "BOMBER", "BOM_Plant", 4.0, 1, 0, 0, 0, 0, 1);
    //TogglePlayerControllable(playerid, 0);
    SetTimer("FreezeTime", 5000, false);
    new vehicleid = GetNeraestVehicle(playerid, 10.0);
    GetVehicleDamageStatus(vehicleid, panels, doors, lights, tires);
    SetVehicleTires(vehicleid,front_left,front_right,0,rear_right);
    Update3DTextLabelText(vtext[3], 0xFF0000FF, "{ffffff}[ {33ff00}Left Rear Tire {ffffff}]");
    SendClientMessage(playerid, -1, "[Mechanic] | Ban dang sua {ffffff}[ {33ff00}Left Rear Tire {ffffff}]");
    if(GetPVarInt(playerid, "placevehicle")  != 2)
    {
        MinusMechanicItems(playerid, 15, 1);
        MinusMechanicItems(playerid, 15, 2);
    }
    return 1;
}
func:FixRightRearTire(playerid)
{
    new 
    front_right = tires >> 1 & 1,
    rear_left = tires >> 2 & 1,
    front_left = tires >> 3 & 1;
    PlayAnim(playerid, "BOMBER", "BOM_Plant", 4.0, 1, 0, 0, 0, 0, 1);
    //TogglePlayerControllable(playerid, 0);
    SetTimer("FreezeTime", 5000, false);
    new vehicleid = GetNeraestVehicle(playerid, 10.0);
    GetVehicleDamageStatus(vehicleid, panels, doors, lights, tires);
    SetVehicleTires(vehicleid,front_left,front_right,rear_left,0);
    Update3DTextLabelText(vtext[4], 0xFF0000FF, "{ffffff}[ {33ff00}Right Rear Tire {ffffff}]");
    SendClientMessage(playerid, -1, "[Mechanic] | Ban dang sua {ffffff}[ {33ff00}Right Rear Tire {ffffff}]");
    if(GetPVarInt(playerid, "placevehicle")  != 2)
    {
        MinusMechanicItems(playerid, 15, 1);
        MinusMechanicItems(playerid, 15, 2);
    }
    return 1;
}

func:RepairTool(playerid)
{
    new vehicleid = GetNeraestVehicle(playerid, 10.0);
    if(vehicleid != 0)
    {
            SetPlayerNearVehiclePart(playerid, vehicleid, VEH_PART_PCAP);
            StopVehicleEngine(vehicleid);
            ActiveVehicleObject(vehicleid);
            VehicleStatus(vehicleid);
            SetPVarInt(playerid, "placevehicle", 2);
    }
    else SendClientMessage(playerid, COLOR_WHITE, "Ban khong o tren xe"); 
}