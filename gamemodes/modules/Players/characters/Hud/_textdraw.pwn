#include <YSI\YSI_Coding\y_hooks>

new PlayerText:
HudPTD[MAX_PLAYERS][3];
new PlayerText:
ProgressPTD_0[MAX_PLAYERS];
new PlayerText:
ProgressPTD_1[MAX_PLAYERS];
new PlayerText:
ProgressPTD_2[MAX_PLAYERS];
new PlayerText:
EatBox[MAX_PLAYERS];
new PlayerText:
ArmourBox[MAX_PLAYERS];
new PlayerText:
HealthBox[MAX_PLAYERS];
new PlayerText:
IconPTD_0[MAX_PLAYERS];
new PlayerText:
IconPTD_1[MAX_PLAYERS];
new PlayerText:
IconPTD_2[MAX_PLAYERS];
new PlayerText:
IconPTD_3[MAX_PLAYERS];
new PlayerText:
ProgressLabel_0[MAX_PLAYERS];
new PlayerText:
ProgressLabel_1[MAX_PLAYERS];
new PlayerText:
ProgressLabel_2[MAX_PLAYERS];
new PlayerText:
AmmoPTD[MAX_PLAYERS];
new PlayerText:
CursorPTD_0[MAX_PLAYERS];
new PlayerText:
CursorPTD_1[MAX_PLAYERS];
new PlayerText:
CursorPTD_2[MAX_PLAYERS];
new PlayerText:
MoneyPTD[MAX_PLAYERS];
new PlayerText:
CashPTD[MAX_PLAYERS];
new PlayerText:
WantedPTD_0[MAX_PLAYERS];
new PlayerText:
WantedPTD_1[MAX_PLAYERS];
new PlayerText:
WantedPTD_2[MAX_PLAYERS];
new PlayerText:
WantedPTD_3[MAX_PLAYERS];
new PlayerText:
WantedPTD_4[MAX_PLAYERS];
new PlayerText:
WantedPTD_5[MAX_PLAYERS];
new PlayerText:
WantedPTD_6[MAX_PLAYERS];

