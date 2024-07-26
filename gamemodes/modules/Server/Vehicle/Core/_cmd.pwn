/*CMD:car(playerid, params[])
{
	new string[128];
	if(isnull(params))
	{
		SendClientMessage(playerid, COLOR_GREY, "SU DUNG: /car [name]");
		SendClientMessage(playerid, COLOR_GREY, "Ten co san : Engine, Lights, Trunk, Hood");
		return 1;
	}
	if(strcmp(params, "engine", true) == 0 && IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{
		new engine,lights,alarm,doors,bonnet,boot,objective,vehicleid;
		vehicleid = GetPlayerVehicleID(playerid);
		if(GetVehicleModel(vehicleid) == 481 || GetVehicleModel(vehicleid) == 509 || GetVehicleModel(vehicleid) == 510 || GetVehicleModel(vehicleid) == 592) return SendClientMessage(playerid,COLOR_WHITE,"This command can't be used in this vehicle.");
		GetVehicleParamsEx(vehicleid,engine,lights,alarm,doors,bonnet,boot,objective);
		if(engine == VEHICLE_PARAMS_ON)
		{
			SetVehicleEngine(vehicleid, playerid);
   			format(string, sizeof(string), "{FF8000}** {C2A2DA}%s rut chia khoa ra ngoai va dung dong co xe.", player_get_name(playerid));
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
		}
		else if((engine == VEHICLE_PARAMS_OFF || engine == VEHICLE_PARAMS_UNSET))
		{
  		    if (GetPVarInt(playerid, "Refueling")) return SendClientMessage(playerid, COLOR_WHITE, "Ban khong the no may xe khi dang tiep nhien lieu.");
			format(string, sizeof(string), "{FF8000}** {C2A2DA}%s dua chia khoa vao o va bat dong co xe.", player_get_name(playerid));
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			SendClientMessage(playerid, COLOR_WHITE, "Dong co xe dang duoc khoi dong, vui long doi trong giay lat..");
			SetTimerEx("SetVehicleEngine", 1000, 0, "dd",  vehicleid, playerid);
		}
	}
	else if(strcmp(params, "lights", true) == 0 && IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{
		new vehicleid = GetPlayerVehicleID(playerid);
		if(GetVehicleModel(vehicleid) == 481 || GetVehicleModel(vehicleid) == 509 || GetVehicleModel(vehicleid) == 510) return SendClientMessage(playerid,COLOR_WHITE,"This command can't be used in this vehicle.");
		SetVehicleLights(vehicleid, playerid);
	}
	else if(strcmp(params, "hood", true) == 0 && IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{
		if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			new vehicleid = GetPlayerVehicleID(playerid);
			if(GetVehicleModel(vehicleid) == 481 || GetVehicleModel(vehicleid) == 509 || GetVehicleModel(vehicleid) == 510 || IsAPlane(vehicleid) || IsABike(vehicleid))
			{
				return SendClientMessage(playerid,COLOR_WHITE,"Lenh nay khong the duoc su dung trong chiec xe nay.");
			}
			SetVehicleHood(vehicleid, playerid);
		}
		else if(!IsPlayerInAnyVehicle(playerid))
		{
			new closestcar = GetClosestCar(playerid);
			if(IsPlayerInRangeOfVehicle(playerid, closestcar, 5.0))
			{
				if(GetVehicleModel(closestcar) == 481 || GetVehicleModel(closestcar) == 509 || GetVehicleModel(closestcar) == 510 || IsAPlane(closestcar) || IsABike(closestcar))
				{
					return SendClientMessage(playerid,COLOR_WHITE,"Lenh nay khong the duoc su dung trong chiec xe nay.");
				}
				SetVehicleHood(closestcar, playerid);
			}
		}
	}
	else if(strcmp(params, "trunk", true) == 0)
  	{
		if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			new vehicleid = GetPlayerVehicleID(playerid);
			if(GetVehicleModel(vehicleid) == 481 || GetVehicleModel(vehicleid) == 509 || GetVehicleModel(vehicleid) == 510)
			{
				return SendClientMessage(playerid,COLOR_WHITE,"Lenh nay khong the duoc su dung trong chiec xe nay.");
			}
			SetVehicleTrunk(vehicleid, playerid);
		}
		else if(!IsPlayerInAnyVehicle(playerid))
		{
			new closestcar = GetClosestCar(playerid);
			if(IsPlayerInRangeOfVehicle(playerid, closestcar, 5.0))
			{
				if(GetVehicleModel(closestcar) == 481 || GetVehicleModel(closestcar) == 509 || GetVehicleModel(closestcar) == 510)
				{
					return SendClientMessage(playerid,COLOR_WHITE,"Lenh nay khong the duoc su dung trong chiec xe nay.");
				}
				SetVehicleTrunk(closestcar, playerid);
			}
		}
	}

	return 1;
}
*/
#include <YSI\YSI_Coding\y_hooks>
CMD:createpvehicle(playerid, params[])
{
	if(!CheckAdmin(playerid, 4)) return SendErrorMessage(playerid, "Ban khong co quyen su dung lenh nay !");
	new giveid, model, lock = 0, paintjob = 0, color1, color2;
	if(sscanf(params, "iiii", giveid, model, color1, color2)) return SendClientMessage(playerid, -1, "SU DUNG: /createpvehicle [playerid] [model] [color1] [color2]");
	CreatePlayerVehicle(giveid, model, lock, paintjob , color1, color2);

	new cpv[1280];
	format(cpv, sizeof(cpv), "Da tao thanh cong 1 chiec %s cho %s", GetVehicleName(model), player_get_name(giveid));
	SendClientMessage(playerid, -1, cpv);
	return 1;
}

