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

    HANDLE Port;
    Port = CreateFile("\\\\.\\COM3", GENERIC_READ | GENERIC_WRITE, 0, NULL, OPEN_EXISTING, 0, NULL);
    if (Port == INVALID_HANDLE_VALUE)
    {
        MessageBox(NULL, "Serial port cannot be opened", "Error", MB_OK);
        ExitProcess(1);
    }
    unsigned char dst[1];

    unsigned long size;

    while(1){
        hwnd = GetForegroundWindow();
        langID = get_current_keyboard_layout(hwnd);
        switch(langID){
            case 0x0409: dst[0] = 'E'; break;
            case 0x0419: dst[0] = 'R'; break;
            default: dst[0] = 'O'; break;
        }
        WriteFile(Port, dst, 1, &size, 0);
    }
    CloseHandle(Port);
    return 0;
}