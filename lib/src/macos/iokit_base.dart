import 'dart:ffi' as ffi;

typedef io_service_t = io_object_t;
typedef io_object_t = ffi.Pointer<OSObject>;

class OSObject extends ffi.Opaque {}

typedef mach_port_t = ipc_port_t;
typedef ipc_port_t = ffi.Pointer<ipc_port>;

class ipc_port extends ffi.Opaque {}