// AUTO GENERATED FILE, DO NOT EDIT.
//
// Generated by `package:ffigen`.
import 'dart:ffi' as ffi;

/// Bindings to `SetupAPI.h`.
class SetupAPI {
  /// Holds the Dynamic library.
  final ffi.DynamicLibrary _dylib;

  /// The symbols are looked up in [dynamicLibrary].
  SetupAPI(ffi.DynamicLibrary dynamicLibrary) : _dylib = dynamicLibrary;

  int SetupDiDestroyDeviceInfoList(
    ffi.Pointer<ffi.Void> DeviceInfoSet,
  ) {
    return (_SetupDiDestroyDeviceInfoList ??= _dylib.lookupFunction<
        _c_SetupDiDestroyDeviceInfoList,
        _dart_SetupDiDestroyDeviceInfoList>('SetupDiDestroyDeviceInfoList'))(
      DeviceInfoSet,
    );
  }

  _dart_SetupDiDestroyDeviceInfoList? _SetupDiDestroyDeviceInfoList;

  int SetupDiEnumDeviceInterfaces(
    ffi.Pointer<ffi.Void> DeviceInfoSet,
    ffi.Pointer<SP_DEVINFO_DATA> DeviceInfoData,
    ffi.Pointer<GUID> InterfaceClassGuid,
    int MemberIndex,
    ffi.Pointer<SP_DEVICE_INTERFACE_DATA> DeviceInterfaceData,
  ) {
    return (_SetupDiEnumDeviceInterfaces ??= _dylib.lookupFunction<
        _c_SetupDiEnumDeviceInterfaces,
        _dart_SetupDiEnumDeviceInterfaces>('SetupDiEnumDeviceInterfaces'))(
      DeviceInfoSet,
      DeviceInfoData,
      InterfaceClassGuid,
      MemberIndex,
      DeviceInterfaceData,
    );
  }

  _dart_SetupDiEnumDeviceInterfaces? _SetupDiEnumDeviceInterfaces;

  int SetupDiGetDeviceInterfaceDetailW(
    ffi.Pointer<ffi.Void> DeviceInfoSet,
    ffi.Pointer<SP_DEVICE_INTERFACE_DATA> DeviceInterfaceData,
    ffi.Pointer<SP_DEVICE_INTERFACE_DETAIL_DATA_W> DeviceInterfaceDetailData,
    int DeviceInterfaceDetailDataSize,
    ffi.Pointer<ffi.Uint32> RequiredSize,
    ffi.Pointer<SP_DEVINFO_DATA> DeviceInfoData,
  ) {
    return (_SetupDiGetDeviceInterfaceDetailW ??= _dylib.lookupFunction<
            _c_SetupDiGetDeviceInterfaceDetailW,
            _dart_SetupDiGetDeviceInterfaceDetailW>(
        'SetupDiGetDeviceInterfaceDetailW'))(
      DeviceInfoSet,
      DeviceInterfaceData,
      DeviceInterfaceDetailData,
      DeviceInterfaceDetailDataSize,
      RequiredSize,
      DeviceInfoData,
    );
  }

  _dart_SetupDiGetDeviceInterfaceDetailW? _SetupDiGetDeviceInterfaceDetailW;

  ffi.Pointer<ffi.Void> SetupDiGetClassDevsW(
    ffi.Pointer<GUID> ClassGuid,
    ffi.Pointer<ffi.Uint16> Enumerator,
    ffi.Pointer<HWND> hwndParent,
    int Flags,
  ) {
    return (_SetupDiGetClassDevsW ??= _dylib.lookupFunction<
        _c_SetupDiGetClassDevsW,
        _dart_SetupDiGetClassDevsW>('SetupDiGetClassDevsW'))(
      ClassGuid,
      Enumerator,
      hwndParent,
      Flags,
    );
  }

  _dart_SetupDiGetClassDevsW? _SetupDiGetClassDevsW;
}

class GUID extends ffi.Struct {
  @ffi.Uint32()
  external int Data1;

  @ffi.Uint16()
  external int Data2;

  @ffi.Uint16()
  external int Data3;

  @ffi.Uint8()
  external int _unique_Data4_item_0;
  @ffi.Uint8()
  external int _unique_Data4_item_1;
  @ffi.Uint8()
  external int _unique_Data4_item_2;
  @ffi.Uint8()
  external int _unique_Data4_item_3;
  @ffi.Uint8()
  external int _unique_Data4_item_4;
  @ffi.Uint8()
  external int _unique_Data4_item_5;
  @ffi.Uint8()
  external int _unique_Data4_item_6;
  @ffi.Uint8()
  external int _unique_Data4_item_7;

  /// Helper for array `Data4`.
  ArrayHelper_GUID_Data4_level0 get Data4 =>
      ArrayHelper_GUID_Data4_level0(this, [8], 0, 0);
}

/// Helper for array `Data4` in struct `GUID`.
class ArrayHelper_GUID_Data4_level0 {
  final GUID _struct;
  final List<int> dimensions;
  final int level;
  final int _absoluteIndex;
  int get length => dimensions[level];
  ArrayHelper_GUID_Data4_level0(
      this._struct, this.dimensions, this.level, this._absoluteIndex);
  void _checkBounds(int index) {
    if (index >= length || index < 0) {
      throw RangeError(
          'Dimension $level: index not in range 0..${length} exclusive.');
    }
  }

