// id veh 552
// 
// GetPosNearVehiclePart
func:StartRoadRepair(playerid){
    new dm_point = RandomEx(0,sizeof(DamagePoint));
    SetPlayerCheckpoint(playerid, DamagePoint[dm_point][0], DamagePoint[dm_point][1], DamagePoint[dm_point][2]);
}