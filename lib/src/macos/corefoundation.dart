// AUTO GENERATED FILE, DO NOT EDIT.
//
// Generated by `package:ffigen`.
import 'dart:ffi' as ffi;

/// Bindings to `CoreFoundation.h`.
class CoreFoundation {
  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  CoreFoundation(ffi.DynamicLibrary dynamicLibrary)
      : _lookup = dynamicLibrary.lookup;

  /// The symbols are looked up with [lookup].
  CoreFoundation.fromLookup(
      ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
          lookup)
      : _lookup = lookup;

  int CFGetTypeID(
    CFTypeRef cf,
  ) {
    return _CFGetTypeID(
      cf,
    );
  }

  late final _CFGetTypeIDPtr =
      _lookup<ffi.NativeFunction<CFTypeID Function(CFTypeRef)>>('CFGetTypeID');
  late final _CFGetTypeID =
      _CFGetTypeIDPtr.asFunction<int Function(CFTypeRef)>();

  void CFRelease(
    CFTypeRef cf,
  ) {
    return _CFRelease(
      cf,
    );
  }

  late final _CFReleasePtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(CFTypeRef)>>('CFRelease');
  late final _CFRelease = _CFReleasePtr.asFunction<void Function(CFTypeRef)>();

  int CFNumberGetTypeID() {
    return _CFNumberGetTypeID();
  }

  late final _CFNumberGetTypeIDPtr =
      _lookup<ffi.NativeFunction<CFTypeID Function()>>('CFNumberGetTypeID');
  late final _CFNumberGetTypeID =
      _CFNumberGetTypeIDPtr.asFunction<int Function()>();

  int CFNumberGetValue(
    CFNumberRef number,
    int theType,
    ffi.Pointer<ffi.Void> valuePtr,
  ) {
    return _CFNumberGetValue(
      number,
      theType,
      valuePtr,
    );
  }

  late final _CFNumberGetValuePtr = _lookup<
      ffi.NativeFunction<
          Boolean Function(CFNumberRef, CFNumberType,
              ffi.Pointer<ffi.Void>)>>('CFNumberGetValue');
  late final _CFNumberGetValue = _CFNumberGetValuePtr.asFunction<
      int Function(CFNumberRef, int, ffi.Pointer<ffi.Void>)>();

  int CFArrayGetTypeID() {
    return _CFArrayGetTypeID();
  }

  late final _CFArrayGetTypeIDPtr =
      _lookup<ffi.NativeFunction<CFTypeID Function()>>('CFArrayGetTypeID');
  late final _CFArrayGetTypeID =
      _CFArrayGetTypeIDPtr.asFunction<int Function()>();

  int CFArrayGetCount(
    CFArrayRef theArray,
  ) {
    return _CFArrayGetCount(
      theArray,
    );
  }

  late final _CFArrayGetCountPtr =
      _lookup<ffi.NativeFunction<CFIndex Function(CFArrayRef)>>(
          'CFArrayGetCount');
  late final _CFArrayGetCount =
      _CFArrayGetCountPtr.asFunction<int Function(CFArrayRef)>();

  ffi.Pointer<ffi.Void> CFArrayGetValueAtIndex(
    CFArrayRef theArray,
    int idx,
  ) {
    return _CFArrayGetValueAtIndex(
      theArray,
      idx,
    );
  }

  late final _CFArrayGetValueAtIndexPtr = _lookup<
      ffi.NativeFunction<
          ffi.Pointer<ffi.Void> Function(
              CFArrayRef, CFIndex)>>('CFArrayGetValueAtIndex');
  late final _CFArrayGetValueAtIndex = _CFArrayGetValueAtIndexPtr.asFunction<
      ffi.Pointer<ffi.Void> Function(CFArrayRef, int)>();

  int CFDictionaryGetTypeID() {
    return _CFDictionaryGetTypeID();
  }

