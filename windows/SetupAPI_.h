/* Windows */
#include <Windows.h>
#include <SetupAPI.h>

#define DIGCF_DEFAULT           0x00000001  // only valid with DIGCF_DEVICEINTERFACE
#define DIGCF_PRESENT           0x00000002
#define DIGCF_ALLCLASSES        0x00000004
#define DIGCF_PROFILE           0x00000008
#define DIGCF_DEVICEINTERFACE   0x00000010


WINSETUPAPI
BOOL
WINAPI
SetupDiDestroyDeviceInfoList(
    _In_ HDEVINFO DeviceInfoSet
    );


WINSETUPAPI
BOOL
WINAPI
SetupDiEnumDeviceInterfaces(
    _In_ HDEVINFO DeviceInfoSet,
    // FIXME https://github.com/dart-lang/ffigen/issues/157
    _In_opt_ SP_DEVINFO_DATA *DeviceInfoData,           // _In_opt_ PSP_DEVINFO_DATA *DeviceInfoData,  
    _In_ CONST GUID *InterfaceClassGuid,
    _In_ DWORD MemberIndex,
    // FIXME https://github.com/dart-lang/ffigen/issues/157
    _Out_ SP_DEVICE_INTERFACE_DATA *DeviceInterfaceData // _Out_ PSP_DEVICE_INTERFACE_DATA *DeviceInterfaceData
    );


_Success_(return != FALSE)
_At_((LPWSTR)DeviceInterfaceDetailData->DevicePath, _Post_z_)
WINSETUPAPI
BOOL
WINAPI
SetupDiGetDeviceInterfaceDetailW(
    _In_ HDEVINFO DeviceInfoSet,
    _In_ PSP_DEVICE_INTERFACE_DATA DeviceInterfaceData,
    // FIXME https://github.com/dart-lang/ffigen/issues/157
    _Out_writes_bytes_to_opt_(DeviceInterfaceDetailDataSize, *RequiredSize) SP_DEVICE_INTERFACE_DETAIL_DATA_W *DeviceInterfaceDetailData, // _Out_writes_bytes_to_opt_(DeviceInterfaceDetailDataSize, *RequiredSize) PSP_DEVICE_INTERFACE_DETAIL_DATA_W DeviceInterfaceDetailData,
    _In_ DWORD DeviceInterfaceDetailDataSize,
    _Out_opt_ _Out_range_(>=, sizeof(SP_DEVICE_INTERFACE_DETAIL_DATA_W)) PDWORD RequiredSize,
    _Out_opt_ PSP_DEVINFO_DATA DeviceInfoData
    );


_Check_return_
WINSETUPAPI
HDEVINFO
WINAPI
SetupDiGetClassDevsW(
    // FIXME https://github.com/dart-lang/ffigen/issues/159
    _In_opt_ GUID *ClassGuid,   // _In_opt_ CONST GUID *ClassGuid,
    _In_opt_ PCWSTR Enumerator,
    _In_opt_ HWND hwndParent,
    _In_ DWORD Flags
    );
