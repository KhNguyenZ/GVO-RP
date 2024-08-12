#include <YSI\YSI_Coding\y_hooks>


hook OnGameModeInit()
{
    for(new i; i < 10; i++) CountBed[i] = INVALID_NUMBER;
    return 1;
}