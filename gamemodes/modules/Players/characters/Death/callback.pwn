#include <YSI_Coding\y_hooks>
#define       AmbulanceCalling(%0)      GetPVarInt(%0, "#Ambulance_Calling")
#define       CountdownCheck(%0)        GetPVarInt(%0, "#CountdownCheck")
#define       CountdownTime(%0)         GetPVarInt(%0, "#CountdownTime")
#define       PlayerCarry(%0)           GetPVarInt(%0, "#PlayerCarry")
#define       RemainedTime              300
#define       MEDIC_ID                  7
hook OnPlayerConnect(playerid){
    CreateDeathUI(playerid);
    SetPVarInt(playerid, "#CountdownTime", Character[playerid][char_TimeInjured]);
    if(Character[playerid][char_TimeInjured] == 0)
    {
        Character[playerid][char_TimeInjured] = RemainedTime;
    }
    if(Character[playerid][char_TimeInjured] == 2)
    {
        Character[playerid][char_TimeInjured] = RemainedTime;
        Character[playerid][char_TimeInjured] = 1;
    }
    return 1;
}
hook OnPlayerDisconnect(playerid, reason)
{
    if(Character[playerid][char_Injured] == 2)  
    {
        Character[playerid][char_Injured] = 1;
    }
    if(Character[playerid][char_TimeInjured] == 0)
    {
        Character[playerid][char_TimeInjured] = RemainedTime;
    }
    return 1;
}
hook OnPlayerUpdate(playerid)
{
    return 1;
}
stock SendMessageToOrg(iGroupID, color, string[])
{
	foreach(new i: Player)
	{
	    iGroupID = Character[i][char_OrgID];
		if(0 <= iGroupID < 9999)
		{
			SendClientMessage(i, color, string);
		}
	}
}
hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if(newkeys == KEY_WALK)
    {
        if(AmbulanceCalling(playerid) == 0 && Character[playerid][char_Injured] == 1)
        {
            SendClientMessage(playerid, -1, "{ffff00}[ Ambulance ] {ffffff} Ban da goi 1 chiec xe cap cuu toi");
            SetPVarInt(playerid, "#Ambulance_Calling", 1);
            new string[128];
            new zone[9999];
            GetPlayer2DZone(playerid, zone, 9999);
            format(string, sizeof(string), "Cong Van khuan cap ( {ffff00}%i {ffffff}){ffff00}%s {ffffff}duoc nguoi bi thuong tai{ffff00} %s,{ffffff} Ho yeu cau van chuyen cap cuu ngay lam tuc.",playerid, GetPlayerNameEx(playerid), zone);
            SendMessageToOrg(MEDIC_ID, -1,string);
        }
    }
    if(oldkeys && newkeys == KEY_FIRE || newkeys == KEY_FIRE){
        if(Character[PlayerCarry(playerid)][char_Injured] == 2)
        {
            new Float:mX, Float:mY, Float:mZ;
            GetPlayerPos(playerid, mX, mY, mZ);
            SetPlayerPos(PlayerCarry(playerid), mX+0.5, mY+0.5, mZ);
            Character[PlayerCarry(playerid)][char_Injured] = 1;
        }
    }
    return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
    if(Character[playerid][char_Injured] == 0 && reason != 0)
    {
        Character[playerid][char_Injured] = 1;
        GetPlayerPos(playerid, Character[playerid][char_last_Pos][0], 
        Character[playerid][char_last_Pos][1],
        Character[playerid][char_last_Pos][2]);
        GetPlayerFacingAngle(playerid, Character[playerid][char_last_Pos][3]);
    }
    else{
        HienTextdraw(playerid, "Ban dang bi thuong nang!", 3000);
    }
    return 1;
}


hook OnPlayerSpawn(playerid)
{
    if (Character[playerid][char_Injured] == 1)
    {
        SetPlayerPos(playerid, Character[playerid][char_last_Pos][0], 
        Character[playerid][char_last_Pos][1],
        Character[playerid][char_last_Pos][2]);
        SetPlayerFacingAngle(playerid, Character[playerid][char_last_Pos][3]);
        ApplyAnimation(playerid, "SWEET", "Sweet_injuredloop", 4.0, 0,0,0, 1, 0, 1);
        // if(Character[playerid][char_Injured] == 1)
        ShowDeathUI(playerid);
        SetPlayerHealth(playerid, 100.0);
        SetPlayerArmour(playerid, 0);
        HienTextdraw(playerid, "Ban dang bi thuong nang!", 3000);
    }
    else if (Character[PlayerCarry(playerid)][char_Injured] == 2)
    {
        ApplyAnimation(playerid, "SWEET", "Sweet_injuredloop", 4.0, 0,0,0, 1, 0, 1);
        Character[playerid][char_Injured] = 1;
        ShowDeathUI(playerid);
        SetPlayerHealth(playerid, 100.0);
        SetPlayerArmour(playerid, 0);
        HienTextdraw(playerid, "Ban dang bi thuong nang!", 3000);
    }
    return 1;
}
new countdownSeconds; // Biến toàn cục lưu giá trị đếm ngược theo giây

