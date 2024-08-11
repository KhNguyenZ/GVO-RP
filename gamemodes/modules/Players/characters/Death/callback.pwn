#include <YSI\YSI_Coding\y_hooks>
#define       AmbulanceCalling(%0)      GetPVarInt(%0, "#Ambulance_Calling")
#define       CountdownCheck(%0)        GetPVarInt(%0, "#CountdownCheck")
#define       CountdownTime(%0)         GetPVarInt(%0, "#CountdownTime")
new GetPT[MAX_PLAYERS];
new PlayerPT[MAX_PLAYERS];
#define       RemainedTime              300
#define       MEDIC_ID                  7
new bool:EMSAccept[MAX_PLAYERS];
new EMS_Patient[MAX_PLAYERS];
new Float:HospitalBed[][5] =
{
    {1173.9620,-1325.3093,1020.1516,86.9873},
    {1174.0614,-1327.7770,1020.1516,90.4339},
    {1173.8945,-1331.7494,1020.1516,91.3529},
    {1173.8336,-1334.3246,1020.1516,89.5147},
    {1174.1259,-1338.4363,1020.1516,87.9063},
    {1165.8088,-1334.4187,1020.1516,269.4324},
    {1165.8810,-1331.6674,1020.1516,274.2578},
    {1165.9379,-1327.6980,1020.1516,279.6078},
    {1174.0437,-1300.4484,1020.1516,104.1211},
    {1174.0994,-1296.4720,1020.1516,92.8620},
    {1174.0659,-1293.9335,1020.1516,75.7931},
    {1174.1458,-1289.9956,1020.1516,86.0680},
    {1174.1200,-1287.4171,1020.1516,87.8411},
    {1173.9718,-1283.5054,1020.1516,84.1645},
    {1165.6130,-1283.2233,1020.1516,274.8167},
    {1165.3950,-1286.9529,1020.1516,262.5733},
    {1165.4633,-1289.8169,1020.1516,269.0072},
    {1165.4238,-1293.7858,1020.1516,272.6837}
};
hook OnPlayerConnect(playerid){
    CreateDeathUI(playerid);
    SetPVarInt(playerid, "#CountdownTime", Character[playerid][char_TimeInjured]);
    if(Character[playerid][char_TimeInjured] == 0)
    {
        Character[playerid][char_TimeInjured] = RemainedTime;
    }
    return 1;
}
hook OnPlayerDisconnect(playerid, reason)
{
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
stock SendMessageToOrg(iGroupID, color, const string[])
{
	foreach(new i: Player)
	{
        iGroupID = Character[i][char_OrgID];
		if(0 <= iGroupID < 9999)
		{
            new query[128];
            format(query, 128, "{ffff00}[ ORG ] {ffffff}%s", string);
			SendClientMessage(i, color, string);
		}
	}
    return 1;
}
stock IsAMedic(playerid)
{
	if(Character[playerid][char_OrgID] == MEDIC_ID) return 1;
	return 0;
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
        new targetid = GetPT[playerid];
        if(Character[targetid][char_Injured] == 2)
        {
            new Float:mX, Float:mY, Float:mZ;
            GetPlayerPos(playerid, mX, mY, mZ);
            SetPlayerPos(targetid, mX+0.5, mY+0.5, mZ);
        }
    }
    return 1;
}