enum IconHud_Data
{
    id_gun,
    txd_gun[128]
}
new const IconHud[][IconHud_Data] =
{
    { 30, "mdl-2008:ak47icon"},
    { 5, "mdl-2008:baticon"},
    { 1, "mdl-2008:BRASSKNUCKLEicon"},
    { 43, "mdl-2008:Cameraicon"},
    { 9, "mdl-2008:chnsawicon"},
    { 25, "mdl-2008:chromegunicon"},
    { 22, "mdl-2008:colt45icon"},
    { 33, "mdl-2008:cuntgunicon"},
    { 24, "mdl-2008:desert_eagleicon"},
    { 42, "mdl-2008:fire_exicon"},
    { 0, "mdl-2008:fist"},
    { 14, "mdl-2008:floweraicon"},
    { 2, "mdl-2008:golfclubicon"},
    { 16, "mdl-2008:grenadeicon"},
    { 15, "mdl-2008:gun_caneicon"},
    { 46, "mdl-2008:gun_paraIcon"},
    { 36, "mdl-2008:heatseekicon"},
    { 45, "mdl-2008:irgogglesicon"},
    { 8, "mdl-2008:katanaicon"},
    { 4, "mdl-2008:knifecuricon"},
    { 31, "mdl-2008:M4icon"},
    { 28, "mdl-2008:micro_uziicon"},
    { 28, "mdl-2008:minigunicon"},
    { 18, "mdl-2008:molotovicon"},
    { 29, "mdl-2008:mp5lngicon"},
    { 3, "mdl-2008:nitestickicon"},
    { 44, "mdl-2008:nvgogglesicon"},
    { 7, "mdl-2008:poolcueicon"},
    { 35, "mdl-2008:rocketlaicon"},
    { 39, "mdl-2008:satchelicon"},
    { 26, "mdl-2008:sawnofficon"},
    { 27, "mdl-2008:shotgspaicon"},
    { 6, "mdl-2008:shovelicon"},
    { 23, "mdl-2008:silencedicon"},
    { 34, "mdl-2008:SNIPERicon"},
    { 41, "mdl-2008:SPRAYCANicon"},
    { 17, "mdl-2008:TearGasicon"},
    { 32, "mdl-2008:tec9icon"}
};
hook OnPlayerConnect(playerid)
{

    HudPTD[playerid][0] = CreatePlayerTextDraw(playerid, 480.000, 15.000, "mdl-2014:full");
    PlayerTextDrawTextSize(playerid, HudPTD[playerid][0], 124.000, 104.000);
    PlayerTextDrawAlignment(playerid, HudPTD[playerid][0], 1);
    PlayerTextDrawColour(playerid, HudPTD[playerid][0], -1);
    PlayerTextDrawSetShadow(playerid, HudPTD[playerid][0], 0);
    PlayerTextDrawSetOutline(playerid, HudPTD[playerid][0], 0);
    PlayerTextDrawBackgroundColour(playerid, HudPTD[playerid][0], 255);
    PlayerTextDrawFont(playerid, HudPTD[playerid][0], 4);
    PlayerTextDrawSetProportional(playerid, HudPTD[playerid][0], 1);

    HudPTD[playerid][1] = CreatePlayerTextDraw(playerid, 523.000, 25.000, "mdl-2014:money-line");
    PlayerTextDrawTextSize(playerid, HudPTD[playerid][1], 75.000, 17.000);
    PlayerTextDrawAlignment(playerid, HudPTD[playerid][1], 1);
    PlayerTextDrawColour(playerid, HudPTD[playerid][1], -1);
    PlayerTextDrawSetShadow(playerid, HudPTD[playerid][1], 0);
    PlayerTextDrawSetOutline(playerid, HudPTD[playerid][1], 0);
    PlayerTextDrawBackgroundColour(playerid, HudPTD[playerid][1], 255);
    PlayerTextDrawFont(playerid, HudPTD[playerid][1], 4);
    PlayerTextDrawSetProportional(playerid, HudPTD[playerid][1], 1);

    HudPTD[playerid][2] = CreatePlayerTextDraw(playerid, 523.000, 45.000, "mdl-2014:bank-line");
    PlayerTextDrawTextSize(playerid, HudPTD[playerid][2], 75.000, 17.000);
    PlayerTextDrawAlignment(playerid, HudPTD[playerid][2], 1);
    PlayerTextDrawColour(playerid, HudPTD[playerid][2], -1);
    PlayerTextDrawSetShadow(playerid, HudPTD[playerid][2], 0);
    PlayerTextDrawSetOutline(playerid, HudPTD[playerid][2], 0);
    PlayerTextDrawBackgroundColour(playerid, HudPTD[playerid][2], 255);
    PlayerTextDrawFont(playerid, HudPTD[playerid][2], 4);
    PlayerTextDrawSetProportional(playerid, HudPTD[playerid][2], 1);

    ProgressPTD_0[playerid] = CreatePlayerTextDraw(playerid, 495.000, 80.000, "mdl-2014:hp-line");
    PlayerTextDrawTextSize(playerid, ProgressPTD_0[playerid], 80.000, 4.000);
    PlayerTextDrawAlignment(playerid, ProgressPTD_0[playerid], 1);
    PlayerTextDrawColour(playerid, ProgressPTD_0[playerid], -1);
    PlayerTextDrawSetShadow(playerid, ProgressPTD_0[playerid], 0);
    PlayerTextDrawSetOutline(playerid, ProgressPTD_0[playerid], 0);
    PlayerTextDrawBackgroundColour(playerid, ProgressPTD_0[playerid], 255);
    PlayerTextDrawFont(playerid, ProgressPTD_0[playerid], 4);
    PlayerTextDrawSetProportional(playerid, ProgressPTD_0[playerid], 1);

    ProgressPTD_1[playerid] = CreatePlayerTextDraw(playerid, 495.000, 93.000, "mdl-2014:ar-line");
    PlayerTextDrawTextSize(playerid, ProgressPTD_1[playerid], 80.000, 4.000);
    PlayerTextDrawAlignment(playerid, ProgressPTD_1[playerid], 1);
    PlayerTextDrawColour(playerid, ProgressPTD_1[playerid], -1);
    PlayerTextDrawSetShadow(playerid, ProgressPTD_1[playerid], 0);
    PlayerTextDrawSetOutline(playerid, ProgressPTD_1[playerid], 0);
    PlayerTextDrawBackgroundColour(playerid, ProgressPTD_1[playerid], 255);
    PlayerTextDrawFont(playerid, ProgressPTD_1[playerid], 4);
    PlayerTextDrawSetProportional(playerid, ProgressPTD_1[playerid], 1);

    ProgressPTD_2[playerid] = CreatePlayerTextDraw(playerid, 495.000, 106.000, "mdl-2014:eat-line");
    PlayerTextDrawTextSize(playerid, ProgressPTD_2[playerid], 80.000, 4.000);
    PlayerTextDrawAlignment(playerid, ProgressPTD_2[playerid], 1);
    PlayerTextDrawColour(playerid, ProgressPTD_2[playerid], -1);
    PlayerTextDrawSetShadow(playerid, ProgressPTD_2[playerid], 0);
    PlayerTextDrawSetOutline(playerid, ProgressPTD_2[playerid], 0);
    PlayerTextDrawBackgroundColour(playerid, ProgressPTD_2[playerid], 255);
    PlayerTextDrawFont(playerid, ProgressPTD_2[playerid], 4);
    PlayerTextDrawSetProportional(playerid, ProgressPTD_2[playerid], 1);

    EatBox[playerid] = CreatePlayerTextDraw(playerid, 493.000, 104.000, "mdl-2014:hp-box");
    PlayerTextDrawTextSize(playerid, EatBox[playerid], 83.000, 8.000);
    PlayerTextDrawAlignment(playerid, EatBox[playerid], 1);
    PlayerTextDrawColour(playerid, EatBox[playerid], -1);
    PlayerTextDrawSetShadow(playerid, EatBox[playerid], 0);
    PlayerTextDrawSetOutline(playerid, EatBox[playerid], 0);
    PlayerTextDrawBackgroundColour(playerid, EatBox[playerid], 255);
    PlayerTextDrawFont(playerid, EatBox[playerid], 4);
    PlayerTextDrawSetProportional(playerid, EatBox[playerid], 1);

    ArmourBox[playerid] = CreatePlayerTextDraw(playerid, 493.000, 91.000, "mdl-2014:hp-box");
    PlayerTextDrawTextSize(playerid, ArmourBox[playerid], 83.000, 8.000);
    PlayerTextDrawAlignment(playerid, ArmourBox[playerid], 1);
    PlayerTextDrawColour(playerid, ArmourBox[playerid], -1);
    PlayerTextDrawSetShadow(playerid, ArmourBox[playerid], 0);
    PlayerTextDrawSetOutline(playerid, ArmourBox[playerid], 0);
    PlayerTextDrawBackgroundColour(playerid, ArmourBox[playerid], 255);
    PlayerTextDrawFont(playerid, ArmourBox[playerid], 4);
    PlayerTextDrawSetProportional(playerid, ArmourBox[playerid], 1);

    HealthBox[playerid] = CreatePlayerTextDraw(playerid, 493.000, 78.000, "mdl-2014:hp-box");
    PlayerTextDrawTextSize(playerid, HealthBox[playerid], 83.000, 8.000);
    PlayerTextDrawAlignment(playerid, HealthBox[playerid], 1);
    PlayerTextDrawColour(playerid, HealthBox[playerid], -1);
    PlayerTextDrawSetShadow(playerid, HealthBox[playerid], 0);
    PlayerTextDrawSetOutline(playerid, HealthBox[playerid], 0);
    PlayerTextDrawBackgroundColour(playerid, HealthBox[playerid], 255);
    PlayerTextDrawFont(playerid, HealthBox[playerid], 4);
    PlayerTextDrawSetProportional(playerid, HealthBox[playerid], 1);

    IconPTD_0[playerid] = CreatePlayerTextDraw(playerid, 487.000, 75.000, "mdl-2014:hp");
    PlayerTextDrawTextSize(playerid, IconPTD_0[playerid], 12.000, 12.000);
    PlayerTextDrawAlignment(playerid, IconPTD_0[playerid], 1);
    PlayerTextDrawColour(playerid, IconPTD_0[playerid], -1);
    PlayerTextDrawSetShadow(playerid, IconPTD_0[playerid], 0);
    PlayerTextDrawSetOutline(playerid, IconPTD_0[playerid], 0);
    PlayerTextDrawBackgroundColour(playerid, IconPTD_0[playerid], 255);
    PlayerTextDrawFont(playerid, IconPTD_0[playerid], 4);
    PlayerTextDrawSetProportional(playerid, IconPTD_0[playerid], 1);

    IconPTD_1[playerid] = CreatePlayerTextDraw(playerid, 487.000, 88.000, "mdl-2014:ar");
    PlayerTextDrawTextSize(playerid, IconPTD_1[playerid], 11.000, 12.000);
    PlayerTextDrawAlignment(playerid, IconPTD_1[playerid], 1);
    PlayerTextDrawColour(playerid, IconPTD_1[playerid], -1);
    PlayerTextDrawSetShadow(playerid, IconPTD_1[playerid], 0);
    PlayerTextDrawSetOutline(playerid, IconPTD_1[playerid], 0);
    PlayerTextDrawBackgroundColour(playerid, IconPTD_1[playerid], 255);
    PlayerTextDrawFont(playerid, IconPTD_1[playerid], 4);
    PlayerTextDrawSetProportional(playerid, IconPTD_1[playerid], 1);

    IconPTD_2[playerid] = CreatePlayerTextDraw(playerid, 487.000, 102.000, "mdl-2014:eat");
    PlayerTextDrawTextSize(playerid, IconPTD_2[playerid], 11.000, 12.000);
    PlayerTextDrawAlignment(playerid, IconPTD_2[playerid], 1);
    PlayerTextDrawColour(playerid, IconPTD_2[playerid], -1);
    PlayerTextDrawSetShadow(playerid, IconPTD_2[playerid], 0);
    PlayerTextDrawSetOutline(playerid, IconPTD_2[playerid], 0);
    PlayerTextDrawBackgroundColour(playerid, IconPTD_2[playerid], 255);
    PlayerTextDrawFont(playerid, IconPTD_2[playerid], 4);
    PlayerTextDrawSetProportional(playerid, IconPTD_2[playerid], 1);

    IconPTD_3[playerid] = CreatePlayerTextDraw(playerid, 494.000, 34.000, "mdl-2015:minigunicon");
    PlayerTextDrawTextSize(playerid, IconPTD_3[playerid], 27.000, 25.000);
    PlayerTextDrawAlignment(playerid, IconPTD_3[playerid], 1);
    PlayerTextDrawColour(playerid, IconPTD_3[playerid], -1);
    PlayerTextDrawSetShadow(playerid, IconPTD_3[playerid], 0);
    PlayerTextDrawSetOutline(playerid, IconPTD_3[playerid], 0);
    PlayerTextDrawBackgroundColour(playerid, IconPTD_3[playerid], 255);
    PlayerTextDrawFont(playerid, IconPTD_3[playerid], 4);
    PlayerTextDrawSetProportional(playerid, IconPTD_3[playerid], 1);

    ProgressLabel_0[playerid] = CreatePlayerTextDraw(playerid, 578.000, 77.000, "100");
    PlayerTextDrawLetterSize(playerid, ProgressLabel_0[playerid], 0.199, 0.999);
    PlayerTextDrawTextSize(playerid, ProgressLabel_0[playerid], -4.000, -2.000);
    PlayerTextDrawAlignment(playerid, ProgressLabel_0[playerid], 1);
    PlayerTextDrawColour(playerid, ProgressLabel_0[playerid], -1);
    PlayerTextDrawSetShadow(playerid, ProgressLabel_0[playerid], 0);
    PlayerTextDrawSetOutline(playerid, ProgressLabel_0[playerid], 0);
    PlayerTextDrawBackgroundColour(playerid, ProgressLabel_0[playerid], 150);
    PlayerTextDrawFont(playerid, ProgressLabel_0[playerid], 1);
    PlayerTextDrawSetProportional(playerid, ProgressLabel_0[playerid], 1);

    ProgressLabel_1[playerid] = CreatePlayerTextDraw(playerid, 578.000, 89.000, "100");
    PlayerTextDrawLetterSize(playerid, ProgressLabel_1[playerid], 0.199, 0.999);
    PlayerTextDrawTextSize(playerid, ProgressLabel_1[playerid], -4.000, -2.000);
    PlayerTextDrawAlignment(playerid, ProgressLabel_1[playerid], 1);
    PlayerTextDrawColour(playerid, ProgressLabel_1[playerid], -1);
    PlayerTextDrawSetShadow(playerid, ProgressLabel_1[playerid], 0);
    PlayerTextDrawSetOutline(playerid, ProgressLabel_1[playerid], 0);
    PlayerTextDrawBackgroundColour(playerid, ProgressLabel_1[playerid], 150);
    PlayerTextDrawFont(playerid, ProgressLabel_1[playerid], 1);
    PlayerTextDrawSetProportional(playerid, ProgressLabel_1[playerid], 1);

    ProgressLabel_2[playerid] = CreatePlayerTextDraw(playerid, 578.000, 102.000, "100");
    PlayerTextDrawLetterSize(playerid, ProgressLabel_2[playerid], 0.199, 0.999);
    PlayerTextDrawTextSize(playerid, ProgressLabel_2[playerid], -4.000, -2.000);
    PlayerTextDrawAlignment(playerid, ProgressLabel_2[playerid], 1);
    PlayerTextDrawColour(playerid, ProgressLabel_2[playerid], -1);
    PlayerTextDrawSetShadow(playerid, ProgressLabel_2[playerid], 0);
    PlayerTextDrawSetOutline(playerid, ProgressLabel_2[playerid], 0);
    PlayerTextDrawBackgroundColour(playerid, ProgressLabel_2[playerid], 150);
    PlayerTextDrawFont(playerid, ProgressLabel_2[playerid], 1);
    PlayerTextDrawSetProportional(playerid, ProgressLabel_2[playerid], 1);

    AmmoPTD[playerid] = CreatePlayerTextDraw(playerid, 506.000, 62.000, "30/1000");
    PlayerTextDrawLetterSize(playerid, AmmoPTD[playerid], 0.199, 0.999);
    PlayerTextDrawTextSize(playerid, AmmoPTD[playerid], 3.000, 5.000);
    PlayerTextDrawAlignment(playerid, AmmoPTD[playerid], 2);
    PlayerTextDrawColour(playerid, AmmoPTD[playerid], -1);
    PlayerTextDrawSetShadow(playerid, AmmoPTD[playerid], 0);
    PlayerTextDrawSetOutline(playerid, AmmoPTD[playerid], 0);
    PlayerTextDrawBackgroundColour(playerid, AmmoPTD[playerid], 150);
    PlayerTextDrawFont(playerid, AmmoPTD[playerid], 1);
    PlayerTextDrawSetProportional(playerid, AmmoPTD[playerid], 1);

    CursorPTD_0[playerid] = CreatePlayerTextDraw(playerid, 572.000, 76.000, "mdl-2014:cursor");
    PlayerTextDrawTextSize(playerid, CursorPTD_0[playerid], 5.000, 11.000);
    PlayerTextDrawAlignment(playerid, CursorPTD_0[playerid], 1);
    PlayerTextDrawColour(playerid, CursorPTD_0[playerid], -1);
    PlayerTextDrawSetShadow(playerid, CursorPTD_0[playerid], 0);
    PlayerTextDrawSetOutline(playerid, CursorPTD_0[playerid], 0);
    PlayerTextDrawBackgroundColour(playerid, CursorPTD_0[playerid], 255);
    PlayerTextDrawFont(playerid, CursorPTD_0[playerid], 4);
    PlayerTextDrawSetProportional(playerid, CursorPTD_0[playerid], 1);

    CursorPTD_1[playerid] = CreatePlayerTextDraw(playerid, 572.000, 89.000, "mdl-2014:cursor");
    PlayerTextDrawTextSize(playerid, CursorPTD_1[playerid], 5.000, 11.000);
    PlayerTextDrawAlignment(playerid, CursorPTD_1[playerid], 1);
    PlayerTextDrawColour(playerid, CursorPTD_1[playerid], -1);
    PlayerTextDrawSetShadow(playerid, CursorPTD_1[playerid], 0);
    PlayerTextDrawSetOutline(playerid, CursorPTD_1[playerid], 0);
    PlayerTextDrawBackgroundColour(playerid, CursorPTD_1[playerid], 255);
    PlayerTextDrawFont(playerid, CursorPTD_1[playerid], 4);
    PlayerTextDrawSetProportional(playerid, CursorPTD_1[playerid], 1);

    CursorPTD_2[playerid] = CreatePlayerTextDraw(playerid, 572.000, 102.000, "mdl-2014:cursor");
    PlayerTextDrawTextSize(playerid, CursorPTD_2[playerid], 5.000, 11.000);
    PlayerTextDrawAlignment(playerid, CursorPTD_2[playerid], 1);
    PlayerTextDrawColour(playerid, CursorPTD_2[playerid], -1);
    PlayerTextDrawSetShadow(playerid, CursorPTD_2[playerid], 0);
    PlayerTextDrawSetOutline(playerid, CursorPTD_2[playerid], 0);
    PlayerTextDrawBackgroundColour(playerid, CursorPTD_2[playerid], 255);
    PlayerTextDrawFont(playerid, CursorPTD_2[playerid], 4);
    PlayerTextDrawSetProportional(playerid, CursorPTD_2[playerid], 1);

    MoneyPTD[playerid] = CreatePlayerTextDraw(playerid, 581.000, 30.000, "100000000000");
    PlayerTextDrawLetterSize(playerid, MoneyPTD[playerid], 0.259, 0.797);
    PlayerTextDrawTextSize(playerid, MoneyPTD[playerid], -26.000, -2.000);
    PlayerTextDrawAlignment(playerid, MoneyPTD[playerid], 3);
    PlayerTextDrawColour(playerid, MoneyPTD[playerid], -1);
    PlayerTextDrawUseBox(playerid, MoneyPTD[playerid], 1);
    PlayerTextDrawBoxColour(playerid, MoneyPTD[playerid], 0);
    PlayerTextDrawSetShadow(playerid, MoneyPTD[playerid], 0);
    PlayerTextDrawSetOutline(playerid, MoneyPTD[playerid], 0);
    PlayerTextDrawBackgroundColour(playerid, MoneyPTD[playerid], 150);
    PlayerTextDrawFont(playerid, MoneyPTD[playerid], 0);
    PlayerTextDrawSetProportional(playerid, MoneyPTD[playerid], 1);

    CashPTD[playerid] = CreatePlayerTextDraw(playerid, 581.000, 50.000, "1000000000");
    PlayerTextDrawLetterSize(playerid, CashPTD[playerid], 0.259, 0.797);
    PlayerTextDrawTextSize(playerid, CashPTD[playerid], -26.000, -2.000);
    PlayerTextDrawAlignment(playerid, CashPTD[playerid], 3);
    PlayerTextDrawColour(playerid, CashPTD[playerid], -1);
    PlayerTextDrawSetShadow(playerid, CashPTD[playerid], 0);
    PlayerTextDrawSetOutline(playerid, CashPTD[playerid], 0);
    PlayerTextDrawBackgroundColour(playerid, CashPTD[playerid], 150);
    PlayerTextDrawFont(playerid, CashPTD[playerid], 0);
    PlayerTextDrawSetProportional(playerid, CashPTD[playerid], 1);

    WantedPTD_0[playerid] = CreatePlayerTextDraw(playerid, 525.000, 63.000, "mdl-2014:wanted");
    PlayerTextDrawTextSize(playerid, WantedPTD_0[playerid], 68.000, 8.000);
    PlayerTextDrawAlignment(playerid, WantedPTD_0[playerid], 1);
    PlayerTextDrawColour(playerid, WantedPTD_0[playerid], -1);
    PlayerTextDrawSetShadow(playerid, WantedPTD_0[playerid], 0);
    PlayerTextDrawSetOutline(playerid, WantedPTD_0[playerid], 0);
    PlayerTextDrawBackgroundColour(playerid, WantedPTD_0[playerid], 255);
    PlayerTextDrawFont(playerid, WantedPTD_0[playerid], 4);
    PlayerTextDrawSetProportional(playerid, WantedPTD_0[playerid], 1);

    WantedPTD_1[playerid] = CreatePlayerTextDraw(playerid, 524.000, 63.000, "mdl-2014:star");
    PlayerTextDrawTextSize(playerid, WantedPTD_1[playerid], 9.000, 8.000);
    PlayerTextDrawAlignment(playerid, WantedPTD_1[playerid], 1);
    PlayerTextDrawColour(playerid, WantedPTD_1[playerid], -1);
    PlayerTextDrawSetShadow(playerid, WantedPTD_1[playerid], 0);
    PlayerTextDrawSetOutline(playerid, WantedPTD_1[playerid], 0);
    PlayerTextDrawBackgroundColour(playerid, WantedPTD_1[playerid], 255);
    PlayerTextDrawFont(playerid, WantedPTD_1[playerid], 4);
    PlayerTextDrawSetProportional(playerid, WantedPTD_1[playerid], 1);

    WantedPTD_2[playerid] = CreatePlayerTextDraw(playerid, 536.000, 63.000, "mdl-2014:star");
    PlayerTextDrawTextSize(playerid, WantedPTD_2[playerid], 9.000, 8.000);
    PlayerTextDrawAlignment(playerid, WantedPTD_2[playerid], 1);
    PlayerTextDrawColour(playerid, WantedPTD_2[playerid], -1);
    PlayerTextDrawSetShadow(playerid, WantedPTD_2[playerid], 0);
    PlayerTextDrawSetOutline(playerid, WantedPTD_2[playerid], 0);
    PlayerTextDrawBackgroundColour(playerid, WantedPTD_2[playerid], 255);
    PlayerTextDrawFont(playerid, WantedPTD_2[playerid], 4);
    PlayerTextDrawSetProportional(playerid, WantedPTD_2[playerid], 1);

    WantedPTD_3[playerid] = CreatePlayerTextDraw(playerid, 548.000, 63.000, "mdl-2014:star");
    PlayerTextDrawTextSize(playerid, WantedPTD_3[playerid], 9.000, 8.000);
    PlayerTextDrawAlignment(playerid, WantedPTD_3[playerid], 1);
    PlayerTextDrawColour(playerid, WantedPTD_3[playerid], -1);
    PlayerTextDrawSetShadow(playerid, WantedPTD_3[playerid], 0);
    PlayerTextDrawSetOutline(playerid, WantedPTD_3[playerid], 0);
    PlayerTextDrawBackgroundColour(playerid, WantedPTD_3[playerid], 255);
    PlayerTextDrawFont(playerid, WantedPTD_3[playerid], 4);
    PlayerTextDrawSetProportional(playerid, WantedPTD_3[playerid], 1);

    WantedPTD_4[playerid] = CreatePlayerTextDraw(playerid, 560.000, 63.000, "mdl-2014:star");
    PlayerTextDrawTextSize(playerid, WantedPTD_4[playerid], 9.000, 8.000);
    PlayerTextDrawAlignment(playerid, WantedPTD_4[playerid], 1);
    PlayerTextDrawColour(playerid, WantedPTD_4[playerid], -1);
    PlayerTextDrawSetShadow(playerid, WantedPTD_4[playerid], 0);
    PlayerTextDrawSetOutline(playerid, WantedPTD_4[playerid], 0);
    PlayerTextDrawBackgroundColour(playerid, WantedPTD_4[playerid], 255);
    PlayerTextDrawFont(playerid, WantedPTD_4[playerid], 4);
    PlayerTextDrawSetProportional(playerid, WantedPTD_4[playerid], 1);

    WantedPTD_5[playerid] = CreatePlayerTextDraw(playerid, 572.000, 63.000, "mdl-2014:star");
    PlayerTextDrawTextSize(playerid, WantedPTD_5[playerid], 9.000, 8.000);
    PlayerTextDrawAlignment(playerid, WantedPTD_5[playerid], 1);
    PlayerTextDrawColour(playerid, WantedPTD_5[playerid], -1);
    PlayerTextDrawSetShadow(playerid, WantedPTD_5[playerid], 0);
    PlayerTextDrawSetOutline(playerid, WantedPTD_5[playerid], 0);
    PlayerTextDrawBackgroundColour(playerid, WantedPTD_5[playerid], 255);
    PlayerTextDrawFont(playerid, WantedPTD_5[playerid], 4);
    PlayerTextDrawSetProportional(playerid, WantedPTD_5[playerid], 1);

    WantedPTD_6[playerid] = CreatePlayerTextDraw(playerid, 585.000, 63.000, "mdl-2014:star");
    PlayerTextDrawTextSize(playerid, WantedPTD_6[playerid], 9.000, 8.000);
    PlayerTextDrawAlignment(playerid, WantedPTD_6[playerid], 1);
    PlayerTextDrawColour(playerid, WantedPTD_6[playerid], -1);
    PlayerTextDrawSetShadow(playerid, WantedPTD_6[playerid], 0);
    PlayerTextDrawSetOutline(playerid, WantedPTD_6[playerid], 0);
    PlayerTextDrawBackgroundColour(playerid, WantedPTD_6[playerid], 255);
    PlayerTextDrawFont(playerid, WantedPTD_6[playerid], 4);
    PlayerTextDrawSetProportional(playerid, WantedPTD_6[playerid], 1);

}

