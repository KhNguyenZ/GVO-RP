#include <a_mysql>
#include <YSI\YSI_Coding\y_hooks>
#include "./modules/Weapone/var.pwn"

new weapons_database;

// Load database and create table if it does not exist
stock LoadDatabase()
{
    weapons_database = mysql_connect(MYSQL_HOST, MYSQL_USER, MYSQL_PASS, MYSQL_DB);

    if (mysql_errno(weapons_database) != 0)
    {
        printf("[MySQL] Couldn't connect to %s.", MYSQL_DB);
    }
    else
    {
        printf("[MySQL] Connected to %s.", MYSQL_DB);

        new query[500];
        format(query, sizeof(query), "CREATE TABLE IF NOT EXISTS %s(%s VARCHAR(%d), %s INT, %s INT)", TABLE_WEAPONS, WEAPONS_USERNAME, MAX_PLAYER_NAME, WEAPONS_WEAPON_ID, WEAPONS_WEAPON_AMMO);
        mysql_query(weapons_database, query);
    }
    return 1;
}

// Get player name
stock PlayerName(playerid, name[], size)
{
    GetPlayerName(playerid, name, size);
}

// Load player weapons from the database
stock LoadPlayerWeapons(playerid)
{
    new query[256], player_name[MAX_PLAYER_NAME];
    new escaped_name[MAX_PLAYER_NAME];
    PlayerName(playerid, player_name, sizeof(player_name));
    mysql_escape_string(player_name, escaped_name, sizeof(escaped_name));

    format(query, sizeof(query), "SELECT `%s`, `%s` FROM `%s` WHERE `%s` = '%s';", WEAPONS_WEAPON_ID, WEAPONS_WEAPON_AMMO, TABLE_WEAPONS, WEAPONS_USERNAME, escaped_name);
    mysql_query(weapons_database, query);

    // Process results here
    return 1;
}

// Called when weapons are loaded from the database
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
