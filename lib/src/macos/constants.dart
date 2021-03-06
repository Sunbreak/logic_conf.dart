import 'dart:ffi';

/* stdbool.h */
const True = 1;
const False = 0;


/* kern_return.h */
const KERN_SUCCESS = 0;


/* device_types.h */
const io_string_t_length = 512;


/* CoreFoundation */
final kCFAllocatorDefault = nullptr;

// TODO enum
const kCFNumberSInt32Type = 2;

// TODO enum
const kCFStringEncodingUTF8 = 0x08000100;


/* IOKit */
final kIOMasterPortDefault = nullptr;

// TODO enum
const kIOHIDOptionsTypeNone         = 0x00;
const kIOHIDOptionsTypeSeizeDevice  = 0x01;

// TODO enum
const kIOHIDReportTypeInput   = 0;
const kIOHIDReportTypeOutput  = 1;
const kIOHIDReportTypeFeature = 2;
const kIOHIDReportTypeCount   = 3;