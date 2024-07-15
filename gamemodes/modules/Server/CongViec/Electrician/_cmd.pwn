CMD:fixelectrician(playerid, params[]){
    new rand = random(sizeof(ElectricianPos));
    SetPlayerCheckpoint(playerid, ElectricianPos[rand][0], ElectricianPos[rand][1], ElectricianPos[rand][2], 3.0);
    PlayerElectricianPos[playerid] = true;
}