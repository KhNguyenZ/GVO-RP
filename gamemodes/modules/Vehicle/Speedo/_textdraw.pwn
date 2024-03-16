new PlayerText: KMH[MAX_PLAYERS];
new PlayerText: Odo[MAX_PLAYERS];
new PlayerText: SpeedoPTD[MAX_PLAYERS][7];

func:OnPlayerCreateSpeedo(playerid){

    SpeedoPTD[playerid][0] = CreatePlayerTextDraw(playerid, 463.000, 266.000, "Speedometter:speedo");
    PlayerTextDrawTextSize(playerid, SpeedoPTD[playerid][0], 197.000, 230.000);
    PlayerTextDrawAlignment(playerid, SpeedoPTD[playerid][0], 1);
    PlayerTextDrawColor(playerid, SpeedoPTD[playerid][0], -1);
    PlayerTextDrawSetShadow(playerid, SpeedoPTD[playerid][0], 0);
    PlayerTextDrawSetOutline(playerid, SpeedoPTD[playerid][0], 0);
    PlayerTextDrawBackgroundColor(playerid, SpeedoPTD[playerid][0], 255);
    PlayerTextDrawFont(playerid, SpeedoPTD[playerid][0], 4);
    PlayerTextDrawSetProportional(playerid, SpeedoPTD[playerid][0], 1);

    SpeedoPTD[playerid][1] = CreatePlayerTextDraw(playerid, 526.000, 341.000, "Speedometter:seatbelt");
    PlayerTextDrawTextSize(playerid, SpeedoPTD[playerid][1], 15.000, 18.000);
    PlayerTextDrawAlignment(playerid, SpeedoPTD[playerid][1], 1);
    PlayerTextDrawColor(playerid, SpeedoPTD[playerid][1], -1);
    PlayerTextDrawSetShadow(playerid, SpeedoPTD[playerid][1], 0);
    PlayerTextDrawSetOutline(playerid, SpeedoPTD[playerid][1], 0);
    PlayerTextDrawBackgroundColor(playerid, SpeedoPTD[playerid][1], 255);
    PlayerTextDrawFont(playerid, SpeedoPTD[playerid][1], 4);
    PlayerTextDrawSetProportional(playerid, SpeedoPTD[playerid][1], 1);

    SpeedoPTD[playerid][2] = CreatePlayerTextDraw(playerid, 583.000, 341.000, "Speedometter:car_lock");
    PlayerTextDrawTextSize(playerid, SpeedoPTD[playerid][2], 18.000, 18.000);
    PlayerTextDrawAlignment(playerid, SpeedoPTD[playerid][2], 1);
    PlayerTextDrawColor(playerid, SpeedoPTD[playerid][2], -1);
    PlayerTextDrawSetShadow(playerid, SpeedoPTD[playerid][2], 0);
    PlayerTextDrawSetOutline(playerid, SpeedoPTD[playerid][2], 0);
    PlayerTextDrawBackgroundColor(playerid, SpeedoPTD[playerid][2], 255);
    PlayerTextDrawFont(playerid, SpeedoPTD[playerid][2], 4);
    PlayerTextDrawSetProportional(playerid, SpeedoPTD[playerid][2], 1);

    SpeedoPTD[playerid][3] = CreatePlayerTextDraw(playerid, 557.000, 319.000, "Speedometter:engine");
    PlayerTextDrawTextSize(playerid, SpeedoPTD[playerid][3], 9.000, 16.000);
    PlayerTextDrawAlignment(playerid, SpeedoPTD[playerid][3], 1);
    PlayerTextDrawColor(playerid, SpeedoPTD[playerid][3], -1);
    PlayerTextDrawSetShadow(playerid, SpeedoPTD[playerid][3], 0);
    PlayerTextDrawSetOutline(playerid, SpeedoPTD[playerid][3], 0);
    PlayerTextDrawBackgroundColor(playerid, SpeedoPTD[playerid][3], 255);
    PlayerTextDrawFont(playerid, SpeedoPTD[playerid][3], 4);
    PlayerTextDrawSetProportional(playerid, SpeedoPTD[playerid][3], 1);

    SpeedoPTD[playerid][4] = CreatePlayerTextDraw(playerid, 557.000, 319.000, "Speedometter:on_off");
    PlayerTextDrawTextSize(playerid, SpeedoPTD[playerid][4], 9.000, 17.000);
    PlayerTextDrawAlignment(playerid, SpeedoPTD[playerid][4], 1);
    PlayerTextDrawColor(playerid, SpeedoPTD[playerid][4], -1);
    PlayerTextDrawSetShadow(playerid, SpeedoPTD[playerid][4], 0);
    PlayerTextDrawSetOutline(playerid, SpeedoPTD[playerid][4], 0);
    PlayerTextDrawBackgroundColor(playerid, SpeedoPTD[playerid][4], 255);
    PlayerTextDrawFont(playerid, SpeedoPTD[playerid][4], 4);
    PlayerTextDrawSetProportional(playerid, SpeedoPTD[playerid][4], 1);

    SpeedoPTD[playerid][5] = CreatePlayerTextDraw(playerid, 578.000, 433.000, "0"); // fuel
    PlayerTextDrawLetterSize(playerid, SpeedoPTD[playerid][5], 0.180, 0.799);
    PlayerTextDrawTextSize(playerid, SpeedoPTD[playerid][5], -9.000, -4.000);
    PlayerTextDrawAlignment(playerid, SpeedoPTD[playerid][5], 1);
    PlayerTextDrawColor(playerid, SpeedoPTD[playerid][5], -1);
    PlayerTextDrawSetShadow(playerid, SpeedoPTD[playerid][5], 1);
    PlayerTextDrawSetOutline(playerid, SpeedoPTD[playerid][5], 0);
    PlayerTextDrawBackgroundColor(playerid, SpeedoPTD[playerid][5], 150);
    PlayerTextDrawFont(playerid, SpeedoPTD[playerid][5], 3);
    PlayerTextDrawSetProportional(playerid, SpeedoPTD[playerid][5], 1);

    SpeedoPTD[playerid][6] = CreatePlayerTextDraw(playerid, 514.000, 440.000, ""); // vehname
    PlayerTextDrawLetterSize(playerid, SpeedoPTD[playerid][6], 0.180, 0.699);
    PlayerTextDrawTextSize(playerid, SpeedoPTD[playerid][6], 0.000, 206.000);
    PlayerTextDrawAlignment(playerid, SpeedoPTD[playerid][6], 2);
    PlayerTextDrawColor(playerid, SpeedoPTD[playerid][6], -1);
    PlayerTextDrawSetShadow(playerid, SpeedoPTD[playerid][6], 1);
    PlayerTextDrawSetOutline(playerid, SpeedoPTD[playerid][6], 1);
    PlayerTextDrawBackgroundColor(playerid, SpeedoPTD[playerid][6], 150);
    PlayerTextDrawFont(playerid, SpeedoPTD[playerid][6], 3);
    PlayerTextDrawSetProportional(playerid, SpeedoPTD[playerid][6], 1);

    KMH[playerid] = CreatePlayerTextDraw(playerid, 562.500, 342.000, "0");
    PlayerTextDrawLetterSize(playerid, KMH[playerid], 0.289, 1.199);
    PlayerTextDrawTextSize(playerid, KMH[playerid], 0.000, 23.000);
    PlayerTextDrawAlignment(playerid, KMH[playerid], 2);
    PlayerTextDrawColor(playerid, KMH[playerid], -1);
    PlayerTextDrawSetShadow(playerid, KMH[playerid], 1);
    PlayerTextDrawSetOutline(playerid, KMH[playerid], 0);
    PlayerTextDrawBackgroundColor(playerid, KMH[playerid], 150);
    PlayerTextDrawFont(playerid, KMH[playerid], 3);
    PlayerTextDrawSetProportional(playerid, KMH[playerid], 1);

    Odo[playerid] = CreatePlayerTextDraw(playerid, 561.500, 370.000, "0");
    PlayerTextDrawLetterSize(playerid, Odo[playerid], 0.189, 0.699);
    PlayerTextDrawTextSize(playerid, Odo[playerid], 0.000, 23.000);
    PlayerTextDrawAlignment(playerid, Odo[playerid], 2);
    PlayerTextDrawColor(playerid, Odo[playerid], -1);
    PlayerTextDrawSetShadow(playerid, Odo[playerid], 1);
    PlayerTextDrawSetOutline(playerid, Odo[playerid], 0);
    PlayerTextDrawBackgroundColor(playerid, Odo[playerid], 150);
    PlayerTextDrawFont(playerid, Odo[playerid], 3);
    PlayerTextDrawSetProportional(playerid, Odo[playerid], 1);
    return 1;
}

