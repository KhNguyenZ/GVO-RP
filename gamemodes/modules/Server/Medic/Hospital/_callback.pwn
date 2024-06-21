#include <YSI_Coding\y_hooks>


hook OnGameModeInit()
{
    for(new i; i < 10; i++) CountBed[i] = -1;
    return 1;
}