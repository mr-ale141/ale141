#include <conio.h>
#include <stdio.h>
#include <windows.h>

unsigned short get_current_keyboard_layout(HWND hwnd)
{
    unsigned int tID,pID;
    unsigned short res;

    tID = GetWindowThreadProcessId(hwnd, &pID);
    res = GetKeyboardLayout(tID);
    return res;
}


int main()
{
    // com Port Var
    DCB dcb;
    HANDLE Port;
    BOOL fSuccess;
    char com_number = '3';
    char com_file_str[9] = "\\\\.\\COM";
    unsigned char dst[1] = {' '};
    unsigned char oldDst[1];
    unsigned long size;

    // Get Lang Var
    HWND hwnd;
    unsigned short langID;

    //Get Num Port
    /*
    printf("COM port # [1-9]: ");
    scanf("%c", &com_number);
    while (getchar() != '\n') continue;
    while (com_number < '1' || com_number > '9')
    {
        MessageBox(NULL, "Invalid number com port", "Error", MB_OK);
        printf("\nCOM port # [1-9]: ");
        scanf("%c", &com_number);
        while (getchar() != '\n') continue;
    }
    */
    com_file_str[7] = com_number;
    com_file_str[8] = '\0';
    printf("Press any key to EXIT\nStart port COM%c\n", com_number);
    

    // Open Port
    Port = CreateFile(com_file_str, GENERIC_READ | GENERIC_WRITE, 0, NULL, OPEN_EXISTING, 0, NULL);
    if (Port == INVALID_HANDLE_VALUE)
    {
        char str[40];
        sprintf(str, "Serial port COM%c cannot be opened!", com_number);
        MessageBox(NULL, str, "Error", MB_OK);
        ExitProcess(1);
    }

    //Set Port Setings
    SecureZeroMemory(&dcb, sizeof(DCB));
    dcb.DCBlength = sizeof(DCB);
    dcb.BaudRate = CBR_9600;
    dcb.ByteSize = 8;
    dcb.Parity = NOPARITY;
    dcb.StopBits = ONESTOPBIT;
    SetCommState(Port, &dcb);

    // Stream KeyB Lang in COM PORT
    while (1)
    {
        oldDst[0] = dst[0];
        hwnd = GetForegroundWindow();
        langID = get_current_keyboard_layout(hwnd);
        switch(langID){
            case 0x0409: dst[0] = 'E'; break;
            case 0x0419: dst[0] = 'R'; break;
            default: dst[0] = 'O'; break;
        }
        if (oldDst[0] != dst[0]) WriteFile(Port, dst, 1, &size, 0);
        if (kbhit()) {
            dst[0] = 'Q';
            WriteFile(Port, dst, 1, &size, 0);
            break;
        }
    }

    CloseHandle(Port);
    return 0;
}