func:ShowPlayerSpeedo(playerid)
{
    pSpeedo[playerid] = 1;
    for(new i; i < 7; i++) PlayerTextDrawShow(playerid, SpeedoPTD[playerid][i]);
    PlayerTextDrawShow(playerid, KMH[playerid]);
    PlayerTextDrawShow(playerid, Odo[playerid]);
    return 1;
}
func:HidePlayerSpeedo(playerid)
{
    pSpeedo[playerid] = 0;
    for(new i; i < 7; i++) PlayerTextDrawHide(playerid, SpeedoPTD[playerid][i]);
    PlayerTextDrawHide(playerid, KMH[playerid]);
    PlayerTextDrawHide(playerid, Odo[playerid]);
    return 1;
}
func:player_get_speed(playerid)
{
	new Float: fVelocity[3];

	GetVehicleVelocity(GetPlayerVehicleID(playerid), fVelocity[0], fVelocity[1], fVelocity[2]);
	return floatround(floatsqroot((fVelocity[0] * fVelocity[0]) + (fVelocity[1] * fVelocity[1]) + (fVelocity[2] * fVelocity[2])) * 100);
}

func:player_get_odometer(playerid)
{
    return floatround(player_get_speed(playerid)/3,6);
}

func:UpdatePlayerSpeedo(playerid, fuel)
{
    new speedo_vid = GetPlayerVehicleID(playerid);
    if(!IsPlayerInAnyVehicle(playerid)) return 0;
    if(IsVehicleEngineStarted(speedo_vid)){
        new sp_msg[1280];
        format(sp_msg, sizeof(sp_msg), "%d", player_get_speed(playerid));
        PlayerTextDrawSetString(playerid, KMH[playerid], sp_msg);


        format(sp_msg, sizeof(sp_msg), "%s", GetVehicleName(GetVehicleModel(GetPlayerVehicleID(playerid))));
        PlayerTextDrawSetString(playerid, SpeedoPTD[playerid][6], sp_msg);

        if(!IsVehicleAdminSpawn(speedo_vid))
        {
            foreach(new i:Player)
            {
                for(new j; j < MAX_PLAYER_VEHICLES; j++)
                {
                    if(PlayerVehicle[i][j][pv_vehid] == speedo_vid)
                    {
                        format(sp_msg, sizeof(sp_msg), "%d", PlayerVehicle[i][j][pv_odo]);
                        PlayerTextDrawSetString(playerid, Odo[playerid], sp_msg);

                        format(sp_msg, sizeof(sp_msg), "%d", fuel);
                        PlayerTextDrawSetString(playerid, SpeedoPTD[playerid][5], sp_msg);
                    }
                }
            }
        }

        if(Seatbelt[playerid]){
            PlayerTextDrawSetString(playerid, SpeedoPTD[playerid][1], "Speedometter:seatbelt-on");
            ReloadPlayerTextDraw(playerid, SpeedoPTD[playerid][1]);
        }
        else{
            PlayerTextDrawSetString(playerid, SpeedoPTD[playerid][1], "Speedometter:seatbelt");
            ReloadPlayerTextDraw(playerid, SpeedoPTD[playerid][1]);
        }

        if(!IsVehicleEngineStarted(speedo_vid)) PlayerTextDrawShow(playerid, SpeedoPTD[playerid][4]);
        else PlayerTextDrawHide(playerid, SpeedoPTD[playerid][4]);

    }
    return 1;
}

task UpdateOdo[1000]()
{
    foreach(new i:Player)
    {
        if(IsPlayerInAnyVehicle(i))
        {
            new speedo_vid = GetPlayerVehicleID(i);

            if(!IsVehicleAdminSpawn(speedo_vid))
            {
                for(new j; j < MAX_PLAYER_VEHICLES; j++)
                {
                    if(PlayerVehicle[i][j][pv_vehid] == speedo_vid)
                    {
                        PlayerVehicle[i][j][pv_odo] += player_get_odometer(i);
                    }
                }
            }

            UpdatePlayerSpeedo(i, VehicleFuel[speedo_vid]);
        }
        if(IsPlayerInAnyVehicle(i) && !pSpeedo[i]) ShowPlayerSpeedo(i);
        else HidePlayerSpeedo(i);
    }
    return 1;
}

CMD:speedo(playerid, params[])
{
    if(!pSpeedo[playerid]) ShowPlayerSpeedo(playerid);
    else HidePlayerSpeedo(playerid);
    return 1;
}