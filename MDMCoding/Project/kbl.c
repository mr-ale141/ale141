#include <stdio.h>
#include <windows.h>
 
 
unsigned short get_current_keyboard_layout(HWND hwnd){
    unsigned int tID,pID;
    unsigned short res;
 
    tID = GetWindowThreadProcessId(hwnd, &pID);
    res = GetKeyboardLayout(tID);
    return res;
}
 
int main()
{
    HWND hwnd;
    unsigned short langID;
 
    while(1){
        hwnd = GetForegroundWindow();
        langID = get_current_keyboard_layout(hwnd);
        switch(langID){
            case 0x0409: puts("en"); break;
            case 0x0419: puts("ru"); break;
            case 0x0422: puts("uk"); break;
            default: puts("unknown"); break;
        }
    }
    return 0;
}