hook OnPlayerSpawn(playerid)
{
    for (new i; i < 3; i++) PlayerTextDrawShow(playerid, HudPTD[playerid][i]);

    PlayerTextDrawShow(playerid, ProgressPTD_0[playerid]);
    PlayerTextDrawShow(playerid, ProgressPTD_1[playerid]);
    PlayerTextDrawShow(playerid, ProgressPTD_2[playerid]);
    PlayerTextDrawShow(playerid, EatBox[playerid]);
    PlayerTextDrawShow(playerid, ArmourBox[playerid]);
    PlayerTextDrawShow(playerid, HealthBox[playerid]);
    PlayerTextDrawShow(playerid, IconPTD_0[playerid]);
    PlayerTextDrawShow(playerid, IconPTD_1[playerid]);
    PlayerTextDrawShow(playerid, IconPTD_2[playerid]);
    PlayerTextDrawShow(playerid, IconPTD_3[playerid]);
    PlayerTextDrawShow(playerid, ProgressLabel_0[playerid]);
    PlayerTextDrawShow(playerid, ProgressLabel_1[playerid]);
    PlayerTextDrawShow(playerid, ProgressLabel_2[playerid]);
    PlayerTextDrawShow(playerid, AmmoPTD[playerid]);
    PlayerTextDrawShow(playerid, CursorPTD_0[playerid]);
    PlayerTextDrawShow(playerid, CursorPTD_1[playerid]);
    PlayerTextDrawShow(playerid, CursorPTD_2[playerid]);
    PlayerTextDrawShow(playerid, MoneyPTD[playerid]);
    PlayerTextDrawShow(playerid, CashPTD[playerid]);
    PlayerTextDrawShow(playerid, WantedPTD_0[playerid]);
    PlayerTextDrawShow(playerid, WantedPTD_1[playerid]);
    PlayerTextDrawShow(playerid, WantedPTD_2[playerid]);
    PlayerTextDrawShow(playerid, WantedPTD_3[playerid]);
    PlayerTextDrawShow(playerid, WantedPTD_4[playerid]);
    PlayerTextDrawShow(playerid, WantedPTD_5[playerid]);
    PlayerTextDrawShow(playerid, WantedPTD_6[playerid]);
}