CMD:mycar(playerid, params[])
{
	new dialog_mycar[1280];
	strcat(dialog_mycar, "Ten xe\tXang\tHealth\tTrang thai\n");
	for(new i; i < PlayerVehicleCount[playerid]; i++)
	{
		new mycar_dlg[1280];
		format(mycar_dlg, sizeof(mycar_dlg), "%s\t%d\t%0.2f\t%s\n", 
		GetVehicleName(PlayerVehicle[playerid][i][pv_model]),
		PlayerVehicle[playerid][i][pv_fuel],
		PlayerVehicle[playerid][i][pv_health], 
		GetVehicleStatus(playerid, PlayerVehicle[playerid][i][pv_vehid]));

		strcat(dialog_mycar, mycar_dlg, sizeof(mycar_dlg));
		new p_vehid[128];
		format(p_vehid, sizeof(p_vehid), "P_Veh_%d", i);
		SetPVarInt(playerid, p_vehid, PlayerVehicle[playerid][i][pv_id]);
		// printf("VehID: %s", p_vehid);
	}
	strcat(dialog_mycar, "Trong", 5);

	ShowPlayerDialog(playerid,DIALOG_MYCAR, DIALOG_STYLE_TABLIST_HEADERS, "Kho xe", dialog_mycar, ">>", "<<");
	return 1;
}
hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == DIALOG_MYCAR)
	{
		if(response){
			new p_vehid[128];
			format(p_vehid, sizeof(p_vehid), "P_Veh_%d", listitem);
			SpawnPlayerVehicle(playerid, GetPVarInt(playerid, p_vehid));
			// printf("value listitem: %d",GetPVarInt(playerid, p_vehid));
			for(new i; i < PlayerVehicleCount[playerid]; i++){
				format(p_vehid, sizeof(p_vehid), "P_Veh_%d", i);
				DeletePVar(playerid, p_vehid);
			}
		}
	}
	return 1;
}

CMD:carengine(playerid){
	if(!IsPlayerInAnyVehicle(playerid)) return 1;
	new vid = GetPlayerVehicleID(playerid);
	if(!IsVehicleEngineStarted(vid)) StartVehicleEngine(vid);
	else StopVehicleEngine(vid);
	return 1;
}



CMD:sb(playerid, params[])
{
    if(IsPlayerInAnyVehicle(playerid) == 0)
	{
        SendClientMessage(playerid, COLOR_GRAD2, "Ban khong the lam dieu nay tren xe!");
        return 1;
    }
	new string[60 + MAX_PLAYER_NAME];
    if(IsPlayerInAnyVehicle(playerid) == 1 && Seatbelt[playerid] == 0)
	{
        Seatbelt[playerid] = 1;
        if(IsABike(GetPlayerVehicleID(playerid)))
		{
            format(string, sizeof(string), "{FF8000}** {C2A2DA}%s lay mu bao hiem va doi len dau.", player_get_name(playerid));
            SendClientMessage(playerid, COLOR_WHITE, "Ban da doi mu bao hiem len dau.");
        }
        else
		{
            format(string, sizeof(string), "{FF8000}** {C2A2DA}%s keo day an toan qua nguoi va khoa lai.", player_get_name(playerid));
            SendClientMessage(playerid, COLOR_WHITE, "Ban da keo day an toan.");
        }

    }
    else if(IsPlayerInAnyVehicle(playerid) == 1 && Seatbelt[playerid] == 1)
	{
        Seatbelt[playerid] = 0;
        if(IsABike(GetPlayerVehicleID(playerid)))
		{
            format(string, sizeof(string), "{FF8000}** {C2A2DA}%s lay mua bao hiem tu tren dau xuong.", player_get_name(playerid));
            SendClientMessage(playerid, COLOR_WHITE, "Ban da bo mu bao hiem ra khoi dau.");
        }
        else
		{
            format(string, sizeof(string), "{FF8000}** {C2A2DA}%s mo chot khoa an toan va keo day an toan ra khoi nguoi.", player_get_name(playerid));
            SendClientMessage(playerid, COLOR_WHITE, "Ban da thao chot day an toan ra khoi nguoi.");
        }
    }
    ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
    return 1;
}

