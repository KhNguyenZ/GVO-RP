#define MAX_VEHICLE_PART 100
// PRESSED(keys)
#define PRESSED(%0) \
	(((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))

#define         MECHANIC_JOB_ID         2142

new Text3D:vtext[MAX_VEHICLE_PART];
new 
    VEHICLE_PANEL_STATUS:panels,
    VEHICLE_DOOR_STATUS:doors,
    VEHICLE_LIGHT_STATUS:lights,
    VEHICLE_TIRE_STATUS:tires,
    engine, 
    alarm, 
    objective;

enum DongTienMechanic
{
    bId,
    bPlayerId,
    bText
}
new DongTien[MAX_PLAYERS][DongTienMechanic];