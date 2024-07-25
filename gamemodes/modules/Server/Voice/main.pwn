#include <YSI_Coding\y_hooks>
#include <sampvoice>
new SV_GSTREAM:gstream;
new SV_LSTREAM:lstream[MAX_PLAYERS] = { SV_NULL, ... };

public SV_VOID:OnPlayerActivationKeyPress(
    SV_UINT:playerid,
    SV_UINT:keyid
)
{
    if (keyid == 0x42 && lstream[playerid]) SvAttachSpeakerToStream(lstream[playerid], playerid);
    if (keyid == 0x5A && gstream) SvAttachSpeakerToStream(gstream, playerid);
}

public SV_VOID:OnPlayerActivationKeyRelease(
    SV_UINT:playerid,
    SV_UINT:keyid
)
{
    if (keyid == 0x42 && lstream[playerid]) SvDetachSpeakerFromStream(lstream[playerid], playerid);
    if (keyid == 0x5A && gstream) SvDetachSpeakerFromStream(gstream, playerid);
}

hook OnPlayerSpawn(playerid)
{
    if (!SvGetVersion(playerid)) SendClientMessage(playerid, -1, "Khong tim thay plugin");
    else if (!SvHasMicro(playerid)) SendClientMessage(playerid, -1, "Khong tim thay micro");
    lstream[playerid] = SvCreateDLStreamAtPlayer(40.0, SV_INFINITY, playerid, 0xff0000ff, "L");
    SendClientMessage(playerid, -1, "Co voice");
    if (gstream) SvAttachListenerToStream(gstream, playerid);
    SvAddKey(playerid, 0x42);
    SvAddKey(playerid, 0x5A);


    return 1;

}

hook OnPlayerDisconnect(playerid, reason)
{

    if (lstream[playerid])
    {
        SvDeleteStream(lstream[playerid]);
        lstream[playerid] = SV_NULL;
    }

    return 1;

}

hook OnGameModeInit()
{

    //SvDebug(SV_TRUE);

    gstream = SvCreateGStream(0xffff0000, "G");
    return 1;

}

