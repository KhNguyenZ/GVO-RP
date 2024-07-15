#include <progress3D>

#define IsPlayerRoadRepair(%0) (Character[%0][char_Job] == JOB_ROADREPAIR)
func:SetPlayerDamagePoint(playerid)
{
    if(RepairPoint[playerid] == -1)
    new dm_point = RandomEx(0,sizeof(DamagePoint));
    SetPlayerCheckpoint(playerid, DamagePoint[dm_point][0], DamagePoint[dm_point][1], DamagePoint[dm_point][2]);
    RepairPoint[playerid] = dm_point;


    DamageRoad[_point_id][DamageValue] = 0;
    DamageRoad[_point_id][DamageBar] = CreateProgressBar3D(Colors[5], false, x, y, z, 100.0, DamageRoad[_point_id][DamageValue], 100.0);;
    DamageRoad[_point_id][DamageLabel] = CreateDynamic3DTextLabel(sprintf("Trang thai: %s \nNguoi sua: %s", GetRoadStatus(0), player_get_name));
    DamageRoad[_point_id][DamageWorker] = playerid;
    DamageRoad[_point_id][DamageRepair] = 1;
}
func:GetRoadStatus(_status)
{
    new _n_status[64];
    switch(_status)
    {
        case 0: _n_status = "{ad2b2b}Chua duoc sua{FFFFFF}";
        case 1: _n_status = "{2ab03c}Da duoc sua{FFFFFF}";
        default: _n_status = "{ad2b2b}Chua duoc sua{FFFFFF}";
    }
    return _n_status;
}
func:IsValidDamagePoint(_point_id)
{
    new _valid = 0;
    if(DamageRoad[_point_id][DamageBar] == INVAILID_NUMBER) _valid = 1;
    else _valid = 0;
    if(DamageRoad[_point_id][DamageLabel] == INVAILID_NUMBER) _valid = 1;
    else _valid = 0;
    if(DamageRoad[_point_id][DamageValue] == INVAILID_NUMBER) _valid = 1;
    else _valid = 0;
    if(DamageRoad[_point_id][DamageWorker] == INVAILID_NUMBER) _valid = 1;
    else _valid = 0;
    if(DamageRoad[_point_id][DamageRepair] == 0) _valid = 1;
    else _valid = 0;

    return _valid;
}
func:ResetDamagePoint(_point_id)
{
    if(_point_id > sizeof(_point_id)-1) return 0;

    DamageRoad[_point_id][DamageBar] = INVAILID_NUMBER;
    DamageRoad[_point_id][DamageLabel] = INVAILID_NUMBER;
    DamageRoad[_point_id][DamageValue] = INVAILID_NUMBER;
    DamageRoad[_point_id][DamageWorker] = INVAILID_NUMBER;
    DamageRoad[_point_id][DamageRepair] = 0;
    return 1;
}
func:ShowDialogCade(playerid)
{
    if (!IsPlayerRoadRepair(playerid)) return SendErrorMessage(playerid, "Ban khong phai nhan vien !");
    new dlg_cade[50 * sizeof(Cade_Var)];
    for (new i; i < sizeof(Cade_Var); i++)
    {
        new subcade[100];
        format(subcade, 100, "%d\tCade %d\n", Cade_Var[i], i + 1);
        strcat(dlg_cade, subcade);
    }
    strcat(dlg_cade, "-1\tEND");
    return ShowPlayerDialog(playerid, 0, DIALOG_STYLE_PREVIEW_MODEL, "Cade for Road Repair Job", dlg_cade, "Chon", "Huy");
}
