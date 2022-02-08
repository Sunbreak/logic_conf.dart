// AUTO GENERATED FILE, DO NOT EDIT.
//
// Generated by `package:ffigen`.
import 'dart:ffi' as ffi;

/// Bindings to `SetupAPI.h`.
class SetupAPI {
  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  SetupAPI(ffi.DynamicLibrary dynamicLibrary) : _lookup = dynamicLibrary.lookup;

  /// The symbols are looked up with [lookup].
  SetupAPI.fromLookup(
      ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
          lookup)
      : _lookup = lookup;

  int SetupDiDestroyDeviceInfoList(
    ffi.Pointer<ffi.Void> DeviceInfoSet,
  ) {
    return _SetupDiDestroyDeviceInfoList(
      DeviceInfoSet,
    );
  }

  late final _SetupDiDestroyDeviceInfoList_ptr =
      _lookup<ffi.NativeFunction<_c_SetupDiDestroyDeviceInfoList>>(
          'SetupDiDestroyDeviceInfoList');
  late final _dart_SetupDiDestroyDeviceInfoList _SetupDiDestroyDeviceInfoList =
      _SetupDiDestroyDeviceInfoList_ptr.asFunction<
          _dart_SetupDiDestroyDeviceInfoList>();

  int SetupDiEnumDeviceInterfaces(
    ffi.Pointer<ffi.Void> DeviceInfoSet,
    ffi.Pointer<PSP_DEVINFO_DATA> DeviceInfoData,
    ffi.Pointer<GUID> InterfaceClassGuid,
    int MemberIndex,
    ffi.Pointer<PSP_DEVICE_INTERFACE_DATA> DeviceInterfaceData,
  ) {
    return _SetupDiEnumDeviceInterfaces(
      DeviceInfoSet,
      DeviceInfoData,
      InterfaceClassGuid,
      MemberIndex,
      DeviceInterfaceData,
    );
  }

  late final _SetupDiEnumDeviceInterfaces_ptr =
      _lookup<ffi.NativeFunction<_c_SetupDiEnumDeviceInterfaces>>(
          'SetupDiEnumDeviceInterfaces');
  late final _dart_SetupDiEnumDeviceInterfaces _SetupDiEnumDeviceInterfaces =
      _SetupDiEnumDeviceInterfaces_ptr.asFunction<
          _dart_SetupDiEnumDeviceInterfaces>();

  int SetupDiGetDeviceInterfaceDetailW(
    ffi.Pointer<ffi.Void> DeviceInfoSet,
    ffi.Pointer<PSP_DEVICE_INTERFACE_DATA> DeviceInterfaceData,
    ffi.Pointer<PSP_DEVICE_INTERFACE_DETAIL_DATA_W> DeviceInterfaceDetailData,
    int DeviceInterfaceDetailDataSize,
    ffi.Pointer<ffi.Uint32> RequiredSize,
    ffi.Pointer<PSP_DEVINFO_DATA> DeviceInfoData,
  ) {
    return _SetupDiGetDeviceInterfaceDetailW(
      DeviceInfoSet,
      DeviceInterfaceData,
      DeviceInterfaceDetailData,
      DeviceInterfaceDetailDataSize,
      RequiredSize,
      DeviceInfoData,
    );
  }

  late final _SetupDiGetDeviceInterfaceDetailW_ptr =
      _lookup<ffi.NativeFunction<_c_SetupDiGetDeviceInterfaceDetailW>>(
          'SetupDiGetDeviceInterfaceDetailW');
  late final _dart_SetupDiGetDeviceInterfaceDetailW
      _SetupDiGetDeviceInterfaceDetailW = _SetupDiGetDeviceInterfaceDetailW_ptr
          .asFunction<_dart_SetupDiGetDeviceInterfaceDetailW>();

  ffi.Pointer<ffi.Void> SetupDiGetClassDevsW(
    ffi.Pointer<GUID> ClassGuid,
    ffi.Pointer<ffi.Uint16> Enumerator,
    ffi.Pointer<HWND> hwndParent,
    int Flags,
  ) {
    return _SetupDiGetClassDevsW(
      ClassGuid,
      Enumerator,
      hwndParent,
      Flags,
    );
  }

  late final _SetupDiGetClassDevsW_ptr =
      _lookup<ffi.NativeFunction<_c_SetupDiGetClassDevsW>>(
          'SetupDiGetClassDevsW');
  late final _dart_SetupDiGetClassDevsW _SetupDiGetClassDevsW =
      _SetupDiGetClassDevsW_ptr.asFunction<_dart_SetupDiGetClassDevsW>();
}

