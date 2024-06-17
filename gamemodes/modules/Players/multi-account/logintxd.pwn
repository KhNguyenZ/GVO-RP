#include <YSI_Coding\y_hooks>

hook OnPlayerConnect(playerid)
{
	
	LoginPTD[playerid][0] = CreatePlayerTextDraw(playerid, 0.000, 0.000, "mdl-2002:bg");
	PlayerTextDrawTextSize(playerid, LoginPTD[playerid][0], 640.000, 452.000);
	PlayerTextDrawAlignment(playerid, LoginPTD[playerid][0], 1);
	PlayerTextDrawColor(playerid, LoginPTD[playerid][0], -1);
	PlayerTextDrawSetShadow(playerid, LoginPTD[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, LoginPTD[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, LoginPTD[playerid][0], 255);
	PlayerTextDrawFont(playerid, LoginPTD[playerid][0], 4);
	PlayerTextDrawSetProportional(playerid, LoginPTD[playerid][0], 1);

	LoginPTD[playerid][1] = CreatePlayerTextDraw(playerid, 245.000, 148.000, "mdl-2002:user");
	PlayerTextDrawTextSize(playerid, LoginPTD[playerid][1], 155.000, 42.000);
	PlayerTextDrawAlignment(playerid, LoginPTD[playerid][1], 1);
	PlayerTextDrawColor(playerid, LoginPTD[playerid][1], -1);
	PlayerTextDrawSetShadow(playerid, LoginPTD[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, LoginPTD[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, LoginPTD[playerid][1], 255);
	PlayerTextDrawFont(playerid, LoginPTD[playerid][1], 4);
	PlayerTextDrawSetProportional(playerid, LoginPTD[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, LoginPTD[playerid][1], 0);

	LoginPTD[playerid][2] = CreatePlayerTextDraw(playerid, 245.000, 199.000, "mdl-2002:pass");
	PlayerTextDrawTextSize(playerid, LoginPTD[playerid][2], 155.000, 42.000);
	PlayerTextDrawAlignment(playerid, LoginPTD[playerid][2], 1);
	PlayerTextDrawColor(playerid, LoginPTD[playerid][2], -1);
	PlayerTextDrawSetShadow(playerid, LoginPTD[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, LoginPTD[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, LoginPTD[playerid][2], 255);
	PlayerTextDrawFont(playerid, LoginPTD[playerid][2], 4);
	PlayerTextDrawSetProportional(playerid, LoginPTD[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, LoginPTD[playerid][2], 1);

	LoginPTD[playerid][3] = CreatePlayerTextDraw(playerid, 243.000, 250.000, "mdl-2002:mail");
	PlayerTextDrawTextSize(playerid, LoginPTD[playerid][3], 157.000, 42.000);
	PlayerTextDrawAlignment(playerid, LoginPTD[playerid][3], 1);
	PlayerTextDrawColor(playerid, LoginPTD[playerid][3], -1);
	PlayerTextDrawSetShadow(playerid, LoginPTD[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, LoginPTD[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, LoginPTD[playerid][3], 255);
	PlayerTextDrawFont(playerid, LoginPTD[playerid][3], 4);
	PlayerTextDrawSetProportional(playerid, LoginPTD[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, LoginPTD[playerid][3], 1);

	LoginPTD[playerid][4] = CreatePlayerTextDraw(playerid, 269.000, 393.000, "mdl-2002:play");
	PlayerTextDrawTextSize(playerid, LoginPTD[playerid][4], 94.000, 45.000);
	PlayerTextDrawAlignment(playerid, LoginPTD[playerid][4], 1);
	PlayerTextDrawColor(playerid, LoginPTD[playerid][4], -1);
	PlayerTextDrawSetShadow(playerid, LoginPTD[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, LoginPTD[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, LoginPTD[playerid][4], 255);
	PlayerTextDrawFont(playerid, LoginPTD[playerid][4], 4);
	PlayerTextDrawSetProportional(playerid, LoginPTD[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, LoginPTD[playerid][4], 1);

	LoginPTD[playerid][5] = CreatePlayerTextDraw(playerid, 271.000, 151.000, "Nhap ten cua ban");
	PlayerTextDrawLetterSize(playerid, LoginPTD[playerid][5], 0.239, 1.098);
	PlayerTextDrawAlignment(playerid, LoginPTD[playerid][5], 1);
	PlayerTextDrawColor(playerid, LoginPTD[playerid][5], -2139062017);
	PlayerTextDrawSetShadow(playerid, LoginPTD[playerid][5], 0);
	PlayerTextDrawSetOutline(playerid, LoginPTD[playerid][5], 0);
	PlayerTextDrawBackgroundColor(playerid, LoginPTD[playerid][5], 150);
	PlayerTextDrawFont(playerid, LoginPTD[playerid][5], 1);
	PlayerTextDrawSetProportional(playerid, LoginPTD[playerid][5], 1);

	LoginPTD[playerid][6] = CreatePlayerTextDraw(playerid, 271.000, 164.000, "User_Name");
	PlayerTextDrawLetterSize(playerid, LoginPTD[playerid][6], 0.300, 1.500);
	PlayerTextDrawAlignment(playerid, LoginPTD[playerid][6], 1);
	PlayerTextDrawColor(playerid, LoginPTD[playerid][6], -1);
	PlayerTextDrawSetShadow(playerid, LoginPTD[playerid][6], 0);
	PlayerTextDrawSetOutline(playerid, LoginPTD[playerid][6], 0);
	PlayerTextDrawBackgroundColor(playerid, LoginPTD[playerid][6], 150);
	PlayerTextDrawFont(playerid, LoginPTD[playerid][6], 1);
	PlayerTextDrawSetProportional(playerid, LoginPTD[playerid][6], 1);

	LoginPTD[playerid][7] = CreatePlayerTextDraw(playerid, 271.000, 201.000, "Nhap mat khau");
	PlayerTextDrawLetterSize(playerid, LoginPTD[playerid][7], 0.239, 1.098);
	PlayerTextDrawAlignment(playerid, LoginPTD[playerid][7], 1);
	PlayerTextDrawColor(playerid, LoginPTD[playerid][7], -2139062017);
	PlayerTextDrawSetShadow(playerid, LoginPTD[playerid][7], 0);
	PlayerTextDrawSetOutline(playerid, LoginPTD[playerid][7], 0);
	PlayerTextDrawBackgroundColor(playerid, LoginPTD[playerid][7], 150);
	PlayerTextDrawFont(playerid, LoginPTD[playerid][7], 1);
	PlayerTextDrawSetProportional(playerid, LoginPTD[playerid][7], 1);

	LoginPTD[playerid][8] = CreatePlayerTextDraw(playerid, 271.000, 214.000, "");
	PlayerTextDrawLetterSize(playerid, LoginPTD[playerid][8], 0.300, 1.500);
	PlayerTextDrawAlignment(playerid, LoginPTD[playerid][8], 1);
	PlayerTextDrawColor(playerid, LoginPTD[playerid][8], -1);
	PlayerTextDrawSetShadow(playerid, LoginPTD[playerid][8], 0);
	PlayerTextDrawSetOutline(playerid, LoginPTD[playerid][8], 0);
	PlayerTextDrawBackgroundColor(playerid, LoginPTD[playerid][8], 150);
	PlayerTextDrawFont(playerid, LoginPTD[playerid][8], 1);
	PlayerTextDrawSetProportional(playerid, LoginPTD[playerid][8], 1);

	LoginPTD[playerid][9] = CreatePlayerTextDraw(playerid, 271.000, 254.000, "Nhap G-Mail cua ban de xac minh tai khoan");
	PlayerTextDrawLetterSize(playerid, LoginPTD[playerid][9], 0.200, 1.098);
	PlayerTextDrawAlignment(playerid, LoginPTD[playerid][9], 1);
	PlayerTextDrawColor(playerid, LoginPTD[playerid][9], -2139062017);
	PlayerTextDrawSetShadow(playerid, LoginPTD[playerid][9], 0);
	PlayerTextDrawSetOutline(playerid, LoginPTD[playerid][9], 0);
	PlayerTextDrawBackgroundColor(playerid, LoginPTD[playerid][9], 150);
	PlayerTextDrawFont(playerid, LoginPTD[playerid][9], 1);
	PlayerTextDrawSetProportional(playerid, LoginPTD[playerid][9], 1);

	LoginPTD[playerid][10] = CreatePlayerTextDraw(playerid, 271.000, 266.000, "");
	PlayerTextDrawLetterSize(playerid, LoginPTD[playerid][10], 0.230, 1.500);
	PlayerTextDrawAlignment(playerid, LoginPTD[playerid][10], 1);
	PlayerTextDrawColor(playerid, LoginPTD[playerid][10], -1);
	PlayerTextDrawSetShadow(playerid, LoginPTD[playerid][10], 0);
	PlayerTextDrawSetOutline(playerid, LoginPTD[playerid][10], 0);
	PlayerTextDrawBackgroundColor(playerid, LoginPTD[playerid][10], 150);
	PlayerTextDrawFont(playerid, LoginPTD[playerid][10], 1);
	PlayerTextDrawSetProportional(playerid, LoginPTD[playerid][10], 1);

	LoginPTD[playerid][11] = CreatePlayerTextDraw(playerid, 260.000, 417.000, "discord.com/hehehehe");
	PlayerTextDrawLetterSize(playerid, LoginPTD[playerid][11], 0.300, 1.500);
	PlayerTextDrawAlignment(playerid, LoginPTD[playerid][11], 3);
	PlayerTextDrawColor(playerid, LoginPTD[playerid][11], -1);
	PlayerTextDrawSetShadow(playerid, LoginPTD[playerid][11], 0);
	PlayerTextDrawSetOutline(playerid, LoginPTD[playerid][11], 0);
	PlayerTextDrawBackgroundColor(playerid, LoginPTD[playerid][11], 150);
	PlayerTextDrawFont(playerid, LoginPTD[playerid][11], 0);
	PlayerTextDrawSetProportional(playerid, LoginPTD[playerid][11], 1);
	PlayerTextDrawSetSelectable(playerid, LoginPTD[playerid][11], 1);

	LoginPTD[playerid][12] = CreatePlayerTextDraw(playerid, 368.000, 417.000, "facebook.com/ssarpcaiconcacditconmemay");
	PlayerTextDrawLetterSize(playerid, LoginPTD[playerid][12], 0.300, 1.500);
	PlayerTextDrawAlignment(playerid, LoginPTD[playerid][12], 1);
	PlayerTextDrawColor(playerid, LoginPTD[playerid][12], -1);
	PlayerTextDrawSetShadow(playerid, LoginPTD[playerid][12], 0);
	PlayerTextDrawSetOutline(playerid, LoginPTD[playerid][12], 0);
	PlayerTextDrawBackgroundColor(playerid, LoginPTD[playerid][12], 150);
	PlayerTextDrawFont(playerid, LoginPTD[playerid][12], 0);
	PlayerTextDrawSetProportional(playerid, LoginPTD[playerid][12], 1);
	PlayerTextDrawSetSelectable(playerid, LoginPTD[playerid][12], 1);

	LoginPTD[playerid][13] = CreatePlayerTextDraw(playerid, 223.000, 402.000, "Discord Link:");
	PlayerTextDrawLetterSize(playerid, LoginPTD[playerid][13], 0.219, 1.098);
	PlayerTextDrawAlignment(playerid, LoginPTD[playerid][13], 1);
	PlayerTextDrawColor(playerid, LoginPTD[playerid][13], -2139062017);
	PlayerTextDrawSetShadow(playerid, LoginPTD[playerid][13], 0);
	PlayerTextDrawSetOutline(playerid, LoginPTD[playerid][13], 0);
	PlayerTextDrawBackgroundColor(playerid, LoginPTD[playerid][13], 150);
	PlayerTextDrawFont(playerid, LoginPTD[playerid][13], 1);
	PlayerTextDrawSetProportional(playerid, LoginPTD[playerid][13], 1);

	LoginPTD[playerid][14] = CreatePlayerTextDraw(playerid, 369.000, 402.000, "Facebook Link:");
	PlayerTextDrawLetterSize(playerid, LoginPTD[playerid][14], 0.219, 1.098);
	PlayerTextDrawAlignment(playerid, LoginPTD[playerid][14], 1);
	PlayerTextDrawColor(playerid, LoginPTD[playerid][14], -2139062017);
	PlayerTextDrawSetShadow(playerid, LoginPTD[playerid][14], 0);
	PlayerTextDrawSetOutline(playerid, LoginPTD[playerid][14], 0);
	PlayerTextDrawBackgroundColor(playerid, LoginPTD[playerid][14], 150);
	PlayerTextDrawFont(playerid, LoginPTD[playerid][14], 1);
	PlayerTextDrawSetProportional(playerid, LoginPTD[playerid][14], 1);
	return 1;
}

func:ShowLoginPTD(playerid)
{
	if (player_Login(playerid)) return 1;
	SetPVarInt(playerid, #Auth_Case, 1); // login
	SetPVarInt(playerid, "OpenLoginPTD_@", 1);
	PlayerTextDrawSetString(playerid, LoginPTD[playerid][6],player_get_name(playerid, 1));
	SelectTextDraw(playerid, 0x0d142b00);
	for(new login_loop = 0 ; login_loop < 15; login_loop++)
	{
		PlayerTextDrawShow(playerid,LoginPTD[playerid][login_loop]);
	}

	PlayerTextDrawHide(playerid, LoginPTD[playerid][3]);
	PlayerTextDrawHide(playerid, LoginPTD[playerid][9]);
	PlayerTextDrawHide(playerid, LoginPTD[playerid][10]);

	return 1;
}
func:IsOpenLoginPTD(playerid)
{
	return SetPVarInt(playerid, "OpenLoginPTD_@", 1);
}

func:HideAuthPTD(playerid)
{
	CancelSelectTextDraw(playerid);
	SetPVarInt(playerid, "OpenLoginPTD_@", 0);	
	for(new login_loop = 0 ; login_loop < 15; login_loop++)
	{
		PlayerTextDrawHide(playerid,LoginPTD[playerid][login_loop]);
	}
	return 1;
}

func:ShowPlayerMainRegister(playerid)
{
	if (player_Login(playerid)) return 1;
	SetPVarInt(playerid, #Auth_Case, 0); // register

	SetPVarInt(playerid, "OpenLoginPTD_@", 1);
	PlayerTextDrawSetString(playerid, LoginPTD[playerid][0],"mdl-2002:reg");
	PlayerTextDrawSetString(playerid, LoginPTD[playerid][6],player_get_name(playerid, 1));
	SelectTextDraw(playerid, 0x0d142b00);
	for(new login_loop = 0 ; login_loop < 15; login_loop++)
	{
		PlayerTextDrawShow(playerid,LoginPTD[playerid][login_loop]);
	}
	return 1;
}