hook OnPlayerDeath(playerid, killerid, reason)
{
    if(Character[playerid][char_Injured] == 0 && reason != 0)
    {
        Character[playerid][char_Injured] = 1;
        GetPlayerPos(playerid, Character[playerid][char_last_Pos][0], 
        Character[playerid][char_last_Pos][1],
        Character[playerid][char_last_Pos][2]);
        GetPlayerFacingAngle(playerid, Character[playerid][char_last_Pos][3]);
        Character[playerid][char_Skin] = GetPlayerSkin(playerid);
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
        SetPlayerSkin(playerid, Character[playerid][char_Skin]);
        SetPlayerPos(playerid, Character[playerid][char_last_Pos][0], 
        Character[playerid][char_last_Pos][1],
        Character[playerid][char_last_Pos][2]);
        SetPlayerFacingAngle(playerid, Character[playerid][char_last_Pos][3]);
        ApplyAnimation(playerid, "SWEET", "Sweet_injuredloop", 4.0, 0,0,0, 1, 0, 1);
        // if(Character[playerid][char_Injured] == 1)
        SetPVarInt(playerid, "#CountdownCheck", 1);
        ShowDeathUI(playerid);
        SetPlayerHealth(playerid, 100.0);
        SetPlayerArmour(playerid, 0);
        HienTextdraw(playerid, "Ban dang bi thuong nang!", 3000);
    }
    return 1;
}
// forward Treatment(playerid);
// public Treatment(playerid)
// {
//     HienTextdraw(playerid, "Ban da tinh day sau giac ngu say", 3000);
//     ClearAnimations(playerid);
//     SetPlayerPos(playerid, 1122.6455,-1311.5551,1019.4119);
//     return 1;
// }
func:SetPlayerDeliverpt(playerid){
    DestroyDeathUI(playerid);
    SetPlayerHealth(playerid, 100);
    Character[playerid][char_Injured] = 0;
    OnPlayerSpawn(playerid);
    SetPVarInt(playerid, "#Ambulance_Calling", 0);
    SetPVarInt(playerid, "#CountdownTime", RemainedTime);
    Character[playerid][char_TimeInjured] = RemainedTime;
    new randBed = Random(sizeof(HospitalBed));
    SetPlayerPos(playerid, HospitalBed[randBed][0], HospitalBed[randBed][1], HospitalBed[randBed][2]);
    SetPlayerFacingAngle(playerid, HospitalBed[randBed][4]);
    HienTextdraw(playerid, "Ban da tinh day sau giac ngu say", 3000);
    DeletePVar(playerid, "#CountdownCheck");
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
        Character[playerid][char_Cash] = Character[playerid][char_Cash] - 5000;
        SetPlayerDeliverpt(playerid);
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


// CMD:bb(playerid){
//     SetPlayerHealth(playerid, 0);
//     return 1;
// }


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
    DeletePVar(playerid, "#CountdownCheck");
    return 1;
}

CMD:socuu(playerid, params[])
{
    if(IsAMedic(playerid))
    {
        new targetid;
        if(sscanf(params, "u", targetid)) return SendClientMessage(playerid, COLOR_GREY, "SU DUNG: /socuu [player]");
        SetPlayerHealth(targetid, 100);    
        DestroyDeathUI(targetid);
        PlayerTextDrawShow(targetid, DeathUI[targetid][0]);
        SetPVarInt(targetid, "#CountdownTime", RemainedTime);
        DeletePVar(playerid, "#CountdownCheck");
    }
    
    return 1;
}

CMD:movept(playerid, params[])
{
    if(IsAMedic(playerid))
    {
        new targetid,float:x,float:y,float:z;
        if(sscanf(params, "u", targetid)) return SendClientMessage(playerid, COLOR_GREY, "SU DUNG: /movept [player]");
        GetPlayerPos(targetid, x, y, z);
        if(Character[targetid][char_Injured] != 0 && IsPlayerInRangeOfPoint(playerid, 2.0, Float:x, Float:y, Float:z))
        {
            GetPT[playerid] = targetid; 
            Character[targetid][char_Injured] = 2;
            DestroyDeathUI(targetid);       
            PlayerTextDrawShow(targetid, DeathUI[targetid][0]);
            SetPVarInt(targetid, "#CountdownTime", RemainedTime);
            DeletePVar(playerid, "#CountdownCheck");
            Character[targetid][char_TimeInjured] = RemainedTime;
        }
        else SendClientMessage(playerid, -1, "{ffff00}[ Ambulance ]{ffffff} Nguoi nay khong bi thuong");
    }
    return 1;
}
/*CMD:loadpt(playerid, params[])
{
    if(IsAMedic(playerid))
    {
        new targetid, seat,float:x,float:y,float:z;
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
            GetPlayerPos(targetid, x, y, z);
            if(Character[targetid][char_Injured] != 0 && IsPlayerInRangeOfPoint(playerid, 2.0, Float:x, Float:y, Float:z))
            {
                PutPlayerInVehicle(targetid, GetNeraestVehicle(playerid, 5.0), seat);
                TogglePlayerControllable(targetid, false);
                ClearAnimations(targetid);
                Character[targetid][char_Injured] = 1;
                Character[targetid][char_TimeInjured] = RemainedTime;
                DestroyDeathUI(targetid);       
                PlayerTextDrawShow(targetid, DeathUI[playerid][0]);
                SetPVarInt(targetid, "#CountdownTime", RemainedTime);
            }
        }
    }
    return 1;
}
*/

