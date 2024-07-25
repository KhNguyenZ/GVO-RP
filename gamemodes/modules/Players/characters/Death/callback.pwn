#include <YSI_Coding\y_hooks>
#define       AmbulanceCalling(%0)      GetPVarInt(%0, "#Ambulance_Calling")
#define       CountdownCheck(%0)        GetPVarInt(%0, "#CountdownCheck")
#define       MEDIC_ID                  7
hook OnPlayerConnect(playerid){
    CreateDeathUI(playerid);
    return 1;
}
hook OnPlayerUpdate(playerid)
{
    if(Character[playerid][char_Injured] == 1)
    {
        //SetTimerEx("OnPlayerDie", 50000, false, "i", playerid);
    }
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
            //new zone[9999];
            //GetPlayer2DZone(playerid, zone, 9999);
            format(string, sizeof(string), "Cong Van khuan cap %s duoc nguoi bi thuong tai aa, Ho yeu cau van chuyen cap cuu ngay lam tuc.",GetPlayerNameEx(playerid));
            SendMessageToOrg(MEDIC_ID, -1,"Message to Org");
            
        }
    }
    return 1;
}

forward OnPlayerDie(playerid);
public OnPlayerDie(playerid){
    SetPlayerHealth(playerid, 100);
    Character[playerid][char_Injured] = 0;
    OnPlayerSpawn(playerid);   
    DestroyDeathUI(playerid);
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
        ShowDeathUI(playerid);
        SetPlayerHealth(playerid, 100.0);
        SetPlayerArmour(playerid, 0);
        HienTextdraw(playerid, "Ban dang bi thuong nang!", 3000);
    }
    else{
        DestroyDeathUI(playerid);
    }
}
new countdownSeconds = 300; // Biến toàn cục lưu giá trị đếm ngược theo giây

// Hàm khởi tạo đếm ngược

// Hàm xử lý đếm ngược
func:CountdownTimer(playerid)
{
    if (countdownSeconds > 0 && CountdownCheck(playerid) != 1) // Kiểm tra nếu vẫn còn thời gian
    {
        countdownSeconds--; // Giảm giá trị đếm ngược theo giây
        new minutes = countdownSeconds / 60; // Tính số phút
        new seconds = countdownSeconds % 60; // Tính số giây còn lại
        // printf("Thời gian còn lại: %d phút %d giây", minutes, seconds); // In ra giá trị đếm ngược
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
        SetPlayerHealth(playerid, 100);
        Character[playerid][char_Injured] = 0;
        OnPlayerSpawn(playerid);   
        DestroyDeathUI(playerid);
    }
}
task Death[1000]()
{
    foreach(new playerid: Player){
        
        if(Character[playerid][char_Injured] == 1)
        {
            // if(!CountdownCheck(playerid))
            // {
            //     SetPVarInt(playerid, "#CountdownCheck", 1);
            // }
            new Float:Healthz;
            GetPlayerHealth(playerid, Healthz);
            SetPlayerHealth(playerid, Healthz - 1.0);
            CountdownTimer(playerid);
        }
    }
    return 1;
}


CMD:bb(playerid){
    SetPlayerHealth(playerid, 0);
    return 1;
}