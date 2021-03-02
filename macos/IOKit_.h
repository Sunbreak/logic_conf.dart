/* Darwin */
#include <IOKit/hid/IOHIDManager.h>
#include <IOKit/IOKitLib.h>

#define kIOReturnSuccess         KERN_SUCCESS            // OK

/* IOKit/hid/IOHIDDevice.h */
CF_EXPORT
IOHIDDeviceRef _Nullable IOHIDDeviceCreate(
                                CFAllocatorRef _Nullable        allocator,
                                io_service_t                    service)
AVAILABLE_MAC_OS_X_VERSION_10_5_AND_LATER;

CF_EXPORT
IOReturn IOHIDDeviceOpen(          
                                IOHIDDeviceRef                  device, 
                                IOOptionBits                    options)
AVAILABLE_MAC_OS_X_VERSION_10_5_AND_LATER;

CF_EXPORT
IOReturn IOHIDDeviceClose(
                                IOHIDDeviceRef                  device, 
                                IOOptionBits                    options)
AVAILABLE_MAC_OS_X_VERSION_10_5_AND_LATER;

CF_EXPORT
IOReturn IOHIDDeviceSetReport(
                                IOHIDDeviceRef                  device,
                                IOHIDReportType                 reportType,
                                CFIndex                         reportID,
                                const uint8_t *                 report,
                                CFIndex                         reportLength)
AVAILABLE_MAC_OS_X_VERSION_10_5_AND_LATER;


/* IOKit/IOKitLib.h */
kern_return_t
IOObjectRelease(
	io_object_t	object );

io_registry_entry_t
IORegistryEntryFromPath(
	mach_port_t		masterPort,
	const io_string_t	path );
