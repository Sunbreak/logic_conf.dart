// -----------------------------------------------------------------------------
// hidclass.h constants
// -----------------------------------------------------------------------------

// DEFINE_GUID( GUID_DEVINTERFACE_HID, 0x4D1E55B2L, 0xF16F, 0x11CF, 0x88, 0xCB, 0x00, 0x11, 0x11, 0x00, 0x00, 0x30);
const GUID_DEVINTERFACE_HID = '{4D1E55B2-F16F-11CF-88CB-001111000030}';

// -----------------------------------------------------------------------------
// SetupAPI.h constants
// -----------------------------------------------------------------------------

//
// Flags controlling what is included in the device information set built
// by SetupDiGetClassDevs
//
// #define DIGCF_DEFAULT           0x00000001  // only valid with DIGCF_DEVICEINTERFACE
// #define DIGCF_PRESENT           0x00000002
// #define DIGCF_ALLCLASSES        0x00000004
// #define DIGCF_PROFILE           0x00000008
// #define DIGCF_DEVICEINTERFACE   0x00000010
const DIGCF_DEFAULT = 0x00000001;
const DIGCF_PRESENT = 0x00000002;
const DIGCF_ALLCLASSES = 0x00000004;
const DIGCF_PROFILE = 0x00000008;
const DIGCF_DEVICEINTERFACE = 0x00000010;