// Hàm xử lý đếm ngược
func:CountdownTimer(playerid)
{
    countdownSeconds = CountdownTime(playerid);
    if (countdownSeconds > 0 && CountdownCheck(playerid) != 1) // Kiểm tra nếu vẫn còn thời gian
    {
        countdownSeconds--; // Giảm giá trị đếm ngược theo giây
        new minutes = countdownSeconds / 60; // Tính số phút
        new seconds = countdownSeconds % 60; // Tính số giây còn lại
        // printf("Thời gian còn lại: %d phút %d giây", minutes, seconds); // In ra giá trị đếm ngược
        SetPVarInt(playerid, "#CountdownTime", countdownSeconds);
        new string[128];
        if(seconds < 10)
        {
            format(string, 128, "%i:0%i", minutes,seconds);
        }
        else format(string, 128, "%i:%i", minutes,seconds);
        PlayerTextDrawSetString(playerid, DeathUI[playerid][2], string);
        
    }
    else
    {
        DestroyDeathUI(playerid);
        SetPlayerHealth(playerid, 100);
        Character[playerid][char_Injured] = 0;
        OnPlayerSpawn(playerid);
        SetPVarInt(playerid, "#Ambulance_Calling", 0);
        HienTextdraw(playerid, "Ban da hoi sinh thanh cong nguoi choi!", 3000);
        SetPVarInt(playerid, "#CountdownTime", RemainedTime);
        Character[playerid][char_TimeInjured] = RemainedTime;
    }
}
task Death[1000]()
{
    foreach(new playerid: Player){
        
        if(Character[playerid][char_Injured] == 1)
        {
            CountdownTimer(playerid);
        }
    }
    return 1;
}


CMD:bb(playerid){
    SetPlayerHealth(playerid, 0);
    return 1;
}


CMD:hoisinh(playerid, params[])
{
    if (!CheckAdmin(playerid, 3)) return SendErrorMessage(playerid, "Ban khong co quyen su dung lenh nay");
    new targetid;
    if (sscanf(params, "i", targetid)) SendUsageMessage(playerid, "/hoisinh [playerid]");
    DestroyDeathUI(targetid);
    SetPlayerHealth(targetid, 100);
    Character[targetid][char_Injured] = 0;
    OnPlayerSpawn(targetid);
    SetPVarInt(targetid, "#Ambulance_Calling", 0);
    HienTextdraw(targetid, "Ban da hoi sinh thanh cong nguoi choi!", 3000);
    SetPVarInt(targetid, "#CountdownTime", RemainedTime);
    Character[playerid][char_TimeInjured] = RemainedTime;
    return 1;
}

CMD:socuu(playerid, params[])
{
    new targetid;
	if(sscanf(params, "u", targetid)) return SendClientMessage(playerid, COLOR_GREY, "SU DUNG: /socuu [player]");
    SetPlayerHealth(targetid, 100);    
    DestroyDeathUI(targetid);
    SetPVarInt(targetid, "#Ambulance_Calling", 0);
    SetPVarInt(targetid, "#CountdownTime", RemainedTime);
    return 1;
}

