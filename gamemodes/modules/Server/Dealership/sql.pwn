func:LoadDealership()
{
    mysql_tquery(Handle(), "SELECT * FROM `dealership`", "OnLoadDealership");
    return 1;
}

forward OnLoadDealership();
public OnLoadDealership()
{
    for (new i; i < cache_num_rows(); i++)
    {
        cache_get_value_name_int(i, "id", Dealership[i][d_id]);
        cache_get_value_name_int(i, "Model", Dealership[i][d_model]);
        cache_get_value_name_int(i, "Type", Dealership[i][d_type]);
        cache_get_value_name_int(i, "Price", Dealership[i][d_price]);

        cache_get_value_name_float(i, "PositionX", Dealership[i][d_PosX]);
        cache_get_value_name_float(i, "PositionY", Dealership[i][d_PosY]);
        cache_get_value_name_float(i, "PositionZ", Dealership[i][d_PosZ]);
        cache_get_value_name_float(i, "PositionA", Dealership[i][d_PosA]);

        CreateDealershipVehicle(i);
    }
    printf("[Dealership]: Loaded %d vehicles", cache_num_rows());
    return 1;
}

