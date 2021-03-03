/* Unix */
#include <unistd.h>
#include <fcntl.h>

#define O_ACCMODE	   0003
#define O_RDONLY	     00
#define O_WRONLY	     01
#define O_RDWR		     02

// FIMXE https://github.com/dart-lang/sdk/issues/38578
// Need manully change name from `open2` to `open` after `ffigen`
extern int open2 (const char *__file, int __oflag) __nonnull ((1));

extern int close (int __fd);

extern ssize_t read (int __fd, void *__buf, size_t __nbytes) __wur;

extern ssize_t write (int __fd, const void *__buf, size_t __n) __wur;