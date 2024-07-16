func:ShowPortersTD(playerid){
    for(new i = 0; i < 2 ; i++) PlayerTextDrawShow(playerid, PortersTD[playerid][i]);
    SelectTextDraw(playerid, COLOR_RED);
    SetPlayerCheckpoint(playerid, 2151.3342,-2256.2427,13.2989, 4.0);
    PlayerPortersCP[playerid] = true;
}
func:HidePortersTD(playerid){
    for(new i = 0; i < 2 ; i++) PlayerTextDrawHide(playerid, PortersTD[playerid][i]);
    CancelSelectTextDraw(playerid);
}
forward Carry(playerid);
public Carry(playerid)
{
    ApplyAnimation(playerid, "CARRY", "CRRY_PRTIAL", 4.0, 0, 0, 0, 1, 100);
    return 1;
}