  late final _CFDictionaryGetTypeIDPtr =
      _lookup<ffi.NativeFunction<CFTypeID Function()>>('CFDictionaryGetTypeID');
  late final _CFDictionaryGetTypeID =
      _CFDictionaryGetTypeIDPtr.asFunction<int Function()>();

  int CFDictionaryGetValueIfPresent(
    CFDictionaryRef theDict,
    ffi.Pointer<ffi.Void> key,
    ffi.Pointer<ffi.Pointer<ffi.Void>> value,
  ) {
    return _CFDictionaryGetValueIfPresent(
      theDict,
      key,
      value,
    );
  }

  late final _CFDictionaryGetValueIfPresentPtr = _lookup<
          ffi.NativeFunction<
              Boolean Function(CFDictionaryRef, ffi.Pointer<ffi.Void>,
                  ffi.Pointer<ffi.Pointer<ffi.Void>>)>>(
      'CFDictionaryGetValueIfPresent');
  late final _CFDictionaryGetValueIfPresent =
      _CFDictionaryGetValueIfPresentPtr.asFunction<
          int Function(CFDictionaryRef, ffi.Pointer<ffi.Void>,
              ffi.Pointer<ffi.Pointer<ffi.Void>>)>();

  int CFSetGetCount(
    CFSetRef theSet,
  ) {
    return _CFSetGetCount(
      theSet,
    );
  }

  late final _CFSetGetCountPtr =
      _lookup<ffi.NativeFunction<CFIndex Function(CFSetRef)>>('CFSetGetCount');
  late final _CFSetGetCount =
      _CFSetGetCountPtr.asFunction<int Function(CFSetRef)>();

  void CFSetGetValues(
    CFSetRef theSet,
    ffi.Pointer<ffi.Pointer<ffi.Void>> values,
  ) {
    return _CFSetGetValues(
      theSet,
      values,
    );
  }

  late final _CFSetGetValuesPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(
              CFSetRef, ffi.Pointer<ffi.Pointer<ffi.Void>>)>>('CFSetGetValues');
  late final _CFSetGetValues = _CFSetGetValuesPtr.asFunction<
      void Function(CFSetRef, ffi.Pointer<ffi.Pointer<ffi.Void>>)>();

  CFStringRef CFStringCreateWithCString(
    CFAllocatorRef alloc,
    ffi.Pointer<ffi.Char> cStr,
    int encoding,
  ) {
    return _CFStringCreateWithCString(
      alloc,
      cStr,
      encoding,
    );
  }

  late final _CFStringCreateWithCStringPtr = _lookup<
      ffi.NativeFunction<
          CFStringRef Function(CFAllocatorRef, ffi.Pointer<ffi.Char>,
              CFStringEncoding)>>('CFStringCreateWithCString');
  late final _CFStringCreateWithCString =
      _CFStringCreateWithCStringPtr.asFunction<
          CFStringRef Function(CFAllocatorRef, ffi.Pointer<ffi.Char>, int)>();
}

typedef CFTypeID = ffi.UnsignedLong;
typedef CFTypeRef = ffi.Pointer<ffi.Void>;
typedef Boolean = ffi.UnsignedChar;
typedef CFNumberRef = ffi.Pointer<__CFNumber>;

class __CFNumber extends ffi.Opaque {}

typedef CFNumberType = CFIndex;
typedef CFIndex = ffi.Long;
typedef CFArrayRef = ffi.Pointer<__CFArray>;

class __CFArray extends ffi.Opaque {}

typedef CFDictionaryRef = ffi.Pointer<__CFDictionary>;

class __CFDictionary extends ffi.Opaque {}

typedef CFSetRef = ffi.Pointer<__CFSet>;

class __CFSet extends ffi.Opaque {}

typedef CFStringRef = ffi.Pointer<__CFString>;

class __CFString extends ffi.Opaque {}

typedef CFAllocatorRef = ffi.Pointer<__CFAllocator>;

class __CFAllocator extends ffi.Opaque {}

typedef CFStringEncoding = UInt32;
typedef UInt32 = ffi.UnsignedInt;
