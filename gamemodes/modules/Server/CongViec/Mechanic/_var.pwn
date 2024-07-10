#define     MAX_VEHICLE_PART    100
#define     DIALOG_MECHANIC     1000
#define     DIALOG_IRON     2000
#define     DIALOG_RUBBER       3000
#define     DIALOG_PLASTIC      4000
#define     MECHANIC_ITEMS      1000

#define PRESSED(%0) \
	(((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))

#define         MECHANIC_JOB_ID         4

new Text3D:vtext[MAX_VEHICLE_PART];
new 
    VEHICLE_PANEL_STATUS:panels,
    VEHICLE_DOOR_STATUS:doors,
    VEHICLE_LIGHT_STATUS:lights,
    VEHICLE_TIRE_STATUS:tires,
    engine, 
    alarm, 
    objective;

enum mInfo
{
    mId,
    mName,
    mValue
}
new Mechanic[MECHANIC_ITEMS][mInfo];