class GUID extends ffi.Struct {
  @ffi.Uint32()
  external int Data1;

  @ffi.Uint16()
  external int Data2;

  @ffi.Uint16()
  external int Data3;

  @ffi.Array.multi([8])
  external ffi.Array<ffi.Uint8> Data4;
}

class PSP_DEVINFO_DATA extends ffi.Struct {
  @ffi.Uint32()
  external int cbSize;

  external GUID ClassGuid;

  @ffi.Uint32()
  external int DevInst;

  @ffi.Uint64()
  external int Reserved;
}

class PSP_DEVICE_INTERFACE_DATA extends ffi.Struct {
  @ffi.Uint32()
  external int cbSize;

  external GUID InterfaceClassGuid;

  @ffi.Uint32()
  external int Flags;

  @ffi.Uint64()
  external int Reserved;
}

class PSP_DEVICE_INTERFACE_DETAIL_DATA_W extends ffi.Struct {
  @ffi.Uint32()
  external int cbSize;

  @ffi.Array.multi([1])
  external ffi.Array<ffi.Uint16> DevicePath;
}

class HWND extends ffi.Struct {
  @ffi.Int32()
  external int unused;
}

const int DIGCF_DEFAULT = 1;

const int DIGCF_PRESENT = 2;

const int DIGCF_ALLCLASSES = 4;

const int DIGCF_PROFILE = 8;

const int DIGCF_DEVICEINTERFACE = 16;

typedef _c_SetupDiDestroyDeviceInfoList = ffi.Int32 Function(
  ffi.Pointer<ffi.Void> DeviceInfoSet,
);

typedef _dart_SetupDiDestroyDeviceInfoList = int Function(
  ffi.Pointer<ffi.Void> DeviceInfoSet,
);

typedef _c_SetupDiEnumDeviceInterfaces = ffi.Int32 Function(
  ffi.Pointer<ffi.Void> DeviceInfoSet,
  ffi.Pointer<PSP_DEVINFO_DATA> DeviceInfoData,
  ffi.Pointer<GUID> InterfaceClassGuid,
  ffi.Uint32 MemberIndex,
  ffi.Pointer<PSP_DEVICE_INTERFACE_DATA> DeviceInterfaceData,
);

typedef _dart_SetupDiEnumDeviceInterfaces = int Function(
  ffi.Pointer<ffi.Void> DeviceInfoSet,
  ffi.Pointer<PSP_DEVINFO_DATA> DeviceInfoData,
  ffi.Pointer<GUID> InterfaceClassGuid,
  int MemberIndex,
  ffi.Pointer<PSP_DEVICE_INTERFACE_DATA> DeviceInterfaceData,
);

typedef _c_SetupDiGetDeviceInterfaceDetailW = ffi.Int32 Function(
  ffi.Pointer<ffi.Void> DeviceInfoSet,
  ffi.Pointer<PSP_DEVICE_INTERFACE_DATA> DeviceInterfaceData,
  ffi.Pointer<PSP_DEVICE_INTERFACE_DETAIL_DATA_W> DeviceInterfaceDetailData,
  ffi.Uint32 DeviceInterfaceDetailDataSize,
  ffi.Pointer<ffi.Uint32> RequiredSize,
  ffi.Pointer<PSP_DEVINFO_DATA> DeviceInfoData,
);

typedef _dart_SetupDiGetDeviceInterfaceDetailW = int Function(
  ffi.Pointer<ffi.Void> DeviceInfoSet,
  ffi.Pointer<PSP_DEVICE_INTERFACE_DATA> DeviceInterfaceData,
  ffi.Pointer<PSP_DEVICE_INTERFACE_DETAIL_DATA_W> DeviceInterfaceDetailData,
  int DeviceInterfaceDetailDataSize,
  ffi.Pointer<ffi.Uint32> RequiredSize,
  ffi.Pointer<PSP_DEVINFO_DATA> DeviceInfoData,
);

typedef _c_SetupDiGetClassDevsW = ffi.Pointer<ffi.Void> Function(
  ffi.Pointer<GUID> ClassGuid,
  ffi.Pointer<ffi.Uint16> Enumerator,
  ffi.Pointer<HWND> hwndParent,
  ffi.Uint32 Flags,
);

typedef _dart_SetupDiGetClassDevsW = ffi.Pointer<ffi.Void> Function(
  ffi.Pointer<GUID> ClassGuid,
  ffi.Pointer<ffi.Uint16> Enumerator,
  ffi.Pointer<HWND> hwndParent,
  int Flags,
);