CMD:loadpt(playerid, params[])
{
    if(IsAMedic(playerid))
    {
        new targetid,seat,float:x,float:y,float:z;
        if(sscanf(params, "ui", targetid, seat)) return SendClientMessage(playerid, -1, "Sử dụng: /loadpt [ PlayerID ] [ 2 - 3 ]");
        if(IsPlayerInAnyVehicle(playerid))
        {
            SendClientMessage(playerid, COLOR_GREY, "   Khong the su dung khi ban dang tren mot chiec xe!");
            return 1;
        }
        GetPlayerPos(targetid, x,y,z);
        if(IsPlayerInRangeOfPoint(playerid, 5.0, x,y,z)) // Kiểm tra xem người chơi có gần bệnh nhân không
        {
            new vehicleid = GetNeraestVehicle(playerid, 5.0);
            if(Character[targetid][char_Injured] < 1) SendClientMessage(playerid, -1, "{ffff00}[ Ambulance ]{ffffff} Nguoi nay khong bi thuong");
            if(IsPlayerInAnyVehicle(targetid)) SendClientMessage(playerid, COLOR_GREY, "Benh nhan do dang tren mot chiec xe, ban khong the dua len xe");  
            if(!(2 <= seat <= 3)) SendClientMessage(playerid, COLOR_GRAD1, "ID nghe ngoi khong duoc tren 3 va duoi 2.");
            if(Character[targetid][char_Injured] != 0) // Kiểm tra xem người chơi có ở trong xe cứu thương không
            {
                PutPlayerInVehicle(targetid, vehicleid, seat); // Đặt bệnh nhân vào ghế sau của xe cứu thương
                EMS_Patient[playerid] = targetid; // Lưu trữ thông tin người vận chuyển
                TogglePlayerControllable(targetid, false);
                //ClearAnimations(targetid);
                DestroyDeathUI(targetid);       
                PlayerTextDrawShow(targetid, DeathUI[playerid][0]);
                SetPVarInt(targetid, "#CountdownTime", RemainedTime);
                DeletePVar(playerid, "#CountdownCheck");
                SendClientMessage(playerid, -1, "Benh nhan da duoc dua len xe.");
                Character[targetid][char_Injured] = 1;
                Character[targetid][char_TimeInjured] = RemainedTime;
            }
        }
        else
        {
            SendClientMessage(playerid, -1, "Ban phai o gan benh gan de dung lenh nay.");
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
CMD:deliverpt(playerid, params[])
{
    if(IsAMedic(playerid))
    {
        new targetid;
        if(sscanf(params, "u", targetid)) return SendClientMessage(playerid, COLOR_GREY, "SU DUNG: /deliverpt [player]");
        if(IsPlayerInAnyVehicle(playerid))
        {
                new carid = GetPlayerVehicleID(playerid);
                new caridex = GetPlayerVehicleID(targetid);
                if(carid == caridex)
                {
                    if(IsAtDeliverPatientPoint(playerid) && IsAtDeliverPatientPoint(targetid))
                    {
                        if(playerid == targetid)
                        {
                            SendClientMessage(playerid, COLOR_GRAD2, "Ban khong the tu dua minh vao benh vien!");
                            return 1;
                        }
                        if(Character[targetid][char_Injured] < 1) SendClientMessage(playerid, -1, "{ffff00}[ Ambulance ]{ffffff} Nguoi nay khong bi thuong");
                        SetPlayerDeliverpt(targetid);
                        Character[playerid][char_Cash] = Character[playerid][char_Cash] - 2000;
                    }
                }
        }
    }
    return 1;
}


CMD:getpt(playerid, params[]){
    if(IsAMedic(playerid))
    {
        new targetid;
        if(sscanf(params, "u", targetid)) return SendClientMessage(playerid, COLOR_GREY, "SU DUNG: /getpt [player]");
        if(PlayerPT[targetid] > 0) return SendClientMessage(playerid, -1, "[ Ambulance ] Nguoi choi nay khong goi cap cuu");
        if(Character[targetid][char_Injured] != 0)
        {
            new 
            float:x,
            float:y,
            float:z;
            GetPlayerPos(targetid, x,y,z);
            SetPlayerCheckpoint(playerid, x, y, z, 5.0);
            EMSAccept[playerid] = true;
            GetPT[playerid] = targetid;
            PlayerPT[targetid] = playerid;
        }
    }
    return 1;
}

hook OnPlayerEnterCheckpoint(playerid)
{
    if(EMSAccept[playerid] == true)
    {
        ApplyAnimation(GetPT[playerid], "SWEET", "Sweet_injuredloop", 4.0, 0,0,0, 1, 0, 1);
        Character[GetPT[playerid]][char_Injured] = 1;
        DestroyDeathUI(GetPT[playerid]);
        PlayerTextDrawShow(GetPT[playerid], DeathUI[GetPT[playerid]][0]);
        SetPlayerHealth(GetPT[playerid], 100.0);
        SetPlayerArmour(GetPT[playerid], 0);
        EMSAccept[playerid] = false;
        GetPT[playerid] = -1;
        PlayerPT[GetPT[playerid]] = -1;
        DisablePlayerCheckpoint(playerid);
        DeletePVar(playerid, "#CountdownCheck");
        Character[GetPT[playerid]][char_Injured] = 1;
        Character[GetPT[playerid]][char_TimeInjured] = RemainedTime;
    }
    return 1;
}

