import 'dart:ffi';

/* CoreFoundation */
final kCFAllocatorDefault = nullptr;


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