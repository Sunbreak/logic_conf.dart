// AUTO GENERATED FILE, DO NOT EDIT.
//
// Generated by `package:ffigen`.
import 'dart:ffi' as ffi;

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

  ffi.Pointer<IOHIDDeviceRef> IOHIDDeviceCreate(
    ffi.Pointer<CFAllocatorRef> allocator,
    ffi.Pointer<io_service_t> service,
  ) {
    return _IOHIDDeviceCreate(
      allocator,
      service,
    );
  }

  late final _IOHIDDeviceCreate_ptr =
      _lookup<ffi.NativeFunction<_c_IOHIDDeviceCreate>>('IOHIDDeviceCreate');
  late final _dart_IOHIDDeviceCreate _IOHIDDeviceCreate =
      _IOHIDDeviceCreate_ptr.asFunction<_dart_IOHIDDeviceCreate>();

  ffi.Pointer<io_service_t> IOHIDDeviceGetService(
    ffi.Pointer<IOHIDDeviceRef> device,
  ) {
    return _IOHIDDeviceGetService(
      device,
    );
  }

  late final _IOHIDDeviceGetService_ptr =
      _lookup<ffi.NativeFunction<_c_IOHIDDeviceGetService>>(
          'IOHIDDeviceGetService');
  late final _dart_IOHIDDeviceGetService _IOHIDDeviceGetService =
      _IOHIDDeviceGetService_ptr.asFunction<_dart_IOHIDDeviceGetService>();

  int IOHIDDeviceOpen(
    ffi.Pointer<IOHIDDeviceRef> device,
    int options,
  ) {
    return _IOHIDDeviceOpen(
      device,
      options,
    );
  }

  late final _IOHIDDeviceOpen_ptr =
      _lookup<ffi.NativeFunction<_c_IOHIDDeviceOpen>>('IOHIDDeviceOpen');
  late final _dart_IOHIDDeviceOpen _IOHIDDeviceOpen =
      _IOHIDDeviceOpen_ptr.asFunction<_dart_IOHIDDeviceOpen>();

  int IOHIDDeviceClose(
    ffi.Pointer<IOHIDDeviceRef> device,
    int options,
  ) {
    return _IOHIDDeviceClose(
      device,
      options,
    );
  }

  late final _IOHIDDeviceClose_ptr =
      _lookup<ffi.NativeFunction<_c_IOHIDDeviceClose>>('IOHIDDeviceClose');
  late final _dart_IOHIDDeviceClose _IOHIDDeviceClose =
      _IOHIDDeviceClose_ptr.asFunction<_dart_IOHIDDeviceClose>();

  ffi.Pointer<ffi.Void> IOHIDDeviceGetProperty(
    ffi.Pointer<IOHIDDeviceRef> device,
    ffi.Pointer<CFStringRef> key,
  ) {
    return _IOHIDDeviceGetProperty(
      device,
      key,
    );
  }

  late final _IOHIDDeviceGetProperty_ptr =
      _lookup<ffi.NativeFunction<_c_IOHIDDeviceGetProperty>>(
          'IOHIDDeviceGetProperty');
  late final _dart_IOHIDDeviceGetProperty _IOHIDDeviceGetProperty =
      _IOHIDDeviceGetProperty_ptr.asFunction<_dart_IOHIDDeviceGetProperty>();

  int IOHIDDeviceSetReport(
    ffi.Pointer<IOHIDDeviceRef> device,
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

  late final _IOHIDDeviceSetReport_ptr =
      _lookup<ffi.NativeFunction<_c_IOHIDDeviceSetReport>>(
          'IOHIDDeviceSetReport');
  late final _dart_IOHIDDeviceSetReport _IOHIDDeviceSetReport =
      _IOHIDDeviceSetReport_ptr.asFunction<_dart_IOHIDDeviceSetReport>();

  ffi.Pointer<IOHIDManagerRef> IOHIDManagerCreate(
    ffi.Pointer<CFAllocatorRef> allocator,
    int options,
  ) {
    return _IOHIDManagerCreate(
      allocator,
      options,
    );
  }

  late final _IOHIDManagerCreate_ptr =
      _lookup<ffi.NativeFunction<_c_IOHIDManagerCreate>>('IOHIDManagerCreate');
  late final _dart_IOHIDManagerCreate _IOHIDManagerCreate =
      _IOHIDManagerCreate_ptr.asFunction<_dart_IOHIDManagerCreate>();

  int IOHIDManagerClose(
    ffi.Pointer<IOHIDManagerRef> manager,
    int options,
  ) {
    return _IOHIDManagerClose(
      manager,
      options,
    );
  }

  late final _IOHIDManagerClose_ptr =
      _lookup<ffi.NativeFunction<_c_IOHIDManagerClose>>('IOHIDManagerClose');
  late final _dart_IOHIDManagerClose _IOHIDManagerClose =
      _IOHIDManagerClose_ptr.asFunction<_dart_IOHIDManagerClose>();

  void IOHIDManagerSetDeviceMatching(
    ffi.Pointer<IOHIDManagerRef> manager,
    ffi.Pointer<CFDictionaryRef> matching,
  ) {
    return _IOHIDManagerSetDeviceMatching(
      manager,
      matching,
    );
  }

  late final _IOHIDManagerSetDeviceMatching_ptr =
      _lookup<ffi.NativeFunction<_c_IOHIDManagerSetDeviceMatching>>(
          'IOHIDManagerSetDeviceMatching');
  late final _dart_IOHIDManagerSetDeviceMatching
      _IOHIDManagerSetDeviceMatching = _IOHIDManagerSetDeviceMatching_ptr
          .asFunction<_dart_IOHIDManagerSetDeviceMatching>();

  ffi.Pointer<CFSetRef> IOHIDManagerCopyDevices(
    ffi.Pointer<IOHIDManagerRef> manager,
  ) {
    return _IOHIDManagerCopyDevices(
      manager,
    );
  }

  late final _IOHIDManagerCopyDevices_ptr =
      _lookup<ffi.NativeFunction<_c_IOHIDManagerCopyDevices>>(
          'IOHIDManagerCopyDevices');
  late final _dart_IOHIDManagerCopyDevices _IOHIDManagerCopyDevices =
      _IOHIDManagerCopyDevices_ptr.asFunction<_dart_IOHIDManagerCopyDevices>();

  int IOObjectRelease(
    ffi.Pointer<io_service_t> object,
  ) {
    return _IOObjectRelease(
      object,
    );
  }

  late final _IOObjectRelease_ptr =
      _lookup<ffi.NativeFunction<_c_IOObjectRelease>>('IOObjectRelease');
  late final _dart_IOObjectRelease _IOObjectRelease =
      _IOObjectRelease_ptr.asFunction<_dart_IOObjectRelease>();

  ffi.Pointer<io_service_t> IORegistryEntryFromPath(
    ffi.Pointer<mach_port_t> masterPort,
    ffi.Pointer<ffi.Int8> path,
  ) {
    return _IORegistryEntryFromPath(
      masterPort,
      path,
    );
  }

  late final _IORegistryEntryFromPath_ptr =
      _lookup<ffi.NativeFunction<_c_IORegistryEntryFromPath>>(
          'IORegistryEntryFromPath');
  late final _dart_IORegistryEntryFromPath _IORegistryEntryFromPath =
      _IORegistryEntryFromPath_ptr.asFunction<_dart_IORegistryEntryFromPath>();

  int IORegistryEntryGetPath(
    ffi.Pointer<io_service_t> entry,
    ffi.Pointer<ffi.Int8> plane,
    ffi.Pointer<ffi.Int8> path,
  ) {
    return _IORegistryEntryGetPath(
      entry,
      plane,
      path,
    );
  }

  late final _IORegistryEntryGetPath_ptr =
      _lookup<ffi.NativeFunction<_c_IORegistryEntryGetPath>>(
          'IORegistryEntryGetPath');
  late final _dart_IORegistryEntryGetPath _IORegistryEntryGetPath =
      _IORegistryEntryGetPath_ptr.asFunction<_dart_IORegistryEntryGetPath>();
}

