/* Linux */
#include <libudev.h>

struct udev *udev_unref(struct udev *udev);
struct udev *udev_new(void);

struct udev_list_entry *udev_list_entry_get_next(struct udev_list_entry *list_entry);
const char *udev_list_entry_get_name(struct udev_list_entry *list_entry);

struct udev_device *udev_device_unref(struct udev_device *udev_device);
struct udev_device *udev_device_new_from_syspath(struct udev *udev, const char *syspath);

struct udev_device *udev_device_get_parent_with_subsystem_devtype(struct udev_device *udev_device,
                                                                  const char *subsystem, const char *devtype);

const char *udev_device_get_devnode(struct udev_device *udev_device);
const char *udev_device_get_sysattr_value(struct udev_device *udev_device, const char *sysattr);

struct udev_enumerate *udev_enumerate_unref(struct udev_enumerate *udev_enumerate);
struct udev_enumerate *udev_enumerate_new(struct udev *udev);

int udev_enumerate_add_match_subsystem(struct udev_enumerate *udev_enumerate, const char *subsystem);

int udev_enumerate_scan_devices(struct udev_enumerate *udev_enumerate);

struct udev_list_entry *udev_enumerate_get_list_entry(struct udev_enumerate *udev_enumerate);