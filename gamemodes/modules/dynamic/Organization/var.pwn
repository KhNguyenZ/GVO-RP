#define PLAYER_DATA "/Organization/%s.ini"
#define ORG_CHAT(%0,%1,%2,%3) format(org_string,512,%2,%3); \
SendClientMessage(%0,%1,org_string)
#define MAX_ORG 16
new org_string[128];

//COLOR
#define COLOR_GRAD1 0xB4B5B7FF
#define COLOR_GRAD2 0xBFC0C2FF
#define GRAD2 0xBFC0C2FF
#define COLOR_YELLOW2 0xBFCOC2FF
#define STEP 0xde1439ff
#define COL_WHITE "{FFFFFF}"
#define COL_RED "{F81414}"
#define COL_SGREEN "{00FF22}"
#define COL_LIGHTBLUE "{00CED1}"
#define LIGHTHOUSE                    0xFF6347AA
#define SULJA              "{FFFF80}"
#define TBLUE            "{ADD6FF}"
//#define TPL3AVA             "{0482FF}"
#define SGREEN            "{00FF00}"
#define WHITE             "{FFFFFF}"
#define BLACK               "{0E0101}"
#define GRAY               "{C3C3C3}"
#define GREEN             "{6EF83C}"
#define RED             "{F81414}"
#define YELLOW               "{F3FF02}"
#define ORANGE        "{FFAF00}"
#define LIME               "{B7FF00}"
#define CYAN               "{00FFEE}"
#define FLAT             "{00C0FF}"
#define BLUE            "{0049FF}"
#define COL_MAGENTA        "{F300FF}"
#define COL_VIOLET         "{B700FF}"
#define PINK              "{FF00EA}"
#define COL_MARONE         "{A90202}"
#define COL_PARAM          "{3FCD02}"
#define COL_VALUE          "{A3E4FF}"
#define COL_RULE           "{F9E8B7}"
#define COL_RULE2          "{FBDF89}"
#define COL_RWHITE         "{FFFFFF}"
#define LIGHT_GREEN      "{C9FFAB}"
#define LIGHT_RED      "{FFA1A1}"
#define LIGHT_RED2    "{C77D87}"
enum pInfo
{
    pLeader,
    pMember,
    pRank,
    pSkin,

};
new PlayerInfo[MAX_PLAYERS][pInfo]
enum oInfo
{

    oCar1,
    oCar2,
    oCar3,
    oCar4,
    oCar5,
    oCar6,
    oCar7,
    oCar8,
    oColor,
    Vcolor1,
    Vcolor2,
    oMax8,
    oSkin1,
    oSkin2,
    oSkin3,
    Genre,
    oLSkin
};

new Organization[MAX_ORG][oInfo];