new gPlayerUsingLoopingAnim[MAX_PLAYERS];
stock SetVehicleTires(vehicleid,front_left,front_right,rear_left,rear_right){
	new panels,doors,lights,tires;
	GetVehicleDamageStatus(vehicleid,panels,doors,lights,tires);
	tires = (rear_right | (front_right << 1) | (rear_left << 2) | (front_left << 3));
	UpdateVehicleDamageStatus(vehicleid,panels,doors,lights,tires);
}
stock GetVehicleDamageStatusEx(vehicleid,type){
	new panels,doors,lights,tires;
	GetVehicleDamageStatus(vehicleid,panels,doors,lights,tires);
	switch(type){
		case VEHICLE_DAMAGE_PANELS: return panels;
		case VEHICLE_DAMAGE_DOORS: return doors;
		case VEHICLE_DAMAGE_LIGHTS: return lights;
		case VEHICLE_DAMAGE_TIRES: return tires;
	}
	return -1;
}
// Function to calculate the distance between two points
stock GetNeraestVehicle(playerid, Float:radius)
{
    new Float:CarX, Float:CarZ, Float:CarY, Float:Dis, Float:Dis2,vehicleid;
    Dis = 99999.99;
    vehicleid = INVALID_VEHICLE_ID;
    for(new i = 0; i < MAX_VEHICLES; i++)
    {
        GetVehiclePos(i, CarX, CarY, CarZ);
        Dis2 = GetPlayerDistanceFromPoint(playerid, CarX, CarY, CarZ);
        if(Dis2 < Dis && Dis2 < radius)
        {
                Dis = Dis2;
                vehicleid = i;
        }
    }
    return vehicleid;
} 
stock IsPlayerValidFixer(playerid)
{
    return Character[playerid][char_OrgID] == MECHANIC_JOB_ID;
}
PlayAnim(playerid, const animlib[], const animname[], Float:fDelta, loop, lockx, locky, freeze, time, forcesync)
{
    ApplyAnimation(playerid, animlib, animname, fDelta, loop, lockx, locky, freeze, time, forcesync);
}

PlayAnimEx(playerid, const animlib[], const animname[], Float:fDelta, loop, lockx, locky, freeze, time, forcesync)
{
    gPlayerUsingLoopingAnim[playerid] = 1;
    ApplyAnimation(playerid, animlib, animname, fDelta, loop, lockx, locky, freeze, time, forcesync);
}