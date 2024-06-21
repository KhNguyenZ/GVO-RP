new Float:InjuredBed[10][4] = {
    {1417.0474, 1489.7521, 1011.6442, 358.8467},
    {1413.5511, 1489.3539, 1011.6442, 359.9213},
    {1410.0803, 1489.3453, 1011.6442, 7.6955},
    {1406.5590, 1489.4982, 1011.6442, 358.5366},
    {1403.0118, 1489.7067, 1011.6442, 1.6559},
    {1403.0256, 1496.1193, 1011.6442, 177.3657},
    {1406.5415, 1496.3634, 1011.6442, 179.4232},
    {1410.0048, 1496.5063, 1011.6442, 178.9813},
    {1413.5769, 1496.4835, 1011.6442, 184.5340},
    {1416.8751, 1496.1519, 1011.6442, 180.3067}
};

new CountBed;

func:DeliverPatient(playerid)
{
    if (CountBed > 9)
    {
        SendErrorMessage(playerid, "Giuong benh dang bi qua tai !");
        return 0; 
    }
    SetPlayerPos(playerid, InjuredBed[CountBed][0],
                 InjuredBed[CountBed][1],
                 InjuredBed[CountBed][2]);
    SetPlayerFacingAngle(playerid, InjuredBed[CountBed][3]);
    PlayAnimEx(playerid, "SWAT", "gnstwall_injurd", 4.0, 1, 0, 0, 0, 0, 1);
    return 1;
}