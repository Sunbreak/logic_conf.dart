// AUTO GENERATED FILE, DO NOT EDIT.
//
// Generated by `package:ffigen`.
import 'dart:ffi' as ffi;
import 'package:ffi/ffi.dart' as pkg_ffi;
import 'package:logic_conf/src/macos/corefoundation.dart' as pkg_corefoundation;

/// Bindings to `IOKit.h`.
class IOKit {
  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  IOKit(ffi.DynamicLibrary dynamicLibrary) : _lookup = dynamicLibrary.lookup;

  /// The symbols are looked up with [lookup].
  IOKit.fromLookup(
      ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
          lookup)
      : _lookup = lookup;

  IOHIDDeviceRef IOHIDDeviceCreate(
    pkg_corefoundation.CFAllocatorRef allocator,
    io_service_t service,
  ) {
    return _IOHIDDeviceCreate(
      allocator,
      service,
    );
  }

  late final _IOHIDDeviceCreatePtr = _lookup<
      ffi.NativeFunction<
          IOHIDDeviceRef Function(pkg_corefoundation.CFAllocatorRef,
              io_service_t)>>('IOHIDDeviceCreate');
  late final _IOHIDDeviceCreate = _IOHIDDeviceCreatePtr.asFunction<
      IOHIDDeviceRef Function(
          pkg_corefoundation.CFAllocatorRef, io_service_t)>();

  io_service_t IOHIDDeviceGetService(
    IOHIDDeviceRef device,
  ) {
    return _IOHIDDeviceGetService(
      device,
    );
  }

  late final _IOHIDDeviceGetServicePtr =
      _lookup<ffi.NativeFunction<io_service_t Function(IOHIDDeviceRef)>>(
          'IOHIDDeviceGetService');
  late final _IOHIDDeviceGetService = _IOHIDDeviceGetServicePtr.asFunction<
      io_service_t Function(IOHIDDeviceRef)>();

  int IOHIDDeviceOpen(
    IOHIDDeviceRef device,
    int options,
  ) {
    return _IOHIDDeviceOpen(
      device,
      options,
    );
  }

  late final _IOHIDDeviceOpenPtr = _lookup<
          ffi.NativeFunction<IOReturn Function(IOHIDDeviceRef, IOOptionBits)>>(
      'IOHIDDeviceOpen');
  late final _IOHIDDeviceOpen =
      _IOHIDDeviceOpenPtr.asFunction<int Function(IOHIDDeviceRef, int)>();

  int IOHIDDeviceClose(
    IOHIDDeviceRef device,
    int options,
  ) {
    return _IOHIDDeviceClose(
      device,
      options,
    );
  }

  late final _IOHIDDeviceClosePtr = _lookup<
          ffi.NativeFunction<IOReturn Function(IOHIDDeviceRef, IOOptionBits)>>(
      'IOHIDDeviceClose');
  late final _IOHIDDeviceClose =
      _IOHIDDeviceClosePtr.asFunction<int Function(IOHIDDeviceRef, int)>();

  CFTypeRef IOHIDDeviceGetProperty(
    IOHIDDeviceRef device,
    pkg_corefoundation.CFStringRef key,
  ) {
    return _IOHIDDeviceGetProperty(
      device,
      key,
    );
  }

  late final _IOHIDDeviceGetPropertyPtr = _lookup<
      ffi.NativeFunction<
          CFTypeRef Function(IOHIDDeviceRef,
              pkg_corefoundation.CFStringRef)>>('IOHIDDeviceGetProperty');
  late final _IOHIDDeviceGetProperty = _IOHIDDeviceGetPropertyPtr.asFunction<
      CFTypeRef Function(IOHIDDeviceRef, pkg_corefoundation.CFStringRef)>();

  int IOHIDDeviceSetReport(
    IOHIDDeviceRef device,
    int reportType,
    int reportID,
    ffi.Pointer<ffi.Uint8> report,
    int reportLength,
  ) {
    return _IOHIDDeviceSetReport(
      device,
      reportType,
      reportID,
      report,
      reportLength,
    );
  }

  late final _IOHIDDeviceSetReportPtr = _lookup<
      ffi.NativeFunction<
          IOReturn Function(IOHIDDeviceRef, ffi.Int32, CFIndex,
              ffi.Pointer<ffi.Uint8>, CFIndex)>>('IOHIDDeviceSetReport');
  late final _IOHIDDeviceSetReport = _IOHIDDeviceSetReportPtr.asFunction<
      int Function(IOHIDDeviceRef, int, int, ffi.Pointer<ffi.Uint8>, int)>();

  IOHIDManagerRef IOHIDManagerCreate(
    pkg_corefoundation.CFAllocatorRef allocator,
    int options,
  ) {
    return _IOHIDManagerCreate(
      allocator,
      options,
    );
  }

  late final _IOHIDManagerCreatePtr = _lookup<
      ffi.NativeFunction<
          IOHIDManagerRef Function(pkg_corefoundation.CFAllocatorRef,
              IOOptionBits)>>('IOHIDManagerCreate');
  late final _IOHIDManagerCreate = _IOHIDManagerCreatePtr.asFunction<
      IOHIDManagerRef Function(pkg_corefoundation.CFAllocatorRef, int)>();

  int IOHIDManagerClose(
    IOHIDManagerRef manager,
    int options,
  ) {
    return _IOHIDManagerClose(
      manager,
      options,
    );
  }

