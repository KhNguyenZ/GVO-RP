#include <a_mysql>
#include <YSI\YSI_Coding\y_hooks>

new weapons_database;
stock LoadPlayerWeapons(playerid)
{
    new query[256], player_name[MAX_PLAYER_NAME];
    new escaped_name[MAX_PLAYER_NAME];
    mysql_escape_string(player_get_name(playerid, false), escaped_name, sizeof(escaped_name));

    format(query, sizeof(query), "SELECT `%s`, `%s` FROM `%s` WHERE `%s` = '%s';", WEAPONS_WEAPON_ID, WEAPONS_WEAPON_AMMO, TABLE_WEAPONS, WEAPONS_USERNAME, escaped_name);
    mysql_query(weapons_database, query);

    return 1;
}
func: OnWeaponsLoaded(playerid)
{
    new weaponid, ammo;
    new rowCount = cache_num_rows();

    for (new i = 0; i < rowCount; i++)
    {
        weaponid = cache_get_value_name_int(i, WEAPONS_WEAPON_ID);
        ammo = cache_get_value_name_int(i, WEAPONS_WEAPON_AMMO);

        GivePlayerWeapon(playerid, weaponid, ammo);
    }
    return 1;
}
