enum Organization_Data {
    org_id,
    org_name[24],
    org_leader,
    org_birth[256],
    org_logo[256],
    org_safe,
    org_safedirty,
    org_gun[MAX_WEAPON_ORG],
    org_ammo[MAX_WEAPON_ORG],
    org_type,
    org_skin[MAX_SKIN_ORG]
}

new OrgData[MAX_ORG][Organization_Data];

new OrgRank[MAX_ORG][MAX_RANK_ORG][255];

new PlayerText:
OrgPTD[MAX_PLAYERS][12];
new MakeLeader_V[MAX_ORG] = INVAILID_NUMBER;
new ML_Targetid[MAX_PLAYERS];