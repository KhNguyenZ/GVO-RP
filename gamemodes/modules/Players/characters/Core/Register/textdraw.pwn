#include <YSI_Coding\y_hooks>

hook OnPlayerConnect(playerid)
{
	RegisterPTD[playerid][0] = CreatePlayerTextDraw(playerid, 30.000, 100.000, "mdl-2018:bg");
	PlayerTextDrawTextSize(playerid, RegisterPTD[playerid][0], 199.000, 310.000);
	PlayerTextDrawAlignment(playerid, RegisterPTD[playerid][0], 1);
	PlayerTextDrawColor(playerid, RegisterPTD[playerid][0], -1);
	PlayerTextDrawSetShadow(playerid, RegisterPTD[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, RegisterPTD[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, RegisterPTD[playerid][0], 255);
	PlayerTextDrawFont(playerid, RegisterPTD[playerid][0], 4);
	PlayerTextDrawSetProportional(playerid, RegisterPTD[playerid][0], 1);

	RegisterPTD[playerid][1] = CreatePlayerTextDraw(playerid, 41.000, 141.000, "mdl-2018:but");
	PlayerTextDrawTextSize(playerid, RegisterPTD[playerid][1], 176.000, 21.000);
	PlayerTextDrawAlignment(playerid, RegisterPTD[playerid][1], 1);
	PlayerTextDrawColor(playerid, RegisterPTD[playerid][1], -1);
	PlayerTextDrawSetShadow(playerid, RegisterPTD[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, RegisterPTD[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, RegisterPTD[playerid][1], 255);
	PlayerTextDrawFont(playerid, RegisterPTD[playerid][1], 4);
	PlayerTextDrawSetProportional(playerid, RegisterPTD[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, RegisterPTD[playerid][1], 1);

	RegisterPTD[playerid][2] = CreatePlayerTextDraw(playerid, 41.000, 178.000, "mdl-2018:but");
	PlayerTextDrawTextSize(playerid, RegisterPTD[playerid][2], 176.000, 21.000);
	PlayerTextDrawAlignment(playerid, RegisterPTD[playerid][2], 1);
	PlayerTextDrawColor(playerid, RegisterPTD[playerid][2], -1);
	PlayerTextDrawSetShadow(playerid, RegisterPTD[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, RegisterPTD[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, RegisterPTD[playerid][2], 255);
	PlayerTextDrawFont(playerid, RegisterPTD[playerid][2], 4);
	PlayerTextDrawSetProportional(playerid, RegisterPTD[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, RegisterPTD[playerid][2], 1);

	RegisterPTD[playerid][3] = CreatePlayerTextDraw(playerid, 41.000, 214.000, "mdl-2018:but");
	PlayerTextDrawTextSize(playerid, RegisterPTD[playerid][3], 176.000, 21.000);
	PlayerTextDrawAlignment(playerid, RegisterPTD[playerid][3], 1);
	PlayerTextDrawColor(playerid, RegisterPTD[playerid][3], -1);
	PlayerTextDrawSetShadow(playerid, RegisterPTD[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, RegisterPTD[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, RegisterPTD[playerid][3], 255);
	PlayerTextDrawFont(playerid, RegisterPTD[playerid][3], 4);
	PlayerTextDrawSetProportional(playerid, RegisterPTD[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, RegisterPTD[playerid][3], 1);

	RegisterPTD[playerid][4] = CreatePlayerTextDraw(playerid, 41.000, 251.000, "mdl-2018:but");
	PlayerTextDrawTextSize(playerid, RegisterPTD[playerid][4], 176.000, 21.000);
	PlayerTextDrawAlignment(playerid, RegisterPTD[playerid][4], 1);
	PlayerTextDrawColor(playerid, RegisterPTD[playerid][4], -1);
	PlayerTextDrawSetShadow(playerid, RegisterPTD[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, RegisterPTD[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, RegisterPTD[playerid][4], 255);
	PlayerTextDrawFont(playerid, RegisterPTD[playerid][4], 4);
	PlayerTextDrawSetProportional(playerid, RegisterPTD[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, RegisterPTD[playerid][4], 1);

	RegisterPTD[playerid][5] = CreatePlayerTextDraw(playerid, 41.000, 287.000, "mdl-2018:but");
	PlayerTextDrawTextSize(playerid, RegisterPTD[playerid][5], 176.000, 21.000);
	PlayerTextDrawAlignment(playerid, RegisterPTD[playerid][5], 1);
	PlayerTextDrawColor(playerid, RegisterPTD[playerid][5], -1);
	PlayerTextDrawSetShadow(playerid, RegisterPTD[playerid][5], 0);
	PlayerTextDrawSetOutline(playerid, RegisterPTD[playerid][5], 0);
	PlayerTextDrawBackgroundColor(playerid, RegisterPTD[playerid][5], 255);
	PlayerTextDrawFont(playerid, RegisterPTD[playerid][5], 4);
	PlayerTextDrawSetProportional(playerid, RegisterPTD[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, RegisterPTD[playerid][5], 1);

	RegisterPTD[playerid][6] = CreatePlayerTextDraw(playerid, 41.000, 324.000, "mdl-2018:but");
	PlayerTextDrawTextSize(playerid, RegisterPTD[playerid][6], 176.000, 21.000);
	PlayerTextDrawAlignment(playerid, RegisterPTD[playerid][6], 1);
	PlayerTextDrawColor(playerid, RegisterPTD[playerid][6], -1);
	PlayerTextDrawSetShadow(playerid, RegisterPTD[playerid][6], 0);
	PlayerTextDrawSetOutline(playerid, RegisterPTD[playerid][6], 0);
	PlayerTextDrawBackgroundColor(playerid, RegisterPTD[playerid][6], 255);
	PlayerTextDrawFont(playerid, RegisterPTD[playerid][6], 4);
	PlayerTextDrawSetProportional(playerid, RegisterPTD[playerid][6], 1);
	PlayerTextDrawSetSelectable(playerid, RegisterPTD[playerid][6], 1);

	RegisterPTD[playerid][7] = CreatePlayerTextDraw(playerid, 91.000, 373.000, "mdl-2018:choose");
	PlayerTextDrawTextSize(playerid, RegisterPTD[playerid][7], 68.000, 21.000);
	PlayerTextDrawAlignment(playerid, RegisterPTD[playerid][7], 1);
	PlayerTextDrawColor(playerid, RegisterPTD[playerid][7], -1);
	PlayerTextDrawSetShadow(playerid, RegisterPTD[playerid][7], 0);
	PlayerTextDrawSetOutline(playerid, RegisterPTD[playerid][7], 0);
	PlayerTextDrawBackgroundColor(playerid, RegisterPTD[playerid][7], 255);
	PlayerTextDrawFont(playerid, RegisterPTD[playerid][7], 4);
	PlayerTextDrawSetProportional(playerid, RegisterPTD[playerid][7], 1);
	PlayerTextDrawSetSelectable(playerid, RegisterPTD[playerid][7], 1);

	RegisterPTD[playerid][8] = CreatePlayerTextDraw(playerid, 287.000, 305.000, "mdl-2018:skin");
	PlayerTextDrawTextSize(playerid, RegisterPTD[playerid][8], 209.000, 104.000);
	PlayerTextDrawAlignment(playerid, RegisterPTD[playerid][8], 1);
	PlayerTextDrawColor(playerid, RegisterPTD[playerid][8], -1);
	PlayerTextDrawSetShadow(playerid, RegisterPTD[playerid][8], 0);
	PlayerTextDrawSetOutline(playerid, RegisterPTD[playerid][8], 0);
	PlayerTextDrawBackgroundColor(playerid, RegisterPTD[playerid][8], 255);
	PlayerTextDrawFont(playerid, RegisterPTD[playerid][8], 4);
	PlayerTextDrawSetProportional(playerid, RegisterPTD[playerid][8], 1);

	RegisterPTD[playerid][9] = CreatePlayerTextDraw(playerid, 360.000, 373.000, "mdl-2018:choose");
	PlayerTextDrawTextSize(playerid, RegisterPTD[playerid][9], 68.000, 21.000);
	PlayerTextDrawAlignment(playerid, RegisterPTD[playerid][9], 1);
	PlayerTextDrawColor(playerid, RegisterPTD[playerid][9], -1);
	PlayerTextDrawSetShadow(playerid, RegisterPTD[playerid][9], 0);
	PlayerTextDrawSetOutline(playerid, RegisterPTD[playerid][9], 0);
	PlayerTextDrawBackgroundColor(playerid, RegisterPTD[playerid][9], 255);
	PlayerTextDrawFont(playerid, RegisterPTD[playerid][9], 4);
	PlayerTextDrawSetProportional(playerid, RegisterPTD[playerid][9], 1);
	PlayerTextDrawSetSelectable(playerid, RegisterPTD[playerid][9], 1);

	RegisterPTD[playerid][10] = CreatePlayerTextDraw(playerid, 322.000, 344.000, "LD_BEAT:left");
	PlayerTextDrawTextSize(playerid, RegisterPTD[playerid][10], 21.000, 18.000);
	PlayerTextDrawAlignment(playerid, RegisterPTD[playerid][10], 1);
	PlayerTextDrawColor(playerid, RegisterPTD[playerid][10], -1);
	PlayerTextDrawSetShadow(playerid, RegisterPTD[playerid][10], 0);
	PlayerTextDrawSetOutline(playerid, RegisterPTD[playerid][10], 0);
	PlayerTextDrawBackgroundColor(playerid, RegisterPTD[playerid][10], 255);
	PlayerTextDrawFont(playerid, RegisterPTD[playerid][10], 4);
	PlayerTextDrawSetProportional(playerid, RegisterPTD[playerid][10], 1);
	PlayerTextDrawSetSelectable(playerid, RegisterPTD[playerid][10], 1);

	RegisterPTD[playerid][11] = CreatePlayerTextDraw(playerid, 441.000, 344.000, "LD_BEAT:right");
	PlayerTextDrawTextSize(playerid, RegisterPTD[playerid][11], 21.000, 18.000);
	PlayerTextDrawAlignment(playerid, RegisterPTD[playerid][11], 1);
	PlayerTextDrawColor(playerid, RegisterPTD[playerid][11], -1);
	PlayerTextDrawSetShadow(playerid, RegisterPTD[playerid][11], 0);
	PlayerTextDrawSetOutline(playerid, RegisterPTD[playerid][11], 0);
	PlayerTextDrawBackgroundColor(playerid, RegisterPTD[playerid][11], 255);
	PlayerTextDrawFont(playerid, RegisterPTD[playerid][11], 4);
	PlayerTextDrawSetProportional(playerid, RegisterPTD[playerid][11], 1);
	PlayerTextDrawSetSelectable(playerid, RegisterPTD[playerid][11], 1);

	RegisterPTD[playerid][12] = CreatePlayerTextDraw(playerid, 287.000, 93.000, "_"); // skin
	PlayerTextDrawTextSize(playerid, RegisterPTD[playerid][12], 199.000, 199.000);
	PlayerTextDrawAlignment(playerid, RegisterPTD[playerid][12], 1);
	PlayerTextDrawColor(playerid, RegisterPTD[playerid][12], -1);
	PlayerTextDrawSetShadow(playerid, RegisterPTD[playerid][12], 0);
	PlayerTextDrawSetOutline(playerid, RegisterPTD[playerid][12], 0);
	PlayerTextDrawBackgroundColor(playerid, RegisterPTD[playerid][12], 0);
	PlayerTextDrawFont(playerid, RegisterPTD[playerid][12], 5);
	PlayerTextDrawSetProportional(playerid, RegisterPTD[playerid][12], 0);
	PlayerTextDrawSetPreviewModel(playerid, RegisterPTD[playerid][12], 2);
	PlayerTextDrawSetPreviewRot(playerid, RegisterPTD[playerid][12], 0.000, 0.000, 0.000, 1.000);
	PlayerTextDrawSetPreviewVehCol(playerid, RegisterPTD[playerid][12], 0, 0);

	RegisterPTD[playerid][13] = CreatePlayerTextDraw(playerid, 129.000, 145.000, "BIRTHDAY");
	PlayerTextDrawLetterSize(playerid, RegisterPTD[playerid][13], 0.300, 1.500);
	PlayerTextDrawTextSize(playerid, RegisterPTD[playerid][13], 0.000, 171.000);
	PlayerTextDrawAlignment(playerid, RegisterPTD[playerid][13], 2);
	PlayerTextDrawColor(playerid, RegisterPTD[playerid][13], -1);
	PlayerTextDrawSetShadow(playerid, RegisterPTD[playerid][13], 1);
	PlayerTextDrawSetOutline(playerid, RegisterPTD[playerid][13], 0);
	PlayerTextDrawBackgroundColor(playerid, RegisterPTD[playerid][13], 150);
	PlayerTextDrawFont(playerid, RegisterPTD[playerid][13], 1);
	PlayerTextDrawSetProportional(playerid, RegisterPTD[playerid][13], 1);

	RegisterPTD[playerid][14] = CreatePlayerTextDraw(playerid, 129.000, 181.000, "GIOI TINH");
	PlayerTextDrawLetterSize(playerid, RegisterPTD[playerid][14], 0.300, 1.500);
	PlayerTextDrawTextSize(playerid, RegisterPTD[playerid][14], 0.000, 171.000);
	PlayerTextDrawAlignment(playerid, RegisterPTD[playerid][14], 2);
	PlayerTextDrawColor(playerid, RegisterPTD[playerid][14], -1);
	PlayerTextDrawSetShadow(playerid, RegisterPTD[playerid][14], 1);
	PlayerTextDrawSetOutline(playerid, RegisterPTD[playerid][14], 0);
	PlayerTextDrawBackgroundColor(playerid, RegisterPTD[playerid][14], 150);
	PlayerTextDrawFont(playerid, RegisterPTD[playerid][14], 1);
	PlayerTextDrawSetProportional(playerid, RegisterPTD[playerid][14], 1);

	RegisterPTD[playerid][15] = CreatePlayerTextDraw(playerid, 129.000, 217.000, "QUOC TICH");
	PlayerTextDrawLetterSize(playerid, RegisterPTD[playerid][15], 0.300, 1.500);
	PlayerTextDrawTextSize(playerid, RegisterPTD[playerid][15], 0.000, 171.000);
	PlayerTextDrawAlignment(playerid, RegisterPTD[playerid][15], 2);
	PlayerTextDrawColor(playerid, RegisterPTD[playerid][15], -1);
	PlayerTextDrawSetShadow(playerid, RegisterPTD[playerid][15], 1);
	PlayerTextDrawSetOutline(playerid, RegisterPTD[playerid][15], 0);
	PlayerTextDrawBackgroundColor(playerid, RegisterPTD[playerid][15], 150);
	PlayerTextDrawFont(playerid, RegisterPTD[playerid][15], 1);
	PlayerTextDrawSetProportional(playerid, RegisterPTD[playerid][15], 1);

	RegisterPTD[playerid][16] = CreatePlayerTextDraw(playerid, 129.000, 254.000, "SKIN");
	PlayerTextDrawLetterSize(playerid, RegisterPTD[playerid][16], 0.300, 1.500);
	PlayerTextDrawTextSize(playerid, RegisterPTD[playerid][16], 0.000, 171.000);
	PlayerTextDrawAlignment(playerid, RegisterPTD[playerid][16], 2);
	PlayerTextDrawColor(playerid, RegisterPTD[playerid][16], -1);
	PlayerTextDrawSetShadow(playerid, RegisterPTD[playerid][16], 1);
	PlayerTextDrawSetOutline(playerid, RegisterPTD[playerid][16], 0);
	PlayerTextDrawBackgroundColor(playerid, RegisterPTD[playerid][16], 150);
	PlayerTextDrawFont(playerid, RegisterPTD[playerid][16], 1);
	PlayerTextDrawSetProportional(playerid, RegisterPTD[playerid][16], 1);

	RegisterPTD[playerid][17] = CreatePlayerTextDraw(playerid, 129.000, 290.000, "MO TA");
	PlayerTextDrawLetterSize(playerid, RegisterPTD[playerid][17], 0.300, 1.500);
	PlayerTextDrawTextSize(playerid, RegisterPTD[playerid][17], 0.000, 171.000);
	PlayerTextDrawAlignment(playerid, RegisterPTD[playerid][17], 2);
	PlayerTextDrawColor(playerid, RegisterPTD[playerid][17], -1);
	PlayerTextDrawSetShadow(playerid, RegisterPTD[playerid][17], 1);
	PlayerTextDrawSetOutline(playerid, RegisterPTD[playerid][17], 0);
	PlayerTextDrawBackgroundColor(playerid, RegisterPTD[playerid][17], 150);
	PlayerTextDrawFont(playerid, RegisterPTD[playerid][17], 1);
	PlayerTextDrawSetProportional(playerid, RegisterPTD[playerid][17], 1);

	RegisterPTD[playerid][18] = CreatePlayerTextDraw(playerid, 129.000, 327.000, "NGUOI GIOI THIEU");
	PlayerTextDrawLetterSize(playerid, RegisterPTD[playerid][18], 0.300, 1.500);
	PlayerTextDrawTextSize(playerid, RegisterPTD[playerid][18], 0.000, 171.000);
	PlayerTextDrawAlignment(playerid, RegisterPTD[playerid][18], 2);
	PlayerTextDrawColor(playerid, RegisterPTD[playerid][18], -1);
	PlayerTextDrawSetShadow(playerid, RegisterPTD[playerid][18], 1);
	PlayerTextDrawSetOutline(playerid, RegisterPTD[playerid][18], 0);
	PlayerTextDrawBackgroundColor(playerid, RegisterPTD[playerid][18], 150);
	PlayerTextDrawFont(playerid, RegisterPTD[playerid][18], 1);
	PlayerTextDrawSetProportional(playerid, RegisterPTD[playerid][18], 1);


	return 1;
}
