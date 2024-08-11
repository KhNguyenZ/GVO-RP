#include <YSI\YSI_Coding\y_hooks>
func:CreateMainInv(playerid)
{

    MainInv[playerid][0] = CreatePlayerTextDraw(playerid, 75.000, 82.000, "mdl-2030:bg_inv");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][0], 205.000, 302.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][0], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][0], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][0], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][0], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][0], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][0], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][0], 1);

    MainInv[playerid][1] = CreatePlayerTextDraw(playerid, 91.000, 99.000, "mdl-2030:backpack");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][1], 35.000, 10.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][1], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][1], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][1], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][1], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][1], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][1], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][1], 1);

    MainInv[playerid][2] = CreatePlayerTextDraw(playerid, 216.000, 99.000, "mdl-2030:btn_next");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][2], 20.000, 22.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][2], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][2], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][2], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][2], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][2], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][2], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][2], 1);
    PlayerTextDrawSetSelectable(playerid, MainInv[playerid][2], 1);

    MainInv[playerid][3] = CreatePlayerTextDraw(playerid, 240.000, 99.000, "mdl-2030:btn_pre");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][3], 20.000, 22.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][3], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][3], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][3], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][3], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][3], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][3], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][3], 1);
    PlayerTextDrawSetSelectable(playerid, MainInv[playerid][3], 1);

    MainInv[playerid][4] = CreatePlayerTextDraw(playerid, 93.000, 122.000, "mdl-2030:item");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][4], 34.000, 48.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][4], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][4], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][4], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][4], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][4], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][4], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][4], 1);
    PlayerTextDrawSetSelectable(playerid, MainInv[playerid][4], 0);

    MainInv[playerid][5] = CreatePlayerTextDraw(playerid, 127.000, 122.000, "mdl-2030:item");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][5], 34.000, 48.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][5], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][5], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][5], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][5], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][5], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][5], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][5], 1);
    PlayerTextDrawSetSelectable(playerid, MainInv[playerid][5], 0);

    MainInv[playerid][6] = CreatePlayerTextDraw(playerid, 161.000, 122.000, "mdl-2030:item");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][6], 34.000, 48.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][6], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][6], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][6], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][6], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][6], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][6], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][6], 1);
    PlayerTextDrawSetSelectable(playerid, MainInv[playerid][6], 0);

    MainInv[playerid][7] = CreatePlayerTextDraw(playerid, 195.000, 122.000, "mdl-2030:item");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][7], 34.000, 48.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][7], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][7], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][7], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][7], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][7], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][7], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][7], 1);
    PlayerTextDrawSetSelectable(playerid, MainInv[playerid][7], 0);

    MainInv[playerid][8] = CreatePlayerTextDraw(playerid, 229.000, 122.000, "mdl-2030:item");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][8], 34.000, 48.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][8], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][8], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][8], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][8], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][8], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][8], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][8], 1);
    PlayerTextDrawSetSelectable(playerid, MainInv[playerid][8], 0);

    MainInv[playerid][9] = CreatePlayerTextDraw(playerid, 93.000, 171.000, "mdl-2030:item");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][9], 34.000, 48.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][9], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][9], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][9], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][9], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][9], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][9], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][9], 1);
    PlayerTextDrawSetSelectable(playerid, MainInv[playerid][9], 0);

    MainInv[playerid][10] = CreatePlayerTextDraw(playerid, 127.000, 171.000, "mdl-2030:item");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][10], 34.000, 48.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][10], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][10], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][10], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][10], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][10], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][10], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][10], 1);
    PlayerTextDrawSetSelectable(playerid, MainInv[playerid][10], 0);

    MainInv[playerid][11] = CreatePlayerTextDraw(playerid, 161.000, 171.000, "mdl-2030:item");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][11], 34.000, 48.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][11], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][11], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][11], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][11], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][11], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][11], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][11], 1);
    PlayerTextDrawSetSelectable(playerid, MainInv[playerid][11], 0);

    MainInv[playerid][12] = CreatePlayerTextDraw(playerid, 195.000, 171.000, "mdl-2030:item");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][12], 34.000, 48.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][12], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][12], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][12], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][12], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][12], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][12], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][12], 1);
    PlayerTextDrawSetSelectable(playerid, MainInv[playerid][12], 0);

    MainInv[playerid][13] = CreatePlayerTextDraw(playerid, 229.000, 171.000, "mdl-2030:item");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][13], 34.000, 48.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][13], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][13], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][13], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][13], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][13], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][13], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][13], 1);
    PlayerTextDrawSetSelectable(playerid, MainInv[playerid][13], 0);

    MainInv[playerid][14] = CreatePlayerTextDraw(playerid, 93.000, 220.000, "mdl-2030:item");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][14], 34.000, 48.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][14], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][14], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][14], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][14], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][14], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][14], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][14], 1);
    PlayerTextDrawSetSelectable(playerid, MainInv[playerid][14], 0);

    MainInv[playerid][15] = CreatePlayerTextDraw(playerid, 127.000, 220.000, "mdl-2030:item");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][15], 34.000, 48.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][15], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][15], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][15], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][15], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][15], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][15], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][15], 1);
    PlayerTextDrawSetSelectable(playerid, MainInv[playerid][15], 0);

    MainInv[playerid][16] = CreatePlayerTextDraw(playerid, 161.000, 220.000, "mdl-2030:item");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][16], 34.000, 48.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][16], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][16], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][16], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][16], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][16], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][16], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][16], 1);
    PlayerTextDrawSetSelectable(playerid, MainInv[playerid][16], 0);

    MainInv[playerid][17] = CreatePlayerTextDraw(playerid, 195.000, 220.000, "mdl-2030:item");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][17], 34.000, 48.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][17], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][17], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][17], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][17], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][17], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][17], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][17], 1);
    PlayerTextDrawSetSelectable(playerid, MainInv[playerid][17], 0);

    MainInv[playerid][18] = CreatePlayerTextDraw(playerid, 229.000, 220.000, "mdl-2030:item");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][18], 34.000, 48.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][18], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][18], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][18], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][18], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][18], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][18], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][18], 1);
    PlayerTextDrawSetSelectable(playerid, MainInv[playerid][18], 0);

    MainInv[playerid][19] = CreatePlayerTextDraw(playerid, 93.000, 269.000, "mdl-2030:item");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][19], 34.000, 48.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][19], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][19], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][19], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][19], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][19], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][19], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][19], 1);
    PlayerTextDrawSetSelectable(playerid, MainInv[playerid][19], 0);

    MainInv[playerid][20] = CreatePlayerTextDraw(playerid, 127.000, 269.000, "mdl-2030:item");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][20], 34.000, 48.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][20], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][20], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][20], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][20], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][20], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][20], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][20], 1);
    PlayerTextDrawSetSelectable(playerid, MainInv[playerid][20], 0);

    MainInv[playerid][21] = CreatePlayerTextDraw(playerid, 161.000, 269.000, "mdl-2030:item");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][21], 34.000, 48.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][21], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][21], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][21], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][21], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][21], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][21], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][21], 1);
    PlayerTextDrawSetSelectable(playerid, MainInv[playerid][21], 0);

    MainInv[playerid][22] = CreatePlayerTextDraw(playerid, 195.000, 269.000, "mdl-2030:item");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][22], 34.000, 48.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][22], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][22], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][22], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][22], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][22], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][22], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][22], 1);
    PlayerTextDrawSetSelectable(playerid, MainInv[playerid][22], 0);

    MainInv[playerid][23] = CreatePlayerTextDraw(playerid, 229.000, 269.000, "mdl-2030:item");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][23], 34.000, 48.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][23], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][23], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][23], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][23], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][23], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][23], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][23], 1);
    PlayerTextDrawSetSelectable(playerid, MainInv[playerid][23], 0);

    MainInv[playerid][24] = CreatePlayerTextDraw(playerid, 93.000, 319.000, "mdl-2030:item");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][24], 34.000, 48.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][24], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][24], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][24], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][24], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][24], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][24], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][24], 1);
    PlayerTextDrawSetSelectable(playerid, MainInv[playerid][24], 0);

    MainInv[playerid][25] = CreatePlayerTextDraw(playerid, 127.000, 319.000, "mdl-2030:item");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][25], 34.000, 48.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][25], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][25], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][25], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][25], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][25], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][25], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][25], 1);
    PlayerTextDrawSetSelectable(playerid, MainInv[playerid][25], 0);

    MainInv[playerid][26] = CreatePlayerTextDraw(playerid, 161.000, 319.000, "mdl-2030:item");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][26], 34.000, 48.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][26], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][26], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][26], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][26], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][26], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][26], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][26], 1);
    PlayerTextDrawSetSelectable(playerid, MainInv[playerid][26], 0);

    MainInv[playerid][27] = CreatePlayerTextDraw(playerid, 195.000, 319.000, "mdl-2030:item");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][27], 34.000, 48.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][27], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][27], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][27], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][27], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][27], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][27], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][27], 1);
    PlayerTextDrawSetSelectable(playerid, MainInv[playerid][27], 0);

    MainInv[playerid][28] = CreatePlayerTextDraw(playerid, 229.000, 319.000, "mdl-2030:item");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][28], 34.000, 48.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][28], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][28], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][28], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][28], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][28], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][28], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][28], 1);
    PlayerTextDrawSetSelectable(playerid, MainInv[playerid][28], 0);

    MainInv[playerid][29] = CreatePlayerTextDraw(playerid, 367.000, 82.000, "mdl-2030:bg_inv");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][29], 205.000, 302.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][29], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][29], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][29], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][29], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][29], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][29], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][29], 1);

    MainInv[playerid][30] = CreatePlayerTextDraw(playerid, 385.000, 122.000, "mdl-2030:item");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][30], 34.000, 48.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][30], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][30], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][30], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][30], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][30], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][30], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][30], 1);
    PlayerTextDrawSetSelectable(playerid, MainInv[playerid][30], 0);

    MainInv[playerid][31] = CreatePlayerTextDraw(playerid, 419.000, 122.000, "mdl-2030:item");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][31], 34.000, 48.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][31], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][31], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][31], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][31], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][31], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][31], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][31], 1);
    PlayerTextDrawSetSelectable(playerid, MainInv[playerid][31], 0);

    MainInv[playerid][32] = CreatePlayerTextDraw(playerid, 453.000, 122.000, "mdl-2030:item");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][32], 34.000, 48.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][32], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][32], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][32], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][32], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][32], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][32], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][32], 1);
    PlayerTextDrawSetSelectable(playerid, MainInv[playerid][32], 0);

    MainInv[playerid][33] = CreatePlayerTextDraw(playerid, 487.000, 122.000, "mdl-2030:item");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][33], 34.000, 48.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][33], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][33], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][33], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][33], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][33], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][33], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][33], 1);
    PlayerTextDrawSetSelectable(playerid, MainInv[playerid][33], 0);

    MainInv[playerid][34] = CreatePlayerTextDraw(playerid, 521.000, 122.000, "mdl-2030:item");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][34], 34.000, 48.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][34], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][34], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][34], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][34], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][34], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][34], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][34], 1);
    PlayerTextDrawSetSelectable(playerid, MainInv[playerid][34], 0);

    MainInv[playerid][35] = CreatePlayerTextDraw(playerid, 385.000, 171.000, "mdl-2030:item");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][35], 34.000, 48.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][35], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][35], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][35], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][35], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][35], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][35], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][35], 1);
    PlayerTextDrawSetSelectable(playerid, MainInv[playerid][35], 0);

    MainInv[playerid][36] = CreatePlayerTextDraw(playerid, 419.000, 171.000, "mdl-2030:item");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][36], 34.000, 48.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][36], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][36], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][36], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][36], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][36], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][36], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][36], 1);
    PlayerTextDrawSetSelectable(playerid, MainInv[playerid][36], 0);

    MainInv[playerid][37] = CreatePlayerTextDraw(playerid, 453.000, 171.000, "mdl-2030:item");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][37], 34.000, 48.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][37], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][37], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][37], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][37], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][37], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][37], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][37], 1);
    PlayerTextDrawSetSelectable(playerid, MainInv[playerid][37], 0);

    MainInv[playerid][38] = CreatePlayerTextDraw(playerid, 487.000, 171.000, "mdl-2030:item");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][38], 34.000, 48.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][38], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][38], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][38], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][38], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][38], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][38], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][38], 1);
    PlayerTextDrawSetSelectable(playerid, MainInv[playerid][38], 0);

    MainInv[playerid][39] = CreatePlayerTextDraw(playerid, 521.000, 171.000, "mdl-2030:item");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][39], 34.000, 48.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][39], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][39], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][39], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][39], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][39], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][39], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][39], 1);
    PlayerTextDrawSetSelectable(playerid, MainInv[playerid][39], 0);

    MainInv[playerid][40] = CreatePlayerTextDraw(playerid, 385.000, 220.000, "mdl-2030:item");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][40], 34.000, 48.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][40], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][40], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][40], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][40], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][40], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][40], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][40], 1);
    PlayerTextDrawSetSelectable(playerid, MainInv[playerid][40], 0);

    MainInv[playerid][41] = CreatePlayerTextDraw(playerid, 419.000, 220.000, "mdl-2030:item");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][41], 34.000, 48.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][41], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][41], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][41], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][41], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][41], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][41], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][41], 1);
    PlayerTextDrawSetSelectable(playerid, MainInv[playerid][41], 0);

    MainInv[playerid][42] = CreatePlayerTextDraw(playerid, 453.000, 220.000, "mdl-2030:item");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][42], 34.000, 48.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][42], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][42], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][42], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][42], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][42], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][42], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][42], 1);
    PlayerTextDrawSetSelectable(playerid, MainInv[playerid][42], 0);

    MainInv[playerid][43] = CreatePlayerTextDraw(playerid, 487.000, 220.000, "mdl-2030:item");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][43], 34.000, 48.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][43], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][43], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][43], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][43], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][43], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][43], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][43], 1);
    PlayerTextDrawSetSelectable(playerid, MainInv[playerid][43], 0);

    MainInv[playerid][44] = CreatePlayerTextDraw(playerid, 521.000, 220.000, "mdl-2030:item");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][44], 34.000, 48.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][44], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][44], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][44], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][44], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][44], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][44], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][44], 1);
    PlayerTextDrawSetSelectable(playerid, MainInv[playerid][44], 0);

    MainInv[playerid][45] = CreatePlayerTextDraw(playerid, 385.000, 269.000, "mdl-2030:item");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][45], 34.000, 48.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][45], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][45], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][45], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][45], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][45], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][45], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][45], 1);
    PlayerTextDrawSetSelectable(playerid, MainInv[playerid][45], 0);

    MainInv[playerid][46] = CreatePlayerTextDraw(playerid, 419.000, 269.000, "mdl-2030:item");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][46], 34.000, 48.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][46], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][46], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][46], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][46], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][46], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][46], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][46], 1);
    PlayerTextDrawSetSelectable(playerid, MainInv[playerid][46], 0);

    MainInv[playerid][47] = CreatePlayerTextDraw(playerid, 453.000, 269.000, "mdl-2030:item");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][47], 34.000, 48.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][47], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][47], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][47], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][47], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][47], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][47], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][47], 1);
    PlayerTextDrawSetSelectable(playerid, MainInv[playerid][47], 0);

    MainInv[playerid][48] = CreatePlayerTextDraw(playerid, 487.000, 269.000, "mdl-2030:item");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][48], 34.000, 48.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][48], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][48], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][48], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][48], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][48], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][48], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][48], 1);
    PlayerTextDrawSetSelectable(playerid, MainInv[playerid][48], 0);

    MainInv[playerid][49] = CreatePlayerTextDraw(playerid, 521.000, 269.000, "mdl-2030:item");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][49], 34.000, 48.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][49], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][49], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][49], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][49], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][49], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][49], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][49], 1);
    PlayerTextDrawSetSelectable(playerid, MainInv[playerid][49], 0);

    MainInv[playerid][50] = CreatePlayerTextDraw(playerid, 385.000, 319.000, "mdl-2030:item");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][50], 34.000, 48.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][50], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][50], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][50], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][50], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][50], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][50], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][50], 1);
    PlayerTextDrawSetSelectable(playerid, MainInv[playerid][50], 0);

    MainInv[playerid][51] = CreatePlayerTextDraw(playerid, 419.000, 319.000, "mdl-2030:item");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][51], 34.000, 48.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][51], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][51], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][51], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][51], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][51], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][51], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][51], 1);
    PlayerTextDrawSetSelectable(playerid, MainInv[playerid][51], 0);

    MainInv[playerid][52] = CreatePlayerTextDraw(playerid, 453.000, 319.000, "mdl-2030:item");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][52], 34.000, 48.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][52], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][52], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][52], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][52], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][52], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][52], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][52], 1);
    PlayerTextDrawSetSelectable(playerid, MainInv[playerid][52], 0);

    MainInv[playerid][53] = CreatePlayerTextDraw(playerid, 487.000, 319.000, "mdl-2030:item");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][53], 34.000, 48.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][53], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][53], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][53], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][53], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][53], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][53], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][53], 1);
    PlayerTextDrawSetSelectable(playerid, MainInv[playerid][53], 0);

    MainInv[playerid][54] = CreatePlayerTextDraw(playerid, 521.000, 319.000, "mdl-2030:item");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][54], 34.000, 48.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][54], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][54], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][54], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][54], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][54], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][54], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][54], 1);
    PlayerTextDrawSetSelectable(playerid, MainInv[playerid][54], 0);

    MainInv[playerid][55] = CreatePlayerTextDraw(playerid, 381.000, 99.000, "mdl-2030:Drop");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][55], 21.000, 10.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][55], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][55], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][55], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][55], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][55], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][55], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][55], 1);

    MainInv[playerid][56] = CreatePlayerTextDraw(playerid, 379.000, 99.000, "mdl-2030:Trade");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][56], 26.000, 9.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][56], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][56], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][56], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][56], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][56], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][56], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][56], 1);

    MainInv[playerid][57] = CreatePlayerTextDraw(playerid, 74.000, 377.000, "mdl-2030:bg_inv");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][57], 105.000, 51.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][57], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][57], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][57], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][57], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][57], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][57], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][57], 1);

    MainInv[playerid][58] = CreatePlayerTextDraw(playerid, 179.000, 377.000, "mdl-2030:bg_inv");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][58], 105.000, 51.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][58], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][58], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][58], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][58], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][58], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][58], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][58], 1);

    MainInv[playerid][59] = CreatePlayerTextDraw(playerid, 80.000, 383.000, ""); // item txd
    PlayerTextDrawTextSize(playerid, MainInv[playerid][59], 37.000, 40.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][59], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][59], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][59], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][59], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][59], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][59], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][59], 1);

    MainInv[playerid][60] = CreatePlayerTextDraw(playerid, 121.000, 381.000, ""); // item name
    PlayerTextDrawLetterSize(playerid, MainInv[playerid][60], 0.190, 1.099);
    PlayerTextDrawTextSize(playerid, MainInv[playerid][60], 173.000, 0.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][60], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][60], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][60], 1);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][60], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][60], 150);
    PlayerTextDrawFont(playerid, MainInv[playerid][60], 1);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][60], 1);

    MainInv[playerid][61] = CreatePlayerTextDraw(playerid, 121.000, 391.000, "Amount: ~y~NULL"); // item amount
    PlayerTextDrawLetterSize(playerid, MainInv[playerid][61], 0.190, 1.099);
    PlayerTextDrawTextSize(playerid, MainInv[playerid][61], 173.000, 0.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][61], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][61], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][61], 1);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][61], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][61], 150);
    PlayerTextDrawFont(playerid, MainInv[playerid][61], 1);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][61], 1);

    MainInv[playerid][62] = CreatePlayerTextDraw(playerid, 121.000, 402.000, "Weight: ~p~NULL"); // item weight
    PlayerTextDrawLetterSize(playerid, MainInv[playerid][62], 0.190, 1.099);
    PlayerTextDrawTextSize(playerid, MainInv[playerid][62], 173.000, 0.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][62], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][62], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][62], 1);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][62], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][62], 150);
    PlayerTextDrawFont(playerid, MainInv[playerid][62], 1);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][62], 1);

    MainInv[playerid][63] = CreatePlayerTextDraw(playerid, 185.000, 382.000, "Total Weight:");
    PlayerTextDrawLetterSize(playerid, MainInv[playerid][63], 0.190, 1.099);
    PlayerTextDrawTextSize(playerid, MainInv[playerid][63], 226.000, 0.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][63], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][63], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][63], 1);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][63], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][63], 150);
    PlayerTextDrawFont(playerid, MainInv[playerid][63], 1);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][63], 1);

    MainInv[playerid][64] = CreatePlayerTextDraw(playerid, 248.000, 384.000, "_");
    PlayerTextDrawLetterSize(playerid, MainInv[playerid][64], 0.300, 1.099);
    PlayerTextDrawTextSize(playerid, MainInv[playerid][64], 0.000, 51.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][64], 2);
    PlayerTextDrawColour(playerid, MainInv[playerid][64], -1);
    PlayerTextDrawUseBox(playerid, MainInv[playerid][64], 1);
    PlayerTextDrawBoxColour(playerid, MainInv[playerid][64], 185);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][64], 1);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][64], 1);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][64], 150);
    PlayerTextDrawFont(playerid, MainInv[playerid][64], 1);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][64], 1);

    MainInv[playerid][65] = CreatePlayerTextDraw(playerid, 222.000, 384.000, "_");
    PlayerTextDrawLetterSize(playerid, MainInv[playerid][65], 0.300, 1.099);
    PlayerTextDrawTextSize(playerid, MainInv[playerid][65], 220.000, 51.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][65], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][65], -1);
    PlayerTextDrawUseBox(playerid, MainInv[playerid][65], 1);
    PlayerTextDrawBoxColour(playerid, MainInv[playerid][65], 1687547391);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][65], 1);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][65], 1);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][65], 150);
    PlayerTextDrawFont(playerid, MainInv[playerid][65], 1);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][65], 1);


    MainInv[playerid][66] = CreatePlayerTextDraw(playerid, 248.000, 384.000, "50/200KG");
    PlayerTextDrawLetterSize(playerid, MainInv[playerid][66], 0.189, 1.098);
    PlayerTextDrawTextSize(playerid, MainInv[playerid][66], 173.000, 58.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][66], 2);
    PlayerTextDrawColour(playerid, MainInv[playerid][66], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][66], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][66], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][66], 1887473919);
    PlayerTextDrawFont(playerid, MainInv[playerid][66], 1);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][66], 1);

    MainInv[playerid][67] = CreatePlayerTextDraw(playerid, 185.000, 400.000, "Total Item: ~g~ 20");
    PlayerTextDrawLetterSize(playerid, MainInv[playerid][67], 0.190, 1.099);
    PlayerTextDrawTextSize(playerid, MainInv[playerid][67], 226.000, 0.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][67], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][67], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][67], 1);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][67], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][67], 150);
    PlayerTextDrawFont(playerid, MainInv[playerid][67], 1);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][67], 1);

    MainInv[playerid][68] = CreatePlayerTextDraw(playerid, 270.000, 169.000, "mdl-2030:bg_center");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][68], 106.000, 145.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][68], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][68], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][68], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][68], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][68], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][68], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][68], 1);

    MainInv[playerid][69] = CreatePlayerTextDraw(playerid, 282.000, 189.000, "mdl-2030:input"); 
    PlayerTextDrawTextSize(playerid, MainInv[playerid][69], 82.000, 21.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][69], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][69], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][69], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][69], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][69], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][69], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][69], 1);

    MainInv[playerid][70] = CreatePlayerTextDraw(playerid, 282.000, 218.000, "mdl-2030:btn_use");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][70], 82.000, 21.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][70], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][70], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][70], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][70], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][70], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][70], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][70], 1);
    PlayerTextDrawSetSelectable(playerid, MainInv[playerid][70], 1);

    MainInv[playerid][71] = CreatePlayerTextDraw(playerid, 282.000, 246.000, "mdl-2030:btn_trade");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][71], 82.000, 21.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][71], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][71], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][71], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][71], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][71], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][71], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][71], 1);
    PlayerTextDrawSetSelectable(playerid, MainInv[playerid][71], 1);

    MainInv[playerid][72] = CreatePlayerTextDraw(playerid, 282.000, 275.000, "mdl-2030:btn_close");
    PlayerTextDrawTextSize(playerid, MainInv[playerid][72], 82.000, 21.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][72], 1);
    PlayerTextDrawColour(playerid, MainInv[playerid][72], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][72], 0);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][72], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][72], 255);
    PlayerTextDrawFont(playerid, MainInv[playerid][72], 4);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][72], 1);
    PlayerTextDrawSetSelectable(playerid, MainInv[playerid][72], 1);

    MainInv[playerid][73] = CreatePlayerTextDraw(playerid, 323.000, 192.000, ""); // amount to action
    PlayerTextDrawLetterSize(playerid, MainInv[playerid][73], 0.300, 1.500);
    PlayerTextDrawTextSize(playerid, MainInv[playerid][73], 19.000, 69.000);
    PlayerTextDrawAlignment(playerid, MainInv[playerid][73], 2);
    PlayerTextDrawColour(playerid, MainInv[playerid][73], -1);
    PlayerTextDrawSetShadow(playerid, MainInv[playerid][73], 1);
    PlayerTextDrawSetOutline(playerid, MainInv[playerid][73], 0);
    PlayerTextDrawBackgroundColour(playerid, MainInv[playerid][73], 150);
    PlayerTextDrawFont(playerid, MainInv[playerid][73], 1);
    PlayerTextDrawSetProportional(playerid, MainInv[playerid][73], 1);
    PlayerTextDrawSetSelectable(playerid, MainInv[playerid][73], 0);
    return 1;
}
func:CreateItemInvUI(playerid)
{
    PlayerInvUI[playerid][Inv_ItemTD][0] = CreatePlayerTextDraw(playerid, 96.000, 126.000, "");
    PlayerTextDrawTextSize(playerid, PlayerInvUI[playerid][Inv_ItemTD][0], 28.000, 38.000);
    PlayerTextDrawAlignment(playerid, PlayerInvUI[playerid][Inv_ItemTD][0], 1);
    PlayerTextDrawColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][0], -1);
    PlayerTextDrawSetShadow(playerid, PlayerInvUI[playerid][Inv_ItemTD][0], 0);
    PlayerTextDrawSetOutline(playerid, PlayerInvUI[playerid][Inv_ItemTD][0], 0);
    PlayerTextDrawBackgroundColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][0], 255);
    PlayerTextDrawFont(playerid, PlayerInvUI[playerid][Inv_ItemTD][0], 4);
    PlayerTextDrawSetProportional(playerid, PlayerInvUI[playerid][Inv_ItemTD][0], 1);
    PlayerTextDrawSetSelectable(playerid, PlayerInvUI[playerid][Inv_ItemTD][0], 1);

    PlayerInvUI[playerid][Inv_ItemTD][1] = CreatePlayerTextDraw(playerid, 129.000, 126.000, "");
    PlayerTextDrawTextSize(playerid, PlayerInvUI[playerid][Inv_ItemTD][1], 28.000, 38.000);
    PlayerTextDrawAlignment(playerid, PlayerInvUI[playerid][Inv_ItemTD][1], 1);
    PlayerTextDrawColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][1], -1);
    PlayerTextDrawSetShadow(playerid, PlayerInvUI[playerid][Inv_ItemTD][1], 0);
    PlayerTextDrawSetOutline(playerid, PlayerInvUI[playerid][Inv_ItemTD][1], 0);
    PlayerTextDrawBackgroundColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][1], 255);
    PlayerTextDrawFont(playerid, PlayerInvUI[playerid][Inv_ItemTD][1], 4);
    PlayerTextDrawSetProportional(playerid, PlayerInvUI[playerid][Inv_ItemTD][1], 1);
    PlayerTextDrawSetSelectable(playerid, PlayerInvUI[playerid][Inv_ItemTD][1], 1);

    PlayerInvUI[playerid][Inv_ItemTD][2] = CreatePlayerTextDraw(playerid, 163.000, 126.000, "");
    PlayerTextDrawTextSize(playerid, PlayerInvUI[playerid][Inv_ItemTD][2], 28.000, 38.000);
    PlayerTextDrawAlignment(playerid, PlayerInvUI[playerid][Inv_ItemTD][2], 1);
    PlayerTextDrawColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][2], -1);
    PlayerTextDrawSetShadow(playerid, PlayerInvUI[playerid][Inv_ItemTD][2], 0);
    PlayerTextDrawSetOutline(playerid, PlayerInvUI[playerid][Inv_ItemTD][2], 0);
    PlayerTextDrawBackgroundColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][2], 255);
    PlayerTextDrawFont(playerid, PlayerInvUI[playerid][Inv_ItemTD][2], 4);
    PlayerTextDrawSetProportional(playerid, PlayerInvUI[playerid][Inv_ItemTD][2], 1);
    PlayerTextDrawSetSelectable(playerid, PlayerInvUI[playerid][Inv_ItemTD][2], 1);

    PlayerInvUI[playerid][Inv_ItemTD][3] = CreatePlayerTextDraw(playerid, 197.000, 126.000, "");
    PlayerTextDrawTextSize(playerid, PlayerInvUI[playerid][Inv_ItemTD][3], 28.000, 38.000);
    PlayerTextDrawAlignment(playerid, PlayerInvUI[playerid][Inv_ItemTD][3], 1);
    PlayerTextDrawColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][3], -1);
    PlayerTextDrawSetShadow(playerid, PlayerInvUI[playerid][Inv_ItemTD][3], 0);
    PlayerTextDrawSetOutline(playerid, PlayerInvUI[playerid][Inv_ItemTD][3], 0);
    PlayerTextDrawBackgroundColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][3], 255);
    PlayerTextDrawFont(playerid, PlayerInvUI[playerid][Inv_ItemTD][3], 4);
    PlayerTextDrawSetProportional(playerid, PlayerInvUI[playerid][Inv_ItemTD][3], 1);
    PlayerTextDrawSetSelectable(playerid, PlayerInvUI[playerid][Inv_ItemTD][3], 1);

    PlayerInvUI[playerid][Inv_ItemTD][4] = CreatePlayerTextDraw(playerid, 232.000, 126.000, "");
    PlayerTextDrawTextSize(playerid, PlayerInvUI[playerid][Inv_ItemTD][4], 28.000, 38.000);
    PlayerTextDrawAlignment(playerid, PlayerInvUI[playerid][Inv_ItemTD][4], 1);
    PlayerTextDrawColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][4], -1);
    PlayerTextDrawSetShadow(playerid, PlayerInvUI[playerid][Inv_ItemTD][4], 0);
    PlayerTextDrawSetOutline(playerid, PlayerInvUI[playerid][Inv_ItemTD][4], 0);
    PlayerTextDrawBackgroundColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][4], 255);
    PlayerTextDrawFont(playerid, PlayerInvUI[playerid][Inv_ItemTD][4], 4);
    PlayerTextDrawSetProportional(playerid, PlayerInvUI[playerid][Inv_ItemTD][4], 1);
    PlayerTextDrawSetSelectable(playerid, PlayerInvUI[playerid][Inv_ItemTD][4], 1);

    PlayerInvUI[playerid][Inv_ItemTD][5] = CreatePlayerTextDraw(playerid, 96.000, 175.000, "");
    PlayerTextDrawTextSize(playerid, PlayerInvUI[playerid][Inv_ItemTD][5], 28.000, 38.000);
    PlayerTextDrawAlignment(playerid, PlayerInvUI[playerid][Inv_ItemTD][5], 1);
    PlayerTextDrawColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][5], -1);
    PlayerTextDrawSetShadow(playerid, PlayerInvUI[playerid][Inv_ItemTD][5], 0);
    PlayerTextDrawSetOutline(playerid, PlayerInvUI[playerid][Inv_ItemTD][5], 0);
    PlayerTextDrawBackgroundColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][5], 255);
    PlayerTextDrawFont(playerid, PlayerInvUI[playerid][Inv_ItemTD][5], 4);
    PlayerTextDrawSetProportional(playerid, PlayerInvUI[playerid][Inv_ItemTD][5], 1);
    PlayerTextDrawSetSelectable(playerid, PlayerInvUI[playerid][Inv_ItemTD][5], 1);

    PlayerInvUI[playerid][Inv_ItemTD][6] = CreatePlayerTextDraw(playerid, 129.000, 175.000, "");
    PlayerTextDrawTextSize(playerid, PlayerInvUI[playerid][Inv_ItemTD][6], 28.000, 38.000);
    PlayerTextDrawAlignment(playerid, PlayerInvUI[playerid][Inv_ItemTD][6], 1);
    PlayerTextDrawColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][6], -1);
    PlayerTextDrawSetShadow(playerid, PlayerInvUI[playerid][Inv_ItemTD][6], 0);
    PlayerTextDrawSetOutline(playerid, PlayerInvUI[playerid][Inv_ItemTD][6], 0);
    PlayerTextDrawBackgroundColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][6], 255);
    PlayerTextDrawFont(playerid, PlayerInvUI[playerid][Inv_ItemTD][6], 4);
    PlayerTextDrawSetProportional(playerid, PlayerInvUI[playerid][Inv_ItemTD][6], 1);
    PlayerTextDrawSetSelectable(playerid, PlayerInvUI[playerid][Inv_ItemTD][6], 1);

    PlayerInvUI[playerid][Inv_ItemTD][7] = CreatePlayerTextDraw(playerid, 163.000, 175.000, "");
    PlayerTextDrawTextSize(playerid, PlayerInvUI[playerid][Inv_ItemTD][7], 28.000, 38.000);
    PlayerTextDrawAlignment(playerid, PlayerInvUI[playerid][Inv_ItemTD][7], 1);
    PlayerTextDrawColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][7], -1);
    PlayerTextDrawSetShadow(playerid, PlayerInvUI[playerid][Inv_ItemTD][7], 0);
    PlayerTextDrawSetOutline(playerid, PlayerInvUI[playerid][Inv_ItemTD][7], 0);
    PlayerTextDrawBackgroundColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][7], 255);
    PlayerTextDrawFont(playerid, PlayerInvUI[playerid][Inv_ItemTD][7], 4);
    PlayerTextDrawSetProportional(playerid, PlayerInvUI[playerid][Inv_ItemTD][7], 1);
    PlayerTextDrawSetSelectable(playerid, PlayerInvUI[playerid][Inv_ItemTD][7], 1);

    PlayerInvUI[playerid][Inv_ItemTD][8] = CreatePlayerTextDraw(playerid, 197.000, 175.000, "");
    PlayerTextDrawTextSize(playerid, PlayerInvUI[playerid][Inv_ItemTD][8], 28.000, 38.000);
    PlayerTextDrawAlignment(playerid, PlayerInvUI[playerid][Inv_ItemTD][8], 1);
    PlayerTextDrawColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][8], -1);
    PlayerTextDrawSetShadow(playerid, PlayerInvUI[playerid][Inv_ItemTD][8], 0);
    PlayerTextDrawSetOutline(playerid, PlayerInvUI[playerid][Inv_ItemTD][8], 0);
    PlayerTextDrawBackgroundColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][8], 255);
    PlayerTextDrawFont(playerid, PlayerInvUI[playerid][Inv_ItemTD][8], 4);
    PlayerTextDrawSetProportional(playerid, PlayerInvUI[playerid][Inv_ItemTD][8], 1);
    PlayerTextDrawSetSelectable(playerid, PlayerInvUI[playerid][Inv_ItemTD][8], 1);

    PlayerInvUI[playerid][Inv_ItemTD][9] = CreatePlayerTextDraw(playerid, 232.000, 175.000, "");
    PlayerTextDrawTextSize(playerid, PlayerInvUI[playerid][Inv_ItemTD][9], 28.000, 38.000);
    PlayerTextDrawAlignment(playerid, PlayerInvUI[playerid][Inv_ItemTD][9], 1);
    PlayerTextDrawColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][9], -1);
    PlayerTextDrawSetShadow(playerid, PlayerInvUI[playerid][Inv_ItemTD][9], 0);
    PlayerTextDrawSetOutline(playerid, PlayerInvUI[playerid][Inv_ItemTD][9], 0);
    PlayerTextDrawBackgroundColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][9], 255);
    PlayerTextDrawFont(playerid, PlayerInvUI[playerid][Inv_ItemTD][9], 4);
    PlayerTextDrawSetProportional(playerid, PlayerInvUI[playerid][Inv_ItemTD][9], 1);
    PlayerTextDrawSetSelectable(playerid, PlayerInvUI[playerid][Inv_ItemTD][9], 1);

    PlayerInvUI[playerid][Inv_ItemTD][10] = CreatePlayerTextDraw(playerid, 96.000, 226.000, "");
    PlayerTextDrawTextSize(playerid, PlayerInvUI[playerid][Inv_ItemTD][10], 28.000, 38.000);
    PlayerTextDrawAlignment(playerid, PlayerInvUI[playerid][Inv_ItemTD][10], 1);
    PlayerTextDrawColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][10], -1);
    PlayerTextDrawSetShadow(playerid, PlayerInvUI[playerid][Inv_ItemTD][10], 0);
    PlayerTextDrawSetOutline(playerid, PlayerInvUI[playerid][Inv_ItemTD][10], 0);
    PlayerTextDrawBackgroundColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][10], 255);
    PlayerTextDrawFont(playerid, PlayerInvUI[playerid][Inv_ItemTD][10], 4);
    PlayerTextDrawSetProportional(playerid, PlayerInvUI[playerid][Inv_ItemTD][10], 1);
    PlayerTextDrawSetSelectable(playerid, PlayerInvUI[playerid][Inv_ItemTD][10], 1);

    PlayerInvUI[playerid][Inv_ItemTD][11] = CreatePlayerTextDraw(playerid, 129.000, 226.000, "");
    PlayerTextDrawTextSize(playerid, PlayerInvUI[playerid][Inv_ItemTD][11], 28.000, 38.000);
    PlayerTextDrawAlignment(playerid, PlayerInvUI[playerid][Inv_ItemTD][11], 1);
    PlayerTextDrawColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][11], -1);
    PlayerTextDrawSetShadow(playerid, PlayerInvUI[playerid][Inv_ItemTD][11], 0);
    PlayerTextDrawSetOutline(playerid, PlayerInvUI[playerid][Inv_ItemTD][11], 0);
    PlayerTextDrawBackgroundColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][11], 255);
    PlayerTextDrawFont(playerid, PlayerInvUI[playerid][Inv_ItemTD][11], 4);
    PlayerTextDrawSetProportional(playerid, PlayerInvUI[playerid][Inv_ItemTD][11], 1);
    PlayerTextDrawSetSelectable(playerid, PlayerInvUI[playerid][Inv_ItemTD][11], 1);

    PlayerInvUI[playerid][Inv_ItemTD][12] = CreatePlayerTextDraw(playerid, 163.000, 226.000, "");
    PlayerTextDrawTextSize(playerid, PlayerInvUI[playerid][Inv_ItemTD][12], 28.000, 38.000);
    PlayerTextDrawAlignment(playerid, PlayerInvUI[playerid][Inv_ItemTD][12], 1);
    PlayerTextDrawColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][12], -1);
    PlayerTextDrawSetShadow(playerid, PlayerInvUI[playerid][Inv_ItemTD][12], 0);
    PlayerTextDrawSetOutline(playerid, PlayerInvUI[playerid][Inv_ItemTD][12], 0);
    PlayerTextDrawBackgroundColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][12], 255);
    PlayerTextDrawFont(playerid, PlayerInvUI[playerid][Inv_ItemTD][12], 4);
    PlayerTextDrawSetProportional(playerid, PlayerInvUI[playerid][Inv_ItemTD][12], 1);
    PlayerTextDrawSetSelectable(playerid, PlayerInvUI[playerid][Inv_ItemTD][12], 1);

    PlayerInvUI[playerid][Inv_ItemTD][13] = CreatePlayerTextDraw(playerid, 197.000, 226.000, "");
    PlayerTextDrawTextSize(playerid, PlayerInvUI[playerid][Inv_ItemTD][13], 28.000, 38.000);
    PlayerTextDrawAlignment(playerid, PlayerInvUI[playerid][Inv_ItemTD][13], 1);
    PlayerTextDrawColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][13], -1);
    PlayerTextDrawSetShadow(playerid, PlayerInvUI[playerid][Inv_ItemTD][13], 0);
    PlayerTextDrawSetOutline(playerid, PlayerInvUI[playerid][Inv_ItemTD][13], 0);
    PlayerTextDrawBackgroundColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][13], 255);
    PlayerTextDrawFont(playerid, PlayerInvUI[playerid][Inv_ItemTD][13], 4);
    PlayerTextDrawSetProportional(playerid, PlayerInvUI[playerid][Inv_ItemTD][13], 1);
    PlayerTextDrawSetSelectable(playerid, PlayerInvUI[playerid][Inv_ItemTD][13], 1);

    PlayerInvUI[playerid][Inv_ItemTD][14] = CreatePlayerTextDraw(playerid, 232.000, 226.000, "");
    PlayerTextDrawTextSize(playerid, PlayerInvUI[playerid][Inv_ItemTD][14], 28.000, 38.000);
    PlayerTextDrawAlignment(playerid, PlayerInvUI[playerid][Inv_ItemTD][14], 1);
    PlayerTextDrawColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][14], -1);
    PlayerTextDrawSetShadow(playerid, PlayerInvUI[playerid][Inv_ItemTD][14], 0);
    PlayerTextDrawSetOutline(playerid, PlayerInvUI[playerid][Inv_ItemTD][14], 0);
    PlayerTextDrawBackgroundColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][14], 255);
    PlayerTextDrawFont(playerid, PlayerInvUI[playerid][Inv_ItemTD][14], 4);
    PlayerTextDrawSetProportional(playerid, PlayerInvUI[playerid][Inv_ItemTD][14], 1);
    PlayerTextDrawSetSelectable(playerid, PlayerInvUI[playerid][Inv_ItemTD][14], 1);

    PlayerInvUI[playerid][Inv_ItemTD][15] = CreatePlayerTextDraw(playerid, 96.000, 274.000, "");
    PlayerTextDrawTextSize(playerid, PlayerInvUI[playerid][Inv_ItemTD][15], 28.000, 38.000);
    PlayerTextDrawAlignment(playerid, PlayerInvUI[playerid][Inv_ItemTD][15], 1);
    PlayerTextDrawColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][15], -1);
    PlayerTextDrawSetShadow(playerid, PlayerInvUI[playerid][Inv_ItemTD][15], 0);
    PlayerTextDrawSetOutline(playerid, PlayerInvUI[playerid][Inv_ItemTD][15], 0);
    PlayerTextDrawBackgroundColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][15], 255);
    PlayerTextDrawFont(playerid, PlayerInvUI[playerid][Inv_ItemTD][15], 4);
    PlayerTextDrawSetProportional(playerid, PlayerInvUI[playerid][Inv_ItemTD][15], 1);
    PlayerTextDrawSetSelectable(playerid, PlayerInvUI[playerid][Inv_ItemTD][15], 1);

    PlayerInvUI[playerid][Inv_ItemTD][16] = CreatePlayerTextDraw(playerid, 129.000, 274.000, "");
    PlayerTextDrawTextSize(playerid, PlayerInvUI[playerid][Inv_ItemTD][16], 28.000, 38.000);
    PlayerTextDrawAlignment(playerid, PlayerInvUI[playerid][Inv_ItemTD][16], 1);
    PlayerTextDrawColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][16], -1);
    PlayerTextDrawSetShadow(playerid, PlayerInvUI[playerid][Inv_ItemTD][16], 0);
    PlayerTextDrawSetOutline(playerid, PlayerInvUI[playerid][Inv_ItemTD][16], 0);
    PlayerTextDrawBackgroundColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][16], 255);
    PlayerTextDrawFont(playerid, PlayerInvUI[playerid][Inv_ItemTD][16], 4);
    PlayerTextDrawSetProportional(playerid, PlayerInvUI[playerid][Inv_ItemTD][16], 1);
    PlayerTextDrawSetSelectable(playerid, PlayerInvUI[playerid][Inv_ItemTD][16], 1);

    PlayerInvUI[playerid][Inv_ItemTD][17] = CreatePlayerTextDraw(playerid, 163.000, 274.000, "");
    PlayerTextDrawTextSize(playerid, PlayerInvUI[playerid][Inv_ItemTD][17], 28.000, 38.000);
    PlayerTextDrawAlignment(playerid, PlayerInvUI[playerid][Inv_ItemTD][17], 1);
    PlayerTextDrawColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][17], -1);
    PlayerTextDrawSetShadow(playerid, PlayerInvUI[playerid][Inv_ItemTD][17], 0);
    PlayerTextDrawSetOutline(playerid, PlayerInvUI[playerid][Inv_ItemTD][17], 0);
    PlayerTextDrawBackgroundColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][17], 255);
    PlayerTextDrawFont(playerid, PlayerInvUI[playerid][Inv_ItemTD][17], 4);
    PlayerTextDrawSetProportional(playerid, PlayerInvUI[playerid][Inv_ItemTD][17], 1);
    PlayerTextDrawSetSelectable(playerid, PlayerInvUI[playerid][Inv_ItemTD][17], 1);

    PlayerInvUI[playerid][Inv_ItemTD][18] = CreatePlayerTextDraw(playerid, 197.000, 274.000, "");
    PlayerTextDrawTextSize(playerid, PlayerInvUI[playerid][Inv_ItemTD][18], 28.000, 38.000);
    PlayerTextDrawAlignment(playerid, PlayerInvUI[playerid][Inv_ItemTD][18], 1);
    PlayerTextDrawColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][18], -1);
    PlayerTextDrawSetShadow(playerid, PlayerInvUI[playerid][Inv_ItemTD][18], 0);
    PlayerTextDrawSetOutline(playerid, PlayerInvUI[playerid][Inv_ItemTD][18], 0);
    PlayerTextDrawBackgroundColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][18], 255);
    PlayerTextDrawFont(playerid, PlayerInvUI[playerid][Inv_ItemTD][18], 4);
    PlayerTextDrawSetProportional(playerid, PlayerInvUI[playerid][Inv_ItemTD][18], 1);
    PlayerTextDrawSetSelectable(playerid, PlayerInvUI[playerid][Inv_ItemTD][18], 1);

    PlayerInvUI[playerid][Inv_ItemTD][19] = CreatePlayerTextDraw(playerid, 232.000, 274.000, "");
    PlayerTextDrawTextSize(playerid, PlayerInvUI[playerid][Inv_ItemTD][19], 28.000, 38.000);
    PlayerTextDrawAlignment(playerid, PlayerInvUI[playerid][Inv_ItemTD][19], 1);
    PlayerTextDrawColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][19], -1);
    PlayerTextDrawSetShadow(playerid, PlayerInvUI[playerid][Inv_ItemTD][19], 0);
    PlayerTextDrawSetOutline(playerid, PlayerInvUI[playerid][Inv_ItemTD][19], 0);
    PlayerTextDrawBackgroundColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][19], 255);
    PlayerTextDrawFont(playerid, PlayerInvUI[playerid][Inv_ItemTD][19], 4);
    PlayerTextDrawSetProportional(playerid, PlayerInvUI[playerid][Inv_ItemTD][19], 1);
    PlayerTextDrawSetSelectable(playerid, PlayerInvUI[playerid][Inv_ItemTD][19], 1);

    PlayerInvUI[playerid][Inv_ItemTD][20] = CreatePlayerTextDraw(playerid, 96.000, 325.000, "");
    PlayerTextDrawTextSize(playerid, PlayerInvUI[playerid][Inv_ItemTD][20], 28.000, 38.000);
    PlayerTextDrawAlignment(playerid, PlayerInvUI[playerid][Inv_ItemTD][20], 1);
    PlayerTextDrawColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][20], -1);
    PlayerTextDrawSetShadow(playerid, PlayerInvUI[playerid][Inv_ItemTD][20], 0);
    PlayerTextDrawSetOutline(playerid, PlayerInvUI[playerid][Inv_ItemTD][20], 0);
    PlayerTextDrawBackgroundColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][20], 255);
    PlayerTextDrawFont(playerid, PlayerInvUI[playerid][Inv_ItemTD][20], 4);
    PlayerTextDrawSetProportional(playerid, PlayerInvUI[playerid][Inv_ItemTD][20], 1);
    PlayerTextDrawSetSelectable(playerid, PlayerInvUI[playerid][Inv_ItemTD][20], 1);

    PlayerInvUI[playerid][Inv_ItemTD][21] = CreatePlayerTextDraw(playerid, 129.000, 325.000, "");
    PlayerTextDrawTextSize(playerid, PlayerInvUI[playerid][Inv_ItemTD][21], 28.000, 38.000);
    PlayerTextDrawAlignment(playerid, PlayerInvUI[playerid][Inv_ItemTD][21], 1);
    PlayerTextDrawColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][21], -1);
    PlayerTextDrawSetShadow(playerid, PlayerInvUI[playerid][Inv_ItemTD][21], 0);
    PlayerTextDrawSetOutline(playerid, PlayerInvUI[playerid][Inv_ItemTD][21], 0);
    PlayerTextDrawBackgroundColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][21], 255);
    PlayerTextDrawFont(playerid, PlayerInvUI[playerid][Inv_ItemTD][21], 4);
    PlayerTextDrawSetProportional(playerid, PlayerInvUI[playerid][Inv_ItemTD][21], 1);
    PlayerTextDrawSetSelectable(playerid, PlayerInvUI[playerid][Inv_ItemTD][21], 1);

    PlayerInvUI[playerid][Inv_ItemTD][22] = CreatePlayerTextDraw(playerid, 163.000, 325.000, "");
    PlayerTextDrawTextSize(playerid, PlayerInvUI[playerid][Inv_ItemTD][22], 28.000, 38.000);
    PlayerTextDrawAlignment(playerid, PlayerInvUI[playerid][Inv_ItemTD][22], 1);
    PlayerTextDrawColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][22], -1);
    PlayerTextDrawSetShadow(playerid, PlayerInvUI[playerid][Inv_ItemTD][22], 0);
    PlayerTextDrawSetOutline(playerid, PlayerInvUI[playerid][Inv_ItemTD][22], 0);
    PlayerTextDrawBackgroundColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][22], 255);
    PlayerTextDrawFont(playerid, PlayerInvUI[playerid][Inv_ItemTD][22], 4);
    PlayerTextDrawSetProportional(playerid, PlayerInvUI[playerid][Inv_ItemTD][22], 1);
    PlayerTextDrawSetSelectable(playerid, PlayerInvUI[playerid][Inv_ItemTD][22], 1);

    PlayerInvUI[playerid][Inv_ItemTD][23] = CreatePlayerTextDraw(playerid, 197.000, 325.000, "");
    PlayerTextDrawTextSize(playerid, PlayerInvUI[playerid][Inv_ItemTD][23], 28.000, 38.000);
    PlayerTextDrawAlignment(playerid, PlayerInvUI[playerid][Inv_ItemTD][23], 1);
    PlayerTextDrawColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][23], -1);
    PlayerTextDrawSetShadow(playerid, PlayerInvUI[playerid][Inv_ItemTD][23], 0);
    PlayerTextDrawSetOutline(playerid, PlayerInvUI[playerid][Inv_ItemTD][23], 0);
    PlayerTextDrawBackgroundColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][23], 255);
    PlayerTextDrawFont(playerid, PlayerInvUI[playerid][Inv_ItemTD][23], 4);
    PlayerTextDrawSetProportional(playerid, PlayerInvUI[playerid][Inv_ItemTD][23], 1);
    PlayerTextDrawSetSelectable(playerid, PlayerInvUI[playerid][Inv_ItemTD][23], 1);

    PlayerInvUI[playerid][Inv_ItemTD][24] = CreatePlayerTextDraw(playerid, 232.000, 325.000, "");
    PlayerTextDrawTextSize(playerid, PlayerInvUI[playerid][Inv_ItemTD][24], 28.000, 38.000);
    PlayerTextDrawAlignment(playerid, PlayerInvUI[playerid][Inv_ItemTD][24], 1);
    PlayerTextDrawColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][24], -1);
    PlayerTextDrawSetShadow(playerid, PlayerInvUI[playerid][Inv_ItemTD][24], 0);
    PlayerTextDrawSetOutline(playerid, PlayerInvUI[playerid][Inv_ItemTD][24], 0);
    PlayerTextDrawBackgroundColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][24], 255);
    PlayerTextDrawFont(playerid, PlayerInvUI[playerid][Inv_ItemTD][24], 4);
    PlayerTextDrawSetProportional(playerid, PlayerInvUI[playerid][Inv_ItemTD][24], 1);
    PlayerTextDrawSetSelectable(playerid, PlayerInvUI[playerid][Inv_ItemTD][24], 1);

    PlayerInvUI[playerid][Inv_ItemTD][25] = CreatePlayerTextDraw(playerid, 388.000, 126.000, "");
    PlayerTextDrawTextSize(playerid, PlayerInvUI[playerid][Inv_ItemTD][25], 28.000, 38.000);
    PlayerTextDrawAlignment(playerid, PlayerInvUI[playerid][Inv_ItemTD][25], 1);
    PlayerTextDrawColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][25], -1);
    PlayerTextDrawSetShadow(playerid, PlayerInvUI[playerid][Inv_ItemTD][25], 0);
    PlayerTextDrawSetOutline(playerid, PlayerInvUI[playerid][Inv_ItemTD][25], 0);
    PlayerTextDrawBackgroundColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][25], 255);
    PlayerTextDrawFont(playerid, PlayerInvUI[playerid][Inv_ItemTD][25], 4);
    PlayerTextDrawSetProportional(playerid, PlayerInvUI[playerid][Inv_ItemTD][25], 1);
    PlayerTextDrawSetSelectable(playerid, PlayerInvUI[playerid][Inv_ItemTD][25], 1);

    PlayerInvUI[playerid][Inv_ItemTD][26] = CreatePlayerTextDraw(playerid, 421.000, 126.000, "");
    PlayerTextDrawTextSize(playerid, PlayerInvUI[playerid][Inv_ItemTD][26], 28.000, 38.000);
    PlayerTextDrawAlignment(playerid, PlayerInvUI[playerid][Inv_ItemTD][26], 1);
    PlayerTextDrawColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][26], -1);
    PlayerTextDrawSetShadow(playerid, PlayerInvUI[playerid][Inv_ItemTD][26], 0);
    PlayerTextDrawSetOutline(playerid, PlayerInvUI[playerid][Inv_ItemTD][26], 0);
    PlayerTextDrawBackgroundColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][26], 255);
    PlayerTextDrawFont(playerid, PlayerInvUI[playerid][Inv_ItemTD][26], 4);
    PlayerTextDrawSetProportional(playerid, PlayerInvUI[playerid][Inv_ItemTD][26], 1);
    PlayerTextDrawSetSelectable(playerid, PlayerInvUI[playerid][Inv_ItemTD][26], 1);

    PlayerInvUI[playerid][Inv_ItemTD][27] = CreatePlayerTextDraw(playerid, 455.000, 126.000, "");
    PlayerTextDrawTextSize(playerid, PlayerInvUI[playerid][Inv_ItemTD][27], 28.000, 38.000);
    PlayerTextDrawAlignment(playerid, PlayerInvUI[playerid][Inv_ItemTD][27], 1);
    PlayerTextDrawColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][27], -1);
    PlayerTextDrawSetShadow(playerid, PlayerInvUI[playerid][Inv_ItemTD][27], 0);
    PlayerTextDrawSetOutline(playerid, PlayerInvUI[playerid][Inv_ItemTD][27], 0);
    PlayerTextDrawBackgroundColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][27], 255);
    PlayerTextDrawFont(playerid, PlayerInvUI[playerid][Inv_ItemTD][27], 4);
    PlayerTextDrawSetProportional(playerid, PlayerInvUI[playerid][Inv_ItemTD][27], 1);
    PlayerTextDrawSetSelectable(playerid, PlayerInvUI[playerid][Inv_ItemTD][27], 1);

    PlayerInvUI[playerid][Inv_ItemTD][28] = CreatePlayerTextDraw(playerid, 489.000, 126.000, "");
    PlayerTextDrawTextSize(playerid, PlayerInvUI[playerid][Inv_ItemTD][28], 28.000, 38.000);
    PlayerTextDrawAlignment(playerid, PlayerInvUI[playerid][Inv_ItemTD][28], 1);
    PlayerTextDrawColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][28], -1);
    PlayerTextDrawSetShadow(playerid, PlayerInvUI[playerid][Inv_ItemTD][28], 0);
    PlayerTextDrawSetOutline(playerid, PlayerInvUI[playerid][Inv_ItemTD][28], 0);
    PlayerTextDrawBackgroundColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][28], 255);
    PlayerTextDrawFont(playerid, PlayerInvUI[playerid][Inv_ItemTD][28], 4);
    PlayerTextDrawSetProportional(playerid, PlayerInvUI[playerid][Inv_ItemTD][28], 1);
    PlayerTextDrawSetSelectable(playerid, PlayerInvUI[playerid][Inv_ItemTD][28], 1);

    PlayerInvUI[playerid][Inv_ItemTD][29] = CreatePlayerTextDraw(playerid, 524.000, 126.000, "");
    PlayerTextDrawTextSize(playerid, PlayerInvUI[playerid][Inv_ItemTD][29], 28.000, 38.000);
    PlayerTextDrawAlignment(playerid, PlayerInvUI[playerid][Inv_ItemTD][29], 1);
    PlayerTextDrawColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][29], -1);
    PlayerTextDrawSetShadow(playerid, PlayerInvUI[playerid][Inv_ItemTD][29], 0);
    PlayerTextDrawSetOutline(playerid, PlayerInvUI[playerid][Inv_ItemTD][29], 0);
    PlayerTextDrawBackgroundColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][29], 255);
    PlayerTextDrawFont(playerid, PlayerInvUI[playerid][Inv_ItemTD][29], 4);
    PlayerTextDrawSetProportional(playerid, PlayerInvUI[playerid][Inv_ItemTD][29], 1);
    PlayerTextDrawSetSelectable(playerid, PlayerInvUI[playerid][Inv_ItemTD][29], 1);

    PlayerInvUI[playerid][Inv_ItemTD][30] = CreatePlayerTextDraw(playerid, 388.000, 175.000, "");
    PlayerTextDrawTextSize(playerid, PlayerInvUI[playerid][Inv_ItemTD][30], 28.000, 38.000);
    PlayerTextDrawAlignment(playerid, PlayerInvUI[playerid][Inv_ItemTD][30], 1);
    PlayerTextDrawColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][30], -1);
    PlayerTextDrawSetShadow(playerid, PlayerInvUI[playerid][Inv_ItemTD][30], 0);
    PlayerTextDrawSetOutline(playerid, PlayerInvUI[playerid][Inv_ItemTD][30], 0);
    PlayerTextDrawBackgroundColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][30], 255);
    PlayerTextDrawFont(playerid, PlayerInvUI[playerid][Inv_ItemTD][30], 4);
    PlayerTextDrawSetProportional(playerid, PlayerInvUI[playerid][Inv_ItemTD][30], 1);
    PlayerTextDrawSetSelectable(playerid, PlayerInvUI[playerid][Inv_ItemTD][30], 1);

    PlayerInvUI[playerid][Inv_ItemTD][31] = CreatePlayerTextDraw(playerid, 421.000, 175.000, "");
    PlayerTextDrawTextSize(playerid, PlayerInvUI[playerid][Inv_ItemTD][31], 28.000, 38.000);
    PlayerTextDrawAlignment(playerid, PlayerInvUI[playerid][Inv_ItemTD][31], 1);
    PlayerTextDrawColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][31], -1);
    PlayerTextDrawSetShadow(playerid, PlayerInvUI[playerid][Inv_ItemTD][31], 0);
    PlayerTextDrawSetOutline(playerid, PlayerInvUI[playerid][Inv_ItemTD][31], 0);
    PlayerTextDrawBackgroundColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][31], 255);
    PlayerTextDrawFont(playerid, PlayerInvUI[playerid][Inv_ItemTD][31], 4);
    PlayerTextDrawSetProportional(playerid, PlayerInvUI[playerid][Inv_ItemTD][31], 1);
    PlayerTextDrawSetSelectable(playerid, PlayerInvUI[playerid][Inv_ItemTD][31], 1);

    PlayerInvUI[playerid][Inv_ItemTD][32] = CreatePlayerTextDraw(playerid, 455.000, 175.000, "");
    PlayerTextDrawTextSize(playerid, PlayerInvUI[playerid][Inv_ItemTD][32], 28.000, 38.000);
    PlayerTextDrawAlignment(playerid, PlayerInvUI[playerid][Inv_ItemTD][32], 1);
    PlayerTextDrawColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][32], -1);
    PlayerTextDrawSetShadow(playerid, PlayerInvUI[playerid][Inv_ItemTD][32], 0);
    PlayerTextDrawSetOutline(playerid, PlayerInvUI[playerid][Inv_ItemTD][32], 0);
    PlayerTextDrawBackgroundColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][32], 255);
    PlayerTextDrawFont(playerid, PlayerInvUI[playerid][Inv_ItemTD][32], 4);
    PlayerTextDrawSetProportional(playerid, PlayerInvUI[playerid][Inv_ItemTD][32], 1);
    PlayerTextDrawSetSelectable(playerid, PlayerInvUI[playerid][Inv_ItemTD][32], 1);

    PlayerInvUI[playerid][Inv_ItemTD][33] = CreatePlayerTextDraw(playerid, 489.000, 175.000, "");
    PlayerTextDrawTextSize(playerid, PlayerInvUI[playerid][Inv_ItemTD][33], 28.000, 38.000);
    PlayerTextDrawAlignment(playerid, PlayerInvUI[playerid][Inv_ItemTD][33], 1);
    PlayerTextDrawColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][33], -1);
    PlayerTextDrawSetShadow(playerid, PlayerInvUI[playerid][Inv_ItemTD][33], 0);
    PlayerTextDrawSetOutline(playerid, PlayerInvUI[playerid][Inv_ItemTD][33], 0);
    PlayerTextDrawBackgroundColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][33], 255);
    PlayerTextDrawFont(playerid, PlayerInvUI[playerid][Inv_ItemTD][33], 4);
    PlayerTextDrawSetProportional(playerid, PlayerInvUI[playerid][Inv_ItemTD][33], 1);
    PlayerTextDrawSetSelectable(playerid, PlayerInvUI[playerid][Inv_ItemTD][33], 1);

    PlayerInvUI[playerid][Inv_ItemTD][34] = CreatePlayerTextDraw(playerid, 524.000, 175.000, "");
    PlayerTextDrawTextSize(playerid, PlayerInvUI[playerid][Inv_ItemTD][34], 28.000, 38.000);
    PlayerTextDrawAlignment(playerid, PlayerInvUI[playerid][Inv_ItemTD][34], 1);
    PlayerTextDrawColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][34], -1);
    PlayerTextDrawSetShadow(playerid, PlayerInvUI[playerid][Inv_ItemTD][34], 0);
    PlayerTextDrawSetOutline(playerid, PlayerInvUI[playerid][Inv_ItemTD][34], 0);
    PlayerTextDrawBackgroundColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][34], 255);
    PlayerTextDrawFont(playerid, PlayerInvUI[playerid][Inv_ItemTD][34], 4);
    PlayerTextDrawSetProportional(playerid, PlayerInvUI[playerid][Inv_ItemTD][34], 1);
    PlayerTextDrawSetSelectable(playerid, PlayerInvUI[playerid][Inv_ItemTD][34], 1);

    PlayerInvUI[playerid][Inv_ItemTD][35] = CreatePlayerTextDraw(playerid, 388.000, 226.000, "");
    PlayerTextDrawTextSize(playerid, PlayerInvUI[playerid][Inv_ItemTD][35], 28.000, 38.000);
    PlayerTextDrawAlignment(playerid, PlayerInvUI[playerid][Inv_ItemTD][35], 1);
    PlayerTextDrawColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][35], -1);
    PlayerTextDrawSetShadow(playerid, PlayerInvUI[playerid][Inv_ItemTD][35], 0);
    PlayerTextDrawSetOutline(playerid, PlayerInvUI[playerid][Inv_ItemTD][35], 0);
    PlayerTextDrawBackgroundColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][35], 255);
    PlayerTextDrawFont(playerid, PlayerInvUI[playerid][Inv_ItemTD][35], 4);
    PlayerTextDrawSetProportional(playerid, PlayerInvUI[playerid][Inv_ItemTD][35], 1);
    PlayerTextDrawSetSelectable(playerid, PlayerInvUI[playerid][Inv_ItemTD][35], 1);

    PlayerInvUI[playerid][Inv_ItemTD][36] = CreatePlayerTextDraw(playerid, 421.000, 226.000, "");
    PlayerTextDrawTextSize(playerid, PlayerInvUI[playerid][Inv_ItemTD][36], 28.000, 38.000);
    PlayerTextDrawAlignment(playerid, PlayerInvUI[playerid][Inv_ItemTD][36], 1);
    PlayerTextDrawColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][36], -1);
    PlayerTextDrawSetShadow(playerid, PlayerInvUI[playerid][Inv_ItemTD][36], 0);
    PlayerTextDrawSetOutline(playerid, PlayerInvUI[playerid][Inv_ItemTD][36], 0);
    PlayerTextDrawBackgroundColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][36], 255);
    PlayerTextDrawFont(playerid, PlayerInvUI[playerid][Inv_ItemTD][36], 4);
    PlayerTextDrawSetProportional(playerid, PlayerInvUI[playerid][Inv_ItemTD][36], 1);
    PlayerTextDrawSetSelectable(playerid, PlayerInvUI[playerid][Inv_ItemTD][36], 1);

    PlayerInvUI[playerid][Inv_ItemTD][37] = CreatePlayerTextDraw(playerid, 455.000, 226.000, "");
    PlayerTextDrawTextSize(playerid, PlayerInvUI[playerid][Inv_ItemTD][37], 28.000, 38.000);
    PlayerTextDrawAlignment(playerid, PlayerInvUI[playerid][Inv_ItemTD][37], 1);
    PlayerTextDrawColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][37], -1);
    PlayerTextDrawSetShadow(playerid, PlayerInvUI[playerid][Inv_ItemTD][37], 0);
    PlayerTextDrawSetOutline(playerid, PlayerInvUI[playerid][Inv_ItemTD][37], 0);
    PlayerTextDrawBackgroundColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][37], 255);
    PlayerTextDrawFont(playerid, PlayerInvUI[playerid][Inv_ItemTD][37], 4);
    PlayerTextDrawSetProportional(playerid, PlayerInvUI[playerid][Inv_ItemTD][37], 1);
    PlayerTextDrawSetSelectable(playerid, PlayerInvUI[playerid][Inv_ItemTD][37], 1);

    PlayerInvUI[playerid][Inv_ItemTD][38] = CreatePlayerTextDraw(playerid, 489.000, 226.000, "");
    PlayerTextDrawTextSize(playerid, PlayerInvUI[playerid][Inv_ItemTD][38], 28.000, 38.000);
    PlayerTextDrawAlignment(playerid, PlayerInvUI[playerid][Inv_ItemTD][38], 1);
    PlayerTextDrawColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][38], -1);
    PlayerTextDrawSetShadow(playerid, PlayerInvUI[playerid][Inv_ItemTD][38], 0);
    PlayerTextDrawSetOutline(playerid, PlayerInvUI[playerid][Inv_ItemTD][38], 0);
    PlayerTextDrawBackgroundColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][38], 255);
    PlayerTextDrawFont(playerid, PlayerInvUI[playerid][Inv_ItemTD][38], 4);
    PlayerTextDrawSetProportional(playerid, PlayerInvUI[playerid][Inv_ItemTD][38], 1);
    PlayerTextDrawSetSelectable(playerid, PlayerInvUI[playerid][Inv_ItemTD][38], 1);

    PlayerInvUI[playerid][Inv_ItemTD][39] = CreatePlayerTextDraw(playerid, 524.000, 226.000, "");
    PlayerTextDrawTextSize(playerid, PlayerInvUI[playerid][Inv_ItemTD][39], 28.000, 38.000);
    PlayerTextDrawAlignment(playerid, PlayerInvUI[playerid][Inv_ItemTD][39], 1);
    PlayerTextDrawColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][39], -1);
    PlayerTextDrawSetShadow(playerid, PlayerInvUI[playerid][Inv_ItemTD][39], 0);
    PlayerTextDrawSetOutline(playerid, PlayerInvUI[playerid][Inv_ItemTD][39], 0);
    PlayerTextDrawBackgroundColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][39], 255);
    PlayerTextDrawFont(playerid, PlayerInvUI[playerid][Inv_ItemTD][39], 4);
    PlayerTextDrawSetProportional(playerid, PlayerInvUI[playerid][Inv_ItemTD][39], 1);
    PlayerTextDrawSetSelectable(playerid, PlayerInvUI[playerid][Inv_ItemTD][39], 1);

    PlayerInvUI[playerid][Inv_ItemTD][40] = CreatePlayerTextDraw(playerid, 388.000, 274.000, "");
    PlayerTextDrawTextSize(playerid, PlayerInvUI[playerid][Inv_ItemTD][40], 28.000, 38.000);
    PlayerTextDrawAlignment(playerid, PlayerInvUI[playerid][Inv_ItemTD][40], 1);
    PlayerTextDrawColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][40], -1);
    PlayerTextDrawSetShadow(playerid, PlayerInvUI[playerid][Inv_ItemTD][40], 0);
    PlayerTextDrawSetOutline(playerid, PlayerInvUI[playerid][Inv_ItemTD][40], 0);
    PlayerTextDrawBackgroundColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][40], 255);
    PlayerTextDrawFont(playerid, PlayerInvUI[playerid][Inv_ItemTD][40], 4);
    PlayerTextDrawSetProportional(playerid, PlayerInvUI[playerid][Inv_ItemTD][40], 1);
    PlayerTextDrawSetSelectable(playerid, PlayerInvUI[playerid][Inv_ItemTD][40], 1);

    PlayerInvUI[playerid][Inv_ItemTD][41] = CreatePlayerTextDraw(playerid, 421.000, 274.000, "");
    PlayerTextDrawTextSize(playerid, PlayerInvUI[playerid][Inv_ItemTD][41], 28.000, 38.000);
    PlayerTextDrawAlignment(playerid, PlayerInvUI[playerid][Inv_ItemTD][41], 1);
    PlayerTextDrawColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][41], -1);
    PlayerTextDrawSetShadow(playerid, PlayerInvUI[playerid][Inv_ItemTD][41], 0);
    PlayerTextDrawSetOutline(playerid, PlayerInvUI[playerid][Inv_ItemTD][41], 0);
    PlayerTextDrawBackgroundColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][41], 255);
    PlayerTextDrawFont(playerid, PlayerInvUI[playerid][Inv_ItemTD][41], 4);
    PlayerTextDrawSetProportional(playerid, PlayerInvUI[playerid][Inv_ItemTD][41], 1);
    PlayerTextDrawSetSelectable(playerid, PlayerInvUI[playerid][Inv_ItemTD][41], 1);

    PlayerInvUI[playerid][Inv_ItemTD][42] = CreatePlayerTextDraw(playerid, 455.000, 274.000, "");
    PlayerTextDrawTextSize(playerid, PlayerInvUI[playerid][Inv_ItemTD][42], 28.000, 38.000);
    PlayerTextDrawAlignment(playerid, PlayerInvUI[playerid][Inv_ItemTD][42], 1);
    PlayerTextDrawColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][42], -1);
    PlayerTextDrawSetShadow(playerid, PlayerInvUI[playerid][Inv_ItemTD][42], 0);
    PlayerTextDrawSetOutline(playerid, PlayerInvUI[playerid][Inv_ItemTD][42], 0);
    PlayerTextDrawBackgroundColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][42], 255);
    PlayerTextDrawFont(playerid, PlayerInvUI[playerid][Inv_ItemTD][42], 4);
    PlayerTextDrawSetProportional(playerid, PlayerInvUI[playerid][Inv_ItemTD][42], 1);
    PlayerTextDrawSetSelectable(playerid, PlayerInvUI[playerid][Inv_ItemTD][42], 1);

    PlayerInvUI[playerid][Inv_ItemTD][43] = CreatePlayerTextDraw(playerid, 489.000, 274.000, "");
    PlayerTextDrawTextSize(playerid, PlayerInvUI[playerid][Inv_ItemTD][43], 28.000, 38.000);
    PlayerTextDrawAlignment(playerid, PlayerInvUI[playerid][Inv_ItemTD][43], 1);
    PlayerTextDrawColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][43], -1);
    PlayerTextDrawSetShadow(playerid, PlayerInvUI[playerid][Inv_ItemTD][43], 0);
    PlayerTextDrawSetOutline(playerid, PlayerInvUI[playerid][Inv_ItemTD][43], 0);
    PlayerTextDrawBackgroundColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][43], 255);
    PlayerTextDrawFont(playerid, PlayerInvUI[playerid][Inv_ItemTD][43], 4);
    PlayerTextDrawSetProportional(playerid, PlayerInvUI[playerid][Inv_ItemTD][43], 1);
    PlayerTextDrawSetSelectable(playerid, PlayerInvUI[playerid][Inv_ItemTD][43], 1);

    PlayerInvUI[playerid][Inv_ItemTD][44] = CreatePlayerTextDraw(playerid, 524.000, 274.000, "");
    PlayerTextDrawTextSize(playerid, PlayerInvUI[playerid][Inv_ItemTD][44], 28.000, 38.000);
    PlayerTextDrawAlignment(playerid, PlayerInvUI[playerid][Inv_ItemTD][44], 1);
    PlayerTextDrawColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][44], -1);
    PlayerTextDrawSetShadow(playerid, PlayerInvUI[playerid][Inv_ItemTD][44], 0);
    PlayerTextDrawSetOutline(playerid, PlayerInvUI[playerid][Inv_ItemTD][44], 0);
    PlayerTextDrawBackgroundColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][44], 255);
    PlayerTextDrawFont(playerid, PlayerInvUI[playerid][Inv_ItemTD][44], 4);
    PlayerTextDrawSetProportional(playerid, PlayerInvUI[playerid][Inv_ItemTD][44], 1);
    PlayerTextDrawSetSelectable(playerid, PlayerInvUI[playerid][Inv_ItemTD][44], 1);

    PlayerInvUI[playerid][Inv_ItemTD][45] = CreatePlayerTextDraw(playerid, 388.000, 325.000, "");
    PlayerTextDrawTextSize(playerid, PlayerInvUI[playerid][Inv_ItemTD][45], 28.000, 38.000);
    PlayerTextDrawAlignment(playerid, PlayerInvUI[playerid][Inv_ItemTD][45], 1);
    PlayerTextDrawColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][45], -1);
    PlayerTextDrawSetShadow(playerid, PlayerInvUI[playerid][Inv_ItemTD][45], 0);
    PlayerTextDrawSetOutline(playerid, PlayerInvUI[playerid][Inv_ItemTD][45], 0);
    PlayerTextDrawBackgroundColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][45], 255);
    PlayerTextDrawFont(playerid, PlayerInvUI[playerid][Inv_ItemTD][45], 4);
    PlayerTextDrawSetProportional(playerid, PlayerInvUI[playerid][Inv_ItemTD][45], 1);
    PlayerTextDrawSetSelectable(playerid, PlayerInvUI[playerid][Inv_ItemTD][45], 1);

    PlayerInvUI[playerid][Inv_ItemTD][46] = CreatePlayerTextDraw(playerid, 421.000, 325.000, "");
    PlayerTextDrawTextSize(playerid, PlayerInvUI[playerid][Inv_ItemTD][46], 28.000, 38.000);
    PlayerTextDrawAlignment(playerid, PlayerInvUI[playerid][Inv_ItemTD][46], 1);
    PlayerTextDrawColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][46], -1);
    PlayerTextDrawSetShadow(playerid, PlayerInvUI[playerid][Inv_ItemTD][46], 0);
    PlayerTextDrawSetOutline(playerid, PlayerInvUI[playerid][Inv_ItemTD][46], 0);
    PlayerTextDrawBackgroundColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][46], 255);
    PlayerTextDrawFont(playerid, PlayerInvUI[playerid][Inv_ItemTD][46], 4);
    PlayerTextDrawSetProportional(playerid, PlayerInvUI[playerid][Inv_ItemTD][46], 1);
    PlayerTextDrawSetSelectable(playerid, PlayerInvUI[playerid][Inv_ItemTD][46], 1);

    PlayerInvUI[playerid][Inv_ItemTD][47] = CreatePlayerTextDraw(playerid, 455.000, 325.000, "");
    PlayerTextDrawTextSize(playerid, PlayerInvUI[playerid][Inv_ItemTD][47], 28.000, 38.000);
    PlayerTextDrawAlignment(playerid, PlayerInvUI[playerid][Inv_ItemTD][47], 1);
    PlayerTextDrawColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][47], -1);
    PlayerTextDrawSetShadow(playerid, PlayerInvUI[playerid][Inv_ItemTD][47], 0);
    PlayerTextDrawSetOutline(playerid, PlayerInvUI[playerid][Inv_ItemTD][47], 0);
    PlayerTextDrawBackgroundColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][47], 255);
    PlayerTextDrawFont(playerid, PlayerInvUI[playerid][Inv_ItemTD][47], 4);
    PlayerTextDrawSetProportional(playerid, PlayerInvUI[playerid][Inv_ItemTD][47], 1);
    PlayerTextDrawSetSelectable(playerid, PlayerInvUI[playerid][Inv_ItemTD][47], 1);

    PlayerInvUI[playerid][Inv_ItemTD][48] = CreatePlayerTextDraw(playerid, 489.000, 325.000, "");
    PlayerTextDrawTextSize(playerid, PlayerInvUI[playerid][Inv_ItemTD][48], 28.000, 38.000);
    PlayerTextDrawAlignment(playerid, PlayerInvUI[playerid][Inv_ItemTD][48], 1);
    PlayerTextDrawColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][48], -1);
    PlayerTextDrawSetShadow(playerid, PlayerInvUI[playerid][Inv_ItemTD][48], 0);
    PlayerTextDrawSetOutline(playerid, PlayerInvUI[playerid][Inv_ItemTD][48], 0);
    PlayerTextDrawBackgroundColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][48], 255);
    PlayerTextDrawFont(playerid, PlayerInvUI[playerid][Inv_ItemTD][48], 4);
    PlayerTextDrawSetProportional(playerid, PlayerInvUI[playerid][Inv_ItemTD][48], 1);
    PlayerTextDrawSetSelectable(playerid, PlayerInvUI[playerid][Inv_ItemTD][48], 1);

    PlayerInvUI[playerid][Inv_ItemTD][49] = CreatePlayerTextDraw(playerid, 524.000, 325.000, "");
    PlayerTextDrawTextSize(playerid, PlayerInvUI[playerid][Inv_ItemTD][49], 28.000, 38.000);
    PlayerTextDrawAlignment(playerid, PlayerInvUI[playerid][Inv_ItemTD][49], 1);
    PlayerTextDrawColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][49], -1);
    PlayerTextDrawSetShadow(playerid, PlayerInvUI[playerid][Inv_ItemTD][49], 0);
    PlayerTextDrawSetOutline(playerid, PlayerInvUI[playerid][Inv_ItemTD][49], 0);
    PlayerTextDrawBackgroundColour(playerid, PlayerInvUI[playerid][Inv_ItemTD][49], 255);
    PlayerTextDrawFont(playerid, PlayerInvUI[playerid][Inv_ItemTD][49], 4);
    PlayerTextDrawSetProportional(playerid, PlayerInvUI[playerid][Inv_ItemTD][49], 1);
    PlayerTextDrawSetSelectable(playerid, PlayerInvUI[playerid][Inv_ItemTD][49], 1);
    return 1;
}
hook OnPlayerConnect(playerid)
{
    CreateMainInv(playerid);
    CreateItemInvUI(playerid);
    return 1;
}

