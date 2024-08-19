#include <a_samp>
#include <YSI\YSI_Coding\y_hooks>
#include "./modules/Weapone/var.pwn"

CMD:weapondata(playerid, params[])
{
    new string[144], weapons[12][2];
    for(new i = 0; i <= 12; i++)
    {
        GetPlayerWeaponData(playerid, i, weapons[i][0], weapons[i][1]);

        format(string, sizeof(string), "Weapon ID: %d - Ammo: %d.", weapons[i][0], weapons[i][1]);
        SendClientMessage(playerid, -1, string);
    }
    return 1;
}