  int operator [](int index) {
    _checkBounds(index);
    switch (_absoluteIndex + index) {
      case 0:
        return _struct._unique_Data4_item_0;
      case 1:
        return _struct._unique_Data4_item_1;
      case 2:
        return _struct._unique_Data4_item_2;
      case 3:
        return _struct._unique_Data4_item_3;
      case 4:
        return _struct._unique_Data4_item_4;
      case 5:
        return _struct._unique_Data4_item_5;
      case 6:
        return _struct._unique_Data4_item_6;
      case 7:
        return _struct._unique_Data4_item_7;
      default:
        throw Exception('Invalid Array Helper generated.');
    }
  }

  void operator []=(int index, int value) {
    _checkBounds(index);
    switch (_absoluteIndex + index) {
      case 0:
        _struct._unique_Data4_item_0 = value;
        break;
      case 1:
        _struct._unique_Data4_item_1 = value;
        break;
      case 2:
        _struct._unique_Data4_item_2 = value;
        break;
      case 3:
        _struct._unique_Data4_item_3 = value;
        break;
      case 4:
        _struct._unique_Data4_item_4 = value;
        break;
      case 5:
        _struct._unique_Data4_item_5 = value;
        break;
      case 6:
        _struct._unique_Data4_item_6 = value;
        break;
      case 7:
        _struct._unique_Data4_item_7 = value;
        break;
      default:
        throw Exception('Invalid Array Helper generated.');
    }
  }
}

class SP_DEVINFO_DATA extends ffi.Struct {
  @ffi.Uint32()
  external int cbSize;

  external GUID ClassGuid;

  @ffi.Uint32()
  external int DevInst;

  @ffi.Uint64()
  external int Reserved;
}

class SP_DEVICE_INTERFACE_DATA extends ffi.Struct {
  @ffi.Uint32()
  external int cbSize;

  external GUID InterfaceClassGuid;

  @ffi.Uint32()
  external int Flags;

  @ffi.Uint64()
  external int Reserved;
}

class SP_DEVICE_INTERFACE_DETAIL_DATA_W extends ffi.Struct {
  @ffi.Uint32()
  external int cbSize;

  @ffi.Uint16()
  external int _unique_DevicePath_item_0;

  /// Helper for array `DevicePath`.
  ArrayHelper_SP_DEVICE_INTERFACE_DETAIL_DATA_W_DevicePath_level0
      get DevicePath =>
          ArrayHelper_SP_DEVICE_INTERFACE_DETAIL_DATA_W_DevicePath_level0(
              this, [1], 0, 0);
}

/// Helper for array `DevicePath` in struct `SP_DEVICE_INTERFACE_DETAIL_DATA_W`.
class ArrayHelper_SP_DEVICE_INTERFACE_DETAIL_DATA_W_DevicePath_level0 {
  final SP_DEVICE_INTERFACE_DETAIL_DATA_W _struct;
  final List<int> dimensions;
  final int level;
  final int _absoluteIndex;
  int get length => dimensions[level];
  ArrayHelper_SP_DEVICE_INTERFACE_DETAIL_DATA_W_DevicePath_level0(
      this._struct, this.dimensions, this.level, this._absoluteIndex);
  void _checkBounds(int index) {
    if (index >= length || index < 0) {
      throw RangeError(
          'Dimension $level: index not in range 0..${length} exclusive.');
    }
  }

  int operator [](int index) {
    _checkBounds(index);
    switch (_absoluteIndex + index) {
      case 0:
        return _struct._unique_DevicePath_item_0;
      default:
        throw Exception('Invalid Array Helper generated.');
    }
  }

  void operator []=(int index, int value) {
    _checkBounds(index);
    switch (_absoluteIndex + index) {
      case 0:
        _struct._unique_DevicePath_item_0 = value;
        break;
      default:
        throw Exception('Invalid Array Helper generated.');
    }
  }
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
  ffi.Pointer<SP_DEVINFO_DATA> DeviceInfoData,
  ffi.Pointer<GUID> InterfaceClassGuid,
  ffi.Uint32 MemberIndex,
  ffi.Pointer<SP_DEVICE_INTERFACE_DATA> DeviceInterfaceData,
);

typedef _dart_SetupDiEnumDeviceInterfaces = int Function(
  ffi.Pointer<ffi.Void> DeviceInfoSet,
  ffi.Pointer<SP_DEVINFO_DATA> DeviceInfoData,
  ffi.Pointer<GUID> InterfaceClassGuid,
  int MemberIndex,
  ffi.Pointer<SP_DEVICE_INTERFACE_DATA> DeviceInterfaceData,
);

typedef _c_SetupDiGetDeviceInterfaceDetailW = ffi.Int32 Function(
  ffi.Pointer<ffi.Void> DeviceInfoSet,
  ffi.Pointer<SP_DEVICE_INTERFACE_DATA> DeviceInterfaceData,
  ffi.Pointer<SP_DEVICE_INTERFACE_DETAIL_DATA_W> DeviceInterfaceDetailData,
  ffi.Uint32 DeviceInterfaceDetailDataSize,
  ffi.Pointer<ffi.Uint32> RequiredSize,
  ffi.Pointer<SP_DEVINFO_DATA> DeviceInfoData,
);

typedef _dart_SetupDiGetDeviceInterfaceDetailW = int Function(
  ffi.Pointer<ffi.Void> DeviceInfoSet,
  ffi.Pointer<SP_DEVICE_INTERFACE_DATA> DeviceInterfaceData,
  ffi.Pointer<SP_DEVICE_INTERFACE_DETAIL_DATA_W> DeviceInterfaceDetailData,
  int DeviceInterfaceDetailDataSize,
  ffi.Pointer<ffi.Uint32> RequiredSize,
  ffi.Pointer<SP_DEVINFO_DATA> DeviceInfoData,
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