class IOHIDDeviceRef extends ffi.Opaque {}

class CFAllocatorRef extends ffi.Opaque {}

class io_service_t extends ffi.Opaque {}

class CFStringRef extends ffi.Opaque {}

class IOHIDManagerRef extends ffi.Opaque {}

class CFDictionaryRef extends ffi.Opaque {}

class CFSetRef extends ffi.Opaque {}

class mach_port_t extends ffi.Opaque {}

const int kIOReturnSuccess = 0;

const String kIOServicePlane = 'IOService';

const String kIOHIDVendorIDKey = 'VendorID';

const String kIOHIDProductIDKey = 'ProductID';

const String kIOHIDDeviceUsagePairsKey = 'DeviceUsagePairs';

const String kIOHIDDeviceUsageKey = 'DeviceUsage';

const String kIOHIDDeviceUsagePageKey = 'DeviceUsagePage';

typedef _c_IOHIDDeviceCreate = ffi.Pointer<IOHIDDeviceRef> Function(
  ffi.Pointer<CFAllocatorRef> allocator,
  ffi.Pointer<io_service_t> service,
);

typedef _dart_IOHIDDeviceCreate = ffi.Pointer<IOHIDDeviceRef> Function(
  ffi.Pointer<CFAllocatorRef> allocator,
  ffi.Pointer<io_service_t> service,
);

