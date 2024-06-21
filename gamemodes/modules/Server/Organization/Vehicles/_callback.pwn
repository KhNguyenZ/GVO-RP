forward OnLoadOrgVehicle(_org_id);
public OnLoadOrgVehicle(_org_id)
{
    new v_count;
    cache_get_row_count(v_count);
    printf("Loaded %d vehicle for Org %d", v_count, _org_id);

    for (new i; i < MAX_ORG_VEHICLES; i++)
    {
        OrgVeh[_org_id][i][ov_vehid] = -1;
    }
    for (new i; i < v_count; i++)
    {
        cache_get_value_name_int(i, "id", OrgVeh[_org_id][i][ov_id]);
        cache_get_value_name_int(i, "orgid", OrgVeh[_org_id][i][ov_orgid]);
        cache_get_value_name_int(i, "model", OrgVeh[_org_id][i][ov_model]);
        cache_get_value_name_float(i, "pos_x", OrgVeh[_org_id][i][ovPosX]);
        cache_get_value_name_float(i, "pos_y", OrgVeh[_org_id][i][ovPosY]);
        cache_get_value_name_float(i, "pos_z", OrgVeh[_org_id][i][ovPosZ]);
        cache_get_value_name_float(i, "pos_r", OrgVeh[_org_id][i][ovPosR]);

        cache_get_value_name_int(i, "lock", OrgVeh[_org_id][i][ov_lock]);
        cache_get_value_name_int(i, "paintjob", OrgVeh[_org_id][i][ov_paintjob]);
        cache_get_value_name_int(i, "color1", OrgVeh[_org_id][i][ov_color1]);
        cache_get_value_name_int(i, "color2", OrgVeh[_org_id][i][ov_color2]);
        cache_get_value_name_int(i, "fuel", OrgVeh[_org_id][i][ov_fuel]);
        cache_get_value_name_int(i, "vw", OrgVeh[_org_id][i][ov_vw]);
        cache_get_value_name_int(i, "int", OrgVeh[_org_id][i][ov_int]);

        cache_get_value_name_int(i, "health", OrgVeh[_org_id][i][ov_health]);
        cache_get_value_name_int(i, "odo", OrgVeh[_org_id][i][ov_odo]);
        cache_get_value_name_int(i, "siren", OrgVeh[_org_id][i][ov_siren]);
        if (!IsValidVehicle(OrgVeh[_org_id][i][ov_vehid]))
        {
            OrgVeh[_org_id][i][ov_vehid] = CreateVehicle(OrgVeh[_org_id][i][ov_model],
                                           OrgVeh[_org_id][i][ovPosX],
                                           OrgVeh[_org_id][i][ovPosY],
                                           OrgVeh[_org_id][i][ovPosZ],
                                           OrgVeh[_org_id][i][ovPosR],
                                           OrgVeh[_org_id][i][ov_color1],
                                           OrgVeh[_org_id][i][ov_color2],
                                           500,
                                           OrgVeh[_org_id][i][ov_siren]);
        }
    }
}