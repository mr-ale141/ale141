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
    char com_number;
    char com_file_str[9] = "\\\\.\\COM";
    printf("COM port # [1-9]: ");
    scanf("%c", &com_number);
    while (getchar() != '\n')
    {
        continue;
    }
    while (com_number < '1' || com_number > '9')
    {
        MessageBox(NULL, "Invalid number com port", "Error", MB_OK);
        printf("\nCOM port # [1-9]: ");
        scanf("%c", &com_number);
        while (getchar() != '\n')
        {
            continue;
        }
    }
    com_file_str[7] = com_number;
    com_file_str[8] = '\0';
    printf("\nStart port COM%c\n", com_number);

    HWND hwnd;
    unsigned short langID;

    HANDLE Port;
    Port = CreateFile(com_file_str, GENERIC_READ | GENERIC_WRITE, 0, NULL, OPEN_EXISTING, 0, NULL);
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