func:SetPlayerIconHud(playerid)
{
    new pwpid = GetPlayerWeapon(playerid), id_txd;
    for (new i; i < sizeof(IconHud); i++)
    {
        if (pwpid == IconHud[i][id_gun])
        {
            id_txd = i;
            break;
        }
    }
    PlayerTextDrawSetString(playerid, IconPTD_3[playerid], IconHud[id_txd][txd_gun]);
    PlayerTextDrawShow(playerid, IconPTD_3[playerid]);
    return 1;
}

func:UpdatePlayerHealth(playerid)
{
    new Float:value_hud = 0.8;
    new Float:HudHealth, Float:HudArmour;
    GetPlayerHealth(playerid, HudHealth);
    GetPlayerArmour(playerid, HudArmour);
    PlayerTextDrawTextSize(playerid, ProgressPTD_0[playerid], (value_hud * HudHealth), 4.000000);
    PlayerTextDrawTextSize(playerid, ProgressPTD_1[playerid], (value_hud * HudArmour), 4.000000);
    PlayerTextDrawTextSize(playerid, ProgressPTD_2[playerid], (Character[playerid][char_Eat]*value_hud), 4.000000);
    ReloadPlayerTextDraw(playerid, ProgressPTD_0[playerid]);
    ReloadPlayerTextDraw(playerid, ProgressPTD_1[playerid]);
    ReloadPlayerTextDraw(playerid, ProgressPTD_2[playerid]);
    new progresslb_msg[128];
    format(progresslb_msg, sizeof(progresslb_msg), "%d", floatround(HudHealth));
    PlayerTextDrawSetString(playerid, ProgressLabel_0[playerid], progresslb_msg);
    format(progresslb_msg, sizeof(progresslb_msg), "%d", floatround(HudArmour));
    PlayerTextDrawSetString(playerid, ProgressLabel_1[playerid], progresslb_msg);
    format(progresslb_msg, sizeof(progresslb_msg), "%d", Character[playerid][char_Eat]);
    PlayerTextDrawSetString(playerid, ProgressLabel_2[playerid], progresslb_msg);


    format(progresslb_msg, sizeof(progresslb_msg), "%d", GetPlayerMoney(playerid));
    PlayerTextDrawSetString(playerid, MoneyPTD[playerid], progresslb_msg);

    ReloadPlayerTextDraw(playerid, ProgressPTD_0[playerid]);
    ReloadPlayerTextDraw(playerid, ProgressPTD_1[playerid]);
    ReloadPlayerTextDraw(playerid, ProgressPTD_2[playerid]);

    ReloadPlayerTextDraw(playerid, MoneyPTD[playerid]);
    ReloadPlayerTextDraw(playerid, CashPTD[playerid]);

    new Float:value_cursor = 0.79;
    new Float:cursor[3];

    cursor[0] = HudHealth * value_cursor;
    cursor[1] = HudArmour * value_cursor;
    cursor[2] = Character[playerid][char_Eat] * value_cursor;

    if (CursorPTD_0[playerid] != 0)
    {

        PlayerTextDrawHide(playerid, CursorPTD_0[playerid]);
        CursorPTD_0[playerid] = 0;

        CursorPTD_0[playerid] = CreatePlayerTextDraw(playerid, 493 + cursor[0], 76.000, "mdl-2014:cursor");
        PlayerTextDrawTextSize(playerid, CursorPTD_0[playerid], 5.000, 11.000);
        PlayerTextDrawAlignment(playerid, CursorPTD_0[playerid], 1);
        PlayerTextDrawColour(playerid, CursorPTD_0[playerid], -1);
        PlayerTextDrawSetShadow(playerid, CursorPTD_0[playerid], 0);
        PlayerTextDrawSetOutline(playerid, CursorPTD_0[playerid], 0);
        PlayerTextDrawBackgroundColour(playerid, CursorPTD_0[playerid], 255);
        PlayerTextDrawFont(playerid, CursorPTD_0[playerid], 4);
        PlayerTextDrawSetProportional(playerid, CursorPTD_0[playerid], 1);

        PlayerTextDrawShow(playerid, CursorPTD_0[playerid]);
    }
    if (CursorPTD_1[playerid] != 0)
    {

        PlayerTextDrawHide(playerid, CursorPTD_1[playerid]);
        CursorPTD_1[playerid] = 0;

        CursorPTD_1[playerid] = CreatePlayerTextDraw(playerid, 493 + cursor[1], 89.000, "mdl-2014:cursor");
        PlayerTextDrawTextSize(playerid, CursorPTD_1[playerid], 5.000, 11.000);
        PlayerTextDrawAlignment(playerid, CursorPTD_1[playerid], 1);
        PlayerTextDrawColour(playerid, CursorPTD_1[playerid], -1);
        PlayerTextDrawSetShadow(playerid, CursorPTD_1[playerid], 0);
        PlayerTextDrawSetOutline(playerid, CursorPTD_1[playerid], 0);
        PlayerTextDrawBackgroundColour(playerid, CursorPTD_1[playerid], 255);
        PlayerTextDrawFont(playerid, CursorPTD_1[playerid], 4);
        PlayerTextDrawSetProportional(playerid, CursorPTD_1[playerid], 1);

        PlayerTextDrawShow(playerid, CursorPTD_1[playerid]);
    }
    if (CursorPTD_2[playerid] != 0)
    {

        PlayerTextDrawHide(playerid, CursorPTD_2[playerid]);
        CursorPTD_2[playerid] = 0;


        CursorPTD_2[playerid] = CreatePlayerTextDraw(playerid, 493 + cursor[2], 102.000, "mdl-2014:cursor");
        PlayerTextDrawTextSize(playerid, CursorPTD_2[playerid], 5.000, 11.000);
        PlayerTextDrawAlignment(playerid, CursorPTD_2[playerid], 1);
        PlayerTextDrawColour(playerid, CursorPTD_2[playerid], -1);
        PlayerTextDrawSetShadow(playerid, CursorPTD_2[playerid], 0);
        PlayerTextDrawSetOutline(playerid, CursorPTD_2[playerid], 0);
        PlayerTextDrawBackgroundColour(playerid, CursorPTD_2[playerid], 255);
        PlayerTextDrawFont(playerid, CursorPTD_2[playerid], 4);
        PlayerTextDrawSetProportional(playerid, CursorPTD_2[playerid], 1);

        PlayerTextDrawShow(playerid, CursorPTD_2[playerid]);
    }
}


timer UpdatePlayerHud[1000](playerid)
{
    if (IsPlayerSpawned(playerid))
    {
        SetPlayerIconHud(playerid);
        UpdatePlayerHealth(playerid);
    }
    return 1;
}