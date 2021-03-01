/* Windows */
#include <Windows.h>
#include <hidsdi.h>

#define HIDP_STATUS_SUCCESS 0x110000

_Must_inspect_result_
_IRQL_requires_max_(PASSIVE_LEVEL)
NTSTATUS __stdcall
HidP_GetCaps (
   // FIXME https://github.com/dart-lang/ffigen/issues/157
   _In_      _HIDP_PREPARSED_DATA      *PreparsedData,   // _In_      PHIDP_PREPARSED_DATA      PreparsedData,
   // FIXME https://github.com/dart-lang/ffigen/issues/157
   _Out_     HIDP_CAPS                *Capabilities      // _Out_     PHIDP_CAPS                Capabilities
   );


_Must_inspect_result_
_Success_(return==TRUE)
BOOLEAN __stdcall
HidD_GetAttributes (
    _In_  HANDLE              HidDeviceObject,
    // FIXME https://github.com/dart-lang/ffigen/issues/157
    _Out_ HIDD_ATTRIBUTES    *Attributes  // _Out_ PHIDD_ATTRIBUTES    Attributes
    );


_Must_inspect_result_
_Success_(return==TRUE)
BOOLEAN __stdcall
HidD_GetPreparsedData (
   _In_   HANDLE                  HidDeviceObject,
   _Out_ _When_(return!=0, __drv_allocatesMem(Mem))  PHIDP_PREPARSED_DATA  * PreparsedData
   );


_Success_(return==TRUE)
BOOLEAN __stdcall
HidD_FreePreparsedData (
   _In_ __drv_freesMem(Mem) PHIDP_PREPARSED_DATA PreparsedData
   );