CMD:movept(playerid, params[])
{
    new targetid;
	if(sscanf(params, "u", targetid)) return SendClientMessage(playerid, COLOR_GREY, "SU DUNG: /movept [player]");
    if(Character[targetid][char_Injured] != 0)
    {
        SetPVarInt(playerid, "#PlayerCarry", targetid);
        Character[targetid][char_Injured] = 2;
        DestroyDeathUI(targetid);       
        PlayerTextDrawShow(targetid, DeathUI[playerid][0]);
    }
    else SendClientMessage(playerid, -1, "{ffff00}[ Ambulance ]{ffffff} Nguoi nay khong bi thuong");
    return 1;
}
CMD:loadpt(playerid, params[])
{
    new targetid, seat;
    if(IsPlayerInAnyVehicle(playerid))
    {
        SendClientMessage(playerid, COLOR_GREY, "   Khong the su dung khi ban dang tren mot chiec xe!");
        return 1;
    }
    if(sscanf(params, "ud", targetid, seat)) return SendClientMessage(playerid, COLOR_GREY, "SU DUNG: /loadpt [playerid] [ 2 - 3 ]");
    if(targetid != INVALID_PLAYER_ID)
    {
        if(Character[targetid][char_Injured] < 1) SendClientMessage(playerid, -1, "{ffff00}[ Ambulance ]{ffffff} Nguoi nay khong bi thuong");
        if(IsPlayerInAnyVehicle(targetid)) SendClientMessage(playerid, COLOR_GREY, "Benh nhan do dang tren mot chiec xe, ban khong the dua len xe");
                
        if(!(2 <= seat <= 3)) SendClientMessage(playerid, COLOR_GRAD1, "ID nghe ngoi khong duoc tren 3 va duoi 2.");
        if(Character[targetid][char_Injured] != 0)
        {
            PutPlayerInVehicle(targetid, GetNeraestVehicle(playerid, 5.0), seat);
            TogglePlayerControllable(targetid, false);
            ClearAnimations(targetid);
            Character[targetid][char_Injured] = 1;
            Character[targetid][char_TimeInjured] = RemainedTime;
            DestroyDeathUI(targetid);       
            PlayerTextDrawShow(targetid, DeathUI[playerid][0]);
        }
    }
    
    return 1;
}
stock IsAtDeliverPatientPoint(playerid)
{
	if(IsPlayerConnected(playerid))
	{
		if(IsPlayerInRangeOfPoint(playerid, 3.0,1142.4733,-1326.3633,13.6259) || IsPlayerInRangeOfPoint(playerid, 5.0, 1165.1564,-1368.8240,26.6502) || IsPlayerInRangeOfPoint(playerid, 3.0,2027.0599,-1410.6870,16.9922) || IsPlayerInRangeOfPoint(playerid, 5.0, 2024.5742,-1382.7844,48.3359))
		{//ALLSAINTS, ALL SAINTS ROOF, COUNTY GENERAL, COUNTY ROOF
			return 1;
		}
		else if(IsPlayerInRangeOfPoint(playerid, 4.0, 1227.2339,306.4730,19.7028) || IsPlayerInRangeOfPoint(playerid, 5.0, 1233.3384,316.4022,24.7578) || IsPlayerInRangeOfPoint(playerid, 3.0,-339.2989,1055.8138,19.7392) || IsPlayerInRangeOfPoint(playerid, 5.0, -334.1560,1051.4434,26.0125))
		{//RED COUNTY, RED COUNTY ROOF, FORT CARSON, Fortcarson ROOF
			return 1;
		}
		else if(IsPlayerInRangeOfPoint(playerid, 5.0, -2695.5725,639.4147,14.4531) || IsPlayerInRangeOfPoint(playerid, 5.0, -2656.0339,615.2567,66.0938))
		{//SF, SF ROOF
		    return 1;
		}
		else if(IsPlayerInRangeOfPoint(playerid, 5.0, -1528.814331, 2540.706054, 55.835937) || IsPlayerInRangeOfPoint(playerid, 5.0, -2482.4338,2231.1106,4.8463) || IsPlayerInRangeOfPoint(playerid, 5.0, 225.3467,1981.8497,17.6406))
		{//El Quebrados , Bayside, Demorgan
			return 1;
		}
		else if(IsPlayerInRangeOfPoint(playerid, 5.0, 1446.7561, -276.9353, 1.1067))
		{// Red County near SASD Boat Patrol HQ
			return 1;
		}
		else if(IsPlayerInRangeOfPoint(playerid, 5.0, 1579.58, 1768.88, 10.82))
		{// Las Venturas Hospital
			return 1;
		}
	}
	return 0;
}
func:deliverpt(playerid)
{

    return 1;
}
CMD:deliverpt(playerid, params[])
{
    new targetid;
    if(sscanf(params, "u", targetid)) return SendClientMessage(playerid, COLOR_GREY, "SU DUNG: /deliverpt [player]");
    if(IsPlayerInAnyVehicle(playerid))
    {
            new carid = GetPlayerVehicleID(playerid);
            new caridex = GetPlayerVehicleID(targetid);
            if(carid == caridex)
            {
                if(IsAtDeliverPatientPoint(playerid))
				{
                    if(playerid == targetid)
                    {
                        SendClientMessage(playerid, COLOR_GRAD2, "Ban khong the tu dua minh vao benh vien!");
                        return 1;
                    }
                    if(Character[targetid][char_Injured] < 1) SendClientMessage(playerid, -1, "{ffff00}[ Ambulance ]{ffffff} Nguoi nay khong bi thuong");
                }
            }
    }
    return 1;
}