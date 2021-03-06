#include <CoreFoundation/CoreFoundation.h>

/* CFBase.h */
CF_EXPORT
CFTypeID CFGetTypeID(CFTypeRef cf);

CF_EXPORT
void CFRelease(CFTypeRef cf);


/* CFNumber.h */
CF_EXPORT
CFTypeID CFNumberGetTypeID(void);

CF_EXPORT
Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr);


/* CFArray.h */
CF_EXPORT
CFTypeID CFArrayGetTypeID(void);

CF_EXPORT
CFIndex CFArrayGetCount(CFArrayRef theArray);

CF_EXPORT
const void *CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx);


/* CFDictionary.h */
CF_EXPORT
CFTypeID CFDictionaryGetTypeID(void);

CF_EXPORT
Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value);


/* CFSet.h */
CF_EXPORT
CFIndex CFSetGetCount(CFSetRef theSet);

CF_EXPORT
void CFSetGetValues(CFSetRef theSet, const void **values);


/* CFString.h */
CF_EXPORT
CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding);