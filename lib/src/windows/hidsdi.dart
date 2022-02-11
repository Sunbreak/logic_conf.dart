// AUTO GENERATED FILE, DO NOT EDIT.
//
// Generated by `package:ffigen`.
import 'dart:ffi' as ffi;

/// Bindings to `hidsdi.h`.
class HidSdi {
  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  HidSdi(ffi.DynamicLibrary dynamicLibrary) : _lookup = dynamicLibrary.lookup;

  /// The symbols are looked up with [lookup].
  HidSdi.fromLookup(
      ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
          lookup)
      : _lookup = lookup;

  int HidP_GetCaps(
    PHIDP_PREPARSED_DATA PreparsedData,
    PHIDP_CAPS Capabilities,
  ) {
    return _HidP_GetCaps(
      PreparsedData,
      Capabilities,
    );
  }

  late final _HidP_GetCapsPtr = _lookup<
      ffi.NativeFunction<
          NTSTATUS Function(PHIDP_PREPARSED_DATA, PHIDP_CAPS)>>('HidP_GetCaps');
  late final _HidP_GetCaps = _HidP_GetCapsPtr.asFunction<
      int Function(PHIDP_PREPARSED_DATA, PHIDP_CAPS)>();

  int HidD_GetAttributes(
    HANDLE HidDeviceObject,
    PHIDD_ATTRIBUTES Attributes,
  ) {
    return _HidD_GetAttributes(
      HidDeviceObject,
      Attributes,
    );
  }

  late final _HidD_GetAttributesPtr =
      _lookup<ffi.NativeFunction<BOOLEAN Function(HANDLE, PHIDD_ATTRIBUTES)>>(
          'HidD_GetAttributes');
  late final _HidD_GetAttributes = _HidD_GetAttributesPtr.asFunction<
      int Function(HANDLE, PHIDD_ATTRIBUTES)>();

  int HidD_GetPreparsedData(
    HANDLE HidDeviceObject,
    ffi.Pointer<PHIDP_PREPARSED_DATA> PreparsedData,
  ) {
    return _HidD_GetPreparsedData(
      HidDeviceObject,
      PreparsedData,
    );
  }

  late final _HidD_GetPreparsedDataPtr = _lookup<
      ffi.NativeFunction<
          BOOLEAN Function(HANDLE,
              ffi.Pointer<PHIDP_PREPARSED_DATA>)>>('HidD_GetPreparsedData');
  late final _HidD_GetPreparsedData = _HidD_GetPreparsedDataPtr.asFunction<
      int Function(HANDLE, ffi.Pointer<PHIDP_PREPARSED_DATA>)>();

  int HidD_FreePreparsedData(
    PHIDP_PREPARSED_DATA PreparsedData,
  ) {
    return _HidD_FreePreparsedData(
      PreparsedData,
    );
  }

  late final _HidD_FreePreparsedDataPtr =
      _lookup<ffi.NativeFunction<BOOLEAN Function(PHIDP_PREPARSED_DATA)>>(
          'HidD_FreePreparsedData');
  late final _HidD_FreePreparsedData = _HidD_FreePreparsedDataPtr.asFunction<
      int Function(PHIDP_PREPARSED_DATA)>();

  HIDP_CAPS foo() {
    return _foo();
  }

  late final _fooPtr = _lookup<ffi.NativeFunction<HIDP_CAPS Function()>>('foo');
  late final _foo = _fooPtr.asFunction<HIDP_CAPS Function()>();
}

typedef NTSTATUS = LONG;
typedef LONG = ffi.Int32;
typedef PHIDP_PREPARSED_DATA = ffi.Pointer<_HIDP_PREPARSED_DATA>;

class _HIDP_PREPARSED_DATA extends ffi.Opaque {}

typedef PHIDP_CAPS = ffi.Pointer<_HIDP_CAPS>;

class _HIDP_CAPS extends ffi.Struct {
  @USAGE()
  external int Usage;

  @USAGE()
  external int UsagePage;

  @USHORT()
  external int InputReportByteLength;

  @USHORT()
  external int OutputReportByteLength;

  @USHORT()
  external int FeatureReportByteLength;

  @ffi.Array.multi([17])
  external ffi.Array<USHORT> Reserved;

  @USHORT()
  external int NumberLinkCollectionNodes;

  @USHORT()
  external int NumberInputButtonCaps;

  @USHORT()
  external int NumberInputValueCaps;

  @USHORT()
  external int NumberInputDataIndices;

  @USHORT()
  external int NumberOutputButtonCaps;

  @USHORT()
  external int NumberOutputValueCaps;

  @USHORT()
  external int NumberOutputDataIndices;

  @USHORT()
  external int NumberFeatureButtonCaps;

  @USHORT()
  external int NumberFeatureValueCaps;

  @USHORT()
  external int NumberFeatureDataIndices;
}

typedef USAGE = USHORT;
typedef USHORT = ffi.Uint16;
typedef BOOLEAN = boolean;
typedef boolean = ffi.Uint8;
typedef HANDLE = ffi.Pointer<ffi.Void>;
typedef PHIDD_ATTRIBUTES = ffi.Pointer<HIDD_ATTRIBUTES>;

class HIDD_ATTRIBUTES extends ffi.Struct {
  @ULONG()
  external int Size;

  @USHORT()
  external int VendorID;

  @USHORT()
  external int ProductID;

  @USHORT()
  external int VersionNumber;
}

typedef ULONG = DWORD;
typedef DWORD = ffi.Uint32;
typedef HIDP_CAPS = _HIDP_CAPS;

const int HIDP_STATUS_SUCCESS = 1114112;