typedef _c_IOHIDDeviceGetService = ffi.Pointer<io_service_t> Function(
  ffi.Pointer<IOHIDDeviceRef> device,
);

typedef _dart_IOHIDDeviceGetService = ffi.Pointer<io_service_t> Function(
  ffi.Pointer<IOHIDDeviceRef> device,
);

typedef _c_IOHIDDeviceOpen = ffi.Int32 Function(
  ffi.Pointer<IOHIDDeviceRef> device,
  ffi.Uint32 options,
);

typedef _dart_IOHIDDeviceOpen = int Function(
  ffi.Pointer<IOHIDDeviceRef> device,
  int options,
);

typedef _c_IOHIDDeviceClose = ffi.Int32 Function(
  ffi.Pointer<IOHIDDeviceRef> device,
  ffi.Uint32 options,
);

typedef _dart_IOHIDDeviceClose = int Function(
  ffi.Pointer<IOHIDDeviceRef> device,
  int options,
);

typedef _c_IOHIDDeviceGetProperty = ffi.Pointer<ffi.Void> Function(
  ffi.Pointer<IOHIDDeviceRef> device,
  ffi.Pointer<CFStringRef> key,
);

typedef _dart_IOHIDDeviceGetProperty = ffi.Pointer<ffi.Void> Function(
  ffi.Pointer<IOHIDDeviceRef> device,
  ffi.Pointer<CFStringRef> key,
);

typedef _c_IOHIDDeviceSetReport = ffi.Int32 Function(
  ffi.Pointer<IOHIDDeviceRef> device,
  ffi.Int32 reportType,
  ffi.Int64 reportID,
  ffi.Pointer<ffi.Uint8> report,
  ffi.Int64 reportLength,
);

typedef _dart_IOHIDDeviceSetReport = int Function(
  ffi.Pointer<IOHIDDeviceRef> device,
  int reportType,
  int reportID,
  ffi.Pointer<ffi.Uint8> report,
  int reportLength,
);

typedef _c_IOHIDManagerCreate = ffi.Pointer<IOHIDManagerRef> Function(
  ffi.Pointer<CFAllocatorRef> allocator,
  ffi.Uint32 options,
);

typedef _dart_IOHIDManagerCreate = ffi.Pointer<IOHIDManagerRef> Function(
  ffi.Pointer<CFAllocatorRef> allocator,
  int options,
);

typedef _c_IOHIDManagerClose = ffi.Int32 Function(
  ffi.Pointer<IOHIDManagerRef> manager,
  ffi.Uint32 options,
);

typedef _dart_IOHIDManagerClose = int Function(
  ffi.Pointer<IOHIDManagerRef> manager,
  int options,
);

typedef _c_IOHIDManagerSetDeviceMatching = ffi.Void Function(
  ffi.Pointer<IOHIDManagerRef> manager,
  ffi.Pointer<CFDictionaryRef> matching,
);

typedef _dart_IOHIDManagerSetDeviceMatching = void Function(
  ffi.Pointer<IOHIDManagerRef> manager,
  ffi.Pointer<CFDictionaryRef> matching,
);

typedef _c_IOHIDManagerCopyDevices = ffi.Pointer<CFSetRef> Function(
  ffi.Pointer<IOHIDManagerRef> manager,
);

typedef _dart_IOHIDManagerCopyDevices = ffi.Pointer<CFSetRef> Function(
  ffi.Pointer<IOHIDManagerRef> manager,
);

typedef _c_IOObjectRelease = ffi.Int32 Function(
  ffi.Pointer<io_service_t> object,
);

typedef _dart_IOObjectRelease = int Function(
  ffi.Pointer<io_service_t> object,
);

typedef _c_IORegistryEntryFromPath = ffi.Pointer<io_service_t> Function(
  ffi.Pointer<mach_port_t> masterPort,
  ffi.Pointer<ffi.Int8> path,
);

typedef _dart_IORegistryEntryFromPath = ffi.Pointer<io_service_t> Function(
  ffi.Pointer<mach_port_t> masterPort,
  ffi.Pointer<ffi.Int8> path,
);

typedef _c_IORegistryEntryGetPath = ffi.Int32 Function(
  ffi.Pointer<io_service_t> entry,
  ffi.Pointer<ffi.Int8> plane,
  ffi.Pointer<ffi.Int8> path,
);

typedef _dart_IORegistryEntryGetPath = int Function(
  ffi.Pointer<io_service_t> entry,
  ffi.Pointer<ffi.Int8> plane,
  ffi.Pointer<ffi.Int8> path,
);
