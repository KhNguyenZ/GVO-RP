#define MAX_DEALERSHIP_VEH 100
enum Dealership_Enum{
    d_id,
    d_model,
    d_price,
    d_type,
    Float:d_PosX,
    Float:d_PosY,
    Float:d_PosZ,
    Float:d_PosA,
    Text3D:d_Label
}

new Dealership[MAX_DEALERSHIP_VEH][Dealership_Enum];

new Iterator:Vehicle_Dealership<MAX_DEALERSHIP_VEH>;
new Vehicle_Selling[MAX_DEALERSHIP_VEH];