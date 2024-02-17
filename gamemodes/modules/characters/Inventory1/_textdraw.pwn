#include <YSI_Coding\y_hooks>
hook OnPlayerConnect(playerid) {
	ItemBackground[playerid][0] = CreatePlayerTextDraw(playerid, -1.000, -2.000, "_");
	PlayerTextDrawLetterSize(playerid, ItemBackground[playerid][0], 0.300, 52.798);
	PlayerTextDrawAlignment(playerid, ItemBackground[playerid][0], 1);
	PlayerTextDrawColor(playerid, ItemBackground[playerid][0], -1);
	PlayerTextDrawUseBox(playerid, ItemBackground[playerid][0], 1);
	PlayerTextDrawBoxColor(playerid, ItemBackground[playerid][0], 100);
	PlayerTextDrawSetShadow(playerid, ItemBackground[playerid][0], 1);
	PlayerTextDrawSetOutline(playerid, ItemBackground[playerid][0], 1);
	PlayerTextDrawBackgroundColor(playerid, ItemBackground[playerid][0], 150);
	PlayerTextDrawFont(playerid, ItemBackground[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, ItemBackground[playerid][0], 1);

	ItemBackground[playerid][1] = CreatePlayerTextDraw(playerid, 97.000, 123.000, "mdl-2007:bg_item");
	PlayerTextDrawTextSize(playerid, ItemBackground[playerid][1], 33.000, 42.000);
	PlayerTextDrawAlignment(playerid, ItemBackground[playerid][1], 1);
	PlayerTextDrawColor(playerid, ItemBackground[playerid][1], -1);
	PlayerTextDrawSetShadow(playerid, ItemBackground[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, ItemBackground[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, ItemBackground[playerid][1], 255);
	PlayerTextDrawFont(playerid, ItemBackground[playerid][1], 4);
	PlayerTextDrawSetProportional(playerid, ItemBackground[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, ItemBackground[playerid][1], 1);

	ItemBackground[playerid][2] = CreatePlayerTextDraw(playerid, 131.000, 123.000, "mdl-2007:bg_item");
	PlayerTextDrawTextSize(playerid, ItemBackground[playerid][2], 33.000, 42.000);
	PlayerTextDrawAlignment(playerid, ItemBackground[playerid][2], 1);
	PlayerTextDrawColor(playerid, ItemBackground[playerid][2], -1);
	PlayerTextDrawSetShadow(playerid, ItemBackground[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, ItemBackground[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, ItemBackground[playerid][2], 255);
	PlayerTextDrawFont(playerid, ItemBackground[playerid][2], 4);
	PlayerTextDrawSetProportional(playerid, ItemBackground[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, ItemBackground[playerid][2], 1);

	ItemBackground[playerid][3] = CreatePlayerTextDraw(playerid, 165.000, 123.000, "mdl-2007:bg_item");
	PlayerTextDrawTextSize(playerid, ItemBackground[playerid][3], 33.000, 42.000);
	PlayerTextDrawAlignment(playerid, ItemBackground[playerid][3], 1);
	PlayerTextDrawColor(playerid, ItemBackground[playerid][3], -1);
	PlayerTextDrawSetShadow(playerid, ItemBackground[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, ItemBackground[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, ItemBackground[playerid][3], 255);
	PlayerTextDrawFont(playerid, ItemBackground[playerid][3], 4);
	PlayerTextDrawSetProportional(playerid, ItemBackground[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, ItemBackground[playerid][3], 1);

	ItemBackground[playerid][4] = CreatePlayerTextDraw(playerid, 199.000, 123.000, "mdl-2007:bg_item");
	PlayerTextDrawTextSize(playerid, ItemBackground[playerid][4], 33.000, 42.000);
	PlayerTextDrawAlignment(playerid, ItemBackground[playerid][4], 1);
	PlayerTextDrawColor(playerid, ItemBackground[playerid][4], -1);
	PlayerTextDrawSetShadow(playerid, ItemBackground[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, ItemBackground[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, ItemBackground[playerid][4], 255);
	PlayerTextDrawFont(playerid, ItemBackground[playerid][4], 4);
	PlayerTextDrawSetProportional(playerid, ItemBackground[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, ItemBackground[playerid][4], 1);

	ItemBackground[playerid][5] = CreatePlayerTextDraw(playerid, 233.000, 123.000, "mdl-2007:bg_item");
	PlayerTextDrawTextSize(playerid, ItemBackground[playerid][5], 33.000, 42.000);
	PlayerTextDrawAlignment(playerid, ItemBackground[playerid][5], 1);
	PlayerTextDrawColor(playerid, ItemBackground[playerid][5], -1);
	PlayerTextDrawSetShadow(playerid, ItemBackground[playerid][5], 0);
	PlayerTextDrawSetOutline(playerid, ItemBackground[playerid][5], 0);
	PlayerTextDrawBackgroundColor(playerid, ItemBackground[playerid][5], 255);
	PlayerTextDrawFont(playerid, ItemBackground[playerid][5], 4);
	PlayerTextDrawSetProportional(playerid, ItemBackground[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, ItemBackground[playerid][5], 1);

	ItemBackground[playerid][6] = CreatePlayerTextDraw(playerid, 97.000, 166.000, "mdl-2007:bg_item");
	PlayerTextDrawTextSize(playerid, ItemBackground[playerid][6], 33.000, 42.000);
	PlayerTextDrawAlignment(playerid, ItemBackground[playerid][6], 1);
	PlayerTextDrawColor(playerid, ItemBackground[playerid][6], -1);
	PlayerTextDrawSetShadow(playerid, ItemBackground[playerid][6], 0);
	PlayerTextDrawSetOutline(playerid, ItemBackground[playerid][6], 0);
	PlayerTextDrawBackgroundColor(playerid, ItemBackground[playerid][6], 255);
	PlayerTextDrawFont(playerid, ItemBackground[playerid][6], 4);
	PlayerTextDrawSetProportional(playerid, ItemBackground[playerid][6], 1);
	PlayerTextDrawSetSelectable(playerid, ItemBackground[playerid][6], 1);

	ItemBackground[playerid][7] = CreatePlayerTextDraw(playerid, 131.000, 166.000, "mdl-2007:bg_item");
	PlayerTextDrawTextSize(playerid, ItemBackground[playerid][7], 33.000, 42.000);
	PlayerTextDrawAlignment(playerid, ItemBackground[playerid][7], 1);
	PlayerTextDrawColor(playerid, ItemBackground[playerid][7], -1);
	PlayerTextDrawSetShadow(playerid, ItemBackground[playerid][7], 0);
	PlayerTextDrawSetOutline(playerid, ItemBackground[playerid][7], 0);
	PlayerTextDrawBackgroundColor(playerid, ItemBackground[playerid][7], 255);
	PlayerTextDrawFont(playerid, ItemBackground[playerid][7], 4);
	PlayerTextDrawSetProportional(playerid, ItemBackground[playerid][7], 1);
	PlayerTextDrawSetSelectable(playerid, ItemBackground[playerid][7], 1);

	ItemBackground[playerid][8] = CreatePlayerTextDraw(playerid, 165.000, 166.000, "mdl-2007:bg_item");
	PlayerTextDrawTextSize(playerid, ItemBackground[playerid][8], 33.000, 42.000);
	PlayerTextDrawAlignment(playerid, ItemBackground[playerid][8], 1);
	PlayerTextDrawColor(playerid, ItemBackground[playerid][8], -1);
	PlayerTextDrawSetShadow(playerid, ItemBackground[playerid][8], 0);
	PlayerTextDrawSetOutline(playerid, ItemBackground[playerid][8], 0);
	PlayerTextDrawBackgroundColor(playerid, ItemBackground[playerid][8], 255);
	PlayerTextDrawFont(playerid, ItemBackground[playerid][8], 4);
	PlayerTextDrawSetProportional(playerid, ItemBackground[playerid][8], 1);
	PlayerTextDrawSetSelectable(playerid, ItemBackground[playerid][8], 1);

	ItemBackground[playerid][9] = CreatePlayerTextDraw(playerid, 199.000, 166.000, "mdl-2007:bg_item");
	PlayerTextDrawTextSize(playerid, ItemBackground[playerid][9], 33.000, 42.000);
	PlayerTextDrawAlignment(playerid, ItemBackground[playerid][9], 1);
	PlayerTextDrawColor(playerid, ItemBackground[playerid][9], -1);
	PlayerTextDrawSetShadow(playerid, ItemBackground[playerid][9], 0);
	PlayerTextDrawSetOutline(playerid, ItemBackground[playerid][9], 0);
	PlayerTextDrawBackgroundColor(playerid, ItemBackground[playerid][9], 255);
	PlayerTextDrawFont(playerid, ItemBackground[playerid][9], 4);
	PlayerTextDrawSetProportional(playerid, ItemBackground[playerid][9], 1);
	PlayerTextDrawSetSelectable(playerid, ItemBackground[playerid][9], 1);

	ItemBackground[playerid][10] = CreatePlayerTextDraw(playerid, 233.000, 166.000, "mdl-2007:bg_item");
	PlayerTextDrawTextSize(playerid, ItemBackground[playerid][10], 33.000, 42.000);
	PlayerTextDrawAlignment(playerid, ItemBackground[playerid][10], 1);
	PlayerTextDrawColor(playerid, ItemBackground[playerid][10], -1);
	PlayerTextDrawSetShadow(playerid, ItemBackground[playerid][10], 0);
	PlayerTextDrawSetOutline(playerid, ItemBackground[playerid][10], 0);
	PlayerTextDrawBackgroundColor(playerid, ItemBackground[playerid][10], 255);
	PlayerTextDrawFont(playerid, ItemBackground[playerid][10], 4);
	PlayerTextDrawSetProportional(playerid, ItemBackground[playerid][10], 1);
	PlayerTextDrawSetSelectable(playerid, ItemBackground[playerid][10], 1);

	ItemBackground[playerid][11] = CreatePlayerTextDraw(playerid, 97.000, 210.000, "mdl-2007:bg_item");
	PlayerTextDrawTextSize(playerid, ItemBackground[playerid][11], 33.000, 42.000);
	PlayerTextDrawAlignment(playerid, ItemBackground[playerid][11], 1);
	PlayerTextDrawColor(playerid, ItemBackground[playerid][11], -1);
	PlayerTextDrawSetShadow(playerid, ItemBackground[playerid][11], 0);
	PlayerTextDrawSetOutline(playerid, ItemBackground[playerid][11], 0);
	PlayerTextDrawBackgroundColor(playerid, ItemBackground[playerid][11], 255);
	PlayerTextDrawFont(playerid, ItemBackground[playerid][11], 4);
	PlayerTextDrawSetProportional(playerid, ItemBackground[playerid][11], 1);
	PlayerTextDrawSetSelectable(playerid, ItemBackground[playerid][11], 1);

	ItemBackground[playerid][12] = CreatePlayerTextDraw(playerid, 131.000, 210.000, "mdl-2007:bg_item");
	PlayerTextDrawTextSize(playerid, ItemBackground[playerid][12], 33.000, 42.000);
	PlayerTextDrawAlignment(playerid, ItemBackground[playerid][12], 1);
	PlayerTextDrawColor(playerid, ItemBackground[playerid][12], -1);
	PlayerTextDrawSetShadow(playerid, ItemBackground[playerid][12], 0);
	PlayerTextDrawSetOutline(playerid, ItemBackground[playerid][12], 0);
	PlayerTextDrawBackgroundColor(playerid, ItemBackground[playerid][12], 255);
	PlayerTextDrawFont(playerid, ItemBackground[playerid][12], 4);
	PlayerTextDrawSetProportional(playerid, ItemBackground[playerid][12], 1);
	PlayerTextDrawSetSelectable(playerid, ItemBackground[playerid][12], 1);

	ItemBackground[playerid][13] = CreatePlayerTextDraw(playerid, 165.000, 210.000, "mdl-2007:bg_item");
	PlayerTextDrawTextSize(playerid, ItemBackground[playerid][13], 33.000, 42.000);
	PlayerTextDrawAlignment(playerid, ItemBackground[playerid][13], 1);
	PlayerTextDrawColor(playerid, ItemBackground[playerid][13], -1);
	PlayerTextDrawSetShadow(playerid, ItemBackground[playerid][13], 0);
	PlayerTextDrawSetOutline(playerid, ItemBackground[playerid][13], 0);
	PlayerTextDrawBackgroundColor(playerid, ItemBackground[playerid][13], 255);
	PlayerTextDrawFont(playerid, ItemBackground[playerid][13], 4);
	PlayerTextDrawSetProportional(playerid, ItemBackground[playerid][13], 1);
	PlayerTextDrawSetSelectable(playerid, ItemBackground[playerid][13], 1);

	ItemBackground[playerid][14] = CreatePlayerTextDraw(playerid, 199.000, 210.000, "mdl-2007:bg_item");
	PlayerTextDrawTextSize(playerid, ItemBackground[playerid][14], 33.000, 42.000);
	PlayerTextDrawAlignment(playerid, ItemBackground[playerid][14], 1);
	PlayerTextDrawColor(playerid, ItemBackground[playerid][14], -1);
	PlayerTextDrawSetShadow(playerid, ItemBackground[playerid][14], 0);
	PlayerTextDrawSetOutline(playerid, ItemBackground[playerid][14], 0);
	PlayerTextDrawBackgroundColor(playerid, ItemBackground[playerid][14], 255);
	PlayerTextDrawFont(playerid, ItemBackground[playerid][14], 4);
	PlayerTextDrawSetProportional(playerid, ItemBackground[playerid][14], 1);
	PlayerTextDrawSetSelectable(playerid, ItemBackground[playerid][14], 1);

	ItemBackground[playerid][15] = CreatePlayerTextDraw(playerid, 233.000, 210.000, "mdl-2007:bg_item");
	PlayerTextDrawTextSize(playerid, ItemBackground[playerid][15], 33.000, 42.000);
	PlayerTextDrawAlignment(playerid, ItemBackground[playerid][15], 1);
	PlayerTextDrawColor(playerid, ItemBackground[playerid][15], -1);
	PlayerTextDrawSetShadow(playerid, ItemBackground[playerid][15], 0);
	PlayerTextDrawSetOutline(playerid, ItemBackground[playerid][15], 0);
	PlayerTextDrawBackgroundColor(playerid, ItemBackground[playerid][15], 255);
	PlayerTextDrawFont(playerid, ItemBackground[playerid][15], 4);
	PlayerTextDrawSetProportional(playerid, ItemBackground[playerid][15], 1);
	PlayerTextDrawSetSelectable(playerid, ItemBackground[playerid][15], 1);

	ItemBackground[playerid][16] = CreatePlayerTextDraw(playerid, 97.000, 254.000, "mdl-2007:bg_item");
	PlayerTextDrawTextSize(playerid, ItemBackground[playerid][16], 33.000, 42.000);
	PlayerTextDrawAlignment(playerid, ItemBackground[playerid][16], 1);
	PlayerTextDrawColor(playerid, ItemBackground[playerid][16], -1);
	PlayerTextDrawSetShadow(playerid, ItemBackground[playerid][16], 0);
	PlayerTextDrawSetOutline(playerid, ItemBackground[playerid][16], 0);
	PlayerTextDrawBackgroundColor(playerid, ItemBackground[playerid][16], 255);
	PlayerTextDrawFont(playerid, ItemBackground[playerid][16], 4);
	PlayerTextDrawSetProportional(playerid, ItemBackground[playerid][16], 1);
	PlayerTextDrawSetSelectable(playerid, ItemBackground[playerid][16], 1);

	ItemBackground[playerid][17] = CreatePlayerTextDraw(playerid, 131.000, 254.000, "mdl-2007:bg_item");
	PlayerTextDrawTextSize(playerid, ItemBackground[playerid][17], 33.000, 42.000);
	PlayerTextDrawAlignment(playerid, ItemBackground[playerid][17], 1);
	PlayerTextDrawColor(playerid, ItemBackground[playerid][17], -1);
	PlayerTextDrawSetShadow(playerid, ItemBackground[playerid][17], 0);
	PlayerTextDrawSetOutline(playerid, ItemBackground[playerid][17], 0);
	PlayerTextDrawBackgroundColor(playerid, ItemBackground[playerid][17], 255);
	PlayerTextDrawFont(playerid, ItemBackground[playerid][17], 4);
	PlayerTextDrawSetProportional(playerid, ItemBackground[playerid][17], 1);
	PlayerTextDrawSetSelectable(playerid, ItemBackground[playerid][17], 1);

	ItemBackground[playerid][18] = CreatePlayerTextDraw(playerid, 165.000, 254.000, "mdl-2007:bg_item");
	PlayerTextDrawTextSize(playerid, ItemBackground[playerid][18], 33.000, 42.000);
	PlayerTextDrawAlignment(playerid, ItemBackground[playerid][18], 1);
	PlayerTextDrawColor(playerid, ItemBackground[playerid][18], -1);
	PlayerTextDrawSetShadow(playerid, ItemBackground[playerid][18], 0);
	PlayerTextDrawSetOutline(playerid, ItemBackground[playerid][18], 0);
	PlayerTextDrawBackgroundColor(playerid, ItemBackground[playerid][18], 255);
	PlayerTextDrawFont(playerid, ItemBackground[playerid][18], 4);
	PlayerTextDrawSetProportional(playerid, ItemBackground[playerid][18], 1);
	PlayerTextDrawSetSelectable(playerid, ItemBackground[playerid][18], 1);

	ItemBackground[playerid][19] = CreatePlayerTextDraw(playerid, 199.000, 254.000, "mdl-2007:bg_item");
	PlayerTextDrawTextSize(playerid, ItemBackground[playerid][19], 33.000, 42.000);
	PlayerTextDrawAlignment(playerid, ItemBackground[playerid][19], 1);
	PlayerTextDrawColor(playerid, ItemBackground[playerid][19], -1);
	PlayerTextDrawSetShadow(playerid, ItemBackground[playerid][19], 0);
	PlayerTextDrawSetOutline(playerid, ItemBackground[playerid][19], 0);
	PlayerTextDrawBackgroundColor(playerid, ItemBackground[playerid][19], 255);
	PlayerTextDrawFont(playerid, ItemBackground[playerid][19], 4);
	PlayerTextDrawSetProportional(playerid, ItemBackground[playerid][19], 1);
	PlayerTextDrawSetSelectable(playerid, ItemBackground[playerid][19], 1);

	ItemBackground[playerid][20] = CreatePlayerTextDraw(playerid, 233.000, 254.000, "mdl-2007:bg_item");
	PlayerTextDrawTextSize(playerid, ItemBackground[playerid][20], 33.000, 42.000);
	PlayerTextDrawAlignment(playerid, ItemBackground[playerid][20], 1);
	PlayerTextDrawColor(playerid, ItemBackground[playerid][20], -1);
	PlayerTextDrawSetShadow(playerid, ItemBackground[playerid][20], 0);
	PlayerTextDrawSetOutline(playerid, ItemBackground[playerid][20], 0);
	PlayerTextDrawBackgroundColor(playerid, ItemBackground[playerid][20], 255);
	PlayerTextDrawFont(playerid, ItemBackground[playerid][20], 4);
	PlayerTextDrawSetProportional(playerid, ItemBackground[playerid][20], 1);
	PlayerTextDrawSetSelectable(playerid, ItemBackground[playerid][20], 1);

	ItemBackground[playerid][21] = CreatePlayerTextDraw(playerid, 346.000, 123.000, "mdl-2007:bg_item");
	PlayerTextDrawTextSize(playerid, ItemBackground[playerid][21], 33.000, 42.000);
	PlayerTextDrawAlignment(playerid, ItemBackground[playerid][21], 1);
	PlayerTextDrawColor(playerid, ItemBackground[playerid][21], -1);
	PlayerTextDrawSetShadow(playerid, ItemBackground[playerid][21], 0);
	PlayerTextDrawSetOutline(playerid, ItemBackground[playerid][21], 0);
	PlayerTextDrawBackgroundColor(playerid, ItemBackground[playerid][21], 255);
	PlayerTextDrawFont(playerid, ItemBackground[playerid][21], 4);
	PlayerTextDrawSetProportional(playerid, ItemBackground[playerid][21], 1);
	PlayerTextDrawSetSelectable(playerid, ItemBackground[playerid][21], 1);

	ItemBackground[playerid][22] = CreatePlayerTextDraw(playerid, 380.000, 123.000, "mdl-2007:bg_item");
	PlayerTextDrawTextSize(playerid, ItemBackground[playerid][22], 33.000, 42.000);
	PlayerTextDrawAlignment(playerid, ItemBackground[playerid][22], 1);
	PlayerTextDrawColor(playerid, ItemBackground[playerid][22], -1);
	PlayerTextDrawSetShadow(playerid, ItemBackground[playerid][22], 0);
	PlayerTextDrawSetOutline(playerid, ItemBackground[playerid][22], 0);
	PlayerTextDrawBackgroundColor(playerid, ItemBackground[playerid][22], 255);
	PlayerTextDrawFont(playerid, ItemBackground[playerid][22], 4);
	PlayerTextDrawSetProportional(playerid, ItemBackground[playerid][22], 1);
	PlayerTextDrawSetSelectable(playerid, ItemBackground[playerid][22], 1);

	ItemBackground[playerid][23] = CreatePlayerTextDraw(playerid, 414.000, 123.000, "mdl-2007:bg_item");
	PlayerTextDrawTextSize(playerid, ItemBackground[playerid][23], 33.000, 42.000);
	PlayerTextDrawAlignment(playerid, ItemBackground[playerid][23], 1);
	PlayerTextDrawColor(playerid, ItemBackground[playerid][23], -1);
	PlayerTextDrawSetShadow(playerid, ItemBackground[playerid][23], 0);
	PlayerTextDrawSetOutline(playerid, ItemBackground[playerid][23], 0);
	PlayerTextDrawBackgroundColor(playerid, ItemBackground[playerid][23], 255);
	PlayerTextDrawFont(playerid, ItemBackground[playerid][23], 4);
	PlayerTextDrawSetProportional(playerid, ItemBackground[playerid][23], 1);
	PlayerTextDrawSetSelectable(playerid, ItemBackground[playerid][23], 1);

	ItemBackground[playerid][24] = CreatePlayerTextDraw(playerid, 448.000, 123.000, "mdl-2007:bg_item");
	PlayerTextDrawTextSize(playerid, ItemBackground[playerid][24], 33.000, 42.000);
	PlayerTextDrawAlignment(playerid, ItemBackground[playerid][24], 1);
	PlayerTextDrawColor(playerid, ItemBackground[playerid][24], -1);
	PlayerTextDrawSetShadow(playerid, ItemBackground[playerid][24], 0);
	PlayerTextDrawSetOutline(playerid, ItemBackground[playerid][24], 0);
	PlayerTextDrawBackgroundColor(playerid, ItemBackground[playerid][24], 255);
	PlayerTextDrawFont(playerid, ItemBackground[playerid][24], 4);
	PlayerTextDrawSetProportional(playerid, ItemBackground[playerid][24], 1);
	PlayerTextDrawSetSelectable(playerid, ItemBackground[playerid][24], 1);

	ItemBackground[playerid][25] = CreatePlayerTextDraw(playerid, 482.000, 123.000, "mdl-2007:bg_item");
	PlayerTextDrawTextSize(playerid, ItemBackground[playerid][25], 33.000, 42.000);
	PlayerTextDrawAlignment(playerid, ItemBackground[playerid][25], 1);
	PlayerTextDrawColor(playerid, ItemBackground[playerid][25], -1);
	PlayerTextDrawSetShadow(playerid, ItemBackground[playerid][25], 0);
	PlayerTextDrawSetOutline(playerid, ItemBackground[playerid][25], 0);
	PlayerTextDrawBackgroundColor(playerid, ItemBackground[playerid][25], 255);
	PlayerTextDrawFont(playerid, ItemBackground[playerid][25], 4);
	PlayerTextDrawSetProportional(playerid, ItemBackground[playerid][25], 1);
	PlayerTextDrawSetSelectable(playerid, ItemBackground[playerid][25], 1);

	ItemBackground[playerid][26] = CreatePlayerTextDraw(playerid, 346.000, 166.000, "mdl-2007:bg_item");
	PlayerTextDrawTextSize(playerid, ItemBackground[playerid][26], 33.000, 42.000);
	PlayerTextDrawAlignment(playerid, ItemBackground[playerid][26], 1);
	PlayerTextDrawColor(playerid, ItemBackground[playerid][26], -1);
	PlayerTextDrawSetShadow(playerid, ItemBackground[playerid][26], 0);
	PlayerTextDrawSetOutline(playerid, ItemBackground[playerid][26], 0);
	PlayerTextDrawBackgroundColor(playerid, ItemBackground[playerid][26], 255);
	PlayerTextDrawFont(playerid, ItemBackground[playerid][26], 4);
	PlayerTextDrawSetProportional(playerid, ItemBackground[playerid][26], 1);
	PlayerTextDrawSetSelectable(playerid, ItemBackground[playerid][26], 1);

	ItemBackground[playerid][27] = CreatePlayerTextDraw(playerid, 380.000, 166.000, "mdl-2007:bg_item");
	PlayerTextDrawTextSize(playerid, ItemBackground[playerid][27], 33.000, 42.000);
	PlayerTextDrawAlignment(playerid, ItemBackground[playerid][27], 1);
	PlayerTextDrawColor(playerid, ItemBackground[playerid][27], -1);
	PlayerTextDrawSetShadow(playerid, ItemBackground[playerid][27], 0);
	PlayerTextDrawSetOutline(playerid, ItemBackground[playerid][27], 0);
	PlayerTextDrawBackgroundColor(playerid, ItemBackground[playerid][27], 255);
	PlayerTextDrawFont(playerid, ItemBackground[playerid][27], 4);
	PlayerTextDrawSetProportional(playerid, ItemBackground[playerid][27], 1);
	PlayerTextDrawSetSelectable(playerid, ItemBackground[playerid][27], 1);

	ItemBackground[playerid][28] = CreatePlayerTextDraw(playerid, 414.000, 166.000, "mdl-2007:bg_item");
	PlayerTextDrawTextSize(playerid, ItemBackground[playerid][28], 33.000, 42.000);
	PlayerTextDrawAlignment(playerid, ItemBackground[playerid][28], 1);
	PlayerTextDrawColor(playerid, ItemBackground[playerid][28], -1);
	PlayerTextDrawSetShadow(playerid, ItemBackground[playerid][28], 0);
	PlayerTextDrawSetOutline(playerid, ItemBackground[playerid][28], 0);
	PlayerTextDrawBackgroundColor(playerid, ItemBackground[playerid][28], 255);
	PlayerTextDrawFont(playerid, ItemBackground[playerid][28], 4);
	PlayerTextDrawSetProportional(playerid, ItemBackground[playerid][28], 1);
	PlayerTextDrawSetSelectable(playerid, ItemBackground[playerid][28], 1);

	ItemBackground[playerid][29] = CreatePlayerTextDraw(playerid, 448.000, 166.000, "mdl-2007:bg_item");
	PlayerTextDrawTextSize(playerid, ItemBackground[playerid][29], 33.000, 42.000);
	PlayerTextDrawAlignment(playerid, ItemBackground[playerid][29], 1);
	PlayerTextDrawColor(playerid, ItemBackground[playerid][29], -1);
	PlayerTextDrawSetShadow(playerid, ItemBackground[playerid][29], 0);
	PlayerTextDrawSetOutline(playerid, ItemBackground[playerid][29], 0);
	PlayerTextDrawBackgroundColor(playerid, ItemBackground[playerid][29], 255);
	PlayerTextDrawFont(playerid, ItemBackground[playerid][29], 4);
	PlayerTextDrawSetProportional(playerid, ItemBackground[playerid][29], 1);
	PlayerTextDrawSetSelectable(playerid, ItemBackground[playerid][29], 1);

	ItemBackground[playerid][30] = CreatePlayerTextDraw(playerid, 482.000, 166.000, "mdl-2007:bg_item");
	PlayerTextDrawTextSize(playerid, ItemBackground[playerid][30], 33.000, 42.000);
	PlayerTextDrawAlignment(playerid, ItemBackground[playerid][30], 1);
	PlayerTextDrawColor(playerid, ItemBackground[playerid][30], -1);
	PlayerTextDrawSetShadow(playerid, ItemBackground[playerid][30], 0);
	PlayerTextDrawSetOutline(playerid, ItemBackground[playerid][30], 0);
	PlayerTextDrawBackgroundColor(playerid, ItemBackground[playerid][30], 255);
	PlayerTextDrawFont(playerid, ItemBackground[playerid][30], 4);
	PlayerTextDrawSetProportional(playerid, ItemBackground[playerid][30], 1);
	PlayerTextDrawSetSelectable(playerid, ItemBackground[playerid][30], 1);

	ItemBackground[playerid][31] = CreatePlayerTextDraw(playerid, 346.000, 210.000, "mdl-2007:bg_item");
	PlayerTextDrawTextSize(playerid, ItemBackground[playerid][31], 33.000, 42.000);
	PlayerTextDrawAlignment(playerid, ItemBackground[playerid][31], 1);
	PlayerTextDrawColor(playerid, ItemBackground[playerid][31], -1);
	PlayerTextDrawSetShadow(playerid, ItemBackground[playerid][31], 0);
	PlayerTextDrawSetOutline(playerid, ItemBackground[playerid][31], 0);
	PlayerTextDrawBackgroundColor(playerid, ItemBackground[playerid][31], 255);
	PlayerTextDrawFont(playerid, ItemBackground[playerid][31], 4);
	PlayerTextDrawSetProportional(playerid, ItemBackground[playerid][31], 1);
	PlayerTextDrawSetSelectable(playerid, ItemBackground[playerid][31], 1);

	ItemBackground[playerid][32] = CreatePlayerTextDraw(playerid, 380.000, 210.000, "mdl-2007:bg_item");
	PlayerTextDrawTextSize(playerid, ItemBackground[playerid][32], 33.000, 42.000);
	PlayerTextDrawAlignment(playerid, ItemBackground[playerid][32], 1);
	PlayerTextDrawColor(playerid, ItemBackground[playerid][32], -1);
	PlayerTextDrawSetShadow(playerid, ItemBackground[playerid][32], 0);
	PlayerTextDrawSetOutline(playerid, ItemBackground[playerid][32], 0);
	PlayerTextDrawBackgroundColor(playerid, ItemBackground[playerid][32], 255);
	PlayerTextDrawFont(playerid, ItemBackground[playerid][32], 4);
	PlayerTextDrawSetProportional(playerid, ItemBackground[playerid][32], 1);
	PlayerTextDrawSetSelectable(playerid, ItemBackground[playerid][32], 1);

	ItemBackground[playerid][33] = CreatePlayerTextDraw(playerid, 414.000, 210.000, "mdl-2007:bg_item");
	PlayerTextDrawTextSize(playerid, ItemBackground[playerid][33], 33.000, 42.000);
	PlayerTextDrawAlignment(playerid, ItemBackground[playerid][33], 1);
	PlayerTextDrawColor(playerid, ItemBackground[playerid][33], -1);
	PlayerTextDrawSetShadow(playerid, ItemBackground[playerid][33], 0);
	PlayerTextDrawSetOutline(playerid, ItemBackground[playerid][33], 0);
	PlayerTextDrawBackgroundColor(playerid, ItemBackground[playerid][33], 255);
	PlayerTextDrawFont(playerid, ItemBackground[playerid][33], 4);
	PlayerTextDrawSetProportional(playerid, ItemBackground[playerid][33], 1);
	PlayerTextDrawSetSelectable(playerid, ItemBackground[playerid][33], 1);

	ItemBackground[playerid][34] = CreatePlayerTextDraw(playerid, 448.000, 210.000, "mdl-2007:bg_item");
	PlayerTextDrawTextSize(playerid, ItemBackground[playerid][34], 33.000, 42.000);
	PlayerTextDrawAlignment(playerid, ItemBackground[playerid][34], 1);
	PlayerTextDrawColor(playerid, ItemBackground[playerid][34], -1);
	PlayerTextDrawSetShadow(playerid, ItemBackground[playerid][34], 0);
	PlayerTextDrawSetOutline(playerid, ItemBackground[playerid][34], 0);
	PlayerTextDrawBackgroundColor(playerid, ItemBackground[playerid][34], 255);
	PlayerTextDrawFont(playerid, ItemBackground[playerid][34], 4);
	PlayerTextDrawSetProportional(playerid, ItemBackground[playerid][34], 1);
	PlayerTextDrawSetSelectable(playerid, ItemBackground[playerid][34], 1);

	ItemBackground[playerid][35] = CreatePlayerTextDraw(playerid, 482.000, 210.000, "mdl-2007:bg_item");
	PlayerTextDrawTextSize(playerid, ItemBackground[playerid][35], 33.000, 42.000);
	PlayerTextDrawAlignment(playerid, ItemBackground[playerid][35], 1);
	PlayerTextDrawColor(playerid, ItemBackground[playerid][35], -1);
	PlayerTextDrawSetShadow(playerid, ItemBackground[playerid][35], 0);
	PlayerTextDrawSetOutline(playerid, ItemBackground[playerid][35], 0);
	PlayerTextDrawBackgroundColor(playerid, ItemBackground[playerid][35], 255);
	PlayerTextDrawFont(playerid, ItemBackground[playerid][35], 4);
	PlayerTextDrawSetProportional(playerid, ItemBackground[playerid][35], 1);
	PlayerTextDrawSetSelectable(playerid, ItemBackground[playerid][35], 1);

	ItemBackground[playerid][36] = CreatePlayerTextDraw(playerid, 346.000, 254.000, "mdl-2007:bg_item");
	PlayerTextDrawTextSize(playerid, ItemBackground[playerid][36], 33.000, 42.000);
	PlayerTextDrawAlignment(playerid, ItemBackground[playerid][36], 1);
	PlayerTextDrawColor(playerid, ItemBackground[playerid][36], -1);
	PlayerTextDrawSetShadow(playerid, ItemBackground[playerid][36], 0);
	PlayerTextDrawSetOutline(playerid, ItemBackground[playerid][36], 0);
	PlayerTextDrawBackgroundColor(playerid, ItemBackground[playerid][36], 255);
	PlayerTextDrawFont(playerid, ItemBackground[playerid][36], 4);
	PlayerTextDrawSetProportional(playerid, ItemBackground[playerid][36], 1);
	PlayerTextDrawSetSelectable(playerid, ItemBackground[playerid][36], 1);

	ItemBackground[playerid][37] = CreatePlayerTextDraw(playerid, 380.000, 254.000, "mdl-2007:bg_item");
	PlayerTextDrawTextSize(playerid, ItemBackground[playerid][37], 33.000, 42.000);
	PlayerTextDrawAlignment(playerid, ItemBackground[playerid][37], 1);
	PlayerTextDrawColor(playerid, ItemBackground[playerid][37], -1);
	PlayerTextDrawSetShadow(playerid, ItemBackground[playerid][37], 0);
	PlayerTextDrawSetOutline(playerid, ItemBackground[playerid][37], 0);
	PlayerTextDrawBackgroundColor(playerid, ItemBackground[playerid][37], 255);
	PlayerTextDrawFont(playerid, ItemBackground[playerid][37], 4);
	PlayerTextDrawSetProportional(playerid, ItemBackground[playerid][37], 1);
	PlayerTextDrawSetSelectable(playerid, ItemBackground[playerid][37], 1);

	ItemBackground[playerid][38] = CreatePlayerTextDraw(playerid, 414.000, 254.000, "mdl-2007:bg_item");
	PlayerTextDrawTextSize(playerid, ItemBackground[playerid][38], 33.000, 42.000);
	PlayerTextDrawAlignment(playerid, ItemBackground[playerid][38], 1);
	PlayerTextDrawColor(playerid, ItemBackground[playerid][38], -1);
	PlayerTextDrawSetShadow(playerid, ItemBackground[playerid][38], 0);
	PlayerTextDrawSetOutline(playerid, ItemBackground[playerid][38], 0);
	PlayerTextDrawBackgroundColor(playerid, ItemBackground[playerid][38], 255);
	PlayerTextDrawFont(playerid, ItemBackground[playerid][38], 4);
	PlayerTextDrawSetProportional(playerid, ItemBackground[playerid][38], 1);
	PlayerTextDrawSetSelectable(playerid, ItemBackground[playerid][38], 1);

	ItemBackground[playerid][39] = CreatePlayerTextDraw(playerid, 448.000, 254.000, "mdl-2007:bg_item");
	PlayerTextDrawTextSize(playerid, ItemBackground[playerid][39], 33.000, 42.000);
	PlayerTextDrawAlignment(playerid, ItemBackground[playerid][39], 1);
	PlayerTextDrawColor(playerid, ItemBackground[playerid][39], -1);
	PlayerTextDrawSetShadow(playerid, ItemBackground[playerid][39], 0);
	PlayerTextDrawSetOutline(playerid, ItemBackground[playerid][39], 0);
	PlayerTextDrawBackgroundColor(playerid, ItemBackground[playerid][39], 255);
	PlayerTextDrawFont(playerid, ItemBackground[playerid][39], 4);
	PlayerTextDrawSetProportional(playerid, ItemBackground[playerid][39], 1);
	PlayerTextDrawSetSelectable(playerid, ItemBackground[playerid][39], 1);

	ItemBackground[playerid][40] = CreatePlayerTextDraw(playerid, 482.000, 254.000, "mdl-2007:bg_item");
	PlayerTextDrawTextSize(playerid, ItemBackground[playerid][40], 33.000, 42.000);
	PlayerTextDrawAlignment(playerid, ItemBackground[playerid][40], 1);
	PlayerTextDrawColor(playerid, ItemBackground[playerid][40], -1);
	PlayerTextDrawSetShadow(playerid, ItemBackground[playerid][40], 0);
	PlayerTextDrawSetOutline(playerid, ItemBackground[playerid][40], 0);
	PlayerTextDrawBackgroundColor(playerid, ItemBackground[playerid][40], 255);
	PlayerTextDrawFont(playerid, ItemBackground[playerid][40], 4);
	PlayerTextDrawSetProportional(playerid, ItemBackground[playerid][40], 1);
	PlayerTextDrawSetSelectable(playerid, ItemBackground[playerid][40], 1);

	btnInv[playerid][0] = CreatePlayerTextDraw(playerid, 279.000, 158.000, "mdl-2007:btnUse");
	PlayerTextDrawTextSize(playerid, btnInv[playerid][0], 56.000, 16.000);
	PlayerTextDrawAlignment(playerid, btnInv[playerid][0], 1);
	PlayerTextDrawColor(playerid, btnInv[playerid][0], -1);
	PlayerTextDrawSetShadow(playerid, btnInv[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, btnInv[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, btnInv[playerid][0], 255);
	PlayerTextDrawFont(playerid, btnInv[playerid][0], 4);
	PlayerTextDrawSetProportional(playerid, btnInv[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, btnInv[playerid][0], 1);

	btnInv[playerid][1] = CreatePlayerTextDraw(playerid, 279.000, 177.000, "mdl-2007:btnDrop");
	PlayerTextDrawTextSize(playerid, btnInv[playerid][1], 56.000, 16.000);
	PlayerTextDrawAlignment(playerid, btnInv[playerid][1], 1);
	PlayerTextDrawColor(playerid, btnInv[playerid][1], -1);
	PlayerTextDrawSetShadow(playerid, btnInv[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, btnInv[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, btnInv[playerid][1], 255);
	PlayerTextDrawFont(playerid, btnInv[playerid][1], 4);
	PlayerTextDrawSetProportional(playerid, btnInv[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, btnInv[playerid][1], 1);

	btnInv[playerid][2] = CreatePlayerTextDraw(playerid, 279.000, 197.000, "mdl-2007:btnTrade");
	PlayerTextDrawTextSize(playerid, btnInv[playerid][2], 56.000, 16.000);
	PlayerTextDrawAlignment(playerid, btnInv[playerid][2], 1);
	PlayerTextDrawColor(playerid, btnInv[playerid][2], -1);
	PlayerTextDrawSetShadow(playerid, btnInv[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, btnInv[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, btnInv[playerid][2], 255);
	PlayerTextDrawFont(playerid, btnInv[playerid][2], 4);
	PlayerTextDrawSetProportional(playerid, btnInv[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, btnInv[playerid][2], 1);

	btnInv[playerid][3] = CreatePlayerTextDraw(playerid, 279.000, 216.000, "mdl-2007:btnInfo");
	PlayerTextDrawTextSize(playerid, btnInv[playerid][3], 56.000, 16.000);
	PlayerTextDrawAlignment(playerid, btnInv[playerid][3], 1);
	PlayerTextDrawColor(playerid, btnInv[playerid][3], -1);
	PlayerTextDrawSetShadow(playerid, btnInv[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, btnInv[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, btnInv[playerid][3], 255);
	PlayerTextDrawFont(playerid, btnInv[playerid][3], 4);
	PlayerTextDrawSetProportional(playerid, btnInv[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, btnInv[playerid][3], 1);

	WeightInv[playerid][0] = CreatePlayerTextDraw(playerid, 98.000, 111.000, "Can Nang: ~y~1000/1000");
	PlayerTextDrawLetterSize(playerid, WeightInv[playerid][0], 0.230, 0.899);
	PlayerTextDrawTextSize(playerid, WeightInv[playerid][0], 265.000, 0.000);
	PlayerTextDrawAlignment(playerid, WeightInv[playerid][0], 1);
	PlayerTextDrawColor(playerid, WeightInv[playerid][0], -1);
	PlayerTextDrawSetShadow(playerid, WeightInv[playerid][0], 1);
	PlayerTextDrawSetOutline(playerid, WeightInv[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, WeightInv[playerid][0], 150);
	PlayerTextDrawFont(playerid, WeightInv[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, WeightInv[playerid][0], 1);

	WeightInv[playerid][1] = CreatePlayerTextDraw(playerid, 347.000, 111.000, "Can Nang: ~y~1000/1000");
	PlayerTextDrawLetterSize(playerid, WeightInv[playerid][1], 0.230, 0.899);
	PlayerTextDrawTextSize(playerid, WeightInv[playerid][1], 514.000, 0.000);
	PlayerTextDrawAlignment(playerid, WeightInv[playerid][1], 1);
	PlayerTextDrawColor(playerid, WeightInv[playerid][1], -1);
	PlayerTextDrawSetShadow(playerid, WeightInv[playerid][1], 1);
	PlayerTextDrawSetOutline(playerid, WeightInv[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, WeightInv[playerid][1], 150);
	PlayerTextDrawFont(playerid, WeightInv[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, WeightInv[playerid][1], 1);

	btnPage[playerid][0] = CreatePlayerTextDraw(playerid, 97.000, 298.000, "mdl-2007:btnPre");
	PlayerTextDrawTextSize(playerid, btnPage[playerid][0], 47.000, 12.000);
	PlayerTextDrawAlignment(playerid, btnPage[playerid][0], 1);
	PlayerTextDrawColor(playerid, btnPage[playerid][0], -1);
	PlayerTextDrawSetShadow(playerid, btnPage[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, btnPage[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, btnPage[playerid][0], 255);
	PlayerTextDrawFont(playerid, btnPage[playerid][0], 4);
	PlayerTextDrawSetProportional(playerid, btnPage[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, btnPage[playerid][0], 1);

	btnPage[playerid][1] = CreatePlayerTextDraw(playerid, 219.000, 298.000, "mdl-2007:btnNext");
	PlayerTextDrawTextSize(playerid, btnPage[playerid][1], 47.000, 12.000);
	PlayerTextDrawAlignment(playerid, btnPage[playerid][1], 1);
	PlayerTextDrawColor(playerid, btnPage[playerid][1], -1);
	PlayerTextDrawSetShadow(playerid, btnPage[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, btnPage[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, btnPage[playerid][1], 255);
	PlayerTextDrawFont(playerid, btnPage[playerid][1], 4);
	PlayerTextDrawSetProportional(playerid, btnPage[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, btnPage[playerid][1], 1);

	btnPage[playerid][2] = CreatePlayerTextDraw(playerid, 182.000, 300.000, "1000/1000");
	PlayerTextDrawLetterSize(playerid, btnPage[playerid][2], 0.230, 0.899);
	PlayerTextDrawTextSize(playerid, btnPage[playerid][2], 12.000, 72.000);
	PlayerTextDrawAlignment(playerid, btnPage[playerid][2], 2);
	PlayerTextDrawColor(playerid, btnPage[playerid][2], -1);
	PlayerTextDrawSetShadow(playerid, btnPage[playerid][2], 1);
	PlayerTextDrawSetOutline(playerid, btnPage[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, btnPage[playerid][2], 150);
	PlayerTextDrawFont(playerid, btnPage[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, btnPage[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, btnPage[playerid][2], 1);

	btnPage[playerid][3] = CreatePlayerTextDraw(playerid, 346.000, 298.000, "mdl-2007:btnPre");
	PlayerTextDrawTextSize(playerid, btnPage[playerid][3], 47.000, 12.000);
	PlayerTextDrawAlignment(playerid, btnPage[playerid][3], 1);
	PlayerTextDrawColor(playerid, btnPage[playerid][3], -1);
	PlayerTextDrawSetShadow(playerid, btnPage[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, btnPage[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, btnPage[playerid][3], 255);
	PlayerTextDrawFont(playerid, btnPage[playerid][3], 4);
	PlayerTextDrawSetProportional(playerid, btnPage[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, btnPage[playerid][3], 1);

	btnPage[playerid][4] = CreatePlayerTextDraw(playerid, 468.000, 298.000, "mdl-2007:btnNext");
	PlayerTextDrawTextSize(playerid, btnPage[playerid][4], 47.000, 12.000);
	PlayerTextDrawAlignment(playerid, btnPage[playerid][4], 1);
	PlayerTextDrawColor(playerid, btnPage[playerid][4], -1);
	PlayerTextDrawSetShadow(playerid, btnPage[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, btnPage[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, btnPage[playerid][4], 255);
	PlayerTextDrawFont(playerid, btnPage[playerid][4], 4);
	PlayerTextDrawSetProportional(playerid, btnPage[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, btnPage[playerid][4], 1);

	btnPage[playerid][5] = CreatePlayerTextDraw(playerid, 431.000, 300.000, "1000/1000");
	PlayerTextDrawLetterSize(playerid, btnPage[playerid][5], 0.230, 0.899);
	PlayerTextDrawTextSize(playerid, btnPage[playerid][5], 12.000, 72.000);
	PlayerTextDrawAlignment(playerid, btnPage[playerid][5], 2);
	PlayerTextDrawColor(playerid, btnPage[playerid][5], -1);
	PlayerTextDrawSetShadow(playerid, btnPage[playerid][5], 1);
	PlayerTextDrawSetOutline(playerid, btnPage[playerid][5], 0);
	PlayerTextDrawBackgroundColor(playerid, btnPage[playerid][5], 150);
	PlayerTextDrawFont(playerid, btnPage[playerid][5], 1);
	PlayerTextDrawSetProportional(playerid, btnPage[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, btnPage[playerid][5], 1);
	return 1;
}

stock ShowPlayerIndexInv(playerid, page = 0)
{
	for(new i = 1 ; i < 21 ; i++)
	{
		PlayerTextDrawHide(playerid, ItemBackground[playerid][i]);
	}
	for(new j = 0; j < MAX_INV_PAGES; j++)
	{
		for(new i = 0; i < MAX_INV_ITEM; i++)
		{
			PlayerTextDrawColor(playerid, ItemInv[playerid][j][i], -1);
			PlayerTextDrawHide(playerid, ItemInv[playerid][j][i]);
			PlayerTextDrawHide(playerid, ItemName[playerid][j][i]);
		}
	}
	
	// if(PlayerInvInfo[playerid][PlayerPage[playerid]][pCountItem] == 0) PlayerTextDrawShow(playerid,ItemBackground[playerid][1]);

	PlayerInvInfo[playerid][PlayerPage[playerid]][pSelectItemID] = 0;

	for(new i = 21; i < 41; i++)
	{
		PlayerTextDrawShow(playerid,ItemBackground[playerid][i]);
	}
	new szPage[1280];
	format(szPage, sizeof(szPage), "%d/%d",PlayerPage[playerid], GetPlayerPage(playerid)+1);

	PlayerTextDrawSetString(playerid, btnPage[playerid][2], szPage);

	for(new i = 0; i < 6; i++)
	{

		PlayerTextDrawShow(playerid, btnPage[playerid][i]);
	}
	SelectTextDraw(playerid, -1);
	SetPVarInt(playerid, #open_inv, 1);
	for(new j = 0; j < MAX_INV_ITEM; j++)
	{
		if(PlayerInvItem[playerid][PlayerPage[playerid]][pInvItemID][j] > 0 && PlayerInvItem[playerid][PlayerPage[playerid]][pInvAmount][j] > 0)
		{
			CreateInvItem(playerid, PlayerInvItem[playerid][PlayerPage[playerid]][pInvItemID][j], PlayerPage[playerid], PlayerInvItem[playerid][PlayerPage[playerid]][pInvAmount][j]);
			// printf("Inv ID: %d | Page: %d | Inv Amount: %d ",PlayerInvItem[playerid][PlayerPage[playerid]][pInvItemID][j], PlayerPage[playerid], PlayerInvItem[playerid][PlayerPage[playerid]][pInvAmount][j]);
		}
	}
	GetPlayerItem(playerid, PlayerPage[playerid]);
	printf("Page: %d",PlayerPage[playerid]);
	return 1;
}

stock HidePlayerIndexInv(playerid)
{
	for(new i = 0; i < MAX_INV_PAGES; i++)
	{
		PlayerInvInfo[playerid][i][pCountItem] = 0;
	}
	CountAllItem[playerid] = 0;
	pCurrentSelect[playerid] = 0;

	for(new i = 0 ; i < 41 ; i++)
	{
		PlayerTextDrawHide(playerid, ItemBackground[playerid][i]);
	}
	CancelSelectTextDraw(playerid);
	SetPVarInt(playerid, #open_inv, 0);
	new pPagez = PlayerPage[playerid];

	for(new i = 0; i < DAFAULT_INV_PAGE; i++)
	{
		PlayerTextDrawHide(playerid, ItemInv[playerid][pPagez][i]);
	}
	for(new i = 0; i < 4; i++)
	{
		PlayerTextDrawHide(playerid, btnInv[playerid][i]);
	}
	for(new i = 0; i < 6; i++)
	{
		PlayerTextDrawHide(playerid, btnPage[playerid][i]);
	}
	for(new j = 0; j < MAX_INV_PAGES; j++)
	{
		for(new i = 0; i < MAX_INV_ITEM; i++)
		{
			PlayerTextDrawColor(playerid, ItemInv[playerid][j][i], -1);
			PlayerTextDrawHide(playerid, ItemInv[playerid][j][i]);
			PlayerTextDrawHide(playerid, ItemName[playerid][j][i]);
			PlayerTextDrawDestroy(playerid, ItemInv[playerid][j][i]);
			PlayerTextDrawDestroy(playerid, ItemName[playerid][j][i]);
		}
	}
	for(new i = 0; i < MAX_INV_TRADE; i++)
	{
		PlayerTextDrawHide(playerid, TradeItem[playerid][i]);
		PlayerTextDrawHide(playerid, TradeName[playerid][i]);
	}
	return 1;
}
stock ReloadInv(playerid, page = 0)
{
	// HidePlayerIndexInv(playerid);
	ShowPlayerIndexInv(playerid);
	return 1;
}