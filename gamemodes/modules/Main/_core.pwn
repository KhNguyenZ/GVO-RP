#include <a_samp>


#define  			func:%0(%1)  				stock %0(%1)


func:SendRangeMessage(const playerid, Float:range, string[])
{
	new Float:player_p[3];
	GetPlayerPos(playerid, player_p[0], player_p[1], player_p[2]);
	new msg[1280];
	format(msg, sizeof(msg), "%s noi: %s", player_get_name(playerid), string);
	SendClientMessage(playerid, -1, msg);
	for(new i = 0 ; i < MAX_PLAYERS ; i++)
	{
		if(IsPlayerConnected(playerid) && i != playerid)
		{
			if(IsPlayerInRangeOfPoint(playerid,range, player_p[0], player_p[1], player_p[2]))
			{
				new msgz[1280];
				format(msgz, sizeof(msgz), "%s noi: %s", player_get_name(playerid), string);
				SendClientMessage(i, -1, msgz);
				return 1;
			}
		}
	}
	format(msg, sizeof(msg), "(chat) %s", player_get_name(playerid), string);
	SetPlayerChatBubble(playerid, string, -1, range,10000);
	return 0;
}

// Anti Hack Money

task CoreUpdate[1000]()
{
	for(new i = 0 ; i < MAX_PLAYERS ; i++)
	{
		if(IsPlayerConnected(i))
		{
			if(Character[i][char_Cash] != GetPlayerMoney(i))
			{
				ResetPlayerMoney(i);
				GivePlayerMoney(i, Character[i][char_Cash]);
			}
		}
	}
}


public OnGameModeInit()
{
	AddPlayerClass(0, 1958.33, 1343.12, 15.36, 269.15, 0, 0, 0, 0, 0, 0);
	AddPlayerClass(0, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0);
	return 1;
}
