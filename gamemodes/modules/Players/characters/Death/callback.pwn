#include <YSI_Coding\y_hooks>

public OnPlayerDeath(playerid, killerid, reason)
{
    if(Character[playerid][char_Injured] == 0)
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
        CreateDeathUI(playerid);
        ShowDeathUI(playerid);
        SetPlayerHealth(playerid, 100.0);
        SetPlayerArmour(playerid, 0);
        HienTextdraw(playerid, "Ban dang bi thuong nang!", 3000);
    }
    else{
        DestroyDeathUI(playerid);
    }
}

task Death[1000]()
{
    foreach(new playerid: Player){
        if(Character[playerid][char_Injured] == 1)
        {
            new Float:Healthz;
            GetPlayerHealth(playerid, Healthz);
            SetPlayerHealth(playerid, Healthz - 1.0);
        }
    }
    return 1;
}