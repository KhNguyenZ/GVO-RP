#define             MAX_WEAPON_ORG         100
#define             MAX_RANK_ORG           10
#define             MAX_ORG                1000
enum Organization_Data{
    org_id,
    org_name[24],
    org_leader,
    org_birth[256],
    org_logo[256],
    org_safe,
    org_safedirty,
    org_gun[MAX_WEAPON_ORG],
    org_ammo[MAX_WEAPON_ORG],
    org_type
}


new OrgData[MAX_ORG][Organization_Data];

new OrgRank[MAX_ORG][MAX_RANK_ORG][255];

new PlayerText: OrgPTD[MAX_PLAYERS][12];