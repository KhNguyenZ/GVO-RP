#define MAX_VEHICLE_PART 100
// PRESSED(keys)
#define PRESSED(%0) \
	(((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))

#define         HEAVY_ENGINE                1000
#define         MEDIUM_ENGINE               2000
#define         BAD_ENGINE                  3000
#define         TIRES                       5000

new Text3D:vtext[MAX_VEHICLE_PART];
new 
    VEHICLE_PANEL_STATUS:panels,
    VEHICLE_DOOR_STATUS:doors,
    VEHICLE_LIGHT_STATUS:lights,
    VEHICLE_TIRE_STATUS:tires,
    engine, 
    alarm, 
    objective;

enum vBill
{
    bId,
    bPlayerId,
    bPrice
}
new Bill[MAX_PLAYERS][vBill];