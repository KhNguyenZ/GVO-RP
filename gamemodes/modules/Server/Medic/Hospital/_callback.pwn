#include <YSI_Coding\y_hooks>


hook OnGameModeInit()
{
    for(new i; i < 10; i++) CountBed[i] = INVAILID_NUMBER;
    return 1;
}