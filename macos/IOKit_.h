/* Darwin */
#include <IOKit/hid/IOHIDManager.h>
#include <IOKit/hid/IOHIDKeys.h>
#include <IOKit/IOKitLib.h>

#define kIOReturnSuccess         KERN_SUCCESS            // OK

#define MACH_PORT_NULL          0

/* IOKit/hid/IOHIDDevice.h */
CF_EXPORT
IOHIDDeviceRef _Nullable IOHIDDeviceCreate(
                                CFAllocatorRef _Nullable        allocator,
                                io_service_t                    service)
AVAILABLE_MAC_OS_X_VERSION_10_5_AND_LATER;

CF_EXPORT
io_service_t IOHIDDeviceGetService(
                                 IOHIDDeviceRef                  device)
AVAILABLE_MAC_OS_X_VERSION_10_6_AND_LATER;

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
CFTypeRef _Nullable IOHIDDeviceGetProperty(
                                IOHIDDeviceRef                  device, 
                                CFStringRef                     key)
AVAILABLE_MAC_OS_X_VERSION_10_5_AND_LATER;

CF_EXPORT
IOReturn IOHIDDeviceSetReport(
                                IOHIDDeviceRef                  device,
                                IOHIDReportType                 reportType,
                                CFIndex                         reportID,
                                const uint8_t *                 report,
                                CFIndex                         reportLength)
AVAILABLE_MAC_OS_X_VERSION_10_5_AND_LATER;


/* IOKit/IOKitKeys.h */
#define kIOServicePlane                 "IOService"


/* IOKit/hid/IOHIDDeviceKeys.h */
#define kIOHIDVendorIDKey "VendorID"

#define kIOHIDProductIDKey "ProductID"

#define kIOHIDDeviceUsagePairsKey "DeviceUsagePairs"

#define kIOHIDDeviceUsageKey "DeviceUsage"

#define kIOHIDDeviceUsagePageKey "DeviceUsagePage"


/* IOKit/hid/IOHIDManager.h */
CF_EXPORT 
IOHIDManagerRef IOHIDManagerCreate(     
                                CFAllocatorRef _Nullable        allocator,
                                IOOptionBits                    options)
AVAILABLE_MAC_OS_X_VERSION_10_5_AND_LATER;

CF_EXPORT
IOReturn IOHIDManagerClose(
                                IOHIDManagerRef                 manager,
                                IOOptionBits                    options)
AVAILABLE_MAC_OS_X_VERSION_10_5_AND_LATER;

CF_EXPORT
void IOHIDManagerSetDeviceMatching(
                                IOHIDManagerRef                 manager,
                                CFDictionaryRef _Nullable       matching)
AVAILABLE_MAC_OS_X_VERSION_10_5_AND_LATER;

CF_EXPORT
CFSetRef _Nullable IOHIDManagerCopyDevices(
                                IOHIDManagerRef                 manager)
AVAILABLE_MAC_OS_X_VERSION_10_5_AND_LATER;


/* IOKit/IOKitLib.h */
kern_return_t
IOObjectRelease(
	io_object_t	object );

io_registry_entry_t
IORegistryEntryFromPath(
	mach_port_t		masterPort,
	const io_string_t	path );

kern_return_t
IORegistryEntryGetPath(
	io_registry_entry_t	entry,
	const io_name_t         plane,
	io_string_t		path );