  late final _IOHIDManagerClosePtr = _lookup<
          ffi.NativeFunction<IOReturn Function(IOHIDManagerRef, IOOptionBits)>>(
      'IOHIDManagerClose');
  late final _IOHIDManagerClose =
      _IOHIDManagerClosePtr.asFunction<int Function(IOHIDManagerRef, int)>();

  void IOHIDManagerSetDeviceMatching(
    IOHIDManagerRef manager,
    pkg_corefoundation.CFDictionaryRef matching,
  ) {
    return _IOHIDManagerSetDeviceMatching(
      manager,
      matching,
    );
  }

  late final _IOHIDManagerSetDeviceMatchingPtr = _lookup<
          ffi.NativeFunction<
              ffi.Void Function(
                  IOHIDManagerRef, pkg_corefoundation.CFDictionaryRef)>>(
      'IOHIDManagerSetDeviceMatching');
  late final _IOHIDManagerSetDeviceMatching =
      _IOHIDManagerSetDeviceMatchingPtr.asFunction<
          void Function(IOHIDManagerRef, pkg_corefoundation.CFDictionaryRef)>();

  pkg_corefoundation.CFSetRef IOHIDManagerCopyDevices(
    IOHIDManagerRef manager,
  ) {
    return _IOHIDManagerCopyDevices(
      manager,
    );
  }

  late final _IOHIDManagerCopyDevicesPtr = _lookup<
      ffi.NativeFunction<
          pkg_corefoundation.CFSetRef Function(
              IOHIDManagerRef)>>('IOHIDManagerCopyDevices');
  late final _IOHIDManagerCopyDevices = _IOHIDManagerCopyDevicesPtr.asFunction<
      pkg_corefoundation.CFSetRef Function(IOHIDManagerRef)>();

  int IOObjectRelease(
    io_object_t object,
  ) {
    return _IOObjectRelease(
      object,
    );
  }

  late final _IOObjectReleasePtr =
      _lookup<ffi.NativeFunction<kern_return_t Function(io_object_t)>>(
          'IOObjectRelease');
  late final _IOObjectRelease =
      _IOObjectReleasePtr.asFunction<int Function(io_object_t)>();

  io_registry_entry_t IORegistryEntryFromPath(
    mach_port_t masterPort,
    ffi.Pointer<pkg_ffi.Char> path,
  ) {
    return _IORegistryEntryFromPath(
      masterPort,
      path,
    );
  }

  late final _IORegistryEntryFromPathPtr = _lookup<
      ffi.NativeFunction<
          io_registry_entry_t Function(mach_port_t,
              ffi.Pointer<pkg_ffi.Char>)>>('IORegistryEntryFromPath');
  late final _IORegistryEntryFromPath = _IORegistryEntryFromPathPtr.asFunction<
      io_registry_entry_t Function(mach_port_t, ffi.Pointer<pkg_ffi.Char>)>();

  int IORegistryEntryGetPath(
    io_registry_entry_t entry,
    ffi.Pointer<pkg_ffi.Char> plane,
    ffi.Pointer<pkg_ffi.Char> path,
  ) {
    return _IORegistryEntryGetPath(
      entry,
      plane,
      path,
    );
  }

  late final _IORegistryEntryGetPathPtr = _lookup<
      ffi.NativeFunction<
          kern_return_t Function(io_registry_entry_t, ffi.Pointer<pkg_ffi.Char>,
              ffi.Pointer<pkg_ffi.Char>)>>('IORegistryEntryGetPath');
  late final _IORegistryEntryGetPath = _IORegistryEntryGetPathPtr.asFunction<
      int Function(io_registry_entry_t, ffi.Pointer<pkg_ffi.Char>,
          ffi.Pointer<pkg_ffi.Char>)>();
}

typedef IOHIDDeviceRef = ffi.Pointer<__IOHIDDevice>;

class __IOHIDDevice extends ffi.Opaque {}

typedef io_service_t = io_object_t;
typedef io_object_t = ffi.Pointer<OSObject>;

class OSObject extends ffi.Opaque {}

typedef IOReturn = kern_return_t;
typedef kern_return_t = pkg_ffi.Int;
typedef IOOptionBits = UInt32;
typedef UInt32 = pkg_ffi.UnsignedInt;
typedef CFTypeRef = ffi.Pointer<ffi.Void>;

abstract class IOHIDReportType {
  static const int kIOHIDReportTypeInput = 0;
  static const int kIOHIDReportTypeOutput = 1;
  static const int kIOHIDReportTypeFeature = 2;
  static const int kIOHIDReportTypeCount = 3;
}

typedef CFIndex = pkg_ffi.Long;
typedef IOHIDManagerRef = ffi.Pointer<__IOHIDManager>;

class __IOHIDManager extends ffi.Opaque {}

typedef io_registry_entry_t = io_object_t;
typedef mach_port_t = ipc_port_t;
typedef ipc_port_t = ffi.Pointer<ipc_port>;

class ipc_port extends ffi.Opaque {}

const int kIOReturnSuccess = 0;

const String kIOServicePlane = 'IOService';

const String kIOHIDVendorIDKey = 'VendorID';

const String kIOHIDProductIDKey = 'ProductID';

const String kIOHIDDeviceUsagePairsKey = 'DeviceUsagePairs';

const String kIOHIDDeviceUsageKey = 'DeviceUsage';

const String kIOHIDDeviceUsagePageKey = 'DeviceUsagePage';
