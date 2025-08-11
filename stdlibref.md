### `libc`

---

#### `EXIT_FAILURE`

```c3
const int EXIT_FAILURE = 1
```

---

#### `EXIT_SUCCESS`

```c3
const int EXIT_SUCCESS = 0
```

---

#### `RAND_MAX`

```c3
const int RAND_MAX = 0x7fffffff
```

---

#### `WChar`

```c3
alias WChar @if(env::WIN32) = Char16
```
```c3
alias WChar @if(!env::WIN32) = Char32
```

---

#### `DivResult`

```c3
struct DivResult
```

---

#### `LongDivResult`

```c3
struct LongDivResult
```

---

#### `Fpos_t`

```c3
struct Fpos_t @if(!env::WIN32)
```
```c3
alias Fpos_t @if(env::WIN32) = long
```

---

#### `Mbstate_t`

```c3
struct Mbstate_t @if(!env::WIN32)
```

---

#### `errno`

```c3
fn Errno errno()
```

---

#### `errno_set`

```c3
fn void errno_set(Errno e)
```

---

#### `Errno`

```c3
typedef Errno = inline CInt
```

---

#### `TerminateFunction`

```c3
alias TerminateFunction = fn void()
```

---

#### `CompareFunction`

```c3
alias CompareFunction = fn int(void*, void*)
```

---

#### `JmpBuf`

```c3
alias JmpBuf = uptr[$$JMP_BUF_SIZE]
```

---

#### `Fd`

```c3
alias Fd = CInt
```

---

#### `SignalFunction`

```c3
alias SignalFunction = fn void(CInt)
```

---

#### `SIGHUP`

```c3
const CInt SIGHUP = 1
```

---

#### `SIGINT`

```c3
const CInt SIGINT = 2
```

---

#### `SIGQUIT`

```c3
const CInt SIGQUIT = 3
```

---

#### `SIGILL`

```c3
const CInt SIGILL = 4
```

---

#### `SIGTRAP`

```c3
const CInt SIGTRAP = 5
```

---

#### `SIGABRT`

```c3
const CInt SIGABRT = 6
```

---

#### `SIGBUS`

```c3
const CInt SIGBUS = BSD_FLAVOR_SIG ? 10 : 7
```

---

#### `SIGFPE`

```c3
const CInt SIGFPE = 8
```

---

#### `SIGKILL`

```c3
const CInt SIGKILL = 9
```

---

#### `SIGSEGV`

```c3
const CInt SIGSEGV = 11
```

---

#### `SIGSYS`

```c3
const CInt SIGSYS = BSD_FLAVOR_SIG ? 12 : 31
```

---

#### `SIGPIPE`

```c3
const CInt SIGPIPE = 13
```

---

#### `SIGALRM`

```c3
const CInt SIGALRM = 14
```

---

#### `SIGTERM`

```c3
const CInt SIGTERM = 15
```

---

#### `SIGURG`

```c3
const CInt SIGURG = BSD_FLAVOR_SIG ? 16 : 23
```

---

#### `SIGSTOP`

```c3
const CInt SIGSTOP = BSD_FLAVOR_SIG ? 17 : 19
```

---

#### `SIGTSTP`

```c3
const CInt SIGTSTP = BSD_FLAVOR_SIG ? 18 : 20
```

---

#### `SIGCONT`

```c3
const CInt SIGCONT = BSD_FLAVOR_SIG ? 19 : 18
```

---

#### `SIGCHLD`

```c3
const CInt SIGCHLD = BSD_FLAVOR_SIG ? 20 : 17
```

---

#### `Time_t`

```c3
alias Time_t = $typefrom(env::WIN32 ? long.typeid : CLong.typeid)
```

---

#### `Off_t`

```c3
alias Off_t = $typefrom(env::WIN32 ? int.typeid : usz.typeid)
```

---

#### `CFile`

```c3
alias CFile = void*
```

---

#### `HAS_MALLOC_SIZE`

```c3
const HAS_MALLOC_SIZE = env::LINUX || env::ANDROID || env::WIN32 || env::DARWIN
```

---

#### `SEEK_SET`

```c3
const int SEEK_SET = 0
```

---

#### `SEEK_CUR`

```c3
const int SEEK_CUR = 1
```

---

#### `SEEK_END`

```c3
const int SEEK_END = 2
```

---

#### `_IOFBF`

```c3
const int _IOFBF = 0
```

---

#### `_IOLBF`

```c3
const int _IOLBF = 1
```

---

#### `_IONBF`

```c3
const int _IONBF = 2
```

---

#### `BUFSIZ`

```c3
const int BUFSIZ = 1024
```

---

#### `EOF`

```c3
const int EOF = -1
```

---

#### `FOPEN_MAX`

```c3
const int FOPEN_MAX = 20
```

---

#### `FILENAME_MAX`

```c3
const int FILENAME_MAX = 1024
```

---

#### `libc_S_ISTYPE`

```c3
macro bool libc_S_ISTYPE(value, mask) @builtin
```

---

#### `S_IFMT`

```c3
const S_IFMT   = 0o170000
```

---

#### `S_IFIFO`

```c3
const S_IFIFO  = 0o010000
```

---

#### `S_IFCHR`

```c3
const S_IFCHR  = 0o020000
```

---

#### `S_IFDIR`

```c3
const S_IFDIR  = 0o040000
```

---

#### `S_IFBLK`

```c3
const S_IFBLK  = 0o060000
```

---

#### `S_IFREG`

```c3
const S_IFREG  = 0o100000
```

---

#### `S_IFLNK`

```c3
const S_IFLNK  = 0o120000
```

---

#### `S_IFSOCK`

```c3
const S_IFSOCK = 0o140000
```

---

#### `S_ISUID`

```c3
const S_ISUID  = 0o004000
```

---

#### `S_ISGID`

```c3
const S_ISGID  = 0o002000
```

---

#### `S_ISVTX`

```c3
const S_ISVTX  = 0o001000
```

---

#### `S_IRUSR`

```c3
const S_IRUSR  = 0o000400
```

---

#### `S_IWUSR`

```c3
const S_IWUSR  = 0o000200
```

---

#### `S_IXUSR`

```c3
const S_IXUSR  = 0o000100
```

---

#### `SeekIndex`

```c3
alias SeekIndex = CLong
```

---

#### `Tm`

```c3
struct Tm
```

---

#### `TimeSpec`

```c3
struct TimeSpec
```

---

#### `Clock_t`

```c3
alias Clock_t @if(env::WIN32) = int
```
```c3
alias Clock_t @if(!env::WIN32) = CLong
```

---

#### `TimeOffset`

```c3
alias TimeOffset @if(env::WASI) = int
```
```c3
alias TimeOffset @if(!env::WASI) = CLong
```

---

#### `TIME_UTC`

```c3
const int TIME_UTC = 1
```

---

#### `@if(env::WIN32)`

```c3
const CLOCKS_PER_SEC @if(env::WIN32) = 1000
```

---

#### `@if(!env::WIN32)`

```c3
const CLOCKS_PER_SEC @if(!env::WIN32) = 1000000
```

---

#### `NanoDuration.to_timespec`

```c3
<*
 @require self >= time::NANO_DURATION_ZERO
*>
fn TimeSpec NanoDuration.to_timespec(self) @inline
```

Return a "timespec" from a duration.


---

#### `Duration.to_timespec`

```c3
<*
 @require self >= time::DURATION_ZERO
*>
fn TimeSpec Duration.to_timespec(self) @inline
```

Convert a duration to a timespec.


---

#### `Time.to_timespec`

```c3
fn TimeSpec Time.to_timespec(self) @inline
```

Convert a timestamp to a timespec.

### `libc @if(!env::LIBC)`

---

#### `longjmp`

```c3
fn void longjmp(JmpBuf* buffer, CInt value) @weak @extern("longjmp") @nostrip
```

---

#### `setjmp`

```c3
fn CInt setjmp(JmpBuf* buffer) @weak @extern("setjmp") @nostrip
```

---

#### `malloc`

```c3
fn void* malloc(usz size) @weak @extern("malloc") @nostrip
```

---

#### `calloc`

```c3
fn void* calloc(usz count, usz size) @weak @extern("calloc") @nostrip
```

---

#### `free`

```c3
fn void* free(void*) @weak @extern("free")
```

---

#### `realloc`

```c3
fn void* realloc(void* ptr, usz size) @weak @extern("realloc") @nostrip
```

---

#### `memcpy`

```c3
fn void* memcpy(void* dest, void* src, usz n) @weak @extern("memcpy") @nostrip
```

---

#### `memmove`

```c3
fn void* memmove(void* dest, void* src, usz n) @weak @extern("memmove") @nostrip
```

---

#### `memset`

```c3
fn void* memset(void* dest, CInt value, usz n) @weak @extern("memset") @nostrip
```

---

#### `fseek`

```c3
fn int fseek(CFile stream, SeekIndex offset, int whence) @weak @extern("fseek") @nostrip
```

---

#### `fopen`

```c3
fn CFile fopen(ZString filename, ZString mode) @weak @extern("fopen") @nostrip
```

---

#### `freopen`

```c3
fn CFile freopen(ZString filename, ZString mode, CFile stream) @weak @extern("fopen") @nostrip
```

---

#### `fwrite`

```c3
fn usz fwrite(void* ptr, usz size, usz nmemb, CFile stream) @weak @extern("fwrite") @nostrip
```

---

#### `fread`

```c3
fn usz fread(void* ptr, usz size, usz nmemb, CFile stream) @weak @extern("fread") @nostrip
```

---

#### `fclose`

```c3
fn CFile fclose(CFile) @weak @extern("fclose") @nostrip
```

---

#### `fflush`

```c3
fn int fflush(CFile stream) @weak @extern("fflush") @nostrip
```

---

#### `fputc`

```c3
fn int fputc(int c, CFile stream) @weak @extern("fputc") @nostrip
```

---

#### `fgets`

```c3
fn char* fgets(ZString str, int n, CFile stream) @weak @extern("fgets") @nostrip
```

---

#### `fgetc`

```c3
fn int fgetc(CFile stream) @weak @extern("fgetc") @nostrip
```

---

#### `feof`

```c3
fn int feof(CFile stream) @weak @extern("feof") @nostrip
```

---

#### `putc`

```c3
fn int putc(int c, CFile stream) @weak @extern("putc") @nostrip
```

---

#### `putchar`

```c3
fn int putchar(int c) @weak @extern("putchar") @nostrip
```

---

#### `puts`

```c3
fn int puts(ZString str) @weak @extern("puts") @nostrip
```
### `libc @if(env::ANDROID)`

---

#### `Blksize_t`

```c3
alias Blksize_t = $typefrom(env::X86_64 ? long.typeid : CInt.typeid)
```

---

#### `Nlink_t`

```c3
alias Nlink_t = $typefrom(env::X86_64 ? ulong.typeid : CUInt.typeid)
```

---

#### `Blkcnt_t`

```c3
alias Blkcnt_t = long
```

---

#### `Ino_t`

```c3
alias Ino_t = ulong
```

---

#### `Dev_t`

```c3
alias Dev_t = ulong
```

---

#### `Mode_t`

```c3
alias Mode_t = uint
```

---

#### `Ino`

```c3
alias Ino64_t = ulong
```

---

#### `Blkcnt`

```c3
alias Blkcnt64_t = long
```

---

#### `Stat`

```c3
struct Stat @if(env::X86_64)
```
```c3
struct Stat @if(!env::X86_64)
```

---

#### `stat`

```c3
extern fn CInt stat(ZString path, Stat* stat)
```
### `libc @if(env::DARWIN || env::FREEBSD)`

---

#### `malloc_size`

```c3
extern fn usz malloc_size(void* ptr) @if(!env::FREEBSD)
```

---

#### `stdout`

```c3
macro CFile stdout()
```

---

#### `stderr`

```c3
macro CFile stderr()
```
### `libc @if(env::DARWIN)`

---

#### `Dev_t`

```c3
alias Dev_t = int
```

---

#### `Mode_t`

```c3
alias Mode_t = ushort
```

---

#### `Nlink_t`

```c3
alias Nlink_t = ushort
```

---

#### `Blkcnt_t`

```c3
alias Blkcnt_t = long
```

---

#### `Blksize_t`

```c3
alias Blksize_t = int
```

---

#### `Ino_t`

```c3
alias Ino_t = ulong
```

---

#### `Stat`

```c3
struct Stat
```

---

#### `stat`

```c3
extern fn int stat(ZString str, Stat* stat) @extern("stat64")
```
### `libc @if(env::FREEBSD)`

---

#### `Blksize_t`

```c3
alias Blksize_t = int
```

---

#### `Nlink_t`

```c3
alias Nlink_t = $typefrom(env::X86_64 ? ulong.typeid : CUInt.typeid)
```

---

#### `Dev_t`

```c3
alias Dev_t = ulong
```

---

#### `Ino_t`

```c3
alias Ino_t = ulong
```

---

#### `Mode_t`

```c3
alias Mode_t = ushort
```

---

#### `Blkcnt_t`

```c3
alias Blkcnt_t = long
```

---

#### `Fflags_t`

```c3
alias Fflags_t = uint
```

---

#### `Stat`

```c3
struct Stat @if(env::X86_64)
```
```c3
struct Stat @if(!env::X86_64)
```

---

#### `stat`

```c3
extern fn CInt stat(ZString path, Stat* stat)
```
### `libc @if(env::LIBC)`

---

#### `abort`

```c3
extern fn void abort()
```

---

#### `stdout`

```c3
macro CFile stdout()
```

---

#### `stderr`

```c3
macro CFile stderr()
```
### `libc @if(env::LINUX)`

---

#### `Blksize_t`

```c3
alias Blksize_t = $typefrom(env::X86_64 ? long.typeid : CInt.typeid)
```

---

#### `Nlink_t`

```c3
alias Nlink_t = $typefrom(env::X86_64 ? ulong.typeid : CUInt.typeid)
```

---

#### `Blkcnt_t`

```c3
alias Blkcnt_t = long
```

---

#### `Ino_t`

```c3
alias Ino_t = ulong
```

---

#### `Dev_t`

```c3
alias Dev_t = ulong
```

---

#### `Mode_t`

```c3
alias Mode_t = uint
```

---

#### `Ino`

```c3
alias Ino64_t = ulong
```

---

#### `Blkcnt`

```c3
alias Blkcnt64_t = long
```

---

#### `Stat`

```c3
struct Stat @if(env::X86_64)
```
```c3
struct Stat @if(!env::X86_64)
```

---

#### `stat`

```c3
extern fn CInt stat(ZString path, Stat* stat)
```
### `libc @if(env::OPENBSD)`

---

#### `Blksize_t`

```c3
alias Blksize_t = int
```

---

#### `Nlink_t`

```c3
alias Nlink_t = $typefrom(env::X86_64 ? uint.typeid : CUInt.typeid)
```

---

#### `Dev_t`

```c3
alias Dev_t = int
```

---

#### `Ino_t`

```c3
alias Ino_t = ulong
```

---

#### `Mode_t`

```c3
alias Mode_t = uint
```

---

#### `Blkcnt_t`

```c3
alias Blkcnt_t = long
```

---

#### `Fflags_t`

```c3
alias Fflags_t = uint
```

---

#### `Stat`

```c3
struct Stat @if(env::X86_64)
```
```c3
struct Stat @if(!env::X86_64)
```

---

#### `stat`

```c3
extern fn CInt stat(ZString path, Stat* stat)
```
### `libc @if(env::POSIX)`

---

#### `SHUT_RD`

```c3
const CInt SHUT_RD = 0
```

---

#### `SHUT_WR`

```c3
const CInt SHUT_WR = 1
```

---

#### `SHUT_RDWR`

```c3
const CInt SHUT_RDWR = 2
```

---

#### `shutdown`

```c3
extern fn CInt shutdown(Fd sockfd, CInt how)
```

---

#### `Stack_t`

```c3
struct Stack_t
```

---

#### `sigaltstack`

```c3
extern fn CInt sigaltstack(Stack_t* ss, Stack_t* old_ss)
```
### `libc @if(env::WIN32)`

---

#### `fdopen`

```c3
alias fdopen = _fdopen
```

---

#### `close`

```c3
alias close = _close
```

---

#### `fileno`

```c3
alias fileno = _fileno
```

---

#### `isatty`

```c3
alias isatty = _isatty
```

---

#### `difftime`

```c3
alias difftime = _difftime64
```

---

#### `fseek`

```c3
alias fseek = _fseeki64
```

---

#### `ftell`

```c3
alias ftell = _ftelli64
```

---

#### `timegm`

```c3
alias timegm = _mkgmtime64
```

---

#### `mktime`

```c3
alias mktime = _mktime64
```

---

#### `__acrt_iob_func`

```c3
extern fn CFile __acrt_iob_func(CInt c)
```

---

#### `get_system_info`

```c3
extern fn CInt get_system_info(SystemInfo*) @extern("GetSystemInfo")
```
### `libc::errno`

---

#### `OK`

```c3
const Errno OK                       = 0
```

---

#### `EPERM`

```c3
const Errno EPERM                    = 1
```

---

#### `ENOENT`

```c3
const Errno ENOENT                   = 2
```

---

#### `ESRCH`

```c3
const Errno ESRCH                    = 3
```

---

#### `EINTR`

```c3
const Errno EINTR                    = 4
```

---

#### `EIO`

```c3
const Errno EIO                      = 5
```

---

#### `ENXIO`

```c3
const Errno ENXIO                    = 6
```

---

#### `E2BIG`

```c3
const Errno E2BIG                    = 7
```

---

#### `ENOEXEC`

```c3
const Errno ENOEXEC                  = 8
```

---

#### `EBADF`

```c3
const Errno EBADF                    = 9
```

---

#### `ECHILD`

```c3
const Errno ECHILD                   = 10
```

---

#### `@if(env::DARWIN)`

```c3
const Errno EAGAIN @if(env::DARWIN)  = 35
```

---

#### `@if(!env::DARWIN)`

```c3
const Errno EAGAIN @if(!env::DARWIN) = 11
```

---

#### `ENOMEM`

```c3
const Errno ENOMEM                   = 12
```

---

#### `EACCES`

```c3
const Errno EACCES                   = 13
```

---

#### `EFAULT`

```c3
const Errno EFAULT                   = 14
```

---

#### `ENOTBLK`

```c3
const Errno ENOTBLK                  = 15
```

---

#### `EBUSY`

```c3
const Errno EBUSY                    = 16
```

---

#### `EEXIST`

```c3
const Errno EEXIST                   = 17
```

---

#### `EXDEV`

```c3
const Errno EXDEV                    = 18
```

---

#### `ENODEV`

```c3
const Errno ENODEV                   = 19
```

---

#### `ENOTDIR`

```c3
const Errno ENOTDIR                  = 20
```

---

#### `EISDIR`

```c3
const Errno EISDIR                   = 21
```

---

#### `EINVAL`

```c3
const Errno EINVAL                   = 22
```

---

#### `ENFILE`

```c3
const Errno ENFILE                   = 23
```

---

#### `EMFILE`

```c3
const Errno EMFILE                   = 24
```

---

#### `ENOTTY`

```c3
const Errno ENOTTY                   = 25
```

---

#### `ETXTBSY`

```c3
const Errno ETXTBSY                  = 26
```

---

#### `EFBIG`

```c3
const Errno EFBIG                    = 27
```

---

#### `ENOSPC`

```c3
const Errno ENOSPC                   = 28
```

---

#### `ESPIPE`

```c3
const Errno ESPIPE                   = 29
```

---

#### `EROFS`

```c3
const Errno EROFS                    = 30
```

---

#### `EMLINK`

```c3
const Errno EMLINK                   = 31
```

---

#### `EPIPE`

```c3
const Errno EPIPE                    = 32
```

---

#### `EDOM`

```c3
const Errno EDOM                     = 33
```

---

#### `ERANGE`

```c3
const Errno ERANGE                   = 34
```
### `libc::errno @if(!env::WIN32 && !env::DARWIN)`

---

#### `EDEADLK`

```c3
const Errno EDEADLK                  = 35
```

---

#### `ENAMETOOLONG`

```c3
const Errno ENAMETOOLONG             = 36
```

---

#### `ENOTEMPTY`

```c3
const Errno ENOTEMPTY                = 39
```

---

#### `ELOOP`

```c3
const Errno ELOOP                    = 40
```

---

#### `EWOULDBLOCK`

```c3
const Errno EWOULDBLOCK              = EAGAIN
```

---

#### `EOVERFLOW`

```c3
const Errno EOVERFLOW                = 75
```

---

#### `ENOTSOCK`

```c3
const Errno ENOTSOCK                 = 88
```

---

#### `EOPNOTSUPP`

```c3
const Errno EOPNOTSUPP               = 95
```

---

#### `EADDRINUSE`

```c3
const Errno EADDRINUSE               = 98
```

---

#### `EADDRNOTAVAIL`

```c3
const Errno EADDRNOTAVAIL            = 99
```

---

#### `ENETDOWN`

```c3
const Errno ENETDOWN                 = 100
```

---

#### `ENETUNREACH`

```c3
const Errno ENETUNREACH              = 101
```

---

#### `ENETRESET`

```c3
const Errno ENETRESET                = 102
```

---

#### `ECONNRESET`

```c3
const Errno ECONNRESET               = 104
```

---

#### `EISCONN`

```c3
const Errno EISCONN                  = 106
```

---

#### `ETIMEDOUT`

```c3
const Errno ETIMEDOUT                = 110
```

---

#### `ECONNREFUSED`

```c3
const Errno ECONNREFUSED             = 111
```

---

#### `EALREADY`

```c3
const Errno EALREADY                 = 114
```

---

#### `EINPROGRESS`

```c3
const Errno EINPROGRESS              = 115
```

---

#### `EDQUOT`

```c3
const Errno EDQUOT                   = 122
```
### `libc::errno @if(env::DARWIN)`

---

#### `EWOULDBLOCK`

```c3
const Errno EWOULDBLOCK              = EAGAIN
```

---

#### `EDEADLK`

```c3
const Errno EDEADLK                  = 11
```

---

#### `EINPROGRESS`

```c3
const Errno EINPROGRESS              = 36
```

---

#### `EALREADY`

```c3
const Errno EALREADY                 = 37
```

---

#### `ENOTSOCK`

```c3
const Errno ENOTSOCK                 = 38
```

---

#### `EDESTADDRREQ`

```c3
const Errno EDESTADDRREQ             = 39
```

---

#### `EMSGSIZE`

```c3
const Errno EMSGSIZE                 = 40
```

---

#### `EPROTOTYPE`

```c3
const Errno EPROTOTYPE               = 41
```

---

#### `ENOPROTOOPT`

```c3
const Errno ENOPROTOOPT              = 42
```

---

#### `EPROTONOSUPPORT`

```c3
const Errno EPROTONOSUPPORT          = 43
```

---

#### `ESOCKTNOSUPPORT`

```c3
const Errno ESOCKTNOSUPPORT          = 44
```

---

#### `ENOTSUP`

```c3
const Errno ENOTSUP                  = 45
```

---

#### `EPFNOSUPPORT`

```c3
const Errno EPFNOSUPPORT             = 46
```

---

#### `EAFNOSUPPORT`

```c3
const Errno EAFNOSUPPORT             = 47
```

---

#### `EADDRINUSE`

```c3
const Errno EADDRINUSE               = 48
```

---

#### `EADDRNOTAVAIL`

```c3
const Errno EADDRNOTAVAIL            = 49
```

---

#### `ENETDOWN`

```c3
const Errno ENETDOWN                 = 50
```

---

#### `ENETUNREACH`

```c3
const Errno ENETUNREACH              = 51
```

---

#### `ENETRESET`

```c3
const Errno ENETRESET                = 52
```

---

#### `ECONNABORTED`

```c3
const Errno ECONNABORTED             = 53
```

---

#### `ECONNRESET`

```c3
const Errno ECONNRESET               = 54
```

---

#### `ENOBUFS`

```c3
const Errno ENOBUFS                  = 55
```

---

#### `EISCONN`

```c3
const Errno EISCONN                  = 56
```

---

#### `ENOTCONN`

```c3
const Errno ENOTCONN                 = 57
```

---

#### `ESHUTDOWN`

```c3
const Errno ESHUTDOWN                = 58
```

---

#### `ETIMEDOUT`

```c3
const Errno ETIMEDOUT                = 60
```

---

#### `ECONNREFUSED`

```c3
const Errno ECONNREFUSED             = 61
```

---

#### `ELOOP`

```c3
const Errno ELOOP                    = 62
```

---

#### `ENAMETOOLONG`

```c3
const Errno ENAMETOOLONG             = 63
```

---

#### `EHOSTDOWN`

```c3
const Errno EHOSTDOWN                = 64
```

---

#### `EHOSTUNREACH`

```c3
const Errno EHOSTUNREACH             = 65
```

---

#### `ENOTEMPTY`

```c3
const Errno ENOTEMPTY                = 66
```

---

#### `EPROCLIM`

```c3
const Errno EPROCLIM                 = 67
```

---

#### `EUSERS`

```c3
const Errno EUSERS                   = 68
```

---

#### `EDQUOT`

```c3
const Errno EDQUOT                   = 69
```

---

#### `ESTALE`

```c3
const Errno ESTALE                   = 70
```

---

#### `EBADRPC`

```c3
const Errno EBADRPC                  = 72
```

---

#### `ERPCMISMATCH`

```c3
const Errno ERPCMISMATCH             = 73
```

---

#### `EPROGUNAVAIL`

```c3
const Errno EPROGUNAVAIL             = 74
```

---

#### `EPROGMISMATCH`

```c3
const Errno EPROGMISMATCH            = 75
```

---

#### `EPROCUNAVAIL`

```c3
const Errno EPROCUNAVAIL             = 76
```

---

#### `ENOLCK`

```c3
const Errno ENOLCK                   = 77
```

---

#### `ENOSYS`

```c3
const Errno ENOSYS                   = 78
```

---

#### `EFTYPE`

```c3
const Errno EFTYPE                   = 79
```

---

#### `EAUTH`

```c3
const Errno EAUTH                    = 80
```

---

#### `ENEEDAUTH`

```c3
const Errno ENEEDAUTH                = 81
```

---

#### `EPWROFF`

```c3
const Errno EPWROFF                  = 82
```

---

#### `EDEVERR`

```c3
const Errno EDEVERR                  = 83
```

---

#### `EOVERFLOW`

```c3
const Errno EOVERFLOW                = 84
```

---

#### `EBADEXEC`

```c3
const Errno EBADEXEC                 = 85
```

---

#### `EBADARCH`

```c3
const Errno EBADARCH                 = 86
```

---

#### `ESHLIBVERS`

```c3
const Errno ESHLIBVERS               = 87
```

---

#### `EBADMACHO`

```c3
const Errno EBADMACHO                = 88
```

---

#### `ECANCELED`

```c3
const Errno ECANCELED                = 89
```

---

#### `EIDRM`

```c3
const Errno EIDRM                    = 90
```

---

#### `ENOMSG`

```c3
const Errno ENOMSG                   = 91
```

---

#### `EILSEQ`

```c3
const Errno EILSEQ                   = 92
```

---

#### `ENOATTR`

```c3
const Errno ENOATTR                  = 93
```

---

#### `EBADMSG`

```c3
const Errno EBADMSG                  = 94
```

---

#### `EMULTIHOP`

```c3
const Errno EMULTIHOP                = 95
```

---

#### `ENODATA`

```c3
const Errno ENODATA                  = 96
```

---

#### `ENOLINK`

```c3
const Errno ENOLINK                  = 97
```

---

#### `ENOSR`

```c3
const Errno ENOSR                    = 98
```

---

#### `ENOSTR`

```c3
const Errno ENOSTR                   = 99
```

---

#### `EPROTO`

```c3
const Errno EPROTO                   = 100
```

---

#### `ETIME`

```c3
const Errno ETIME                    = 101
```

---

#### `EOPNOTSUPP`

```c3
const Errno EOPNOTSUPP               = 102
```
### `libc::errno @if(env::WIN32)`

---

#### `EDEADLK`

```c3
const Errno EDEADLK                  = 36
```

---

#### `ENAMETOOLONG`

```c3
const Errno ENAMETOOLONG             = 38
```

---

#### `ENOTEMPTY`

```c3
const Errno ENOTEMPTY                = 41
```

---

#### `ELOOP`

```c3
const Errno ELOOP                    = 114
```

---

#### `EOVERFLOW`

```c3
const Errno EOVERFLOW                = 132
```

---

#### `ENETDOWN`

```c3
const Errno ENETDOWN                 = 116
```

---

#### `ECONNRESET`

```c3
const Errno ECONNRESET               = 108
```

---

#### `ENETUNREACH`

```c3
const Errno ENETUNREACH              = 118
```

---

#### `ENETRESET`

```c3
const Errno ENETRESET                = 117
```

---

#### `EOPNOTSUPP`

```c3
const Errno EOPNOTSUPP               = 130
```

---

#### `ETIMEDOUT`

```c3
const Errno ETIMEDOUT                = 138
```

---

#### `EALREADY`

```c3
const Errno EALREADY                 = 103
```

---

#### `EINPROGRESS`

```c3
const Errno EINPROGRESS              = 112
```

---

#### `EDQUOT`

```c3
const Errno EDQUOT                   = -122
```

---

#### `EWOULDBLOCK`

```c3
const Errno EWOULDBLOCK              = 140
```
### `libc::os @if(env::LIBC)`

---

#### `__errno_location`

```c3
extern fn int* __errno_location() @if(env::LINUX)
```

---

#### `errno_set`

```c3
macro void errno_set(int err) @if(env::WIN32)
```

---

#### `_get_errno`

```c3
extern fn void _get_errno(int* result) @if(env::WIN32)
```
### `libc::termios @if(!env::LIBC ||| !env::POSIX)`

---

#### `Cc`

```c3
typedef Cc = char
```

---

#### `Speed`

```c3
typedef Speed = CUInt
```

---

#### `Tcflags`

```c3
typedef Tcflags = CUInt
```

---

#### `Termios`

```c3
struct Termios
```

---

#### `tcgetattr`

```c3
fn CInt tcgetattr(Fd fd, Termios* self)
```

---

#### `tcsetattr`

```c3
fn CInt tcsetattr(Fd fd, CInt optional_actions, Termios* self)
```

---

#### `tcsendbreak`

```c3
fn CInt tcsendbreak(Fd fd, CInt duration)
```

---

#### `tcdrain`

```c3
fn CInt tcdrain(Fd fd)
```

---

#### `tcflush`

```c3
fn CInt tcflush(Fd fd, CInt queue_selector)
```

---

#### `tcflow`

```c3
fn CInt tcflow(Fd fd, CInt action)
```

---

#### `cfgetospeed`

```c3
fn Speed cfgetospeed(Termios* self)
```

---

#### `cfgetispeed`

```c3
fn Speed cfgetispeed(Termios* self)
```

---

#### `cfsetospeed`

```c3
fn CInt cfsetospeed(Termios* self, Speed speed)
```

---

#### `cfsetispeed`

```c3
fn CInt cfsetispeed(Termios* self, Speed speed)
```

---

#### `sendBreak`

```c3
fn int sendBreak(Fd fd, int duration)
```

---

#### `drain`

```c3
fn int drain(Fd fd)
```

---

#### `flush`

```c3
fn int flush(Fd fd, int queue_selector)
```

---

#### `flow`

```c3
fn int flow(Fd fd, int action)
```

---

#### `Termios.getOSpeed`

```c3
fn Speed Termios.getOSpeed(Termios* self)
```

---

#### `Termios.getISpeed`

```c3
fn Speed Termios.getISpeed(Termios* self)
```

---

#### `Termios.setOSpeed`

```c3
fn int Termios.setOSpeed(Termios* self, Speed speed)
```

---

#### `Termios.setISpeed`

```c3
fn int Termios.setISpeed(Termios* self, Speed speed)
```

---

#### `Termios.getAttr`

```c3
fn int Termios.getAttr(Termios* self, Fd fd)
```

---

#### `Termios.setAttr`

```c3
fn int Termios.setAttr(Termios* self, Fd fd, int optional_actions)
```
### `libc::termios @if(env::LIBC &&& env::POSIX)`

---

#### `sendBreak`

```c3
fn int sendBreak(Fd fd, int duration)
```

---

#### `drain`

```c3
fn int drain(Fd fd)
```

---

#### `flush`

```c3
fn int flush(Fd fd, int queue_selector)
```

---

#### `flow`

```c3
fn int flow(Fd fd, int action)
```

---

#### `Termios.getOSpeed`

```c3
fn Speed Termios.getOSpeed(Termios* self)
```

---

#### `Termios.getISpeed`

```c3
fn Speed Termios.getISpeed(Termios* self)
```

---

#### `Termios.setOSpeed`

```c3
fn int Termios.setOSpeed(Termios* self, Speed speed)
```

---

#### `Termios.setISpeed`

```c3
fn int Termios.setISpeed(Termios* self, Speed speed)
```

---

#### `Termios.getAttr`

```c3
fn int Termios.getAttr(Termios* self, Fd fd)
```

---

#### `Termios.setAttr`

```c3
fn int Termios.setAttr(Termios* self, Fd fd, Tcactions optional_actions)
```
### `std::ascii`

---

#### `in_range_m`

```c3
macro bool in_range_m(c, start, len)
```

---

#### `is_lower_m`

```c3
macro bool is_lower_m(c)
```

---

#### `is_upper_m`

```c3
macro bool is_upper_m(c)
```

---

#### `is_digit_m`

```c3
macro bool is_digit_m(c)
```

---

#### `is_bdigit_m`

```c3
macro bool is_bdigit_m(c)
```

---

#### `is_odigit_m`

```c3
macro bool is_odigit_m(c)
```

---

#### `is_xdigit_m`

```c3
macro bool is_xdigit_m(c)
```

---

#### `is_alpha_m`

```c3
macro bool is_alpha_m(c)
```

---

#### `is_print_m`

```c3
macro bool is_print_m(c)
```

---

#### `is_graph_m`

```c3
macro bool is_graph_m(c)
```

---

#### `is_space_m`

```c3
macro bool is_space_m(c)
```

---

#### `is_alnum_m`

```c3
macro bool is_alnum_m(c)
```

---

#### `is_punct_m`

```c3
macro bool is_punct_m(c)
```

---

#### `is_blank_m`

```c3
macro bool is_blank_m(c)
```

---

#### `is_cntrl_m`

```c3
macro bool is_cntrl_m(c)
```

---

#### `to_lower_m`

```c3
macro to_lower_m(c)
```

---

#### `to_upper_m`

```c3
macro to_upper_m(c)
```

---

#### `in_range`

```c3
fn bool in_range(char c, char start, char len)
```

---

#### `char.in_range`

```c3
fn bool char.in_range(char c, char start, char len)
```

---

#### `uint.in_range`

```c3
fn bool uint.in_range(uint c, uint start, uint len)
```

---

#### `uint.is_lower`

```c3
fn bool uint.is_lower(uint c)  @deprecated
```

---

#### `uint.is_upper`

```c3
fn bool uint.is_upper(uint c)  @deprecated
```

---

#### `uint.is_digit`

```c3
fn bool uint.is_digit(uint c)  @deprecated
```

---

#### `uint.is_bdigit`

```c3
fn bool uint.is_bdigit(uint c) @deprecated
```

---

#### `uint.is_odigit`

```c3
fn bool uint.is_odigit(uint c) @deprecated
```

---

#### `uint.is_xdigit`

```c3
fn bool uint.is_xdigit(uint c) @deprecated
```

---

#### `uint.is_alpha`

```c3
fn bool uint.is_alpha(uint c)  @deprecated
```

---

#### `uint.is_print`

```c3
fn bool uint.is_print(uint c)  @deprecated
```

---

#### `uint.is_graph`

```c3
fn bool uint.is_graph(uint c)  @deprecated
```

---

#### `uint.is_space`

```c3
fn bool uint.is_space(uint c)  @deprecated
```

---

#### `uint.is_alnum`

```c3
fn bool uint.is_alnum(uint c)  @deprecated
```

---

#### `uint.is_punct`

```c3
fn bool uint.is_punct(uint c)  @deprecated
```

---

#### `uint.is_blank`

```c3
fn bool uint.is_blank(uint c)  @deprecated
```

---

#### `uint.is_cntrl`

```c3
fn bool uint.is_cntrl(uint c)  @deprecated
```

---

#### `uint.to_lower`

```c3
fn uint uint.to_lower(uint c)  @deprecated
```

---

#### `uint.to_upper`

```c3
fn uint uint.to_upper(uint c)  @deprecated
```
### `std::atomic`

---

#### `@is_native_atomic_value`

```c3
macro bool @is_native_atomic_value(#value) @private
```

---

#### `is_native_atomic_type`

```c3
macro bool is_native_atomic_type($Type)
```

---

#### `fetch_add`

```c3
<*
 @param [&inout] ptr : "the variable or dereferenced pointer to the data."
 @param [in] y : "the value to be added to ptr."
 @param $ordering : "atomic ordering of the load, defaults to SEQ_CONSISTENT"
 @return "returns the old value of ptr"
 @require !$alignment || math::is_power_of_2($alignment) : "Alignment must be a power of two."
 @require $defined(*ptr) : "Expected a pointer"
 @require @is_native_atomic_value(*ptr) : "Only types that are native atomic may be used."
 @require $defined(*ptr + y) : "+ must be defined between the values."
 @require $ordering != NOT_ATOMIC && $ordering != UNORDERED : "Acquire ordering is not valid."
*>
macro fetch_add(ptr, y, AtomicOrdering $ordering = SEQ_CONSISTENT, bool $volatile = false, usz $alignment = 0)
```

---

#### `fetch_sub`

```c3
<*
 @param [&inout] ptr : "the variable or dereferenced pointer to the data."
 @param [in] y : "the value to be subtracted from ptr."
 @param $ordering : "atomic ordering of the load, defaults to SEQ_CONSISTENT"
 @return "returns the old value of ptr"
 @require !$alignment || math::is_power_of_2($alignment) : "Alignment must be a power of two."
 @require $defined(*ptr) : "Expected a pointer"
 @require @is_native_atomic_value(*ptr) : "Only types that are native atomic may be used."
 @require $defined(*ptr - y) : "- must be defined between the values."
 @require $ordering != NOT_ATOMIC && $ordering != UNORDERED : "Acquire ordering is not valid."
*>
macro fetch_sub(ptr, y, AtomicOrdering $ordering = SEQ_CONSISTENT, bool $volatile = false, usz $alignment = 0)
```

---

#### `fetch_mul`

```c3
<*
 @param [&inout] ptr : "the variable or dereferenced pointer to the data."
 @param [in] y : "the value to be multiplied with ptr."
 @param $ordering : "atomic ordering of the load, defaults to SEQ_CONSISTENT"
 @return "returns the old value of ptr"
 @require $defined(*ptr) : "Expected a pointer"
 @require @is_native_atomic_value(*ptr) : "Only types that are native atomic may be used."
 @require $defined(*ptr * y) : "* must be defined between the values."
 @require $ordering != NOT_ATOMIC && $ordering != UNORDERED : "Acquire ordering is not valid."
*>
macro fetch_mul(ptr, y, AtomicOrdering $ordering = SEQ_CONSISTENT)
```

---

#### `fetch_div`

```c3
<*
 @param [&inout] ptr : "the variable or dereferenced pointer to the data."
 @param [in] y : "the value to divide ptr by."
 @param $ordering : "atomic ordering of the load, defaults to SEQ_CONSISTENT"
 @return "returns the old value of ptr"
 @require $defined(*ptr) : "Expected a pointer"
 @require @is_native_atomic_value(*ptr) : "Only types that are native atomic may be used."
 @require $defined(*ptr * y) : "/ must be defined between the values."
 @require $ordering != NOT_ATOMIC && $ordering != UNORDERED : "Acquire ordering is not valid."
*>
macro fetch_div(ptr, y, AtomicOrdering $ordering = SEQ_CONSISTENT)
```

---

#### `fetch_or`

```c3
<*
 @param [&inout] ptr : "the variable or dereferenced pointer to the data."
 @param [in] y : "the value to perform a bitwise or with."
 @param $ordering : "atomic ordering of the load, defaults to SEQ_CONSISTENT"
 @return "returns the old value of ptr"
 @require !$alignment || math::is_power_of_2($alignment) : "Alignment must be a power of two."
 @require $defined(*ptr) : "Expected a pointer"
 @require @is_native_atomic_value(*ptr) : "Only types that are native atomic may be used."
 @require $defined(*ptr | y) : "| must be defined between the values."
 @require $ordering != NOT_ATOMIC && $ordering != UNORDERED : "Acquire ordering is not valid."
*>
macro fetch_or(ptr, y, AtomicOrdering $ordering = SEQ_CONSISTENT, bool $volatile = false, usz $alignment = 0)
```

---

#### `fetch_xor`

```c3
<*
 @param [&inout] ptr : "the variable or dereferenced pointer to the data."
 @param [in] y : "the value to perform a bitwise xor with."
 @param $ordering : "atomic ordering of the load, defaults to SEQ_CONSISTENT"
 @return "returns the old value of ptr"
 @require !$alignment || math::is_power_of_2($alignment) : "Alignment must be a power of two."
 @require $defined(*ptr) : "Expected a pointer"
 @require @is_native_atomic_value(*ptr) : "Only types that are native atomic may be used."
 @require $defined(*ptr ^ y) : "^ must be defined between the values."
 @require $ordering != NOT_ATOMIC && $ordering != UNORDERED : "Acquire ordering is not valid."
*>
macro fetch_xor(ptr, y, AtomicOrdering $ordering = SEQ_CONSISTENT, bool $volatile = false, usz $alignment = 0)
```

---

#### `fetch_and`

```c3
<*
 @param [&inout] ptr : "the variable or dereferenced pointer to the data."
 @param [in] y : "the value to perform a bitwise and with."
 @param $ordering : "atomic ordering of the load, defaults to SEQ_CONSISTENT"
 @return "returns the old value of ptr"
 @require !$alignment || math::is_power_of_2($alignment) : "Alignment must be a power of two."
 @require $defined(*ptr) : "Expected a pointer"
 @require @is_native_atomic_value(*ptr) : "Only types that are native atomic may be used."
 @require $defined(*ptr ^ y) : "& must be defined between the values."
 @require $ordering != NOT_ATOMIC && $ordering != UNORDERED : "Acquire ordering is not valid."
*>
macro fetch_and(ptr, y, AtomicOrdering $ordering = SEQ_CONSISTENT, bool $volatile = false, usz $alignment = 0)
```

---

#### `fetch_shift_right`

```c3
<*
 @param [&inout] ptr : "the variable or dereferenced pointer to the data."
 @param [in] y : "the value to shift ptr by."
 @param $ordering : "atomic ordering of the load, defaults to SEQ_CONSISTENT"
 @return "returns the old value of ptr"
 @require $defined(*ptr) : "Expected a pointer"
 @require @is_native_atomic_value(*ptr) : "Only types that are native atomic may be used."
 @require types::is_int($typeof(*ptr)) : "Only integer pointers may be used."
 @require types::is_int($typeof(y)) : "The value for shift right must be an integer"
 @require $ordering != NOT_ATOMIC && $ordering != UNORDERED : "Acquire ordering is not valid."
*>
macro fetch_shift_right(ptr, y, AtomicOrdering $ordering = SEQ_CONSISTENT)
```

---

#### `fetch_shift_left`

```c3
<*
 @param [&inout] ptr : "the variable or dereferenced pointer to the data."
 @param [in] y : "the value to shift ptr by."
 @param $ordering : "atomic ordering of the load, defaults to SEQ_CONSISTENT"
 @return "returns the old value of ptr"
 @require $defined(*ptr) : "Expected a pointer"
 @require @is_native_atomic_value(*ptr) : "Only types that are native atomic may be used."
 @require types::is_int($typeof(*ptr)) : "Only integer pointers may be used."
 @require types::is_int($typeof(y)) : "The value for shift left must be an integer"
 @require $ordering != NOT_ATOMIC && $ordering != UNORDERED : "Acquire ordering is not valid."
*>
macro fetch_shift_left(ptr, y, AtomicOrdering $ordering = SEQ_CONSISTENT)
```

---

#### `flag_set`

```c3
<*
 @param [&inout] ptr : "the variable or dereferenced pointer to the data."
 @param $ordering : "atomic ordering of the load, defaults to SEQ_CONSISTENT"
 @return "returns the old value of ptr"
 @require $defined(*ptr) : "Expected a pointer"
 @require @is_native_atomic_value(*ptr) : "Only types that are native atomic may be used."
 @require types::flat_kind($typeof(*ptr)) == BOOL : "Only bool pointers may be used."
 @require $ordering != NOT_ATOMIC && $ordering != UNORDERED : "Acquire ordering is not valid."
*>
macro flag_set(ptr, AtomicOrdering $ordering = SEQ_CONSISTENT)
```

---

#### `flag_clear`

```c3
<*
 @param [&inout] ptr : "the variable or dereferenced pointer to the data."
 @param $ordering : "atomic ordering of the load, defaults to SEQ_CONSISTENT"
 @return "returns the old value of ptr"
 @require $defined(*ptr) : "Expected a pointer"
 @require @is_native_atomic_value(*ptr) : "Only types that are native atomic may be used."
 @require types::flat_kind($typeof(*ptr)) == BOOL : "Only bool pointers may be used."
 @require $ordering != NOT_ATOMIC && $ordering != UNORDERED : "Acquire ordering is not valid."
*>
macro flag_clear(ptr, AtomicOrdering $ordering = SEQ_CONSISTENT)
```

---

#### `fetch_max`

```c3
<*
 @param [&in] ptr : "the variable or dereferenced pointer to the data."
 @param [in] y : "the value to be compared to ptr."
 @param $ordering : "atomic ordering of the load, defaults to SEQ_CONSISTENT"
 @return "returns the old value of ptr"
 @require $defined(*ptr) : "Expected a pointer"
 @require @is_native_atomic_value(*ptr) : "Only types that are native atomic may be used."
 @require $defined(*ptr > y) : "Only values that are comparable with > may be used"
 @require $ordering != NOT_ATOMIC && $ordering != UNORDERED : "Acquire ordering is not valid."
*>
macro fetch_max(ptr, y, AtomicOrdering $ordering = SEQ_CONSISTENT, bool $volatile = false, usz $alignment = 0)
```

---

#### `fetch_min`

```c3
<*
 @param [&in] ptr : "the variable or dereferenced pointer to the data."
 @param [in] y : "the value to be compared to ptr."
 @param $ordering : "atomic ordering of the load, defaults to SEQ_CONSISTENT"
 @return "returns the old value of ptr"
 @require $defined(*ptr) : "Expected a pointer"
 @require @is_native_atomic_value(*ptr) : "Only types that are native atomic may be used."
 @require $defined(*ptr > y) : "Only values that are comparable with > may be used"
 @require $ordering != NOT_ATOMIC && $ordering != UNORDERED : "Acquire ordering is not valid."
*>
macro fetch_min(ptr, y, AtomicOrdering $ordering = SEQ_CONSISTENT, bool $volatile = false, usz $alignment = 0)
```

---

#### `@__atomic_compare_exchange_ordering_failure`

```c3
macro @__atomic_compare_exchange_ordering_failure(ptr, expected, desired, $success, failure, $alignment)
```

---

#### `@__atomic_compare_exchange_ordering_success`

```c3
macro @__atomic_compare_exchange_ordering_success(ptr, expected, desired, success, failure, $alignment)
```

---

#### `__atomic_compare_exchange`

```c3
fn CInt __atomic_compare_exchange(CInt size, any ptr, any expected, any desired, CInt success, CInt failure) @weak @export("__atomic_compare_exchange")
```
### `std::atomic::types{Type}`

---

#### `Atomic`

```c3
struct Atomic
```

---

#### `Atomic.load`

```c3
<*
 @param ordering : "The ordering, cannot be release or acquire-release."
 @require ordering != RELEASE && ordering != ACQUIRE_RELEASE : "Release and acquire-release are not valid for load"
*>
macro Type Atomic.load(&self, AtomicOrdering ordering = SEQ_CONSISTENT)
```

Loads data atomically, by default this uses SEQ_CONSISTENT ordering.


---

#### `Atomic.store`

```c3
<*
 @param ordering : "The ordering, cannot be acquire or acquire-release."
 @require ordering != ACQUIRE && ordering != ACQUIRE_RELEASE : "Acquire and acquire-release are not valid for store"
*>
macro void Atomic.store(&self, Type value, AtomicOrdering ordering = SEQ_CONSISTENT)
```

Stores data atomically, by default this uses SEQ_CONSISTENT ordering.


---

#### `Atomic.add`

```c3
macro Type Atomic.add(&self, Type value, AtomicOrdering ordering = SEQ_CONSISTENT)
```

---

#### `Atomic.sub`

```c3
macro Type Atomic.sub(&self, Type value, AtomicOrdering ordering = SEQ_CONSISTENT)
```

---

#### `Atomic.mul`

```c3
macro Type Atomic.mul(&self, Type value, AtomicOrdering ordering = SEQ_CONSISTENT)
```

---

#### `Atomic.div`

```c3
macro Type Atomic.div(&self, Type value, AtomicOrdering ordering = SEQ_CONSISTENT)
```

---

#### `Atomic.max`

```c3
macro Type Atomic.max(&self, Type value, AtomicOrdering ordering = SEQ_CONSISTENT)
```

---

#### `Atomic.min`

```c3
macro Type Atomic.min(&self, Type value, AtomicOrdering ordering = SEQ_CONSISTENT)
```

---

#### `Atomic.or`

```c3
macro Type Atomic.or(&self, Type value, AtomicOrdering ordering = SEQ_CONSISTENT) @if(types::flat_kind(Type) != FLOAT)
```

---

#### `Atomic.xor`

```c3
macro Type Atomic.xor(&self, Type value, AtomicOrdering ordering = SEQ_CONSISTENT) @if(types::flat_kind(Type) != FLOAT)
```

---

#### `Atomic.and`

```c3
macro Type Atomic.and(&self, Type value, AtomicOrdering ordering = SEQ_CONSISTENT) @if(types::flat_kind(Type) != FLOAT)
```

---

#### `Atomic.shr`

```c3
macro Type Atomic.shr(&self, Type amount, AtomicOrdering ordering = SEQ_CONSISTENT) @if(types::flat_kind(Type) != FLOAT)
```

---

#### `Atomic.shl`

```c3
macro Type Atomic.shl(&self, Type amount, AtomicOrdering ordering = SEQ_CONSISTENT) @if(types::flat_kind(Type) != FLOAT)
```

---

#### `Atomic.set`

```c3
macro Type Atomic.set(&self, AtomicOrdering ordering = SEQ_CONSISTENT) @if(types::flat_kind(Type) == BOOL)
```

---

#### `Atomic.clear`

```c3
macro Type Atomic.clear(&self, AtomicOrdering ordering = SEQ_CONSISTENT) @if(types::flat_kind(Type) == BOOL)
```

---

#### `@atomic_exec`

```c3
macro @atomic_exec(#func, data, value, ordering) @local
```

---

#### `@atomic_exec_no_arg`

```c3
macro @atomic_exec_no_arg(#func, data, ordering) @local
```
### `std::bits`

---

#### `reverse`

```c3
<*
 @require types::is_intlike($typeof(i)) : `The input must be an integer or integer vector`
*>
macro reverse(i)
```

---

#### `bswap`

```c3
<*
 @require types::is_intlike($typeof(i)) : `The input must be an integer or integer vector`
*>
macro bswap(i) @builtin
```

---

#### `uint[<*>].popcount`

```c3
macro uint[<*>].popcount(self)
```

---

#### `uint[<*>].ctz`

```c3
macro uint[<*>].ctz(self)
```

---

#### `uint[<*>].clz`

```c3
macro uint[<*>].clz(self)
```

---

#### `uint[<*>].fshl`

```c3
macro uint[<*>] uint[<*>].fshl(hi, uint[<*>] lo, uint[<*>] shift)
```

---

#### `uint[<*>].fshr`

```c3
macro uint[<*>] uint[<*>].fshr(hi, uint[<*>] lo, uint[<*>] shift)
```

---

#### `uint[<*>].rotl`

```c3
macro uint[<*>] uint[<*>].rotl(self, uint[<*>] shift)
```

---

#### `uint[<*>].rotr`

```c3
macro uint[<*>] uint[<*>].rotr(self, uint[<*>] shift)
```

---

#### `int[<*>].popcount`

```c3
macro int[<*>].popcount(self)
```

---

#### `int[<*>].ctz`

```c3
macro int[<*>].ctz(self)
```

---

#### `int[<*>].clz`

```c3
macro int[<*>].clz(self)
```

---

#### `int[<*>].fshl`

```c3
macro int[<*>] int[<*>].fshl(hi, int[<*>] lo, int[<*>] shift)
```

---

#### `int[<*>].fshr`

```c3
macro int[<*>] int[<*>].fshr(hi, int[<*>] lo, int[<*>] shift)
```

---

#### `int[<*>].rotl`

```c3
macro int[<*>] int[<*>].rotl(self, int[<*>] shift)
```

---

#### `int[<*>].rotr`

```c3
macro int[<*>] int[<*>].rotr(self, int[<*>] shift)
```

---

#### `ushort[<*>].popcount`

```c3
macro ushort[<*>].popcount(self)
```

---

#### `ushort[<*>].ctz`

```c3
macro ushort[<*>].ctz(self)
```

---

#### `ushort[<*>].clz`

```c3
macro ushort[<*>].clz(self)
```

---

#### `ushort[<*>].fshl`

```c3
macro ushort[<*>] ushort[<*>].fshl(hi, ushort[<*>] lo, ushort[<*>] shift)
```

---

#### `ushort[<*>].fshr`

```c3
macro ushort[<*>] ushort[<*>].fshr(hi, ushort[<*>] lo, ushort[<*>] shift)
```

---

#### `ushort[<*>].rotl`

```c3
macro ushort[<*>] ushort[<*>].rotl(self, ushort[<*>] shift)
```

---

#### `ushort[<*>].rotr`

```c3
macro ushort[<*>] ushort[<*>].rotr(self, ushort[<*>] shift)
```

---

#### `short[<*>].popcount`

```c3
macro short[<*>].popcount(self)
```

---

#### `short[<*>].ctz`

```c3
macro short[<*>].ctz(self)
```

---

#### `short[<*>].clz`

```c3
macro short[<*>].clz(self)
```

---

#### `short[<*>].fshl`

```c3
macro short[<*>] short[<*>].fshl(hi, short[<*>] lo, short[<*>] shift)
```

---

#### `short[<*>].fshr`

```c3
macro short[<*>] short[<*>].fshr(hi, short[<*>] lo, short[<*>] shift)
```

---

#### `short[<*>].rotl`

```c3
macro short[<*>] short[<*>].rotl(self, short[<*>] shift)
```

---

#### `short[<*>].rotr`

```c3
macro short[<*>] short[<*>].rotr(self, short[<*>] shift)
```

---

#### `char[<*>].popcount`

```c3
macro char[<*>].popcount(self)
```

---

#### `char[<*>].ctz`

```c3
macro char[<*>].ctz(self)
```

---

#### `char[<*>].clz`

```c3
macro char[<*>].clz(self)
```

---

#### `char[<*>].fshl`

```c3
macro char[<*>] char[<*>].fshl(hi, char[<*>] lo, char[<*>] shift)
```

---

#### `char[<*>].fshr`

```c3
macro char[<*>] char[<*>].fshr(hi, char[<*>] lo, char[<*>] shift)
```

---

#### `char[<*>].rotl`

```c3
macro char[<*>] char[<*>].rotl(self, char[<*>] shift)
```

---

#### `char[<*>].rotr`

```c3
macro char[<*>] char[<*>].rotr(self, char[<*>] shift)
```

---

#### `ichar[<*>].popcount`

```c3
macro ichar[<*>].popcount(self)
```

---

#### `ichar[<*>].ctz`

```c3
macro ichar[<*>].ctz(self)
```

---

#### `ichar[<*>].clz`

```c3
macro ichar[<*>].clz(self)
```

---

#### `ichar[<*>].fshl`

```c3
macro ichar[<*>] ichar[<*>].fshl(hi, ichar[<*>] lo, ichar[<*>] shift)
```

---

#### `ichar[<*>].fshr`

```c3
macro ichar[<*>] ichar[<*>].fshr(hi, ichar[<*>] lo, ichar[<*>] shift)
```

---

#### `ichar[<*>].rotl`

```c3
macro ichar[<*>] ichar[<*>].rotl(self, ichar[<*>] shift)
```

---

#### `ichar[<*>].rotr`

```c3
macro ichar[<*>] ichar[<*>].rotr(self, ichar[<*>] shift)
```

---

#### `ulong[<*>].popcount`

```c3
macro ulong[<*>].popcount(self)
```

---

#### `ulong[<*>].ctz`

```c3
macro ulong[<*>].ctz(self)
```

---

#### `ulong[<*>].clz`

```c3
macro ulong[<*>].clz(self)
```

---

#### `ulong[<*>].fshl`

```c3
macro ulong[<*>] ulong[<*>].fshl(hi, ulong[<*>] lo, ulong[<*>] shift)
```

---

#### `ulong[<*>].fshr`

```c3
macro ulong[<*>] ulong[<*>].fshr(hi, ulong[<*>] lo, ulong[<*>] shift)
```

---

#### `ulong[<*>].rotl`

```c3
macro ulong[<*>] ulong[<*>].rotl(self, ulong[<*>] shift)
```

---

#### `ulong[<*>].rotr`

```c3
macro ulong[<*>] ulong[<*>].rotr(self, ulong[<*>] shift)
```

---

#### `long[<*>].popcount`

```c3
macro long[<*>].popcount(self)
```

---

#### `long[<*>].ctz`

```c3
macro long[<*>].ctz(self)
```

---

#### `long[<*>].clz`

```c3
macro long[<*>].clz(self)
```

---

#### `long[<*>].fshl`

```c3
macro long[<*>] long[<*>].fshl(hi, long[<*>] lo, long[<*>] shift)
```

---

#### `long[<*>].fshr`

```c3
macro long[<*>] long[<*>].fshr(hi, long[<*>] lo, long[<*>] shift)
```

---

#### `long[<*>].rotl`

```c3
macro long[<*>] long[<*>].rotl(self, long[<*>] shift)
```

---

#### `long[<*>].rotr`

```c3
macro long[<*>] long[<*>].rotr(self, long[<*>] shift)
```

---

#### `uint128[<*>].popcount`

```c3
macro uint128[<*>].popcount(self)
```

---

#### `uint128[<*>].ctz`

```c3
macro uint128[<*>].ctz(self)
```

---

#### `uint128[<*>].clz`

```c3
macro uint128[<*>].clz(self)
```

---

#### `uint128[<*>].fshl`

```c3
macro uint128[<*>] uint128[<*>].fshl(hi, uint128[<*>] lo, uint128[<*>] shift)
```

---

#### `uint128[<*>].fshr`

```c3
macro uint128[<*>] uint128[<*>].fshr(hi, uint128[<*>] lo, uint128[<*>] shift)
```

---

#### `uint128[<*>].rotl`

```c3
macro uint128[<*>] uint128[<*>].rotl(self, uint128[<*>] shift)
```

---

#### `uint128[<*>].rotr`

```c3
macro uint128[<*>] uint128[<*>].rotr(self, uint128[<*>] shift)
```

---

#### `int128[<*>].popcount`

```c3
macro int128[<*>].popcount(self)
```

---

#### `int128[<*>].ctz`

```c3
macro int128[<*>].ctz(self)
```

---

#### `int128[<*>].clz`

```c3
macro int128[<*>].clz(self)
```

---

#### `int128[<*>].fshl`

```c3
macro int128[<*>] int128[<*>].fshl(hi, int128[<*>] lo, int128[<*>] shift)
```

---

#### `int128[<*>].fshr`

```c3
macro int128[<*>] int128[<*>].fshr(hi, int128[<*>] lo, int128[<*>] shift)
```

---

#### `int128[<*>].rotl`

```c3
macro int128[<*>] int128[<*>].rotl(self, int128[<*>] shift)
```

---

#### `int128[<*>].rotr`

```c3
macro int128[<*>] int128[<*>].rotr(self, int128[<*>] shift)
```

---

#### `uint.popcount`

```c3
macro uint.popcount(self)
```

---

#### `uint.ctz`

```c3
macro uint.ctz(self)
```

---

#### `uint.clz`

```c3
macro uint.clz(self)
```

---

#### `uint.fshl`

```c3
macro uint uint.fshl(hi, uint lo, uint shift)
```

---

#### `uint.fshr`

```c3
macro uint uint.fshr(hi, uint lo, uint shift)
```

---

#### `uint.rotl`

```c3
macro uint uint.rotl(self, uint shift)
```

---

#### `uint.rotr`

```c3
macro uint uint.rotr(self, uint shift)
```

---

#### `int.popcount`

```c3
macro int.popcount(self)
```

---

#### `int.ctz`

```c3
macro int.ctz(self)
```

---

#### `int.clz`

```c3
macro int.clz(self)
```

---

#### `int.fshl`

```c3
macro int int.fshl(hi, int lo, int shift)
```

---

#### `int.fshr`

```c3
macro int int.fshr(hi, int lo, int shift)
```

---

#### `int.rotl`

```c3
macro int int.rotl(self, int shift)
```

---

#### `int.rotr`

```c3
macro int int.rotr(self, int shift)
```

---

#### `ushort.popcount`

```c3
macro ushort.popcount(self)
```

---

#### `ushort.ctz`

```c3
macro ushort.ctz(self)
```

---

#### `ushort.clz`

```c3
macro ushort.clz(self)
```

---

#### `ushort.fshl`

```c3
macro ushort ushort.fshl(hi, ushort lo, ushort shift)
```

---

#### `ushort.fshr`

```c3
macro ushort ushort.fshr(hi, ushort lo, ushort shift)
```

---

#### `ushort.rotl`

```c3
macro ushort ushort.rotl(self, ushort shift)
```

---

#### `ushort.rotr`

```c3
macro ushort ushort.rotr(self, ushort shift)
```

---

#### `short.popcount`

```c3
macro short.popcount(self)
```

---

#### `short.ctz`

```c3
macro short.ctz(self)
```

---

#### `short.clz`

```c3
macro short.clz(self)
```

---

#### `short.fshl`

```c3
macro short short.fshl(hi, short lo, short shift)
```

---

#### `short.fshr`

```c3
macro short short.fshr(hi, short lo, short shift)
```

---

#### `short.rotl`

```c3
macro short short.rotl(self, short shift)
```

---

#### `short.rotr`

```c3
macro short short.rotr(self, short shift)
```

---

#### `char.popcount`

```c3
macro char.popcount(self)
```

---

#### `char.ctz`

```c3
macro char.ctz(self)
```

---

#### `char.clz`

```c3
macro char.clz(self)
```

---

#### `char.fshl`

```c3
macro char char.fshl(hi, char lo, char shift)
```

---

#### `char.fshr`

```c3
macro char char.fshr(hi, char lo, char shift)
```

---

#### `char.rotl`

```c3
macro char char.rotl(self, char shift)
```

---

#### `char.rotr`

```c3
macro char char.rotr(self, char shift)
```

---

#### `ichar.popcount`

```c3
macro ichar.popcount(self)
```

---

#### `ichar.ctz`

```c3
macro ichar.ctz(self)
```

---

#### `ichar.clz`

```c3
macro ichar.clz(self)
```

---

#### `ichar.fshl`

```c3
macro ichar ichar.fshl(hi, ichar lo, ichar shift)
```

---

#### `ichar.fshr`

```c3
macro ichar ichar.fshr(hi, ichar lo, ichar shift)
```

---

#### `ichar.rotl`

```c3
macro ichar ichar.rotl(self, ichar shift)
```

---

#### `ichar.rotr`

```c3
macro ichar ichar.rotr(self, ichar shift)
```

---

#### `ulong.popcount`

```c3
macro ulong.popcount(self)
```

---

#### `ulong.ctz`

```c3
macro ulong.ctz(self)
```

---

#### `ulong.clz`

```c3
macro ulong.clz(self)
```

---

#### `ulong.fshl`

```c3
macro ulong ulong.fshl(hi, ulong lo, ulong shift)
```

---

#### `ulong.fshr`

```c3
macro ulong ulong.fshr(hi, ulong lo, ulong shift)
```

---

#### `ulong.rotl`

```c3
macro ulong ulong.rotl(self, ulong shift)
```

---

#### `ulong.rotr`

```c3
macro ulong ulong.rotr(self, ulong shift)
```

---

#### `long.popcount`

```c3
macro long.popcount(self)
```

---

#### `long.ctz`

```c3
macro long.ctz(self)
```

---

#### `long.clz`

```c3
macro long.clz(self)
```

---

#### `long.fshl`

```c3
macro long long.fshl(hi, long lo, long shift)
```

---

#### `long.fshr`

```c3
macro long long.fshr(hi, long lo, long shift)
```

---

#### `long.rotl`

```c3
macro long long.rotl(self, long shift)
```

---

#### `long.rotr`

```c3
macro long long.rotr(self, long shift)
```

---

#### `uint128.popcount`

```c3
macro uint128.popcount(self)
```

---

#### `uint128.ctz`

```c3
macro uint128.ctz(self)
```

---

#### `uint128.clz`

```c3
macro uint128.clz(self)
```

---

#### `uint128.fshl`

```c3
macro uint128 uint128.fshl(hi, uint128 lo, uint128 shift)
```

---

#### `uint128.fshr`

```c3
macro uint128 uint128.fshr(hi, uint128 lo, uint128 shift)
```

---

#### `uint128.rotl`

```c3
macro uint128 uint128.rotl(self, uint128 shift)
```

---

#### `uint128.rotr`

```c3
macro uint128 uint128.rotr(self, uint128 shift)
```

---

#### `int128.popcount`

```c3
macro int128.popcount(self)
```

---

#### `int128.ctz`

```c3
macro int128.ctz(self)
```

---

#### `int128.clz`

```c3
macro int128.clz(self)
```

---

#### `int128.fshl`

```c3
macro int128 int128.fshl(hi, int128 lo, int128 shift)
```

---

#### `int128.fshr`

```c3
macro int128 int128.fshr(hi, int128 lo, int128 shift)
```

---

#### `int128.rotl`

```c3
macro int128 int128.rotl(self, int128 shift)
```

---

#### `int128.rotr`

```c3
macro int128 int128.rotr(self, int128 shift)
```
### `std::collections::anylist`

---

#### `AnyPredicate`

```c3
alias AnyPredicate = fn bool(any value)
```

---

#### `AnyTest`

```c3
alias AnyTest = fn bool(any type, any context)
```

---

#### `AnyList`

```c3
struct AnyList (Printable)
```

The AnyList contains a heterogenous set of types. Anything placed in the
list will shallowly copied in order to be stored as an `any`. This means
that the list will copy and free its elements.

However, because we're getting `any` values back when we pop, those operations
need to take an allocator, as we can only copy then pop then return the copy.

If we're not doing pop, then things are easier, since we can just hand over
the existing any.


---

#### `AnyList.init`

```c3
<*
 @param [&inout] allocator : "The allocator to use"
 @param initial_capacity : "The initial capacity to reserve, defaults to 16"
*>
fn AnyList* AnyList.init(&self, Allocator allocator, usz initial_capacity = 16)
```

Initialize the list. If not initialized then it will use the temp allocator
when something is pushed to it.


---

#### `AnyList.tinit`

```c3
<*
 @param initial_capacity : "The initial capacity to reserve"
*>
fn AnyList* AnyList.tinit(&self, usz initial_capacity = 16)
```

Initialize the list using the temp allocator.


---

#### `AnyList.is_initialized`

```c3
fn bool AnyList.is_initialized(&self) @inline
```

---

#### `AnyList.push`

```c3
macro void AnyList.push(&self, element)
```

Push an element on the list by cloning it.


---

#### `AnyList.free_element`

```c3
fn void AnyList.free_element(&self, any element) @inline
```

Free a retained element removed using *_retained.


---

#### `AnyList.pop`

```c3
<*
 @param $Type : "The type we assume the value has"
 @return "The last value as the type given"
 @return? TYPE_MISMATCH, NO_MORE_ELEMENT
*>
macro AnyList.pop(&self, $Type)
```

Pop a value who's type is known. If the type is incorrect, this
will still pop the element.


---

#### `AnyList.copy_pop`

```c3
<*
 @param [&inout] allocator : "The allocator to use for copying"
 @return "A copy of the last value if it exists"
 @return? NO_MORE_ELEMENT
*>
fn any? AnyList.copy_pop(&self, Allocator allocator)
```

Copy the last value, pop it and return the copy of it.


---

#### `AnyList.tcopy_pop`

```c3
<*
 @return "A temp copy of the last value if it exists"
 @return? NO_MORE_ELEMENT
*>
fn any? AnyList.tcopy_pop(&self)
```

Copy the last value, pop it and return the copy of it.


---

#### `AnyList.pop_retained`

```c3
<*
 @return "The last value if it exists"
 @return? NO_MORE_ELEMENT
*>
fn any? AnyList.pop_retained(&self)
```

Pop the last value. It must later be released using `list.free_element()`.


---

#### `AnyList.clear`

```c3
fn void AnyList.clear(&self)
```

Remove all elements in the list.


---

#### `AnyList.pop_first`

```c3
<*
 @param $Type : "The type we assume the value has"
 @return "The first value as the type given"
 @return? TYPE_MISMATCH, NO_MORE_ELEMENT
*>
macro AnyList.pop_first(&self, $Type)
```

Pop a value who's type is known. If the type is incorrect, this
will still pop the element.


---

#### `AnyList.pop_first_retained`

```c3
<*
 @return "The first value if it exists"
 @return? NO_MORE_ELEMENT
*>
fn any? AnyList.pop_first_retained(&self)
```

Pop the first value. It must later be released using `list.free_element()`.


---

#### `AnyList.copy_pop_first`

```c3
<*
 @param [&inout] allocator : "The allocator to use for copying"
 @return "A copy of the first value if it exists"
 @return? NO_MORE_ELEMENT
*>
fn any? AnyList.copy_pop_first(&self, Allocator allocator)
```

Copy the first value, pop it and return the copy of it.


---

#### `AnyList.tcopy_pop_first`

```c3
<*
 @return "A temp copy of the first value if it exists"
 @return? NO_MORE_ELEMENT
*>
fn any? AnyList.tcopy_pop_first(&self)
```

Copy the first value, pop it and return the temp copy of it.


---

#### `AnyList.remove_at`

```c3
<*
 @param index : "The index of the element to remove"
 @require index < self.size
*>
fn void AnyList.remove_at(&self, usz index)
```

Remove the element at the particular index.


---

#### `AnyList.add_all`

```c3
<*
 @param [&in] other_list : "The list to add"
*>
fn void AnyList.add_all(&self, AnyList* other_list)
```

Add all the elements in another AnyList.


---

#### `AnyList.reverse`

```c3
fn void AnyList.reverse(&self)
```

Reverse the order of the elements in the list.


---

#### `AnyList.array_view`

```c3
<*
 @return "The slice view"
*>
fn any[] AnyList.array_view(&self)
```

Return a view of the data as a slice.


---

#### `AnyList.push_front`

```c3
<*
 @param value : "The value to push to the list"
*>
macro void AnyList.push_front(&self, value)
```

Push an element to the front of the list.


---

#### `AnyList.insert_at`

```c3
<*
 @param index : "the index where the element should be inserted"
 @param type : "the value to insert"
 @require index <= self.size : "The index is out of bounds"
*>
macro void AnyList.insert_at(&self, usz index, type)
```

Insert an element at a particular index.


---

#### `AnyList.remove_last`

```c3
<*
 @require self.size > 0 : "The list was already empty"
*>
fn void AnyList.remove_last(&self)
```

Remove the last element in the list. The list may not be empty.


---

#### `AnyList.remove_first`

```c3
<*
 @require self.size > 0
*>
fn void AnyList.remove_first(&self)
```

Remove the first element in the list, the list may not be empty.


---

#### `AnyList.first`

```c3
<*
 @param $Type : "The type of the first element"
 @return "The first element"
 @return? TYPE_MISMATCH, NO_MORE_ELEMENT
*>
macro AnyList.first(&self, $Type)
```

Return the first element by value, assuming it is the given type.


---

#### `AnyList.first_any`

```c3
<*
 @return "The first element"
 @return? NO_MORE_ELEMENT
*>
fn any? AnyList.first_any(&self) @inline
```

Return the first element


---

#### `AnyList.last`

```c3
<*
 @param $Type : "The type of the last element"
 @return "The last element"
 @return? TYPE_MISMATCH, NO_MORE_ELEMENT
*>
macro AnyList.last(&self, $Type)
```

Return the last element by value, assuming it is the given type.


---

#### `AnyList.last_any`

```c3
<*
 @return "The last element"
 @return? NO_MORE_ELEMENT
*>
fn any? AnyList.last_any(&self) @inline
```

Return the last element


---

#### `AnyList.is_empty`

```c3
<*
 @return "True if the list is empty"
*>
fn bool AnyList.is_empty(&self) @inline
```

Return whether the list is empty.


---

#### `AnyList.len`

```c3
<*
 @return "The number of elements in the list"
*>
fn usz AnyList.len(&self) @operator(len) @inline
```

Return the length of the list.


---

#### `AnyList.get`

```c3
<*
 @param index : "The index of the element to retrieve"
 @param $Type : "The type of the element"
 @return "The element at the index"
 @return? TYPE_MISMATCH, NO_MORE_ELEMENT
 @require index < self.size : "Index out of range"
*>
macro AnyList.get(&self, usz index, $Type)
```

Return an element in the list by value, assuming it is the given type.


---

#### `AnyList.get_any`

```c3
<*
 @param index : "The index of the element to retrieve"
 @return "The element at the index"
 @return? TYPE_MISMATCH, NO_MORE_ELEMENT
 @require index < self.size : "Index out of range"
*>
fn any AnyList.get_any(&self, usz index) @inline @operator([])
```

Return an element in the list.


---

#### `AnyList.free`

```c3
fn void AnyList.free(&self)
```

Completely free and clear a list.


---

#### `AnyList.swap`

```c3
<*
 @param i : "Index of one of the elements"
 @param j : "Index of the other element"
 @require i < self.size : "The first index is out of range"
 @require j < self.size : "The second index is out of range"
*>
fn void AnyList.swap(&self, usz i, usz j)
```

Swap two elements in a list.


---

#### `AnyList.to_format`

```c3
fn usz? AnyList.to_format(&self, Formatter* formatter) @dynamic
```

Print the list to a formatter.


---

#### `AnyList.remove_if`

```c3
<*
 @param filter : "The function to determine if it should be removed or not"
 @return "the number of deleted elements"
*>
fn usz AnyList.remove_if(&self, AnyPredicate filter)
```

Remove any elements matching the predicate.


---

#### `AnyList.retain_if`

```c3
<*
 @param selection : "The function to determine if it should be kept or not"
 @return "the number of deleted elements"
*>
fn usz AnyList.retain_if(&self, AnyPredicate selection)
```

Retain the elements matching the predicate.


---

#### `AnyList.remove_using_test`

```c3
<*
 @param filter : "The function to determine if it should be removed or not"
 @param context : "The context to the function"
 @return "the number of deleted elements"
*>
fn usz AnyList.remove_using_test(&self, AnyTest filter, any context)
```

Remove any elements matching the predicate.


---

#### `AnyList.retain_using_test`

```c3
<*
 @param selection : "The function to determine if it should be retained or not"
 @param context : "The context to the function"
 @return "the number of deleted elements"
*>
fn usz AnyList.retain_using_test(&self, AnyTest selection, any context)
```

Retain any elements matching the predicate.


---

#### `AnyList.reserve`

```c3
<*
 @param min_capacity : "The min capacity to hold"
*>
fn void AnyList.reserve(&self, usz min_capacity)
```

Reserve memory so that at least the `min_capacity` exists.


---

#### `AnyList.set`

```c3
<*
 @param index : "The index where to set the value."
 @param value : "The value to set"
 @require index <= self.size : "Index out of range"
*>
macro void AnyList.set(&self, usz index, value)
```

Set the element at any index.


---

#### `AnyList.ensure_capacity`

```c3
fn void AnyList.ensure_capacity(&self, usz added = 1) @inline @private
```

---

#### `AnyList._append`

```c3
fn void AnyList._append(&self, any element) @local
```

---

#### `AnyList._insert_at`

```c3
<*
 @require index < self.size
*>
fn void AnyList._insert_at(&self, usz index, any value) @local
```

---

#### `AnyList._remove_using_test`

```c3
macro usz AnyList._remove_using_test(&self, AnyTest filter, bool $invert, ctx) @local
```

---

#### `AnyList._remove_if`

```c3
macro usz AnyList._remove_if(&self, AnyPredicate filter, bool $invert) @local
```
### `std::collections::bitset {SIZE}`

---

#### `BITS`

```c3
const BITS = uint.sizeof * 8
```

---

#### `SZ`

```c3
const SZ = (SIZE + BITS - 1) / BITS
```

---

#### `BitSet`

```c3
struct BitSet
```

---

#### `BitSet.cardinality`

```c3
<*
 @return "The number of bits set"
*>
fn usz BitSet.cardinality(&self)
```

---

#### `BitSet.set`

```c3
<*
 @param i : "The index to set"
 @require i < SIZE : "Index was out of range"
*>
fn void BitSet.set(&self, usz i)
```

Set a bit in the bitset.


---

#### `BitSet.xor_self`

```c3
<*
 @param set : "The bit set to xor with"
 @return "The resulting bit set"
*>
macro BitSet BitSet.xor_self(&self, BitSet set) @operator(^=)
```

Perform xor over all bits, mutating itself


---

#### `BitSet.xor`

```c3
<*
 @param set : "The bit set to xor with"
 @return "The resulting bit set"
*>
fn BitSet BitSet.xor(&self, BitSet set) @operator(^)
```

Perform xor over all bits, returning a new bit set.


---

#### `BitSet.or`

```c3
<*
 @param set : "The bit set to xor with"
 @return "The resulting bit set"
*>
fn BitSet BitSet.or(&self, BitSet set) @operator(|)
```

Perform or over all bits, returning a new bit set.


---

#### `BitSet.or_self`

```c3
<*
 @param set : "The bit set to xor with"
 @return "The resulting bit set"
*>
macro BitSet BitSet.or_self(&self, BitSet set) @operator(|=)
```

Perform or over all bits, mutating itself


---

#### `BitSet.and`

```c3
<*
 @param set : "The bit set to xor with"
 @return "The resulting bit set"
*>
fn BitSet BitSet.and(&self, BitSet set) @operator(&)
```

Perform & over all bits, returning a new bit set.


---

#### `BitSet.and_self`

```c3
<*
 @param set : "The bit set to xor with"
 @return "The resulting bit set"
*>
macro BitSet BitSet.and_self(&self, BitSet set) @operator(&=)
```

Perform & over all bits, mutating itself.


---

#### `BitSet.unset`

```c3
<*
 @param i : "The index to set"
 @require i < SIZE : "Index was out of range"
*>
fn void BitSet.unset(&self, usz i)
```

Unset (clear) a bit in the bitset.


---

#### `BitSet.get`

```c3
<*
 @param i : "The index of the bit"
 @require i < SIZE : "Index was out of range"
*>
fn bool BitSet.get(&self, usz i) @operator([]) @inline
```

Get a particular bit in the bitset


---

#### `BitSet.len`

```c3
fn usz BitSet.len(&self) @operator(len) @inline
```

---

#### `BitSet.set_bool`

```c3
<*
 @param i : "The index of the bit"
 @param value : "The value to set the bit to"
 @require i < SIZE : "Index was out of range"
*>
fn void BitSet.set_bool(&self, usz i, bool value) @operator([]=) @inline
```

Change a particular bit in the bitset

### `std::collections::blockingqueue { Value }`

---

#### `INITIAL_CAPACITY`

```c3
const INITIAL_CAPACITY = 16
```

---

#### `QueueEntry`

```c3
struct QueueEntry
```

---

#### `LinkedBlockingQueue`

```c3
struct LinkedBlockingQueue
```

---

#### `LinkedBlockingQueue.init`

```c3
<*
 @param [&inout] allocator : "The allocator to use"
 @param capacity : "Maximum capacity (0 for unbounded)"
 @require !self.is_initialized() : "Queue was already initialized"
*>
fn LinkedBlockingQueue* LinkedBlockingQueue.init(&self, Allocator allocator, usz capacity = 0)
```

---

#### `LinkedBlockingQueue.tinit`

```c3
fn LinkedBlockingQueue* LinkedBlockingQueue.tinit(&self, usz capacity = 0)
```

---

#### `LinkedBlockingQueue.free`

```c3
<*
 @require self.is_initialized() : "Queue must be initialized"
*>
fn void LinkedBlockingQueue.free(&self)
```

---

#### `LinkedBlockingQueue.link_entry`

```c3
fn void LinkedBlockingQueue.link_entry(&self, QueueEntry* entry) @private
```

---

#### `LinkedBlockingQueue.unlink_head`

```c3
fn QueueEntry* LinkedBlockingQueue.unlink_head(&self) @private
```

---

#### `LinkedBlockingQueue.push`

```c3
<*
 @param value : "Value to add to the queue"
 @require self.is_initialized() : "Queue must be initialized"
*>
fn void LinkedBlockingQueue.push(&self, Value value)
```

---

#### `LinkedBlockingQueue.poll`

```c3
<*
 @require self.is_initialized() : "Queue must be initialized"
 @return "The removed value"
*>
fn Value LinkedBlockingQueue.poll(&self)
```

Get a value from the queue, blocking if there is no element in the queue.


---

#### `LinkedBlockingQueue.pop`

```c3
<*
 @require self.is_initialized() : "Queue must be initialized"
 @return "The removed value"
 @return? NO_MORE_ELEMENT : "If the queue is empty"
*>
fn Value? LinkedBlockingQueue.pop(&self)
```

Pop an element from the queue, fail is it is empty.


---

#### `LinkedBlockingQueue.poll_timeout`

```c3
<*
 @param timeout : "Timeout in microseconds"
 @require self.is_initialized() : "Queue must be initialized"
 @return "The removed value or null if timeout occurred"
 @return? NO_MORE_ELEMENT : "If we reached the timeout"
*>
fn Value? LinkedBlockingQueue.poll_timeout(&self, Duration timeout)
```

Poll with a timeout.


---

#### `LinkedBlockingQueue.size`

```c3
<*
 @require self.is_initialized() : "Queue must be initialized"
 @return "Current size of the queue"
*>
fn usz LinkedBlockingQueue.size(&self)
```

---

#### `LinkedBlockingQueue.is_empty`

```c3
<*
 @require self.is_initialized() : "Queue must be initialized"
 @return "True if queue is empty"
*>
fn bool LinkedBlockingQueue.is_empty(&self)
```

---

#### `LinkedBlockingQueue.try_push`

```c3
<*
 @param value : "Value to add to the queue"
 @require self.is_initialized() : "Queue must be initialized"
 @return? CAPACITY_EXCEEDED : "If the queue is full"
*>
fn void? LinkedBlockingQueue.try_push(&self, Value value)
```

Try to push, return CAPACITY_EXCEEDED if the queue is full.


---

#### `LinkedBlockingQueue.push_timeout`

```c3
<*
 @param value : "Value to add to the queue"
 @param timeout : "Timeout in microseconds"
 @require self.is_initialized() : "Queue must be initialized"
 @return? CAPACITY_EXCEEDED : "If the queue is full"
*>
fn void? LinkedBlockingQueue.push_timeout(&self, Value value, Duration timeout)
```

Try to push, return CAPACITY_EXCEEDED if the queue is still full after timeout is reached.


---

#### `LinkedBlockingQueue.peek`

```c3
<*
 @require self.is_initialized() : "Queue must be initialized"
 @return "The head value or NO_MORE_ELEMENT? if queue is empty"
*>
fn Value? LinkedBlockingQueue.peek(&self)
```

---

#### `LinkedBlockingQueue.is_initialized`

```c3
<*
 @return "True if queue is initialized"
*>
fn bool LinkedBlockingQueue.is_initialized(&self)
```
### `std::collections::elastic_array {Type, MAX_SIZE}`

---

#### `ElementPredicate`

```c3
alias ElementPredicate = fn bool(Type *type)
```

---

#### `ElementTest`

```c3
alias ElementTest = fn bool(Type *type, any context)
```

---

#### `ELEMENT_IS_EQUATABLE`

```c3
const ELEMENT_IS_EQUATABLE = types::is_equatable_type(Type)
```

---

#### `ELEMENT_IS_POINTER`

```c3
const ELEMENT_IS_POINTER = Type.kindof == POINTER
```

---

#### `type_is_overaligned`

```c3
macro type_is_overaligned()
```

---

#### `ElasticArray`

```c3
struct ElasticArray (Printable)
```

---

#### `ElasticArray.to_format`

```c3
fn usz? ElasticArray.to_format(&self, Formatter* formatter) @dynamic
```

---

#### `ElasticArray.to_tstring`

```c3
fn String ElasticArray.to_tstring(&self)
```

---

#### `ElasticArray.push_try`

```c3
fn void? ElasticArray.push_try(&self, Type element) @inline
```

---

#### `ElasticArray.push`

```c3
<*
 @require self.size < MAX_SIZE : `Tried to exceed the max size`
*>
fn void ElasticArray.push(&self, Type element) @inline
```

---

#### `ElasticArray.pop`

```c3
fn Type? ElasticArray.pop(&self)
```

---

#### `ElasticArray.clear`

```c3
fn void ElasticArray.clear(&self)
```

---

#### `ElasticArray.pop_first`

```c3
<*
 @require self.size > 0
*>
fn Type? ElasticArray.pop_first(&self)
```

---

#### `ElasticArray.remove_at`

```c3
<*
 @require index < self.size
*>
fn void ElasticArray.remove_at(&self, usz index)
```

---

#### `ElasticArray.add_all`

```c3
<*
 @require other_list.size + self.size <= MAX_SIZE
*>
fn void ElasticArray.add_all(&self, ElasticArray* other_list)
```

---

#### `ElasticArray.add_all_to_limit`

```c3
fn usz ElasticArray.add_all_to_limit(&self, ElasticArray* other_list)
```

Add as many elements as possible to the new array,
returning the number of elements that didn't fit.


---

#### `ElasticArray.add_array_to_limit`

```c3
<*
 @param [in] array
*>
fn usz ElasticArray.add_array_to_limit(&self, Type[] array)
```

Add as many values from this array as possible, returning the
number of elements that didn't fit.


---

#### `ElasticArray.add_array`

```c3
<*
 @param [in] array
 @require array.len + self.size <= MAX_SIZE : `Size would exceed max.`
 @ensure self.size >= array.len
*>
fn void ElasticArray.add_array(&self, Type[] array)
```

Add the values of an array to this list.


---

#### `ElasticArray.to_aligned_array`

```c3
fn Type[] ElasticArray.to_aligned_array(&self, Allocator allocator)
```

IMPORTANT The returned array must be freed using free_aligned.


---

#### `ElasticArray.to_array`

```c3
<*
 @require !type_is_overaligned() : "This function is not available on overaligned types"
*>
macro Type[] ElasticArray.to_array(&self, Allocator allocator)
```

---

#### `ElasticArray.to_tarray`

```c3
fn Type[] ElasticArray.to_tarray(&self)
```

---

#### `ElasticArray.reverse`

```c3
fn void ElasticArray.reverse(&self)
```

Reverse the elements in a list.


---

#### `ElasticArray.array_view`

```c3
fn Type[] ElasticArray.array_view(&self)
```

---

#### `ElasticArray.push_front`

```c3
<*
 @require self.size < MAX_SIZE : `List would exceed max size`
*>
fn void ElasticArray.push_front(&self, Type type) @inline
```

---

#### `ElasticArray.push_front_try`

```c3
<*
 @require self.size < MAX_SIZE : `List would exceed max size`
*>
fn void? ElasticArray.push_front_try(&self, Type type) @inline
```

---

#### `ElasticArray.insert_at_try`

```c3
<*
 @require index <= self.size
*>
fn void? ElasticArray.insert_at_try(&self, usz index, Type value)
```

---

#### `ElasticArray.insert_at`

```c3
<*
 @require self.size < MAX_SIZE : `List would exceed max size`
 @require index <= self.size
*>
fn void ElasticArray.insert_at(&self, usz index, Type type)
```

---

#### `ElasticArray.set_at`

```c3
<*
 @require index < self.size
*>
fn void ElasticArray.set_at(&self, usz index, Type type)
```

---

#### `ElasticArray.remove_last`

```c3
fn void? ElasticArray.remove_last(&self) @maydiscard
```

---

#### `ElasticArray.remove_first`

```c3
fn void? ElasticArray.remove_first(&self) @maydiscard
```

---

#### `ElasticArray.first`

```c3
fn Type? ElasticArray.first(&self)
```

---

#### `ElasticArray.last`

```c3
fn Type? ElasticArray.last(&self)
```

---

#### `ElasticArray.is_empty`

```c3
fn bool ElasticArray.is_empty(&self) @inline
```

---

#### `ElasticArray.byte_size`

```c3
fn usz ElasticArray.byte_size(&self) @inline
```

---

#### `ElasticArray.len`

```c3
fn usz ElasticArray.len(&self) @operator(len) @inline
```

---

#### `ElasticArray.get`

```c3
fn Type ElasticArray.get(&self, usz index) @inline
```

---

#### `ElasticArray.swap`

```c3
fn void ElasticArray.swap(&self, usz i, usz j)
```

---

#### `ElasticArray.remove_if`

```c3
<*
 @param filter : "The function to determine if it should be removed or not"
 @return "the number of deleted elements"
*>
fn usz ElasticArray.remove_if(&self, ElementPredicate filter)
```

---

#### `ElasticArray.retain_if`

```c3
<*
 @param selection : "The function to determine if it should be kept or not"
 @return "the number of deleted elements"
*>
fn usz ElasticArray.retain_if(&self, ElementPredicate selection)
```

---

#### `ElasticArray.remove_using_test`

```c3
fn usz ElasticArray.remove_using_test(&self, ElementTest filter, any context)
```

---

#### `ElasticArray.retain_using_test`

```c3
fn usz ElasticArray.retain_using_test(&self, ElementTest filter, any context)
```

---

#### `ElasticArray.@item_at`

```c3
macro Type ElasticArray.@item_at(&self, usz index) @operator([])
```

---

#### `ElasticArray.get_ref`

```c3
fn Type* ElasticArray.get_ref(&self, usz index) @operator(&[]) @inline
```

---

#### `ElasticArray.set`

```c3
fn void ElasticArray.set(&self, usz index, Type value) @operator([]=)
```

---

#### `ElasticArray.index_of`

```c3
fn usz? ElasticArray.index_of(&self, Type type) @if(ELEMENT_IS_EQUATABLE)
```

---

#### `ElasticArray.rindex_of`

```c3
fn usz? ElasticArray.rindex_of(&self, Type type) @if(ELEMENT_IS_EQUATABLE)
```

---

#### `ElasticArray.equals`

```c3
fn bool ElasticArray.equals(&self, ElasticArray other_list) @if(ELEMENT_IS_EQUATABLE)
```

---

#### `ElasticArray.contains`

```c3
<*
 @param [&in] self : "the list to find elements in"
 @param value : "The value to search for"
 @return "True if the value is found, false otherwise"
*>
fn bool ElasticArray.contains(&self, Type value) @if(ELEMENT_IS_EQUATABLE)
```

Check for presence of a value in a list.


---

#### `ElasticArray.remove_last_item`

```c3
<*
 @param [&inout] self : "The list to remove elements from"
 @param value : "The value to remove"
 @return "true if the value was found"
*>
fn bool ElasticArray.remove_last_item(&self, Type value) @if(ELEMENT_IS_EQUATABLE)
```

---

#### `ElasticArray.remove_first_item`

```c3
<*
 @param [&inout] self : "The list to remove elements from"
 @param value : "The value to remove"
 @return "true if the value was found"
*>
fn bool ElasticArray.remove_first_item(&self, Type value) @if(ELEMENT_IS_EQUATABLE)
```

---

#### `ElasticArray.remove_item`

```c3
<*
 @param [&inout] self : "The list to remove elements from"
 @param value : "The value to remove"
 @return "the number of deleted elements."
*>
fn usz ElasticArray.remove_item(&self, Type value) @if(ELEMENT_IS_EQUATABLE)
```

---

#### `ElasticArray.remove_all_from`

```c3
fn void ElasticArray.remove_all_from(&self, ElasticArray* other_list) @if(ELEMENT_IS_EQUATABLE)
```

---

#### `ElasticArray.compact_count`

```c3
<*
 @param [&in] self
 @return "The number non-null values in the list"
*>
fn usz ElasticArray.compact_count(&self) @if(ELEMENT_IS_POINTER)
```

---

#### `ElasticArray.compact`

```c3
fn usz ElasticArray.compact(&self) @if(ELEMENT_IS_POINTER)
```
### `std::collections::enummap{Enum, ValueType}`

---

#### `EnumMap`

```c3
struct EnumMap (Printable)
```

---

#### `EnumMap.init`

```c3
fn void EnumMap.init(&self, ValueType init_value)
```

---

#### `EnumMap.to_format`

```c3
fn usz? EnumMap.to_format(&self, Formatter* formatter) @dynamic
```

---

#### `EnumMap.len`

```c3
<*
 @return "The total size of this map, which is the same as the number of enum values"
 @pure
*>
fn usz EnumMap.len(&self) @operator(len) @inline
```

---

#### `EnumMap.get`

```c3
<*
 @return "Retrieve a value given the underlying enum, if there is no entry, then the zero value for the value is returned."
*>
fn ValueType EnumMap.get(&self, Enum key) @operator([]) @inline
```

---

#### `EnumMap.get_ref`

```c3
fn ValueType* EnumMap.get_ref(&self, Enum key) @operator(&[]) @inline
```

---

#### `EnumMap.set`

```c3
fn void EnumMap.set(&self, Enum key, ValueType value) @operator([]=) @inline
```
### `std::collections::enumset{Enum}`

---

#### `IS_CHAR_ARRAY`

```c3
const IS_CHAR_ARRAY = ENUM_COUNT > 128
```

---

#### `EnumSet`

```c3
typedef EnumSet (Printable) = EnumSetType
```

---

#### `EnumSet.add`

```c3
fn void EnumSet.add(&self, Enum v)
```

---

#### `EnumSet.clear`

```c3
fn void EnumSet.clear(&self)
```

---

#### `EnumSet.remove`

```c3
fn bool EnumSet.remove(&self, Enum v)
```

---

#### `EnumSet.has`

```c3
fn bool EnumSet.has(&self, Enum v)
```

---

#### `EnumSet.add_all`

```c3
fn void EnumSet.add_all(&self, EnumSet s)
```

---

#### `EnumSet.retain_all`

```c3
fn void EnumSet.retain_all(&self, EnumSet s)
```

---

#### `EnumSet.remove_all`

```c3
fn void EnumSet.remove_all(&self, EnumSet s)
```

---

#### `EnumSet.and_of`

```c3
fn EnumSet EnumSet.and_of(&self, EnumSet s)
```

---

#### `EnumSet.or_of`

```c3
fn EnumSet EnumSet.or_of(&self, EnumSet s)
```

---

#### `EnumSet.diff_of`

```c3
fn EnumSet EnumSet.diff_of(&self, EnumSet s)
```

---

#### `EnumSet.xor_of`

```c3
fn EnumSet EnumSet.xor_of(&self, EnumSet s)
```

---

#### `EnumSet.to_format`

```c3
fn usz? EnumSet.to_format(&set, Formatter* formatter) @dynamic
```

---

#### `type_for_enum_elements`

```c3
macro typeid type_for_enum_elements(usz $elements) @local
```
### `std::collections::growablebitset{Type}`

---

#### `BITS`

```c3
const BITS = Type.sizeof * 8
```

---

#### `GrowableBitSetList`

```c3
alias GrowableBitSetList = List{Type}
```

---

#### `GrowableBitSet`

```c3
struct GrowableBitSet
```

---

#### `GrowableBitSet.init`

```c3
<*
 @param initial_capacity
 @param [&inout] allocator : "The allocator to use, defaults to the heap allocator"
*>
fn GrowableBitSet* GrowableBitSet.init(&self, Allocator allocator, usz initial_capacity = 1)
```

---

#### `GrowableBitSet.tinit`

```c3
fn GrowableBitSet* GrowableBitSet.tinit(&self, usz initial_capacity = 1)
```

---

#### `GrowableBitSet.free`

```c3
fn void GrowableBitSet.free(&self)
```

---

#### `GrowableBitSet.cardinality`

```c3
fn usz GrowableBitSet.cardinality(&self)
```

---

#### `GrowableBitSet.set`

```c3
fn void GrowableBitSet.set(&self, usz i)
```

---

#### `GrowableBitSet.unset`

```c3
fn void GrowableBitSet.unset(&self, usz i)
```

---

#### `GrowableBitSet.get`

```c3
fn bool GrowableBitSet.get(&self, usz i) @operator([]) @inline
```

---

#### `GrowableBitSet.len`

```c3
fn usz GrowableBitSet.len(&self) @operator(len)
```

---

#### `GrowableBitSet.set_bool`

```c3
fn void GrowableBitSet.set_bool(&self, usz i, bool value) @operator([]=) @inline
```
### `std::collections::linkedlist{Type}`

---

#### `ELEMENT_IS_EQUATABLE`

```c3
const ELEMENT_IS_EQUATABLE = types::is_equatable_type(Type)
```

---

#### `LinkedList`

```c3
struct LinkedList
```

---

#### `LinkedList.init`

```c3
<*
 @param [&inout] allocator : "The allocator to use, defaults to the heap allocator"
 @return "the initialized list"
*>
fn LinkedList* LinkedList.init(&self, Allocator allocator)
```

---

#### `LinkedList.tinit`

```c3
fn LinkedList* LinkedList.tinit(&self)
```

---

#### `LinkedList.is_initialized`

```c3
fn bool LinkedList.is_initialized(&self) @inline
```

---

#### `LinkedList.free_node`

```c3
<*
 @require self.is_initialized()
*>
macro void LinkedList.free_node(&self, Node* node) @private
```

---

#### `LinkedList.alloc_node`

```c3
macro Node* LinkedList.alloc_node(&self) @private
```

---

#### `LinkedList.push_front`

```c3
fn void LinkedList.push_front(&self, Type value)
```

---

#### `LinkedList.push`

```c3
fn void LinkedList.push(&self, Type value)
```

---

#### `LinkedList.peek`

```c3
fn Type? LinkedList.peek(&self)
```

---

#### `LinkedList.peek_last`

```c3
fn Type? LinkedList.peek_last(&self)
```

---

#### `LinkedList.first`

```c3
fn Type? LinkedList.first(&self)
```

---

#### `LinkedList.last`

```c3
fn Type? LinkedList.last(&self)
```

---

#### `LinkedList.free`

```c3
fn void LinkedList.free(&self)
```

---

#### `LinkedList.clear`

```c3
fn void LinkedList.clear(&self)
```

---

#### `LinkedList.len`

```c3
fn usz LinkedList.len(&self) @inline
```

---

#### `LinkedList.node_at_index`

```c3
<*
 @require index < self.size
*>
macro Node* LinkedList.node_at_index(&self, usz index)
```

---

#### `LinkedList.get`

```c3
<*
 @require index < self.size
*>
fn Type LinkedList.get(&self, usz index)
```

---

#### `LinkedList.set`

```c3
<*
 @require index < self.size
*>
fn void LinkedList.set(&self, usz index, Type element)
```

---

#### `LinkedList.remove_at`

```c3
<*
 @require index < self.size
*>
fn void LinkedList.remove_at(&self, usz index)
```

---

#### `LinkedList.insert_at`

```c3
<*
 @require index <= self.size
*>
fn void LinkedList.insert_at(&self, usz index, Type element)
```

---

#### `LinkedList.link_before`

```c3
<*
 @require succ != null
*>
fn void LinkedList.link_before(&self, Node *succ, Type value) @private
```

---

#### `LinkedList.unlink_first`

```c3
<*
 @require self._first != null
*>
fn void LinkedList.unlink_first(&self) @private
```

---

#### `LinkedList.remove`

```c3
fn usz LinkedList.remove(&self, Type t) @if(ELEMENT_IS_EQUATABLE)
```

---

#### `LinkedList.pop`

```c3
fn Type? LinkedList.pop(&self)
```

---

#### `LinkedList.is_empty`

```c3
fn bool LinkedList.is_empty(&self)
```

---

#### `LinkedList.pop_front`

```c3
fn Type? LinkedList.pop_front(&self)
```

---

#### `LinkedList.remove_last`

```c3
fn void? LinkedList.remove_last(&self) @maydiscard
```

---

#### `LinkedList.remove_first`

```c3
fn void? LinkedList.remove_first(&self) @maydiscard
```

---

#### `LinkedList.remove_first_match`

```c3
fn bool LinkedList.remove_first_match(&self, Type t) @if(ELEMENT_IS_EQUATABLE)
```

---

#### `LinkedList.remove_last_match`

```c3
fn bool LinkedList.remove_last_match(&self, Type t)  @if(ELEMENT_IS_EQUATABLE)
```

---

#### `LinkedList.unlink_last`

```c3
<*
 @require self._last != null
*>
fn void LinkedList.unlink_last(&self) @inline @private
```

---

#### `LinkedList.unlink`

```c3
<*
 @require x != null
*>
fn void LinkedList.unlink(&self, Node* x) @private
```
### `std::collections::list_common`

---

#### `list_to_aligned_array`

```c3
macro list_to_aligned_array($Type, self, Allocator allocator)
```

IMPORTANT The returned array must be freed using free_aligned.


---

#### `list_to_array`

```c3
macro list_to_array($Type, self, Allocator allocator)
```

---

#### `list_reverse`

```c3
macro void list_reverse(self)
```

---

#### `list_remove_using_test`

```c3
macro usz list_remove_using_test(self, filter, bool $invert, ctx)
```

---

#### `list_compact`

```c3
macro usz list_compact(self)
```

---

#### `list_remove_item`

```c3
macro usz list_remove_item(self, value)
```

---

#### `list_remove_if`

```c3
macro usz list_remove_if(self, filter, bool $invert)
```
### `std::collections::list{Type}`

---

#### `ElementPredicate`

```c3
alias ElementPredicate = fn bool(Type *type)
```

---

#### `ElementTest`

```c3
alias ElementTest = fn bool(Type *type, any context)
```

---

#### `ELEMENT_IS_EQUATABLE`

```c3
const ELEMENT_IS_EQUATABLE = types::is_equatable_type(Type)
```

---

#### `ELEMENT_IS_POINTER`

```c3
const ELEMENT_IS_POINTER = Type.kindof == POINTER
```

---

#### `LIST_HEAP_ALLOCATOR`

```c3
const Allocator LIST_HEAP_ALLOCATOR = (Allocator)&dummy
```

---

#### `ONHEAP`

```c3
const List ONHEAP = { .allocator = LIST_HEAP_ALLOCATOR }
```

---

#### `type_is_overaligned`

```c3
macro type_is_overaligned()
```

---

#### `List`

```c3
struct List (Printable)
```

---

#### `List.init`

```c3
<*
 @param initial_capacity : "The initial capacity to reserve"
 @param [&inout] allocator : "The allocator to use, defaults to the heap allocator"
*>
fn List* List.init(&self, Allocator allocator, usz initial_capacity = 16)
```

---

#### `List.tinit`

```c3
<*
 @param initial_capacity : "The initial capacity to reserve"
*>
fn List* List.tinit(&self, usz initial_capacity = 16)
```

Initialize the list using the temp allocator.


---

#### `List.init_with_array`

```c3
<*
 @param [in] values : `The values to initialize the list with.`
 @require self.size == 0 : "The List must be empty"
*>
fn List* List.init_with_array(&self, Allocator allocator, Type[] values)
```

Initialize a new list with an array.


---

#### `List.tinit_with_array`

```c3
<*
 @param [in] values : `The values to initialize the list with.`
 @require self.size == 0 : "The List must be empty"
*>
fn List* List.tinit_with_array(&self, Type[] values)
```

Initialize a temporary list with an array.


---

#### `List.init_wrapping_array`

```c3
<*
 @require !self.is_initialized() : "The List must not be allocated"
*>
fn void List.init_wrapping_array(&self, Allocator allocator, Type[] types)
```

---

#### `List.is_initialized`

```c3
fn bool List.is_initialized(&self) @inline
```

---

#### `List.to_format`

```c3
fn usz? List.to_format(&self, Formatter* formatter) @dynamic
```

---

#### `List.push`

```c3
fn void List.push(&self, Type element) @inline
```

---

#### `List.pop`

```c3
fn Type? List.pop(&self)
```

---

#### `List.clear`

```c3
fn void List.clear(&self)
```

---

#### `List.pop_first`

```c3
fn Type? List.pop_first(&self)
```

---

#### `List.remove_at`

```c3
<*
 @require index < self.size : `Removed element out of bounds`
*>
fn void List.remove_at(&self, usz index)
```

---

#### `List.add_all`

```c3
fn void List.add_all(&self, List* other_list)
```

---

#### `List.to_aligned_array`

```c3
fn Type[] List.to_aligned_array(&self, Allocator allocator)
```

IMPORTANT The returned array must be freed using free_aligned.


---

#### `List.to_array`

```c3
<*
 @require !type_is_overaligned() : "This function is not available on overaligned types"
*>
macro Type[] List.to_array(&self, Allocator allocator)
```

---

#### `List.to_tarray`

```c3
fn Type[] List.to_tarray(&self)
```

---

#### `List.reverse`

```c3
fn void List.reverse(&self)
```

Reverse the elements in a list.


---

#### `List.array_view`

```c3
fn Type[] List.array_view(&self)
```

---

#### `List.add_array`

```c3
<*
 @param [in] array
 @ensure self.size >= array.len
*>
fn void List.add_array(&self, Type[] array)
```

Add the values of an array to this list.


---

#### `List.push_front`

```c3
fn void List.push_front(&self, Type type) @inline
```

---

#### `List.insert_at`

```c3
<*
 @require index <= self.size : `Insert was out of bounds`
*>
fn void List.insert_at(&self, usz index, Type type)
```

---

#### `List.set_at`

```c3
<*
 @require index < self.size
*>
fn void List.set_at(&self, usz index, Type type)
```

---

#### `List.remove_last`

```c3
fn void? List.remove_last(&self) @maydiscard
```

---

#### `List.remove_first`

```c3
fn void? List.remove_first(&self) @maydiscard
```

---

#### `List.first`

```c3
fn Type? List.first(&self)
```

---

#### `List.last`

```c3
fn Type? List.last(&self)
```

---

#### `List.is_empty`

```c3
fn bool List.is_empty(&self) @inline
```

---

#### `List.byte_size`

```c3
fn usz List.byte_size(&self) @inline
```

---

#### `List.len`

```c3
fn usz List.len(&self) @operator(len) @inline
```

---

#### `List.get`

```c3
<*
 @require index < self.size : `Access out of bounds`
*>
fn Type List.get(&self, usz index) @inline
```

---

#### `List.free`

```c3
fn void List.free(&self)
```

---

#### `List.swap`

```c3
<*
 @require i < self.size && j < self.size : `Access out of bounds`
*>
fn void List.swap(&self, usz i, usz j)
```

---

#### `List.remove_if`

```c3
<*
 @param filter : "The function to determine if it should be removed or not"
 @return "the number of deleted elements"
*>
fn usz List.remove_if(&self, ElementPredicate filter)
```

---

#### `List.retain_if`

```c3
<*
 @param selection : "The function to determine if it should be kept or not"
 @return "the number of deleted elements"
*>
fn usz List.retain_if(&self, ElementPredicate selection)
```

---

#### `List.remove_using_test`

```c3
fn usz List.remove_using_test(&self, ElementTest filter, any context)
```

---

#### `List.retain_using_test`

```c3
fn usz List.retain_using_test(&self, ElementTest filter, any context)
```

---

#### `List.ensure_capacity`

```c3
fn void List.ensure_capacity(&self, usz min_capacity) @local
```

---

#### `List.@item_at`

```c3
<*
 @require index < self.size : `Access out of bounds`
*>
macro Type List.@item_at(&self, usz index) @operator([])
```

---

#### `List.get_ref`

```c3
<*
 @require index < self.size : `Access out of bounds`
*>
fn Type* List.get_ref(&self, usz index) @operator(&[]) @inline
```

---

#### `List.set`

```c3
<*
 @require index < self.size : `Access out of bounds`
*>
fn void List.set(&self, usz index, Type value) @operator([]=)
```

---

#### `List.reserve`

```c3
fn void List.reserve(&self, usz added)
```

---

#### `List._update_size_change`

```c3
fn void List._update_size_change(&self,usz old_size, usz new_size)
```

---

#### `List.set_size`

```c3
<*
 @require new_size == 0 || self.capacity != 0
*>
fn usz List.set_size(&self, usz new_size) @inline @private
```

---

#### `List.pre_free`

```c3
macro void List.pre_free(&self) @private
```

---

#### `List.post_alloc`

```c3
<*
 @require self.capacity > 0
*>
macro void List.post_alloc(&self) @private
```

---

#### `List.index_of`

```c3
fn usz? List.index_of(&self, Type type) @if(ELEMENT_IS_EQUATABLE)
```

---

#### `List.rindex_of`

```c3
fn usz? List.rindex_of(&self, Type type) @if(ELEMENT_IS_EQUATABLE)
```

---

#### `List.equals`

```c3
fn bool List.equals(&self, List other_list) @if(ELEMENT_IS_EQUATABLE)
```

---

#### `List.contains`

```c3
<*
 @param [&in] self : "the list to find elements in"
 @param value : "The value to search for"
 @return "True if the value is found, false otherwise"
*>
fn bool List.contains(&self, Type value) @if(ELEMENT_IS_EQUATABLE)
```

Check for presence of a value in a list.


---

#### `List.remove_last_item`

```c3
<*
 @param [&inout] self : "The list to remove elements from"
 @param value : "The value to remove"
 @return "true if the value was found"
*>
fn bool List.remove_last_item(&self, Type value) @if(ELEMENT_IS_EQUATABLE)
```

---

#### `List.remove_first_item`

```c3
<*
 @param [&inout] self : "The list to remove elements from"
 @param value : "The value to remove"
 @return "true if the value was found"
*>
fn bool List.remove_first_item(&self, Type value) @if(ELEMENT_IS_EQUATABLE)
```

---

#### `List.remove_item`

```c3
<*
 @param [&inout] self : "The list to remove elements from"
 @param value : "The value to remove"
 @return "the number of deleted elements."
*>
fn usz List.remove_item(&self, Type value) @if(ELEMENT_IS_EQUATABLE)
```

---

#### `List.remove_all_from`

```c3
fn void List.remove_all_from(&self, List* other_list) @if(ELEMENT_IS_EQUATABLE)
```

---

#### `List.compact_count`

```c3
<*
 @param [&in] self
 @return "The number non-null values in the list"
*>
fn usz List.compact_count(&self) @if(ELEMENT_IS_POINTER)
```

---

#### `List.compact`

```c3
fn usz List.compact(&self) @if(ELEMENT_IS_POINTER)
```
### `std::collections::map{Key, Value}`

---

#### `DEFAULT_INITIAL_CAPACITY`

```c3
const uint DEFAULT_INITIAL_CAPACITY = 16
```

---

#### `MAXIMUM_CAPACITY`

```c3
const uint MAXIMUM_CAPACITY = 1u << 31
```

---

#### `DEFAULT_LOAD_FACTOR`

```c3
const float DEFAULT_LOAD_FACTOR = 0.75
```

---

#### `VALUE_IS_EQUATABLE`

```c3
const VALUE_IS_EQUATABLE = Value.is_eq
```

---

#### `COPY_KEYS`

```c3
const bool COPY_KEYS = types::implements_copy(Key)
```

---

#### `MAP_HEAP_ALLOCATOR`

```c3
const Allocator MAP_HEAP_ALLOCATOR = (Allocator)&dummy
```

---

#### `ONHEAP`

```c3
const HashMap ONHEAP = { .allocator = MAP_HEAP_ALLOCATOR }
```

---

#### `Entry`

```c3
struct Entry
```

---

#### `HashMap`

```c3
struct HashMap (Printable)
```

---

#### `HashMap.init`

```c3
<*
 @param [&inout] allocator : "The allocator to use"
 @require capacity > 0 : "The capacity must be 1 or higher"
 @require load_factor > 0.0 : "The load factor must be higher than 0"
 @require !self.is_initialized() : "Map was already initialized"
 @require capacity < MAXIMUM_CAPACITY : "Capacity cannot exceed maximum"
*>
fn HashMap* HashMap.init(&self, Allocator allocator, uint capacity = DEFAULT_INITIAL_CAPACITY, float load_factor = DEFAULT_LOAD_FACTOR)
```

---

#### `HashMap.tinit`

```c3
<*
 @require capacity > 0 : "The capacity must be 1 or higher"
 @require load_factor > 0.0 : "The load factor must be higher than 0"
 @require !self.is_initialized() : "Map was already initialized"
 @require capacity < MAXIMUM_CAPACITY : "Capacity cannot exceed maximum"
*>
fn HashMap* HashMap.tinit(&self, uint capacity = DEFAULT_INITIAL_CAPACITY, float load_factor = DEFAULT_LOAD_FACTOR)
```

---

#### `HashMap.init_with_key_values`

```c3
<*
 @param [&inout] allocator : "The allocator to use"
 @require $vacount % 2 == 0 : "There must be an even number of arguments provided for keys and values"
 @require capacity > 0 : "The capacity must be 1 or higher"
 @require load_factor > 0.0 : "The load factor must be higher than 0"
 @require !self.is_initialized() : "Map was already initialized"
 @require capacity < MAXIMUM_CAPACITY : "Capacity cannot exceed maximum"
*>
macro HashMap* HashMap.init_with_key_values(&self, Allocator allocator, ..., uint capacity = DEFAULT_INITIAL_CAPACITY, float load_factor = DEFAULT_LOAD_FACTOR)
```

---

#### `HashMap.tinit_with_key_values`

```c3
<*
 @require $vacount % 2 == 0 : "There must be an even number of arguments provided for keys and values"
 @require capacity > 0 : "The capacity must be 1 or higher"
 @require load_factor > 0.0 : "The load factor must be higher than 0"
 @require !self.is_initialized() : "Map was already initialized"
 @require capacity < MAXIMUM_CAPACITY : "Capacity cannot exceed maximum"
*>
macro HashMap* HashMap.tinit_with_key_values(&self, ..., uint capacity = DEFAULT_INITIAL_CAPACITY, float load_factor = DEFAULT_LOAD_FACTOR)
```

---

#### `HashMap.init_from_keys_and_values`

```c3
<*
 @param [in] keys : "The keys for the HashMap entries"
 @param [in] values : "The values for the HashMap entries"
 @param [&inout] allocator : "The allocator to use"
 @require keys.len == values.len : "Both keys and values arrays must be the same length"
 @require capacity > 0 : "The capacity must be 1 or higher"
 @require load_factor > 0.0 : "The load factor must be higher than 0"
 @require !self.is_initialized() : "Map was already initialized"
 @require capacity < MAXIMUM_CAPACITY : "Capacity cannot exceed maximum"
*>
fn HashMap* HashMap.init_from_keys_and_values(&self, Allocator allocator, Key[] keys, Value[] values, uint capacity = DEFAULT_INITIAL_CAPACITY, float load_factor = DEFAULT_LOAD_FACTOR)
```

---

#### `HashMap.tinit_from_keys_and_values`

```c3
<*
 @param [in] keys : "The keys for the HashMap entries"
 @param [in] values : "The values for the HashMap entries"
 @require keys.len == values.len : "Both keys and values arrays must be the same length"
 @require capacity > 0 : "The capacity must be 1 or higher"
 @require load_factor > 0.0 : "The load factor must be higher than 0"
 @require !self.is_initialized() : "Map was already initialized"
 @require capacity < MAXIMUM_CAPACITY : "Capacity cannot exceed maximum"
*>
fn HashMap* HashMap.tinit_from_keys_and_values(&self, Key[] keys, Value[] values, uint capacity = DEFAULT_INITIAL_CAPACITY, float load_factor = DEFAULT_LOAD_FACTOR)
```

---

#### `HashMap.is_initialized`

```c3
<*
 @param [&in] map : "The hash map we are testing"
 @return "Returns true if it has been initialized, false otherwise"
*>
fn bool HashMap.is_initialized(&map)
```

Has this hash map been initialized yet?


---

#### `HashMap.init_from_map`

```c3
<*
 @param [&inout] allocator : "The allocator to use"
 @param [&in] other_map : "The map to copy from."
 @require !self.is_initialized() : "Map was already initialized"
*>
fn HashMap* HashMap.init_from_map(&self, Allocator allocator, HashMap* other_map)
```

---

#### `HashMap.tinit_from_map`

```c3
<*
 @param [&in] other_map : "The map to copy from."
 @require !map.is_initialized() : "Map was already initialized"
*>
fn HashMap* HashMap.tinit_from_map(&map, HashMap* other_map)
```

---

#### `HashMap.is_empty`

```c3
fn bool HashMap.is_empty(&map) @inline
```

---

#### `HashMap.len`

```c3
fn usz HashMap.len(&map) @inline
```

---

#### `HashMap.get_ref`

```c3
fn Value*? HashMap.get_ref(&map, Key key)
```

---

#### `HashMap.get_entry`

```c3
fn Entry*? HashMap.get_entry(&map, Key key)
```

---

#### `HashMap.@get_or_set`

```c3
<*
 @require @assignable_to(#expr, Value)
*>
macro Value HashMap.@get_or_set(&map, Key key, Value #expr)
```

Get the value or update and


---

#### `HashMap.get`

```c3
fn Value? HashMap.get(&map, Key key) @operator([])
```

---

#### `HashMap.has_key`

```c3
fn bool HashMap.has_key(&map, Key key)
```

---

#### `HashMap.set`

```c3
fn bool HashMap.set(&map, Key key, Value value) @operator([]=)
```

---

#### `HashMap.remove`

```c3
fn void? HashMap.remove(&map, Key key) @maydiscard
```

---

#### `HashMap.clear`

```c3
fn void HashMap.clear(&map)
```

---

#### `HashMap.free`

```c3
fn void HashMap.free(&map)
```

---

#### `HashMap.tkeys`

```c3
fn Key[] HashMap.tkeys(&self)
```

---

#### `HashMap.keys`

```c3
fn Key[] HashMap.keys(&self, Allocator allocator)
```

---

#### `HashMap.@each`

```c3
macro HashMap.@each(map; @body(key, value))
```

---

#### `HashMap.@each_entry`

```c3
macro HashMap.@each_entry(map; @body(entry))
```

---

#### `HashMap.tvalues`

```c3
fn Value[] HashMap.tvalues(&map)
```

---

#### `HashMap.values`

```c3
fn Value[] HashMap.values(&self, Allocator allocator)
```

---

#### `HashMap.has_value`

```c3
fn bool HashMap.has_value(&map, Value v) @if(VALUE_IS_EQUATABLE)
```

---

#### `HashMap.iter`

```c3
fn HashMapIterator HashMap.iter(&self)
```

---

#### `HashMap.value_iter`

```c3
fn HashMapValueIterator HashMap.value_iter(&self)
```

---

#### `HashMap.key_iter`

```c3
fn HashMapKeyIterator HashMap.key_iter(&self)
```

---

#### `HashMap.add_entry`

```c3
fn void HashMap.add_entry(&map, uint hash, Key key, Value value, uint bucket_index) @private
```

---

#### `HashMap.resize`

```c3
fn void HashMap.resize(&map, uint new_capacity) @private
```

---

#### `HashMap.to_format`

```c3
fn usz? HashMap.to_format(&self, Formatter* f) @dynamic
```

---

#### `HashMap.transfer`

```c3
fn void HashMap.transfer(&map, Entry*[] new_table) @private
```

---

#### `HashMap.put_all_for_create`

```c3
fn void HashMap.put_all_for_create(&map, HashMap* other_map) @private
```

---

#### `HashMap.put_for_create`

```c3
fn void HashMap.put_for_create(&map, Key key, Value value) @private
```

---

#### `HashMap.free_internal`

```c3
fn void HashMap.free_internal(&map, void* ptr) @inline @private
```

---

#### `HashMap.remove_entry_for_key`

```c3
fn bool HashMap.remove_entry_for_key(&map, Key key) @private
```

---

#### `HashMap.create_entry`

```c3
fn void HashMap.create_entry(&map, uint hash, Key key, Value value, int bucket_index) @private
```

---

#### `HashMap.free_entry`

```c3
fn void HashMap.free_entry(&self, Entry *entry) @local
```

---

#### `HashMapIterator`

```c3
struct HashMapIterator
```

---

#### `HashMapValueIterator`

```c3
typedef HashMapValueIterator = HashMapIterator
```

---

#### `HashMapKeyIterator`

```c3
typedef HashMapKeyIterator = HashMapIterator
```

---

#### `HashMapIterator.get`

```c3
<*
 @require idx < self.map.count
*>
fn Entry HashMapIterator.get(&self, usz idx) @operator([])
```

---

#### `HashMapValueIterator.get`

```c3
fn Value HashMapValueIterator.get(&self, usz idx) @operator([])
```

---

#### `HashMapKeyIterator.get`

```c3
fn Key HashMapKeyIterator.get(&self, usz idx) @operator([])
```

---

#### `HashMapValueIterator.len`

```c3
fn usz HashMapValueIterator.len(self) @operator(len)
```

---

#### `HashMapKeyIterator.len`

```c3
fn usz HashMapKeyIterator.len(self) @operator(len)
```

---

#### `HashMapIterator.len`

```c3
fn usz HashMapIterator.len(self) @operator(len)
```

---

#### `rehash`

```c3
fn uint rehash(uint hash) @inline @private
```

---

#### `index_for`

```c3
macro uint index_for(uint hash, uint capacity) @private
```

---

#### `LINKEDONHEAP`

```c3
const LinkedHashMap LINKEDONHEAP = { .allocator = MAP_HEAP_ALLOCATOR }
```

---

#### `LinkedEntry`

```c3
struct LinkedEntry
```

---

#### `LinkedHashMap`

```c3
struct LinkedHashMap (Printable)
```

---

#### `LinkedHashMap.init`

```c3
<*
 @param [&inout] allocator : "The allocator to use"
 @require capacity > 0 : "The capacity must be 1 or higher"
 @require load_factor > 0.0 : "The load factor must be higher than 0"
 @require !self.is_initialized() : "Map was already initialized"
 @require capacity < MAXIMUM_CAPACITY : "Capacity cannot exceed maximum"
*>
fn LinkedHashMap* LinkedHashMap.init(&self, Allocator allocator, usz capacity = DEFAULT_INITIAL_CAPACITY, float load_factor = DEFAULT_LOAD_FACTOR)
```

---

#### `LinkedHashMap.tinit`

```c3
<*
 @require capacity > 0 : "The capacity must be 1 or higher"
 @require load_factor > 0.0 : "The load factor must be higher than 0"
 @require !self.is_initialized() : "Map was already initialized"
 @require capacity < MAXIMUM_CAPACITY : "Capacity cannot exceed maximum"
*>
fn LinkedHashMap* LinkedHashMap.tinit(&self, usz capacity = DEFAULT_INITIAL_CAPACITY, float load_factor = DEFAULT_LOAD_FACTOR)
```

---

#### `LinkedHashMap.init_with_key_values`

```c3
<*
 @param [&inout] allocator : "The allocator to use"
 @require $vacount % 2 == 0 : "There must be an even number of arguments provided for keys and values"
 @require capacity > 0 : "The capacity must be 1 or higher"
 @require load_factor > 0.0 : "The load factor must be higher than 0"
 @require !self.is_initialized() : "Map was already initialized"
 @require capacity < MAXIMUM_CAPACITY : "Capacity cannot exceed maximum"
*>
macro LinkedHashMap* LinkedHashMap.init_with_key_values(&self, Allocator allocator, ..., uint capacity = DEFAULT_INITIAL_CAPACITY, float load_factor = DEFAULT_LOAD_FACTOR)
```

---

#### `LinkedHashMap.tinit_with_key_values`

```c3
<*
 @require $vacount % 2 == 0 : "There must be an even number of arguments provided for keys and values"
 @require capacity > 0 : "The capacity must be 1 or higher"
 @require load_factor > 0.0 : "The load factor must be higher than 0"
 @require !self.is_initialized() : "Map was already initialized"
 @require capacity < MAXIMUM_CAPACITY : "Capacity cannot exceed maximum"
*>
macro LinkedHashMap* LinkedHashMap.tinit_with_key_values(&self, ..., uint capacity = DEFAULT_INITIAL_CAPACITY, float load_factor = DEFAULT_LOAD_FACTOR)
```

---

#### `LinkedHashMap.init_from_keys_and_values`

```c3
<*
 @param [in] keys : "The keys for the LinkedHashMap entries"
 @param [in] values : "The values for the LinkedHashMap entries"
 @param [&inout] allocator : "The allocator to use"
 @require keys.len == values.len : "Both keys and values arrays must be the same length"
 @require capacity > 0 : "The capacity must be 1 or higher"
 @require load_factor > 0.0 : "The load factor must be higher than 0"
 @require !self.is_initialized() : "Map was already initialized"
 @require capacity < MAXIMUM_CAPACITY : "Capacity cannot exceed maximum"
*>
fn LinkedHashMap* LinkedHashMap.init_from_keys_and_values(&self, Allocator allocator, Key[] keys, Value[] values, uint capacity = DEFAULT_INITIAL_CAPACITY, float load_factor = DEFAULT_LOAD_FACTOR)
```

---

#### `LinkedHashMap.tinit_from_keys_and_values`

```c3
<*
 @param [in] keys : "The keys for the LinkedHashMap entries"
 @param [in] values : "The values for the LinkedHashMap entries"
 @require keys.len == values.len : "Both keys and values arrays must be the same length"
 @require capacity > 0 : "The capacity must be 1 or higher"
 @require load_factor > 0.0 : "The load factor must be higher than 0"
 @require !self.is_initialized() : "Map was already initialized"
 @require capacity < MAXIMUM_CAPACITY : "Capacity cannot exceed maximum"
*>
fn LinkedHashMap* LinkedHashMap.tinit_from_keys_and_values(&self, Key[] keys, Value[] values, uint capacity = DEFAULT_INITIAL_CAPACITY, float load_factor = DEFAULT_LOAD_FACTOR)
```

---

#### `LinkedHashMap.is_initialized`

```c3
<*
 @param [&in] map : "The hash map we are testing"
 @return "Returns true if it has been initialized, false otherwise"
*>
fn bool LinkedHashMap.is_initialized(&map)
```

Has this hash map been initialized yet?


---

#### `LinkedHashMap.init_from_map`

```c3
<*
 @param [&inout] allocator : "The allocator to use"
 @param [&in] other_map : "The map to copy from."
 @require !self.is_initialized() : "Map was already initialized"
*>
fn LinkedHashMap* LinkedHashMap.init_from_map(&self, Allocator allocator, LinkedHashMap* other_map)
```

---

#### `LinkedHashMap.tinit_from_map`

```c3
<*
 @param [&in] other_map : "The map to copy from."
 @require !map.is_initialized() : "Map was already initialized"
*>
fn LinkedHashMap* LinkedHashMap.tinit_from_map(&map, LinkedHashMap* other_map)
```

---

#### `LinkedHashMap.is_empty`

```c3
fn bool LinkedHashMap.is_empty(&map) @inline
```

---

#### `LinkedHashMap.len`

```c3
fn usz LinkedHashMap.len(&map) @inline
```

---

#### `LinkedHashMap.get_ref`

```c3
fn Value*? LinkedHashMap.get_ref(&map, Key key)
```

---

#### `LinkedHashMap.get_entry`

```c3
fn LinkedEntry*? LinkedHashMap.get_entry(&map, Key key)
```

---

#### `LinkedHashMap.@get_or_set`

```c3
<*
 @require @assignable_to(#expr, Value)
*>
macro Value LinkedHashMap.@get_or_set(&map, Key key, Value #expr)
```

Get the value or update and


---

#### `LinkedHashMap.get`

```c3
fn Value? LinkedHashMap.get(&map, Key key) @operator([])
```

---

#### `LinkedHashMap.has_key`

```c3
fn bool LinkedHashMap.has_key(&map, Key key)
```

---

#### `LinkedHashMap.set`

```c3
fn bool LinkedHashMap.set(&map, Key key, Value value) @operator([]=)
```

---

#### `LinkedHashMap.remove`

```c3
fn void? LinkedHashMap.remove(&map, Key key) @maydiscard
```

---

#### `LinkedHashMap.clear`

```c3
fn void LinkedHashMap.clear(&map)
```

---

#### `LinkedHashMap.free`

```c3
fn void LinkedHashMap.free(&map)
```

---

#### `LinkedHashMap.tkeys`

```c3
fn Key[] LinkedHashMap.tkeys(&self)
```

---

#### `LinkedHashMap.keys`

```c3
fn Key[] LinkedHashMap.keys(&self, Allocator allocator)
```

---

#### `LinkedHashMap.@each`

```c3
macro LinkedHashMap.@each(map; @body(key, value))
```

---

#### `LinkedHashMap.@each_entry`

```c3
macro LinkedHashMap.@each_entry(map; @body(entry))
```

---

#### `LinkedHashMap.tvalues`

```c3
fn Value[] LinkedHashMap.tvalues(&map)
```

---

#### `LinkedHashMap.values`

```c3
fn Value[] LinkedHashMap.values(&self, Allocator allocator)
```

---

#### `LinkedHashMap.has_value`

```c3
fn bool LinkedHashMap.has_value(&map, Value v) @if(VALUE_IS_EQUATABLE)
```

---

#### `LinkedHashMap.iter`

```c3
fn LinkedHashMapIterator LinkedHashMap.iter(&self)
```

---

#### `LinkedHashMap.value_iter`

```c3
fn LinkedHashMapValueIterator LinkedHashMap.value_iter(&self)
```

---

#### `LinkedHashMap.key_iter`

```c3
fn LinkedHashMapKeyIterator LinkedHashMap.key_iter(&self)
```

---

#### `LinkedHashMapIterator.next`

```c3
fn bool LinkedHashMapIterator.next(&self)
```

---

#### `LinkedHashMapIterator.get`

```c3
fn LinkedEntry*? LinkedHashMapIterator.get(&self)
```

---

#### `LinkedHashMapValueIterator.get`

```c3
fn Value*? LinkedHashMapValueIterator.get(&self)
```

---

#### `LinkedHashMapKeyIterator.get`

```c3
fn Key*? LinkedHashMapKeyIterator.get(&self)
```

---

#### `LinkedHashMapIterator.has_next`

```c3
fn bool LinkedHashMapIterator.has_next(&self)
```

---

#### `LinkedHashMap.add_entry`

```c3
fn void LinkedHashMap.add_entry(&map, uint hash, Key key, Value value, uint bucket_index) @private
```

---

#### `LinkedHashMap.resize`

```c3
fn void LinkedHashMap.resize(&map, uint new_capacity) @private
```

---

#### `LinkedHashMap.to_format`

```c3
fn usz? LinkedHashMap.to_format(&self, Formatter* f) @dynamic
```

---

#### `LinkedHashMap.transfer`

```c3
fn void LinkedHashMap.transfer(&map, LinkedEntry*[] new_table) @private
```

---

#### `LinkedHashMap.put_all_for_create`

```c3
fn void LinkedHashMap.put_all_for_create(&map, LinkedHashMap* other_map) @private
```

---

#### `LinkedHashMap.put_for_create`

```c3
fn void LinkedHashMap.put_for_create(&map, Key key, Value value) @private
```

---

#### `LinkedHashMap.free_internal`

```c3
fn void LinkedHashMap.free_internal(&map, void* ptr) @inline @private
```

---

#### `LinkedHashMap.remove_entry_for_key`

```c3
fn bool LinkedHashMap.remove_entry_for_key(&map, Key key) @private
```

---

#### `LinkedHashMap.create_entry`

```c3
fn void LinkedHashMap.create_entry(&map, uint hash, Key key, Value value, int bucket_index) @private
```

---

#### `LinkedHashMap.free_entry`

```c3
fn void LinkedHashMap.free_entry(&self, LinkedEntry *entry) @local
```

---

#### `LinkedHashMapIterator`

```c3
struct LinkedHashMapIterator
```

---

#### `LinkedHashMapValueIterator`

```c3
typedef LinkedHashMapValueIterator = inline LinkedHashMapIterator
```

---

#### `LinkedHashMapKeyIterator`

```c3
typedef LinkedHashMapKeyIterator = inline LinkedHashMapIterator
```

---

#### `LinkedHashMapValueIterator.len`

```c3
fn usz LinkedHashMapValueIterator.len(self) @operator(len)
```

---

#### `LinkedHashMapKeyIterator.len`

```c3
fn usz LinkedHashMapKeyIterator.len(self) @operator(len)
```

---

#### `LinkedHashMapIterator.len`

```c3
fn usz LinkedHashMapIterator.len(self) @operator(len)
```
### `std::collections::maybe{Type}`

---

#### `Maybe`

```c3
struct Maybe (Printable)
```

---

#### `Maybe.to_format`

```c3
fn usz? Maybe.to_format(&self, Formatter* f) @dynamic
```

---

#### `Maybe.set`

```c3
fn void Maybe.set(&self, Type val)
```

---

#### `Maybe.reset`

```c3
fn void Maybe.reset(&self)
```

---

#### `value`

```c3
fn Maybe value(Type val)
```

---

#### `EMPTY`

```c3
const Maybe EMPTY = { }
```

---

#### `Maybe.get`

```c3
macro Type? Maybe.get(self)
```

---

#### `Maybe.equals`

```c3
fn bool Maybe.equals(self, Maybe other) @operator(==) @if(types::is_equatable_type(Type))
```
### `std::collections::object`

---

#### `TRUE_OBJECT`

```c3
const Object TRUE_OBJECT = { .b = true, .type = bool.typeid }
```

---

#### `FALSE_OBJECT`

```c3
const Object FALSE_OBJECT = { .b = false, .type = bool.typeid }
```

---

#### `NULL_OBJECT`

```c3
const Object NULL_OBJECT = { .type = void*.typeid }
```

---

#### `Object`

```c3
struct Object (Printable)
```

---

#### `Object.to_format`

```c3
fn usz? Object.to_format(&self, Formatter* formatter) @dynamic
```

---

#### `new_obj`

```c3
fn Object* new_obj(Allocator allocator)
```

---

#### `new_null`

```c3
fn Object* new_null()
```

---

#### `new_int`

```c3
fn Object* new_int(int128 i, Allocator allocator)
```

---

#### `new_enum`

```c3
macro Object* new_enum(e, Allocator allocator)
```

---

#### `new_float`

```c3
fn Object* new_float(double f, Allocator allocator)
```

---

#### `new_string`

```c3
fn Object* new_string(String s, Allocator allocator)
```

---

#### `new_bool`

```c3
fn Object* new_bool(bool b)
```

---

#### `Object.free`

```c3
fn void Object.free(&self)
```

---

#### `Object.is_null`

```c3
fn bool Object.is_null(&self) @inline
```

---

#### `Object.is_empty`

```c3
fn bool Object.is_empty(&self) @inline
```

---

#### `Object.is_map`

```c3
fn bool Object.is_map(&self) @inline
```

---

#### `Object.is_array`

```c3
fn bool Object.is_array(&self) @inline
```

---

#### `Object.is_bool`

```c3
fn bool Object.is_bool(&self) @inline
```

---

#### `Object.is_string`

```c3
fn bool Object.is_string(&self) @inline
```

---

#### `Object.is_float`

```c3
fn bool Object.is_float(&self) @inline
```

---

#### `Object.is_int`

```c3
fn bool Object.is_int(&self) @inline
```

---

#### `Object.is_keyable`

```c3
fn bool Object.is_keyable(&self)
```

---

#### `Object.is_indexable`

```c3
fn bool Object.is_indexable(&self)
```

---

#### `Object.init_map_if_needed`

```c3
<*
 @require self.is_keyable()
*>
fn void Object.init_map_if_needed(&self) @private
```

---

#### `Object.init_array_if_needed`

```c3
<*
 @require self.is_indexable()
*>
fn void Object.init_array_if_needed(&self) @private
```

---

#### `Object.set_object`

```c3
<*
 @require self.is_keyable()
*>
fn void Object.set_object(&self, String key, Object* new_object) @private
```

---

#### `Object.object_from_value`

```c3
<*
 @require self.allocator != null : "This object is not properly initialized, was it really created using 'new'"
 @require !@typeis(value, void*) ||| value == null : "void pointers cannot be stored in an object"
*>
macro Object* Object.object_from_value(&self, value) @private
```

---

#### `Object.set`

```c3
macro Object* Object.set(&self, String key, value)
```

---

#### `Object.set_at`

```c3
<*
 @require self.is_indexable()
*>
macro Object* Object.set_at(&self, usz index, String key, value)
```

---

#### `Object.push`

```c3
<*
 @require self.is_indexable()
 @ensure return != null
*>
macro Object* Object.push(&self, value)
```

---

#### `Object.get`

```c3
<*
 @require self.is_keyable()
*>
fn Object*? Object.get(&self, String key)
```

---

#### `Object.has_key`

```c3
fn bool Object.has_key(&self, String key)
```

---

#### `Object.get_at`

```c3
<*
 @require self.is_indexable()
*>
fn Object* Object.get_at(&self, usz index)
```

---

#### `Object.get_len`

```c3
<*
 @require self.is_indexable()
*>
fn usz Object.get_len(&self)
```

---

#### `Object.push_object`

```c3
<*
 @require self.is_indexable()
*>
fn void Object.push_object(&self, Object* to_append)
```

---

#### `Object.set_object_at`

```c3
<*
 @require self.is_indexable()
*>
fn void Object.set_object_at(&self, usz index, Object* to_set)
```

---

#### `get_integer_value`

```c3
<*
 @require $Type.kindof.is_int() : "Expected an integer type."
*>
macro get_integer_value(Object* value, $Type)
```

---

#### `Object.get_integer_at`

```c3
<*
 @require self.is_indexable()
 @require $Type.kindof.is_int() : "Expected an integer type"
*>
macro Object.get_integer_at(&self, $Type, usz index) @private
```

---

#### `Object.get_integer`

```c3
<*
 @require self.is_keyable()
 @require $Type.kindof.is_int() : "Expected an integer type"
*>
macro Object.get_integer(&self, $Type, String key) @private
```

---

#### `Object.get_ichar`

```c3
fn ichar? Object.get_ichar(&self, String key)
```

---

#### `Object.get_short`

```c3
fn short? Object.get_short(&self, String key)
```

---

#### `Object.get_int`

```c3
fn int? Object.get_int(&self, String key)
```

---

#### `Object.get_long`

```c3
fn long? Object.get_long(&self, String key)
```

---

#### `Object.get_int128`

```c3
fn int128? Object.get_int128(&self, String key)
```

---

#### `Object.get_ichar_at`

```c3
fn ichar? Object.get_ichar_at(&self, usz index)
```

---

#### `Object.get_short_at`

```c3
fn short? Object.get_short_at(&self, usz index)
```

---

#### `Object.get_int_at`

```c3
fn int? Object.get_int_at(&self, usz index)
```

---

#### `Object.get_long_at`

```c3
fn long? Object.get_long_at(&self, usz index)
```

---

#### `Object.get_int128_at`

```c3
fn int128? Object.get_int128_at(&self, usz index)
```

---

#### `Object.get_char`

```c3
fn char? Object.get_char(&self, String key)
```

---

#### `Object.get_ushort`

```c3
fn short? Object.get_ushort(&self, String key)
```

---

#### `Object.get_uint`

```c3
fn uint? Object.get_uint(&self, String key)
```

---

#### `Object.get_ulong`

```c3
fn ulong? Object.get_ulong(&self, String key)
```

---

#### `Object.get_uint128`

```c3
fn uint128? Object.get_uint128(&self, String key)
```

---

#### `Object.get_char_at`

```c3
fn char? Object.get_char_at(&self, usz index)
```

---

#### `Object.get_ushort_at`

```c3
fn ushort? Object.get_ushort_at(&self, usz index)
```

---

#### `Object.get_uint_at`

```c3
fn uint? Object.get_uint_at(&self, usz index)
```

---

#### `Object.get_ulong_at`

```c3
fn ulong? Object.get_ulong_at(&self, usz index)
```

---

#### `Object.get_uint128_at`

```c3
fn uint128? Object.get_uint128_at(&self, usz index)
```

---

#### `Object.get_string`

```c3
<*
 @require self.is_keyable()
*>
fn String? Object.get_string(&self, String key)
```

---

#### `Object.get_string_at`

```c3
<*
 @require self.is_indexable()
*>
fn String? Object.get_string_at(&self, usz index)
```

---

#### `Object.get_enum`

```c3
<*
 @require self.is_keyable()
*>
macro String? Object.get_enum(&self, $EnumType, String key)
```

---

#### `Object.get_enum_at`

```c3
<*
 @require self.is_indexable()
*>
macro String? Object.get_enum_at(&self, $EnumType, usz index)
```

---

#### `Object.get_bool`

```c3
<*
 @require self.is_keyable()
*>
fn bool? Object.get_bool(&self, String key)
```

---

#### `Object.get_bool_at`

```c3
<*
 @require self.is_indexable()
*>
fn bool? Object.get_bool_at(&self, usz index)
```

---

#### `Object.get_float`

```c3
<*
 @require self.is_keyable()
*>
fn double? Object.get_float(&self, String key)
```

---

#### `Object.get_float_at`

```c3
<*
 @require self.is_indexable()
*>
fn double? Object.get_float_at(&self, usz index)
```

---

#### `Object.get_or_create_obj`

```c3
fn Object* Object.get_or_create_obj(&self, String key)
```
### `std::collections::pair{Type1, Type2}`

---

#### `Pair`

```c3
struct Pair (Printable)
```

---

#### `Pair.to_format`

```c3
fn usz? Pair.to_format(&self, Formatter* f) @dynamic
```

---

#### `Pair.unpack`

```c3
<*
 @param [&out] a
 @param [&out] b
 @require @assignable_to(self.first, $typeof(*a)) : "You cannot assign the first value to a"
 @require @assignable_to(self.second, $typeof(*b)) : "You cannot assign the second value to b"
*>
macro void Pair.unpack(&self, a, b)
```

---

#### `Pair.equal`

```c3
fn bool Pair.equal(self, Pair other) @operator(==) @if
```
### `std::collections::priorityqueue::private{Type, MAX}`

---

#### `PrivatePriorityQueue`

```c3
struct PrivatePriorityQueue (Printable)
```

---

#### `PrivatePriorityQueue.init`

```c3
fn PrivatePriorityQueue* PrivatePriorityQueue.init(&self, Allocator allocator, usz initial_capacity = 16, ) @inline
```

---

#### `PrivatePriorityQueue.tinit`

```c3
fn PrivatePriorityQueue* PrivatePriorityQueue.tinit(&self, usz initial_capacity = 16) @inline
```

---

#### `PrivatePriorityQueue.push`

```c3
fn void PrivatePriorityQueue.push(&self, Type element)
```

---

#### `PrivatePriorityQueue.remove_at`

```c3
<*
 @require index < self.len() : "Index out of range"
*>
fn void PrivatePriorityQueue.remove_at(&self, usz index)
```

---

#### `PrivatePriorityQueue.pop`

```c3
<*
 @require self != null
*>
fn Type? PrivatePriorityQueue.pop(&self)
```

---

#### `PrivatePriorityQueue.first`

```c3
fn Type? PrivatePriorityQueue.first(&self)
```

---

#### `PrivatePriorityQueue.free`

```c3
fn void PrivatePriorityQueue.free(&self)
```

---

#### `PrivatePriorityQueue.len`

```c3
fn usz PrivatePriorityQueue.len(&self) @operator(len)
```

---

#### `PrivatePriorityQueue.is_empty`

```c3
fn bool PrivatePriorityQueue.is_empty(&self)
```

---

#### `PrivatePriorityQueue.get`

```c3
<*
 @require index < self.len()
*>
fn Type PrivatePriorityQueue.get(&self, usz index) @operator([])
```

---

#### `PrivatePriorityQueue.to_format`

```c3
fn usz? PrivatePriorityQueue.to_format(&self, Formatter* formatter) @dynamic
```
### `std::collections::priorityqueue{Type}`

---

#### `PriorityQueue`

```c3
typedef PriorityQueue = inline PrivatePriorityQueue{Type, false}
```

---

#### `PriorityQueueMax`

```c3
typedef PriorityQueueMax = inline PrivatePriorityQueue{Type, true}
```
### `std::collections::range{Type}`

---

#### `Range`

```c3
struct Range (Printable)
```

---

#### `Range.len`

```c3
fn usz Range.len(&self) @operator(len)
```

---

#### `Range.contains`

```c3
fn bool Range.contains(&self, Type value) @inline
```

---

#### `Range.get`

```c3
<*
 @require index < self.len() : "Can't index into an empty range"
*>
fn Type Range.get(&self, usz index) @operator([])
```

---

#### `Range.to_format`

```c3
fn usz? Range.to_format(&self, Formatter* formatter) @dynamic
```

---

#### `ExclusiveRange`

```c3
struct ExclusiveRange (Printable)
```

---

#### `ExclusiveRange.len`

```c3
fn usz ExclusiveRange.len(&self) @operator(len)
```

---

#### `ExclusiveRange.contains`

```c3
fn bool ExclusiveRange.contains(&self, Type value) @inline
```

---

#### `ExclusiveRange.to_format`

```c3
fn usz? ExclusiveRange.to_format(&self, Formatter* formatter) @dynamic
```

---

#### `ExclusiveRange.get`

```c3
<*
 @require index < self.len() : "Can't index into an empty range"
*>
fn Type ExclusiveRange.get(&self, usz index) @operator([])
```
### `std::collections::ringbuffer{Type}`

---

#### `Element`

```c3
alias Element = $typeof((Type){}[0])
```

---

#### `RingBuffer`

```c3
struct RingBuffer (Printable)
```

---

#### `RingBuffer.init`

```c3
fn void RingBuffer.init(&self) @inline
```

---

#### `RingBuffer.push`

```c3
fn void RingBuffer.push(&self, Element c)
```

---

#### `RingBuffer.get`

```c3
fn Element RingBuffer.get(&self, usz index) @operator([])
```

---

#### `RingBuffer.pop`

```c3
fn Element? RingBuffer.pop(&self)
```

---

#### `RingBuffer.to_format`

```c3
fn usz? RingBuffer.to_format(&self, Formatter* format) @dynamic
```

---

#### `RingBuffer.read`

```c3
fn usz RingBuffer.read(&self, usz index, Element[] buffer)
```

---

#### `RingBuffer.write`

```c3
fn void RingBuffer.write(&self, Element[] buffer)
```
### `std::collections::set {Value}`

---

#### `DEFAULT_INITIAL_CAPACITY`

```c3
const uint DEFAULT_INITIAL_CAPACITY = 16
```

---

#### `MAXIMUM_CAPACITY`

```c3
const uint MAXIMUM_CAPACITY = 1u << 31
```

---

#### `DEFAULT_LOAD_FACTOR`

```c3
const float DEFAULT_LOAD_FACTOR = 0.75
```

---

#### `SET_HEAP_ALLOCATOR`

```c3
const Allocator SET_HEAP_ALLOCATOR = (Allocator)&dummy
```

---

#### `ONHEAP`

```c3
const HashSet ONHEAP = { .allocator = SET_HEAP_ALLOCATOR }
```

Copy the ONHEAP allocator to initialize to a set that is heap allocated


---

#### `Entry`

```c3
struct Entry
```

---

#### `HashSet`

```c3
struct HashSet (Printable)
```

---

#### `HashSet.len`

```c3
fn int HashSet.len(&self) @operator(len)
```

---

#### `HashSet.init`

```c3
<*
 @param [&inout] allocator : "The allocator to use"
 @require capacity > 0 : "The capacity must be 1 or higher"
 @require load_factor > 0.0 : "The load factor must be higher than 0"
 @require !self.is_initialized() : "Set was already initialized"
 @require capacity < MAXIMUM_CAPACITY : "Capacity cannot exceed maximum"
*>
fn HashSet* HashSet.init(&self, Allocator allocator, usz capacity = DEFAULT_INITIAL_CAPACITY, float load_factor = DEFAULT_LOAD_FACTOR)
```

---

#### `HashSet.tinit`

```c3
<*
 @require capacity > 0 : "The capacity must be 1 or higher"
 @require load_factor > 0.0 : "The load factor must be higher than 0"
 @require !self.is_initialized() : "Set was already initialized"
 @require capacity < MAXIMUM_CAPACITY : "Capacity cannot exceed maximum"
*>
fn HashSet* HashSet.tinit(&self, uint capacity = DEFAULT_INITIAL_CAPACITY, float load_factor = DEFAULT_LOAD_FACTOR)
```

---

#### `HashSet.init_with_values`

```c3
<*
 @param [&inout] allocator : "The allocator to use"
 @require capacity > 0 : "The capacity must be 1 or higher"
 @require load_factor > 0.0 : "The load factor must be higher than 0"
 @require !self.is_initialized() : "Set was already initialized"
 @require capacity < MAXIMUM_CAPACITY : "Capacity cannot exceed maximum"
*>
macro HashSet* HashSet.init_with_values(&self, Allocator allocator, ..., uint capacity = DEFAULT_INITIAL_CAPACITY, float load_factor = DEFAULT_LOAD_FACTOR)
```

---

#### `HashSet.tinit_with_values`

```c3
<*
 @require capacity > 0 : "The capacity must be 1 or higher"
 @require load_factor > 0.0 : "The load factor must be higher than 0"
 @require !self.is_initialized() : "Set was already initialized"
 @require capacity < MAXIMUM_CAPACITY : "Capacity cannot exceed maximum"
*>
macro HashSet* HashSet.tinit_with_values(&self, ..., uint capacity = DEFAULT_INITIAL_CAPACITY, float load_factor = DEFAULT_LOAD_FACTOR)
```

---

#### `HashSet.init_from_values`

```c3
<*
 @param [in] values : "The values for the HashSet"
 @param [&inout] allocator : "The allocator to use"
 @require capacity > 0 : "The capacity must be 1 or higher"
 @require load_factor > 0.0 : "The load factor must be higher than 0"
 @require !self.is_initialized() : "Set was already initialized"
 @require capacity < MAXIMUM_CAPACITY : "Capacity cannot exceed maximum"
*>
fn HashSet* HashSet.init_from_values(&self, Allocator allocator, Value[] values, uint capacity = DEFAULT_INITIAL_CAPACITY, float load_factor = DEFAULT_LOAD_FACTOR)
```

---

#### `HashSet.tinit_from_values`

```c3
<*
 @param [in] values : "The values for the HashSet entries"
 @require capacity > 0 : "The capacity must be 1 or higher"
 @require load_factor > 0.0 : "The load factor must be higher than 0"
 @require !self.is_initialized() : "Set was already initialized"
 @require capacity < MAXIMUM_CAPACITY : "Capacity cannot exceed maximum"
*>
fn HashSet* HashSet.tinit_from_values(&self, Value[] values, uint capacity = DEFAULT_INITIAL_CAPACITY, float load_factor = DEFAULT_LOAD_FACTOR)
```

---

#### `HashSet.is_initialized`

```c3
<*
 @param [&in] set : "The hash set we are testing"
 @return "Returns true if it has been initialized, false otherwise"
*>
fn bool HashSet.is_initialized(&set)
```

Has this hash set been initialized yet?


---

#### `HashSet.init_from_set`

```c3
<*
 @param [&inout] allocator : "The allocator to use"
 @param [&in] other_set : "The set to copy from."
 @require !self.is_initialized() : "Set was already initialized"
*>
fn HashSet* HashSet.init_from_set(&self, Allocator allocator, HashSet* other_set)
```

---

#### `HashSet.tinit_from_set`

```c3
<*
 @param [&in] other_set : "The set to copy from."
 @require !set.is_initialized() : "Set was already initialized"
*>
fn HashSet* HashSet.tinit_from_set(&set, HashSet* other_set)
```

---

#### `HashSet.is_empty`

```c3
<*
 @return "true if it is empty"
 @pure
*>
fn bool HashSet.is_empty(&set) @inline
```

Check if the set is empty


---

#### `HashSet.add_all`

```c3
<*
 @param [in] list
 @return "The number of new elements added"
 @ensure total <= list.len
*>
fn usz HashSet.add_all(&set, Value[] list)
```

Add all elements in the slice to the set.


---

#### `HashSet.add_all_from`

```c3
<*
 @param [&in] other
 @return "The number of new elements added"
 @ensure return <= other.count
*>
fn usz HashSet.add_all_from(&set, HashSet* other)
```

---

#### `HashSet.add`

```c3
<*
 @param value : "The value to add"
 @return "true if the value didn't exist in the set"
*>
fn bool HashSet.add(&set, Value value)
```

---

#### `HashSet.@each`

```c3
macro HashSet.@each(set; @body(value))
```

Iterate over all the values in the set


---

#### `HashSet.contains`

```c3
<*
 @param value : "The value to check"
 @return "true if it exists in the set"
*>
fn bool HashSet.contains(&set, Value value)
```

Check if the set contains the given value.


---

#### `HashSet.remove`

```c3
<*
 @param value : "The value to remove"
 @return? NOT_FOUND : "If the entry is not found"
*>
fn void? HashSet.remove(&set, Value value) @maydiscard
```

Remove a single value from the set.


---

#### `HashSet.remove_all`

```c3
fn usz HashSet.remove_all(&set, Value[] values)
```

---

#### `HashSet.remove_all_from`

```c3
<*
 @param [&in] other : "Other set"
*>
fn usz HashSet.remove_all_from(&set, HashSet* other)
```

---

#### `HashSet.free`

```c3
fn void HashSet.free(&set)
```

Free all memory allocated by the hash set.


---

#### `HashSet.clear`

```c3
<*
 @ensure set.count == 0
*>
fn void HashSet.clear(&set)
```

Clear all elements from the set while keeping the underlying storage


---

#### `HashSet.reserve`

```c3
fn void HashSet.reserve(&set, usz capacity)
```

---

#### `HashSet.set_union`

```c3
<*
 @param [&in] other : "The other set to union with"
 @param [&inout] allocator : "Allocator for the new set"
 @return "A new set containing the union of both sets"
*>
fn HashSet HashSet.set_union(&self, Allocator allocator, HashSet* other)
```

Returns the union of two sets (A | B)


---

#### `HashSet.tset_union`

```c3
fn HashSet HashSet.tset_union(&self, HashSet* other)
```

---

#### `HashSet.intersection`

```c3
<*
 @param [&in] other : "The other set to intersect with"
 @param [&inout] allocator : "Allocator for the new set"
 @return "A new set containing the intersection of both sets"
*>
fn HashSet HashSet.intersection(&self, Allocator allocator, HashSet* other)
```

Returns the intersection of the two sets (A & B)


---

#### `HashSet.tintersection`

```c3
fn HashSet HashSet.tintersection(&self, HashSet* other)
```

---

#### `HashSet.difference`

```c3
<*
 @param [&in] other : "The other set to compare with"
 @param [&inout] allocator : "Allocator for the new set"
 @return "A new set containing elements in this set but not in the other"
*>
fn HashSet HashSet.difference(&self, Allocator allocator, HashSet* other)
```

Return this set - other, so (A & ~B)


---

#### `HashSet.tdifference`

```c3
fn HashSet HashSet.tdifference(&self, HashSet* other)
```

---

#### `HashSet.symmetric_difference`

```c3
<*
 @param [&in] other : "The other set to compare with"
 @param [&inout] allocator : "Allocator for the new set"
 @return "A new set containing elements in this set or the other, but not both"
*>
fn HashSet HashSet.symmetric_difference(&self, Allocator allocator, HashSet* other)
```

Return (A ^ B)


---

#### `HashSet.tsymmetric_difference`

```c3
fn HashSet HashSet.tsymmetric_difference(&self, HashSet* other)
```

---

#### `HashSet.is_subset`

```c3
<*
 @param [&in] other : "The other set to check against"
 @return "True if all elements of this set are in the other set"
*>
fn bool HashSet.is_subset(&self, HashSet* other)
```

Check if this hash set is a subset of another set.


---

#### `HashSet.add_entry`

```c3
fn void HashSet.add_entry(&set, uint hash, Value value, uint bucket_index) @private
```

---

#### `HashSet.resize`

```c3
fn void HashSet.resize(&self, usz new_capacity) @private
```

---

#### `HashSet.to_format`

```c3
fn usz? HashSet.to_format(&self, Formatter* f) @dynamic
```

---

#### `HashSet.transfer`

```c3
fn void HashSet.transfer(&self, Entry*[] new_table) @private
```

---

#### `HashSet.put_all_for_create`

```c3
fn void HashSet.put_all_for_create(&set, HashSet* other_set) @private
```

---

#### `HashSet.put_for_create`

```c3
fn void HashSet.put_for_create(&set, Value value) @private
```

---

#### `HashSet.free_internal`

```c3
fn void HashSet.free_internal(&self, void* ptr) @inline @private
```

---

#### `HashSet.create_entry`

```c3
fn void HashSet.create_entry(&set, uint hash, Value value, int bucket_index) @private
```

---

#### `HashSet.remove_entry_for_value`

```c3
<*
 @return "true if found and removed, false otherwise"
*>
fn bool HashSet.remove_entry_for_value(&set, Value value) @private
```

Removes the entry for the specified value if present


---

#### `HashSet.free_entry`

```c3
fn void HashSet.free_entry(&set, Entry *entry) @private
```

---

#### `HashSetIterator`

```c3
struct HashSetIterator
```

---

#### `HashSet.iter`

```c3
fn HashSetIterator HashSet.iter(&set)
```

---

#### `HashSetIterator.next`

```c3
fn Value? HashSetIterator.next(&self)
```

---

#### `HashSetIterator.len`

```c3
fn usz HashSetIterator.len(&self) @operator(len)
```

---

#### `rehash`

```c3
<*
 @pure
*>
fn uint rehash(uint hash) @inline @private
```

---

#### `index_for`

```c3
macro uint index_for(uint hash, uint capacity) @private
```

---

#### `LINKEDONHEAP`

```c3
const LinkedHashSet LINKEDONHEAP = { .allocator = SET_HEAP_ALLOCATOR }
```

---

#### `LinkedEntry`

```c3
struct LinkedEntry
```

---

#### `LinkedHashSet`

```c3
struct LinkedHashSet (Printable)
```

---

#### `LinkedHashSet.len`

```c3
fn int LinkedHashSet.len(&self) @operator(len)
```

---

#### `LinkedHashSet.init`

```c3
<*
 @param [&inout] allocator : "The allocator to use"
 @require capacity > 0 : "The capacity must be 1 or higher"
 @require load_factor > 0.0 : "The load factor must be higher than 0"
 @require !self.is_initialized() : "Set was already initialized"
 @require capacity < MAXIMUM_CAPACITY : "Capacity cannot exceed maximum"
*>
fn LinkedHashSet* LinkedHashSet.init(&self, Allocator allocator, usz capacity = DEFAULT_INITIAL_CAPACITY, float load_factor = DEFAULT_LOAD_FACTOR)
```

---

#### `LinkedHashSet.tinit`

```c3
<*
 @require capacity > 0 : "The capacity must be 1 or higher"
 @require load_factor > 0.0 : "The load factor must be higher than 0"
 @require !self.is_initialized() : "Set was already initialized"
 @require capacity < MAXIMUM_CAPACITY : "Capacity cannot exceed maximum"
*>
fn LinkedHashSet* LinkedHashSet.tinit(&self, usz capacity = DEFAULT_INITIAL_CAPACITY, float load_factor = DEFAULT_LOAD_FACTOR)
```

---

#### `LinkedHashSet.init_with_values`

```c3
<*
 @param [&inout] allocator : "The allocator to use"
 @require capacity > 0 : "The capacity must be 1 or higher"
 @require load_factor > 0.0 : "The load factor must be higher than 0"
 @require !self.is_initialized() : "Set was already initialized"
 @require capacity < MAXIMUM_CAPACITY : "Capacity cannot exceed maximum"
*>
macro LinkedHashSet* LinkedHashSet.init_with_values(&self, Allocator allocator, ..., uint capacity = DEFAULT_INITIAL_CAPACITY, float load_factor = DEFAULT_LOAD_FACTOR)
```

---

#### `LinkedHashSet.tinit_with_values`

```c3
<*
 @require capacity > 0 : "The capacity must be 1 or higher"
 @require load_factor > 0.0 : "The load factor must be higher than 0"
 @require !self.is_initialized() : "Set was already initialized"
 @require capacity < MAXIMUM_CAPACITY : "Capacity cannot exceed maximum"
*>
macro LinkedHashSet* LinkedHashSet.tinit_with_values(&self, ..., uint capacity = DEFAULT_INITIAL_CAPACITY, float load_factor = DEFAULT_LOAD_FACTOR)
```

---

#### `LinkedHashSet.init_from_values`

```c3
<*
 @param [in] values : "The values for the LinkedHashSet"
 @param [&inout] allocator : "The allocator to use"
 @require capacity > 0 : "The capacity must be 1 or higher"
 @require load_factor > 0.0 : "The load factor must be higher than 0"
 @require !self.is_initialized() : "Set was already initialized"
 @require capacity < MAXIMUM_CAPACITY : "Capacity cannot exceed maximum"
*>
fn LinkedHashSet* LinkedHashSet.init_from_values(&self, Allocator allocator, Value[] values, uint capacity = DEFAULT_INITIAL_CAPACITY, float load_factor = DEFAULT_LOAD_FACTOR)
```

---

#### `LinkedHashSet.tinit_from_values`

```c3
<*
 @param [in] values : "The values for the LinkedHashSet entries"
 @require capacity > 0 : "The capacity must be 1 or higher"
 @require load_factor > 0.0 : "The load factor must be higher than 0"
 @require !self.is_initialized() : "Set was already initialized"
 @require capacity < MAXIMUM_CAPACITY : "Capacity cannot exceed maximum"
*>
fn LinkedHashSet* LinkedHashSet.tinit_from_values(&self, Value[] values, uint capacity = DEFAULT_INITIAL_CAPACITY, float load_factor = DEFAULT_LOAD_FACTOR)
```

---

#### `LinkedHashSet.is_initialized`

```c3
<*
 @param [&in] set : "The linked hash set we are testing"
 @return "Returns true if it has been initialized, false otherwise"
*>
fn bool LinkedHashSet.is_initialized(&set)
```

Has this linked hash set been initialized yet?


---

#### `LinkedHashSet.init_from_set`

```c3
<*
 @param [&inout] allocator : "The allocator to use"
 @param [&in] other_set : "The set to copy from."
 @require !self.is_initialized() : "Set was already initialized"
*>
fn LinkedHashSet* LinkedHashSet.init_from_set(&self, Allocator allocator, LinkedHashSet* other_set)
```

---

#### `LinkedHashSet.tinit_from_set`

```c3
<*
 @param [&in] other_set : "The set to copy from."
 @require !set.is_initialized() : "Set was already initialized"
*>
fn LinkedHashSet* LinkedHashSet.tinit_from_set(&set, LinkedHashSet* other_set)
```

---

#### `LinkedHashSet.is_empty`

```c3
<*
 @return "true if it is empty"
 @pure
*>
fn bool LinkedHashSet.is_empty(&set) @inline
```

Check if the set is empty


---

#### `LinkedHashSet.add_all`

```c3
<*
 @param [in] list
 @return "The number of new elements added"
 @ensure total <= list.len
*>
fn usz LinkedHashSet.add_all(&set, Value[] list)
```

Add all elements in the slice to the set.


---

#### `LinkedHashSet.add_all_from`

```c3
<*
 @param [&in] other
 @return "The number of new elements added"
 @ensure return <= other.count
*>
fn usz LinkedHashSet.add_all_from(&set, LinkedHashSet* other)
```

---

#### `LinkedHashSet.add`

```c3
<*
 @param value : "The value to add"
 @return "true if the value didn't exist in the set"
*>
fn bool LinkedHashSet.add(&set, Value value)
```

---

#### `LinkedHashSet.@each`

```c3
macro LinkedHashSet.@each(set; @body(value))
```

Iterate over all the values in the set


---

#### `LinkedHashSet.contains`

```c3
<*
 @param value : "The value to check"
 @return "true if it exists in the set"
*>
fn bool LinkedHashSet.contains(&set, Value value)
```

Check if the set contains the given value.


---

#### `LinkedHashSet.remove`

```c3
<*
 @param value : "The value to remove"
 @return? NOT_FOUND : "If the entry is not found"
*>
fn void? LinkedHashSet.remove(&set, Value value) @maydiscard
```

Remove a single value from the set.


---

#### `LinkedHashSet.remove_all`

```c3
fn usz LinkedHashSet.remove_all(&set, Value[] values)
```

---

#### `LinkedHashSet.remove_all_from`

```c3
<*
 @param [&in] other : "Other set"
*>
fn usz LinkedHashSet.remove_all_from(&set, LinkedHashSet* other)
```

---

#### `LinkedHashSet.free`

```c3
fn void LinkedHashSet.free(&set)
```

Free all memory allocated by the hash set.


---

#### `LinkedHashSet.clear`

```c3
<*
 @ensure set.count == 0
*>
fn void LinkedHashSet.clear(&set)
```

Clear all elements from the set while keeping the underlying storage


---

#### `LinkedHashSet.reserve`

```c3
fn void LinkedHashSet.reserve(&set, usz capacity)
```

---

#### `LinkedHashSet.set_union`

```c3
<*
 @param [&in] other : "The other set to union with"
 @param [&inout] allocator : "Allocator for the new set"
 @return "A new set containing the union of both sets"
*>
fn LinkedHashSet LinkedHashSet.set_union(&self, Allocator allocator, LinkedHashSet* other)
```

Returns the union of two sets (A | B)


---

#### `LinkedHashSet.tset_union`

```c3
fn LinkedHashSet LinkedHashSet.tset_union(&self, LinkedHashSet* other)
```

---

#### `LinkedHashSet.intersection`

```c3
<*
 @param [&in] other : "The other set to intersect with"
 @param [&inout] allocator : "Allocator for the new set"
 @return "A new set containing the intersection of both sets"
*>
fn LinkedHashSet LinkedHashSet.intersection(&self, Allocator allocator, LinkedHashSet* other)
```

Returns the intersection of the two sets (A & B)


---

#### `LinkedHashSet.tintersection`

```c3
fn LinkedHashSet LinkedHashSet.tintersection(&self, LinkedHashSet* other)
```

---

#### `LinkedHashSet.difference`

```c3
<*
 @param [&in] other : "The other set to compare with"
 @param [&inout] allocator : "Allocator for the new set"
 @return "A new set containing elements in this set but not in the other"
*>
fn LinkedHashSet LinkedHashSet.difference(&self, Allocator allocator, LinkedHashSet* other)
```

Return this set - other, so (A & ~B)


---

#### `LinkedHashSet.tdifference`

```c3
fn LinkedHashSet LinkedHashSet.tdifference(&self, LinkedHashSet* other)
```

---

#### `LinkedHashSet.symmetric_difference`

```c3
<*
 @param [&in] other : "The other set to compare with"
 @param [&inout] allocator : "Allocator for the new set"
 @return "A new set containing elements in this set or the other, but not both"
*>
fn LinkedHashSet LinkedHashSet.symmetric_difference(&self, Allocator allocator, LinkedHashSet* other)
```

Return (A ^ B)


---

#### `LinkedHashSet.tsymmetric_difference`

```c3
fn LinkedHashSet LinkedHashSet.tsymmetric_difference(&self, LinkedHashSet* other)
```

---

#### `LinkedHashSet.is_subset`

```c3
<*
 @param [&in] other : "The other set to check against"
 @return "True if all elements of this set are in the other set"
*>
fn bool LinkedHashSet.is_subset(&self, LinkedHashSet* other)
```

Check if this hash set is a subset of another set.


---

#### `LinkedHashSet.add_entry`

```c3
fn void LinkedHashSet.add_entry(&set, uint hash, Value value, uint bucket_index) @private
```

---

#### `LinkedHashSet.resize`

```c3
fn void LinkedHashSet.resize(&set, usz new_capacity) @private
```

---

#### `LinkedHashSet.to_format`

```c3
fn usz? LinkedHashSet.to_format(&self, Formatter* f) @dynamic
```

---

#### `LinkedHashSet.transfer`

```c3
fn void LinkedHashSet.transfer(&set, LinkedEntry*[] new_table) @private
```

---

#### `LinkedHashSet.put_for_create`

```c3
fn void LinkedHashSet.put_for_create(&set, Value value) @private
```

---

#### `LinkedHashSet.free_internal`

```c3
fn void LinkedHashSet.free_internal(&set, void* ptr) @inline @private
```

---

#### `LinkedHashSet.create_entry`

```c3
fn void LinkedHashSet.create_entry(&set, uint hash, Value value, int bucket_index) @private
```

---

#### `LinkedHashSet.remove_entry_for_value`

```c3
fn bool LinkedHashSet.remove_entry_for_value(&set, Value value) @private
```

---

#### `LinkedHashSet.free_entry`

```c3
fn void LinkedHashSet.free_entry(&set, LinkedEntry *entry) @private
```

---

#### `LinkedHashSetIterator`

```c3
struct LinkedHashSetIterator
```

---

#### `LinkedHashSet.iter`

```c3
fn LinkedHashSetIterator LinkedHashSet.iter(&set)
```

---

#### `LinkedHashSetIterator.next`

```c3
fn bool LinkedHashSetIterator.next(&self)
```

---

#### `LinkedHashSetIterator.get`

```c3
fn Value*? LinkedHashSetIterator.get(&self)
```

---

#### `LinkedHashSetIterator.has_next`

```c3
fn bool LinkedHashSetIterator.has_next(&self)
```

---

#### `LinkedHashSetIterator.len`

```c3
fn usz LinkedHashSetIterator.len(&self) @operator(len)
```
### `std::collections::triple{Type1, Type2, Type3}`

---

#### `Triple`

```c3
struct Triple (Printable)
```

---

#### `Triple.to_format`

```c3
fn usz? Triple.to_format(&self, Formatter* f) @dynamic
```

---

#### `Triple.unpack`

```c3
<*
 @param [&out] a
 @param [&out] b
 @param [&out] c
 @require @assignable_to(self.first, $typeof(*a)) : "You cannot assign the first value to a"
 @require @assignable_to(self.second, $typeof(*b)) : "You cannot assign the second value to b"
 @require @assignable_to(self.third, $typeof(*c)) : "You cannot assign the second value to c"
*>
macro void Triple.unpack(&self, a, b, c)
```

---

#### `Triple.equal`

```c3
fn bool Triple.equal(self, Triple other) @operator(==) @if
```
### `std::collections::tuple{Type1, Type2}`

---

#### `Tuple`

```c3
struct Tuple @deprecated("Use 'Pair' instead")
```
### `std::compression::qoi`

---

#### `PIXELS_MAX`

```c3
const uint PIXELS_MAX = 400000000
```

---

#### `QOIColorspace`

```c3
enum QOIColorspace : char (char id)
```

Colorspace.
Purely informative. It will be saved to the file header,
but does not affect how chunks are en-/decoded.


---

#### `QOIChannels`

```c3
enum QOIChannels : char (char id)
```

Channels.
The channels used in an image.
AUTO can be used when decoding to automatically determine
the channels from the file's header.


---

#### `QOIDesc`

```c3
struct QOIDesc
```

Descriptor.
Contains information about an image.


---

#### `INVALID_PARAMETERS, FILE_OPEN_FAILED, FILE_WRITE_FAILED, INVALID_DATA, TOO_MANY_PIXELS`

```c3
faultdef INVALID_PARAMETERS, FILE_OPEN_FAILED, FILE_WRITE_FAILED, INVALID_DATA, TOO_MANY_PIXELS
```

QOI Errors.
These are all the possible bad outcomes.


---

#### `encode`

```c3
<*
 @param [in] input : `The raw RGB or RGBA pixels to encode`
 @param [&in] desc : `The descriptor of the image`
 @return? INVALID_PARAMETERS, TOO_MANY_PIXELS, INVALID_DATA
*>
fn char[]? encode(Allocator allocator, char[] input, QOIDesc* desc) @nodiscard
```

Encode raw RGB or RGBA pixels into a QOI image in memory.

The function returns an optional, which can either be a QOIError
or a char[] pointing to the encoded data on success.

The returned qoi data should be free()d after use, or the encoding
and use of the data should be wrapped in a @pool() { ... }; block.
See the write() function for an example.


---

#### `decode`

```c3
<*
 @param [in] data : `The QOI image data to decode`
 @param [&out] desc : `The descriptor to fill with the image's info`
 @param channels : `The channels to be used`
 @return? INVALID_DATA, TOO_MANY_PIXELS
*>
fn char[]? decode(Allocator allocator, char[] data, QOIDesc* desc, QOIChannels channels = AUTO) @nodiscard
```

Decode a QOI image from memory.

If channels is set to QOIChannels.AUTO, the function will
automatically determine the channels from the file's header.
However, if channels is RGB or RGBA, the output format will be
forced into this number of channels.

The desc struct will be filled with the width, height,
channels and colorspace of the image.

The function returns an optional, which can either be a QOIError
or a char[] pointing to the decoded pixels on success.

The returned pixel data should be free()d after use, or the decoding
and use of the data should be wrapped in a @pool() { ... }; block.

### `std::compression::qoi @if(!$feature(QOI_NO_STDIO))`

---

#### `write`

```c3
<*
 @param [in] filename : `The file's name to write the image to`
 @param [in] input : `The raw RGB or RGBA pixels to encode`
 @param [&in] desc : `The descriptor of the image`
*>
fn usz? write(String filename, char[] input, QOIDesc* desc)
```

Encode raw RGB or RGBA pixels into a QOI image and write it to the
file system.

The desc struct must be filled with the image width, height, the
used channels (QOIChannels.RGB or RGBA) and the colorspace
(QOIColorspace.SRGB or LINEAR).

The function returns an optional, which can either be a QOIError
or the number of bytes written on success.


---

#### `read`

```c3
<*
 @param [in] filename : `The file's name to read the image from`
 @param [&out] desc : `The descriptor to fill with the image's info`
 @param channels : `The channels to be used`
 @return? FILE_OPEN_FAILED, INVALID_DATA, TOO_MANY_PIXELS
*>
fn char[]? read(Allocator allocator, String filename, QOIDesc* desc, QOIChannels channels = AUTO)
```

Read and decode a QOI image from the file system.

If channels is set to QOIChannels.AUTO, the function will
automatically determine the channels from the file's header.
However, if channels is RGB or RGBA, the output format will be
forced into this number of channels.

The desc struct will be filled with the width, height,
channels and colorspace of the image.

The function returns an optional, which can either be a QOIError
or a char[] pointing to the decoded pixels on success.

The returned pixel data should be free()d after use, or the decoding
and use of the data should be wrapped in a @pool() { ... }; block.

### `std::core::array`

---

#### `contains`

```c3
<*
 @param [in] array
 @param [in] element
 @require @typekind(array) == SLICE || @typekind(array) == ARRAY
 @require @typeis(array[0], $typeof(element)) : "array and element must have the same type"
*>
macro bool contains(array, element)
```

Returns true if the array contains at least one element, else false
 


---

#### `index_of`

```c3
<*
 @param [in] array
 @param [in] element
 @return "the first index of the element"
 @return? NOT_FOUND
*>
macro index_of(array, element)
```

Return the first index of element found in the array, searching from the start.
 


---

#### `slice2d`

```c3
<*
 @param array_ptr : "the pointer to create a slice from"
 @param x : "The starting position of the slice x, optional"
 @param y : "The starting position of the slice y, optional"
 @param xlen : "The length of the slice in x, defaults to the length of the array"
 @param ylen : "The length of the slice in y, defaults to the length of the array"
 @return "A Slice2d from the array"
 @require @typekind(array_ptr) == POINTER
 @require @typekind(*array_ptr) == VECTOR || @typekind(*array_ptr) == ARRAY
 @require @typekind((*array_ptr)[0]) == VECTOR || @typekind((*array_ptr)[0]) == ARRAY
*>
macro slice2d(array_ptr, x = 0, xlen = 0, y = 0, ylen = 0)
```

Slice a 2d array and create a Slice2d from it.


---

#### `rindex_of`

```c3
<*
 @param [in] array
 @param [in] element
 @return "the last index of the element"
 @return? NOT_FOUND
*>
macro rindex_of(array, element)
```

Return the first index of element found in the array, searching in reverse from the end.
 


---

#### `concat`

```c3
<*
 @param [in] arr1
 @param [in] arr2
 @param [&inout] allocator : "The allocator to use, default is the heap allocator"
 @require @typekind(arr1) == SLICE || @typekind(arr1) == ARRAY
 @require @typekind(arr2) == SLICE || @typekind(arr2) == ARRAY
 @require @typeis(arr1[0], $typeof(arr2[0])) : "Arrays must have the same type"
 @ensure result.len == arr1.len + arr2.len
*>
macro concat(Allocator allocator, arr1, arr2) @nodiscard
```

Concatenate two arrays or slices, returning a slice containing the concatenation of them.


---

#### `tconcat`

```c3
<*
 @param [in] arr1
 @param [in] arr2
 @require @typekind(arr1) == SLICE || @typekind(arr1) == ARRAY
 @require @typekind(arr2) == SLICE || @typekind(arr2) == ARRAY
 @require @typeis(arr1[0], $typeof(arr2[0])) : "Arrays must have the same type"
 @ensure return.len == arr1.len + arr2.len
*>
macro tconcat(arr1, arr2) @nodiscard
```

Concatenate two arrays or slices, returning a slice containing the concatenation of them,
allocated using the temp allocator.

### `std::core::array::slice {Type}`

---

#### `Slice`

```c3
struct Slice2d
```

A slice2d allows slicing an array like int[10][10] into an arbitrary "int[][]"-like counterpart
Typically you'd use array::slice2d(...) to create one.


---

#### `Slice2d.len`

```c3
<*
 @return `The length of the "outer" slice`
*>
fn usz Slice2d.len(&self) @operator(len)
```

---

#### `Slice2d.count`

```c3
<*
 @return `The total number of elements.`
*>
fn usz Slice2d.count(&self)
```

---

#### `Slice2d.@each`

```c3
macro void Slice2d.@each(&self; @body(usz[<2>], Type))
```

Step through each element of the slice.


---

#### `Slice2d.@each_ref`

```c3
macro void Slice2d.@each_ref(&self; @body(usz[<2>], Type*))
```

Step through each element of the slice *by reference*


---

#### `Slice2d.get_row`

```c3
<*
 @param idy : "The row to return"
 @return "The slice for the particular row"
 @require idy >= 0 && idy < self.ylen
*>
macro Type[] Slice2d.get_row(self, usz idy) @operator([])
```

Return a row as a slice.


---

#### `Slice2d.get_coord`

```c3
<*
 @param coord : "The xy coordinate"
 @return "The value at that coordinate"
 @require coord.y >= 0 && coord.y < self.ylen : "y value out of range"
 @require coord.x >= 0 && coord.x < self.xlen : "x value out of range"
*>
macro Type Slice2d.get_coord(self, usz[<2>] coord)
```

Get the value at a particular x/y position in the slice.


---

#### `Slice2d.get_coord_ref`

```c3
<*
 @param coord : "The xy coordinate"
 @return "A pointer to the value at that coordinate"
 @require coord.y >= 0 && coord.y < self.ylen : "y value out of range"
 @require coord.x >= 0 && coord.x < self.xlen : "x value out of range"
*>
macro Type* Slice2d.get_coord_ref(self, usz[<2>] coord)
```

Get a pointer to the value at a particular x/y position in the slice.


---

#### `Slice2d.get_xy`

```c3
<*
 @param x : "The x coordinate"
 @param y : "The x coordinate"
 @return "The value at that coordinate"
 @require y >= 0 && y < self.ylen : "y value out of range"
 @require x >= 0 && x < self.xlen : "x value out of range"
*>
macro Type Slice2d.get_xy(self, x, y)
```

Get the value at a particular x/y position in the slice.


---

#### `Slice2d.get_xy_ref`

```c3
<*
 @param x : "The x coordinate"
 @param y : "The y coordinate"
 @return "A pointer to the value at that coordinate"
 @require y >= 0 && y < self.ylen : "y value out of range"
 @require x >= 0 && x < self.xlen : "x value out of range"
*>
macro Type* Slice2d.get_xy_ref(self, x, y)
```

Get the value at a particular x/y position in the slice by reference.


---

#### `Slice2d.set_coord`

```c3
<*
 @param coord : "The xy coordinate"
 @param value : "The new value"
 @require coord.y >= 0 && coord.y < self.ylen : "y value out of range"
 @require coord.x >= 0 && coord.x < self.xlen : "x value out of range"
*>
macro void Slice2d.set_coord(self, usz[<2>] coord, Type value)
```

Set the ´value at a particular x/y position in the slice.


---

#### `Slice2d.set_xy`

```c3
<*
 @param x : "The x coordinate"
 @param y : "The y coordinate"
 @param value : "The new value"
 @require y >= 0 && y < self.ylen : "y value out of range"
 @require x >= 0 && x < self.xlen : "x value out of range"
*>
macro void Slice2d.set_xy(self, x, y, Type value)
```

Set the value at a particular x/y position in the slice.


---

#### `Slice2d.slice`

```c3
<*
 @param x : "The starting x"
 @param xlen : "The length along x"
 @param y : "The starting y"
 @param ylen : "The length along y"
 @require y >= 0 && y < self.ylen
 @require x >= 0 && x < self.xlen
*>
fn Slice2d Slice2d.slice(&self, isz x = 0, isz xlen = 0, isz y = 0, isz ylen = 0)
```

Reslice a slice2d returning a new slice.

### `std::core::ascii`

---

#### `@is_lower`

```c3
macro bool @is_lower(c)
```

---

#### `@is_upper`

```c3
macro bool @is_upper(c)
```

---

#### `@is_digit`

```c3
macro bool @is_digit(c)
```

---

#### `@is_bdigit`

```c3
macro bool @is_bdigit(c)
```

---

#### `@is_odigit`

```c3
macro bool @is_odigit(c)
```

---

#### `@is_xdigit`

```c3
macro bool @is_xdigit(c)
```

---

#### `@is_alpha`

```c3
macro bool @is_alpha(c)
```

---

#### `@is_print`

```c3
macro bool @is_print(c)
```

---

#### `@is_graph`

```c3
macro bool @is_graph(c)
```

---

#### `@is_space`

```c3
macro bool @is_space(c)
```

---

#### `@is_alnum`

```c3
macro bool @is_alnum(c)
```

---

#### `@is_punct`

```c3
macro bool @is_punct(c)
```

---

#### `@is_blank`

```c3
macro bool @is_blank(c)
```

---

#### `@is_cntrl`

```c3
macro bool @is_cntrl(c)
```

---

#### `@to_lower`

```c3
macro char @to_lower(c)
```

---

#### `@to_upper`

```c3
macro char @to_upper(c)
```

---

#### `is_lower`

```c3
fn bool is_lower(char c)
```

---

#### `is_upper`

```c3
fn bool is_upper(char c)
```

---

#### `is_digit`

```c3
fn bool is_digit(char c)
```

---

#### `is_bdigit`

```c3
fn bool is_bdigit(char c)
```

---

#### `is_odigit`

```c3
fn bool is_odigit(char c)
```

---

#### `is_xdigit`

```c3
fn bool is_xdigit(char c)
```

---

#### `is_alpha`

```c3
fn bool is_alpha(char c)
```

---

#### `is_print`

```c3
fn bool is_print(char c)
```

---

#### `is_graph`

```c3
fn bool is_graph(char c)
```

---

#### `is_space`

```c3
fn bool is_space(char c)
```

---

#### `is_alnum`

```c3
fn bool is_alnum(char c)
```

---

#### `is_punct`

```c3
fn bool is_punct(char c)
```

---

#### `is_blank`

```c3
fn bool is_blank(char c)
```

---

#### `is_cntrl`

```c3
fn bool is_cntrl(char c)
```

---

#### `to_lower`

```c3
fn char to_lower(char c)
```

---

#### `to_upper`

```c3
fn char to_upper(char c)
```

---

#### `char.is_lower`

```c3
macro bool char.is_lower(char c)
```

---

#### `char.is_upper`

```c3
macro bool char.is_upper(char c)
```

---

#### `char.is_digit`

```c3
macro bool char.is_digit(char c)
```

---

#### `char.is_bdigit`

```c3
macro bool char.is_bdigit(char c)
```

---

#### `char.is_odigit`

```c3
macro bool char.is_odigit(char c)
```

---

#### `char.is_xdigit`

```c3
macro bool char.is_xdigit(char c)
```

---

#### `char.is_alpha`

```c3
macro bool char.is_alpha(char c)
```

---

#### `char.is_print`

```c3
macro bool char.is_print(char c)
```

---

#### `char.is_graph`

```c3
macro bool char.is_graph(char c)
```

---

#### `char.is_space`

```c3
macro bool char.is_space(char c)
```

---

#### `char.is_alnum`

```c3
macro bool char.is_alnum(char c)
```

---

#### `char.is_punct`

```c3
macro bool char.is_punct(char c)
```

---

#### `char.is_blank`

```c3
macro bool char.is_blank(char c)
```

---

#### `char.is_cntrl`

```c3
macro bool char.is_cntrl(char c)
```

---

#### `char.to_lower`

```c3
macro char char.to_lower(char c)
```

---

#### `char.to_upper`

```c3
macro char char.to_upper(char c)
```

---

#### `char.from_hex`

```c3
<*
 @require c.is_xdigit()
 @ensure return >= 0 && return <= 15
*>
macro char char.from_hex(char c)
```

Convert a-f/A-F/0-9 to the appropriate hex value.


---

#### `HEX_VALUE`

```c3
const char[256] HEX_VALUE = {
	['0'] =  0, ['1'] =  1, ['2'] =  2, ['3'] =  3, ['4'] =  4,
	['5'] =  5, ['6'] =  6, ['7'] =  7, ['8'] =  8, ['9'] =  9,
	['A'] = 10, ['B'] = 11, ['C'] = 12, ['D'] = 13, ['E'] = 14,
	['F'] = 15, ['a'] = 10, ['b'] = 11, ['c'] = 12, ['d'] = 13,
	['e'] = 14, ['f'] = 15
}
```
### `std::core::bitorder`

---

#### `ShortBE`

```c3
bitstruct ShortBE : short @bigendian
```

---

#### `UShortBE`

```c3
bitstruct UShortBE : ushort @bigendian
```

---

#### `IntBE`

```c3
bitstruct IntBE : int @bigendian
```

---

#### `UIntBE`

```c3
bitstruct UIntBE : int @bigendian
```

---

#### `LongBE`

```c3
bitstruct LongBE : long @bigendian
```

---

#### `ULongBE`

```c3
bitstruct ULongBE : ulong @bigendian
```

---

#### `Int`

```c3
bitstruct Int128BE : int128 @bigendian
```
```c3
bitstruct Int128LE : int128 @littleendian
```

---

#### `UInt`

```c3
bitstruct UInt128BE : uint128 @bigendian
```
```c3
bitstruct UInt128LE : uint128 @littleendian
```

---

#### `ShortLE`

```c3
bitstruct ShortLE : short @littleendian
```

---

#### `UShortLE`

```c3
bitstruct UShortLE : ushort @littleendian
```

---

#### `IntLE`

```c3
bitstruct IntLE : int @littleendian
```

---

#### `UIntLE`

```c3
bitstruct UIntLE : int @littleendian
```

---

#### `LongLE`

```c3
bitstruct LongLE : long @littleendian
```

---

#### `ULongLE`

```c3
bitstruct ULongLE : ulong @littleendian
```

---

#### `read`

```c3
<*
 @require @is_array_or_slice_of_char(bytes) : "argument must be an array, a pointer to an array or a slice of char"
 @require is_bitorder($Type) : "type must be a bitorder integer"
*>
macro read(bytes, $Type)
```

---

#### `write`

```c3
<*
 @require @is_arrayptr_or_slice_of_char(bytes) : "argument must be a pointer to an array or a slice of char"
 @require is_bitorder($Type) : "type must be a bitorder integer"
*>
macro write(x, bytes, $Type)
```

---

#### `is_bitorder`

```c3
macro is_bitorder($Type)
```

---

#### `is_array_or_slice_of_char`

```c3
macro bool is_array_or_slice_of_char(bytes) @deprecated("Use @is_array_or_slice_of_char")
```

---

#### `@is_array_or_slice_of_char`

```c3
macro bool @is_array_or_slice_of_char(#bytes) @const
```

---

#### `is_arrayptr_or_slice_of_char`

```c3
macro bool is_arrayptr_or_slice_of_char(bytes) @deprecated("Use @is_arrayptr_or_slice_of_char")
```

---

#### `@is_arrayptr_or_slice_of_char`

```c3
macro bool @is_arrayptr_or_slice_of_char(#bytes) @const
```
### `std::core::builtin`

---

#### `@builtin`

```c3
const EmptySlot EMPTY_MACRO_SLOT @builtin = null
```

EMPTY_MACRO_SLOT is a value used for implementing optional arguments for macros in an efficient
way. It relies on the fact that distinct types are not implicitly convertable.

You can use `@is_empty_macro_slot()` and `@is_valid_macro_slot()` to figure out whether
the argument has been used or not.

An example:

```c3
macro foo(a, #b = EMPTY_MACRO_SLOT)
{
	$if @is_valid_macro_slot(#b):
		return invoke_foo2(a, #b);
	$else
		return invoke_foo1(a);
	$endif
}


---

#### `EmptySlot`

```c3
typedef EmptySlot = void*
```

---

#### `@is_empty_macro_slot`

```c3
macro @is_empty_macro_slot(#arg) @const @builtin
```

---

#### `@is_valid_macro_slot`

```c3
macro @is_valid_macro_slot(#arg) @const @builtin
```

---

#### `@rnd`

```c3
<*
 @ensure return >= 0.0 && return < 1.0
 @return "A compile time random"
*>
macro @rnd() @const @builtin
```

Returns a random value at compile time.


---

#### `NO_MORE_ELEMENT @builtin`

```c3
faultdef NO_MORE_ELEMENT @builtin
```

---

#### `NOT_FOUND @builtin`

```c3
faultdef NOT_FOUND @builtin
```

---

#### `TYPE_MISMATCH @builtin`

```c3
faultdef TYPE_MISMATCH @builtin
```

---

#### `CAPACITY_EXCEEDED @builtin`

```c3
faultdef CAPACITY_EXCEEDED @builtin
```

---

#### `NOT_IMPLEMENTED @builtin`

```c3
faultdef NOT_IMPLEMENTED @builtin
```

---

#### `VoidFn`

```c3
alias VoidFn = fn void()
```

---

#### `@scope`

```c3
<*
 @param #variable : `the variable to store and restore`
 @require values::@is_lvalue(#variable)
*>
macro void @scope(#variable; @body) @builtin
```

Stores a variable on the stack, then restores it at the end of the
macro scope.


---

#### `@swap`

```c3
<*
 @require $defined(#a = #b, #b = #a) : `The values must be mutually assignable`
*>
macro void @swap(#a, #b) @builtin
```

Swap two variables


---

#### `bitsizeof`

```c3
macro usz bitsizeof($Type) @builtin @const
```

---

#### `@bitsizeof`

```c3
macro usz @bitsizeof(#expr) @builtin @const
```

---

#### `anycast`

```c3
<*
 @param v : `the any to convert to the given type.`
 @param $Type : `the type to convert to`
 @return `The any.ptr converted to its type.`
 @ensure @typeis(return, $Type*)
 @return? TYPE_MISMATCH
*>
macro anycast(any v, $Type) @builtin
```

Convert an `any` type to a type, returning an failure if there is a type mismatch.


---

#### `@assignable_to`

```c3
macro bool @assignable_to(#foo, $Type) @const @builtin
```

---

#### `@addr`

```c3
macro @addr(#val) @builtin
```

---

#### `@typeid`

```c3
macro typeid @typeid(#value) @const @builtin
```

---

#### `@typekind`

```c3
macro TypeKind @typekind(#value) @const @builtin
```

---

#### `@typeis`

```c3
macro bool @typeis(#value, $Type) @const @builtin
```

---

#### `print_backtrace`

```c3
fn bool print_backtrace(String message, int backtraces_to_ignore) @if
```

---

#### `default_panic`

```c3
fn void default_panic(String message, String file, String function, uint line) @if(env::NATIVE_STACKTRACE)
```
```c3
fn void default_panic(String message, String file, String function, uint line) @if
```

---

#### `abort`

```c3
macro void abort(String string = "Unrecoverable error reached", ...) @format(0) @builtin @noreturn
```

---

#### `PanicFn`

```c3
alias PanicFn = fn void(String message, String file, String function, uint line)
```

---

#### `panicf`

```c3
fn void panicf(String fmt, String file, String function, uint line, args...)
```

---

#### `unreachable`

```c3
<*
 @param [in] string : "The panic message or format string"
*>
macro void unreachable(String string = "Unreachable statement reached.", ...) @builtin @noreturn
```

Marks the path as unreachable. This will panic in safe mode, and in fast will simply be assumed
never happens.


---

#### `unsupported`

```c3
<*
 @param [in] string : "The error message"
*>
macro void unsupported(String string = "Unsupported function invoked") @builtin @noreturn
```

Marks the path as unsupported, this is similar to unreachable.


---

#### `breakpoint`

```c3
macro void breakpoint() @builtin
```

Unconditionally break into an attached debugger when reached.


---

#### `any_make`

```c3
macro any_make(void* ptr, typeid type) @builtin
```

---

#### `any.retype_to`

```c3
macro any.retype_to(&self, typeid type)
```

---

#### `any.as_inner`

```c3
macro any.as_inner(&self)
```

---

#### `bitcast`

```c3
<*
 @param expr : "the expression to cast"
 @param $Type : "the type to cast to"
 @require $sizeof(expr) == $Type.sizeof  : "Cannot bitcast between types of different size."
 @ensure @typeis(return, $Type)
*>
macro bitcast(expr, $Type) @builtin
```

---

#### `enum_by_name`

```c3
<*
 @param $Type : `The type of the enum`
 @param [in] enum_name : `The name of the enum to search for`
 @require $Type.kindof == ENUM : `Only enums may be used`
 @ensure @typeis(return, $Type)
 @return? NOT_FOUND
*>
macro enum_by_name($Type, String enum_name) @builtin
```

---

#### `@enum_from_value`

```c3
<*
 @param $Type : `The type of the enum`
 @require $Type.kindof == ENUM : `Only enums may be used`
 @require $defined($Type.#value) : `Expected '#value' to match an enum associated value`
 @require @assignable_to(value, $typeof(($Type){}.#value)) : `Expected the value to match the type of the associated value`
 @ensure @typeis(return, $Type)
 @return? NOT_FOUND
*>
macro @enum_from_value($Type, #value, value) @builtin @deprecated("Use Enum.lookup_field and Enum.lookup")
```

---

#### `@likely`

```c3
<*
 @param #value : "expression to be marked likely"
 @param $probability : "in the range 0 - 1"
 @require $probability >= 0 && $probability <= 1.0
*>
macro bool @likely(bool #value, $probability = 1.0) @builtin
```

Mark an expression as likely to be true


---

#### `@unlikely`

```c3
<*
 @param #value : "expression to be marked unlikely"
 @param $probability : "in the range 0 - 1"
 @require $probability >= 0 && $probability <= 1.0
*>
macro bool @unlikely(bool #value, $probability = 1.0) @builtin
```

Mark an expression as unlikely to be true


---

#### `@expect`

```c3
<*
 @require values::@is_int(#value) || values::@is_bool(#value)
 @require @assignable_to(expected, $typeof(#value))
 @require $probability >= 0 && $probability <= 1.0
*>
macro @expect(#value, expected, $probability = 1.0) @builtin
```

---

#### `PrefetchLocality`

```c3
enum PrefetchLocality
```

Locality for prefetch, levels 0 - 3, corresponding
to "extremely local" to "no locality"


---

#### `@prefetch`

```c3
<*
 @param [in] ptr : `Pointer to prefetch`
 @param $locality : `Locality ranging from none to extremely local`
 @param $write : `Prefetch for write, otherwise prefetch for read.`
*>
macro @prefetch(void* ptr, PrefetchLocality $locality = VERY_NEAR, bool $write = false) @builtin
```

Prefetch a pointer.


---

#### `swizzle`

```c3
macro swizzle(v, ...) @builtin
```

---

#### `swizzle2`

```c3
macro swizzle2(v, v2, ...) @builtin
```

---

#### `@clz`

```c3
<*
 @require types::is_int($typeof($value)) : "Input value must be an integer"
 @require $sizeof($value) * 8 <= 128 : "Input value must be 128 bits wide or lower"
*>
macro @clz($value) @builtin @const
```

Returns the count of leading zero bits from an integer at compile-time.


---

#### `@catch`

```c3
<*
 @require @typekind(#expr) == OPTIONAL : `@catch expects an Optional value`
*>
macro fault @catch(#expr) @builtin
```

Return the excuse in the Optional if it is Empty, otherwise
return a null fault.


---

#### `@ok`

```c3
<*
 @require @typekind(#expr) == OPTIONAL : `@ok expects an Optional value`
*>
macro bool @ok(#expr) @builtin
```

Check if an Optional expression holds a value or is empty, returning true
if it has a value.


---

#### `@try`

```c3
<*
 @require $defined(#v = #v) : "#v must be a variable"
 @require $defined(#expr!) : "Expected an optional expression"
 @require @assignable_to(#expr!!, $typeof(#v))  : `Type of #expr must be an optional of #v's type`
*>
macro void? @try(#v, #expr) @builtin
```

Check if an Optional expression evaluates to a fault. If so, return it;
else, assign the result to an expression.


---

#### `@try_catch`

```c3
<*
 @require $defined(#v = #v) : "#v must be a variable"
 @require $defined(#expr!) : "Expected an optional expression"
 @require @assignable_to(#expr!!, $typeof(#v))  : `Type of #expr must be an optional of #v's type`
 @return "True if it was the expected fault, false if the variable was assigned, otherwise returns an optional."
*>
macro bool? @try_catch(#v, #expr, fault expected_fault) @builtin
```

Check if an Optional expression evaluates to a fault. If so, return true if it is the
expected fault, the optional if it is unexpected, or false if there was no fault and
the assign happened.

This can be used in like this:

 while (true)
 {
	char[] data;
	// Read until end of file
	if (@try_catch(data, load_line(), io::EOF)) break;
	.. use data ..
 }

In this example we read until we reach an EOF, which is expected. However, if we encounter some other
fault, we rethrow is. Without this macro, the code is instead written like:

 while (true)
 {
	char[]? data;
	data = load_line();
	if (catch err = data)
	{
	  if (err = io::EOF) break;
	  return err?
	}
	.. use data ..
 }


---

#### `@as_char_view`

```c3
<*
 @require $defined(&#value, (char*)&#value) : "This must be a value that can be viewed as a char array"
*>
macro char[] @as_char_view(#value) @builtin
```

---

#### `@str_find`

```c3
macro isz @str_find(String $string, String $needle) @builtin
```

---

#### `@str_upper`

```c3
macro String @str_upper(String $str) @builtin
```

---

#### `@str_lower`

```c3
macro String @str_lower(String $str) @builtin
```

---

#### `@str_hash`

```c3
macro uint @str_hash(String $str) @builtin
```

---

#### `@generic_hash_core`

```c3
macro @generic_hash_core(h, value)
```

---

#### `@generic_hash`

```c3
macro @generic_hash(value)
```

---

#### `int128.hash`

```c3
macro uint int128.hash(self)
```

---

#### `uint128.hash`

```c3
macro uint uint128.hash(self)
```

---

#### `long.hash`

```c3
macro uint long.hash(self)
```

---

#### `ulong.hash`

```c3
macro uint ulong.hash(self)
```

---

#### `int.hash`

```c3
macro uint int.hash(self)
```

---

#### `uint.hash`

```c3
macro uint uint.hash(self)
```

---

#### `short.hash`

```c3
macro uint short.hash(self)
```

---

#### `ushort.hash`

```c3
macro uint ushort.hash(self)
```

---

#### `ichar.hash`

```c3
macro uint ichar.hash(self)
```

---

#### `char.hash`

```c3
macro uint char.hash(self)
```

---

#### `bool.hash`

```c3
macro uint bool.hash(self)
```

---

#### `int128[*].hash`

```c3
macro uint int128[*].hash(&self)
```

---

#### `uint128[*].hash`

```c3
macro uint uint128[*].hash(&self)
```

---

#### `long[*].hash`

```c3
macro uint long[*].hash(&self)
```

---

#### `ulong[*].hash`

```c3
macro uint ulong[*].hash(&self)
```

---

#### `int[*].hash`

```c3
macro uint int[*].hash(&self)
```

---

#### `uint[*].hash`

```c3
macro uint uint[*].hash(&self)
```

---

#### `short[*].hash`

```c3
macro uint short[*].hash(&self)
```

---

#### `ushort[*].hash`

```c3
macro uint ushort[*].hash(&self)
```

---

#### `char[*].hash`

```c3
macro uint char[*].hash(&self)
```

---

#### `ichar[*].hash`

```c3
macro uint ichar[*].hash(&self)
```

---

#### `bool[*].hash`

```c3
macro uint bool[*].hash(&self)
```

---

#### `int128[<*>].hash`

```c3
macro uint int128[<*>].hash(self)
```

---

#### `uint128[<*>].hash`

```c3
macro uint uint128[<*>].hash(self)
```

---

#### `long[<*>].hash`

```c3
macro uint long[<*>].hash(self)
```

---

#### `ulong[<*>].hash`

```c3
macro uint ulong[<*>].hash(self)
```

---

#### `int[<*>].hash`

```c3
macro uint int[<*>].hash(self)
```

---

#### `uint[<*>].hash`

```c3
macro uint uint[<*>].hash(self)
```

---

#### `short[<*>].hash`

```c3
macro uint short[<*>].hash(self)
```

---

#### `ushort[<*>].hash`

```c3
macro uint ushort[<*>].hash(self)
```

---

#### `char[<*>].hash`

```c3
macro uint char[<*>].hash(self)
```

---

#### `ichar[<*>].hash`

```c3
macro uint ichar[<*>].hash(self)
```

---

#### `bool[<*>].hash`

```c3
macro uint bool[<*>].hash(self)
```

---

#### `typeid.hash`

```c3
macro uint typeid.hash(typeid t)
```

---

#### `String.hash`

```c3
macro uint String.hash(String c)
```

---

#### `char[].hash`

```c3
macro uint char[].hash(char[] c)
```

---

#### `void*.hash`

```c3
macro uint void*.hash(void* ptr)
```

---

#### `hash_array`

```c3
<*
 @require @typekind(array_ptr) == POINTER &&& @typekind(*array_ptr) == ARRAY
*>
macro uint hash_array(array_ptr) @local
```

---

#### `hash_vec`

```c3
<*
 @require @typekind(vec) == VECTOR
*>
macro uint hash_vec(vec) @local
```

---

#### `MAX_FRAMEADDRESS`

```c3
const MAX_FRAMEADDRESS = 128
```

---

#### `get_frameaddress`

```c3
<*
 @require n >= 0
*>
macro void* get_frameaddress(int n)
```

---

#### `get_returnaddress`

```c3
<*
 @require n >= 0
*>
macro void* get_returnaddress(int n)
```

---

#### `less`

```c3
<*
 @require types::@comparable_value(a) && types::@comparable_value(b)
*>
macro less(a, b) @builtin
```

---

#### `less_eq`

```c3
<*
 @require types::@comparable_value(a) && types::@comparable_value(b)
*>
macro less_eq(a, b) @builtin
```

---

#### `greater`

```c3
<*
 @require types::@comparable_value(a) && types::@comparable_value(b)
*>
macro greater(a, b) @builtin
```

---

#### `compare_to`

```c3
<*
 @require types::@comparable_value(a) && types::@comparable_value(b)
*>
macro int compare_to(a, b) @builtin
```

---

#### `greater_eq`

```c3
<*
 @require types::@comparable_value(a) && types::@comparable_value(b)
*>
macro greater_eq(a, b) @builtin
```

---

#### `equals`

```c3
<*
 @require types::@equatable_value(a) && types::@equatable_value(b) : `values must be equatable`
*>
macro bool equals(a, b) @builtin
```

---

#### `min`

```c3
macro min(x, ...) @builtin
```

---

#### `max`

```c3
macro max(x, ...) @builtin
```
### `std::core::builtin @if((env::LINUX || env::ANDROID || env::DARWIN) && env::COMPILER_SAFE_MODE && env::DEBUG_SYMBOLS)`

---

#### `sig_panic`

```c3
fn void sig_panic(String message)
```

---

#### `sig_bus_error`

```c3
fn void sig_bus_error(CInt i)
```

---

#### `sig_segmentation_fault`

```c3
fn void sig_segmentation_fault(CInt i)
```

---

#### `install_signal_handler`

```c3
fn void install_signal_handler(CInt signal, SignalFunction func) @local
```

---

#### `install_signal_handlers`

```c3
fn void install_signal_handlers() @init(101) @local @if(env::BACKTRACE)
```
### `std::core::cinterop`

---

#### `C_INT_SIZE`

```c3
const C_INT_SIZE = $$C_INT_SIZE
```

---

#### `C_LONG_SIZE`

```c3
const C_LONG_SIZE = $$C_LONG_SIZE
```

---

#### `C_SHORT_SIZE`

```c3
const C_SHORT_SIZE = $$C_SHORT_SIZE
```

---

#### `C_LONG_LONG_SIZE`

```c3
const C_LONG_LONG_SIZE = $$C_LONG_LONG_SIZE
```

---

#### `CShort`

```c3
alias CShort = $typefrom(signed_int_from_bitsize($$C_SHORT_SIZE))
```

---

#### `CUShort`

```c3
alias CUShort = $typefrom(unsigned_int_from_bitsize($$C_SHORT_SIZE))
```

---

#### `CInt`

```c3
alias CInt = $typefrom(signed_int_from_bitsize($$C_INT_SIZE))
```

---

#### `CUInt`

```c3
alias CUInt = $typefrom(unsigned_int_from_bitsize($$C_INT_SIZE))
```

---

#### `CLong`

```c3
alias CLong = $typefrom(signed_int_from_bitsize($$C_LONG_SIZE))
```

---

#### `CULong`

```c3
alias CULong = $typefrom(unsigned_int_from_bitsize($$C_LONG_SIZE))
```

---

#### `CLongLong`

```c3
alias CLongLong = $typefrom(signed_int_from_bitsize($$C_LONG_LONG_SIZE))
```

---

#### `CULongLong`

```c3
alias CULongLong = $typefrom(unsigned_int_from_bitsize($$C_LONG_LONG_SIZE))
```

---

#### `CSChar`

```c3
alias CSChar = ichar
```

---

#### `CUChar`

```c3
alias CUChar = char
```

---

#### `CChar`

```c3
alias CChar = $typefrom($$C_CHAR_IS_SIGNED ? ichar.typeid : char.typeid)
```

---

#### `CBool`

```c3
enum CBool : char
```

---

#### `signed_int_from_bitsize`

```c3
macro typeid signed_int_from_bitsize(usz $bitsize) @private
```

---

#### `unsigned_int_from_bitsize`

```c3
macro typeid unsigned_int_from_bitsize(usz $bitsize) @private
```
### `std::core::cpudetect @if(env::X86 || env::X86_64)`

---

#### `CpuId`

```c3
struct CpuId
```

---

#### `x86_cpuid`

```c3
fn CpuId x86_cpuid(uint eax, uint ecx = 0)
```

---

#### `X`

```c3
enum X86Feature
```

---

#### `add_feature_if_bit`

```c3
fn void add_feature_if_bit(X86Feature feature, uint register, int bit)
```

---

#### `x86_initialize_cpu_features`

```c3
fn void x86_initialize_cpu_features()
```
### `std::core::dstring`

---

#### `DString`

```c3
typedef DString (OutStream) = DStringOpaque*
```

The DString offers a dynamic string builder.


---

#### `DStringOpaque`

```c3
typedef DStringOpaque = void
```

---

#### `DString.init`

```c3
<*
 @param [&inout] allocator : "The allocator to use"
 @param capacity : "Starting capacity, defaults to MIN_CAPACITY and cannot be smaller"
 @return "Return the DString itself"
 @require !self.data() : "String already initialized"
*>
fn DString DString.init(&self, Allocator allocator, usz capacity = MIN_CAPACITY)
```

Initialize the DString with a particular allocator.


---

#### `DString.tinit`

```c3
<*
 @param capacity : "Starting capacity, defaults to MIN_CAPACITY and cannot be smaller"
 @return "Return the DString itself"
 @require !self.data() : "String already initialized"
*>
fn DString DString.tinit(&self, usz capacity = MIN_CAPACITY)
```

Initialize the DString with the temp allocator. Note that if the dstring is never
initialized, this is the allocator it will default to.


---

#### `new_with_capacity`

```c3
fn DString new_with_capacity(Allocator allocator, usz capacity)
```

---

#### `temp_with_capacity`

```c3
fn DString temp_with_capacity(usz capacity)
```

---

#### `new`

```c3
fn DString new(Allocator allocator, String c = "")
```

---

#### `temp`

```c3
fn DString temp(String s = "")
```

---

#### `DString.replace_char`

```c3
fn void DString.replace_char(self, char ch, char replacement)
```

---

#### `DString.replace`

```c3
fn void DString.replace(&self, String needle, String replacement)
```

---

#### `DString.concat`

```c3
fn DString DString.concat(self, Allocator allocator, DString b) @nodiscard
```

---

#### `DString.tconcat`

```c3
fn DString DString.tconcat(self, DString b)
```

---

#### `DString.zstr_view`

```c3
fn ZString DString.zstr_view(&self)
```

---

#### `DString.capacity`

```c3
fn usz DString.capacity(self)
```

---

#### `DString.len`

```c3
fn usz DString.len(&self) @dynamic @operator(len)
```

---

#### `DString.chop`

```c3
<*
 @require new_size <= self.len()
*>
fn void DString.chop(self, usz new_size)
```

---

#### `DString.str_view`

```c3
fn String DString.str_view(self)
```

---

#### `DString.char_at`

```c3
<*
 @require index < self.len()
 @require self.data() != null : "Empty string"
*>
fn char DString.char_at(self, usz index) @operator([])
```

---

#### `DString.char_ref`

```c3
<*
 @require index < self.len()
 @require self.data() != null  : "Empty string"
*>
fn char* DString.char_ref(&self, usz index) @operator(&[])
```

---

#### `DString.append_utf32`

```c3
fn usz DString.append_utf32(&self, Char32[] chars)
```

---

#### `DString.set`

```c3
<*
 @require index < self.len()
*>
fn void DString.set(self, usz index, char c) @operator([]=)
```

---

#### `DString.append_repeat`

```c3
fn void DString.append_repeat(&self, char c, usz times)
```

---

#### `DString.append_char32`

```c3
<*
 @require c <= 0x10ffff
*>
fn usz DString.append_char32(&self, Char32 c)
```

---

#### `DString.tcopy`

```c3
fn DString DString.tcopy(&self)
```

---

#### `DString.copy`

```c3
fn DString DString.copy(self, Allocator allocator) @nodiscard
```

---

#### `DString.copy_zstr`

```c3
fn ZString DString.copy_zstr(self, Allocator allocator) @nodiscard
```

---

#### `DString.copy_str`

```c3
fn String DString.copy_str(self, Allocator allocator) @nodiscard
```

---

#### `DString.tcopy_str`

```c3
fn String DString.tcopy_str(self) @nodiscard
```

---

#### `DString.equals`

```c3
fn bool DString.equals(self, DString other_string)
```

---

#### `DString.free`

```c3
fn void DString.free(&self)
```

---

#### `DString.less`

```c3
fn bool DString.less(self, DString other_string)
```

---

#### `DString.append_chars`

```c3
fn void DString.append_chars(&self, String str)
```

---

#### `DString.copy_utf32`

```c3
fn Char32[] DString.copy_utf32(&self, Allocator allocator)
```

---

#### `DString.append_string`

```c3
fn void DString.append_string(&self, DString str)
```

---

#### `DString.clear`

```c3
fn void DString.clear(self)
```

---

#### `DString.write`

```c3
fn usz? DString.write(&self, char[] buffer) @dynamic
```

---

#### `DString.write_byte`

```c3
fn void? DString.write_byte(&self, char c) @dynamic
```

---

#### `DString.append_char`

```c3
fn void DString.append_char(&self, char c)
```

---

#### `DString.delete_range`

```c3
<*
 @require start < self.len()
 @require end < self.len()
 @require end >= start : "End must be same or equal to the start"
*>
fn void DString.delete_range(&self, usz start, usz end)
```

---

#### `DString.delete`

```c3
<*
 @require start < self.len()
 @require start + len <= self.len()
*>
fn void DString.delete(&self, usz start, usz len = 1)
```

---

#### `DString.append`

```c3
macro void DString.append(&self, value)
```

---

#### `DString.insert_chars_at`

```c3
<*
 @require index <= self.len()
*>
fn void DString.insert_chars_at(&self, usz index, String s)
```

---

#### `DString.insert_string_at`

```c3
<*
 @require index <= self.len()
*>
fn void DString.insert_string_at(&self, usz index, DString str)
```

---

#### `DString.insert_char_at`

```c3
<*
 @require index <= self.len()
*>
fn void DString.insert_char_at(&self, usz index, char c)
```

---

#### `DString.insert_char32_at`

```c3
<*
 @require index <= self.len()
*>
fn usz DString.insert_char32_at(&self, usz index, Char32 c)
```

---

#### `DString.insert_utf32_at`

```c3
<*
 @require index <= self.len()
*>
fn usz DString.insert_utf32_at(&self, usz index, Char32[] chars)
```

---

#### `DString.insert_at`

```c3
macro void DString.insert_at(&self, usz index, value)
```

---

#### `DString.appendf`

```c3
fn usz? DString.appendf(&self, String format, args...) @maydiscard
```

---

#### `DString.appendfn`

```c3
fn usz? DString.appendfn(&self, String format, args...) @maydiscard
```

---

#### `join`

```c3
fn DString join(Allocator allocator, String[] s, String joiner) @nodiscard
```

---

#### `out_string_append_fn`

```c3
fn void? out_string_append_fn(void* data, char c) @private
```

---

#### `DString.reverse`

```c3
fn void DString.reverse(self)
```

---

#### `DString.data`

```c3
fn StringData* DString.data(self) @inline @private
```

---

#### `DString.reserve`

```c3
fn void DString.reserve(&self, usz addition)
```

---

#### `DString.read_from_stream`

```c3
fn usz? DString.read_from_stream(&self, InStream reader)
```
### `std::core::env`

---

#### `CompilerOptLevel`

```c3
enum CompilerOptLevel
```

---

#### `MemoryEnvironment`

```c3
enum MemoryEnvironment
```

---

#### `OsType`

```c3
enum OsType
```

---

#### `ArchType`

```c3
enum ArchType
```

---

#### `COMPILER_BUILD_HASH`

```c3
const String COMPILER_BUILD_HASH = $$BUILD_HASH
```

---

#### `COMPILER_BUILD_DATE`

```c3
const String COMPILER_BUILD_DATE = $$BUILD_DATE
```

---

#### `OS_TYPE`

```c3
const OsType OS_TYPE = OsType.from_ordinal($$OS_TYPE)
```

---

#### `ARCH_TYPE`

```c3
const ArchType ARCH_TYPE = ArchType.from_ordinal($$ARCH_TYPE)
```

---

#### `MAX_VECTOR_SIZE`

```c3
const usz MAX_VECTOR_SIZE = $$MAX_VECTOR_SIZE
```

---

#### `ARCH_32_BIT`

```c3
const bool ARCH_32_BIT = $$REGISTER_SIZE == 32
```

---

#### `ARCH_64_BIT`

```c3
const bool ARCH_64_BIT = $$REGISTER_SIZE == 64
```

---

#### `LIBC`

```c3
const bool LIBC = $$COMPILER_LIBC_AVAILABLE
```

---

#### `NO_LIBC`

```c3
const bool NO_LIBC = !$$COMPILER_LIBC_AVAILABLE
```

---

#### `COMPILER_OPT_LEVEL`

```c3
const CompilerOptLevel COMPILER_OPT_LEVEL = CompilerOptLevel.from_ordinal($$COMPILER_OPT_LEVEL)
```

---

#### `BIG_ENDIAN`

```c3
const bool BIG_ENDIAN = $$PLATFORM_BIG_ENDIAN
```

---

#### `I128_NATIVE_SUPPORT`

```c3
const bool I128_NATIVE_SUPPORT = $$PLATFORM_I128_SUPPORTED
```

---

#### `F16_SUPPORT`

```c3
const bool F16_SUPPORT = $$PLATFORM_F16_SUPPORTED
```

---

#### `F128_SUPPORT`

```c3
const bool F128_SUPPORT = $$PLATFORM_F128_SUPPORTED
```

---

#### `REGISTER_SIZE`

```c3
const REGISTER_SIZE = $$REGISTER_SIZE
```

---

#### `COMPILER_SAFE_MODE`

```c3
const bool COMPILER_SAFE_MODE = $$COMPILER_SAFE_MODE
```

---

#### `DEBUG_SYMBOLS`

```c3
const bool DEBUG_SYMBOLS = $$DEBUG_SYMBOLS
```

---

#### `BACKTRACE`

```c3
const bool BACKTRACE = $$BACKTRACE
```

---

#### `LLVM_VERSION`

```c3
const usz LLVM_VERSION = $$LLVM_VERSION
```

---

#### `BENCHMARKING`

```c3
const bool BENCHMARKING = $$BENCHMARKING
```

---

#### `TESTING`

```c3
const bool TESTING = $$TESTING
```

---

#### `PANIC_MSG`

```c3
const bool PANIC_MSG = $$PANIC_MSG
```

---

#### `MEMORY_ENV`

```c3
const MemoryEnvironment MEMORY_ENV = MemoryEnvironment.from_ordinal($$MEMORY_ENVIRONMENT)
```

---

#### `TRACK_MEMORY`

```c3
const bool TRACK_MEMORY = DEBUG_SYMBOLS && (COMPILER_SAFE_MODE || TESTING)
```

---

#### `X86_64`

```c3
const bool X86_64 = ARCH_TYPE == X86_64
```

---

#### `X86`

```c3
const bool X86 = ARCH_TYPE == X86
```

---

#### `AARCH64`

```c3
const bool AARCH64 = ARCH_TYPE == AARCH64
```

---

#### `NATIVE_STACKTRACE`

```c3
const bool NATIVE_STACKTRACE = LINUX || DARWIN || OPENBSD || WIN32
```

---

#### `LINUX`

```c3
const bool LINUX = LIBC && OS_TYPE == LINUX
```

---

#### `DARWIN`

```c3
const bool DARWIN = LIBC && os_is_darwin()
```

---

#### `WIN32`

```c3
const bool WIN32 = LIBC && OS_TYPE == WIN32
```

---

#### `POSIX`

```c3
const bool POSIX = LIBC && os_is_posix()
```

---

#### `OPENBSD`

```c3
const bool OPENBSD = LIBC && OS_TYPE == OPENBSD
```

---

#### `FREEBSD`

```c3
const bool FREEBSD = LIBC && OS_TYPE == FREEBSD
```

---

#### `NETBSD`

```c3
const bool NETBSD = LIBC && OS_TYPE == NETBSD
```

---

#### `BSD_FAMILY`

```c3
const bool BSD_FAMILY = env::FREEBSD || env::OPENBSD || env::NETBSD
```

---

#### `WASI`

```c3
const bool WASI = LIBC && OS_TYPE == WASI
```

---

#### `ANDROID`

```c3
const bool ANDROID = LIBC && OS_TYPE == ANDROID
```

---

#### `@builtin`

```c3
const bool WASM_NOLIBC @builtin = !LIBC && ARCH_TYPE == ArchType.WASM32 || ARCH_TYPE == ArchType.WASM64
```

---

#### `ADDRESS_SANITIZER`

```c3
const bool ADDRESS_SANITIZER = $$ADDRESS_SANITIZER
```

---

#### `MEMORY_SANITIZER`

```c3
const bool MEMORY_SANITIZER = $$MEMORY_SANITIZER
```

---

#### `THREAD_SANITIZER`

```c3
const bool THREAD_SANITIZER = $$THREAD_SANITIZER
```

---

#### `ANY_SANITIZER`

```c3
const bool ANY_SANITIZER = ADDRESS_SANITIZER || MEMORY_SANITIZER || THREAD_SANITIZER
```

---

#### `LANGUAGE_DEV_VERSION`

```c3
const int LANGUAGE_DEV_VERSION = $$LANGUAGE_DEV_VERSION
```

---

#### `HAS_NATIVE_ERRNO`

```c3
const bool HAS_NATIVE_ERRNO = env::LINUX || env::ANDROID || env::OPENBSD || env::DARWIN || env::WIN32
```

---

#### `os_is_darwin`

```c3
macro bool os_is_darwin() @const
```

---

#### `os_is_posix`

```c3
macro bool os_is_posix() @const
```

---

#### `AUTHORS`

```c3
const String[] AUTHORS = $$AUTHORS
```

---

#### `AUTHOR_EMAILS`

```c3
const String[] AUTHOR_EMAILS = $$AUTHOR_EMAILS
```

---

#### `BUILTIN_EXPECT_IS_DISABLED`

```c3
const BUILTIN_EXPECT_IS_DISABLED = $feature(DISABLE_BUILTIN_EXPECT)
```

---

#### `BUILTIN_PREFETCH_IS_DISABLED`

```c3
const BUILTIN_PREFETCH_IS_DISABLED = $feature(DISABLE_BUILTIN_PREFETCH)
```
### `std::core::log`

---

#### `FULL_LOG`

```c3
const FULL_LOG = env::COMPILER_SAFE_MODE || $feature(FULL_LOG)
```

---

#### `LogCategory`

```c3
typedef LogCategory = inline char
```

---

#### `LogTag`

```c3
typedef LogTag = char[12]
```

---

#### `CATEGORY_APPLICATION`

```c3
const LogCategory CATEGORY_APPLICATION  = 0
```

---

#### `CATEGORY_SYSTEM`

```c3
const LogCategory CATEGORY_SYSTEM       = 1
```

---

#### `CATEGORY_KERNEL`

```c3
const LogCategory CATEGORY_KERNEL       = 2
```

---

#### `CATEGORY_AUDIO`

```c3
const LogCategory CATEGORY_AUDIO        = 3
```

---

#### `CATEGORY_VIDEO`

```c3
const LogCategory CATEGORY_VIDEO        = 4
```

---

#### `CATEGORY_RENDER`

```c3
const LogCategory CATEGORY_RENDER       = 5
```

---

#### `CATEGORY_INPUT`

```c3
const LogCategory CATEGORY_INPUT        = 6
```

---

#### `CATEGORY_NETWORK`

```c3
const LogCategory CATEGORY_NETWORK      = 7
```

---

#### `CATEGORY_SOCKET`

```c3
const LogCategory CATEGORY_SOCKET       = 8
```

---

#### `CATEGORY_SECURITY`

```c3
const LogCategory CATEGORY_SECURITY     = 9
```

---

#### `CATEGORY_TEST`

```c3
const LogCategory CATEGORY_TEST         = 10
```

---

#### `CATEGORY_ERROR`

```c3
const LogCategory CATEGORY_ERROR        = 11
```

---

#### `CATEGORY_ASSERT`

```c3
const LogCategory CATEGORY_ASSERT       = 12
```

---

#### `CATEGORY_CRASH`

```c3
const LogCategory CATEGORY_CRASH        = 13
```

---

#### `CATEGORY_STATS`

```c3
const LogCategory CATEGORY_STATS        = 14
```

---

#### `CATEGORY_CUSTOM_START`

```c3
const LogCategory CATEGORY_CUSTOM_START = 100
```

---

#### `LogPriority`

```c3
enum LogPriority : int
```

---

#### `verbose`

```c3
macro void verbose(String fmt, ..., LogCategory category = default_category)
```

---

#### `debug`

```c3
macro void debug(String fmt, ..., LogCategory category = default_category)
```

---

#### `info`

```c3
macro void info(String fmt, ..., LogCategory category = default_category)
```

---

#### `warn`

```c3
macro void warn(String fmt, ..., LogCategory category = default_category)
```

---

#### `error`

```c3
macro void error(String fmt, ..., LogCategory category = default_category)
```

---

#### `critical`

```c3
macro void critical(String fmt, ..., LogCategory category = default_category)
```

---

#### `@category_scope`

```c3
macro void @category_scope(LogCategory new_category; @body)
```

---

#### `@tag_scope`

```c3
<*
 @require tag_prefix.len <= 3 : "The prefix may not exceed 3 bytes"
*>
macro void @tag_scope(String tag_prefix = ""; @body)
```

---

#### `push_tag`

```c3
<*
 @require tag_prefix.len <= 3 : "The prefix may not exceed 3 bytes"
*>
macro void push_tag(String tag_prefix = "")
```

---

#### `create_tag`

```c3
<*
 @require tag_prefix.len <= 3 : "The prefix may not exceed 3 bytes"
*>
fn LogTag create_tag(String tag_prefix)
```

---

#### `set_priority_for_category`

```c3
fn void set_priority_for_category(LogCategory category, LogPriority new_priority)
```

---

#### `get_priority_for_category`

```c3
fn LogPriority get_priority_for_category(LogCategory category)
```

---

#### `set_priority_all`

```c3
fn void set_priority_all(LogPriority new_priority)
```

---

#### `set_logger`

```c3
fn void set_logger(Logger logger)
```

---

#### `init`

```c3
macro void init()
```

---

#### `call_log`

```c3
fn void call_log(LogPriority prio, LogCategory category, String fmt, args...)
```

---

#### `get_category_name`

```c3
fn String? get_category_name(LogCategory category)
```

---

#### `set_category_name`

```c3
fn void set_category_name(LogCategory category, String name)
```

---

#### `NullLogger`

```c3
struct NullLogger (Logger)
```

---

#### `NullLogger.log`

```c3
fn void NullLogger.log(&self, LogPriority priority, LogCategory category, LogTag tag, String file, String function, int line, String fmt, any[] args) @dynamic
```

---

#### `MultiLogger`

```c3
struct MultiLogger (Logger)
```

---

#### `MultiLogger.log`

```c3
fn void MultiLogger.log(&self, LogPriority priority, LogCategory category, LogTag tag, String file, String function, int line, String fmt, any[] args) @dynamic
```
### `std::core::main_stub`

---

#### `_strlen`

```c3
macro usz _strlen(ptr) @private
```

---

#### `@main_to_err_main`

```c3
macro int @main_to_err_main(#m, int, char**)
```

---

#### `@main_to_int_main`

```c3
macro int @main_to_int_main(#m, int, char**)
```

---

#### `@main_to_void_main`

```c3
macro int @main_to_void_main(#m, int, char**)
```

---

#### `args_to_strings`

```c3
macro String[] args_to_strings(int argc, char** argv) @private
```

---

#### `@main_to_err_main_args`

```c3
macro int @main_to_err_main_args(#m, int argc, char** argv)
```

---

#### `@main_to_int_main_args`

```c3
macro int @main_to_int_main_args(#m, int argc, char** argv)
```

---

#### `@_main_runner`

```c3
macro int @_main_runner(#m, int argc, char** argv)
```

---

#### `@main_to_void_main_args`

```c3
macro int @main_to_void_main_args(#m, int argc, char** argv)
```
### `std::core::main_stub @if(env::WIN32)`

---

#### `_win_command_line_to_argv_w`

```c3
extern fn Char16** _win_command_line_to_argv_w(ushort* cmd_line, int* argc_ptr) @extern("CommandLineToArgvW")
```

---

#### `wargs_strings`

```c3
macro String[] wargs_strings(int argc, Char16** argv) @private
```

---

#### `release_wargs`

```c3
macro void release_wargs(String[] list) @private
```

---

#### `@win_to_err_main_noargs`

```c3
macro int @win_to_err_main_noargs(#m, void* handle, void* prev_handle, Char16* cmd_line, int show_cmd)
```

---

#### `@win_to_int_main_noargs`

```c3
macro int @win_to_int_main_noargs(#m, void* handle, void* prev_handle, Char16* cmd_line, int show_cmd)
```

---

#### `@win_to_void_main_noargs`

```c3
macro int @win_to_void_main_noargs(#m, void* handle, void* prev_handle, Char16* cmd_line, int show_cmd)
```

---

#### `@win_to_err_main_args`

```c3
macro int @win_to_err_main_args(#m, void* handle, void* prev_handle, Char16* cmd_line, int show_cmd)
```

---

#### `@win_to_int_main_args`

```c3
macro int @win_to_int_main_args(#m, void* handle, void* prev_handle, Char16* cmd_line, int show_cmd)
```

---

#### `@win_to_void_main_args`

```c3
macro int @win_to_void_main_args(#m, void* handle, void* prev_handle, Char16* cmd_line, int show_cmd)
```

---

#### `@win_to_err_main`

```c3
macro int @win_to_err_main(#m, void* handle, void* prev_handle, Char16* cmd_line, int show_cmd)
```

---

#### `@win_to_int_main`

```c3
macro int @win_to_int_main(#m, void* handle, void* prev_handle, Char16* cmd_line, int show_cmd)
```

---

#### `@win_to_void_main`

```c3
macro int @win_to_void_main(#m, void* handle, void* prev_handle, Char16* cmd_line, int show_cmd)
```

---

#### `@wmain_to_err_main_args`

```c3
macro int @wmain_to_err_main_args(#m, int argc, Char16** argv)
```

---

#### `@wmain_to_int_main_args`

```c3
macro int @wmain_to_int_main_args(#m, int argc, Char16** argv)
```

---

#### `@_wmain_runner`

```c3
macro int @_wmain_runner(#m, int argc, Char16** argv)
```

---

#### `@wmain_to_void_main_args`

```c3
macro int @wmain_to_void_main_args(#m, int argc, Char16** argv)
```
### `std::core::mem`

---

#### `MAX_MEMORY_ALIGNMENT`

```c3
const MAX_MEMORY_ALIGNMENT = 0x1000_0000
```

---

#### `DEFAULT_MEM_ALIGNMENT`

```c3
const DEFAULT_MEM_ALIGNMENT = (void*.alignof) * 2
```

---

#### `KB`

```c3
const ulong KB = 1024
```

---

#### `MB`

```c3
const ulong MB = KB * 1024
```

---

#### `GB`

```c3
const ulong GB = MB * 1024
```

---

#### `TB`

```c3
const ulong TB = GB * 1024
```

---

#### `OUT_OF_MEMORY, INVALID_ALLOC_SIZE`

```c3
faultdef OUT_OF_MEMORY, INVALID_ALLOC_SIZE
```

---

#### `@constant_is_power_of_2`

```c3
macro bool @constant_is_power_of_2($x) @const @private
```

---

#### `os_pagesize`

```c3
fn usz os_pagesize()
```

---

#### `masked_load`

```c3
<*
 @param ptr : "The pointer address to load from."
 @param mask : "The mask for the load"
 @param passthru : "The value to use for non masked values"
 @require @assignable_to(&&passthru, $typeof(ptr)) : "Pointer and passthru must match"
 @require @typekind(passthru) == VECTOR : "Expected passthru to be a vector"
 @require passthru.len == mask.len : "Mask and passthru must have the same length"
 @return "A vector with the loaded values where the mask is true, passthru where the mask is false"
*>
macro masked_load(ptr, bool[<*>] mask, passthru)
```

Load a vector from memory according to a mask assuming default alignment.


---

#### `@masked_load_aligned`

```c3
<*
 @param ptr : "The pointer address to load from."
 @param mask : "The mask for the load"
 @param passthru : "The value to use for non masked values"
 @param $alignment : "The alignment to assume for the pointer"
 @require @assignable_to(&&passthru, $typeof(ptr)) : "Pointer and passthru must match"
 @require @typekind(passthru) == VECTOR : "Expected passthru to be a vector"
 @require passthru.len == mask.len : "Mask and passthru must have the same length"
 @require @constant_is_power_of_2($alignment) : "The alignment must be a power of two"
 @return "A vector with the loaded values where the mask is true, passthru where the mask is false"
*>
macro @masked_load_aligned(ptr, bool[<*>] mask, passthru, usz $alignment)
```

Load a vector from memory according to a mask.


---

#### `gather`

```c3
<*
 @param ptrvec : "The vector of pointers to load from."
 @param mask : "The mask for the load"
 @param passthru : "The value to use for non masked values"
 @require @typekind(ptrvec) == VECTOR : "Expected ptrvec to be a vector"
 @require @typekind(passthru) == VECTOR : "Expected passthru to be a vector"
 @require @assignable_to(&&passthru[0], $typeof(ptrvec[0])) : "Pointer and passthru must match"
 @require passthru.len == mask.len : "Mask and passthru must have the same length"
 @require mask.len == ptrvec.len : "Mask and ptrvec must have the same length"
 @return "A vector with the loaded values where the mask is true, passthru where the mask is false"
*>
macro gather(ptrvec, bool[<*>] mask, passthru)
```

Load values from a pointer vector, assuming default alignment.


---

#### `@gather_aligned`

```c3
<*
 @param ptrvec : "The vector of pointers to load from."
 @param mask : "The mask for the load"
 @param passthru : "The value to use for non masked values"
 @param $alignment : "The alignment to assume for the pointers"
 @require @typekind(ptrvec) == VECTOR : "Expected ptrvec to be a vector"
 @require @typekind(passthru) == VECTOR : "Expected passthru to be a vector"
 @require @assignable_to(&&passthru[0], $typeof(ptrvec[0])) : "Pointer and passthru must match"
 @require passthru.len == mask.len : "Mask and passthru must have the same length"
 @require mask.len == ptrvec.len : "Mask and ptrvec must have the same length"
 @require @constant_is_power_of_2($alignment) : "The alignment must be a power of two"
 @return "A vector with the loaded values where the mask is true, passthru where the mask is false"
*>
macro @gather_aligned(ptrvec, bool[<*>] mask, passthru, usz $alignment)
```

Load values from a pointer vector.


---

#### `masked_store`

```c3
<*
 @param ptr : "The pointer address to store to."
 @param value : "The value to store masked"
 @param mask : "The mask for the store"
 @require @assignable_to(&&value, $typeof(ptr)) : "Pointer and value must match"
 @require @typekind(value) == VECTOR : "Expected value to be a vector"
 @require value.len == mask.len : "Mask and value must have the same length"
*>
macro masked_store(ptr, value, bool[<*>] mask)
```

Store parts of a vector according to the mask, assuming default alignment.


---

#### `@masked_store_aligned`

```c3
<*
 @param ptr : "The pointer address to store to."
 @param value : "The value to store masked"
 @param mask : "The mask for the store"
 @param $alignment : "The alignment of the pointer"
 @require @assignable_to(&&value, $typeof(ptr)) : "Pointer and value must match"
 @require @typekind(value) == VECTOR : "Expected value to be a vector"
 @require value.len == mask.len : "Mask and value must have the same length"
 @require @constant_is_power_of_2($alignment) : "The alignment must be a power of two"
*>
macro @masked_store_aligned(ptr, value, bool[<*>] mask, usz $alignment)
```

---

#### `scatter`

```c3
<*
 @param ptrvec : "The vector pointer containing the addresses to store to."
 @param value : "The value to store masked"
 @param mask : "The mask for the store"
 @require @typekind(ptrvec) == VECTOR : "Expected ptrvec to be a vector"
 @require @typekind(value) == VECTOR : "Expected value to be a vector"
 @require @assignable_to(&&value[0], $typeof(ptrvec[0])) : "Pointer and value must match"
 @require value.len == mask.len : "Mask and value must have the same length"
 @require mask.len == ptrvec.len : "Mask and ptrvec must have the same length"
*>
macro scatter(ptrvec, value, bool[<*>] mask)
```

---

#### `@scatter_aligned`

```c3
<*
 @param ptrvec : "The vector pointer containing the addresses to store to."
 @param value : "The value to store masked"
 @param mask : "The mask for the store"
 @param $alignment : "The alignment of the load"
 @require @typekind(ptrvec) == VECTOR : "Expected ptrvec to be a vector"
 @require @typekind(value) == VECTOR : "Expected value to be a vector"
 @require @assignable_to(&&value[0], $typeof(ptrvec[0])) : "Pointer and value must match"
 @require value.len == mask.len : "Mask and value must have the same length"
 @require mask.len == ptrvec.len : "Mask and ptrvec must have the same length"
 @require @constant_is_power_of_2($alignment) : "The alignment must be a power of two"
*>
macro @scatter_aligned(ptrvec, value, bool[<*>] mask, usz $alignment)
```

---

#### `@unaligned_load`

```c3
<*
 @param #x : "The variable or dereferenced pointer to load."
 @param $alignment : "The alignment to assume for the load"
 @return "The value of the variable"
 @require @constant_is_power_of_2($alignment) : "The alignment must be a power of two"
 @require $defined(&#x) : "This must be a variable or dereferenced pointer"
*>
macro @unaligned_load(#x, usz $alignment) @builtin
```

---

#### `@unaligned_store`

```c3
<*
 @param #x : "The variable or dereferenced pointer to store to."
 @param value : "The value to store."
 @param $alignment : "The alignment to assume for the store"
 @return "The value stored"
 @require $defined(&#x) : "This must be a variable or dereferenced pointer"
 @require $defined(#x = value) : "The value doesn't match the variable"
 @require @constant_is_power_of_2($alignment) : "The alignment must be a power of two"
*>
macro @unaligned_store(#x, value, usz $alignment) @builtin
```

---

#### `@volatile_load`

```c3
<*
 @param #x : "The variable or dereferenced pointer to load."
 @return "The value of the variable"
 @require $defined(&#x) : "This must be a variable or dereferenced pointer"
*>
macro @volatile_load(#x) @builtin
```

---

#### `@volatile_store`

```c3
<*
 @param #x : "The variable or dereferenced pointer to store to."
 @param value : "The value to store."
 @return "The value stored"
 @require $defined(&#x) : "This must be a variable or dereferenced pointer"
 @require $defined(#x = value) : "The value doesn't match the variable"
*>
macro @volatile_store(#x, value) @builtin
```

---

#### `AtomicOrdering`

```c3
enum AtomicOrdering : int
```

---

#### `@atomic_load`

```c3
<*
 @param #x : "the variable or dereferenced pointer to load."
 @param $ordering : "atomic ordering of the load, defaults to SEQ_CONSISTENT"
 @param $volatile : "whether the load should be volatile, defaults to 'false'"
 @return "returns the value of x"
 @require $defined(&#x) : "This must be a variable or dereferenced pointer"
 @require $ordering != AtomicOrdering.RELEASE : "Release ordering is not valid for load."
 @require $ordering != AtomicOrdering.ACQUIRE_RELEASE : "Acquire release is not valid for load."
 @require types::may_load_atomic($typeof(#x)) : "Only integer, float and pointers may be used."
*>
macro @atomic_load(#x, AtomicOrdering $ordering = SEQ_CONSISTENT, $volatile = false) @builtin
```

---

#### `@atomic_store`

```c3
<*
 @param #x : "the variable or dereferenced pointer to store to."
 @param value : "the value to store."
 @param $ordering : "the atomic ordering of the store, defaults to SEQ_CONSISTENT"
 @param $volatile : "whether the store should be volatile, defaults to 'false'"
 @require $ordering != AtomicOrdering.ACQUIRE : "Acquire ordering is not valid for store."
 @require $ordering != AtomicOrdering.ACQUIRE_RELEASE : "Acquire release is not valid for store."
 @require types::may_load_atomic($typeof(#x)) : "Only integer, float and pointers may be used."
 @require $defined(&#x) : "This must be a variable or dereferenced pointer"
 @require $defined(#x = value) : "The value doesn't match the variable"
*>
macro void @atomic_store(#x, value, AtomicOrdering $ordering = SEQ_CONSISTENT, $volatile = false) @builtin
```

---

#### `compare_exchange`

```c3
<*
 @require $success != AtomicOrdering.NOT_ATOMIC && $success != AtomicOrdering.UNORDERED : "Acquire ordering is not valid."
 @require $failure != AtomicOrdering.RELEASE && $failure != AtomicOrdering.ACQUIRE_RELEASE : "Acquire release is not valid."
*>
macro compare_exchange(ptr, compare, value, AtomicOrdering $success = SEQ_CONSISTENT, AtomicOrdering $failure = SEQ_CONSISTENT, bool $volatile = true, bool $weak = false, usz $alignment = 0)
```

---

#### `compare_exchange_volatile`

```c3
<*
 @require $success != AtomicOrdering.NOT_ATOMIC && $success != AtomicOrdering.UNORDERED : "Acquire ordering is not valid."
 @require $failure != AtomicOrdering.RELEASE && $failure != AtomicOrdering.ACQUIRE_RELEASE : "Acquire release is not valid."
*>
macro compare_exchange_volatile(ptr, compare, value, AtomicOrdering $success = SEQ_CONSISTENT, AtomicOrdering $failure = SEQ_CONSISTENT)
```

---

#### `aligned_offset`

```c3
<*
 @require math::is_power_of_2(alignment)
*>
fn usz aligned_offset(usz offset, usz alignment)
```

---

#### `aligned_pointer`

```c3
macro void* aligned_pointer(void* ptr, usz alignment)
```

---

#### `ptr_is_aligned`

```c3
<*
 @require math::is_power_of_2(alignment)
*>
fn bool ptr_is_aligned(void* ptr, usz alignment) @inline
```

---

#### `ptr_is_page_aligned`

```c3
fn bool ptr_is_page_aligned(void* ptr) @inline
```

---

#### `zero_volatile`

```c3
macro void zero_volatile(char[] data)
```

---

#### `clear`

```c3
macro void clear(void* dst, usz len, usz $dst_align = 0, bool $is_volatile = false)
```

---

#### `clear_inline`

```c3
macro void clear_inline(void* dst, usz $len, usz $dst_align = 0, bool $is_volatile = false)
```

---

#### `copy`

```c3
<*
 @param [&out] dst : "The destination to copy to"
 @param [in] src : "The source to copy from"
 @param len : "The number of bytes to copy"
 @param $dst_align : "the alignment of the destination if different from the default, 0 assumes the default"
 @param $src_align : "the alignment of the destination if different from the default, 0 assumes the default"
 @param $is_volatile : "True if this copy should be treated as volatile, i.e. it can't be optimized away."
 @require src != null || len == 0 : "Copying a null with non-zero length is invalid"
 @require len == 0 || dst + len <= src || src + len <= dst : "Ranges may not overlap"
*>
macro void copy(void* dst, void* src, usz len, usz $dst_align = 0, usz $src_align = 0, bool $is_volatile = false)
```

Copy memory from src to dst efficiently, assuming the memory ranges do not overlap.


---

#### `copy_inline`

```c3
<*
 @param [&out] dst : "The destination to copy to"
 @param [in] src : "The source to copy from"
 @param $len : "The number of bytes to copy"
 @param $dst_align : "the alignment of the destination if different from the default, 0 assumes the default"
 @param $src_align : "the alignment of the destination if different from the default, 0 assumes the default"
 @param $is_volatile : "True if this copy should be treated as volatile, i.e. it can't be optimized away."
 @require src != null || $len == 0 : "Copying a null with non-zero length is invalid"
 @require $len == 0 || dst + $len <= src || src + $len <= dst : "Ranges may not overlap"
*>
macro void copy_inline(void* dst, void* src, usz $len, usz $dst_align = 0, usz $src_align = 0, bool $is_volatile = false)
```

Copy memory from src to dst efficiently, assuming the memory ranges do not overlap, it
will always be inlined and never call memcopy


---

#### `move`

```c3
<*
 @param [&out] dst : "The destination to copy to"
 @param [in] src : "The source to copy from"
 @param len : "The number of bytes to copy"
 @param $dst_align : "the alignment of the destination if different from the default, 0 assumes the default"
 @param $src_align : "the alignment of the destination if different from the default, 0 assumes the default"
 @param $is_volatile : "True if this copy should be treated as volatile, i.e. it can't be optimized away."
 @require src != null || len == 0 : "Moving a null with non-zero length is invalid"
*>
macro void move(void* dst, void* src, usz len, usz $dst_align = 0, usz $src_align = 0, bool $is_volatile = false)
```

Copy memory from src to dst but correctly handle the possibility of overlapping ranges.


---

#### `set`

```c3
<*
 @param [&out] dst : "The destination to copy to"
 @param val : "The value to copy into memory"
 @param len : "The number of bytes to copy"
 @param $dst_align : "the alignment of the destination if different from the default, 0 assumes the default"
 @param $is_volatile : "True if this copy should be treated as volatile, i.e. it can't be optimized away."
 @ensure !len || (dst[0] == val && dst[len - 1] == val)
*>
macro void set(void* dst, char val, usz len, usz $dst_align = 0, bool $is_volatile = false)
```

Sets all memory in a region to that of the provided byte.


---

#### `set_inline`

```c3
<*
 @param [&out] dst : "The destination to copy to"
 @param val : "The value to copy into memory"
 @param $len : "The number of bytes to copy"
 @param $dst_align : "the alignment of the destination if different from the default, 0 assumes the default"
 @param $is_volatile : "True if this copy should be treated as volatile, i.e. it can't be optimized away."
 @ensure !$len || (dst[0] == val && dst[$len - 1] == val)
*>
macro void set_inline(void* dst, char val, usz $len, usz $dst_align = 0, bool $is_volatile = false)
```

Sets all memory in a region to that of the provided byte. Never calls OS memset.


---

#### `equals`

```c3
<*
 @require values::@inner_kind(a) == TypeKind.SLICE || values::@inner_kind(a) == TypeKind.POINTER
 @require values::@inner_kind(b) == TypeKind.SLICE || values::@inner_kind(b) == TypeKind.POINTER
 @require values::@inner_kind(a) != TypeKind.SLICE || len == -1
 @require values::@inner_kind(a) != TypeKind.POINTER || len > -1
 @require values::@assign_to(a, b) && values::@assign_to(b, a)
*>
macro bool equals(a, b, isz len = -1, usz $align = 0)
```

Test if n elements are equal in a slice, pointed to by a pointer etc.


---

#### `type_alloc_must_be_aligned`

```c3
<*
 @return `true if the alignment of the type exceeds DEFAULT_MEM_ALIGNMENT.`
*>
macro bool type_alloc_must_be_aligned($Type)
```

Check if an allocation must be aligned given the type.


---

#### `@scoped`

```c3
macro void @scoped(Allocator allocator; @body())
```

Run with a specific allocator inside of the macro body.


---

#### `@report_heap_allocs_in_scope`

```c3
<*
 @param $enabled : "Set to false to disable tracking"
*>
macro void @report_heap_allocs_in_scope($enabled = true; @body())
```

Run the tracking allocator in the scope, then
print out stats.


---

#### `@assert_leak`

```c3
<*
 @param $report : "Set to false to disable memory report"
*>
macro void @assert_leak($report = true; @body()) @builtin
```

Assert on memory leak in the scope of the macro body.


---

#### `@stack_mem`

```c3
<*
 @param $size : `the size of the buffer`
*>
macro void @stack_mem(usz $size; @body(Allocator mem)) @builtin
```

Allocate [size] bytes on the stack to use for allocation,
with the heap allocator as the backing allocator.

Release everything on scope exit.


---

#### `@stack_pool`

```c3
macro void @stack_pool(usz $size; @body) @builtin
```

---

#### `temp_push`

```c3
fn PoolState temp_push()
```

Push the current temp allocator. A push must always be balanced with a pop using the current state.


---

#### `temp_pop`

```c3
fn void temp_pop(PoolState old_state)
```

Pop the current temp allocator. A pop must always be balanced with a push.


---

#### `@pool_init`

```c3
<*
 @require pool_size >= 64
 @require realloc_size >= 64
 @require allocator.type != TempAllocator.typeid : "You may not create a temp allocator with a TempAllocator as the backing allocator."
 @require min_size > TempAllocator.sizeof + 64 : "Min size must meaningfully hold the data + some bytes"
*>
macro void @pool_init(Allocator allocator, usz pool_size,
	usz reserve_size = allocator::temp_allocator_reserve_size,
	usz min_size = allocator::temp_allocator_min_size,
	usz realloc_size = allocator::temp_allocator_realloc_size; @body) @builtin
```

---

#### `@pool`

```c3
<*
 @param reserve : "The amount of bytes to reserve for out-of-order allocations, 0 gives the default."
*>
macro void @pool(usz reserve = 0; @body) @builtin
```

Create a new temporary allocator.

The `reserve` parameter allows you to determine how many bytes should be reserved for
allocations on the current temporary allocator, if allocations are made inside of the pool scope.
It is made available for optimization, and can usually be ignored.


---

#### `get_tracking_env`

```c3
macro TrackingEnv* get_tracking_env()
```

---

#### `@clone`

```c3
<*
 @param value : "The value to clone"
 @return "A pointer to the cloned value"
 @require $alignof(value) <= mem::DEFAULT_MEM_ALIGNMENT : "Types with alignment exceeding the default must use 'clone_aligned' instead"
*>
macro @clone(value) @builtin @nodiscard
```

---

#### `@clone_aligned`

```c3
<*
 @param value : "The value to clone"
 @return "A pointer to the cloned value, which must be released using free_aligned"
*>
macro @clone_aligned(value) @builtin @nodiscard
```

---

#### `@tclone`

```c3
<*
 @param value : "The value to clone"
 @return "A pointer to the cloned value"
*>
macro @tclone(value) @builtin @nodiscard
```

---

#### `malloc`

```c3
fn void* malloc(usz size) @builtin @inline @nodiscard
```

---

#### `malloc_aligned`

```c3
fn void* malloc_aligned(usz size, usz alignment) @builtin @inline @nodiscard
```

Allocate using an aligned allocation. This is necessary for types with a default memory alignment
exceeding DEFAULT_MEM_ALIGNMENT. IMPORTANT! It must be freed using free_aligned.


---

#### `tmalloc`

```c3
fn void* tmalloc(usz size, usz alignment = 0) @builtin @inline @nodiscard
```

---

#### `new`

```c3
<*
 @require $vacount < 2 : "Too many arguments."
 @require $vacount == 0 ||| @assignable_to($vaexpr[0], $Type) : "The second argument must be an initializer for the type"
 @require $Type.alignof <= DEFAULT_MEM_ALIGNMENT : "Types with alignment exceeding the default must use 'alloc_aligned' instead"
*>
macro new($Type, ...) @nodiscard
```

---

#### `new_with_padding`

```c3
<*
 @require $vacount < 2 : "Too many arguments."
 @require $vacount == 0 ||| @assignable_to($vaexpr[0], $Type) : "The second argument must be an initializer for the type"
 @require $Type.alignof <= DEFAULT_MEM_ALIGNMENT : "Types with alignment exceeding the default must use 'alloc_aligned' instead"
*>
macro new_with_padding($Type, usz padding, ...) @nodiscard
```

---

#### `new_aligned`

```c3
<*
 @require $vacount < 2 : "Too many arguments."
 @require $vacount == 0 ||| @assignable_to($vaexpr[0], $Type) : "The second argument must be an initializer for the type"
*>
macro new_aligned($Type, ...) @nodiscard
```

Allocate using an aligned allocation. This is necessary for types with a default memory alignment
exceeding DEFAULT_MEM_ALIGNMENT. IMPORTANT! It must be freed using free_aligned.


---

#### `alloc`

```c3
<*
 @require $Type.alignof <= DEFAULT_MEM_ALIGNMENT : "Types with alignment exceeding the default must use 'alloc_aligned' instead"
*>
macro alloc($Type) @nodiscard
```

---

#### `alloc_with_padding`

```c3
<*
 @require $Type.alignof <= DEFAULT_MEM_ALIGNMENT : "Types with alignment exceeding the default must use 'alloc_aligned' instead"
*>
macro alloc_with_padding($Type, usz padding) @nodiscard
```

---

#### `alloc_aligned`

```c3
macro alloc_aligned($Type) @nodiscard
```

Allocate using an aligned allocation. This is necessary for types with a default memory alignment
exceeding DEFAULT_MEM_ALIGNMENT. IMPORTANT! It must be freed using free_aligned.


---

#### `tnew`

```c3
<*
 @require $vacount < 2 : "Too many arguments."
 @require $vacount == 0 ||| @assignable_to($vaexpr[0], $Type) : "The second argument must be an initializer for the type"
*>
macro tnew($Type, ...) @nodiscard
```

---

#### `temp_with_padding`

```c3
<*
 @require $vacount < 2 : "Too many arguments."
 @require $vacount == 0 ||| @assignable_to($vaexpr[0], $Type) : "The second argument must be an initializer for the type"
*>
macro temp_with_padding($Type, usz padding, ...) @nodiscard
```

---

#### `talloc`

```c3
macro talloc($Type) @nodiscard
```

---

#### `talloc_with_padding`

```c3
macro talloc_with_padding($Type, usz padding) @nodiscard
```

---

#### `new_array`

```c3
<*
 @require $Type.alignof <= DEFAULT_MEM_ALIGNMENT : "Types with alignment exceeding the default must use 'new_array_aligned' instead"
*>
macro new_array($Type, usz elements) @nodiscard
```

---

#### `new_array_aligned`

```c3
macro new_array_aligned($Type, usz elements) @nodiscard
```

Allocate using an aligned allocation. This is necessary for types with a default memory alignment
exceeding DEFAULT_MEM_ALIGNMENT. IMPORTANT! It must be freed using free_aligned.


---

#### `alloc_array`

```c3
<*
 @require $Type.alignof <= DEFAULT_MEM_ALIGNMENT : "Types with alignment exceeding the default must use 'alloc_array_aligned' instead"
*>
macro alloc_array($Type, usz elements) @nodiscard
```

---

#### `alloc_array_aligned`

```c3
macro alloc_array_aligned($Type, usz elements) @nodiscard
```

Allocate using an aligned allocation. This is necessary for types with a default memory alignment
exceeding DEFAULT_MEM_ALIGNMENT. IMPORTANT! It must be freed using free_aligned.


---

#### `talloc_array`

```c3
macro talloc_array($Type, usz elements) @nodiscard
```

---

#### `temp_array`

```c3
macro temp_array($Type, usz elements) @nodiscard
```

---

#### `calloc`

```c3
fn void* calloc(usz size) @builtin @inline @nodiscard
```

---

#### `calloc_aligned`

```c3
fn void* calloc_aligned(usz size, usz alignment) @builtin @inline @nodiscard
```

Allocate using an aligned allocation. This is necessary for types with a default memory alignment
exceeding DEFAULT_MEM_ALIGNMENT. IMPORTANT! It must be freed using free_aligned.


---

#### `tcalloc`

```c3
fn void* tcalloc(usz size, usz alignment = 0) @builtin @inline @nodiscard
```

---

#### `realloc`

```c3
fn void* realloc(void *ptr, usz new_size) @builtin @inline @nodiscard
```

---

#### `realloc_aligned`

```c3
fn void* realloc_aligned(void *ptr, usz new_size, usz alignment) @builtin @inline @nodiscard
```

---

#### `free`

```c3
fn void free(void* ptr) @builtin @inline
```

---

#### `free_aligned`

```c3
fn void free_aligned(void* ptr) @builtin @inline
```

---

#### `trealloc`

```c3
fn void* trealloc(void* ptr, usz size, usz alignment = mem::DEFAULT_MEM_ALIGNMENT) @builtin @inline @nodiscard
```

---

#### `@unaligned_addr`

```c3
<*
 @require $defined(&#arg) : "It must be possible to take the address of the argument."
 @return "An 'UnalignedRef' with the proper type and alignment, with a pointer to argument"
*>
macro @unaligned_addr(#arg) @builtin
```

Takes the address of a possibly unaligned variable or member,
and offers safe access to that member, by constructing an UnalignedRef.

### `std::core::mem @if(WASM_NOLIBC)`

---

#### `initialize_wasm_mem`

```c3
fn void initialize_wasm_mem() @init(1024) @private
```
### `std::core::mem @if(env::NO_LIBC)`

---

#### `__memcmp`

```c3
fn CInt __memcmp(void* s1, void* s2, usz n) @weak @export("memcmp")
```

---

#### `__memset`

```c3
fn void* __memset(void* str, CInt c, usz n) @weak @export("memset")
```

---

#### `__memcpy`

```c3
fn void* __memcpy(void* dst, void* src, usz n) @weak @export("memcpy")
```
### `std::core::mem::alignment { Type, ALIGNMENT }`

---

#### `UnalignedRef`

```c3
typedef UnalignedRef = Type*
```

An UnalignedRef offers correctly aligned access to addresses that may be unaligned or overaligned.


---

#### `UnalignedRef.get`

```c3
macro Type UnalignedRef.get(self)
```

---

#### `UnalignedRef.set`

```c3
macro Type UnalignedRef.set(&self, Type val)
```
### `std::core::mem::allocator`

---

#### `ArenaAllocator`

```c3
struct ArenaAllocator (Allocator)
```

---

#### `ArenaAllocator.init`

```c3
<*
 @param [inout] data : "The memory to use for the arena."
*>
fn ArenaAllocator* ArenaAllocator.init(&self, char[] data)
```

Initialize a memory arena for use using the provided bytes.


---

#### `ArenaAllocator.clear`

```c3
fn void ArenaAllocator.clear(&self)
```

Reset the usage completely.


---

#### `wrap`

```c3
<*
 @param [inout] bytes : `The bytes to use, may be empty.`
 @return `An arena allocator using the bytes`
*>
macro ArenaAllocator* wrap(char[] bytes)
```

Given some memory, create an arena allocator on the stack for it.


---

#### `ArenaAllocator.mark`

```c3
<*
 @return `The value to pass to 'reset' in order to reset to the current use.`
*>
fn usz ArenaAllocator.mark(&self)
```

"Mark" the current state of the arena allocator by returning the use count.


---

#### `ArenaAllocator.reset`

```c3
<*
 @param mark : `The previous mark.`
 @require mark <= self.used : "Invalid mark - out of range"
*>
fn void ArenaAllocator.reset(&self, usz mark)
```

Reset to a previous mark.


---

#### `ArenaAllocator.release`

```c3
<*
 @require ptr != null
*>
fn void ArenaAllocator.release(&self, void* ptr, bool) @dynamic
```

Implements the Allocator interface method.


---

#### `ArenaAllocator.acquire`

```c3
<*
 @require !alignment || math::is_power_of_2(alignment)
 @require alignment <= mem::MAX_MEMORY_ALIGNMENT : `alignment too big`
 @require size > 0
 @return? mem::INVALID_ALLOC_SIZE, mem::OUT_OF_MEMORY
*>
fn void*? ArenaAllocator.acquire(&self, usz size, AllocInitType init_type, usz alignment) @dynamic
```

Implements the Allocator interface method.


---

#### `ArenaAllocator.resize`

```c3
<*
 @require !alignment || math::is_power_of_2(alignment)
 @require alignment <= mem::MAX_MEMORY_ALIGNMENT : `alignment too big`
 @require old_pointer != null
 @require size > 0
 @return? mem::INVALID_ALLOC_SIZE, mem::OUT_OF_MEMORY
*>
fn void*? ArenaAllocator.resize(&self, void *old_pointer, usz size, usz alignment) @dynamic
```

Implements the Allocator interface method.


---

#### `BackedArenaAllocator`

```c3
struct BackedArenaAllocator (Allocator)
```

The backed arena allocator provides an allocator that will allocate from a pre-allocated chunk of memory
provided by it's backing allocator. The allocator supports mark / reset operations, so it can be used
as a stack (push-pop) allocator. If the initial memory is used up, it will fall back to regular allocations,
that will be safely freed on `reset`.

While this allocator is similar to the dynamic arena, it supports multiple "save points", which the dynamic arena
doesn't.


---

#### `ExtraPage.pagesize`

```c3
macro usz ExtraPage.pagesize(&self)
```

---

#### `ExtraPage.is_aligned`

```c3
macro bool ExtraPage.is_aligned(&self)
```

---

#### `new_backed_allocator`

```c3
<*
 @require size >= 16
*>
fn BackedArenaAllocator*? new_backed_allocator(usz size, Allocator allocator)
```

---

#### `BackedArenaAllocator.destroy`

```c3
fn void BackedArenaAllocator.destroy(&self)
```

---

#### `BackedArenaAllocator.mark`

```c3
fn usz BackedArenaAllocator.mark(&self)
```

---

#### `BackedArenaAllocator.release`

```c3
fn void BackedArenaAllocator.release(&self, void* old_pointer, bool) @dynamic
```

---

#### `BackedArenaAllocator.reset`

```c3
fn void BackedArenaAllocator.reset(&self, usz mark)
```

---

#### `BackedArenaAllocator._free_page`

```c3
fn void? BackedArenaAllocator._free_page(&self, ExtraPage* page) @inline @local
```

---

#### `BackedArenaAllocator._realloc_page`

```c3
fn void*? BackedArenaAllocator._realloc_page(&self, ExtraPage* page, usz size, usz alignment) @inline @local
```

---

#### `BackedArenaAllocator.resize`

```c3
fn void*? BackedArenaAllocator.resize(&self, void* pointer, usz size, usz alignment) @dynamic
```

---

#### `BackedArenaAllocator.acquire`

```c3
<*
 @require size > 0
 @require !alignment || math::is_power_of_2(alignment)
 @require alignment <= mem::MAX_MEMORY_ALIGNMENT : `alignment too big`
*>
fn void*? BackedArenaAllocator.acquire(&self, usz size, AllocInitType init_type, usz alignment) @dynamic
```

---

#### `DynamicArenaAllocator`

```c3
struct DynamicArenaAllocator (Allocator)
```

The dynamic arena allocator is an arena allocator that can grow by adding additional arena "pages".
It only supports reset, at which point all pages except the first one is released to the backing
allocator.

If you want multiple save points, use the BackedArenaAllocator instead.

The advantage over the BackedArenaAllocator, is that when allocating beyond the first "page", it will
retain the characteristics of an arena allocator (allocating a large piece of memory then handing off
memory from that memory), wheras the BackedArenaAllocator will have heap allocator characteristics.


---

#### `DynamicArenaAllocator.init`

```c3
<*
 @param [&inout] allocator
 @require page_size >= 128
*>
fn void DynamicArenaAllocator.init(&self, Allocator allocator, usz page_size)
```

---

#### `DynamicArenaAllocator.free`

```c3
fn void DynamicArenaAllocator.free(&self)
```

---

#### `DynamicArenaAllocator.release`

```c3
<*
 @require ptr != null
 @require self.page != null  : `tried to free pointer on invalid allocator`
*>
fn void DynamicArenaAllocator.release(&self, void* ptr, bool) @dynamic
```

---

#### `DynamicArenaAllocator.resize`

```c3
<*
 @require size > 0 : `Resize doesn't support zeroing`
 @require old_pointer != null : `Resize doesn't handle null pointers`
 @require self.page != null  : `tried to realloc pointer on invalid allocator`
 @return? mem::INVALID_ALLOC_SIZE, mem::OUT_OF_MEMORY
*>
fn void*? DynamicArenaAllocator.resize(&self, void* old_pointer, usz size, usz alignment) @dynamic
```

---

#### `DynamicArenaAllocator.reset`

```c3
fn void DynamicArenaAllocator.reset(&self)
```

---

#### `DynamicArenaAllocator._alloc_new`

```c3
<*
 @require math::is_power_of_2(alignment)
 @require size > 0
 @return? mem::INVALID_ALLOC_SIZE, mem::OUT_OF_MEMORY
*>
fn void*? DynamicArenaAllocator._alloc_new(&self, usz size, usz alignment) @local
```

---

#### `DynamicArenaAllocator.acquire`

```c3
<*
 @require size > 0 : `acquire expects size > 0`
 @require !alignment || math::is_power_of_2(alignment)
 @return? mem::INVALID_ALLOC_SIZE, mem::OUT_OF_MEMORY
*>
fn void*? DynamicArenaAllocator.acquire(&self, usz size, AllocInitType init_type, usz alignment) @dynamic
```

---

#### `SimpleHeapAllocator`

```c3
struct SimpleHeapAllocator (Allocator)
```

The SimpleHeapAllocator implements a simple heap allocator on top of an allocator function.

It uses the given allocator function to allocate memory from some source, but never frees it.
This allocator is intended to be used in environments where there isn't any native libc malloc,
and it has to be emulated from a memory region, or wrapping linear memory as is the case for plain WASM.


---

#### `SimpleHeapAllocator.init`

```c3
<*
 @require allocator != null  : "An underlying memory provider must be given"
 @require !self.free_list : "The allocator may not be already initialized"
*>
fn void SimpleHeapAllocator.init(&self, MemoryAllocFn allocator)
```

---

#### `SimpleHeapAllocator.acquire`

```c3
fn void*? SimpleHeapAllocator.acquire(&self, usz size, AllocInitType init_type, usz alignment) @dynamic
```

---

#### `SimpleHeapAllocator.resize`

```c3
fn void*? SimpleHeapAllocator.resize(&self, void* old_pointer, usz size, usz alignment) @dynamic
```

---

#### `SimpleHeapAllocator.release`

```c3
fn void SimpleHeapAllocator.release(&self, void* old_pointer, bool aligned) @dynamic
```

---

#### `SimpleHeapAllocator._realloc`

```c3
<*
 @require old_pointer && bytes > 0
*>
fn void*? SimpleHeapAllocator._realloc(&self, void* old_pointer, usz bytes) @local
```

---

#### `SimpleHeapAllocator._calloc`

```c3
fn void*? SimpleHeapAllocator._calloc(&self, usz bytes) @local
```

---

#### `SimpleHeapAllocator._alloc`

```c3
fn void*? SimpleHeapAllocator._alloc(&self, usz bytes) @local
```

---

#### `SimpleHeapAllocator.add_block`

```c3
fn void? SimpleHeapAllocator.add_block(&self, usz aligned_bytes) @local
```

---

#### `SimpleHeapAllocator._free`

```c3
fn void SimpleHeapAllocator._free(&self, void* ptr) @local
```

---

#### `OnStackAllocator`

```c3
struct OnStackAllocator (Allocator)
```

The OnStackAllocator is similar to the ArenaAllocator: it allocates from a chunk of memory
given to it.

The difference is that when it runs out of memory it will go directly to its backing allocator
rather than failing.

It is utilized by the @stack_mem macro as an alternative to the temp allocator.


---

#### `OnStackAllocator.init`

```c3
<*
 @param [&inout] allocator
*>
fn void OnStackAllocator.init(&self, char[] data, Allocator allocator)
```

Initialize a memory arena for use using the provided bytes.


---

#### `OnStackAllocator.free`

```c3
fn void OnStackAllocator.free(&self)
```

---

#### `OnStackAllocatorHeader`

```c3
struct OnStackAllocatorHeader
```

---

#### `OnStackAllocator.release`

```c3
<*
 @require old_pointer != null
*>
fn void OnStackAllocator.release(&self, void* old_pointer, bool aligned) @dynamic
```

---

#### `allocation_in_stack_mem`

```c3
fn bool allocation_in_stack_mem(OnStackAllocator* a, void* ptr) @local
```

---

#### `on_stack_allocator_remove_chunk`

```c3
fn void on_stack_allocator_remove_chunk(OnStackAllocator* a, void* ptr) @local
```

---

#### `on_stack_allocator_find_chunk`

```c3
fn OnStackAllocatorExtraChunk* on_stack_allocator_find_chunk(OnStackAllocator* a, void* ptr) @local
```

---

#### `OnStackAllocator.resize`

```c3
<*
 @require size > 0
 @require old_pointer != null
 @require alignment <= mem::MAX_MEMORY_ALIGNMENT : `alignment too big`
*>
fn void*? OnStackAllocator.resize(&self, void* old_pointer, usz size, usz alignment) @dynamic
```

---

#### `OnStackAllocator.acquire`

```c3
<*
 @require alignment <= mem::MAX_MEMORY_ALIGNMENT : `alignment too big`
 @require size > 0
*>
fn void*? OnStackAllocator.acquire(&self, usz size, AllocInitType init_type, usz alignment) @dynamic
```

---

#### `MAX_BACKTRACE`

```c3
const MAX_BACKTRACE = 16
```

---

#### `Allocation`

```c3
struct Allocation
```

---

#### `AllocMap`

```c3
alias AllocMap = HashMap { uptr, Allocation }
```

---

#### `TrackingAllocator`

```c3
struct TrackingAllocator (Allocator)
```

---

#### `TrackingAllocator.init`

```c3
<*
 @param [&inout] allocator : "The allocator to track"
*>
fn void TrackingAllocator.init(&self, Allocator allocator)
```

Initialize a tracking allocator to wrap (and track) another allocator.


---

#### `TrackingAllocator.free`

```c3
fn void TrackingAllocator.free(&self)
```

Free this tracking allocator.


---

#### `TrackingAllocator.allocated`

```c3
<*
 @return "the total allocated memory not yet freed."
*>
fn usz TrackingAllocator.allocated(&self)
```

---

#### `TrackingAllocator.total_allocated`

```c3
<*
 @return "the total memory allocated (freed or not)."
*>
fn usz TrackingAllocator.total_allocated(&self)
```

---

#### `TrackingAllocator.total_allocation_count`

```c3
<*
 @return "the total number of allocations (freed or not)."
*>
fn usz TrackingAllocator.total_allocation_count(&self)
```

---

#### `TrackingAllocator.allocations_tlist`

```c3
fn Allocation[] TrackingAllocator.allocations_tlist(&self, Allocator allocator)
```

---

#### `TrackingAllocator.allocation_count`

```c3
<*
 @return "the number of non-freed allocations."
*>
fn usz TrackingAllocator.allocation_count(&self)
```

---

#### `TrackingAllocator.acquire`

```c3
fn void*? TrackingAllocator.acquire(&self, usz size, AllocInitType init_type, usz alignment) @dynamic
```

---

#### `TrackingAllocator.resize`

```c3
fn void*? TrackingAllocator.resize(&self, void* old_pointer, usz size, usz alignment) @dynamic
```

---

#### `TrackingAllocator.release`

```c3
fn void TrackingAllocator.release(&self, void* old_pointer, bool is_aligned) @dynamic
```

---

#### `TrackingAllocator.clear`

```c3
fn void TrackingAllocator.clear(&self)
```

---

#### `TrackingAllocator.has_leaks`

```c3
fn bool TrackingAllocator.has_leaks(&self)
```

---

#### `TrackingAllocator.print_report`

```c3
fn void TrackingAllocator.print_report(&self)
```

---

#### `TrackingAllocator.fprint_report`

```c3
fn void? TrackingAllocator.fprint_report(&self, OutStream out)
```

---

#### `DEFAULT_SIZE_PREFIX`

```c3
const DEFAULT_SIZE_PREFIX = usz.sizeof
```

---

#### `DEFAULT_SIZE_PREFIX_ALIGNMENT`

```c3
const DEFAULT_SIZE_PREFIX_ALIGNMENT = usz.alignof
```

---

#### `TrackingEnv`

```c3
struct TrackingEnv
```

---

#### `AllocInitType`

```c3
enum AllocInitType
```

---

#### `MemoryAllocFn`

```c3
alias MemoryAllocFn = fn char[]?(usz)
```

---

#### `alignment_for_allocation`

```c3
fn usz alignment_for_allocation(usz alignment) @inline
```

---

#### `malloc`

```c3
macro void* malloc(Allocator allocator, usz size) @nodiscard
```

---

#### `malloc_try`

```c3
macro void*? malloc_try(Allocator allocator, usz size) @nodiscard
```

---

#### `calloc`

```c3
macro void* calloc(Allocator allocator, usz size) @nodiscard
```

---

#### `calloc_try`

```c3
macro void*? calloc_try(Allocator allocator, usz size) @nodiscard
```

---

#### `realloc`

```c3
macro void* realloc(Allocator allocator, void* ptr, usz new_size) @nodiscard
```

---

#### `realloc_try`

```c3
macro void*? realloc_try(Allocator allocator, void* ptr, usz new_size) @nodiscard
```

---

#### `free`

```c3
macro void free(Allocator allocator, void* ptr)
```

---

#### `malloc_aligned`

```c3
macro void*? malloc_aligned(Allocator allocator, usz size, usz alignment) @nodiscard
```

---

#### `calloc_aligned`

```c3
macro void*? calloc_aligned(Allocator allocator, usz size, usz alignment) @nodiscard
```

---

#### `realloc_aligned`

```c3
macro void*? realloc_aligned(Allocator allocator, void* ptr, usz new_size, usz alignment) @nodiscard
```

---

#### `free_aligned`

```c3
macro void free_aligned(Allocator allocator, void* ptr)
```

---

#### `new`

```c3
<*
 @require $Type.alignof <= mem::DEFAULT_MEM_ALIGNMENT : "Types with alignment exceeding the default must use 'new_aligned' instead"
 @require $vacount < 2 : "Too many arguments."
 @require $vacount == 0 ||| @assignable_to($vaexpr[0], $Type) : "The second argument must be an initializer for the type"
*>
macro new(Allocator allocator, $Type, ...) @nodiscard
```

---

#### `new_try`

```c3
<*
 @require $Type.alignof <= mem::DEFAULT_MEM_ALIGNMENT : "Types with alignment exceeding the default must use 'new_aligned' instead"
 @require $vacount < 2 : "Too many arguments."
 @require $vacount == 0 ||| @assignable_to($vaexpr[0], $Type) : "The second argument must be an initializer for the type"
*>
macro new_try(Allocator allocator, $Type, ...) @nodiscard
```

---

#### `new_aligned`

```c3
<*
 @require $vacount < 2 : "Too many arguments."
 @require $vacount == 0 ||| @assignable_to($vaexpr[0], $Type) : "The second argument must be an initializer for the type"
*>
macro new_aligned(Allocator allocator, $Type, ...) @nodiscard
```

Allocate using an aligned allocation. This is necessary for types with a default memory alignment
exceeding DEFAULT_MEM_ALIGNMENT. IMPORTANT! It must be freed using free_aligned.


---

#### `new_with_padding`

```c3
<*
 @require $Type.alignof <= mem::DEFAULT_MEM_ALIGNMENT
*>
macro new_with_padding(Allocator allocator, $Type, usz padding) @nodiscard
```

---

#### `alloc`

```c3
<*
 @require $Type.alignof <= mem::DEFAULT_MEM_ALIGNMENT : "Types with alignment exceeding the default must use 'alloc_aligned' instead"
*>
macro alloc(Allocator allocator, $Type) @nodiscard
```

---

#### `alloc_try`

```c3
<*
 @require $Type.alignof <= mem::DEFAULT_MEM_ALIGNMENT : "Types with alignment exceeding the default must use 'alloc_aligned' instead"
*>
macro alloc_try(Allocator allocator, $Type) @nodiscard
```

---

#### `alloc_aligned`

```c3
macro alloc_aligned(Allocator allocator, $Type) @nodiscard
```

Allocate using an aligned allocation. This is necessary for types with a default memory alignment
exceeding DEFAULT_MEM_ALIGNMENT. IMPORTANT! It must be freed using free_aligned.


---

#### `alloc_with_padding`

```c3
<*
 @require $Type.alignof <= mem::DEFAULT_MEM_ALIGNMENT
*>
macro alloc_with_padding(Allocator allocator, $Type, usz padding) @nodiscard
```

---

#### `new_array`

```c3
<*
 @require $Type.alignof <= mem::DEFAULT_MEM_ALIGNMENT : "Types with alignment exceeding the default must use 'new_array_aligned' instead"
*>
macro new_array(Allocator allocator, $Type, usz elements) @nodiscard
```

---

#### `new_array_try`

```c3
<*
 @require $Type.alignof <= mem::DEFAULT_MEM_ALIGNMENT : "Types with alignment exceeding the default must use 'new_array_aligned' instead"
*>
macro new_array_try(Allocator allocator, $Type, usz elements) @nodiscard
```

---

#### `new_array_aligned`

```c3
macro new_array_aligned(Allocator allocator, $Type, usz elements) @nodiscard
```

Allocate using an aligned allocation. This is necessary for types with a default memory alignment
exceeding DEFAULT_MEM_ALIGNMENT. IMPORTANT! It must be freed using free_aligned.


---

#### `alloc_array`

```c3
<*
 @require $Type.alignof <= mem::DEFAULT_MEM_ALIGNMENT : "Types with alignment exceeding the default must use 'alloc_array_aligned' instead"
*>
macro alloc_array(Allocator allocator, $Type, usz elements) @nodiscard
```

---

#### `alloc_array_aligned`

```c3
macro alloc_array_aligned(Allocator allocator, $Type, usz elements) @nodiscard
```

Allocate using an aligned allocation. This is necessary for types with a default memory alignment
exceeding DEFAULT_MEM_ALIGNMENT. IMPORTANT! It must be freed using free_aligned.


---

#### `alloc_array_try`

```c3
<*
 @require $Type.alignof <= mem::DEFAULT_MEM_ALIGNMENT : "Types with alignment exceeding the default must use 'alloc_array_aligned' instead"
*>
macro alloc_array_try(Allocator allocator, $Type, usz elements) @nodiscard
```

---

#### `clone`

```c3
<*
 @param [&inout] allocator : "The allocator to use to clone"
 @param value : "The value to clone"
 @return "A pointer to the cloned value"
 @require $alignof(value) <= mem::DEFAULT_MEM_ALIGNMENT : "Types with alignment exceeding the default must use 'clone_aligned' instead"
*>
macro clone(Allocator allocator, value) @nodiscard
```

Clone a value.


---

#### `clone_aligned`

```c3
<*
 @param [&inout] allocator : "The allocator to use to clone"
 @param value : "The value to clone"
 @return "A pointer to the cloned value"
*>
macro clone_aligned(Allocator allocator, value) @nodiscard
```

Clone overaligned values. Must be released using free_aligned.


---

#### `clone_any`

```c3
fn any clone_any(Allocator allocator, any value) @nodiscard
```

---

#### `@aligned_alloc`

```c3
<*
 @require bytes > 0
 @require alignment > 0
 @require bytes <= isz.max
*>
macro void*? @aligned_alloc(#alloc_fn, usz bytes, usz alignment)
```

---

#### `AlignedBlock`

```c3
struct AlignedBlock
```

---

#### `@aligned_free`

```c3
macro void? @aligned_free(#free_fn, void* old_pointer)
```

---

#### `@aligned_realloc`

```c3
<*
 @require bytes > 0
 @require alignment > 0
*>
macro void*? @aligned_realloc(#calloc_fn, #free_fn, void* old_pointer, usz bytes, usz alignment)
```

---

#### `mem`

```c3
alias mem @builtin = thread_allocator
```

---

#### `PoolState`

```c3
typedef PoolState = TempAllocator*
```

---

#### `push_pool`

```c3
fn PoolState push_pool(usz reserve = 0)
```

---

#### `pop_pool`

```c3
fn void pop_pool(PoolState old)
```

---

#### `base_allocator`

```c3
macro Allocator base_allocator() @private
```

---

#### `temp_allocator_size`

```c3
macro usz temp_allocator_size() @local
```

---

#### `temp_allocator_default_min_size`

```c3
macro usz temp_allocator_default_min_size() @local
```

---

#### `temp_allocator_default_reserve_size`

```c3
macro usz temp_allocator_default_reserve_size() @local
```

---

#### `heap`

```c3
macro Allocator heap() @deprecated("Use 'mem' instead.")
```

---

#### `create_temp_allocator_on_demand`

```c3
<*
 @require !top_temp : "This should never be called when temp already exists"
*>
fn Allocator create_temp_allocator_on_demand() @private
```

---

#### `create_temp_allocator`

```c3
<*
 @require !top_temp : "This should never be called when temp already exists"
*>
fn Allocator create_temp_allocator(Allocator allocator, usz size, usz reserve, usz min_size, usz realloc_size) @private
```

---

#### `temp`

```c3
macro Allocator temp() @deprecated("Use 'tmem' instead")
```

---

#### `tmem`

```c3
alias tmem @builtin = current_temp
```

---

#### `allow_implicit_temp_allocator_on_load_thread`

```c3
fn void allow_implicit_temp_allocator_on_load_thread() @init(1) @local @if(env::LIBC || env::WASM_NOLIBC)
```

---

#### `destroy_temp_allocators_after_exit`

```c3
fn void destroy_temp_allocators_after_exit() @finalizer(65535) @local @if(env::LIBC)
```

---

#### `destroy_temp_allocators`

```c3
fn void destroy_temp_allocators()
```

Call this to destroy any memory used by the temp allocators. This will invalidate all temp memory.


---

#### `LazyTempAllocator.acquire`

```c3
fn void*? LazyTempAllocator.acquire(&self, usz bytes, AllocInitType init_type, usz alignment) @dynamic
```

---

#### `LazyTempAllocator.resize`

```c3
fn void*? LazyTempAllocator.resize(&self, void* old_ptr, usz new_bytes, usz alignment) @dynamic
```

---

#### `LazyTempAllocator.release`

```c3
fn void LazyTempAllocator.release(&self, void* old_ptr, bool aligned) @dynamic
```

---

#### `NULL_ALLOCATOR`

```c3
const NullAllocator NULL_ALLOCATOR = {}
```

---

#### `NullAllocator`

```c3
typedef NullAllocator (Allocator) = uptr
```

---

#### `NullAllocator.acquire`

```c3
fn void*? NullAllocator.acquire(&self, usz bytes, AllocInitType init_type, usz alignment) @dynamic
```

---

#### `NullAllocator.resize`

```c3
fn void*? NullAllocator.resize(&self, void* old_ptr, usz new_bytes, usz alignment) @dynamic
```

---

#### `NullAllocator.release`

```c3
fn void NullAllocator.release(&self, void* old_ptr, bool aligned) @dynamic
```

---

#### `WASM_BLOCK_SIZE`

```c3
const usz WASM_BLOCK_SIZE = 65536
```

---

#### `WasmMemory`

```c3
struct WasmMemory
```

---

#### `WasmMemory.allocate_block`

```c3
fn char[]? WasmMemory.allocate_block(&self, usz bytes)
```
### `std::core::mem::allocator @if(!(env::POSIX || env::WIN32) || !$feature(VMEM_TEMP))`

---

#### `TempAllocator`

```c3
struct TempAllocator (Allocator)
```

---

#### `TempAllocatorPage`

```c3
struct TempAllocatorPage
```

---

#### `TempAllocatorPage.pagesize`

```c3
macro usz TempAllocatorPage.pagesize(&self)
```

---

#### `TempAllocatorPage.is_aligned`

```c3
macro bool TempAllocatorPage.is_aligned(&self)
```

---

#### `new_temp_allocator`

```c3
<*
 @require size >= 64
 @require realloc_size >= 64
 @require allocator.type != TempAllocator.typeid : "You may not create a temp allocator with a TempAllocator as the backing allocator."
 @require min_size > TempAllocator.sizeof + 64 : "Min size must meaningfully hold the data + some bytes"
*>
fn TempAllocator*? new_temp_allocator(Allocator allocator, usz size, usz reserve = temp_allocator_reserve_size, usz min_size = temp_allocator_min_size, usz realloc_size = temp_allocator_realloc_size)
```

---

#### `TempAllocator.derive_allocator`

```c3
<*
 @require !self.derived
*>
fn TempAllocator*? TempAllocator.derive_allocator(&self, usz reserve = 0)
```

---

#### `TempAllocator.reset`

```c3
fn void TempAllocator.reset(&self)
```

Reset the entire temp allocator, which will merge all the children into it.


---

#### `TempAllocator.free`

```c3
<*
 @require self.allocated : "Only a top level allocator should be freed."
*>
fn void TempAllocator.free(&self)
```

---

#### `TempAllocator.destroy`

```c3
fn void TempAllocator.destroy(&self) @local
```

---

#### `TempAllocator.release`

```c3
fn void TempAllocator.release(&self, void* old_pointer, bool) @dynamic
```

---

#### `TempAllocator._free_page`

```c3
fn void? TempAllocator._free_page(&self, TempAllocatorPage* page) @inline @local
```

---

#### `TempAllocator._realloc_page`

```c3
fn void*? TempAllocator._realloc_page(&self, TempAllocatorPage* page, usz size, usz alignment) @inline @local
```

---

#### `TempAllocator.resize`

```c3
fn void*? TempAllocator.resize(&self, void* pointer, usz size, usz alignment) @dynamic
```

---

#### `TempAllocator.acquire`

```c3
<*
 @require size > 0
 @require !alignment || math::is_power_of_2(alignment)
 @require alignment <= mem::MAX_MEMORY_ALIGNMENT : `alignment too big`
*>
fn void*? TempAllocator.acquire(&self, usz size, AllocInitType init_type, usz alignment) @dynamic
```
### `std::core::mem::allocator @if(!env::WIN32 && !env::POSIX && env::LIBC)`

---

#### `LibcAllocator.acquire`

```c3
fn void*? LibcAllocator.acquire(&self, usz bytes, AllocInitType init_type, usz alignment) @dynamic
```

---

#### `LibcAllocator.resize`

```c3
fn void*? LibcAllocator.resize(&self, void* old_ptr, usz new_bytes, usz alignment) @dynamic
```

---

#### `LibcAllocator.release`

```c3
fn void LibcAllocator.release(&self, void* old_ptr, bool aligned) @dynamic
```
### `std::core::mem::allocator @if((env::POSIX || env::WIN32) && $feature(VMEM_TEMP))`

---

#### `new_temp_allocator`

```c3
fn TempAllocator*? new_temp_allocator(Allocator allocator, usz size, usz reserve = temp_allocator_reserve_size, usz min_size = temp_allocator_min_size, usz realloc_size = temp_allocator_realloc_size)
```

---

#### `TempAllocator`

```c3
struct TempAllocator (Allocator)
```

---

#### `TempAllocator.acquire`

```c3
<*
 @require size > 0
 @require !alignment || math::is_power_of_2(alignment)
 @require alignment <= mem::MAX_MEMORY_ALIGNMENT : `alignment too big`
*>
fn void*? TempAllocator.acquire(&self, usz size, AllocInitType init_type, usz alignment) @dynamic
```

---

#### `TempAllocator.derive_allocator`

```c3
fn TempAllocator*? TempAllocator.derive_allocator(&self, usz reserve = 0)
```

---

#### `TempAllocator.reset`

```c3
fn void TempAllocator.reset(&self)
```

Reset the entire temp allocator, destroying all children


---

#### `TempAllocator.free`

```c3
fn void TempAllocator.free(&self)
```

---

#### `TempAllocator.destroy`

```c3
fn void TempAllocator.destroy(&self) @local
```

---

#### `TempAllocator.resize`

```c3
fn void*? TempAllocator.resize(&self, void* pointer, usz size, usz alignment) @dynamic
```

---

#### `TempAllocator.release`

```c3
fn void TempAllocator.release(&self, void* old_pointer, bool b) @dynamic
```
### `std::core::mem::allocator @if(env::LIBC)`

---

#### `LibcAllocator`

```c3
typedef LibcAllocator (Allocator) = uptr
```

The LibcAllocator is a wrapper around malloc to conform to the Allocator interface.


---

#### `LIBC_ALLOCATOR`

```c3
const LibcAllocator LIBC_ALLOCATOR = {}
```
### `std::core::mem::allocator @if(env::POSIX || env::WIN32)`

---

#### `VMEM_RESERVE_FAILED`

```c3
faultdef VMEM_RESERVE_FAILED
```

---

#### `Vmem`

```c3
struct Vmem (Allocator)
```

---

#### `VmemOptions`

```c3
bitstruct VmemOptions : int
```

---

#### `Vmem.init`

```c3
<*
 @require !reserve_page_size || math::is_power_of_2(reserve_page_size)
 @require reserve_page_size <= preferred_size : "The min reserve_page_size size must be less or equal to the preferred size"
 @require preferred_size >= 1 * mem::KB : "The preferred size must exceed 1 KB"
 @return? mem::INVALID_ALLOC_SIZE, mem::OUT_OF_MEMORY, VMEM_RESERVE_FAILED
*>
fn void? Vmem.init(&self, usz preferred_size, usz reserve_page_size = 0, VmemOptions options = { true, true, env::COMPILER_SAFE_MODE }, usz min_size = 0)
```

Implements the Allocator interface method.


---

#### `Vmem.acquire`

```c3
<*
 @require !alignment || math::is_power_of_2(alignment)
 @require alignment <= mem::MAX_MEMORY_ALIGNMENT : `alignment too big`
 @require size > 0
 @return? mem::INVALID_ALLOC_SIZE, mem::OUT_OF_MEMORY
*>
fn void*? Vmem.acquire(&self, usz size, AllocInitType init_type, usz alignment) @dynamic
```

Implements the Allocator interface method.


---

#### `Vmem.owns_pointer`

```c3
fn bool Vmem.owns_pointer(&self, void* ptr) @inline
```

---

#### `Vmem.resize`

```c3
<*
 @require !alignment || math::is_power_of_2(alignment)
 @require alignment <= mem::MAX_MEMORY_ALIGNMENT : `alignment too big`
 @require old_pointer != null
 @require size > 0
 @return? mem::INVALID_ALLOC_SIZE, mem::OUT_OF_MEMORY
*>
fn void*? Vmem.resize(&self, void *old_pointer, usz size, usz alignment) @dynamic
```

Implements the Allocator interface method.


---

#### `Vmem.release`

```c3
<*
 @require ptr != null
*>
fn void Vmem.release(&self, void* ptr, bool) @dynamic
```

Implements the Allocator interface method.


---

#### `Vmem.mark`

```c3
fn usz Vmem.mark(&self)
```

---

#### `Vmem.reset`

```c3
<*
 @require mark <= self.allocated : "Invalid mark"
*>
fn void Vmem.reset(&self, usz mark)
```

---

#### `Vmem.free`

```c3
fn void Vmem.free(&self)
```

---

#### `protect`

```c3
macro void? protect(Vmem* mem, usz after) @local
```

---

#### `unprotect`

```c3
macro void unprotect(Vmem* mem, usz after) @local
```
### `std::core::mem::allocator @if(env::POSIX)`

---

#### `LibcAllocator.acquire`

```c3
fn void*? LibcAllocator.acquire(&self, usz bytes, AllocInitType init_type, usz alignment) @dynamic
```

---

#### `LibcAllocator.resize`

```c3
fn void*? LibcAllocator.resize(&self, void* old_ptr, usz new_bytes, usz alignment) @dynamic
```

---

#### `LibcAllocator.release`

```c3
fn void LibcAllocator.release(&self, void* old_ptr, bool aligned) @dynamic
```
### `std::core::mem::allocator @if(env::WIN32)`

---

#### `LibcAllocator.acquire`

```c3
fn void*? LibcAllocator.acquire(&self, usz bytes, AllocInitType init_type, usz alignment) @dynamic
```

---

#### `LibcAllocator.resize`

```c3
fn void*? LibcAllocator.resize(&self, void* old_ptr, usz new_bytes, usz alignment) @dynamic
```

---

#### `LibcAllocator.release`

```c3
fn void LibcAllocator.release(&self, void* old_ptr, bool aligned) @dynamic
```
### `std::core::mem::mempool`

---

#### `INITIAL_CAPACITY`

```c3
const INITIAL_CAPACITY = 0
```

---

#### `FixedBlockPoolNode`

```c3
struct FixedBlockPoolNode
```

---

#### `FixedBlockPoolEntry`

```c3
struct FixedBlockPoolEntry
```

---

#### `FixedBlockPool`

```c3
struct FixedBlockPool
```

Fixed blocks pool pre-allocating blocks backed by an Allocator which are then reserved for the user,
blocks deallocated by the user are later re-used by future blocks allocations

`grow_capacity` can be changed in order to affect how many blocks will be allocated by next pool allocation,
it has to be greater than 0
`allocated` number of allocated blocks
`used` number of used blocks by the user


---

#### `FixedBlockPool.init`

```c3
<*
 @param [in] allocator : "The allocator to use"
 @param block_size : "The block size to use"
 @param capacity : "The amount of blocks to be pre-allocated"
 @param alignment : "The alignment of the buffer"
 @require !alignment || math::is_power_of_2(alignment)
 @require !self.initialized : "The block pool must not be initialized"
 @require block_size > 0 : "Block size must be non zero"
 @require calculate_actual_capacity(capacity, block_size) * block_size >= block_size
    : "Total memory would overflow"
*>
macro FixedBlockPool* FixedBlockPool.init(&self, Allocator allocator, usz block_size, usz capacity = INITIAL_CAPACITY, usz alignment = 0)
```

Initialize an block pool


---

#### `FixedBlockPool.init_for_type`

```c3
<*
 @param [in] allocator : "The allocator to use"
 @param $Type : "The type used for setting the block size"
 @param capacity : "The amount of blocks to be pre-allocated"
 @require !self.initialized : "The block pool must not be initialized"
*>
macro FixedBlockPool* FixedBlockPool.init_for_type(&self, Allocator allocator, $Type, usz capacity = INITIAL_CAPACITY)
```

Initialize an block pool


---

#### `FixedBlockPool.tinit_for_type`

```c3
<*
 @param $Type : "The type used for setting the block size"
 @param capacity : "The amount of blocks to be pre-allocated"
 @require !self.initialized : "The block pool must not be initialized"
*>
macro FixedBlockPool* FixedBlockPool.tinit_for_type(&self, $Type, usz capacity = INITIAL_CAPACITY)
```

Initialize an block pool using Temporary allocator


---

#### `FixedBlockPool.tinit`

```c3
<*
 @param block_size : "The block size to use"
 @param capacity : "The amount of blocks to be pre-allocated"
 @require !self.initialized : "The block pool must not be initialized"
*>
macro FixedBlockPool* FixedBlockPool.tinit(&self, usz block_size, usz capacity = INITIAL_CAPACITY)
```

Initialize an block pool using Temporary allocator


---

#### `FixedBlockPool.free`

```c3
<*
 @require self.initialized : "The block pool must be initialized"
*>
fn void FixedBlockPool.free(&self)
```

Free up the entire block pool


---

#### `FixedBlockPool.alloc`

```c3
<*
 @require self.initialized : "The block pool must be initialized"
*>
fn void* FixedBlockPool.alloc(&self)
```

Allocate an block on the block pool, re-uses previously deallocated blocks


---

#### `FixedBlockPool.dealloc`

```c3
<*
 @require self.initialized : "The block pool must be initialized"
 @require self.check_ptr(ptr) : "The pointer should be part of the pool"
*>
fn void FixedBlockPool.dealloc(&self, void* ptr)
```

Deallocate a block from the block pool


---

#### `FixedBlockPool.check_ptr`

```c3
<*
 @require self.initialized : "The block pool must be initialized"
*>
fn bool FixedBlockPool.check_ptr(&self, void *ptr) @local
```

---

#### `FixedBlockPool.new_node`

```c3
<*
 @require self.grow_capacity > 0 : "How many blocks will it store"
*>
fn void FixedBlockPool.new_node(&self) @local
```

---

#### `FixedBlockPool.allocate_page`

```c3
macro void* FixedBlockPool.allocate_page(&self) @private
```

---

#### `FixedBlockPool.free_page`

```c3
macro void FixedBlockPool.free_page(&self, void* page) @private
```

---

#### `calculate_actual_capacity`

```c3
macro usz calculate_actual_capacity(usz capacity, usz block_size) @private
```
### `std::core::mem::rc`

---

#### `RefCounted`

```c3
struct RefCounted
```

A RefCounted struct should be an inline base of a struct.
If a `dealloc` is defined, then it will be called rather than `free`

For convenience, a ref count of 0 is still valid, and the struct is
only freed when when ref count drops to -1.

The macros rc::retain and rc::release must be used on the full pointer,
not on the RefCounted substruct.

So `Foo* f = ...; RefCounted* rc = f; rc::release(rc);` will not do the right thing.


---

#### `retain`

```c3
<*
 @require @assignable_to(refcounted, RefCounted*) : "Expected a ref counted value"
*>
macro retain(refcounted)
```

---

#### `release`

```c3
<*
 @require @assignable_to(refcounted, RefCounted*) : "Expected a ref counted value"
 @require !$defined(refcounted.dealloc()) ||| @typeis(refcounted.dealloc(), void)
   : "Expected refcounted type to have a valid dealloc"
*>
macro void release(refcounted)
```
### `std::core::mem::ref { Type }`

---

#### `DeallocFn`

```c3
alias DeallocFn = fn void(void*)
```

---

#### `wrap`

```c3
fn Ref wrap(Type* ptr, Allocator allocator = mem)
```

---

#### `new`

```c3
<*
 @require $vacount < 2 : "Too many arguments."
 @require $vacount == 0 ||| @assignable_to($vaexpr[0], Type) : "The first argument must be an initializer for the type"
*>
macro Ref new(..., Allocator allocator = mem)
```

---

#### `Ref`

```c3
struct Ref
```

---

#### `Ref.retain`

```c3
fn Ref* Ref.retain(&self)
```

---

#### `Ref.release`

```c3
fn void Ref.release(&self)
```
### `std::core::mem::vm`

---

#### `VirtualMemory`

```c3
struct VirtualMemory
```

VirtualMemory is an abstraction for working with an allocated virtual memory area. It will invoke vm:: functions
but will perform more checks and track its size (required to unmap the memory on Posix)


---

#### `RANGE_OVERFLOW, UNKNOWN_ERROR, ACCESS_DENIED, UNMAPPED_ACCESS, UNALIGNED_ADDRESS, RELEASE_FAILED, UPDATE_FAILED, INVALID_ARGS`

```c3
faultdef RANGE_OVERFLOW, UNKNOWN_ERROR, ACCESS_DENIED, UNMAPPED_ACCESS, UNALIGNED_ADDRESS, RELEASE_FAILED, UPDATE_FAILED, INVALID_ARGS
```

---

#### `VirtualMemoryAccess`

```c3
enum VirtualMemoryAccess
```

---

#### `aligned_alloc_size`

```c3
fn usz aligned_alloc_size(usz size)
```

---

#### `alloc`

```c3
<*
 @param size : "The size of the memory to allocate, will be rounded up"
 @param access : "The initial access permissions."
 @return? mem::OUT_OF_MEMORY, RANGE_OVERFLOW, UNKNOWN_ERROR, ACCESS_DENIED, INVALID_ARGS
 @return "Pointer to the allocated memory, page aligned"
*>
fn void*? alloc(usz size, VirtualMemoryAccess access)
```

Allocate virtual memory, size is rounded up to platform granularity (Win32) / page size (Posix).


---

#### `release`

```c3
<*
 @param [&inout] ptr : "Pointer to page to release, should be allocated using vm::alloc"
 @param size : "The size of the allocated pointer"
 @require mem::ptr_is_page_aligned(ptr) : "The pointer should be page aligned"
*>
fn void? release(void* ptr, usz size)
```

Release memory allocated with "alloc".


---

#### `protect`

```c3
<*
 @param [&inout] ptr : "Pointer to page to update, must be page aligned"
 @param len : "To what len to update, must be page aligned"
 @param access : "The new access"
 @require mem::ptr_is_page_aligned(ptr) : "The pointer should be page aligned"
 @require mem::ptr_is_page_aligned(ptr + len) : "The length must be page aligned"
 @return? ACCESS_DENIED, UNALIGNED_ADDRESS, RANGE_OVERFLOW, UPDATE_FAILED, UNMAPPED_ACCESS, INVALID_ARGS
*>
fn void? protect(void* ptr, usz len, VirtualMemoryAccess access)
```

Change the access protection of a region in memory. The region must be page aligned.


---

#### `commit`

```c3
<*
 @param [&inout] ptr : "Pointer to page to update, must be page aligned"
 @param len : "To what len to commit, must be page aligned"
 @require mem::ptr_is_page_aligned(ptr) : "The pointer should be page aligned"
 @require mem::ptr_is_page_aligned(ptr + len) : "The length must be page aligned"
 @return? UNKNOWN_ERROR, mem::OUT_OF_MEMORY, ACCESS_DENIED, UNALIGNED_ADDRESS, RANGE_OVERFLOW, UPDATE_FAILED, UNMAPPED_ACCESS, INVALID_ARGS
*>
fn void? commit(void* ptr, usz len, VirtualMemoryAccess access = READWRITE)
```

Makes a region of memory available that was previously retrieved using 'alloc'. This is necessary on Win32,
but optional on Posix.


---

#### `decommit`

```c3
<*
 @param [&inout] ptr : "Pointer to page to update, must be page aligned"
 @param len : "To what len to commit, must be page aligned"
 @param block : "Set the released memory to protected"
 @require mem::ptr_is_page_aligned(ptr) : "The pointer should be page aligned"
 @require mem::ptr_is_page_aligned(ptr + len) : "The length must be page aligned"
 @return? ACCESS_DENIED, UNALIGNED_ADDRESS, RANGE_OVERFLOW, UPDATE_FAILED, UNMAPPED_ACCESS, INVALID_ARGS
*>
fn void? decommit(void* ptr, usz len, bool block = true)
```

Notifies that the memory in the region can be released back to the OS. On Win32 this decommits the region,
whereas on Posix it tells the system that it may be reused using madvise. The "block" parameter is only
respected on Posix, and protects the region from read/write/exec. On Win32 this always happens.


---

#### `mmap_file`

```c3
<*
 @param fd : "File descriptor"
 @param size : "Number of bytes to map, will be rounded up to page size"
 @param offset : "Byte offset in file, must be page size aligned"
 @param access : "The initial access permissions"
 @param shared : "if True then MAP_SHARED else MAP_PRIVATE"
 @return? mem::OUT_OF_MEMORY, RANGE_OVERFLOW, UNKNOWN_ERROR, ACCESS_DENIED, INVALID_ARGS, io::NO_PERMISSION, io::FILE_NOT_VALID, io::WOULD_BLOCK, io::FILE_NOT_FOUND
 @return "Pointer to the mapped region"
*>
fn void*? mmap_file(Fd fd, usz size, usz offset = 0, VirtualMemoryAccess access = READ, bool shared = false) @if
```

Map a portion of an already-opened file into memory.


---

#### `virtual_alloc`

```c3
<*
 @param size : "The size of the memory to allocate."
 @require size > 0 : "The size must be non-zero"
 @return? mem::OUT_OF_MEMORY, RANGE_OVERFLOW, UNKNOWN_ERROR, ACCESS_DENIED, INVALID_ARGS
*>
fn VirtualMemory? virtual_alloc(usz size, VirtualMemoryAccess access = PROTECTED)
```

Create a VirtualMemory using


---

#### `VirtualMemory.commit`

```c3
<*
 @param offset : "Starting from what offset to commit"
 @param len : "To what len to commit"
 @require mem::ptr_is_page_aligned(self.ptr + offset) : "The offset should be page aligned"
 @require mem::ptr_is_page_aligned(self.ptr + offset + len) : "The length must be page aligned"
 @require offset < self.size : "Offset out of range"
 @require offset + len <= self.size : "Length out of range"
 @return? UPDATE_FAILED, ACCESS_DENIED, UNALIGNED_ADDRESS, RANGE_OVERFLOW, UNKNOWN_ERROR
*>
macro void? VirtualMemory.commit(self, usz offset, usz len)
```

Commits memory, using vm::commit


---

#### `VirtualMemory.protect`

```c3
<*
 @param offset : "Starting from what offset to update"
 @param len : "To what len to update"
 @require mem::ptr_is_page_aligned(self.ptr + offset) : "The offset should be page aligned"
 @require mem::ptr_is_page_aligned(self.ptr + offset + len) : "The length must be page aligned"
 @require offset < self.size : "Offset out of range"
 @require offset + len < self.size : "Length out of range"
 @return? UPDATE_FAILED, ACCESS_DENIED, UNALIGNED_ADDRESS, RANGE_OVERFLOW, UNKNOWN_ERROR
*>
macro void? VirtualMemory.protect(self, usz offset, usz len, VirtualMemoryAccess access)
```

Changes protection of a part of memory using vm::protect


---

#### `VirtualMemory.decommit`

```c3
<*
 @param offset : "Starting from what offset to decommit"
 @param len : "To what len to decommit"
 @param block : "Should the memory be blocked from access after decommit"
 @require mem::ptr_is_page_aligned(self.ptr + offset) : "The offset should be page aligned"
 @require mem::ptr_is_page_aligned(self.ptr + offset + len) : "The length must be page aligned"
 @require offset < self.size : "Offset out of range"
 @require offset + len < self.size : "Length out of range"
 @return? UPDATE_FAILED
*>
fn void? VirtualMemory.decommit(self, usz offset, usz len, bool block = true)
```

Decommits a part of memory using vm::decommit


---

#### `VirtualMemory.destroy`

```c3
<*
 @require self.ptr != null : "Virtual memory must be initialized to call destroy"
*>
fn void? VirtualMemory.destroy(&self)
```

Releases the memory region


---

#### `VirtualMemoryAccess.to_posix`

```c3
fn CInt VirtualMemoryAccess.to_posix(self) @if(env::POSIX) @private
```

---

#### `VirtualMemoryAccess.to_win32`

```c3
fn Win32_Protect VirtualMemoryAccess.to_win32(self) @if(env::WIN32) @private
```
### `std::core::mem::volatile { Type }`

---

#### `Volatile`

```c3
typedef Volatile @structlike = Type
```

---

#### `Volatile.get`

```c3
macro Type Volatile.get(&self)
```

---

#### `Volatile.set`

```c3
macro Type Volatile.set(&self, Type val)
```
### `std::core::runtime`

---

#### `ReflectedParam`

```c3
struct ReflectedParam (Printable) @if(!$defined(ReflectedParam))
```

---

#### `AnyRaw`

```c3
struct AnyRaw
```

---

#### `SliceRaw`

```c3
struct SliceRaw
```

---

#### `@enum_lookup`

```c3
macro @enum_lookup($Type, #value, value)
```

---

#### `@enum_lookup_new`

```c3
macro @enum_lookup_new($Type, $name, value)
```

---

#### `BenchmarkFn`

```c3
alias BenchmarkFn = fn void ()
```

---

#### `benchmark_collection_create`

```c3
fn_iters @local;

struct BenchmarkUnit
{
	String name;
	BenchmarkFn func;
}

fn BenchmarkUnit[] benchmark_collection_create(Allocator allocator)
```

---

#### `DEFAULT_BENCHMARK_WARMUP_ITERATIONS`

```c3
const DEFAULT_BENCHMARK_WARMUP_ITERATIONS = 3
```

---

#### `DEFAULT_BENCHMARK_MAX_ITERATIONS`

```c3
const DEFAULT_BENCHMARK_MAX_ITERATIONS = 10000
```

---

#### `set_benchmark_warmup_iterations`

```c3
fn void set_benchmark_warmup_iterations(uint value) @builtin
```

---

#### `set_benchmark_max_iterations`

```c3
fn void set_benchmark_max_iterations(uint value) @builtin
```

---

#### `set_benchmark_func_iterations`

```c3
fn void set_benchmark_func_iterations(String func, uint value) @builtin
```

---

#### `@start_benchmark`

```c3
macro @start_benchmark()
```

---

#### `@end_benchmark`

```c3
macro @end_benchmark()
```

---

#### `@log_benchmark`

```c3
macro @log_benchmark(msg, args...)
```

---

#### `run_benchmarks`

```c3
fn bool run_benchmarks(BenchmarkUnit[] benchmarks)
```

---

#### `default_benchmark_runner`

```c3
fn bool default_benchmark_runner(String[] args)
```

---

#### `TestFn`

```c3
alias TestFn = fn void()
```

---

#### `TestContext`

```c3
struct TestContext
```

---

#### `TestUnit`

```c3
struct TestUnit
```

---

#### `test_collection_create`

```c3
fn TestUnit[] test_collection_create(Allocator allocator)
```

---

#### `cmp_test_unit`

```c3
fn int cmp_test_unit(TestUnit a, TestUnit b)
```

---

#### `terminal_has_ansi_codes`

```c3
fn bool terminal_has_ansi_codes() @local
```

---

#### `test_panic`

```c3
fn void test_panic(String message, String file, String function, uint line) @local
```

---

#### `mute_output`

```c3
fn void mute_output() @local
```

---

#### `unmute_output`

```c3
fn void unmute_output(bool has_error) @local
```

---

#### `run_tests`

```c3
fn bool run_tests(String[] args, TestUnit[] tests) @private
```

---

#### `default_test_runner`

```c3
fn bool default_test_runner(String[] args)
```
### `std::core::runtime @if(WASM_NOLIBC)`

---

#### `__wasm_call_ctors`

```c3
extern fn void __wasm_call_ctors()
```
### `std::core::sanitizer`

---

#### `annotate_contiguous_container`

```c3
macro void annotate_contiguous_container(void* beg, void* end, void* old_mid, void* new_mid)
```

---

#### `annotate_double_ended_contiguous_container`

```c3
macro void annotate_double_ended_contiguous_container(void* storage_beg, void* storage_end, void* old_container_beg, void* old_container_end, void* new_container_beg, void* new_container_end)
```

---

#### `print_stack_trace`

```c3
macro void print_stack_trace()
```

---

#### `set_death_callback`

```c3
fn void set_death_callback(VoidFn callback)
```
### `std::core::sanitizer @if (env::ANY_SANITIZER)`

---

#### `__Sanitizer_sandbox_arguments`

```c3
struct __Sanitizer_sandbox_arguments
```

---

#### `__sanitizer_set_report_path`

```c3
extern fn void __sanitizer_set_report_path(ZString path)
```
### `std::core::sanitizer::asan`

---

#### `ErrorCallback`

```c3
alias ErrorCallback = fn void (ZString)
```

---

#### `poison_memory_region`

```c3
<*
 @param addr : "Start of memory region."
 @param size : "Size of memory region."
*>
macro poison_memory_region(void* addr, usz size)
```

Marks a memory region ([addr, addr+size)) as unaddressable.

This memory must be previously allocated by your program. Instrumented
code is forbidden from accessing addresses in this region until it is
unpoisoned. This function is not guaranteed to poison the entire region -
it could poison only a subregion of [addr, addr+size) due to ASan
alignment restrictions.

NOTE This function is not thread-safe because no two threads can poison or
unpoison memory in the same memory region simultaneously.


---

#### `unpoison_memory_region`

```c3
<*
 @param addr : "Start of memory region."
 @param size : "Size of memory region."
*>
macro unpoison_memory_region(void* addr, usz size)
```

Marks a memory region ([addr, addr+size)) as addressable.

This memory must be previously allocated by your program. Accessing
addresses in this region is allowed until this region is poisoned again.
This function could unpoison a super-region of [addr, addr+size) due
to ASan alignment restrictions.

NOTE This function is not thread-safe because no two threads can
poison or unpoison memory in the same memory region simultaneously.


---

#### `address_is_poisoned`

```c3
<*
 @return "True if 'addr' is poisoned (that is, 1-byte read/write access to this address would result in an error report from ASan). Otherwise returns false."
 @param addr : "Address to check."
*>
macro bool address_is_poisoned(void* addr)
```

Checks if an address is poisoned.


---

#### `region_is_poisoned`

```c3
<*
 @param beg : "Start of memory region."
 @param size : "Start of memory region."
 @return "Address of first poisoned byte."
*>
macro void* region_is_poisoned(void* beg, usz size)
```

Checks if a region is poisoned.

If at least one byte in [beg, beg+size) is poisoned, returns the
address of the first such byte. Otherwise returns 0.


---

#### `set_error_report_callback`

```c3
fn void set_error_report_callback(ErrorCallback callback)
```

Sets the callback function to be called during ASan error reporting.

### `std::core::sanitizer::asan @if(env::ADDRESS_SANITIZER)`

---

#### `__asan_poison_memory_region`

```c3
extern fn void __asan_poison_memory_region(void* addr, usz size)
```
### `std::core::sanitizer::tsan`

---

#### `MutexFlags`

```c3
typedef MutexFlags = inline CUInt
```

---

#### `MUTEX_LINKER_INIT`

```c3
const MutexFlags MUTEX_LINKER_INIT      = 1 << 0
```

---

#### `MUTEX_WRITE_REENTRANT`

```c3
const MutexFlags MUTEX_WRITE_REENTRANT  = 1 << 1
```

---

#### `MUTEX_READ_REENTRANT`

```c3
const MutexFlags MUTEX_READ_REENTRANT   = 1 << 2
```

---

#### `MUTEX_NOT_STATIC`

```c3
const MutexFlags MUTEX_NOT_STATIC       = 1 << 8
```

---

#### `MUTEX_READ_LOCK`

```c3
const MutexFlags MUTEX_READ_LOCK        = 1 << 3
```

---

#### `MUTEX_TRY_LOCK`

```c3
const MutexFlags MUTEX_TRY_LOCK         = 1 << 4
```

---

#### `MUTEX_TRY_LOCK_FAILED`

```c3
const MutexFlags MUTEX_TRY_LOCK_FAILED  = 1 << 5
```

---

#### `MUTEX_RECURSIVE_LOCK`

```c3
const MutexFlags MUTEX_RECURSIVE_LOCK   = 1 << 6
```

---

#### `MUTEX_RECURSIVE_UNLOCK`

```c3
const MutexFlags MUTEX_RECURSIVE_UNLOCK = 1 << 7
```

---

#### `MUTEX_TRY_READ_LOCK`

```c3
const MutexFlags MUTEX_TRY_READ_LOCK = MUTEX_READ_LOCK | MUTEX_TRY_LOCK
```

---

#### `MUTEX_TRY_READ_LOCK_FAILED`

```c3
const MutexFlags MUTEX_TRY_READ_LOCK_FAILED = MUTEX_TRY_READ_LOCK | MUTEX_TRY_LOCK_FAILED
```

---

#### `mutex_create`

```c3
macro void mutex_create(void* addr, MutexFlags flags)
```

---

#### `mutex_destroy`

```c3
macro void mutex_destroy(void* addr, MutexFlags flags)
```

---

#### `mutex_pre_lock`

```c3
macro void mutex_pre_lock(void* addr, MutexFlags flags)
```

---

#### `mutex_post_lock`

```c3
macro void mutex_post_lock(void* addr, MutexFlags flags, CInt recursion)
```

---

#### `mutex_pre_unlock`

```c3
macro CInt mutex_pre_unlock(void* addr, MutexFlags flags)
```

---

#### `mutex_post_unlock`

```c3
macro void mutex_post_unlock(void* addr, MutexFlags flags)
```

---

#### `mutex_pre_signal`

```c3
macro void mutex_pre_signal(void* addr, MutexFlags flags)
```

---

#### `mutex_post_signal`

```c3
macro void mutex_post_signal(void* addr, MutexFlags flags)
```

---

#### `mutex_pre_divert`

```c3
macro void mutex_pre_divert(void* addr, MutexFlags flags)
```

---

#### `mutex_post_divert`

```c3
macro void mutex_post_divert(void* addr, MutexFlags flags)
```
### `std::core::string`

---

#### `String`

```c3
typedef String @if(!$defined(String)) = inline char[]
```

---

#### `ZString`

```c3
typedef ZString = inline char*
```

ZString is a pointer to a zero terminated array of chars.

Use ZString when you need to interop with C zero terminated strings.


---

#### `WString`

```c3
typedef WString = inline Char16*
```

WString is a pointer to a zero terminated array of Char16.

Depending on the platform, this may or may not correspond to wchar_t.
For Windows, wchar_t is generally 16 bits, on MacOS it is 32 bits.
However, for both MacOS and Linux, regular C strings (ZString)
will be UTF-8 encoded, so there is no need to use the wchar_t versions
of functions outside of encoding functions.


---

#### `Char`

```c3
alias Char32 = uint
```

Char32 is a UTF32 codepoint

```c3
alias Char16 = ushort
```

Char16 is a UTF16 "character"


---

#### `INVALID_UTF8, INVALID_UTF16, CONVERSION_FAILED,     EMPTY_STRING, NEGATIVE_VALUE, MALFORMED_INTEGER,     INTEGER_OVERFLOW, MALFORMED_FLOAT, FLOAT_OUT_OF_RANGE`

```c3
faultdef INVALID_UTF8, INVALID_UTF16, CONVERSION_FAILED,
         EMPTY_STRING, NEGATIVE_VALUE, MALFORMED_INTEGER,
         INTEGER_OVERFLOW, MALFORMED_FLOAT, FLOAT_OUT_OF_RANGE
```

Common faults used with strings


---

#### `@wstring32`

```c3
<*
 @param $string : "The string to encode"
*>
macro Char32* @wstring32(String $string) @builtin
```

Create a pointer to an UTF32 encoded string at compile time.


---

#### `@char32`

```c3
<*
 @param $string : "The string to encode"
*>
macro Char32[] @char32(String $string) @builtin
```

Create a slice of an UTF32 encoded string at compile time.


---

#### `@wstring`

```c3
<*
 @param $string : "The string to encode"
*>
macro WString @wstring(String $string) @builtin
```

Create a WString (an UTF16 encoded string) at compile time.


---

#### `@char16`

```c3
<*
 @param $string : "The string to encode"
*>
macro Char16[] @char16(String $string) @builtin
```

Create a slice of an UTF32 encoded string at compile time.


---

#### `@sprintf`

```c3
macro String @sprintf(String $format, ...) @builtin @const
```

---

#### `tformat_zstr`

```c3
<*
 @param [in] fmt : `The formatting string`
*>
fn ZString tformat_zstr(String fmt, args...) @format(0)
```

Return a temporary ZString created using the formatting function.


---

#### `format`

```c3
<*
 @param [inout] allocator : `The allocator to use`
 @param [in] fmt : `The formatting string`
*>
fn String format(Allocator allocator, String fmt, args...) @format(1)
```

Return a new String created using the formatting function.


---

#### `bformat`

```c3
<*
 @param [inout] buffer : `The buffer to use`
 @param [in] fmt : `The formatting string`
*>
fn String bformat(char[] buffer, String fmt, args...) @format(1)
```

Return a new String created using the formatting function.


---

#### `tformat`

```c3
<*
 @param [in] fmt : `The formatting string`
*>
fn String tformat(String fmt, args...) @format(0)
```

Return a temporary String created using the formatting function.


---

#### `char_in_set`

```c3
<*
 @param c : `the character to check`
 @param [in] set : `The formatting string`
 @pure
 @return `True if a character is in the set`
*>
macro bool char_in_set(char c, String set)
```

Check if a character is in a set.


---

#### `join`

```c3
fn String join(Allocator allocator, String[] s, String joiner)
```

---

#### `String.replace`

```c3
<*
 @param [in] self
 @param [in] needle : `The string to be replaced`
 @param [in] new_str : `The replacement string`
 @param [&inout] allocator : `The allocator to use for the String`
 @return "The new string with the elements replaced"
*>
fn String String.replace(self, Allocator allocator, String needle, String new_str) @nodiscard
```

Replace all instances of one substring with a different string.


---

#### `String.treplace`

```c3
<*
 @param [in] self
 @param [in] needle : `The string to be replaced`
 @param [in] new_str : `The replacement string`
 @return "The new string with the elements replaced"
*>
fn String String.treplace(self, String needle, String new_str)
```

Replace all instances of one substring with a different string, allocating the new string on the temp allocator.


---

#### `String.trim`

```c3
<*
 @param [in] self : `The string to trim`
 @param [in] to_trim : `The set of characters to trim, defaults to whitespace`
 @pure
 @return `a substring of the string passed in`
*>
fn String String.trim(self, String to_trim = "\t\n\r ")
```

Remove characters from the front and end of a string.


---

#### `String.trim_left`

```c3
<*
 @param [in] self : `The string to trim`
 @param [in] to_trim : `The set of characters to trim, defaults to whitespace`
 @pure
 @return `a substring of the string passed in`
*>
fn String String.trim_left(self, String to_trim = "\t\n\r ")
```

Remove characters from the front of a string.


---

#### `String.trim_right`

```c3
<*
 @param [in] self : `The string to trim`
 @param [in] to_trim : `The set of characters to trim, defaults to whitespace`
 @pure
 @return `a substring of the string passed in`
*>
fn String String.trim_right(self, String to_trim = "\t\n\r ")
```

Remove characters from the end of a string.


---

#### `String.starts_with`

```c3
<*
 @param [in] self
 @param [in] prefix
 @pure
 @return `'true' if the string starts with the prefix`
*>
fn bool String.starts_with(self, String prefix)
```

Check if the String starts with the prefix.


---

#### `String.ends_with`

```c3
<*
 @param [in] self
 @param [in] suffix
 @pure
 @return `'true' if the string ends with the suffix`
*>
fn bool String.ends_with(self, String suffix)
```

Check if the String ends with the suffix.


---

#### `String.strip`

```c3
<*
 @param [in] self
 @param [in] prefix
 @pure
 @return `the substring with the prefix removed`
*>
fn String String.strip(self, String prefix)
```

Strip the front of the string if the prefix exists.


---

#### `String.strip_end`

```c3
<*
 @param [in] self
 @param [in] suffix
 @pure
 @return `the substring with the suffix removed`
*>
fn String String.strip_end(self, String suffix)
```

Strip the end of the string if the suffix exists.


---

#### `String.split`

```c3
<*
 @param [in] self
 @param [in] delimiter
 @param max : "Max number of elements, 0 means no limit, defaults to 0"
 @param skip_empty : "True to skip empty elements"
 @param [&inout] allocator : "The allocator to use for the String[]"
 @require delimiter.len > 0 : "The delimiter must be at least 1 character long"
 @ensure return.len > 0 || skip_empty
*>
fn String[] String.split(self, Allocator allocator, String delimiter, usz max = 0, bool skip_empty = false)
```

Split a string into parts, e.g "a|b|c" split with "|" yields { "a", "b", "c" }


---

#### `String.tsplit`

```c3
<*
 @param [in] s
 @param [in] delimiter
 @param max : "Max number of elements, 0 means no limit, defaults to 0"
 @param skip_empty : "True to skip empty elements"
*>
fn String[] String.tsplit(s, String delimiter, usz max = 0, bool skip_empty = false)
```

This function is identical to String.split, but implicitly uses the
temporary allocator.


---

#### `BUFFER_EXCEEDED`

```c3
faultdef BUFFER_EXCEEDED
```

---

#### `String.split_to_buffer`

```c3
<*
 @param [in] s
 @param [in] delimiter
 @param [inout] buffer
 @param max : "Max number of elements, 0 means no limit, defaults to 0"
 @require delimiter.len > 0 : "The delimiter must be at least 1 character long"
 @ensure return.len > 0 || skip_empty
 @return? BUFFER_EXCEEDED : `If there are more elements than would fit the buffer`
*>
fn String[]? String.split_to_buffer(s, String delimiter, String[] buffer, usz max = 0, bool skip_empty = false)
```

Split a string into parts, e.g "a|b|c" split with "|" yields { "a", "b", "c" }


---

#### `String.contains`

```c3
<*
 @param [in] s
 @param [in] substr : "The string to look for."
 @pure
 @return "true if the string contains the substring, false otherwise"
*>
fn bool String.contains(s, String substr)
```

Check if a substring is found in the string.


---

#### `String.count`

```c3
<*
 @param [in] self : "The string to search"
 @param [in] substr : "The string to look for."
 @pure
 @return "The number of times matched"
*>
fn usz String.count(self, String substr)
```

Check how many non-overlapping instances of a substring there is.

If the substring has zero length, the number of matches is zero.


---

#### `String.index_of_char`

```c3
<*
 @param [in] self
 @param character : "The character to look for"
 @pure
 @ensure return < self.len
 @return "the index of the character"
 @return? NOT_FOUND : "if the character cannot be found"
*>
fn usz? String.index_of_char(self, char character)
```

Find the index of the first incidence of a string.


---

#### `String.index_of_chars`

```c3
<*
 @param [in] self
 @param [in] characters : "The characters to look for"
 @pure
 @ensure return < self.len
 @return "the index of the character"
 @return? NOT_FOUND : "if the character cannot be found"
*>
fn usz? String.index_of_chars(String self, char[] characters)
```

Find the index of the first incidence of a one of the chars.


---

#### `String.index_of_char_from`

```c3
<*
 @param [in] self
 @param character : "The character to look for"
 @param start_index : "The index to start with, may exceed max index."
 @pure
 @ensure return < self.len
 @return "the index of the character"
 @return? NOT_FOUND : "if the character cannot be found starting from the start_index"
*>
fn usz? String.index_of_char_from(self, char character, usz start_index)
```

Find the index of the first incidence of a character.


---

#### `String.rindex_of_char`

```c3
<*
 @param [in] self
 @param character : "the character to find"
 @pure
 @ensure return < self.len
 @return "the index of the character"
 @return? NOT_FOUND : "if the character cannot be found"
*>
fn usz? String.rindex_of_char(self, char character)
```

Find the index of the first incidence of a character starting from the end.


---

#### `String.index_of`

```c3
<*
 @param [in] self
 @param [in] substr
 @pure
 @ensure return < self.len
 @require substr.len > 0 : "The string must be len 1 or more"
 @return "the index of the substring"
 @return? NOT_FOUND : "if the substring cannot be found"
*>
fn usz? String.index_of(self, String substr)
```

Find the index of the first incidence of a string.


---

#### `String.rindex_of`

```c3
<*
 @param [in] self
 @param [in] substr
 @pure
 @ensure return < self.len
 @require substr.len > 0 : "The substring must be len 1 or more"
 @return "the index of the substring"
 @return? NOT_FOUND : "if the substring cannot be found"
*>
fn usz? String.rindex_of(self, String substr)
```

Find the index of the last incidence of a string.


---

#### `ZString.eq`

```c3
fn bool ZString.eq(self, ZString other) @operator(==)
```

---

#### `ZString.str_view`

```c3
fn String ZString.str_view(self)
```

---

#### `ZString.char_len`

```c3
fn usz ZString.char_len(str)
```

---

#### `ZString.len`

```c3
fn usz ZString.len(self)
```

---

#### `WString.len`

```c3
fn usz WString.len(self)
```

---

#### `String.zstr_copy`

```c3
fn ZString String.zstr_copy(self, Allocator allocator)
```

---

#### `String.concat`

```c3
fn String String.concat(self, Allocator allocator, String s2)
```

---

#### `String.tconcat`

```c3
fn String String.tconcat(self, String s2)
```

---

#### `String.zstr_tcopy`

```c3
fn ZString String.zstr_tcopy(self)
```

---

#### `String.copy`

```c3
fn String String.copy(self, Allocator allocator)
```

Copy this string, by duplicating the string, always adding a zero byte
sentinel, so that it safely can be converted to a ZString by a
cast.


---

#### `String.free`

```c3
fn void String.free(&self, Allocator allocator)
```

---

#### `String.tcopy`

```c3
fn String String.tcopy(self)
```

---

#### `ZString.copy`

```c3
fn String ZString.copy(self, Allocator allocator)
```

---

#### `ZString.tcopy`

```c3
fn String ZString.tcopy(self)
```

---

#### `String.to_utf16`

```c3
<*
 @return "The UTF-16 string as a slice, allocated using the given allocator"
 @return? INVALID_UTF8 : "If the string contained an invalid UTF-8 sequence"
*>
fn Char16[]? String.to_utf16(self, Allocator allocator)
```

Convert an UTF-8 string to UTF-16


---

#### `String.to_temp_utf16`

```c3
fn Char16[]? String.to_temp_utf16(self)
```

---

#### `String.to_wstring`

```c3
fn WString? String.to_wstring(self, Allocator allocator)
```

---

#### `String.to_temp_wstring`

```c3
fn WString? String.to_temp_wstring(self)
```

---

#### `String.to_utf32`

```c3
fn Char32[]? String.to_utf32(self, Allocator allocator)
```

---

#### `String.to_temp_utf32`

```c3
fn Char32[]? String.to_temp_utf32(self)
```

---

#### `String.convert_to_lower`

```c3
<*
 @param [inout] self
 @pure
*>
fn void String.convert_to_lower(self)
```

Convert a string to ASCII lower case in place.


---

#### `String.to_lower_copy`

```c3
fn String String.to_lower_copy(self, Allocator allocator)
```

---

#### `String.to_lower_tcopy`

```c3
fn String String.to_lower_tcopy(self)
```

---

#### `String.convert_to_upper`

```c3
<*
 @param [inout] self
 @pure
*>
fn void String.convert_to_upper(self)
```

Convert a string to ASCII upper case.


---

#### `String.to_upper_copy`

```c3
<*
 @param [in] self
 @param [inout] allocator
 @return `a new String converted to ASCII upper case.`
*>
fn String String.to_upper_copy(self, Allocator allocator)
```

Returns a string converted to ASCII upper case.


---

#### `String.capitalize_copy`

```c3
fn String String.capitalize_copy(self, Allocator allocator)
```

---

#### `String.snake_to_pascal_copy`

```c3
<*
 @param [in] self
 @return `"FooBar" from "foo_bar" the resulting pointer may safely be cast to ZString.`
*>
fn String String.snake_to_pascal_copy(self, Allocator allocator)
```

Convert a string from `snake_case` to PascalCase.


---

#### `String.convert_snake_to_pascal`

```c3
<*
 @param [inout] self
*>
fn void String.convert_snake_to_pascal(&self)
```

Movifies the current string from `snake_case` to PascalCase.


---

#### `String.pascal_to_snake_copy`

```c3
<*
 @param [in] self
 @return `"foo_bar" from "FooBar" the resulting pointer may safely be cast to ZString.`
*>
fn String String.pascal_to_snake_copy(self, Allocator allocator)
```

Convert a string from `PascalCase` to `snake_case`.


---

#### `String.iterator`

```c3
fn StringIterator String.iterator(self)
```

---

#### `String.to_upper_tcopy`

```c3
<*
 @param [in] self
 @return `a temporary String converted to ASCII upper case.`
*>
fn String String.to_upper_tcopy(self)
```

---

#### `from_utf32`

```c3
fn String? from_utf32(Allocator allocator, Char32[] utf32)
```

---

#### `from_utf16`

```c3
fn String? from_utf16(Allocator allocator, Char16[] utf16)
```

---

#### `from_wstring`

```c3
fn String? from_wstring(Allocator allocator, WString wstring)
```

---

#### `tfrom_wstring`

```c3
fn String? tfrom_wstring(WString wstring)
```

---

#### `tfrom_utf16`

```c3
fn String? tfrom_utf16(Char16[] utf16)
```

---

#### `String.utf8_codepoints`

```c3
fn usz String.utf8_codepoints(s)
```

---

#### `String.is_zstr`

```c3
fn bool String.is_zstr(self) @deprecated("Unsafe, use copy instead")
```

Determine whether the current string actually points to a ZString-like string.

This is done by looking at the byte one step after the end of the string. If this
is zero, it is considered zero terminated.

This function can safely be used with data pointing to null. However, it will not
work correctly if the pointer is invalid, for example it is already freed.


---

#### `String.quick_zstr`

```c3
<*
 @ensure return[self.len] == 0
*>
fn ZString String.quick_zstr(self) @deprecated("Unsafe, use zstr_tcopy instead")
```

Return a pointer to the string *iff* it is a pointer
to a zero terminated string, otherwise return a temp allocated zstring copy.

This function is suitable if you are converting strings to ZString on the temp
allocator, but suspect that the String might actually already point to zero
terminated data.

The function looks one step beyond the end of the slice to determine this,
which means that if that data is then modified after this call, this function
might behave incorrectly.

For this reason, try to ensure that the resulting ZString is immediately used.


---

#### `String.to_integer`

```c3
<*
 @param $Type : "The type to convert to"
 @param base : "The base to convert to"
 @require base > 0 && base <= 16 : "Unsupported base"
 @return? MALFORMED_INTEGER : "When the value has some illegal character"
 @return? INTEGER_OVERFLOW : "If the value does not fit in the given type"
 @return? EMPTY_STRING : "If the string was empty"
 @return? NEGATIVE_VALUE : "If the type was unsigned, and the value had a - prefix"
*>
macro String.to_integer(self, $Type, int base = 10)
```

Convert a number to a given base. If the base is not given, then
it will be inferred from the number if the string starts with 0x 0o or 0b and the
base is given as 10.

Furthermore it will skip any spaces before and after the number.


---

#### `String.to_int128`

```c3
fn int128? String.to_int128(self, int base = 10)
```

---

#### `String.to_long`

```c3
fn long? String.to_long(self, int base = 10)
```

---

#### `String.to_int`

```c3
fn int? String.to_int(self, int base = 10)
```

---

#### `String.to_short`

```c3
fn short? String.to_short(self, int base = 10)
```

---

#### `String.to_ichar`

```c3
fn ichar? String.to_ichar(self, int base = 10)
```

---

#### `String.to_uint128`

```c3
fn uint128? String.to_uint128(self, int base = 10)
```

---

#### `String.to_ulong`

```c3
fn ulong? String.to_ulong(self, int base = 10)
```

---

#### `String.to_uint`

```c3
fn uint? String.to_uint(self, int base = 10)
```

---

#### `String.to_ushort`

```c3
fn ushort? String.to_ushort(self, int base = 10)
```

---

#### `String.to_uchar`

```c3
fn char? String.to_uchar(self, int base = 10)
```

---

#### `String.to_double`

```c3
fn double? String.to_double(self)
```

---

#### `String.to_float`

```c3
fn float? String.to_float(self)
```

---

#### `String.tokenize`

```c3
<*
 @param [in] split : "The string to use for splitting"
 @return "A Splitter to track the state"
*>
fn Splitter String.tokenize(self, String split)
```

Create a Splitter to track tokenizing of a string. Tokenize will turn "foo:bar::baz" into
"foo", "bar" and "baz", if you want the empty string to be present, use `tokenize_all`
instead.


---

#### `String.tokenize_all`

```c3
<*
 @param [in] split : "The string to use for splitting"
 @param skip_last : "Set to true to not include the last empty token if present (default: false)"
 @return "A Splitter to track the state"
*>
fn Splitter String.tokenize_all(self, String split, bool skip_last = false)
```

Create a Splitter to track tokenizing of a string. Tokenize will turn "foo:bar::baz" into
"foo", "bar" and "baz", if you want the empty string to be present, use `tokenize_all`
instead.


---

#### `String.splitter`

```c3
fn Splitter String.splitter(self, String split) @deprecated("Use tokenize_all instead")
```

---

#### `from_struct`

```c3
<*
 @param [&inout] allocator : "The allocator to use"
 @param x : "The struct to create a description of"
*>
macro String from_struct(Allocator allocator, x)
```

This macro will create a string description of a struct.


---

#### `tfrom_struct`

```c3
<*
 @param x : "The struct to create a description of"
*>
macro String tfrom_struct(x)
```

This macro will create a temporary string description of a struct.


---

#### `SplitterType`

```c3
enum SplitterType
```

---

#### `Splitter`

```c3
struct Splitter
```

Splitter is handles tokenizing strings.


---

#### `Splitter.reset`

```c3
fn void Splitter.reset(&self)
```

---

#### `Splitter.next`

```c3
fn String? Splitter.next(&self)
```

---

#### `INVALID_ESCAPE_SEQUENCE, UNTERMINATED_STRING, INVALID_HEX_ESCAPE, INVALID_UNICODE_ESCAPE`

```c3
faultdef INVALID_ESCAPE_SEQUENCE, UNTERMINATED_STRING, INVALID_HEX_ESCAPE, INVALID_UNICODE_ESCAPE
```

---

#### `String.escape`

```c3
<*
 @param allocator : "The allocator to use for the result"
 @param s : "The string to escape"
 @param strip_quotes : "Do not include beginning and end quotes, defaults to false"
 @return "The escaped string with surrounding quotes, can safely be cast to ZString"
*>
fn String String.escape(String s, Allocator allocator, bool strip_quotes = true)
```

Escape a string by adding quotes and converting special characters to escape sequences.


---

#### `String.tescape`

```c3
<*
 @param s : "The string to escape"
 @param strip_quotes : "Do not include beginning and end quotes, defaults to false"
 @return "The escaped string with surrounding quotes"
*>
fn String String.tescape(String s, bool strip_quotes = false)
```

Escape a string using the temp allocator.


---

#### `escape_len`

```c3
<*
 @param s : "The string to check"
 @return "The length needed for the escaped version"
*>
fn usz escape_len(String s)
```

Calculate the length needed for an escaped string (including quotes).


---

#### `String.unescape`

```c3
<*
 @param allocator : "The allocator to use for the result"
 @param s : "The quoted string to unescape"
 @param allow_unquoted : "Set to true to unescape strings not surrounded by quotes, defaults to false"
 @return "The unescaped string without quotes, safe to convert to ZString"
 @return? UNTERMINATED_STRING, INVALID_ESCAPE_SEQUENCE, INVALID_HEX_ESCAPE, INVALID_UNICODE_ESCAPE
*>
fn String? String.unescape(String s, Allocator allocator, bool allow_unquoted = false)
```

Unescape a quoted string by parsing escape sequences.


---

#### `String.tunescape`

```c3
<*
 @param s : "The quoted string to unescape"
 @param allow_unquoted : "Set to true to unescape strings not surrounded by quotes, defaults to false"
 @return "The unescaped string without quotes"
 @return? UNTERMINATED_STRING, INVALID_ESCAPE_SEQUENCE, INVALID_HEX_ESCAPE, INVALID_UNICODE_ESCAPE
*>
fn String? String.tunescape(String s, bool allow_unquoted = false)
```

Unescape a quoted string using the temp allocator.


---

#### `needs_escape`

```c3
<*
 @param c : "The character to check"
 @return "True if the character needs escaping"
*>
fn bool needs_escape(char c)
```

Check if a character needs to be escaped in a string literal.


---

#### `KMAX`

```c3
const KMAX = 128
```

---

#### `MASK`

```c3
const MASK = KMAX - 1
```

---

#### `B1B_DIG`

```c3
const B1B_DIG = 2
```

---

#### `B1B_MAX`

```c3
const uint[2] B1B_MAX = { 9007199, 254740991 }
```

---

#### `decfloat`

```c3
<*
 @require chars.len > 0
*>
macro double? decfloat(char[] chars, int $bits, int $emin, int sign)
```

---

#### `hexfloat`

```c3
macro double? hexfloat(char[] chars, int $bits, int $emin, int sign)
```

---

#### `String.to_real`

```c3
macro String.to_real(chars, $Type) @private
```
### `std::core::string::ansi`

---

#### `Ansi`

```c3
enum Ansi : const inline String
```

---

#### `color_8bit`

```c3
<*
 @return `the formatting char for the given background color`
*>
macro String color_8bit(char $index, bool $bg = false) @const
```

8-bit color code


---

#### `color_rgb`

```c3
<*
 @return `the string for the given foreground color`
*>
macro String color_rgb(char $r, char $g, char $b, bool $bg = false) @const
```

24-bit color code


---

#### `color`

```c3
<*
 @require $rgb <= 0xFF_FF_FF : `Expected a 24 bit RGB value`
 @return `the string char for the given foreground color`
*>
macro String color(uint $rgb, bool $bg = false) @const
```

24-bit color code rgb


---

#### `make_color`

```c3
<*
 @require rgb <= 0xFF_FF_FF : `Expected a 24 bit RGB value`
 @return `the string char for the given foreground color`
*>
fn String make_color(Allocator mem, uint rgb, bool bg = false)
```

24-bit color code rgb


---

#### `make_tcolor`

```c3
<*
 @require rgb <= 0xFF_FF_FF : `Expected a 24 bit RGB value`
 @return `the string char for the given foreground color`
*>
fn String make_tcolor(uint rgb, bool bg = false)
```

24-bit color code rgb


---

#### `make_color_rgb`

```c3
<*
 @return `the string char for the given foreground color`
*>
fn String make_color_rgb(Allocator mem, char r, char g, char b, bool bg = false)
```

24-bit color code rgb


---

#### `make_tcolor_rgb`

```c3
<*
 @return `the string char for the given foreground color`
*>
fn String make_tcolor_rgb(char r, char g, char b, bool bg = false)
```

24-bit color code rgb

### `std::core::string::conv`

---

#### `char32_to_utf8`

```c3
<*
 @param c : `The utf32 codepoint to convert`
 @param [out] output : `the resulting buffer`
 @return? string::CONVERSION_FAILED
*>
fn usz? char32_to_utf8(Char32 c, char[] output)
```

---

#### `char32_to_utf16_unsafe`

```c3
<*
 @param c : `The character to convert.`
 @param [inout] output : `the resulting UTF16 buffer to write to.`
*>
fn void char32_to_utf16_unsafe(Char32 c, Char16** output)
```

Convert a code pointer into 1-2 UTF16 characters.


---

#### `char16_to_utf8_unsafe`

```c3
<*
 @param [in] ptr : `The UTF16 data to convert.`
 @param [inout] available : `amount of UTF16 data available.`
 @param [inout] output : `the resulting utf8 buffer to write to.`
*>
fn void? char16_to_utf8_unsafe(Char16 *ptr, usz *available, char** output)
```

Convert 1-2 UTF16 data points into UTF8.


---

#### `char32_to_utf8_unsafe`

```c3
<*
 @param c : `The utf32 codepoint to convert`
 @param [inout] output : `the resulting buffer`
*>
fn usz char32_to_utf8_unsafe(Char32 c, char** output)
```

---

#### `utf8_to_char32`

```c3
<*
 @param [in] ptr : `pointer to the first character to parse`
 @param [inout] size : `Set to max characters to read, set to characters read`
 @return `the parsed 32 bit codepoint`
*>
fn Char32? utf8_to_char32(char* ptr, usz* size)
```

---

#### `utf8_codepoints`

```c3
<*
 @param utf8 : `An UTF-8 encoded slice of bytes`
 @return `the number of encoded code points`
*>
fn usz utf8_codepoints(String utf8)
```

---

#### `utf8len_for_utf32`

```c3
<*
 @param [in] utf32 : `the utf32 data to calculate from`
 @return `the length of the resulting UTF8 array`
*>
fn usz utf8len_for_utf32(Char32[] utf32)
```

Calculate the UTF8 length required to encode an UTF32 array.


---

#### `utf8len_for_utf16`

```c3
<*
 @param [in] utf16 : `the utf16 data to calculate from`
 @return `the length of the resulting UTF8 array`
*>
fn usz utf8len_for_utf16(Char16[] utf16)
```

Calculate the UTF8 length required to encode an UTF16 array.


---

#### `utf16len_for_utf8`

```c3
<*
 @param utf8 : `the utf8 data to calculate from`
 @return `the length of the resulting UTF16 array`
*>
fn usz utf16len_for_utf8(String utf8)
```

Calculate the UTF16 length required to encode a UTF8 array.


---

#### `utf16len_for_utf32`

```c3
<*
 @param [in] utf32 : `the UTF32 array to check the length for`
 @return `the required length of an UTF16 array to hold the UTF32 data.`
*>
fn usz utf16len_for_utf32(Char32[] utf32)
```

---

#### `utf32to8`

```c3
<*
 @param [in] utf32
 @param [out] utf8_buffer
 @return `the number of bytes written.`
*>
fn usz? utf32to8(Char32[] utf32, char[] utf8_buffer)
```

Convert an UTF32 array to an UTF8 array.


---

#### `utf8to32`

```c3
<*
 @param [in] utf8
 @param [out] utf32_buffer
 @return `the number of Char32s written.`
*>
fn usz? utf8to32(String utf8, Char32[] utf32_buffer)
```

Convert an UTF8 array to an UTF32 array.


---

#### `utf16to8_unsafe`

```c3
<*
 @param [in] utf16 : `The UTF16 array containing the data to convert.`
 @param [out] utf8_buffer : `the (sufficiently large) buffer to hold the UTF16 data.`
*>
fn void? utf16to8_unsafe(Char16[] utf16, char* utf8_buffer)
```

Copy an array of UTF16 data into an UTF8 buffer without bounds
checking. This will assume the buffer is sufficiently large to hold
the converted data.


---

#### `utf8to32_unsafe`

```c3
<*
 @param [in] utf8 : `The UTF8 buffer containing the data to convert.`
 @param [out] utf32_buffer : `the (sufficiently large) buffer to hold the UTF8 data.`
*>
fn void? utf8to32_unsafe(String utf8, Char32* utf32_buffer)
```

Copy an array of UTF8 data into an UTF32 buffer without bounds
checking. This will assume the buffer is sufficiently large to hold
the converted data.


---

#### `utf8to16_unsafe`

```c3
<*
 @param [in] utf8 : `The UTF8 buffer containing the data to convert.`
 @param [out] utf16_buffer : `the (sufficiently large) buffer to hold the UTF8 data.`
*>
fn void? utf8to16_unsafe(String utf8, Char16* utf16_buffer)
```

Copy an array of UTF8 data into an UTF16 buffer without bounds
checking. This will assume the buffer is sufficiently large to hold
the converted data.


---

#### `utf32to8_unsafe`

```c3
<*
 @param [in] utf32 : `The UTF32 buffer containing the data to convert.`
 @param [out] utf8_buffer : `the (sufficiently large) buffer to hold the UTF8 data.`
*>
fn void utf32to8_unsafe(Char32[] utf32, char* utf8_buffer)
```

Copy an array of UTF32 code points into an UTF8 buffer without bounds
checking. This will assume the buffer is sufficiently large to hold
the converted data.

### `std::core::string::iterator`

---

#### `StringIterator`

```c3
struct StringIterator
```

---

#### `StringIterator.reset`

```c3
fn void StringIterator.reset(&self)
```

---

#### `StringIterator.next`

```c3
fn Char32? StringIterator.next(&self)
```

---

#### `StringIterator.peek`

```c3
fn Char32? StringIterator.peek(&self)
```

---

#### `StringIterator.has_next`

```c3
fn bool StringIterator.has_next(&self)
```

---

#### `StringIterator.get`

```c3
fn Char32? StringIterator.get(&self)
```
### `std::core::test`

---

#### `@setup`

```c3
<*
 @param setup_fn : `initializer function for test case`
 @param teardown_fn : `cleanup function for test context (may be null)`
 @require runtime::test_context != null : "Only allowed in @test functions"
 @require setup_fn != null : "setup_fn must always be set"
*>
macro @setup(TestFn setup_fn, TestFn teardown_fn = null)
```

Initializes test case context.


---

#### `@check`

```c3
<*
 @param #condition : `any boolean condition, will be expanded by text`
 @param format : `printf compatible format`
 @param args : `vargs for format`
 @require runtime::test_context != null : "Only allowed in @test functions"
*>
macro @check(#condition, String format = "", args...)
```

Checks condition and fails assertion if not true


---

#### `@error`

```c3
<*
 @param #funcresult : `result of function execution`
 @param error_expected : `expected error of function execution`
 @require runtime::test_context != null : "Only allowed in @test functions"
*>
macro @error(#funcresult, fault error_expected)
```

Check if function returns specific error


---

#### `eq`

```c3
<*
 @param left : `left argument of any comparable type`
 @param right : `right argument of any comparable type`
 @require runtime::test_context != null : "Only allowed in @test functions"
*>
macro eq(left, right)
```

Check if left == right


---

#### `eq_approx`

```c3
<*
 @param places : `number of decimal places to compare (default: 7)`
 @param delta : `minimal allowed difference (overrides places parameter)`
 @param equal_nan : `allows comparing nan values, if left and right both nans result is ok`
 @require places > 0, places <= 20 : "too many decimal places"
 @require delta >= 0, delta <= 1 : "delta must be a small number"
 @require runtime::test_context != null : "Only allowed in @test functions"
*>
macro void eq_approx(double left, double right, uint places = 7, double delta = 0, bool equal_nan = true)
```

Check left floating point value is approximately equals to right value


---

#### `ne`

```c3
<*
 @param left : `left argument of any comparable type`
 @param right : `right argument of any comparable type`
 @require runtime::test_context != null : "Only allowed in @test functions"
*>
macro void ne(left, right)
```

Check if left != right


---

#### `gt`

```c3
<*
 @param left : `left argument of any comparable type`
 @param right : `right argument of any comparable type`
 @require runtime::test_context != null : "Only allowed in @test functions"
*>
macro gt(left, right)
```

Check if left > right


---

#### `ge`

```c3
<*
 @param left : `left argument of any comparable type`
 @param right : `right argument of any comparable type`
 @require runtime::test_context != null : "Only allowed in @test functions"
*>
macro ge(left, right)
```

Check if left >= right


---

#### `lt`

```c3
<*
 @param left : `left argument of any comparable type`
 @param right : `right argument of any comparable type`
 @require runtime::test_context != null : "Only allowed in @test functions"
*>
macro lt(left, right)
```

Check if left < right


---

#### `le`

```c3
<*
 @param left : `left argument of any comparable type`
 @param right : `right argument of any comparable type`
 @require runtime::test_context != null : "Only allowed in @test functions"
*>
macro le(left, right)
```

Check if left <= right


---

#### `print_panicf`

```c3
macro void print_panicf(format, ...) @local
```
### `std::core::types`

---

#### `VALUE_OUT_OF_RANGE, VALUE_OUT_OF_UNSIGNED_RANGE`

```c3
faultdef VALUE_OUT_OF_RANGE, VALUE_OUT_OF_UNSIGNED_RANGE
```

---

#### `any_to_enum_ordinal`

```c3
<*
 @require $Type.kindof.is_int() : "Type was not an integer"
 @require v.type.kindof == ENUM : "Value was not an enum"
*>
macro any_to_enum_ordinal(any v, $Type)
```

---

#### `any_to_int`

```c3
<*
 @require $Type.kindof.is_int() : "Type was not an integer"
 @require v.type.kindof.is_int() : "Value was not an integer"
*>
macro any_to_int(any v, $Type)
```

---

#### `typeid.is_subtype_of`

```c3
fn bool typeid.is_subtype_of(self, typeid other)
```

---

#### `is_subtype_of`

```c3
macro bool is_subtype_of($Type, $OtherType)
```

---

#### `is_numerical`

```c3
macro bool is_numerical($Type)
```

---

#### `TypeKind.is_int`

```c3
fn bool TypeKind.is_int(kind) @inline
```

---

#### `is_slice_convertable`

```c3
macro bool is_slice_convertable($Type)
```

---

#### `is_bool`

```c3
macro bool is_bool($Type) @const
```

---

#### `is_int`

```c3
macro bool is_int($Type) @const
```

---

#### `is_signed`

```c3
<*
 @require is_numerical($Type) : "Expected a numerical type"
*>
macro bool is_signed($Type) @const
```

---

#### `is_unsigned`

```c3
<*
 @require is_numerical($Type) : "Expected a numerical type"
*>
macro bool is_unsigned($Type) @const
```

---

#### `flat_type`

```c3
macro typeid flat_type($Type) @const
```

---

#### `flat_kind`

```c3
macro TypeKind flat_kind($Type) @const
```

---

#### `is_indexable`

```c3
macro bool is_indexable($Type) @const
```

---

#### `is_ref_indexable`

```c3
macro bool is_ref_indexable($Type) @const
```

---

#### `is_flat_intlike`

```c3
macro bool is_flat_intlike($Type) @const
```

---

#### `is_intlike`

```c3
macro bool is_intlike($Type) @const
```

---

#### `is_underlying_int`

```c3
macro bool is_underlying_int($Type) @const
```

---

#### `is_float`

```c3
macro bool is_float($Type) @const
```

---

#### `is_floatlike`

```c3
macro bool is_floatlike($Type) @const
```

---

#### `is_vector`

```c3
macro bool is_vector($Type) @const
```

---

#### `inner_type`

```c3
macro typeid inner_type($Type) @const
```

---

#### `inner_kind`

```c3
macro TypeKind inner_kind($Type) @const
```

---

#### `is_same`

```c3
macro bool is_same($TypeA, $TypeB) @const
```

---

#### `@has_same`

```c3
macro bool @has_same(#a, #b, ...) @const
```

---

#### `may_load_atomic`

```c3
macro bool may_load_atomic($Type) @const
```

---

#### `lower_to_atomic_compatible_type`

```c3
macro lower_to_atomic_compatible_type($Type) @const
```

---

#### `is_promotable_to_floatlike`

```c3
macro bool is_promotable_to_floatlike($Type) @const
```

---

#### `is_promotable_to_float`

```c3
macro bool is_promotable_to_float($Type) @const
```

---

#### `is_same_vector_type`

```c3
macro bool is_same_vector_type($Type1, $Type2) @const
```

---

#### `has_equals`

```c3
macro bool has_equals($Type) @const
```

---

#### `is_equatable_type`

```c3
macro bool is_equatable_type($Type) @const
```

---

#### `implements_copy`

```c3
macro bool implements_copy($Type) @const
```

Checks if a type implements the copy protocol.


---

#### `@equatable_value`

```c3
macro bool @equatable_value(#value) @const
```

---

#### `@comparable_value`

```c3
macro bool @comparable_value(#value) @const
```

---

#### `TypeKind`

```c3
enum TypeKind : char
```

---

#### `TypeEnum`

```c3
struct TypeEnum
```
### `std::core::values`

---

#### `@is_same_type`

```c3
macro bool @is_same_type(#value1, #value2) @const
```

Return true if two values have the same type before any conversions.


---

#### `@is_bool`

```c3
macro bool @is_bool(#value) @const
```

---

#### `@is_int`

```c3
macro bool @is_int(#value) @const
```

---

#### `@is_flat_intlike`

```c3
macro bool @is_flat_intlike(#value) @const
```

---

#### `@is_floatlike`

```c3
macro bool @is_floatlike(#value) @const
```

---

#### `@is_float`

```c3
macro bool @is_float(#value) @const
```

---

#### `@is_promotable_to_floatlike`

```c3
macro bool @is_promotable_to_floatlike(#value) @const
```

---

#### `@is_promotable_to_float`

```c3
macro bool @is_promotable_to_float(#value) @const
```

---

#### `@is_vector`

```c3
macro bool @is_vector(#value) @const
```

---

#### `@is_same_vector_type`

```c3
macro bool @is_same_vector_type(#value1, #value2) @const
```

---

#### `@assign_to`

```c3
macro bool @assign_to(#value1, #value2) @const
```

---

#### `@is_lvalue`

```c3
macro bool @is_lvalue(#value)
```

---

#### `@is_const`

```c3
macro bool @is_const(#foo) @const @builtin
```

---

#### `promote_int`

```c3
macro promote_int(x)
```

---

#### `@select`

```c3
<*
 @param $bool : `true for picking the first value, false for the other`
 @param #value_1
 @param #value_2
 @returns `The selected value.`
*>
macro @select(bool $bool, #value_1, #value_2) @builtin
```

Select between two values at compile time,
the values do not have to be of the same type.

This acts like `$bool ? #value_1 : #value_2` but at compile time.


---

#### `promote_int_same`

```c3
macro promote_int_same(x, y)
```

---

#### `@inner_kind`

```c3
macro TypeKind @inner_kind(#value) @const
```
### `std::crypto`

---

#### `safe_compare`

```c3
fn bool safe_compare(void* data1, void* data2, usz len)
```
### `std::crypto::dh`

---

#### `generate_secret`

```c3
fn BigInt generate_secret(BigInt p, BigInt x, BigInt y)
```

---

#### `public_key`

```c3
fn BigInt public_key(BigInt p, BigInt g, BigInt x)
```
### `std::crypto::ed25519`

---

#### `Ed`

```c3
alias Ed25519PrivateKey = char[32]
```
```c3
alias Ed25519PublicKey = char[Ed25519PrivateKey.len]
```
```c3
alias Ed25519Signature = char[2 * Ed25519PublicKey.len]
```

---

#### `public_keygen`

```c3
<*
 @param [in] private_key : "32 bytes of cryptographically secure random data"
 @require private_key.len == Ed25519PrivateKey.len
*>
fn Ed25519PublicKey public_keygen(char[] private_key)
```

Generate a public key from a private key.


---

#### `sign`

```c3
<*
 @param [in] message
 @param [in] private_key
 @param [in] public_key
 @require private_key.len == Ed25519PrivateKey.len
 @require public_key.len == Ed25519PublicKey.len
*>
fn Ed25519Signature sign(char[] message, char[] private_key, char[] public_key)
```

Sign a message.


---

#### `verify`

```c3
<*
 @param [in] message
 @param [in] signature
 @param [in] public_key
 @require signature.len == Ed25519Signature.len
 @require public_key.len == Ed25519PublicKey.len
*>
fn bool verify(char[] message, char[] signature, char[] public_key)
```

Verify the signature of a message.


---

#### `expand_private_key`

```c3
<*
 @param [in] private_key
 @require private_key.len == Ed25519PrivateKey.len
*>
fn char[sha512::HASH_SIZE] expand_private_key(char[] private_key) @local
```

Compute the pruned SHA-512 hash of a private key.

### `std::crypto::rc4`

---

#### `Rc`

```c3
struct Rc4
```

---

#### `Rc4.init`

```c3
<*
 @param [in] key : "The key to use"
 @require key.len > 0 : "The key must be at least 1 byte long"
*>
fn void Rc4.init(&self, char[] key)
```

Initialize the RC4 state.


---

#### `crypt`

```c3
<*
 @param [in] key
 @param [inout] data
*>
fn void crypt(char[] key, char[] data)
```

Run a single pass of en/decryption using a particular key.


---

#### `Rc4.crypt`

```c3
<*
 @param [in] in : "The input"
 @param [out] out : "The output"
 @require in.len <= out.len : "Output would overflow"
*>
fn void Rc4.crypt(&self, char[] in, char[] out)
```

Encrypt or decrypt a sequence of bytes.


---

#### `Rc4.destroy`

```c3
<*
 @param [&out] self : "The RC4 State"
*>
fn void Rc4.destroy(&self)
```

Clear the rc4 state.

### `std::encoding`

---

#### `INVALID_CHARACTER, INVALID_PADDING`

```c3
faultdef INVALID_CHARACTER, INVALID_PADDING
```
### `std::encoding::base32`

---

#### `Base`

```c3
struct Base32Alphabet
```

---

#### `NO_PAD`

```c3
const char NO_PAD = 0
```

---

#### `DEFAULT_PAD`

```c3
const char DEFAULT_PAD = '='
```

---

#### `encode`

```c3
<*
 @param [in] src : "The input to be encoded."
 @param padding : "The padding character or 0 if none"
 @param alphabet : "The alphabet to use"
 @require padding < 0xFF : "Invalid padding character"
 @return "The encoded string."
*>
fn String? encode(Allocator allocator, char[] src, char padding = DEFAULT_PAD, Base32Alphabet* alphabet = &STANDARD)
```

Encode the content of src into a newly allocated string


---

#### `decode`

```c3
<*
 @param [in] src : "The input to be encoded."
 @param padding : "The padding character or 0 if none"
 @param alphabet : "The alphabet to use"
 @require padding < 0xFF : "Invalid padding character"
 @return "The decoded data."
*>
fn char[]? decode(Allocator allocator, char[] src, char padding = DEFAULT_PAD, Base32Alphabet* alphabet = &STANDARD)
```

Decode the content of src into a newly allocated char array.


---

#### `tencode`

```c3
fn String? tencode(char[] code, char padding = DEFAULT_PAD, Base32Alphabet* alphabet = &STANDARD) @inline
```

---

#### `tdecode`

```c3
fn char[]? tdecode(char[] code, char padding = DEFAULT_PAD, Base32Alphabet* alphabet = &STANDARD) @inline
```

---

#### `decode_len`

```c3
<*
 @param n : "Length in bytes of input."
 @param padding : "The padding character or 0 if none"
 @require padding < 0xFF : "Invalid padding character"
 @return "Length in bytes of the decoded data."
*>
fn usz decode_len(usz n, char padding)
```

Calculate the length in bytes of the decoded data.


---

#### `encode_len`

```c3
<*
 @param n : "Length in bytes on input."
 @param padding : "The padding character or 0 if none"
 @require padding < 0xFF : "Invalid padding character"
 @return "Length in bytes of the encoded data."
*>
fn usz encode_len(usz n, char padding)
```

Calculate the length in bytes of the encoded data.


---

#### `decode_buffer`

```c3
<*
 @param src : "The input to be decoded."
 @param dst : "The decoded input."
 @param padding : "The padding character or 0 if none"
 @param alphabet : "The alphabet to use"
 @require padding < 0xFF : "Invalid padding character"
 @require dst.len >= decode_len(src.len, padding) : "Destination buffer too small"
 @return "The resulting dst buffer"
 @return? encoding::INVALID_PADDING, encoding::INVALID_CHARACTER
*>
fn char[]? decode_buffer(char[] src, char[] dst, char padding = DEFAULT_PAD, Base32Alphabet* alphabet = &STANDARD)
```

Decode the content of src into dst, which must be properly sized.


---

#### `encode_buffer`

```c3
<*
 @param [in] src : "The input to be encoded."
 @param [inout] dst : "The encoded input."
 @param padding : "The padding character or 0 if none"
 @param alphabet : "The alphabet to use"
 @require padding < 0xFF : "Invalid padding character"
 @require dst.len >= encode_len(src.len, padding) : "Destination buffer too small"
 @return "The encoded size."
*>
fn String encode_buffer(char[] src, char[] dst, char padding = DEFAULT_PAD, Base32Alphabet* alphabet = &STANDARD)
```

Encode the content of src into dst, which must be properly sized.


---

#### `STD_PADDING`

```c3
const int STD_PADDING = '='
```

---

#### `NO_PADDING`

```c3
const int NO_PADDING = -1
```

---

#### `Alphabet`

```c3
typedef Alphabet = char[32]
```

---

#### `STD_ALPHABET`

```c3
const Alphabet STD_ALPHABET = "ABCDEFGHIJKLMNOPQRSTUVWXYZ234567"
```

---

#### `HEX_ALPHABET`

```c3
const Alphabet HEX_ALPHABET = "0123456789ABCDEFGHIJKLMNOPQRSTUV"
```

---

#### `STANDARD`

```c3
const Base32Alphabet STANDARD = {
	.encoding = "ABCDEFGHIJKLMNOPQRSTUVWXYZ234567",
	.reverse = x`ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
                 ffffffffffffffffffffffffffffffffffff1a1b1c1d1e1fffffffffffffffff
                 ff000102030405060708090a0b0c0d0e0f10111213141516171819ffffffffff
                 ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
                 ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
                 ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
                 ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
                 ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff`
}
```

---

#### `HEX`

```c3
const Base32Alphabet HEX = {
	.encoding = "0123456789ABCDEFGHIJKLMNOPQRSTUV",
	.reverse = x`ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
                 ffffffffffffffffffffffffffffffff00010203040506070809ffffffffffff
                 ff0a0b0c0d0e0f101112131415161718191a1b1c1d1e1fffffffffffffffffff
                 ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
                 ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
                 ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
                 ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
                 ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff`
}
```
### `std::encoding::base64`

---

#### `NO_PAD`

```c3
const char NO_PAD = 0
```

---

#### `DEFAULT_PAD`

```c3
const char DEFAULT_PAD = '='
```

---

#### `Base`

```c3
struct Base64Alphabet
```

---

#### `STANDARD`

```c3
const Base64Alphabet STANDARD = {
	.encoding = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/",
	.reverse =
	x`ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
	  ffffffffffffffffffffff3effffff3f3435363738393a3b3c3dffffffffffff
	  ff000102030405060708090a0b0c0d0e0f10111213141516171819ffffffffff
	  ff1a1b1c1d1e1f202122232425262728292a2b2c2d2e2f30313233ffffffffff
	  ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
	  ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
	  ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
	  ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff`
}
```

---

#### `URL`

```c3
const Base64Alphabet URL = {
	.encoding = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_",
	.reverse =
	x`ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
	  ffffffffffffffffffffffffff3effff3435363738393a3b3c3dffffffffffff
	  ff000102030405060708090a0b0c0d0e0f10111213141516171819ffffffff3f
	  ff1a1b1c1d1e1f202122232425262728292a2b2c2d2e2f30313233ffffffffff
	  ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
	  ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
	  ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
	  ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff`
}
```

---

#### `STD_ALPHABET`

```c3
const STD_ALPHABET = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
```

---

#### `URL_ALPHABET`

```c3
const URL_ALPHABET = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_"
```

---

#### `encode`

```c3
fn String encode(Allocator allocator, char[] src, char padding = DEFAULT_PAD, Base64Alphabet* alphabet = &STANDARD)
```

---

#### `decode`

```c3
fn char[]? decode(Allocator allocator, char[] src, char padding = DEFAULT_PAD, Base64Alphabet* alphabet = &STANDARD)
```

---

#### `tencode`

```c3
fn String tencode(char[] code, char padding = DEFAULT_PAD, Base64Alphabet* alphabet = &STANDARD) @inline
```

---

#### `tdecode`

```c3
fn char[]? tdecode(char[] code, char padding = DEFAULT_PAD, Base64Alphabet* alphabet = &STANDARD) @inline
```

---

#### `encode_len`

```c3
<*
 @param n : "Size of the input to be encoded."
 @param padding : "The padding character or 0 if none"
 @require padding < 0xFF : "Invalid padding character"
 @return "The size of the input once encoded."
*>
fn usz encode_len(usz n, char padding)
```

Calculate the size of the encoded data.


---

#### `decode_len`

```c3
<*
 @param n : "Size of the input to be decoded."
 @param padding : "The padding character or 0 if none"
 @require padding < 0xFF : "Invalid padding character"
 @return "The size of the input once decoded."
 @return? encoding::INVALID_PADDING
*>
fn usz? decode_len(usz n, char padding)
```

Calculate the size of the decoded data.


---

#### `encode_buffer`

```c3
<*
 @param src : "The input to be encoded."
 @param dst : "The encoded input."
 @param padding : "The padding character or 0 if none"
 @param alphabet : "The alphabet to use"
 @require padding < 0xFF : "Invalid padding character"
 @return "The encoded size."
*>
fn String encode_buffer(char[] src, char[] dst, char padding = DEFAULT_PAD, Base64Alphabet* alphabet = &STANDARD)
```

Encode the content of src into dst, which must be properly sized.


---

#### `decode_buffer`

```c3
<*
 @param src : "The input to be decoded."
 @param dst : "The decoded input."
 @param padding : "The padding character or 0 if none"
 @param alphabet : "The alphabet to use"
 @require (decode_len(src.len, padding) ?? 0) <= dst.len : "Destination buffer too small"
 @require padding < 0xFF : "Invalid padding character"
 @return "The decoded data."
 @return? encoding::INVALID_CHARACTER, encoding::INVALID_PADDING
*>
fn char[]? decode_buffer(char[] src, char[] dst, char padding = DEFAULT_PAD, Base64Alphabet* alphabet = &STANDARD)
```

Decode the content of src into dst, which must be properly sized.

### `std::encoding::csv`

---

#### `CsvReader`

```c3
struct CsvReader
```

---

#### `CsvRow`

```c3
struct CsvRow (Printable)
```

---

#### `CsvRow.to_format`

```c3
fn usz? CsvRow.to_format(&self, Formatter* f) @dynamic
```

---

#### `CsvRow.len`

```c3
fn usz CsvRow.len(&self) @operator(len)
```

---

#### `CsvRow.get_col`

```c3
<*
 @require col < self.list.len
*>
fn String CsvRow.get_col(&self, usz col) @operator([])
```

---

#### `CsvReader.init`

```c3
fn void CsvReader.init(&self, InStream stream, String separator = ",")
```

---

#### `CsvReader.read_row`

```c3
<*
 @param [&inout] allocator
*>
fn CsvRow? CsvReader.read_row(self, Allocator allocator)
```

---

#### `CsvReader.tread_row`

```c3
fn CsvRow? CsvReader.tread_row(self)
```

---

#### `CsvRow.free`

```c3
<*
 @require self.allocator != null  : `Row already freed`
*>
fn void CsvRow.free(&self)
```

---

#### `CsvReader.skip_row`

```c3
fn void? CsvReader.skip_row(self) @maydiscard
```

---

#### `@each_row`

```c3
macro void? @each_row(InStream stream, String separator = ",", int max_rows = int.max; @body(String[] row)) @maydiscard
```

---

#### `CsvReader.@each_row`

```c3
macro void? CsvReader.@each_row(self, int rows = int.max; @body(String[] row)) @maydiscard
```
### `std::encoding::hex`

---

#### `encode_buffer`

```c3
fn String encode_buffer(char[] code, char[] buffer)
```

---

#### `decode_buffer`

```c3
fn char[]? decode_buffer(char[] code, char[] buffer)
```

---

#### `encode`

```c3
fn String encode(Allocator allocator, char[] code)
```

---

#### `decode`

```c3
fn char[]? decode(Allocator allocator, char[] code)
```

---

#### `tencode`

```c3
fn String tencode(char[] code) @inline
```

---

#### `tdecode`

```c3
fn char[]? tdecode(char[] code) @inline
```

---

#### `encode_len`

```c3
<*
 @param n : "Size of the input to be encoded."
 @return "The size of the input once encoded."
*>
fn usz encode_len(usz n)
```

Calculate the size of the encoded data.


---

#### `encode_bytes`

```c3
<*
 @param src : "The input to be encoded."
 @param dst : "The encoded input."
 @return "The encoded size."
 @require dst.len >= encode_len(src.len) : "Destination array is not large enough"
*>
fn usz encode_bytes(char[] src, char[] dst)
```

Encode the content of src into dst, which must be properly sized.


---

#### `decode_len`

```c3
<*
 @param n : "Size of the input to be decoded."
 @return "The size of the input once decoded."
*>
macro usz decode_len(usz n)
```

Calculate the size of the decoded data.


---

#### `decode_bytes`

```c3
<*
 @param src : "The input to be decoded."
 @param dst : "The decoded input."
 @require src.len % 2 == 0 : "src is not of even length"
 @require dst.len >= decode_len(src.len) : "Destination array is not large enough"
 @return? encoding::INVALID_CHARACTER
*>
fn usz? decode_bytes(char[] src, char[] dst)
```

Decodes src into bytes. Returns the actual number of bytes written to dst.

Expects that src only contains hexadecimal characters and that src has even
length.

### `std::encoding::json`

---

#### `UNEXPECTED_CHARACTER, INVALID_ESCAPE_SEQUENCE, INVALID_NUMBER, MAX_DEPTH_REACHED`

```c3
faultdef UNEXPECTED_CHARACTER, INVALID_ESCAPE_SEQUENCE, INVALID_NUMBER, MAX_DEPTH_REACHED
```

---

#### `parse_string`

```c3
fn Object*? parse_string(Allocator allocator, String s)
```

---

#### `tparse_string`

```c3
fn Object*? tparse_string(String s)
```

---

#### `parse`

```c3
fn Object*? parse(Allocator allocator, InStream s)
```

---

#### `tparse`

```c3
fn Object*? tparse(InStream s)
```

---

#### `parse_from_token`

```c3
fn Object*? parse_from_token(JsonContext* context, JsonTokenType token) @local
```

---

#### `parse_any`

```c3
fn Object*? parse_any(JsonContext* context) @local
```

---

#### `lex_number`

```c3
fn JsonTokenType? lex_number(JsonContext *context, char c) @local
```

---

#### `parse_map`

```c3
fn Object*? parse_map(JsonContext* context) @local
```

---

#### `parse_array`

```c3
fn Object*? parse_array(JsonContext* context) @local
```

---

#### `pushback`

```c3
fn void pushback(JsonContext* context, char c) @local
```

---

#### `read_next`

```c3
fn char? read_next(JsonContext* context) @local
```

---

#### `advance`

```c3
fn JsonTokenType? advance(JsonContext* context) @local
```

---

#### `match`

```c3
fn void? match(JsonContext* context, String str) @local
```

---

#### `parse_expected`

```c3
fn void? parse_expected(JsonContext* context, JsonTokenType token) @local
```

---

#### `lex_string`

```c3
fn JsonTokenType? lex_string(JsonContext* context)
```
### `std::experimental::scheduler{Event}`

---

#### `DelayedSchedulerEvent.compare_to`

```c3
fn int DelayedSchedulerEvent.compare_to(self, DelayedSchedulerEvent other) @local
```

---

#### `FrameScheduler`

```c3
struct FrameScheduler
```

---

#### `FrameScheduler.init`

```c3
fn void FrameScheduler.init(&self)
```

---

#### `FrameScheduler.@destroy`

```c3
macro void FrameScheduler.@destroy(&self; @destruct(Event e))
```

---

#### `FrameScheduler.queue_delayed_event`

```c3
fn void FrameScheduler.queue_delayed_event(&self, Event event, Duration delay)
```

---

#### `FrameScheduler.has_delayed`

```c3
fn bool FrameScheduler.has_delayed(&self)
```

---

#### `FrameScheduler.queue_event`

```c3
fn void FrameScheduler.queue_event(&self, Event event)
```

---

#### `FrameScheduler.pop_event`

```c3
fn Event? FrameScheduler.pop_event(&self)
```
### `std::hash::a5hash`

---

#### `@a5mul`

```c3
macro @a5mul(#u, #v, #lo, #hi) @local
```

---

#### `hash`

```c3
fn ulong hash(char[] data, ulong seed = 0)
```
### `std::hash::adler32`

---

#### `Adler`

```c3
struct Adler32
```

---

#### `Adler32.init`

```c3
fn void Adler32.init(&self)
```

---

#### `Adler32.updatec`

```c3
fn void Adler32.updatec(&self, char c)
```

---

#### `Adler32.update`

```c3
fn void Adler32.update(&self, char[] data)
```

---

#### `Adler32.final`

```c3
fn uint Adler32.final(&self)
```

---

#### `hash`

```c3
fn uint hash(char[] data)
```
### `std::hash::crc32`

---

#### `Crc`

```c3
struct Crc32
```

---

#### `Crc32.init`

```c3
fn void Crc32.init(&self, uint seed = 0)
```

---

#### `Crc32.updatec`

```c3
fn void Crc32.updatec(&self, char c)
```

---

#### `Crc32.update`

```c3
fn void Crc32.update(&self, char[] data)
```

---

#### `Crc32.final`

```c3
fn uint Crc32.final(&self)
```

---

#### `hash`

```c3
fn uint hash(char[] data)
```
### `std::hash::crc64`

---

#### `Crc`

```c3
struct Crc64
```

---

#### `Crc64.init`

```c3
fn void Crc64.init(&self, uint seed = 0)
```

---

#### `Crc64.updatec`

```c3
fn void Crc64.updatec(&self, char c)
```

---

#### `Crc64.update`

```c3
fn void Crc64.update(&self, char[] data)
```

---

#### `Crc64.final`

```c3
fn ulong Crc64.final(&self)
```

---

#### `hash`

```c3
fn ulong hash(char[] data)
```
### `std::hash::fnv32a`

---

#### `Fnv`

```c3
typedef Fnv32a = uint
```

---

#### `update`

```c3
macro void update(h, char x) @private
```

---

#### `Fnv32a.init`

```c3
fn void Fnv32a.init(&self)
```

---

#### `Fnv32a.update`

```c3
fn void Fnv32a.update(&self, char[] data)
```

---

#### `Fnv32a.update_char`

```c3
macro void Fnv32a.update_char(&self, char c)
```

---

#### `hash`

```c3
fn uint hash(char[] data)
```
### `std::hash::fnv64a`

---

#### `Fnv`

```c3
typedef Fnv64a = ulong
```

---

#### `update`

```c3
macro void update(h, char x) @private
```

---

#### `Fnv64a.init`

```c3
fn void Fnv64a.init(&self)
```

---

#### `Fnv64a.update`

```c3
fn void Fnv64a.update(&self, char[] data)
```

---

#### `Fnv64a.update_char`

```c3
macro void Fnv64a.update_char(&self, char c)
```

---

#### `hash`

```c3
fn ulong hash(char[] data)
```
### `std::hash::hmac{HashAlg, HASH_BYTES, BLOCK_BYTES}`

---

#### `Hmac`

```c3
struct Hmac
```

---

#### `hash`

```c3
fn char[HASH_BYTES] hash(char[] key, char[] message)
```

---

#### `pbkdf2`

```c3
<*
 @require output.len > 0 : "Output must be greater than zero"
 @require output.len < int.max / HASH_BYTES : "Output is too large"
*>
fn void pbkdf2(char[] pw, char[] salt, uint iterations, char[] output)
```

---

#### `Hmac.init`

```c3
fn void Hmac.init(&self, char[] key)
```

---

#### `Hmac.update`

```c3
fn void Hmac.update(&self, char[] data)
```

---

#### `Hmac.final`

```c3
fn char[HASH_BYTES] Hmac.final(&self)
```

---

#### `@derive`

```c3
macro @derive(Hmac *hmac_start, char[] salt, uint iterations, usz index, char[] out)
```
### `std::hash::komi`

---

#### `@komimul`

```c3
macro @komimul(#u, #v, #lo, #hi) @local
```

---

#### `hash`

```c3
fn ulong hash(char[] data, ulong seed = 0)
```
### `std::hash::md5`

---

#### `BLOCK_BYTES`

```c3
const BLOCK_BYTES = 64
```

---

#### `HASH_BYTES`

```c3
const HASH_BYTES = 16
```

---

#### `Md`

```c3
struct Md5
```

---

#### `HmacMd`

```c3
alias HmacMd5 = Hmac{Md5, HASH_BYTES, BLOCK_BYTES}
```

---

#### `hmac`

```c3
alias hmac = hmac::hash{Md5, HASH_BYTES, BLOCK_BYTES}
```

---

#### `pbkdf`

```c3
alias pbkdf2 = hmac::pbkdf2{Md5, HASH_BYTES, BLOCK_BYTES}
```

---

#### `hash`

```c3
fn char[HASH_BYTES] hash(char[] data)
```

---

#### `Md5.init`

```c3
fn void Md5.init(&self)
```

---

#### `Md5.update`

```c3
fn void Md5.update(&ctx, char[] data)
```

---

#### `Md5.final`

```c3
fn char[HASH_BYTES] Md5.final(&ctx)
```
### `std::hash::metro128`

---

#### `MetroHash`

```c3
struct MetroHash128
```

---

#### `hash`

```c3
fn uint128 hash(char[] data, ulong seed = 0)
```

---

#### `MetroHash128.init`

```c3
fn void MetroHash128.init(&self, ulong seed = 0)
```

---

#### `MetroHash128.update`

```c3
fn void MetroHash128.update(&self, char[] data)
```

---

#### `MetroHash128.final`

```c3
fn uint128 MetroHash128.final(&self)
```
### `std::hash::metro64`

---

#### `MetroHash`

```c3
struct MetroHash64
```

---

#### `hash`

```c3
fn ulong hash(char[] data, ulong seed = 0)
```

---

#### `MetroHash64.init`

```c3
fn void MetroHash64.init(&self, ulong seed = 0)
```

---

#### `MetroHash64.update`

```c3
fn void MetroHash64.update(&self, char[] data)
```

---

#### `MetroHash64.final`

```c3
fn ulong MetroHash64.final(&self)
```
### `std::hash::sha1`

---

#### `BLOCK_BYTES`

```c3
const BLOCK_BYTES = 64
```

---

#### `HASH_BYTES`

```c3
const HASH_BYTES = 20
```

---

#### `Sha`

```c3
struct Sha1
```

---

#### `HmacSha`

```c3
alias HmacSha1 = Hmac{Sha1, HASH_BYTES, BLOCK_BYTES}
```

---

#### `hmac`

```c3
alias hmac = hmac::hash{Sha1, HASH_BYTES, BLOCK_BYTES}
```

---

#### `pbkdf`

```c3
alias pbkdf2 = hmac::pbkdf2{Sha1, HASH_BYTES, BLOCK_BYTES}
```

---

#### `hash`

```c3
fn char[HASH_BYTES] hash(char[] data)
```

---

#### `Sha1.init`

```c3
fn void Sha1.init(&self)
```

---

#### `Sha1.update`

```c3
<*
 @param [in] data
 @require data.len <= uint.max
*>
fn void Sha1.update(&self, char[] data)
```

---

#### `Sha1.final`

```c3
fn char[HASH_BYTES] Sha1.final(&self)
```

---

#### `blk`

```c3
macro blk(Long16* block, i) @local
```

---

#### `blk0`

```c3
macro blk0(Long16* block, i) @local
```

---

#### `r0`

```c3
macro r0(Long16* block, uint v, uint* wref, uint x, uint y, uint* z, uint i) @local
```

---

#### `r1`

```c3
macro r1(Long16* block, uint v, uint* wref, uint x, uint y, uint* z, uint i) @local
```

---

#### `r2`

```c3
macro r2(Long16* block, uint v, uint* wref, uint x, uint y, uint* z, uint i) @local
```

---

#### `r3`

```c3
macro r3(Long16* block, uint v, uint* wref, uint x, uint y, uint* z, uint i) @local
```

---

#### `r4`

```c3
macro r4(Long16* block, uint v, uint* wref, uint x, uint y, uint* z, uint i) @local
```

---

#### `sha1_transform`

```c3
<*
 @param [&inout] state
 @param [&in] buffer
*>
fn void sha1_transform(uint[5]* state, char* buffer) @local
```
### `std::hash::sha256`

---

#### `BLOCK_SIZE`

```c3
const BLOCK_SIZE = 64
```

---

#### `HASH_SIZE`

```c3
const HASH_SIZE = 32
```

---

#### `@rotr`

```c3
macro uint @rotr(uint x, uint n) @local
```

---

#### `@ch`

```c3
macro uint @ch(uint x, uint y, uint z) @local
```

---

#### `@maj`

```c3
macro uint @maj(uint x, uint y, uint z) @local
```

---

#### `@_sigma0`

```c3
macro uint @_sigma0(uint x) @local
```

---

#### `@_sigma1`

```c3
macro uint @_sigma1(uint x) @local
```

---

#### `@sigma0`

```c3
macro uint @sigma0(uint x) @local
```

---

#### `@sigma1`

```c3
macro uint @sigma1(uint x) @local
```

---

#### `Sha`

```c3
struct Sha256
```

---

#### `HmacSha`

```c3
alias HmacSha256 = Hmac{Sha256, HASH_SIZE, BLOCK_SIZE}
```

---

#### `hmac`

```c3
alias hmac = hmac::hash{Sha256, HASH_SIZE, BLOCK_SIZE}
```

---

#### `pbkdf`

```c3
alias pbkdf2 = hmac::pbkdf2{Sha256, HASH_SIZE, BLOCK_SIZE}
```

---

#### `hash`

```c3
fn char[HASH_SIZE] hash(char[] data)
```

---

#### `Sha256.init`

```c3
fn void Sha256.init(&self)
```

---

#### `Sha256.update`

```c3
<*
 @param [in] data
 @require data.len <= uint.max
*>
fn void Sha256.update(&self, char[] data)
```

---

#### `Sha256.final`

```c3
fn char[HASH_SIZE] Sha256.final(&self)
```

---

#### `sha256_transform`

```c3
<*
 @param [&inout] state
 @param [&in] buffer
*>
fn void sha256_transform(uint* state, char* buffer) @local
```
### `std::hash::sha512`

---

#### `BLOCK_SIZE`

```c3
const BLOCK_SIZE = 128
```

---

#### `HASH_SIZE`

```c3
const HASH_SIZE = 64
```

---

#### `Sha`

```c3
struct Sha512
```

---

#### `HmacSha`

```c3
alias HmacSha512    = Hmac{Sha512, HASH_SIZE, BLOCK_SIZE}
```

---

#### `hmac`

```c3
alias hmac          = hmac::hash{Sha512, HASH_SIZE, BLOCK_SIZE}
```

---

#### `pbkdf`

```c3
alias pbkdf2        = hmac::pbkdf2{Sha512, HASH_SIZE, BLOCK_SIZE}
```

---

#### `ror`

```c3
macro ulong ror(ulong n, int k) @local
```

---

#### `ch`

```c3
macro ulong ch(ulong x, ulong y, ulong z) @local
```

---

#### `maj`

```c3
macro ulong maj(ulong x, ulong y, ulong z) @local
```

---

#### `s0`

```c3
macro ulong s0(ulong x) @local
```

---

#### `s1`

```c3
macro ulong s1(ulong x) @local
```

---

#### `r0`

```c3
macro ulong r0(ulong x) @local
```

---

#### `r1`

```c3
macro ulong r1(ulong x) @local
```

---

#### `HashTruncationType`

```c3
enum HashTruncationType : uint (uint truncation_width, ulong[8] initial_state)
```

---

#### `hash`

```c3
<*
 @param [in] data
*>
fn char[HASH_SIZE] hash(char[] data)
```

---

#### `Sha512.init`

```c3
fn void Sha512.init(&self)
```

---

#### `Sha512.update`

```c3
<*
 @param [in] data
 @require data.len <= ulong.max
*>
fn void Sha512.update(&self, char[] data)
```

---

#### `Sha512.final`

```c3
fn char[HASH_SIZE] Sha512.final(&self)
```

---

#### `sha512_transform`

```c3
<*
 @param [&inout] state
 @param [&in] buf
*>
fn void sha512_transform(ulong *state, char *buf) @local
```
### `std::hash::siphash { OutType, BLOCK_ROUNDS, FINALIZE_ROUNDS }`

---

#### `SipHash`

```c3
struct SipHash
```

---

#### `hash`

```c3
fn OutType hash(char[] data, uint128 key)
```

---

#### `SipHash.init`

```c3
fn void SipHash.init(&self, uint128 key)
```

---

#### `SipHash.update`

```c3
<*
 @param [in] data : "Bytes to hash"
*>
fn void SipHash.update(&self, char[] data)
```

---

#### `SipHash.final`

```c3
fn OutType SipHash.final(&self)
```

---

#### `SipHash.round`

```c3
fn void SipHash.round(&self) @local
```
### `std::hash::siphash24`

---

#### `SipHash`

```c3
alias SipHash24 = SipHash { ulong, 2, 4 }
```

---

#### `hash`

```c3
alias hash = siphash::hash { ulong, 2, 4 }
```
### `std::hash::siphash24_128`

---

#### `SipHash`

```c3
alias SipHash24_128 = SipHash { uint128, 2, 4 }
```

---

#### `hash`

```c3
alias hash = siphash::hash { uint128, 2, 4 }
```
### `std::hash::siphash48`

---

#### `SipHash`

```c3
alias SipHash48 = SipHash { ulong, 4, 8 }
```

---

#### `hash`

```c3
alias hash = siphash::hash { ulong, 4, 8 }
```
### `std::hash::siphash48_128`

---

#### `SipHash`

```c3
alias SipHash48_128 = SipHash { uint128, 4, 8 }
```

---

#### `hash`

```c3
alias hash = siphash::hash { uint128, 4, 8 }
```
### `std::hash::whirlpool`

---

#### `BLOCK_SIZE`

```c3
const BLOCK_SIZE = 64
```

---

#### `HASH_SIZE`

```c3
const HASH_SIZE = 64
```

---

#### `BLOCK_128`

```c3
const BLOCK_128 = 64 / int128.sizeof
```

---

#### `Whirlpool`

```c3
struct Whirlpool
```

---

#### `HmacWhirlpool`

```c3
alias HmacWhirlpool = Hmac { Whirlpool, HASH_SIZE, BLOCK_SIZE }
```

---

#### `hmac`

```c3
alias hmac = hmac::hash { Whirlpool, HASH_SIZE, BLOCK_SIZE }
```

---

#### `pbkdf`

```c3
alias pbkdf2 = hmac::pbkdf2 { Whirlpool, HASH_SIZE, BLOCK_SIZE }
```

---

#### `hash`

```c3
fn char[HASH_SIZE] hash(char[] data)
```

---

#### `Whirlpool.init`

```c3
macro void Whirlpool.init(&self)
```

---

#### `Whirlpool.update`

```c3
<*
 @require data.len <= isz.max : "Update with smaller slices"
*>
fn void Whirlpool.update(&self, char[] data)
```

---

#### `Whirlpool.final`

```c3
fn char[HASH_SIZE] Whirlpool.final(&self)
```

---

#### `@w_op`

```c3
macro ulong @w_op(#src, $shift) @private
```

---

#### `ROUNDS`

```c3
const ROUNDS = 10
```

---

#### `Whirlpool.process_block`

```c3
fn void Whirlpool.process_block(&self, char* block) @local
```
### `std::hash::wyhash2`

---

#### `wyr3`

```c3
fn ulong wyr3(char* in, usz len) @inline
```

---

#### `hash`

```c3
<*
 @require input.len <= 16 : `wyhash2 is not useable for inputs over 16 bytes in length.`
*>
fn ulong hash(char[] input, ulong seed = 0)
```
### `std::io`

---

#### `BitReader`

```c3
struct BitReader
```

---

#### `BitReader.init`

```c3
fn void BitReader.init(&self, InStream byte_reader)
```

---

#### `BitReader.clear`

```c3
fn void BitReader.clear(&self) @inline
```

---

#### `BitReader.read_bits`

```c3
<*
 @require nbits <= 8
 @require self.len + nbits <= uint.sizeof * 8
*>
fn char? BitReader.read_bits(&self, uint nbits)
```

---

#### `BitWriter`

```c3
struct BitWriter
```

---

#### `WRITER_BITS`

```c3
const int WRITER_BITS = 24
```

---

#### `BitWriter.init`

```c3
fn void BitWriter.init(&self, OutStream byte_writer)
```

---

#### `BitWriter.flush`

```c3
fn void? BitWriter.flush(&self)
```

---

#### `BitWriter.write_bits`

```c3
<*
 @require nbits <= 32
*>
fn void? BitWriter.write_bits(&self, uint bits, uint nbits)
```

---

#### `File`

```c3
struct File (InStream, OutStream)
```

---

#### `PRINTF_NTOA_BUFFER_SIZE`

```c3
const int PRINTF_NTOA_BUFFER_SIZE = 256
```

---

#### `BUFFER_EXCEEDED, INTERNAL_BUFFER_EXCEEDED, INVALID_FORMAT,     NOT_ENOUGH_ARGUMENTS, INVALID_ARGUMENT`

```c3
faultdef BUFFER_EXCEEDED, INTERNAL_BUFFER_EXCEEDED, INVALID_FORMAT,
         NOT_ENOUGH_ARGUMENTS, INVALID_ARGUMENT
```

---

#### `OutputFn`

```c3
alias OutputFn = fn void?(void* buffer, char c)
```

---

#### `FloatType`

```c3
alias FloatType = double
```

---

#### `is_struct_with_default_print`

```c3
macro bool is_struct_with_default_print($Type)
```

---

#### `struct_to_format`

```c3
<*
 @require @typekind(value) == STRUCT || @typekind(value) == BITSTRUCT : `This macro is only valid on macros`
*>
macro usz? struct_to_format(value, Formatter* f, bool $force_dump)
```

Introspect a struct and print it to a formatter


---

#### `ReflectedParam.to_format`

```c3
fn usz? ReflectedParam.to_format(&self, Formatter* f) @dynamic
```

---

#### `Formatter.printf`

```c3
fn usz? Formatter.printf(&self, String format, args...)
```

---

#### `Formatter`

```c3
struct Formatter
```

---

#### `PrintFlags`

```c3
bitstruct PrintFlags : uint
```

---

#### `Formatter.init`

```c3
fn void Formatter.init(&self, OutputFn out_fn, void* data = null)
```

---

#### `Formatter.out`

```c3
fn usz? Formatter.out(&self, char c) @private
```

---

#### `Formatter.print_with_function`

```c3
fn usz? Formatter.print_with_function(&self, Printable arg)
```

---

#### `Formatter.out_unknown`

```c3
fn usz? Formatter.out_unknown(&self, String category, any arg) @private
```

---

#### `Formatter.out_str`

```c3
fn usz? Formatter.out_str(&self, any arg) @private
```

---

#### `out_null_fn`

```c3
fn void? out_null_fn(void* data @unused, char c @unused) @private
```

---

#### `@report_fault`

```c3
macro usz? @report_fault(Formatter* f, $fault)
```

---

#### `@wrap_bad`

```c3
macro usz? @wrap_bad(Formatter* f, #action)
```

---

#### `Formatter.vprintf`

```c3
fn usz? Formatter.vprintf(&self, String format, any[] anys)
```

---

#### `Formatter.print`

```c3
fn usz? Formatter.print(&self, String str)
```

---

#### `XDIGITS_H`

```c3
const char[16] XDIGITS_H = "0123456789ABCDEF"
```

---

#### `XDIGITS_L`

```c3
const char[16] XDIGITS_L = "0123456789abcdef"
```

---

#### `BAD_FORMAT`

```c3
faultdef BAD_FORMAT
```

---

#### `print_hex_chars`

```c3
fn usz? print_hex_chars(Formatter* f, char[] out, bool uppercase) @inline
```

---

#### `Formatter.first_err`

```c3
macro Formatter.first_err(&self, fault f)
```

---

#### `Formatter.adjust`

```c3
fn usz? Formatter.adjust(&self, usz len) @local
```

---

#### `int_from_any`

```c3
fn uint128? int_from_any(any arg, bool *is_neg) @private
```

---

#### `float_from_any`

```c3
fn FloatType? float_from_any(any arg) @private
```

---

#### `simple_atoi`

```c3
<*
 @param [inout] len_ptr : "the length remaining."
 @param [in] buf : "the buf to read from."
 @param maxlen : "the maximum len that can be read."
 @return "The result of the atoi."
*>
fn uint simple_atoi(char* buf, usz maxlen, usz* len_ptr) @inline @private
```

Read a simple integer value, typically for formatting.


---

#### `Formatter.out_substr`

```c3
fn usz? Formatter.out_substr(&self, String str) @private
```

---

#### `Formatter.pad`

```c3
fn usz? Formatter.pad(&self, char c, isz width, isz len) @inline
```

---

#### `fmt_u`

```c3
fn char* fmt_u(uint128 x, char* s)
```

---

#### `Formatter.out_chars`

```c3
fn usz? Formatter.out_chars(&self, char[] s)
```

---

#### `FloatFormatting`

```c3
enum FloatFormatting
```

---

#### `Formatter.etoa`

```c3
fn usz? Formatter.etoa(&self, double y)
```

---

#### `Formatter.ftoa`

```c3
fn usz? Formatter.ftoa(&self, double y)
```

---

#### `Formatter.gtoa`

```c3
fn usz? Formatter.gtoa(&self, double y)
```

---

#### `Formatter.atoa`

```c3
fn usz? Formatter.atoa(&self, double y)
```

---

#### `Formatter.floatformat`

```c3
fn usz? Formatter.floatformat(&self, FloatFormatting formatting, double y) @private
```

---

#### `Formatter.ntoa`

```c3
fn usz? Formatter.ntoa(&self, uint128 value, bool negative, uint base) @private
```

---

#### `Formatter.ntoa_format`

```c3
fn usz? Formatter.ntoa_format(&self, String buf, usz len, bool negative, uint base) @private
```

---

#### `Formatter.ntoa_any`

```c3
fn usz? Formatter.ntoa_any(&self, any arg, uint base) @private
```

---

#### `Formatter.out_char`

```c3
fn usz? Formatter.out_char(&self, any arg) @private
```

---

#### `Formatter.out_reverse`

```c3
fn usz? Formatter.out_reverse(&self, char[] buf) @private
```

---

#### `printf_parse_format_field`

```c3
fn int? printf_parse_format_field(
	any* args_ptr, usz args_len, usz* args_index_ptr,
	char* format_ptr, usz format_len, usz* index_ptr) @inline @private
```

---

#### `Seek`

```c3
enum Seek
```

---

#### `ALREADY_EXISTS, BUSY, CANNOT_READ_DIR, DIR_NOT_EMPTY, PARENT_DIR_MISSING, EOF, FILE_CANNOT_DELETE, FILE_IS_DIR, FILE_IS_PIPE, FILE_NOT_DIR, FILE_NOT_FOUND, FILE_NOT_VALID, GENERAL_ERROR, ILLEGAL_ARGUMENT, INCOMPLETE_WRITE, INTERRUPTED, INVALID_POSITION, INVALID_PUSHBACK, NAME_TOO_LONG, NOT_SEEKABLE, NO_PERMISSION, OUT_OF_SPACE, OVERFLOW, READ_ONLY, SYMLINK_FAILED, TOO_MANY_DESCRIPTORS, UNEXPECTED_EOF, UNKNOWN_ERROR, UNSUPPORTED_OPERATION, WOULD_BLOCK`

```c3
faultdef
	ALREADY_EXISTS,
	BUSY,
	CANNOT_READ_DIR,
	DIR_NOT_EMPTY,
	PARENT_DIR_MISSING,
	EOF,
	FILE_CANNOT_DELETE,
	FILE_IS_DIR,
	FILE_IS_PIPE,
	FILE_NOT_DIR,
	FILE_NOT_FOUND,
	FILE_NOT_VALID,
	GENERAL_ERROR,
	ILLEGAL_ARGUMENT,
	INCOMPLETE_WRITE,
	INTERRUPTED,
	INVALID_POSITION,
	INVALID_PUSHBACK,
	NAME_TOO_LONG,
	NOT_SEEKABLE,
	NO_PERMISSION,
	OUT_OF_SPACE,
	OVERFLOW,
	READ_ONLY,
	SYMLINK_FAILED,
	TOO_MANY_DESCRIPTORS,
	UNEXPECTED_EOF,
	UNKNOWN_ERROR,
	UNSUPPORTED_OPERATION,
	WOULD_BLOCK
```

---

#### `readline`

```c3
<*
 @param stream : `The stream to read from.`
 @require !($defined(&stream) &&& @is_instream(&stream)) : "The value for 'stream' should have been passed as a pointer and not as a value, please add '&'."
 @require @is_instream(stream) : `Make sure that the stream is actually an InStream.`
 @param [inout] allocator : `the allocator to use.`
 @return `The string containing the data read.`
*>
macro String? readline(Allocator allocator, stream = io::stdin())
```

Read from a stream (default is stdin) to the next "\n"
or to the end of the stream, whatever comes first.
"\r" will be filtered from the String.


---

#### `treadline`

```c3
<*
 @param stream : `The stream to read from.`
 @require !($defined(&stream) &&& @is_instream(&stream)) : "The value for 'stream' should have been passed as a pointer and not as a value, please add '&'."
 @require @is_instream(stream) : `The stream must implement InStream.`
 @return `The temporary string containing the data read.`
*>
macro String? treadline(stream = io::stdin())
```

Reads a string, see `readline`, except the it is allocated
on the temporary allocator and does not need to be freed.


---

#### `readline_to_stream`

```c3
<*
 @param out_stream : `The stream to write to`
 @param in_stream : `The stream to read from.`
 @require !($defined(&in_stream) &&& @is_instream(&in_stream)) : "The value for 'in_stream' should have been passed as a pointer and not as a value, please add '&'."
 @require !($defined(&out_stream) &&& @is_outstream(&out_stream)) : "The value for 'out_stream' should have been passed as a pointer and not as a value, please add '&'."
 @require @is_instream(in_stream) : `The in_stream must implement InStream.`
 @require @is_outstream(out_stream) : `The out_stream must implement OutStream.`
 @return `The number of bytes written`
*>
macro usz? readline_to_stream(out_stream, in_stream = io::stdin())
```

Reads a string, see `readline`, the data is passed to an outstream


---

#### `fprint`

```c3
<*
 @param out : `the stream to print to`
 @param x : `the value to print`
 @require @is_outstream(out) : `The output must implement OutStream.`
 @return `the number of bytes printed.`
*>
macro usz? fprint(out, x)
```

Print a value to a stream.


---

#### `fprintf`

```c3
<*
 @param [inout] out : `The OutStream to print to`
 @param [in] format : `The printf-style format string`
 @return `the number of characters printed`
*>
fn usz? fprintf(OutStream out, String format, args...) @format(1)
```

Prints using a 'printf'-style formatting string.
See `printf` for details on formatting.


---

#### `fprintfn`

```c3
<*
 @param [inout] out : `The OutStream to print to`
 @param [in] format : `The printf-style format string`
 @return `the number of characters printed`
*>
fn usz? fprintfn(OutStream out, String format, args...) @format(1) @maydiscard
```

Prints using a 'printf'-style formatting string,
appending '\n' at the end. See `printf`.


---

#### `fprintn`

```c3
<*
 @require @is_outstream(out) : "The output must implement OutStream"
*>
macro usz? fprintn(out, x = "")
```

---

#### `print`

```c3
macro void print(x)
```

Print any value to stdout.


---

#### `printn`

```c3
<*
 @param x : "The value to print"
*>
macro void printn(x = "")
```

Print any value to stdout, appending an '\n’ after.


---

#### `eprint`

```c3
macro void eprint(x)
```

Print any value to stderr.


---

#### `eprintn`

```c3
<*
 @param x : "The value to print"
*>
macro void eprintn(x = "")
```

Print any value to stderr, appending an '\n’ after.


---

#### `out_putstream_fn`

```c3
fn void? out_putstream_fn(void* data, char c) @private
```

---

#### `out_putchar_fn`

```c3
fn void? out_putchar_fn(void* data @unused, char c) @private
```

---

#### `printf`

```c3
<*
 @param [in] format : `The printf-style format string`
 @return `the number of characters printed`
*>
fn usz? printf(String format, args...) @format(0) @maydiscard
```

Prints using a 'printf'-style formatting string.
To print integer numbers, use "%d" or "%x"/"%X,
the latter gives the hexadecimal representation.

All types can be printed using "%s" which gives
the default representation of the value.

To create a custom output for a type, implement
the Printable interface.


---

#### `printfn`

```c3
<*
 @param [in] format : `The printf-style format string`
 @return `the number of characters printed`
*>
fn usz? printfn(String format, args...) @format(0) @maydiscard
```

Prints using a 'printf'-style formatting string,
appending '\n' at the end. See `printf`.


---

#### `eprintf`

```c3
<*
 @param [in] format : `The printf-style format string`
 @return `the number of characters printed`
*>
fn usz? eprintf(String format, args...) @maydiscard
```

Prints using a 'printf'-style formatting string
to stderr.


---

#### `eprintfn`

```c3
<*
 @param [in] format : `The printf-style format string`
 @return `the number of characters printed`
*>
fn usz? eprintfn(String format, args...) @maydiscard
```

Prints using a 'printf'-style formatting string,
to stderr appending '\n' at the end. See `printf`.


---

#### `bprintf`

```c3
<*
 @param [inout] buffer : `The buffer to print to`
 @param [in] format : `The printf-style format string`
 @return `a slice formed from the "buffer" with the resulting length.`
*>
fn char[]? bprintf(char[] buffer, String format, args...) @maydiscard
```

Prints using a 'printf'-style formatting string,
to a string buffer. See `printf`.


---

#### `out_buffer_fn`

```c3
fn void? out_buffer_fn(void *data, char c) @private
```

---

#### `available`

```c3
fn usz? available(InStream s)
```

---

#### `@is_instream`

```c3
macro bool @is_instream(#expr)
```

---

#### `@is_outstream`

```c3
macro bool @is_outstream(#expr)
```

---

#### `read_any`

```c3
<*
 @param [&out] ref
 @require @is_instream(stream) : "Expected a stream"
*>
macro usz? read_any(stream, any ref)
```

---

#### `write_any`

```c3
<*
 @param [&in] ref : "the object to write."
 @require @is_outstream(stream)
 @ensure return == ref.type.sizeof
*>
macro usz? write_any(stream, any ref)
```

---

#### `read_all`

```c3
<*
 @require @is_instream(stream)
*>
macro usz? read_all(stream, char[] buffer)
```

---

#### `read_fully`

```c3
<*
 @require @is_instream(stream)
*>
macro char[]? read_fully(Allocator allocator, stream)
```

---

#### `write_all`

```c3
<*
 @require @is_outstream(stream)
*>
macro usz? write_all(stream, char[] buffer)
```

---

#### `read_using_read_byte`

```c3
macro usz? read_using_read_byte(s, char[] buffer)
```

---

#### `write_byte_using_write`

```c3
macro void? write_byte_using_write(s, char c)
```

---

#### `read_byte_using_read`

```c3
macro char? read_byte_using_read(s)
```

---

#### `ReadByteFn`

```c3
alias ReadByteFn = fn char?()
```

---

#### `write_using_write_byte`

```c3
macro usz? write_using_write_byte(s, char[] bytes)
```

---

#### `pushback_using_seek`

```c3
macro void? pushback_using_seek(s)
```

---

#### `copy_to`

```c3
fn usz? copy_to(InStream in, OutStream dst, char[] buffer = {})
```

---

#### `copy_through_buffer`

```c3
macro usz? copy_through_buffer(InStream in, OutStream dst, char[] buffer) @local
```

---

#### `read_varint`

```c3
<*
 @require @is_instream(stream)
 @require @typekind(x_ptr) == POINTER && $typeof(x_ptr).inner.kindof.is_int()
*>
macro usz? read_varint(stream, x_ptr)
```

---

#### `write_varint`

```c3
<*
 @require @is_outstream(stream)
 @require @typekind(x).is_int()
*>
macro usz? write_varint(stream, x)
```

---

#### `read_be_ushort`

```c3
<*
 @require @is_instream(stream)
*>
macro ushort? read_be_ushort(stream)
```

---

#### `read_be_short`

```c3
<*
 @require @is_instream(stream)
*>
macro short? read_be_short(stream)
```

---

#### `write_be_short`

```c3
<*
 @require @is_outstream(stream)
*>
macro void? write_be_short(stream, ushort s)
```

---

#### `read_be_uint`

```c3
<*
 @require @is_instream(stream)
*>
macro uint? read_be_uint(stream)
```

---

#### `read_be_int`

```c3
<*
 @require @is_instream(stream)
*>
macro int? read_be_int(stream)
```

---

#### `write_be_int`

```c3
<*
 @require @is_outstream(stream)
*>
macro void? write_be_int(stream, uint s)
```

---

#### `read_be_ulong`

```c3
<*
 @require @is_instream(stream)
*>
macro ulong? read_be_ulong(stream)
```

---

#### `read_be_long`

```c3
<*
 @require @is_instream(stream)
*>
macro long? read_be_long(stream)
```

---

#### `write_be_long`

```c3
<*
 @require @is_outstream(stream)
*>
macro void? write_be_long(stream, ulong s)
```

---

#### `read_be_uint128`

```c3
<*
 @require @is_instream(stream)
*>
macro uint128? read_be_uint128(stream)
```

---

#### `read_be_int128`

```c3
<*
 @require @is_instream(stream)
*>
macro int128? read_be_int128(stream)
```

---

#### `write_be_int128`

```c3
<*
 @require @is_outstream(stream)
*>
macro void? write_be_int128(stream, uint128 s)
```

---

#### `write_tiny_bytearray`

```c3
<*
 @require @is_outstream(stream)
 @require data.len < 256 : "Data exceeded 255"
*>
macro usz? write_tiny_bytearray(stream, char[] data)
```

---

#### `read_tiny_bytearray`

```c3
<*
 @require @is_instream(stream)
*>
macro char[]? read_tiny_bytearray(stream, Allocator allocator)
```

---

#### `write_short_bytearray`

```c3
<*
 @require @is_outstream(stream)
 @require data.len < 0x1000 : "Data exceeded 65535"
*>
macro usz? write_short_bytearray(stream, char[] data)
```

---

#### `read_short_bytearray`

```c3
<*
 @require @is_instream(stream)
*>
macro char[]? read_short_bytearray(stream, Allocator allocator)
```

---

#### `wrap_bytes`

```c3
fn ByteReader wrap_bytes(char[] bytes)
```

Wrap bytes for reading using io functions.


---

#### `ReadBuffer`

```c3
struct ReadBuffer (InStream)
```

---

#### `ReadBuffer.init`

```c3
<*
 @param [inout] self
 @require bytes.len > 0
 @require self.bytes.len == 0 : "Init may not run on already initialized data"
*>
fn ReadBuffer* ReadBuffer.init(&self, InStream wrapped_stream, char[] bytes)
```

Buffer reads from a stream.


---

#### `ReadBuffer.str_view`

```c3
fn String ReadBuffer.str_view(&self) @inline
```

---

#### `ReadBuffer.close`

```c3
fn void? ReadBuffer.close(&self) @dynamic
```

---

#### `ReadBuffer.read`

```c3
fn usz? ReadBuffer.read(&self, char[] bytes) @dynamic
```

---

#### `ReadBuffer.read_byte`

```c3
fn char? ReadBuffer.read_byte(&self) @dynamic
```

---

#### `ReadBuffer.refill`

```c3
fn void? ReadBuffer.refill(&self) @local @inline
```

---

#### `WriteBuffer`

```c3
struct WriteBuffer (OutStream)
```

---

#### `WriteBuffer.init`

```c3
<*
 @param [inout] self
 @require bytes.len > 0 : "Non-empty buffer required"
 @require self.bytes.len == 0 : "Init may not run on already initialized data"
*>
fn WriteBuffer* WriteBuffer.init(&self, OutStream wrapped_stream, char[] bytes)
```

Buffer writes to a stream. Call `flush` when done writing to the buffer.


---

#### `WriteBuffer.str_view`

```c3
fn String WriteBuffer.str_view(&self) @inline
```

---

#### `WriteBuffer.close`

```c3
fn void? WriteBuffer.close(&self) @dynamic
```

---

#### `WriteBuffer.flush`

```c3
fn void? WriteBuffer.flush(&self) @dynamic
```

---

#### `WriteBuffer.write`

```c3
fn usz? WriteBuffer.write(&self, char[] bytes) @dynamic
```

---

#### `WriteBuffer.write_byte`

```c3
fn void? WriteBuffer.write_byte(&self, char c) @dynamic
```

---

#### `WriteBuffer.write_pending`

```c3
fn void? WriteBuffer.write_pending(&self) @local
```

---

#### `ByteBuffer`

```c3
struct ByteBuffer (InStream, OutStream)
```

---

#### `ByteBuffer.init`

```c3
<*
 @require self.bytes.len == 0 : "Buffer already initialized."
*>
fn ByteBuffer* ByteBuffer.init(&self, Allocator allocator, usz max_read, usz initial_capacity = 16)
```

ByteBuffer provides a streamable read/write buffer.
max_read defines how many bytes might be kept before its internal buffer is shrinked.


---

#### `ByteBuffer.tinit`

```c3
fn ByteBuffer* ByteBuffer.tinit(&self, usz max_read, usz initial_capacity = 16)
```

---

#### `ByteBuffer.init_with_buffer`

```c3
<*
 @require buf.len > 0
 @require self.bytes.len == 0 : "Buffer already initialized."
*>
fn ByteBuffer* ByteBuffer.init_with_buffer(&self, char[] buf)
```

---

#### `ByteBuffer.free`

```c3
fn void ByteBuffer.free(&self)
```

---

#### `ByteBuffer.write`

```c3
fn usz? ByteBuffer.write(&self, char[] bytes) @dynamic
```

---

#### `ByteBuffer.write_byte`

```c3
fn void? ByteBuffer.write_byte(&self, char c) @dynamic
```

---

#### `ByteBuffer.read`

```c3
fn usz? ByteBuffer.read(&self, char[] bytes) @dynamic
```

---

#### `ByteBuffer.read_byte`

```c3
fn char? ByteBuffer.read_byte(&self) @dynamic
```

---

#### `ByteBuffer.pushback_byte`

```c3
fn void? ByteBuffer.pushback_byte(&self) @dynamic
```

Only the last byte of a successful read can be pushed back.


---

#### `ByteBuffer.seek`

```c3
fn usz? ByteBuffer.seek(&self, isz offset, Seek seek) @dynamic
```

---

#### `ByteBuffer.available`

```c3
fn usz? ByteBuffer.available(&self) @inline @dynamic
```

---

#### `ByteBuffer.grow`

```c3
fn void ByteBuffer.grow(&self, usz n)
```

---

#### `ByteBuffer.shrink`

```c3
macro ByteBuffer.shrink(&self)
```

---

#### `ByteReader`

```c3
struct ByteReader (InStream)
```

---

#### `ByteReader.len`

```c3
fn usz ByteReader.len(&self) @dynamic
```

---

#### `ByteReader.init`

```c3
fn ByteReader* ByteReader.init(&self, char[] bytes)
```

---

#### `ByteReader.read`

```c3
fn usz? ByteReader.read(&self, char[] bytes) @dynamic
```

---

#### `ByteReader.read_byte`

```c3
fn char? ByteReader.read_byte(&self) @dynamic
```

---

#### `ByteReader.pushback_byte`

```c3
fn void? ByteReader.pushback_byte(&self) @dynamic
```

---

#### `ByteReader.seek`

```c3
fn usz? ByteReader.seek(&self, isz offset, Seek seek) @dynamic
```

---

#### `ByteReader.write_to`

```c3
fn usz? ByteReader.write_to(&self, OutStream writer) @dynamic
```

---

#### `ByteReader.available`

```c3
fn usz? ByteReader.available(&self) @inline @dynamic
```

---

#### `ByteWriter`

```c3
struct ByteWriter (OutStream)
```

---

#### `ByteWriter.init`

```c3
<*
 @param [&inout] self
 @param [&inout] allocator
 @require self.bytes.len == 0 : "Init may not run on already initialized data"
 @ensure (bool)allocator, self.index == 0
*>
fn ByteWriter* ByteWriter.init(&self, Allocator allocator)
```

---

#### `ByteWriter.tinit`

```c3
<*
 @param [&inout] self
 @require self.bytes.len == 0 : "Init may not run on already initialized data"
 @ensure self.index == 0
*>
fn ByteWriter* ByteWriter.tinit(&self)
```

---

#### `ByteWriter.init_with_buffer`

```c3
fn ByteWriter* ByteWriter.init_with_buffer(&self, char[] data)
```

---

#### `ByteWriter.destroy`

```c3
fn void? ByteWriter.destroy(&self) @dynamic
```

---

#### `ByteWriter.str_view`

```c3
fn String ByteWriter.str_view(&self) @inline
```

---

#### `ByteWriter.ensure_capacity`

```c3
fn void? ByteWriter.ensure_capacity(&self, usz len) @inline
```

---

#### `ByteWriter.write`

```c3
fn usz? ByteWriter.write(&self, char[] bytes) @dynamic
```

---

#### `ByteWriter.write_byte`

```c3
fn void? ByteWriter.write_byte(&self, char c) @dynamic
```

---

#### `ByteWriter.read_from`

```c3
<*
 @param [&inout] self
 @param reader
*>
fn usz? ByteWriter.read_from(&self, InStream reader) @dynamic
```

---

#### `LimitReader`

```c3
struct LimitReader (InStream)
```

---

#### `LimitReader.init`

```c3
<*
 @param [&inout] wrapped_stream : "The stream to read from"
 @param limit : "The max limit to read"
*>
fn LimitReader* LimitReader.init(&self, InStream wrapped_stream, usz limit)
```

---

#### `LimitReader.close`

```c3
fn void? LimitReader.close(&self) @dynamic
```

---

#### `LimitReader.read`

```c3
fn usz? LimitReader.read(&self, char[] bytes) @dynamic
```

---

#### `LimitReader.read_byte`

```c3
fn char? LimitReader.read_byte(&self) @dynamic
```

---

#### `LimitReader.available`

```c3
fn usz? LimitReader.available(&self) @inline @dynamic
```

---

#### `MultiReader`

```c3
struct MultiReader (InStream)
```

---

#### `MultiReader.init`

```c3
<*
 @param [&inout] self
 @param [&inout] allocator
 @require self.readers.len == 0 : "Init may not run on already initialized data"
 @ensure self.index == 0
*>
fn MultiReader* MultiReader.init(&self, Allocator allocator, InStream... readers)
```

---

#### `MultiReader.tinit`

```c3
<*
 @param [&inout] self
 @require self.readers.len == 0 : "Init may not run on already initialized data"
 @ensure self.index == 0
*>
fn MultiReader* MultiReader.tinit(&self, InStream... readers)
```

---

#### `MultiReader.free`

```c3
fn void MultiReader.free(&self)
```

---

#### `MultiReader.read`

```c3
fn usz? MultiReader.read(&self, char[] bytes) @dynamic
```

---

#### `MultiReader.read_byte`

```c3
fn char? MultiReader.read_byte(&self) @dynamic
```

---

#### `MultiWriter`

```c3
struct MultiWriter (OutStream)
```

---

#### `MultiWriter.init`

```c3
<*
 @param [&inout] self
 @param [&inout] allocator
 @require writers.len > 0
 @require self.writers.len == 0 : "Init may not run on already initialized data"
*>
fn MultiWriter* MultiWriter.init(&self, Allocator allocator, OutStream... writers)
```

---

#### `MultiWriter.tinit`

```c3
<*
 @param [&inout] self
 @require writers.len > 0
 @require self.writers.len == 0 : "Init may not run on already initialized data"
*>
fn MultiWriter* MultiWriter.tinit(&self, OutStream... writers)
```

---

#### `MultiWriter.free`

```c3
fn void MultiWriter.free(&self)
```

---

#### `MultiWriter.write`

```c3
fn usz? MultiWriter.write(&self, char[] bytes) @dynamic
```

---

#### `MultiWriter.write_byte`

```c3
fn void? MultiWriter.write_byte(&self, char c) @dynamic
```

---

#### `Scanner`

```c3
struct Scanner (InStream)
```

---

#### `Scanner.init`

```c3
<*
 @param [&in] stream : "The stream to read data from."
 @require buffer.len > 0 : "Non-empty buffer required."
*>
fn void Scanner.init(&self, InStream stream, char[] buffer)
```

Scanner provides a way to read delimited data (with newlines as the default).
The supplied buffer must be at least as large as the expected data length
including its pattern.


---

#### `Scanner.flush`

```c3
fn char[] Scanner.flush(&self) @dynamic
```

Return and clear any remaining unscanned data.


---

#### `Scanner.close`

```c3
fn void? Scanner.close(&self) @dynamic
```

---

#### `Scanner.scan`

```c3
<*
 @require pattern.len > 0 : "Non-empty pattern required."
 @require self.buf.len > pattern.len : "Pattern too large."
*>
fn char[]? Scanner.scan(&self, String pattern = "\n")
```

Scan the stream for the next split character and return data up to the match.


---

#### `Scanner.find`

```c3
macro usz? Scanner.find(&self, buf, pattern) @private
```

---

#### `Scanner.refill`

```c3
macro usz? Scanner.refill(&self, buf) @private
```

---

#### `Scanner.read`

```c3
fn usz? Scanner.read(&self, char[] bytes) @dynamic
```

---

#### `Scanner.read_byte`

```c3
fn char? Scanner.read_byte(&self) @dynamic
```

---

#### `TeeReader`

```c3
struct TeeReader (InStream)
```

---

#### `tee_reader`

```c3
<*
 @param [&inout] r : "Stream r to read from."
 @param [&inout] w : "Stream w to write to what it reads from r."
*>
macro TeeReader tee_reader(InStream r, OutStream w)
```

Returns a reader that implements InStream and that will write any data read
from the wrapped reader r to the writer w. There is no internal buffering.


---

#### `TeeReader.init`

```c3
<*
 @param [&inout] self
 @param [&inout] r : "Stream r to read from."
 @param [&inout] w : "Stream w to write to what it reads from r."
*>
fn TeeReader* TeeReader.init(&self, InStream r, OutStream w)
```

---

#### `TeeReader.read`

```c3
fn usz? TeeReader.read(&self, char[] bytes) @dynamic
```

---

#### `TeeReader.read_byte`

```c3
fn char? TeeReader.read_byte(&self) @dynamic
```
### `std::io @if (env::LIBC)`

---

#### `putchar`

```c3
fn void putchar(char c) @inline
```

Libc `putchar`, prints a single character to stdout.


---

#### `stdout`

```c3
<*
 @return `stdout as a File`
*>
fn File* stdout()
```

Get standard out.


---

#### `stderr`

```c3
<*
 @return `stderr as a File`
*>
fn File* stderr()
```

Get standard err.


---

#### `stdin`

```c3
<*
 @return `stdin as a File`
*>
fn File* stdin()
```

Get standard in.

### `std::io @if(!env::LIBC)`

---

#### `putchar`

```c3
fn void putchar(char c) @inline
```

---

#### `stdout`

```c3
fn File* stdout()
```

---

#### `stderr`

```c3
fn File* stderr()
```

---

#### `stdin`

```c3
fn File* stdin()
```
### `std::io::file`

---

#### `open`

```c3
fn File? open(String filename, String mode)
```

---

#### `open_path`

```c3
fn File? open_path(Path path, String mode)
```

---

#### `exists`

```c3
fn bool exists(String file)
```

---

#### `from_handle`

```c3
fn File from_handle(CFile file)
```

---

#### `is_file`

```c3
fn bool is_file(String path)
```

---

#### `is_dir`

```c3
fn bool is_dir(String path)
```

---

#### `get_size`

```c3
fn usz? get_size(String path)
```

---

#### `delete`

```c3
fn void? delete(String filename)
```

---

#### `File.reopen`

```c3
<*
 @require self.file != null
*>
fn void? File.reopen(&self, String filename, String mode)
```

---

#### `File.seek`

```c3
<*
 @require self.file != null
*>
fn usz? File.seek(&self, isz offset, Seek seek_mode = Seek.SET) @dynamic
```

---

#### `File.write_byte`

```c3
<*
 @require self.file != null
*>
fn void? File.write_byte(&self, char c) @dynamic
```

---

#### `File.close`

```c3
<*
 @param [&inout] self
*>
fn void? File.close(&self) @inline @dynamic
```

---

#### `File.eof`

```c3
<*
 @require self.file != null
*>
fn bool File.eof(&self) @inline
```

---

#### `File.read`

```c3
<*
 @param [in] buffer
*>
fn usz? File.read(&self, char[] buffer) @dynamic
```

---

#### `File.write`

```c3
<*
 @param [out] buffer
 @require self.file != null : `File must be initialized`
*>
fn usz? File.write(&self, char[] buffer) @dynamic
```

---

#### `File.fd`

```c3
fn Fd File.fd(self) @if(env::LIBC)
```

---

#### `File.isatty`

```c3
fn bool File.isatty(self) @if(env::LIBC)
```

---

#### `File.read_byte`

```c3
fn char? File.read_byte(&self) @dynamic
```

---

#### `load_buffer`

```c3
<*
 @param filename : "The path to the file to read"
 @param [in] buffer : "The buffer to read to"
*>
fn char[]? load_buffer(String filename, char[] buffer)
```

Load up to buffer.len characters. Returns io::OVERFLOW if the file is longer
than the buffer.


---

#### `load`

```c3
fn char[]? load(Allocator allocator, String filename)
```

---

#### `load_path`

```c3
fn char[]? load_path(Allocator allocator, Path path)
```

---

#### `load_temp`

```c3
fn char[]? load_temp(String filename)
```

---

#### `load_path_temp`

```c3
fn char[]? load_path_temp(Path path)
```

---

#### `save`

```c3
fn void? save(String filename, char[] data)
```

---

#### `File.flush`

```c3
<*
 @require self.file != null : `File must be initialized`
*>
fn void? File.flush(&self) @dynamic
```
### `std::io::file @if(env::LIBC &&& env::POSIX)`

---

#### `mmap_file`

```c3
<*
 @param file : "Already opened file created on the caller scope"
 @param offset : "Byte offset in file, will be rounded down to page size"
 @param len : "Size in bytes to map starting from offset, will be rounded up to page size"
 @return? mem::OUT_OF_MEMORY, vm::ACCESS_DENIED, vm::RANGE_OVERFLOW, vm::INVALID_ARGS, vm::UNKNOWN_ERROR, io::NO_PERMISSION, io::FILE_NOT_VALID, io::WOULD_BLOCK, io::FILE_NOT_FOUND
 @return "Memory mapped region. Must be released with FileMmap.destroy(). Provided File will not be closed"
*>
fn mmap::FileMmap? mmap_file(File file, usz offset = 0, usz len = 0, vm::VirtualMemoryAccess access = READ, bool shared = false)
```

Maps a region of an already-opened file into memory


---

#### `mmap_open`

```c3
<*
 @param filename : "File path"
 @param mode : "File opening mode"
 @param offset : "Byte offset in file, will be rounded down to page size"
 @param len : "Size in bytes to map starting from offset, will be rounded up to page size"
 @return? mem::OUT_OF_MEMORY, vm::ACCESS_DENIED, vm::RANGE_OVERFLOW, vm::INVALID_ARGS, vm::UNKNOWN_ERROR, io::NO_PERMISSION, io::FILE_NOT_VALID, io::WOULD_BLOCK, io::FILE_NOT_FOUND
 @return "Memory mapped region. Must be released with FileMmap.destroy()"
*>
fn mmap::FileMmap? mmap_open(String filename, String mode, usz offset = 0, usz len = 0, vm::VirtualMemoryAccess access = READ, bool shared = false)
```

Maps a region of the given file into memory

### `std::io::file::mmap @if(env::LIBC &&& env::POSIX)`

---

#### `FileMmap`

```c3
struct FileMmap
```

---

#### `FileMmap.bytes`

```c3
<*
 @return "Slice of the mapped range where the first byte matches the file's byte at the offset specified to File::file_mmap()"
*>
fn char[] FileMmap.bytes(&self)
```

Provides a slice of bytes to the expected mapped range discarding the extra bytes due to misaligment of offset and/or size.


---

#### `FileMmap.destroy`

```c3
fn void? FileMmap.destroy(&self) @maydiscard
```

Destroys the underlyng VirtualMemory object ie. calls munmap()"

### `std::io::os`

---

#### `native_chdir`

```c3
macro void? native_chdir(Path path)
```

---

#### `native_stat`

```c3
fn void? native_stat(Stat* stat, String path) @if(env::DARWIN || env::LINUX || env::ANDROID || env::BSD_FAMILY)
```

---

#### `native_file_size`

```c3
fn usz? native_file_size(String path) @if(env::WIN32)
```
```c3
fn usz? native_file_size(String path) @if(!env::WIN32 && !env::DARWIN)
```
```c3
fn usz? native_file_size(String path) @if(env::DARWIN)
```

---

#### `native_file_or_dir_exists`

```c3
fn bool native_file_or_dir_exists(String path)
```

---

#### `native_is_file`

```c3
fn bool native_is_file(String path)
```

---

#### `native_is_dir`

```c3
fn bool native_is_dir(String path)
```

---

#### `getcwd`

```c3
macro String? getcwd(Allocator allocator)
```

---

#### `native_mkdir`

```c3
macro bool? native_mkdir(Path path, MkdirPermissions permissions)
```

---

#### `native_rmdir`

```c3
macro bool? native_rmdir(Path path)
```
### `std::io::os @if(env::LIBC)`

---

#### `native_fopen`

```c3
<*
 @require mode.len > 0
 @require filename.len > 0
*>
fn void*? native_fopen(String filename, String mode) @inline
```

---

#### `native_remove`

```c3
fn void? native_remove(String filename)
```

---

#### `native_freopen`

```c3
<*
 @require mode.len > 0
 @require filename.len > 0
*>
fn void*? native_freopen(void* file, String filename, String mode) @inline
```

---

#### `native_fseek`

```c3
fn void? native_fseek(void* file, isz offset, Seek seek_mode) @inline
```

---

#### `native_ftell`

```c3
fn usz? native_ftell(CFile file) @inline
```

---

#### `native_fwrite`

```c3
fn usz? native_fwrite(CFile file, char[] buffer) @inline
```

---

#### `native_fputc`

```c3
fn void? native_fputc(CInt c, CFile stream) @inline
```

---

#### `native_fread`

```c3
fn usz? native_fread(CFile file, char[] buffer) @inline
```

---

#### `file_open_errno`

```c3
macro fault file_open_errno() @local
```

---

#### `file_seek_errno`

```c3
macro fault file_seek_errno() @local
```

---

#### `native_temp_directory`

```c3
fn Path? native_temp_directory(Allocator allocator) @if(!env::WIN32)
```
```c3
fn Path? native_temp_directory(Allocator allocator) @if(env::WIN32)
```
### `std::io::os @if(env::NO_LIBC)`

---

#### `FopenFn`

```c3
alias FopenFn = fn void*?(String, String)
```

---

#### `FreopenFn`

```c3
alias FreopenFn = fn void*?(void*, String, String)
```

---

#### `FcloseFn`

```c3
alias FcloseFn = fn void?(void*)
```

---

#### `FseekFn`

```c3
alias FseekFn = fn void?(void*, isz, Seek)
```

---

#### `FtellFn`

```c3
alias FtellFn = fn usz?(void*)
```

---

#### `FwriteFn`

```c3
alias FwriteFn = fn usz?(void*, char[] buffer)
```

---

#### `FreadFn`

```c3
alias FreadFn = fn usz?(void*, char[] buffer)
```

---

#### `RemoveFn`

```c3
alias RemoveFn = fn void?(String)
```

---

#### `FputcFn`

```c3
alias FputcFn = fn void?(int, void*)
```

---

#### `@if`

```c3
fn @weak @if(!$defined(native_fopen_fn))
```

---

#### `native_remove`

```c3
<*
 @require filename.len > 0
*>
fn void? native_remove(String filename) @inline
```

Delete a file.


---

#### `native_freopen`

```c3
<*
 @require mode.len > 0
 @require filename.len > 0
*>
fn void*? native_freopen(void* file, String filename, String mode) @inline
```

---

#### `native_fseek`

```c3
fn void? native_fseek(void* file, isz offset, Seek seek_mode) @inline
```

---

#### `native_ftell`

```c3
fn usz? native_ftell(CFile file) @inline
```

---

#### `native_fwrite`

```c3
fn usz? native_fwrite(CFile file, char[] buffer) @inline
```

---

#### `native_fread`

```c3
fn usz? native_fread(CFile file, char[] buffer) @inline
```

---

#### `native_fputc`

```c3
fn void? native_fputc(CInt c, CFile stream) @inline
```

---

#### `native_temp_directory`

```c3
macro Path? native_temp_directory(Allocator allocator)
```
### `std::io::os @if(env::POSIX)`

---

#### `native_ls`

```c3
fn PathList? native_ls(Path dir, bool no_dirs, bool no_symlinks, String mask, Allocator allocator)
```

---

#### `native_rmtree`

```c3
<*
 @require dir.str_view().len > 0
*>
fn void? native_rmtree(Path dir)
```
### `std::io::os @if(env::WIN32)`

---

#### `native_ls`

```c3
fn PathList? native_ls(Path dir, bool no_dirs, bool no_symlinks, String mask, Allocator allocator)
```

---

#### `native_rmtree`

```c3
fn void? native_rmtree(Path path)
```
### `std::io::path`

---

#### `DEFAULT_ENV`

```c3
const PathEnv DEFAULT_ENV = env::WIN32 ? PathEnv.WIN32 : PathEnv.POSIX
```

---

#### `PREFERRED_SEPARATOR_WIN32`

```c3
const char PREFERRED_SEPARATOR_WIN32 = '\\'
```

---

#### `PREFERRED_SEPARATOR_POSIX`

```c3
const char PREFERRED_SEPARATOR_POSIX = '/'
```

---

#### `PREFERRED_SEPARATOR`

```c3
const char PREFERRED_SEPARATOR = env::WIN32 ? PREFERRED_SEPARATOR_WIN32 : PREFERRED_SEPARATOR_POSIX
```

---

#### `PathList`

```c3
alias PathList = List { Path }
```

---

#### `INVALID_PATH, NO_PARENT`

```c3
faultdef INVALID_PATH, NO_PARENT
```

---

#### `Path`

```c3
alias Path = PathImp
```

---

#### `PathImp`

```c3
struct PathImp (Printable)
```

---

#### `PathEnv`

```c3
enum PathEnv
```

---

#### `cwd`

```c3
fn Path? cwd(Allocator allocator)
```

---

#### `is_dir`

```c3
fn bool is_dir(Path path)
```

---

#### `is_file`

```c3
fn bool is_file(Path path)
```

---

#### `file_size`

```c3
fn usz? file_size(Path path)
```

---

#### `exists`

```c3
fn bool exists(Path path)
```

---

#### `tcwd`

```c3
fn Path? tcwd()
```

---

#### `chdir`

```c3
<*
 @require @is_pathlike(path) : "Expected a Path or String to chdir"
*>
macro void? chdir(path)
```

---

#### `temp_directory`

```c3
fn Path? temp_directory(Allocator allocator)
```

---

#### `delete`

```c3
fn void? delete(Path path)
```

---

#### `@is_pathlike`

```c3
macro bool @is_pathlike(#path)
```

---

#### `is_separator`

```c3
macro bool is_separator(char c, PathEnv path_env = DEFAULT_ENV)
```

---

#### `is_posix_separator`

```c3
macro bool is_posix_separator(char c)
```

---

#### `is_win32_separator`

```c3
macro bool is_win32_separator(char c)
```

---

#### `ls`

```c3
fn PathList? ls(Allocator allocator, Path dir, bool no_dirs = false, bool no_symlinks = false, String mask = "")
```

---

#### `MkdirPermissions`

```c3
enum MkdirPermissions
```

---

#### `mkdir`

```c3
<*
 @param path : `The path to create`
 @require @is_pathlike(path) : "Expected a Path or String to chdir"
 @param recursive : `If directories in between should be created if they're missing, defaults to false`
 @param permissions : `The permissions to set on the directory`
*>
macro bool? mkdir(path, bool recursive = false, MkdirPermissions permissions = NORMAL)
```

Create a directory on a given path, optionally recursive.


---

#### `rmdir`

```c3
<*
 @param path : `The path to delete`
 @require @is_pathlike(path) : "Expected a Path or String to chdir"
 @return `true if there was a directory to delete, false otherwise`
 @return? INVALID_PATH : `if the path was invalid`
*>
macro bool? rmdir(path)
```

Tries to delete directory, which must be empty.


---

#### `rmtree`

```c3
fn void? rmtree(Path path)
```

Like [rmdir] but deletes a directory even if it contains items.


---

#### `new`

```c3
<*
 @return? INVALID_PATH : `if the path was invalid`
*>
fn Path? new(Allocator allocator, String path, PathEnv path_env = DEFAULT_ENV)
```

Creates a new path.


---

#### `temp`

```c3
<*
 @return? INVALID_PATH : `if the path was invalid`
*>
fn Path? temp(String path, PathEnv path_env = DEFAULT_ENV)
```

Creates a new path using the temp allocator.


---

#### `from_wstring`

```c3
fn Path? from_wstring(Allocator allocator, WString path)
```

---

#### `from_win32_wstring`

```c3
fn Path? from_win32_wstring(Allocator allocator, WString path) @deprecated("Use 'from_wstring' instead")
```

---

#### `for_windows`

```c3
fn Path? for_windows(Allocator allocator, String path)
```

---

#### `for_posix`

```c3
fn Path? for_posix(Allocator allocator, String path)
```

---

#### `Path.equals`

```c3
fn bool Path.equals(self, Path p2) @operator(==)
```

---

#### `Path.append`

```c3
<*
 @param [in] filename
*>
fn Path? Path.append(self, Allocator allocator, String filename)
```

Append the string to the current path.


---

#### `Path.tappend`

```c3
fn Path? Path.tappend(self, String filename)
```

---

#### `start_of_base_name`

```c3
fn usz? start_of_base_name(String str, PathEnv path_env) @local
```

---

#### `String.is_absolute_path`

```c3
fn bool? String.is_absolute_path(self)
```

---

#### `Path.is_absolute`

```c3
fn bool? Path.is_absolute(self)
```

---

#### `String.to_absolute_path`

```c3
fn Path? String.to_absolute_path(self, Allocator allocator)
```

---

#### `Path.absolute`

```c3
<*
 @require self.env == DEFAULT_ENV : "This method is only available on native paths"
*>
fn Path? Path.absolute(self, Allocator allocator)
```

---

#### `String.file_basename`

```c3
fn String? String.file_basename(self, Allocator allocator)
```

---

#### `String.file_tbasename`

```c3
fn String? String.file_tbasename(self)
```

---

#### `Path.basename`

```c3
fn String Path.basename(self)
```

---

#### `String.path_tdirname`

```c3
fn String? String.path_tdirname(self)
```

---

#### `String.path_dirname`

```c3
fn String? String.path_dirname(self, Allocator allocator)
```

---

#### `Path.dirname`

```c3
fn String Path.dirname(self)
```

---

#### `Path.has_extension`

```c3
<*
 @param [in] extension : `The extension name (not including the leading '.')`
 @require extension.len > 0 : `The extension cannot be empty`
 @return `true if the extension matches`
*>
fn bool Path.has_extension(self, String extension)
```

Test if the path has the given extension, so given the path /foo/bar.c3
this would be true matching the extension "c3"


---

#### `Path.extension`

```c3
fn String? Path.extension(self)
```

---

#### `Path.volume_name`

```c3
fn String Path.volume_name(self)
```

---

#### `String.to_path`

```c3
fn Path? String.to_path(self, Allocator allocator)
```

---

#### `String.to_tpath`

```c3
fn Path? String.to_tpath(self)
```

---

#### `volume_name_len`

```c3
fn usz? volume_name_len(String path, PathEnv path_env) @local
```

---

#### `Path.parent`

```c3
<*
 @return `The parent of the path as a non-allocated path`
 @return? NO_PARENT : `if this path does not have a parent`
*>
fn Path? Path.parent(self)
```

Get the path of the parent. This does not allocate, but returns a slice
of the path itself.


---

#### `normalize`

```c3
fn String? normalize(String path_str, PathEnv path_env = DEFAULT_ENV)
```

---

#### `Path.as_zstr`

```c3
fn ZString Path.as_zstr(self) @deprecated
```

---

#### `Path.root_directory`

```c3
fn String Path.root_directory(self)
```

---

#### `PathWalker`

```c3
alias PathWalker = fn bool? (Path, bool is_dir, void*)
```

---

#### `Path.walk`

```c3
<*
 @require self.env == DEFAULT_ENV : "This method is only available on native paths"
*>
fn bool? Path.walk(self, PathWalker w, void* data)
```

Walk the path recursively. PathWalker is run on every file and
directory found. Return true to abort the walk.


---

#### `TraverseCallback`

```c3
alias TraverseCallback = fn bool? (Path, bool is_dir, any data)
```

---

#### `traverse`

```c3
<*
 @require path.env == DEFAULT_ENV : "This method is only available on native paths"
*>
fn bool? traverse(Path path, TraverseCallback callback, any data)
```

Walk the path recursively. TraverseCallback is run for every file and
directory found. Return true to abort the walk.


---

#### `Path.str_view`

```c3
fn String Path.str_view(self) @inline
```

---

#### `Path.has_suffix`

```c3
fn bool Path.has_suffix(self, String str)
```

---

#### `Path.free`

```c3
<*
 @require self.allocator != null : "This Path should never be freed"
*>
fn void Path.free(self)
```

---

#### `Path.to_format`

```c3
fn usz? Path.to_format(&self, Formatter* formatter) @dynamic
```

---

#### `RESERVED_PATH_CHAR_POSIX`

```c3
const bool[256] RESERVED_PATH_CHAR_POSIX = {
	[0] = true,
	['/'] = true,
}
```

---

#### `RESERVED_PATH_CHAR_WIN32`

```c3
const bool[256] RESERVED_PATH_CHAR_WIN32 = {
	[0..31] = true,
	['>'] = true,
	['<'] = true,
	[':'] = true,
	['\"'] = true,
	['/'] = true,
	['\\'] = true,
	['|'] = true,
	['?'] = true,
	['*'] = true,
}
```

---

#### `is_reserved_win32_path_char`

```c3
macro bool is_reserved_win32_path_char(char c)
```

---

#### `is_reserved_path_char`

```c3
macro bool is_reserved_path_char(char c, PathEnv path_env = DEFAULT_ENV)
```

---

#### `_mkdir`

```c3
fn bool? _mkdir(Path path, bool recursive = false, MkdirPermissions permissions = NORMAL) @private
```

---

#### `_rmdir`

```c3
fn bool? _rmdir(Path path) @private
```
### `std::math`

---

#### `Complexf`

```c3
alias Complexf = Complex {float}
```

---

#### `Complex`

```c3
alias Complex = Complex {double}
```

---

#### `COMPLEX_IDENTITY`

```c3
alias COMPLEX_IDENTITY  @builtin = complex::IDENTITY {double}
```

---

#### `COMPLEXF_IDENTITY`

```c3
alias COMPLEXF_IDENTITY @builtin = complex::IDENTITY {float}
```

---

#### `IMAGINARY`

```c3
alias IMAGINARY @builtin @deprecated("Use I") = complex::IMAGINARY { double }
```

---

#### `IMAGINARYF`

```c3
alias IMAGINARYF @builtin @deprecated("Use I_F") = complex::IMAGINARY { float }
```

---

#### `I`

```c3
alias I @builtin = complex::IMAGINARY { double }
```

---

#### `I_F`

```c3
alias I_F @builtin = complex::IMAGINARY { float }
```

---

#### `E`

```c3
const E = 2.718281828459045235360287471352662497757247093699959574966967627724076630353547594571382178525166427427466
```

---

#### `LOG2E`

```c3
const LOG2E = 1.44269504088896340735992468100189214
```

---

#### `LOG10E`

```c3
const LOG10E = 0.434294481903251827651128918916605082
```

---

#### `LN2`

```c3
const LN2 = 0.693147180559945309417232121458176568
```

---

#### `LN10`

```c3
const LN10 = 2.30258509299404568401799145468436421
```

---

#### `PI`

```c3
const PI = 3.14159265358979323846264338327950288419716939937510
```

---

#### `PI_2`

```c3
const PI_2 = 1.57079632679489661923132169163975144
```

---

#### `PI_4`

```c3
const PI_4 = 0.785398163397448309615660845819875721
```

---

#### `DIV_PI`

```c3
const DIV_PI = 0.318309886183790671537767526745028724
```

---

#### `DIV_2_PI`

```c3
const DIV_2_PI = 0.636619772367581343075535053490057448
```

---

#### `DIV_2_SQRTPI`

```c3
const DIV_2_SQRTPI = 1.12837916709551257389615890312154517
```

---

#### `SQRT2`

```c3
const SQRT2 = 1.41421356237309504880168872420969808
```

---

#### `DIV_1_SQRT2`

```c3
const double DIV_1_SQRT2 = 0.707106781186547524400844362104849039
```

---

#### `HALF_MAX`

```c3
const HALF_MAX = 6.5504e+4
```

---

#### `HALF_MIN`

```c3
const HALF_MIN = 6.103515625e-5
```

---

#### `HALF_DENORM_MIN`

```c3
const HALF_DENORM_MIN = 5.9604644775390625e-8
```

---

#### `HALF_DIG`

```c3
const HALF_DIG = 3
```

---

#### `HALF_DEC_DIGITS`

```c3
const HALF_DEC_DIGITS = 5
```

---

#### `HALF_MANT_DIG`

```c3
const HALF_MANT_DIG = 11
```

---

#### `HALF_MAX_10_EXP`

```c3
const HALF_MAX_10_EXP = 4
```

---

#### `HALF_MIN_10_EXP`

```c3
const HALF_MIN_10_EXP = -4
```

---

#### `HALF_MAX_EXP`

```c3
const HALF_MAX_EXP = 16
```

---

#### `HALF_MIN_EXP`

```c3
const HALF_MIN_EXP = -13
```

---

#### `HALF_EPSILON`

```c3
const HALF_EPSILON = 9.765625e-4
```

---

#### `FLOAT_MAX`

```c3
const FLOAT_MAX = 0x1.fffffep+127
```

---

#### `FLOAT_MIN`

```c3
const FLOAT_MIN = 1.17549435e-38
```

---

#### `FLOAT_DENORM_MIN`

```c3
const FLOAT_DENORM_MIN = 1.40129846432481707092e-45
```

---

#### `FLOAT_DIG`

```c3
const FLOAT_DIG = 6
```

---

#### `FLOAT_DEC_DIGITS`

```c3
const FLOAT_DEC_DIGITS = 9
```

---

#### `FLOAT_MANT_DIG`

```c3
const FLOAT_MANT_DIG = 24
```

---

#### `FLOAT_MAX_10_EXP`

```c3
const FLOAT_MAX_10_EXP = 38
```

---

#### `FLOAT_MIN_10_EXP`

```c3
const FLOAT_MIN_10_EXP = -37
```

---

#### `FLOAT_MAX_EXP`

```c3
const FLOAT_MAX_EXP = 128
```

---

#### `FLOAT_MIN_EXP`

```c3
const FLOAT_MIN_EXP = -125
```

---

#### `FLOAT_EPSILON`

```c3
const FLOAT_EPSILON = 1.1920928955078125e-07
```

---

#### `DOUBLE_MAX`

```c3
const DOUBLE_MAX = 1.79769313486231570815e+308
```

---

#### `DOUBLE_MIN`

```c3
const DOUBLE_MIN = 2.2250738585072014e-308
```

---

#### `DOUBLE_DENORM_MIN`

```c3
const DOUBLE_DENORM_MIN = 4.94065645841246544177e-324
```

---

#### `DOUBLE_DIG`

```c3
const DOUBLE_DIG = 15
```

---

#### `DOUBLE_DEC_DIGITS`

```c3
const DOUBLE_DEC_DIGITS = 17
```

---

#### `DOUBLE_MANT_DIG`

```c3
const DOUBLE_MANT_DIG = 53
```

---

#### `DOUBLE_MAX_10_EXP`

```c3
const DOUBLE_MAX_10_EXP = 308
```

---

#### `DOUBLE_MIN_10_EXP`

```c3
const DOUBLE_MIN_10_EXP = -307
```

---

#### `DOUBLE_MAX_EXP`

```c3
const DOUBLE_MAX_EXP = 1024
```

---

#### `DOUBLE_MIN_EXP`

```c3
const DOUBLE_MIN_EXP = -1021
```

---

#### `DOUBLE_EPSILON`

```c3
const DOUBLE_EPSILON = 2.22044604925031308085e-16
```

---

#### `RoundingMode`

```c3
enum RoundingMode : int
```

---

#### `OVERFLOW, MATRIX_INVERSE_DOESNT_EXIST`

```c3
faultdef OVERFLOW, MATRIX_INVERSE_DOESNT_EXIST
```

---

#### `deg_to_rad`

```c3
<*
 @require types::is_numerical($typeof(x)) : `The input must be a numerical value or numerical vector`
*>
macro deg_to_rad(x)
```

---

#### `abs`

```c3
<*
 @require types::is_numerical($typeof(x)) : `The input must be a numerical value or numerical vector`
*>
macro abs(x)
```

---

#### `is_approx`

```c3
<*
 @require values::@is_int(x) || values::@is_float(x) : "Expected an integer or floating point value"
 @require values::@is_int(y) || values::@is_float(y) : "Expected an integer or floating point value"
*>
macro is_approx(x, y, eps)
```

---

#### `is_approx_rel`

```c3
<*
 @require values::@is_int(x) || values::@is_float(x) : "Expected an integer or floating point value"
 @require values::@is_int(y) || values::@is_float(y) : "Expected an integer or floating point value"
*>
macro is_approx_rel(x, y, eps)
```

---

#### `sign`

```c3
<*
 @require values::@is_int(x) : `The input must be an integer`
*>
macro sign(x)
```

---

#### `atan2`

```c3
<*
 @require values::@is_int(x) || values::@is_float(x) : "Expected an integer or floating point value"
 @require values::@is_int(y) || values::@is_float(y) : "Expected an integer or floating point value"
*>
macro atan2(x, y)
```

---

#### `sincos_ref`

```c3
<*
 @require values::@is_int(x) || values::@is_float(x) : "Expected an integer or floating point value"
 @require @typekind(sinp) == POINTER : "Expected sinp to be a pointer"
 @require values::@is_same_type(sinp, cosp) : "Expected sinp and cosp to have the same type"
 @require @assignable_to(x, $typeof(*sinp)) : "Expected x and sinp/cosp to have the same type"
*>
macro sincos_ref(x, sinp, cosp)
```

---

#### `sincos`

```c3
<*
 @param x : `the angle in radians`
 @require values::@is_int(x) || values::@is_float(x) : "Expected an integer or floating point value"
*>
macro sincos(x)
```

Return a vector with sin / cos of the given angle.


---

#### `atan`

```c3
<*
 @require values::@is_int(x) || values::@is_float(x) : "Expected an integer or floating point value"
*>
macro atan(x)
```

---

#### `atanh`

```c3
<*
 @require values::@is_int(x) || values::@is_float(x) : "Expected an integer or floating point value"
*>
macro atanh(x)
```

---

#### `acos`

```c3
<*
 @require values::@is_int(x) || values::@is_float(x) : "Expected an integer or floating point value"
*>
macro acos(x)
```

---

#### `acosh`

```c3
<*
 @require values::@is_int(x) || values::@is_float(x) : "Expected an integer or floating point value"
*>
macro acosh(x)
```

---

#### `asin`

```c3
<*
 @require values::@is_int(x) || values::@is_float(x) : "Expected an integer or floating point value"
*>
macro asin(x)
```

---

#### `asinh`

```c3
<*
 @require values::@is_int(x) || values::@is_float(x) : "Expected an integer or floating point value"
*>
macro asinh(x)
```

---

#### `ceil`

```c3
<*
 @require values::@is_floatlike(x) : `The input must be a floating point value or float vector`
*>
macro ceil(x)
```

---

#### `@ceil`

```c3
<*
 @require @typeis($input, double) || @typeis($input, float) : "Only float and double may be used"
*>
macro @ceil($input) @const
```

Ceil for compile time evaluation.


---

#### `clamp`

```c3
<*
 @param x : "the value to clamp, may be a number or a numerical vector."
 @param lower : "the lower bounds"
 @param upper : "the upper bounds"
 @return "lower if x < lower, upper if x > upper, otherwise return x."
 @require types::is_numerical($typeof(x)) : `The input must be a numerical value or numerical vector`
 @require values::@assign_to(lower, x) : `The lower bound must be convertable to the value type.`
 @require values::@assign_to(upper, x) : `The upper bound must be convertable to the value type.`
*>
macro clamp(x, lower, upper)
```

Constrain the value to lie within the given interval.


---

#### `copysign`

```c3
<*
 @require values::@is_promotable_to_floatlike(mag) : `The input must be a number value or float vector`
 @require $defined(($typeof(values::promote_int(mag)))mag) : `It's not possible to cast the sign to the type of the magnitude`
*>
macro copysign(mag, sgn)
```

---

#### `cos`

```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number value or float vector`
*>
macro cos(x)
```

---

#### `cosec`

```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number value or float vector`
*>
macro cosec(x)
```

---

#### `cosech`

```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number value or float vector`
*>
macro cosech(x)
```

---

#### `cosh`

```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number value or float vector`
*>
macro cosh(x)
```

---

#### `cotan`

```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number value or float vector`
*>
macro cotan(x)
```

---

#### `cotanh`

```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number value or float vector`
*>
macro cotanh(x)
```

---

#### `exp`

```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number value or float vector`
*>
macro exp(x)
```

---

#### `exp2`

```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number value or float vector`
*>
macro exp2(x)
```

---

#### `floor`

```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number value or float vector`
*>
macro floor(x)
```

---

#### `fma`

```c3
<*
 @require values::@is_promotable_to_floatlike(a) : `The input must be a number or float vector`
 @require values::@is_promotable_to_floatlike(b) : `The input must be a number or float vector`
 @require values::@is_promotable_to_floatlike(c) : `The input must be a number or float vector`
 @require values::@is_same_vector_type(a, b) : `The input types must be equal`
 @require values::@is_same_vector_type(a, c) : `The input types must match`
*>
macro fma(a, b, c)
```

---

#### `hypot`

```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number or a float vector`
 @require values::@is_promotable_to_floatlike(y) : `The input must be a number or a float vector`
 @require values::@is_same_vector_type(x, y) : `The input types must match`
*>
macro hypot(x, y)
```

---

#### `ln`

```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number or a float vector`
*>
macro ln(x)
```

---

#### `log`

```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number or a float vector`
 @require values::@is_promotable_to_floatlike(base) : `The base must be a number or a float vector`
*>
macro log(x, base)
```

---

#### `log2`

```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number or a float vector`
*>
macro log2(x)
```

---

#### `@intlog2`

```c3
<*
 @require values::@is_int($x) : `The input value must be an integer.`
 @require $x >= 0 : `The input value must be a positive integer.`
 @return `A floored base-2 log of an input integer value.`
*>
macro @intlog2($x)
```

---

#### `log10`

```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number or a float vector`
*>
macro log10(x)
```

---

#### `max`

```c3
<*
 @require types::is_numerical($typeof(x)) : `The input must be a floating point value or float vector`
 @require types::is_same($typeof(x), $typeof(y)) : `The input types must be equal`
*>
macro max(x, y, ...)
```

---

#### `min`

```c3
<*
 @require types::is_numerical($typeof(x)) : `The input must be a numerical value or numerical vector`
 @require types::is_same($typeof(x), $typeof(y)) : `The input types must be equal`
*>
macro min(x, y, ...)
```

---

#### `muladd`

```c3
<*
 @require types::@is_float(a) : `The input must be a floating point value`
 @require types::@has_same(a, b, c) : `The input types must be equal`
*>
macro muladd(a, b, c)
```

---

#### `nearbyint`

```c3
<*
 @require values::@is_floatlike(x) : `The input must be a floating point value or float vector`
*>
macro nearbyint(x)
```

---

#### `pow`

```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number or a float vector`
 @require @assignable_to(exp, $typeof(values::promote_int(x))) || values::@is_int(exp) : `The input must be an integer, castable to the type of x`
*>
macro pow(x, exp)
```

---

#### `frexp`

```c3
<*
 @require values::@is_promotable_to_float(x) : `The input must be integer or floating type`
*>
macro frexp(x, int* e)
```

---

#### `signbit`

```c3
<*
 @require values::@is_promotable_to_float(x) : `The input must be integer or floating type`
*>
macro int signbit(x)
```

---

#### `rint`

```c3
<*
 @require values::@is_floatlike(x) : `The input must be a number or a float vector`
*>
macro rint(x)
```

---

#### `round`

```c3
<*
 @require values::@is_floatlike(x) : `The input must be a floating point value or float vector`
*>
macro round(x)
```

---

#### `round_to_decimals`

```c3
<*
 @require values::@is_floatlike(x) : `The input must be a floating point value or float vector`
*>
macro round_to_decimals(x, int decimal_places)
```

---

#### `roundeven`

```c3
<*
 @require values::@is_floatlike(x) : `The input must be a floating point value or float vector`
*>
macro roundeven(x)
```

---

#### `sec`

```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number or a float vector`
*>
macro sec(x)
```

---

#### `sech`

```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number or a float vector`
*>
macro sech(x)
```

---

#### `sin`

```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number or a float vector`
*>
macro sin(x)
```

---

#### `sinh`

```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number or a float vector`
*>
macro sinh(x)
```

---

#### `sqr`

```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number or a float vector`
*>
macro sqr(x)
```

---

#### `sqrt`

```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number or a float vector`
*>
macro sqrt(x)
```

---

#### `tan`

```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number or a float vector`
*>
macro tan(x)
```

---

#### `is_finite`

```c3
<*
 @require values::@is_promotable_to_float(x) : `The input must be a float`
*>
macro bool is_finite(x)
```

---

#### `is_nan`

```c3
<*
 @require values::@is_promotable_to_float(x) : `The input must be a float`
*>
macro is_nan(x)
```

---

#### `is_inf`

```c3
<*
 @require values::@is_promotable_to_float(x) : `The input must be a float`
*>
macro is_inf(x)
```

---

#### `tanh`

```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number or a float vector`
*>
macro tanh(x)
```

---

#### `trunc`

```c3
<*
 @require values::@is_floatlike(x) : `The input must be a floating point value or float vector`
*>
macro trunc(x)
```

---

#### `lerp`

```c3
macro lerp(x, y, amount) @private
```

---

#### `reflect`

```c3
macro reflect(x, y) @private
```

---

#### `normalize`

```c3
macro normalize(x) @private
```

---

#### `select`

```c3
<*
 @param mask : "The mask to use for the select, 'true' will pick the then_value, 'false' the else_value"
 @param then_value : "The vector to get elements from where the mask is 'true'"
 @param else_value : "The vector to get elements from where the mask is 'false'"
 @require values::@is_vector(then_value) && values::@is_vector(else_value) : "'Then' and 'else' must be vectors."
 @require values::@is_same_type(then_value, else_value) : "'Then' and 'else' vectors must be of the same type."
 @require then_value.len == mask.len : "Mask and selected vectors must be of the same width."
 @return "a vector of the same type as then/else"
*>
macro select(bool[<*>] mask, then_value, else_value)
```

Use a mask to select values from either "then" or "else" vectors.


---

#### `float.ceil`

```c3
macro float float.ceil(float x)
```

---

#### `float.clamp`

```c3
macro float float.clamp(float x, float lower, float upper)
```

---

#### `float.copysign`

```c3
macro float float.copysign(float mag, float sgn)
```

---

#### `float.floor`

```c3
macro float float.floor(float x)
```

---

#### `float.fma`

```c3
macro float float.fma(float a, float b, float c)
```

---

#### `float.muladd`

```c3
macro float float.muladd(float a, float b, float c)
```

---

#### `float.nearbyint`

```c3
macro float float.nearbyint(float x)
```

---

#### `float.pow`

```c3
macro float float.pow(float x, exp)
```

---

#### `float.rint`

```c3
macro float float.rint(float x)
```

---

#### `float.round`

```c3
macro float float.round(float x)
```

---

#### `float.roundeven`

```c3
macro float float.roundeven(float x)
```

---

#### `float.trunc`

```c3
macro float float.trunc(float x)
```

---

#### `float[<*>].sum`

```c3
macro float float[<*>].sum(float[<*>] x, float start = 0.0)
```

---

#### `float[<*>].product`

```c3
macro float float[<*>].product(float[<*>] x, float start = 1.0)
```

---

#### `float[<*>].max`

```c3
macro float float[<*>].max(float[<*>] x)
```

---

#### `float[<*>].min`

```c3
macro float float[<*>].min(float[<*>] x)
```

---

#### `float[<*>].ceil`

```c3
macro float[<*>] float[<*>].ceil(float[<*>] x)
```

---

#### `float[<*>].clamp`

```c3
macro float[<*>] float[<*>].clamp(float[<*>] x, float[<*>] lower, float[<*>] upper)
```

---

#### `float[<*>].copysign`

```c3
macro float[<*>] float[<*>].copysign(float[<*>] mag, float[<*>] sgn)
```

---

#### `float[<*>].fma`

```c3
macro float[<*>] float[<*>].fma(float[<*>] a, float[<*>] b, float[<*>] c)
```

---

#### `float[<*>].floor`

```c3
macro float[<*>] float[<*>].floor(float[<*>] x)
```

---

#### `float[<*>].nearbyint`

```c3
macro float[<*>] float[<*>].nearbyint(float[<*>] x)
```

---

#### `float[<*>].pow`

```c3
macro float[<*>] float[<*>].pow(float[<*>] x, exp)
```

---

#### `float[<*>].rint`

```c3
macro float[<*>] float[<*>].rint(float[<*>] x)
```

---

#### `float[<*>].round`

```c3
macro float[<*>] float[<*>].round(float[<*>] x)
```

---

#### `float[<*>].roundeven`

```c3
macro float[<*>] float[<*>].roundeven(float[<*>] x)
```

---

#### `float[<*>].trunc`

```c3
macro float[<*>] float[<*>].trunc(float[<*>] x)
```

---

#### `float[<*>].dot`

```c3
macro float float[<*>].dot(float[<*>] x, float[<*>] y)
```

---

#### `float[<*>].length`

```c3
macro float float[<*>].length(float[<*>] x)
```

---

#### `float[<*>].distance`

```c3
macro float float[<*>].distance(float[<*>] x, float[<*>] y)
```

---

#### `float[<*>].normalize`

```c3
macro float[<*>] float[<*>].normalize(float[<*>] x)
```

---

#### `float[<*>].lerp`

```c3
macro float[<*>] float[<*>].lerp(float[<*>] x, float[<*>] y, float amount)
```

---

#### `float[<*>].reflect`

```c3
macro float[<*>] float[<*>].reflect(float[<*>] x, float[<*>] y)
```

---

#### `float[<*>].equals`

```c3
macro bool float[<*>].equals(float[<*>] x, float[<*>] y)
```

---

#### `float[<*>].comp_lt`

```c3
macro bool[<*>] float[<*>].comp_lt(float[<*>] x, float[<*>] y)
```

---

#### `float[<*>].comp_le`

```c3
macro bool[<*>] float[<*>].comp_le(float[<*>] x, float[<*>] y)
```

---

#### `float[<*>].comp_eq`

```c3
macro bool[<*>] float[<*>].comp_eq(float[<*>] x, float[<*>] y)
```

---

#### `float[<*>].comp_gt`

```c3
macro bool[<*>] float[<*>].comp_gt(float[<*>] x, float[<*>] y)
```

---

#### `float[<*>].comp_ge`

```c3
macro bool[<*>] float[<*>].comp_ge(float[<*>] x, float[<*>] y)
```

---

#### `float[<*>].comp_ne`

```c3
macro bool[<*>] float[<*>].comp_ne(float[<*>] x, float[<*>] y)
```

---

#### `double.ceil`

```c3
macro double double.ceil(double x)
```

---

#### `double.clamp`

```c3
macro double double.clamp(double x, double lower, double upper)
```

---

#### `double.copysign`

```c3
macro double double.copysign(double mag, double sgn)
```

---

#### `double.floor`

```c3
macro double double.floor(double x)
```

---

#### `double.fma`

```c3
macro double double.fma(double a, double b, double c)
```

---

#### `double.muladd`

```c3
macro double double.muladd(double a, double b, double c)
```

---

#### `double.nearbyint`

```c3
macro double double.nearbyint(double x)
```

---

#### `double.pow`

```c3
macro double double.pow(double x, exp)
```

---

#### `double.rint`

```c3
macro double double.rint(double x)
```

---

#### `double.round`

```c3
macro double double.round(double x)
```

---

#### `double.roundeven`

```c3
macro double double.roundeven(double x)
```

---

#### `double.trunc`

```c3
macro double double.trunc(double x)
```

---

#### `double[<*>].sum`

```c3
macro double double[<*>].sum(double[<*>] x, double start = 0.0)
```

---

#### `double[<*>].product`

```c3
macro double double[<*>].product(double[<*>] x, double start = 1.0)
```

---

#### `double[<*>].max`

```c3
macro double double[<*>].max(double[<*>] x)
```

---

#### `double[<*>].min`

```c3
macro double double[<*>].min(double[<*>] x)
```

---

#### `double[<*>].ceil`

```c3
macro double[<*>] double[<*>].ceil(double[<*>] x)
```

---

#### `double[<*>].clamp`

```c3
macro double[<*>] double[<*>].clamp(double[<*>] x, double[<*>] lower, double[<*>] upper)
```

---

#### `double[<*>].copysign`

```c3
macro double[<*>] double[<*>].copysign(double[<*>] mag, double[<*>] sgn)
```

---

#### `double[<*>].floor`

```c3
macro double[<*>] double[<*>].floor(double[<*>] x)
```

---

#### `double[<*>].fma`

```c3
macro double[<*>] double[<*>].fma(double[<*>] a, double[<*>] b, double[<*>] c)
```

---

#### `double[<*>].nearbyint`

```c3
macro double[<*>] double[<*>].nearbyint(double[<*>] x)
```

---

#### `double[<*>].pow`

```c3
macro double[<*>] double[<*>].pow(double[<*>] x, exp)
```

---

#### `double[<*>].rint`

```c3
macro double[<*>] double[<*>].rint(double[<*>] x)
```

---

#### `double[<*>].round`

```c3
macro double[<*>] double[<*>].round(double[<*>] x)
```

---

#### `double[<*>].roundeven`

```c3
macro double[<*>] double[<*>].roundeven(double[<*>] x)
```

---

#### `double[<*>].trunc`

```c3
macro double[<*>] double[<*>].trunc(double[<*>] x)
```

---

#### `double[<*>].dot`

```c3
macro double double[<*>].dot(double[<*>] x, double[<*>] y)
```

---

#### `double[<*>].length`

```c3
macro double double[<*>].length(double[<*>] x)
```

---

#### `double[<*>].distance`

```c3
macro double double[<*>].distance(double[<*>] x, double[<*>] y)
```

---

#### `double[<*>].normalize`

```c3
macro double[<*>] double[<*>].normalize(double[<*>] x)
```

---

#### `double[<*>].reflect`

```c3
macro double[<*>] double[<*>].reflect(double[<*>] x, double[<*>] y)
```

---

#### `double[<*>].lerp`

```c3
macro double[<*>] double[<*>].lerp(double[<*>] x, double[<*>] y, double amount)
```

---

#### `double[<*>].equals`

```c3
macro bool double[<*>].equals(double[<*>] x, double[<*>] y)
```

---

#### `double[<*>].comp_lt`

```c3
macro bool[<*>] double[<*>].comp_lt(double[<*>] x, double[<*>] y)
```

---

#### `double[<*>].comp_le`

```c3
macro bool[<*>] double[<*>].comp_le(double[<*>] x, double[<*>] y)
```

---

#### `double[<*>].comp_eq`

```c3
macro bool[<*>] double[<*>].comp_eq(double[<*>] x, double[<*>] y)
```

---

#### `double[<*>].comp_gt`

```c3
macro bool[<*>] double[<*>].comp_gt(double[<*>] x, double[<*>] y)
```

---

#### `double[<*>].comp_ge`

```c3
macro bool[<*>] double[<*>].comp_ge(double[<*>] x, double[<*>] y)
```

---

#### `double[<*>].comp_ne`

```c3
macro bool[<*>] double[<*>].comp_ne(double[<*>] x, double[<*>] y)
```

---

#### `ichar[<*>].comp_lt`

```c3
macro bool[<*>] ichar[<*>].comp_lt(ichar[<*>] x, ichar[<*>] y)
```

---

#### `ichar[<*>].comp_le`

```c3
macro bool[<*>] ichar[<*>].comp_le(ichar[<*>] x, ichar[<*>] y)
```

---

#### `ichar[<*>].comp_eq`

```c3
macro bool[<*>] ichar[<*>].comp_eq(ichar[<*>] x, ichar[<*>] y)
```

---

#### `ichar[<*>].comp_gt`

```c3
macro bool[<*>] ichar[<*>].comp_gt(ichar[<*>] x, ichar[<*>] y)
```

---

#### `ichar[<*>].comp_ge`

```c3
macro bool[<*>] ichar[<*>].comp_ge(ichar[<*>] x, ichar[<*>] y)
```

---

#### `ichar[<*>].comp_ne`

```c3
macro bool[<*>] ichar[<*>].comp_ne(ichar[<*>] x, ichar[<*>] y)
```

---

#### `ichar[<*>].sum`

```c3
macro ichar ichar[<*>].sum(ichar[<*>] x)
```

---

#### `ichar[<*>].product`

```c3
macro ichar ichar[<*>].product(ichar[<*>] x)
```

---

#### `ichar[<*>].and`

```c3
macro ichar ichar[<*>].and(ichar[<*>] x)
```

---

#### `ichar[<*>].or`

```c3
macro ichar ichar[<*>].or(ichar[<*>] x)
```

---

#### `ichar[<*>].xor`

```c3
macro ichar ichar[<*>].xor(ichar[<*>] x)
```

---

#### `ichar[<*>].max`

```c3
macro ichar ichar[<*>].max(ichar[<*>] x)
```

---

#### `ichar[<*>].min`

```c3
macro ichar ichar[<*>].min(ichar[<*>] x)
```

---

#### `ichar[<*>].dot`

```c3
macro ichar ichar[<*>].dot(ichar[<*>] x, ichar[<*>] y)
```

---

#### `short[<*>].comp_lt`

```c3
macro bool[<*>] short[<*>].comp_lt(short[<*>] x, short[<*>] y)
```

---

#### `short[<*>].comp_le`

```c3
macro bool[<*>] short[<*>].comp_le(short[<*>] x, short[<*>] y)
```

---

#### `short[<*>].comp_eq`

```c3
macro bool[<*>] short[<*>].comp_eq(short[<*>] x, short[<*>] y)
```

---

#### `short[<*>].comp_gt`

```c3
macro bool[<*>] short[<*>].comp_gt(short[<*>] x, short[<*>] y)
```

---

#### `short[<*>].comp_ge`

```c3
macro bool[<*>] short[<*>].comp_ge(short[<*>] x, short[<*>] y)
```

---

#### `short[<*>].comp_ne`

```c3
macro bool[<*>] short[<*>].comp_ne(short[<*>] x, short[<*>] y)
```

---

#### `short[<*>].sum`

```c3
macro short short[<*>].sum(short[<*>] x)
```

---

#### `short[<*>].product`

```c3
macro short short[<*>].product(short[<*>] x)
```

---

#### `short[<*>].and`

```c3
macro short short[<*>].and(short[<*>] x)
```

---

#### `short[<*>].or`

```c3
macro short short[<*>].or(short[<*>] x)
```

---

#### `short[<*>].xor`

```c3
macro short short[<*>].xor(short[<*>] x)
```

---

#### `short[<*>].max`

```c3
macro short short[<*>].max(short[<*>] x)
```

---

#### `short[<*>].min`

```c3
macro short short[<*>].min(short[<*>] x)
```

---

#### `short[<*>].dot`

```c3
macro short short[<*>].dot(short[<*>] x, short[<*>] y)
```

---

#### `int[<*>].comp_lt`

```c3
macro bool[<*>] int[<*>].comp_lt(int[<*>] x, int[<*>] y)
```

---

#### `int[<*>].comp_le`

```c3
macro bool[<*>] int[<*>].comp_le(int[<*>] x, int[<*>] y)
```

---

#### `int[<*>].comp_eq`

```c3
macro bool[<*>] int[<*>].comp_eq(int[<*>] x, int[<*>] y)
```

---

#### `int[<*>].comp_gt`

```c3
macro bool[<*>] int[<*>].comp_gt(int[<*>] x, int[<*>] y)
```

---

#### `int[<*>].comp_ge`

```c3
macro bool[<*>] int[<*>].comp_ge(int[<*>] x, int[<*>] y)
```

---

#### `int[<*>].comp_ne`

```c3
macro bool[<*>] int[<*>].comp_ne(int[<*>] x, int[<*>] y)
```

---

#### `int[<*>].sum`

```c3
macro int int[<*>].sum(int[<*>] x)
```

---

#### `int[<*>].product`

```c3
macro int int[<*>].product(int[<*>] x)
```

---

#### `int[<*>].and`

```c3
macro int int[<*>].and(int[<*>] x)
```

---

#### `int[<*>].or`

```c3
macro int int[<*>].or(int[<*>] x)
```

---

#### `int[<*>].xor`

```c3
macro int int[<*>].xor(int[<*>] x)
```

---

#### `int[<*>].max`

```c3
macro int int[<*>].max(int[<*>] x)
```

---

#### `int[<*>].min`

```c3
macro int int[<*>].min(int[<*>] x)
```

---

#### `int[<*>].dot`

```c3
macro int int[<*>].dot(int[<*>] x, int[<*>] y)
```

---

#### `long[<*>].comp_lt`

```c3
macro bool[<*>] long[<*>].comp_lt(long[<*>] x, long[<*>] y)
```

---

#### `long[<*>].comp_le`

```c3
macro bool[<*>] long[<*>].comp_le(long[<*>] x, long[<*>] y)
```

---

#### `long[<*>].comp_eq`

```c3
macro bool[<*>] long[<*>].comp_eq(long[<*>] x, long[<*>] y)
```

---

#### `long[<*>].comp_gt`

```c3
macro bool[<*>] long[<*>].comp_gt(long[<*>] x, long[<*>] y)
```

---

#### `long[<*>].comp_ge`

```c3
macro bool[<*>] long[<*>].comp_ge(long[<*>] x, long[<*>] y)
```

---

#### `long[<*>].comp_ne`

```c3
macro bool[<*>] long[<*>].comp_ne(long[<*>] x, long[<*>] y)
```

---

#### `long[<*>].sum`

```c3
macro long long[<*>].sum(long[<*>] x)
```

---

#### `long[<*>].product`

```c3
macro long long[<*>].product(long[<*>] x)
```

---

#### `long[<*>].and`

```c3
macro long long[<*>].and(long[<*>] x)
```

---

#### `long[<*>].or`

```c3
macro long long[<*>].or(long[<*>] x)
```

---

#### `long[<*>].xor`

```c3
macro long long[<*>].xor(long[<*>] x)
```

---

#### `long[<*>].max`

```c3
macro long long[<*>].max(long[<*>] x)
```

---

#### `long[<*>].min`

```c3
macro long long[<*>].min(long[<*>] x)
```

---

#### `long[<*>].dot`

```c3
macro long long[<*>].dot(long[<*>] x, long[<*>] y)
```

---

#### `int128[<*>].comp_lt`

```c3
macro bool[<*>] int128[<*>].comp_lt(int128[<*>] x, int128[<*>] y)
```

---

#### `int128[<*>].comp_le`

```c3
macro bool[<*>] int128[<*>].comp_le(int128[<*>] x, int128[<*>] y)
```

---

#### `int128[<*>].comp_eq`

```c3
macro bool[<*>] int128[<*>].comp_eq(int128[<*>] x, int128[<*>] y)
```

---

#### `int128[<*>].comp_gt`

```c3
macro bool[<*>] int128[<*>].comp_gt(int128[<*>] x, int128[<*>] y)
```

---

#### `int128[<*>].comp_ge`

```c3
macro bool[<*>] int128[<*>].comp_ge(int128[<*>] x, int128[<*>] y)
```

---

#### `int128[<*>].comp_ne`

```c3
macro bool[<*>] int128[<*>].comp_ne(int128[<*>] x, int128[<*>] y)
```

---

#### `int128[<*>].sum`

```c3
macro int128 int128[<*>].sum(int128[<*>] x)
```

---

#### `int128[<*>].product`

```c3
macro int128 int128[<*>].product(int128[<*>] x)
```

---

#### `int128[<*>].and`

```c3
macro int128 int128[<*>].and(int128[<*>] x)
```

---

#### `int128[<*>].or`

```c3
macro int128 int128[<*>].or(int128[<*>] x)
```

---

#### `int128[<*>].xor`

```c3
macro int128 int128[<*>].xor(int128[<*>] x)
```

---

#### `int128[<*>].max`

```c3
macro int128 int128[<*>].max(int128[<*>] x)
```

---

#### `int128[<*>].min`

```c3
macro int128 int128[<*>].min(int128[<*>] x)
```

---

#### `int128[<*>].dot`

```c3
macro int128 int128[<*>].dot(int128[<*>] x, int128[<*>] y)
```

---

#### `bool[<*>].comp_lt`

```c3
macro bool[<*>] bool[<*>].comp_lt(bool[<*>] x, bool[<*>] y)
```

---

#### `bool[<*>].comp_le`

```c3
macro bool[<*>] bool[<*>].comp_le(bool[<*>] x, bool[<*>] y)
```

---

#### `bool[<*>].comp_eq`

```c3
macro bool[<*>] bool[<*>].comp_eq(bool[<*>] x, bool[<*>] y)
```

---

#### `bool[<*>].comp_gt`

```c3
macro bool[<*>] bool[<*>].comp_gt(bool[<*>] x, bool[<*>] y)
```

---

#### `bool[<*>].comp_ge`

```c3
macro bool[<*>] bool[<*>].comp_ge(bool[<*>] x, bool[<*>] y)
```

---

#### `bool[<*>].comp_ne`

```c3
macro bool[<*>] bool[<*>].comp_ne(bool[<*>] x, bool[<*>] y)
```

---

#### `bool[<*>].sum`

```c3
macro bool bool[<*>].sum(bool[<*>] x)
```

---

#### `bool[<*>].product`

```c3
macro bool bool[<*>].product(bool[<*>] x)
```

---

#### `bool[<*>].and`

```c3
macro bool bool[<*>].and(bool[<*>] x)
```

---

#### `bool[<*>].or`

```c3
macro bool bool[<*>].or(bool[<*>] x)
```

---

#### `bool[<*>].xor`

```c3
macro bool bool[<*>].xor(bool[<*>] x)
```

---

#### `bool[<*>].max`

```c3
macro bool bool[<*>].max(bool[<*>] x)
```

---

#### `bool[<*>].min`

```c3
macro bool bool[<*>].min(bool[<*>] x)
```

---

#### `char[<*>].comp_lt`

```c3
macro bool[<*>] char[<*>].comp_lt(char[<*>] x, char[<*>] y)
```

---

#### `char[<*>].comp_le`

```c3
macro bool[<*>] char[<*>].comp_le(char[<*>] x, char[<*>] y)
```

---

#### `char[<*>].comp_eq`

```c3
macro bool[<*>] char[<*>].comp_eq(char[<*>] x, char[<*>] y)
```

---

#### `char[<*>].comp_gt`

```c3
macro bool[<*>] char[<*>].comp_gt(char[<*>] x, char[<*>] y)
```

---

#### `char[<*>].comp_ge`

```c3
macro bool[<*>] char[<*>].comp_ge(char[<*>] x, char[<*>] y)
```

---

#### `char[<*>].comp_ne`

```c3
macro bool[<*>] char[<*>].comp_ne(char[<*>] x, char[<*>] y)
```

---

#### `char[<*>].sum`

```c3
macro char char[<*>].sum(char[<*>] x)
```

---

#### `char[<*>].product`

```c3
macro char char[<*>].product(char[<*>] x)
```

---

#### `char[<*>].and`

```c3
macro char char[<*>].and(char[<*>] x)
```

---

#### `char[<*>].or`

```c3
macro char char[<*>].or(char[<*>] x)
```

---

#### `char[<*>].xor`

```c3
macro char char[<*>].xor(char[<*>] x)
```

---

#### `char[<*>].max`

```c3
macro char char[<*>].max(char[<*>] x)
```

---

#### `char[<*>].min`

```c3
macro char char[<*>].min(char[<*>] x)
```

---

#### `char[<*>].dot`

```c3
macro char char[<*>].dot(char[<*>] x, char[<*>] y)
```

---

#### `ushort[<*>].comp_lt`

```c3
macro bool[<*>] ushort[<*>].comp_lt(ushort[<*>] x, ushort[<*>] y)
```

---

#### `ushort[<*>].comp_le`

```c3
macro bool[<*>] ushort[<*>].comp_le(ushort[<*>] x, ushort[<*>] y)
```

---

#### `ushort[<*>].comp_eq`

```c3
macro bool[<*>] ushort[<*>].comp_eq(ushort[<*>] x, ushort[<*>] y)
```

---

#### `ushort[<*>].comp_gt`

```c3
macro bool[<*>] ushort[<*>].comp_gt(ushort[<*>] x, ushort[<*>] y)
```

---

#### `ushort[<*>].comp_ge`

```c3
macro bool[<*>] ushort[<*>].comp_ge(ushort[<*>] x, ushort[<*>] y)
```

---

#### `ushort[<*>].comp_ne`

```c3
macro bool[<*>] ushort[<*>].comp_ne(ushort[<*>] x, ushort[<*>] y)
```

---

#### `ushort[<*>].sum`

```c3
macro ushort ushort[<*>].sum(ushort[<*>] x)
```

---

#### `ushort[<*>].product`

```c3
macro ushort ushort[<*>].product(ushort[<*>] x)
```

---

#### `ushort[<*>].and`

```c3
macro ushort ushort[<*>].and(ushort[<*>] x)
```

---

#### `ushort[<*>].or`

```c3
macro ushort ushort[<*>].or(ushort[<*>] x)
```

---

#### `ushort[<*>].xor`

```c3
macro ushort ushort[<*>].xor(ushort[<*>] x)
```

---

#### `ushort[<*>].max`

```c3
macro ushort ushort[<*>].max(ushort[<*>] x)
```

---

#### `ushort[<*>].min`

```c3
macro ushort ushort[<*>].min(ushort[<*>] x)
```

---

#### `ushort[<*>].dot`

```c3
macro ushort ushort[<*>].dot(ushort[<*>] x, ushort[<*>] y)
```

---

#### `uint[<*>].comp_lt`

```c3
macro bool[<*>] uint[<*>].comp_lt(uint[<*>] x, uint[<*>] y)
```

---

#### `uint[<*>].comp_le`

```c3
macro bool[<*>] uint[<*>].comp_le(uint[<*>] x, uint[<*>] y)
```

---

#### `uint[<*>].comp_eq`

```c3
macro bool[<*>] uint[<*>].comp_eq(uint[<*>] x, uint[<*>] y)
```

---

#### `uint[<*>].comp_gt`

```c3
macro bool[<*>] uint[<*>].comp_gt(uint[<*>] x, uint[<*>] y)
```

---

#### `uint[<*>].comp_ge`

```c3
macro bool[<*>] uint[<*>].comp_ge(uint[<*>] x, uint[<*>] y)
```

---

#### `uint[<*>].comp_ne`

```c3
macro bool[<*>] uint[<*>].comp_ne(uint[<*>] x, uint[<*>] y)
```

---

#### `uint[<*>].sum`

```c3
macro uint uint[<*>].sum(uint[<*>] x)
```

---

#### `uint[<*>].product`

```c3
macro uint uint[<*>].product(uint[<*>] x)
```

---

#### `uint[<*>].and`

```c3
macro uint uint[<*>].and(uint[<*>] x)
```

---

#### `uint[<*>].or`

```c3
macro uint uint[<*>].or(uint[<*>] x)
```

---

#### `uint[<*>].xor`

```c3
macro uint uint[<*>].xor(uint[<*>] x)
```

---

#### `uint[<*>].max`

```c3
macro uint uint[<*>].max(uint[<*>] x)
```

---

#### `uint[<*>].min`

```c3
macro uint uint[<*>].min(uint[<*>] x)
```

---

#### `uint[<*>].dot`

```c3
macro uint uint[<*>].dot(uint[<*>] x, uint[<*>] y)
```

---

#### `ulong[<*>].comp_lt`

```c3
macro bool[<*>] ulong[<*>].comp_lt(ulong[<*>] x, ulong[<*>] y)
```

---

#### `ulong[<*>].comp_le`

```c3
macro bool[<*>] ulong[<*>].comp_le(ulong[<*>] x, ulong[<*>] y)
```

---

#### `ulong[<*>].comp_eq`

```c3
macro bool[<*>] ulong[<*>].comp_eq(ulong[<*>] x, ulong[<*>] y)
```

---

#### `ulong[<*>].comp_gt`

```c3
macro bool[<*>] ulong[<*>].comp_gt(ulong[<*>] x, ulong[<*>] y)
```

---

#### `ulong[<*>].comp_ge`

```c3
macro bool[<*>] ulong[<*>].comp_ge(ulong[<*>] x, ulong[<*>] y)
```

---

#### `ulong[<*>].comp_ne`

```c3
macro bool[<*>] ulong[<*>].comp_ne(ulong[<*>] x, ulong[<*>] y)
```

---

#### `ulong[<*>].sum`

```c3
macro ulong ulong[<*>].sum(ulong[<*>] x)
```

---

#### `ulong[<*>].product`

```c3
macro ulong ulong[<*>].product(ulong[<*>] x)
```

---

#### `ulong[<*>].and`

```c3
macro ulong ulong[<*>].and(ulong[<*>] x)
```

---

#### `ulong[<*>].or`

```c3
macro ulong ulong[<*>].or(ulong[<*>] x)
```

---

#### `ulong[<*>].xor`

```c3
macro ulong ulong[<*>].xor(ulong[<*>] x)
```

---

#### `ulong[<*>].max`

```c3
macro ulong ulong[<*>].max(ulong[<*>] x)
```

---

#### `ulong[<*>].min`

```c3
macro ulong ulong[<*>].min(ulong[<*>] x)
```

---

#### `ulong[<*>].dot`

```c3
macro ulong ulong[<*>].dot(ulong[<*>] x, ulong[<*>] y)
```

---

#### `uint128[<*>].comp_lt`

```c3
macro bool[<*>] uint128[<*>].comp_lt(uint128[<*>] x, uint128[<*>] y)
```

---

#### `uint128[<*>].comp_le`

```c3
macro bool[<*>] uint128[<*>].comp_le(uint128[<*>] x, uint128[<*>] y)
```

---

#### `uint128[<*>].comp_eq`

```c3
macro bool[<*>] uint128[<*>].comp_eq(uint128[<*>] x, uint128[<*>] y)
```

---

#### `uint128[<*>].comp_gt`

```c3
macro bool[<*>] uint128[<*>].comp_gt(uint128[<*>] x, uint128[<*>] y)
```

---

#### `uint128[<*>].comp_ge`

```c3
macro bool[<*>] uint128[<*>].comp_ge(uint128[<*>] x, uint128[<*>] y)
```

---

#### `uint128[<*>].comp_ne`

```c3
macro bool[<*>] uint128[<*>].comp_ne(uint128[<*>] x, uint128[<*>] y)
```

---

#### `uint128[<*>].sum`

```c3
macro uint128 uint128[<*>].sum(uint128[<*>] x)
```

---

#### `uint128[<*>].product`

```c3
macro uint128 uint128[<*>].product(uint128[<*>] x)
```

---

#### `uint128[<*>].and`

```c3
macro uint128 uint128[<*>].and(uint128[<*>] x)
```

---

#### `uint128[<*>].or`

```c3
macro uint128 uint128[<*>].or(uint128[<*>] x)
```

---

#### `uint128[<*>].xor`

```c3
macro uint128 uint128[<*>].xor(uint128[<*>] x)
```

---

#### `uint128[<*>].max`

```c3
macro uint128 uint128[<*>].max(uint128[<*>] x)
```

---

#### `uint128[<*>].min`

```c3
macro uint128 uint128[<*>].min(uint128[<*>] x)
```

---

#### `uint128[<*>].dot`

```c3
macro uint128 uint128[<*>].dot(uint128[<*>] x, uint128[<*>] y)
```

---

#### `char.sat_add`

```c3
macro char char.sat_add(char x, char y)
```

---

#### `char.sat_sub`

```c3
macro char char.sat_sub(char x, char y)
```

---

#### `char.sat_mul`

```c3
macro char char.sat_mul(char x, char y)
```

---

#### `char.sat_shl`

```c3
macro char char.sat_shl(char x, char y)
```

---

#### `char.overflow_add`

```c3
macro char? char.overflow_add(char x, char y)
```

---

#### `char.overflow_sub`

```c3
macro char? char.overflow_sub(char x, char y)
```

---

#### `char.overflow_mul`

```c3
macro char? char.overflow_mul(char x, char y)
```

---

#### `ichar.sat_add`

```c3
macro ichar ichar.sat_add(ichar x, ichar y)
```

---

#### `ichar.sat_sub`

```c3
macro ichar ichar.sat_sub(ichar x, ichar y)
```

---

#### `ichar.sat_mul`

```c3
macro ichar ichar.sat_mul(ichar x, ichar y)
```

---

#### `ichar.sat_shl`

```c3
macro ichar ichar.sat_shl(ichar x, ichar y)
```

---

#### `ichar.overflow_add`

```c3
macro ichar? ichar.overflow_add(ichar x, ichar y)
```

---

#### `ichar.overflow_sub`

```c3
macro ichar? ichar.overflow_sub(ichar x, ichar y)
```

---

#### `ichar.overflow_mul`

```c3
macro ichar? ichar.overflow_mul(ichar x, ichar y)
```

---

#### `ushort.sat_add`

```c3
macro ushort ushort.sat_add(ushort x, ushort y)
```

---

#### `ushort.sat_sub`

```c3
macro ushort ushort.sat_sub(ushort x, ushort y)
```

---

#### `ushort.sat_mul`

```c3
macro ushort ushort.sat_mul(ushort x, ushort y)
```

---

#### `ushort.sat_shl`

```c3
macro ushort ushort.sat_shl(ushort x, ushort y)
```

---

#### `ushort.overflow_add`

```c3
macro ushort? ushort.overflow_add(ushort x, ushort y)
```

---

#### `ushort.overflow_sub`

```c3
macro ushort? ushort.overflow_sub(ushort x, ushort y)
```

---

#### `ushort.overflow_mul`

```c3
macro ushort? ushort.overflow_mul(ushort x, ushort y)
```

---

#### `short.sat_add`

```c3
macro short short.sat_add(short x, short y)
```

---

#### `short.sat_sub`

```c3
macro short short.sat_sub(short x, short y)
```

---

#### `short.sat_mul`

```c3
macro short short.sat_mul(short x, short y)
```

---

#### `short.sat_shl`

```c3
macro short short.sat_shl(short x, short y)
```

---

#### `short.overflow_add`

```c3
macro short? short.overflow_add(short x, short y)
```

---

#### `short.overflow_sub`

```c3
macro short? short.overflow_sub(short x, short y)
```

---

#### `short.overflow_mul`

```c3
macro short? short.overflow_mul(short x, short y)
```

---

#### `uint.sat_add`

```c3
macro uint uint.sat_add(uint x, uint y)
```

---

#### `uint.sat_sub`

```c3
macro uint uint.sat_sub(uint x, uint y)
```

---

#### `uint.sat_mul`

```c3
macro uint uint.sat_mul(uint x, uint y)
```

---

#### `uint.sat_shl`

```c3
macro uint uint.sat_shl(uint x, uint y)
```

---

#### `uint.overflow_add`

```c3
macro uint? uint.overflow_add(uint x, uint y)
```

---

#### `uint.overflow_sub`

```c3
macro uint? uint.overflow_sub(uint x, uint y)
```

---

#### `uint.overflow_mul`

```c3
macro uint? uint.overflow_mul(uint x, uint y)
```

---

#### `int.sat_add`

```c3
macro int int.sat_add(int x, int y)
```

---

#### `int.sat_sub`

```c3
macro int int.sat_sub(int x, int y)
```

---

#### `int.sat_mul`

```c3
macro int int.sat_mul(int x, int y)
```

---

#### `int.sat_shl`

```c3
macro int int.sat_shl(int x, int y)
```

---

#### `int.overflow_add`

```c3
macro int? int.overflow_add(int x, int y)
```

---

#### `int.overflow_sub`

```c3
macro int? int.overflow_sub(int x, int y)
```

---

#### `int.overflow_mul`

```c3
macro int? int.overflow_mul(int x, int y)
```

---

#### `ulong.sat_add`

```c3
macro ulong ulong.sat_add(ulong x, ulong y)
```

---

#### `ulong.sat_sub`

```c3
macro ulong ulong.sat_sub(ulong x, ulong y)
```

---

#### `ulong.sat_mul`

```c3
macro ulong ulong.sat_mul(ulong x, ulong y)
```

---

#### `ulong.sat_shl`

```c3
macro ulong ulong.sat_shl(ulong x, ulong y)
```

---

#### `ulong.overflow_add`

```c3
macro ulong? ulong.overflow_add(ulong x, ulong y)
```

---

#### `ulong.overflow_sub`

```c3
macro ulong? ulong.overflow_sub(ulong x, ulong y)
```

---

#### `ulong.overflow_mul`

```c3
macro ulong? ulong.overflow_mul(ulong x, ulong y)
```

---

#### `long.sat_add`

```c3
macro long long.sat_add(long x, long y)
```

---

#### `long.sat_sub`

```c3
macro long long.sat_sub(long x, long y)
```

---

#### `long.sat_mul`

```c3
macro long long.sat_mul(long x, long y)
```

---

#### `long.sat_shl`

```c3
macro long long.sat_shl(long x, long y)
```

---

#### `long.overflow_add`

```c3
macro long? long.overflow_add(long x, long y)
```

---

#### `long.overflow_sub`

```c3
macro long? long.overflow_sub(long x, long y)
```

---

#### `long.overflow_mul`

```c3
macro long? long.overflow_mul(long x, long y)
```

---

#### `uint128.sat_add`

```c3
macro uint128 uint128.sat_add(uint128 x, uint128 y)
```

---

#### `uint128.sat_sub`

```c3
macro uint128 uint128.sat_sub(uint128 x, uint128 y)
```

---

#### `uint128.sat_mul`

```c3
macro uint128 uint128.sat_mul(uint128 x, uint128 y)
```

---

#### `uint128.sat_shl`

```c3
macro uint128 uint128.sat_shl(uint128 x, uint128 y)
```

---

#### `uint128.overflow_add`

```c3
macro uint128? uint128.overflow_add(uint128 x, uint128 y)
```

---

#### `uint128.overflow_sub`

```c3
macro uint128? uint128.overflow_sub(uint128 x, uint128 y)
```

---

#### `uint128.overflow_mul`

```c3
macro uint128? uint128.overflow_mul(uint128 x, uint128 y)
```

---

#### `int128.sat_add`

```c3
macro int128 int128.sat_add(int128 x, int128 y)
```

---

#### `int128.sat_sub`

```c3
macro int128 int128.sat_sub(int128 x, int128 y)
```

---

#### `int128.sat_mul`

```c3
macro int128 int128.sat_mul(int128 x, int128 y)
```

---

#### `int128.sat_shl`

```c3
macro int128 int128.sat_shl(int128 x, int128 y)
```

---

#### `int128.overflow_add`

```c3
macro int128? int128.overflow_add(int128 x, int128 y)
```

---

#### `int128.overflow_sub`

```c3
macro int128? int128.overflow_sub(int128 x, int128 y)
```

---

#### `int128.overflow_mul`

```c3
macro int128? int128.overflow_mul(int128 x, int128 y)
```

---

#### `is_odd`

```c3
<*
 @require values::@is_int(x) : `The input must be an integer`
*>
macro bool is_odd(x)
```

---

#### `is_even`

```c3
<*
 @require values::@is_int(x) : `The input must be an integer`
*>
macro bool is_even(x)
```

---

#### `char.is_even`

```c3
macro bool char.is_even(char x)
```

---

#### `char.is_odd`

```c3
macro bool char.is_odd(char x)
```

---

#### `ichar.is_even`

```c3
macro bool ichar.is_even(ichar x)
```

---

#### `ichar.is_odd`

```c3
macro bool ichar.is_odd(ichar x)
```

---

#### `ushort.is_even`

```c3
macro bool ushort.is_even(ushort x)
```

---

#### `ushort.is_odd`

```c3
macro bool ushort.is_odd(ushort x)
```

---

#### `short.is_even`

```c3
macro bool short.is_even(short x)
```

---

#### `short.is_odd`

```c3
macro bool short.is_odd(short x)
```

---

#### `uint.is_even`

```c3
macro bool uint.is_even(uint x)
```

---

#### `uint.is_odd`

```c3
macro bool uint.is_odd(uint x)
```

---

#### `int.is_even`

```c3
macro bool int.is_even(int x)
```

---

#### `int.is_odd`

```c3
macro bool int.is_odd(int x)
```

---

#### `ulong.is_even`

```c3
macro bool ulong.is_even(ulong x)
```

---

#### `ulong.is_odd`

```c3
macro bool ulong.is_odd(ulong x)
```

---

#### `long.is_even`

```c3
macro bool long.is_even(long x)
```

---

#### `long.is_odd`

```c3
macro bool long.is_odd(long x)
```

---

#### `uint128.is_even`

```c3
macro bool uint128.is_even(uint128 x)
```

---

#### `uint128.is_odd`

```c3
macro bool uint128.is_odd(uint128 x)
```

---

#### `int128.is_even`

```c3
macro bool int128.is_even(int128 x)
```

---

#### `int128.is_odd`

```c3
macro bool int128.is_odd(int128 x)
```

---

#### `is_power_of_2`

```c3
<*
 @require types::is_underlying_int($typeof(x)) : `is_power_of_2 may only be used on integer types`
*>
macro bool is_power_of_2(x)
```

---

#### `next_power_of_2`

```c3
macro next_power_of_2(x)
```

---

#### `equals_vec`

```c3
macro equals_vec(v1, v2) @private
```

---

#### `double.high_word`

```c3
macro uint double.high_word(double d)
```

---

#### `double.low_word`

```c3
macro uint double.low_word(double d)
```

---

#### `float.word`

```c3
macro uint float.word(float d)
```

---

#### `double.set_high_word`

```c3
macro void double.set_high_word(double* d, uint u)
```

---

#### `double.set_low_word`

```c3
macro void double.set_low_word(double* d, uint u)
```

---

#### `float.set_word`

```c3
macro void float.set_word(float* f, uint u)
```

---

#### `scalbn`

```c3
macro double scalbn(double x, int n)
```

---

#### `_atan`

```c3
extern fn double _atan(double x) @MathLibc("atan")
```

---

#### `_sincosf`

```c3
fn void _sincosf(float a, float* s, float* c) @extern("sincosf") @if(env::WIN32)
```

---

#### `_tan`

```c3
extern fn double _tan(double x) @MathLibc("tan")
```

---

#### `_frexpf`

```c3
fn float _frexpf(float x, int* e)
```

---

#### `overflow_add_helper`

```c3
macro overflow_add_helper(x, y) @local
```

---

#### `overflow_sub_helper`

```c3
macro overflow_sub_helper(x, y) @local
```

---

#### `overflow_mul_helper`

```c3
macro overflow_mul_helper(x, y) @local
```

---

#### `overflow_add`

```c3
<*
 @param [&out] out : "Where the result of the addition is stored"
 @return "Whether the addition resulted in an integer overflow"
 @require values::@is_same_type(a, b) : "a and b must be the same type"
 @require values::@is_flat_intlike(a) &&& values::@is_flat_intlike(b) : "a and b must both be integer or integer vector based"
 @require $defined(*out) &&& values::@is_same_type(*out, a) : "out must be a pointer of the same type as a and b"
*>
macro bool overflow_add(a, b, out)
```

---

#### `overflow_sub`

```c3
<*
 @param [&out] out : "Where the result of the subtraction is stored"
 @return "Whether the subtraction resulted in an integer overflow"
 @require values::@is_same_type(a, b) : "a and b must be the same type"
 @require values::@is_flat_intlike(a) &&& values::@is_flat_intlike(b) : "a and b must both be integer or integer vector based"
 @require $defined(*out) &&& values::@is_same_type(*out, a) : "out must be a pointer of the same type as a and b"
*>
macro bool overflow_sub(a, b, out)
```

---

#### `overflow_mul`

```c3
<*
 @param [&out] out : "Where the result of the multiplication is stored"
 @return "Whether the multiplication resulted in an integer overflow"
 @require values::@is_same_type(a, b) : "a and b must be the same type"
 @require values::@is_flat_intlike(a) &&& values::@is_flat_intlike(b) : "a and b must both be integer or integer vector based"
 @require $defined(*out) &&& values::@is_same_type(*out, a) : "out must be a pointer of the same type as a and b"
*>
macro bool overflow_mul(a, b, out)
```

---

#### `iota`

```c3
<*
 @require types::is_vector($Type) || ($Type.kindof == ARRAY &&& types::is_numerical($typefrom($Type.inner)))
*>
macro iota($Type)
```

---

#### `mul_div_helper`

```c3
macro mul_div_helper(val, mul, div) @private
```

---

#### `char.muldiv`

```c3
macro char char.muldiv(self, char mul, char div)
```

---

#### `ichar.muldiv`

```c3
macro ichar ichar.muldiv(self, ichar mul, ichar div)
```

---

#### `short.muldiv`

```c3
macro short short.muldiv(self, short mul, short div)
```

---

#### `ushort.muldiv`

```c3
macro ushort ushort.muldiv(self, ushort mul, ushort div)
```

---

#### `int.muldiv`

```c3
macro int int.muldiv(self, int mul, int div)
```

---

#### `uint.muldiv`

```c3
macro uint uint.muldiv(self, uint mul, uint div)
```

---

#### `long.muldiv`

```c3
macro long long.muldiv(self, long mul, long div)
```

---

#### `ulong.muldiv`

```c3
macro ulong ulong.muldiv(self, ulong mul, ulong div)
```

---

#### `@is_same_vector_or_scalar`

```c3
macro bool @is_same_vector_or_scalar(#vector_value, #vector_or_scalar) @private
```

---

#### `char[<*>].muldiv`

```c3
<*
 @require @is_same_vector_or_scalar(self, mul) : `mul must be a vector of the same type as self, or be an integer scalar`
 @require @is_same_vector_or_scalar(self, div) : `div must be a vector of the same type as self, or be an integer scalar`
*>
macro char[<*>] char[<*>].muldiv(self, mul, div)
```

---

#### `ichar[<*>].muldiv`

```c3
<*
 @require @is_same_vector_or_scalar(self, mul) : `mul must be a vector of the same type as self, or be an integer scalar`
 @require @is_same_vector_or_scalar(self, div) : `div must be a vector of the same type as self, or be an integer scalar`
*>
macro ichar[<*>] ichar[<*>].muldiv(self, mul, div)
```

---

#### `short[<*>].muldiv`

```c3
<*
 @require @is_same_vector_or_scalar(self, mul) : `mul must be a vector of the same type as self, or be an integer scalar`
 @require @is_same_vector_or_scalar(self, div) : `div must be a vector of the same type as self, or be an integer scalar`
*>
macro short[<*>] short[<*>].muldiv(self, mul, div)
```

---

#### `ushort[<*>].muldiv`

```c3
<*
 @require @is_same_vector_or_scalar(self, mul) : `mul must be a vector of the same type as self, or be an integer scalar`
 @require @is_same_vector_or_scalar(self, div) : `div must be a vector of the same type as self, or be an integer scalar`
*>
macro ushort[<*>] ushort[<*>].muldiv(self, mul, div)
```

---

#### `int[<*>].muldiv`

```c3
<*
 @require @is_same_vector_or_scalar(self, mul) : `mul must be a vector of the same type as self, or be an integer scalar`
 @require @is_same_vector_or_scalar(self, div) : `div must be a vector of the same type as self, or be an integer scalar`
*>
macro int[<*>] int[<*>].muldiv(self, mul, div)
```

---

#### `uint[<*>].muldiv`

```c3
<*
 @require @is_same_vector_or_scalar(self, mul) : `mul must be a vector of the same type as self, or be an integer scalar`
 @require @is_same_vector_or_scalar(self, div) : `div must be a vector of the same type as self, or be an integer scalar`
*>
macro uint[<*>] uint[<*>].muldiv(self, mul, div)
```

---

#### `long[<*>].muldiv`

```c3
<*
 @require @is_same_vector_or_scalar(self, mul) : `mul must be a vector of the same type as self, or be an integer scalar`
 @require @is_same_vector_or_scalar(self, div) : `div must be a vector of the same type as self, or be an integer scalar`
*>
macro long[<*>] long[<*>].muldiv(self, mul, div)
```

---

#### `ulong[<*>].muldiv`

```c3
<*
 @require @is_same_vector_or_scalar(self, mul) : `mul must be a vector of the same type as self, or be an integer scalar`
 @require @is_same_vector_or_scalar(self, div) : `div must be a vector of the same type as self, or be an integer scalar`
*>
macro ulong[<*>] ulong[<*>].muldiv(self, mul, div)
```

---

#### `_gcd`

```c3
<*
 @require types::is_int($typeof(a)) : `The input must be an integer`
 @require types::is_int($typeof(b)) : `The input must be an integer`
*>
macro _gcd(a, b) @private
```

---

#### `lcm`

```c3
<*
 @require $vacount >= 2 : "At least two arguments are required."
*>
macro lcm(...)
```

Calculate the least common multiple for the provided arguments.


---

#### `gcd`

```c3
<*
 @require $vacount >= 2 : "At least two arguments are required."
*>
macro gcd(...)
```

Calculate the greatest common divisor for the provided arguments.


---

#### `Matrix`

```c3
alias Matrix2f = Matrix2x2 {float}
```
```c3
alias Matrix2  = Matrix2x2 {double}
```
```c3
alias Matrix3f = Matrix3x3 {float}
```
```c3
alias Matrix3  = Matrix3x3 {double}
```
```c3
alias Matrix4f = Matrix4x4 {float}
```
```c3
alias Matrix4  = Matrix4x4 {double}
```

---

#### `matrix`

```c3
alias matrix4_ortho  @builtin = matrix::ortho {double}
```
```c3
alias matrix4f_ortho @builtin = matrix::ortho {float}
```
```c3
alias matrix4_perspective  @builtin = matrix::perspective {double}
```
```c3
alias matrix4f_perspective @builtin = matrix::perspective {float}
```

---

#### `MATRIX`

```c3
alias MATRIX2_IDENTITY  @builtin = matrix::IDENTITY2 {double}
```
```c3
alias MATRIX2F_IDENTITY @builtin = matrix::IDENTITY2 {float}
```
```c3
alias MATRIX3_IDENTITY  @builtin = matrix::IDENTITY3 {double}
```
```c3
alias MATRIX3F_IDENTITY @builtin = matrix::IDENTITY3 {float}
```
```c3
alias MATRIX4_IDENTITY  @builtin = matrix::IDENTITY4 {double}
```
```c3
alias MATRIX4F_IDENTITY @builtin = matrix::IDENTITY4 {float}
```

---

#### `Quaternionf`

```c3
alias Quaternionf = Quaternion {float}
```

---

#### `Quaternion`

```c3
alias Quaternion = Quaternion {double}
```

---

#### `QUATERNION_IDENTITY`

```c3
alias QUATERNION_IDENTITY  @builtin = quaternion::IDENTITY {double}
```

---

#### `QUATERNIONF_IDENTITY`

```c3
alias QUATERNIONF_IDENTITY @builtin = quaternion::IDENTITY {float}
```
### `std::math::bigint`

---

#### `MAX_LEN`

```c3
const MAX_LEN = 4096 * 2 / 32
```

---

#### `ZERO`

```c3
const BigInt ZERO = { .len = 1 }
```

---

#### `ONE`

```c3
const BigInt ONE = { .len = 1, .data[0] = 1 }
```

---

#### `BigInt`

```c3
struct BigInt (Printable)
```

---

#### `from_int`

```c3
fn BigInt from_int(int128 val)
```

---

#### `BigInt.init`

```c3
fn BigInt* BigInt.init(&self, int128 value)
```

---

#### `BigInt.init_with_u128`

```c3
fn BigInt* BigInt.init_with_u128(&self, uint128 value)
```

---

#### `BigInt.init_with_array`

```c3
<*
 @require values.len <= MAX_LEN
*>
fn BigInt* BigInt.init_with_array(&self, uint[] values)
```

---

#### `BigInt.init_string_radix`

```c3
fn BigInt*? BigInt.init_string_radix(&self, String value, int radix)
```

---

#### `BigInt.is_negative`

```c3
fn bool BigInt.is_negative(&self)
```

---

#### `BigInt.add`

```c3
fn BigInt BigInt.add(self, BigInt other) @operator(+)
```

---

#### `BigInt.add_this`

```c3
fn void BigInt.add_this(&self, BigInt other) @operator(+=)
```

---

#### `BigInt.reduce_len`

```c3
fn void BigInt.reduce_len(&self) @private
```

---

#### `find_length`

```c3
macro uint find_length(uint* data, uint length)
```

---

#### `BigInt.mult`

```c3
fn BigInt BigInt.mult(self, BigInt bi2) @operator(*)
```

---

#### `BigInt.mult_this`

```c3
fn void BigInt.mult_this(&self, BigInt bi2) @operator(*=)
```

---

#### `BigInt.negate`

```c3
fn void BigInt.negate(&self)
```

---

#### `BigInt.is_zero`

```c3
macro bool BigInt.is_zero(&self)
```

---

#### `BigInt.sub`

```c3
fn BigInt BigInt.sub(self, BigInt other) @operator(-)
```

---

#### `BigInt.sub_this`

```c3
fn BigInt* BigInt.sub_this(&self, BigInt other) @operator(-=)
```

---

#### `BigInt.bitcount`

```c3
fn int BigInt.bitcount(&self)
```

---

#### `BigInt.unary_minus`

```c3
fn BigInt BigInt.unary_minus(&self) @operator(-)
```

---

#### `BigInt.div`

```c3
macro BigInt BigInt.div(self, BigInt other) @operator(/)
```

---

#### `BigInt.div_this`

```c3
fn void BigInt.div_this(&self, BigInt other) @operator(/=)
```

---

#### `BigInt.mod`

```c3
fn BigInt BigInt.mod(self, BigInt bi2) @operator(%)
```

---

#### `BigInt.mod_this`

```c3
fn void BigInt.mod_this(&self, BigInt bi2) @operator(%=)
```

---

#### `BigInt.bit_negate_this`

```c3
fn void BigInt.bit_negate_this(&self)
```

---

#### `BigInt.bit_negate`

```c3
fn BigInt BigInt.bit_negate(self) @operator(~)
```

---

#### `BigInt.shr`

```c3
fn BigInt BigInt.shr(self, int shift) @operator(>>)
```

---

#### `BigInt.shr_this`

```c3
fn void BigInt.shr_this(self, int shift) @operator(>>=)
```

---

#### `BigInt.shl`

```c3
fn BigInt BigInt.shl(self, int shift) @operator(<<)
```

---

#### `BigInt.equals`

```c3
macro bool BigInt.equals(&self, BigInt other) @operator(==)
```

---

#### `BigInt.greater_than`

```c3
macro bool BigInt.greater_than(&self, BigInt other)
```

---

#### `BigInt.less_than`

```c3
macro bool BigInt.less_than(&self, BigInt other)
```

---

#### `BigInt.is_odd`

```c3
fn bool BigInt.is_odd(&self)
```

---

#### `BigInt.is_one`

```c3
fn bool BigInt.is_one(&self)
```

---

#### `BigInt.greater_or_equal`

```c3
macro bool BigInt.greater_or_equal(&self, BigInt other)
```

---

#### `BigInt.less_or_equal`

```c3
macro bool BigInt.less_or_equal(&self, BigInt)
```

---

#### `BigInt.abs`

```c3
fn BigInt BigInt.abs(&self)
```

---

#### `BigInt.to_format`

```c3
fn usz? BigInt.to_format(&self, Formatter* format) @dynamic
```

---

#### `BigInt.to_string`

```c3
fn String BigInt.to_string(&self, Allocator allocator) @dynamic
```

---

#### `BigInt.to_string_with_radix`

```c3
<*
 @require radix > 1 && radix <= 36 : "Radix must be 2-36"
*>
fn String BigInt.to_string_with_radix(&self, int radix, Allocator allocator)
```

---

#### `BigInt.mod_pow`

```c3
<*
 @require !exp.is_negative() : "Positive exponents only"
*>
fn BigInt BigInt.mod_pow(&self, BigInt exp, BigInt mod)
```

---

#### `barrett_reduction`

```c3
fn BigInt barrett_reduction(BigInt x, BigInt n, BigInt constant)
```

Fast calculation of modular reduction using Barrett's reduction.
Requires x < b^(2k), where b is the base.  In this case, base is
2^32 (uint).


---

#### `BigInt.sqrt`

```c3
fn BigInt BigInt.sqrt(&self)
```

---

#### `BigInt.bit_and`

```c3
fn BigInt BigInt.bit_and(self, BigInt bi2) @operator(&)
```

---

#### `BigInt.bit_and_this`

```c3
fn void BigInt.bit_and_this(&self, BigInt bi2)
```

---

#### `BigInt.bit_or`

```c3
fn BigInt BigInt.bit_or(self, BigInt bi2) @operator(|)
```

---

#### `BigInt.bit_or_this`

```c3
fn void BigInt.bit_or_this(&self, BigInt bi2)
```

---

#### `BigInt.bit_xor`

```c3
fn BigInt BigInt.bit_xor(self, BigInt bi2) @operator(^)
```

---

#### `BigInt.bit_xor_this`

```c3
fn void BigInt.bit_xor_this(&self, BigInt bi2)
```

---

#### `BigInt.shl_this`

```c3
fn void BigInt.shl_this(&self, int shift) @operator(<<=)
```

---

#### `BigInt.gcd`

```c3
fn BigInt BigInt.gcd(&self, BigInt other)
```

---

#### `BigInt.lcm`

```c3
fn BigInt BigInt.lcm(&self, BigInt other)
```

---

#### `BigInt.randomize_bits`

```c3
<*
 @require bits >> 5 < MAX_LEN : "Required bits > maxlength"
*>
fn void BigInt.randomize_bits(&self, Random random, int bits)
```
### `std::math::complex {Real}`

---

#### `IDENTITY`

```c3
const Complex IDENTITY = { 1, 0 }
```

---

#### `IMAGINARY`

```c3
const Complex IMAGINARY = { 0, 1 }
```

---

#### `Complex.add`

```c3
macro Complex Complex.add(self, Complex b) @operator(+)
```

---

#### `Complex.add_this`

```c3
macro Complex Complex.add_this(&self, Complex b) @operator(+=)
```

---

#### `Complex.add_real`

```c3
macro Complex Complex.add_real(self, Real r) @operator_s(+)
```

---

#### `Complex.add_each`

```c3
macro Complex Complex.add_each(self, Real b)
```

---

#### `Complex.sub`

```c3
macro Complex Complex.sub(self, Complex b) @operator(-)
```

---

#### `Complex.sub_this`

```c3
macro Complex Complex.sub_this(&self, Complex b) @operator(-=)
```

---

#### `Complex.sub_real`

```c3
macro Complex Complex.sub_real(self, Real r) @operator(-)
```

---

#### `Complex.sub_real_inverse`

```c3
macro Complex Complex.sub_real_inverse(self, Real r) @operator_r(-)
```

---

#### `Complex.sub_each`

```c3
macro Complex Complex.sub_each(self, Real b)
```

---

#### `Complex.scale`

```c3
macro Complex Complex.scale(self, Real r) @operator_s(*)
```

---

#### `Complex.mul`

```c3
macro Complex Complex.mul(self, Complex b)@operator(*)
```

---

#### `Complex.div_real`

```c3
macro Complex Complex.div_real(self, Real r) @operator(/)
```

---

#### `Complex.div_real_inverse`

```c3
macro Complex Complex.div_real_inverse(Complex c, Real r) @operator_r(/)
```

---

#### `Complex.div`

```c3
macro Complex Complex.div(self, Complex b) @operator(/)
```

---

#### `Complex.inverse`

```c3
macro Complex Complex.inverse(self)
```

---

#### `Complex.conjugate`

```c3
macro Complex Complex.conjugate(self)
```

---

#### `Complex.negate`

```c3
macro Complex Complex.negate(self) @operator(-)
```

---

#### `Complex.equals`

```c3
macro bool Complex.equals(self, Complex b) @operator(==)
```

---

#### `Complex.equals_real`

```c3
macro bool Complex.equals_real(self, Real r) @operator_s(==)
```

---

#### `Complex.not_equals`

```c3
macro bool Complex.not_equals(self, Complex b) @operator(!=)
```

---

#### `Complex.to_format`

```c3
fn usz? Complex.to_format(&self, Formatter* f) @dynamic
```
### `std::math::easing`

---

#### `linear_none`

```c3
fn float linear_none(float t, float b, float c, float d) @inline
```

---

#### `linear_in`

```c3
fn float linear_in(float t, float b, float c, float d) @inline
```

---

#### `linear_out`

```c3
fn float linear_out(float t, float b, float c, float d) @inline
```

---

#### `linear_inout`

```c3
fn float linear_inout(float t, float b, float c, float d) @inline
```

---

#### `sine_in`

```c3
fn float sine_in(float t, float b, float c, float d) @inline
```

---

#### `sine_out`

```c3
fn float sine_out(float t, float b, float c, float d) @inline
```

---

#### `sine_inout`

```c3
fn float sine_inout(float t, float b, float c, float d) @inline
```

---

#### `circ_in`

```c3
fn float circ_in(float t, float b, float c, float d) @inline
```

---

#### `circ_out`

```c3
fn float circ_out(float t, float b, float c, float d) @inline
```

---

#### `circ_inout`

```c3
fn float circ_inout(float t, float b, float c, float d) @inline
```

---

#### `cubic_in`

```c3
fn float cubic_in(float t, float b, float c, float d) @inline
```

---

#### `cubic_out`

```c3
fn float cubic_out(float t, float b, float c, float d) @inline
```

---

#### `cubic_inout`

```c3
fn float cubic_inout(float t, float b, float c, float d) @inline
```

---

#### `quad_in`

```c3
fn float quad_in(float t, float b, float c, float d) @inline
```

---

#### `quad_out`

```c3
fn float quad_out(float t, float b, float c, float d) @inline
```

---

#### `quad_inout`

```c3
fn float quad_inout(float t, float b, float c, float d) @inline
```

---

#### `expo_in`

```c3
fn float expo_in(float t, float b, float c, float d) @inline
```

---

#### `expo_out`

```c3
fn float expo_out(float t, float b, float c, float d) @inline
```

---

#### `expo_inout`

```c3
fn float expo_inout(float t, float b, float c, float d) @inline
```

---

#### `back_in`

```c3
fn float back_in(float t, float b, float c, float d, float s = 1.70158f) @inline
```

---

#### `back_out`

```c3
fn float back_out(float t, float b, float c, float d, float s = 1.70158f) @inline
```

---

#### `back_inout`

```c3
fn float back_inout(float t, float b, float c, float d, float s = 1.70158f) @inline
```

---

#### `bounce_out`

```c3
fn float bounce_out(float t, float b, float c, float d) @inline
```

---

#### `bounce_in`

```c3
fn float bounce_in(float t, float b, float c, float d) @inline
```

---

#### `bounce_inout`

```c3
fn float bounce_inout(float t, float b, float c, float d) @inline
```

---

#### `elastic_in`

```c3
fn float elastic_in(float t, float b, float c, float d) @inline
```

---

#### `elastic_out`

```c3
fn float elastic_out(float t, float b, float c, float d) @inline
```

---

#### `elastic_inout`

```c3
fn float elastic_inout(float t, float b, float c, float d) @inline
```

---

#### `sq`

```c3
macro sq(x) @private
```

---

#### `cube`

```c3
macro cube(x) @private
```
### `std::math::math_rt`

---

#### `__divti3`

```c3
fn int128 __divti3(int128 a, int128 b) @extern("__divti3") @weak @nostrip
```

---

#### `@__udivmodti4`

```c3
macro uint128 @__udivmodti4(uint128 a, uint128 b, bool $return_rem)
```

---

#### `__umodti3`

```c3
fn uint128 __umodti3(uint128 n, uint128 d) @extern("__umodti3") @weak @nostrip
```

---

#### `__udivti3`

```c3
fn uint128 __udivti3(uint128 n, uint128 d) @extern("__udivti3") @weak @nostrip
```

---

#### `__modti3`

```c3
fn int128 __modti3(int128 a, int128 b) @extern("__modti3") @weak @nostrip
```

---

#### `__lshrti3`

```c3
fn uint128 __lshrti3(uint128 a, uint b) @extern("__lshrti3") @weak @nostrip
```

---

#### `__ashrti3`

```c3
fn int128 __ashrti3(int128 a, uint b) @extern("__ashrti3") @weak @nostrip
```

---

#### `__ashlti3`

```c3
fn int128 __ashlti3(int128 a, uint b) @extern("__ashlti3") @weak @nostrip
```

---

#### `__mulddi3`

```c3
fn int128 __mulddi3(ulong a, ulong b) @private
```

---

#### `__multi3`

```c3
fn int128 __multi3(int128 a, int128 b) @extern("__multi3") @weak @nostrip
```

---

#### `__floattisf`

```c3
fn float __floattisf(int128 a) @extern("__floattisf") @weak @nostrip
```

---

#### `__floattidf`

```c3
fn double __floattidf(int128 a) @extern("__floattidf") @weak @nostrip
```

---

#### `__floatuntisf`

```c3
fn float __floatuntisf(uint128 a) @extern("__floatuntisf") @weak @nostrip
```

---

#### `__floatuntidf`

```c3
fn double __floatuntidf(uint128 a) @extern("__floatuntidf") @weak @nostrip
```

---

#### `__fixunsdfti`

```c3
fn uint128 __fixunsdfti(double a) @weak @extern("__fixunsdfti") @nostrip
```

---

#### `__fixunssfti`

```c3
fn uint128 __fixunssfti(float a) @weak @extern("__fixunssfti") @nostrip
```

---

#### `__fixdfti`

```c3
fn int128 __fixdfti(double a) @weak @extern("__fixdfti") @nostrip
```

---

#### `__fixsfti`

```c3
fn int128 __fixsfti(float a) @weak @extern("__fixsfti") @nostrip
```

---

#### `float_from_i128`

```c3
macro float_from_i128($Type, a) @private
```

---

#### `float_from_u128`

```c3
macro float_from_u128($Type, a) @private
```

---

#### `fixuint`

```c3
macro fixuint(a) @private
```

---

#### `fixint`

```c3
macro fixint(a) @private
```

---

#### `__roundevenf`

```c3
fn float __roundevenf(float f) @extern("roundevenf") @weak @nostrip
```

---

#### `__roundeven`

```c3
fn double __roundeven(double d) @extern("roundeven") @weak @nostrip
```

---

#### `__powidf2`

```c3
fn double __powidf2(double a, int b) @extern("__powidf2") @weak @nostrip
```
### `std::math::matrix {Real}`

---

#### `Matrix`

```c3
struct Matrix2x2
```
```c3
struct Matrix3x3
```
```c3
struct Matrix4x4
```

---

#### `Matrix2x2.apply`

```c3
fn Real[<2>] Matrix2x2.apply(&self, Real[<2>] vec) @operator(*)
```

---

#### `Matrix3x3.apply`

```c3
fn Real[<3>] Matrix3x3.apply(&self, Real[<3>] vec) @operator(*)
```

---

#### `Matrix4x4.apply`

```c3
fn Real[<4>] Matrix4x4.apply(&self, Real[<4>] vec) @operator(*)
```

---

#### `Matrix2x2.mul`

```c3
fn Matrix2x2 Matrix2x2.mul(&self, Matrix2x2 b) @operator(*)
```

---

#### `Matrix3x3.mul`

```c3
fn Matrix3x3 Matrix3x3.mul(&self, Matrix3x3 b) @operator(*)
```

---

#### `Matrix4x4.mul`

```c3
fn Matrix4x4 Matrix4x4.mul(Matrix4x4* self, Matrix4x4 b) @operator(*)
```

---

#### `Matrix2x2.component_mul`

```c3
fn Matrix2x2 Matrix2x2.component_mul(&self, Real s)
```

---

#### `Matrix3x3.component_mul`

```c3
fn Matrix3x3 Matrix3x3.component_mul(&self, Real s)
```

---

#### `Matrix4x4.component_mul`

```c3
fn Matrix4x4 Matrix4x4.component_mul(&self, Real s)
```

---

#### `Matrix2x2.add`

```c3
fn Matrix2x2 Matrix2x2.add(&self, Matrix2x2 mat2) @operator(+)
```

---

#### `Matrix3x3.add`

```c3
fn Matrix3x3 Matrix3x3.add(&self, Matrix3x3 mat2) @operator(+)
```

---

#### `Matrix4x4.add`

```c3
fn Matrix4x4 Matrix4x4.add(&self, Matrix4x4 mat2) @operator(+)
```

---

#### `Matrix2x2.sub`

```c3
fn Matrix2x2 Matrix2x2.sub(&self, Matrix2x2 mat2) @operator(-)
```

---

#### `Matrix3x3.sub`

```c3
fn Matrix3x3 Matrix3x3.sub(&self, Matrix3x3 mat2) @operator(-)
```

---

#### `Matrix4x4.sub`

```c3
fn Matrix4x4 Matrix4x4.sub(&self, Matrix4x4 mat2) @operator(-)
```

---

#### `Matrix2x2.negate`

```c3
fn Matrix2x2 Matrix2x2.negate(&self) @operator(-)
```

---

#### `Matrix3x3.negate`

```c3
fn Matrix3x3 Matrix3x3.negate(&self) @operator(-)
```

---

#### `Matrix4x4.negate`

```c3
fn Matrix4x4 Matrix4x4.negate(&self) @operator(-)
```

---

#### `Matrix2x2.eq`

```c3
fn bool Matrix2x2.eq(&self, Matrix2x2 mat2) @operator(==)
```

---

#### `Matrix3x3.eq`

```c3
fn bool Matrix3x3.eq(&self, Matrix3x3 mat2) @operator(==)
```

---

#### `Matrix4x4.eq`

```c3
fn bool Matrix4x4.eq(&self, Matrix4x4 mat2) @operator(==)
```

---

#### `Matrix2x2.neq`

```c3
fn bool Matrix2x2.neq(&self, Matrix2x2 mat2) @operator(!=)
```

---

#### `Matrix3x3.neq`

```c3
fn bool Matrix3x3.neq(&self, Matrix3x3 mat2) @operator(!=)
```

---

#### `Matrix4x4.neq`

```c3
fn bool Matrix4x4.neq(&self, Matrix4x4 mat2) @operator(!=)
```

---

#### `look_at`

```c3
fn Matrix4x4 look_at(Real[<3>] eye, Real[<3>] target, Real[<3>] up)
```

---

#### `Matrix2x2.transpose`

```c3
fn Matrix2x2 Matrix2x2.transpose(&self)
```

---

#### `Matrix3x3.transpose`

```c3
fn Matrix3x3 Matrix3x3.transpose(&self)
```

---

#### `Matrix4x4.transpose`

```c3
fn Matrix4x4 Matrix4x4.transpose(&self)
```

---

#### `Matrix2x2.determinant`

```c3
fn Real Matrix2x2.determinant(&self)
```

---

#### `Matrix3x3.determinant`

```c3
fn Real Matrix3x3.determinant(&self)
```

---

#### `Matrix4x4.determinant`

```c3
fn Real Matrix4x4.determinant(&self)
```

---

#### `Matrix2x2.adjoint`

```c3
fn Matrix2x2 Matrix2x2.adjoint(&self)
```

---

#### `Matrix3x3.adjoint`

```c3
fn Matrix3x3 Matrix3x3.adjoint(&self)
```

---

#### `Matrix4x4.adjoint`

```c3
fn Matrix4x4 Matrix4x4.adjoint(&self)
```

---

#### `Matrix2x2.inverse`

```c3
fn Matrix2x2? Matrix2x2.inverse(&self)
```

---

#### `Matrix3x3.inverse`

```c3
fn Matrix3x3? Matrix3x3.inverse(&self)
```

---

#### `Matrix4x4.inverse`

```c3
fn Matrix4x4? Matrix4x4.inverse(&self)
```

---

#### `Matrix3x3.translate`

```c3
fn Matrix3x3 Matrix3x3.translate(&self, Real[<2>] v)
```

---

#### `Matrix4x4.translate`

```c3
fn Matrix4x4 Matrix4x4.translate(&self, Real[<3>] v)
```

---

#### `Matrix3x3.rotate`

```c3
fn Matrix3x3 Matrix3x3.rotate(&self, Real r)
```

---

#### `Matrix4x4.rotate_z`

```c3
fn Matrix4x4 Matrix4x4.rotate_z(&self, Real r)
```

---

#### `Matrix4x4.rotate_y`

```c3
fn Matrix4x4 Matrix4x4.rotate_y(&self, Real r)
```

---

#### `Matrix4x4.rotate_x`

```c3
fn Matrix4x4 Matrix4x4.rotate_x(&self, Real r)
```

---

#### `Matrix3x3.scale`

```c3
fn Matrix3x3 Matrix3x3.scale(&self, Real[<2>] v)
```

---

#### `Matrix2x2.trace`

```c3
fn Real Matrix2x2.trace(&self)
```

---

#### `Matrix3x3.trace`

```c3
fn Real Matrix3x3.trace(&self)
```

---

#### `Matrix4x4.trace`

```c3
fn Real Matrix4x4.trace(&self)
```

---

#### `Matrix4x4.scale`

```c3
fn Matrix4x4 Matrix4x4.scale(&self, Real[<3>] v)
```

---

#### `ortho`

```c3
fn Matrix4x4 ortho(Real left, Real right, Real top, Real bottom, Real near, Real far)
```

---

#### `perspective`

```c3
fn Matrix4x4 perspective(Real fov, Real aspect_ratio, Real near, Real far)
```

---

#### `IDENTITY2`

```c3
const Matrix2x2 IDENTITY2 = { .m = { [0] = 1, [3] = 1 } }
```

---

#### `IDENTITY3`

```c3
const Matrix3x3 IDENTITY3 = { .m = { [0] = 1, [4] = 1, [8] = 1 } }
```

---

#### `IDENTITY4`

```c3
const Matrix4x4 IDENTITY4 = { .m = { [0] = 1, [5] = 1, [10] = 1, [15] = 1 } }
```

---

#### `matrix_component_mul`

```c3
macro matrix_component_mul(mat, val) @private
```

---

#### `matrix_add`

```c3
macro matrix_add(mat, mat2) @private
```

---

#### `matrix_sub`

```c3
macro matrix_sub(mat, mat2) @private
```

---

#### `matrix_look_at`

```c3
macro matrix_look_at($Type, eye, target, up) @private
```
### `std::math::nolibc @if(env::NO_LIBC || $feature(C3_MATH))`

---

#### `__cos`

```c3
fn double __cos(double x, double y) @extern("__cos") @weak @nostrip
```

---

#### `__cosdf`

```c3
fn float __cosdf(double x) @extern("__cosdf") @weak @nostrip
```

---

#### `fmod`

```c3
fn double fmod(double x, double y) @extern("fmod") @weak @nostrip
```

---

#### `fmodf`

```c3
fn float fmodf(float x, float y) @extern("fmodf") @weak @nostrip
```

---

#### `__sin`

```c3
fn double __sin(double x, double y, int iy) @extern("__sin") @weak @nostrip
```

---

#### `__sindf`

```c3
fn float __sindf(double x) @extern("__sindf") @weak @nostrip
```

---

#### `TAN_T`

```c3
const double[*] TAN_T = {
             3.33333333333334091986e-01, /* 3FD55555, 55555563 */
             1.33333333333201242699e-01, /* 3FC11111, 1110FE7A */
             5.39682539762260521377e-02, /* 3FABA1BA, 1BB341FE */
             2.18694882948595424599e-02, /* 3F9664F4, 8406D637 */
             8.86323982359930005737e-03, /* 3F8226E3, E96E8493 */
             3.59207910759131235356e-03, /* 3F6D6D22, C9560328 */
             1.45620945432529025516e-03, /* 3F57DBC8, FEE08315 */
             5.88041240820264096874e-04, /* 3F4344D8, F2F26501 */
             2.46463134818469906812e-04, /* 3F3026F7, 1A8D1068 */
             7.81794442939557092300e-05, /* 3F147E88, A03792A6 */
             7.14072491382608190305e-05, /* 3F12B80F, 32F0A7E9 */
            -1.85586374855275456654e-05, /* BEF375CB, DB605373 */
             2.59073051863633712884e-05, /* 3EFB2A70, 74BF7AD4 */
}
```

---

#### `__tan`

```c3
fn double __tan(double x, double y, int odd) @extern("__tan") @weak @nostrip
```

---

#### `TANDF`

```c3
const double[*] TANDF = {
	0x15554d3418c99f.0p-54, /* 0.333331395030791399758 */
	0x1112fd38999f72.0p-55, /* 0.133392002712976742718 */
	0x1b54c91d865afe.0p-57, /* 0.0533812378445670393523 */
	0x191df3908c33ce.0p-58, /* 0.0245283181166547278873 */
	0x185dadfcecf44e.0p-61, /* 0.00297435743359967304927 */
	0x1362b9bf971bcd.0p-59, /* 0.00946564784943673166728 */
}
```

---

#### `__tandf`

```c3
fn float __tandf(double x, int odd) @extern("__tandf") @weak @nostrip
```

---

#### `_r`

```c3
fn double _r(double z) @local
```
```c3
fn double _r(double z) @local
```

---

#### `_acos`

```c3
fn double _acos(double x) @weak @extern("acos") @nostrip
```

---

#### `_r_f`

```c3
fn float _r_f(float z) @local
```
```c3
fn float _r_f(float z) @local
```

---

#### `_acosf`

```c3
fn float _acosf(float x) @weak @extern("acosf") @nostrip
```

---

#### `_asin`

```c3
fn double _asin(double x) @weak @extern("asin") @nostrip
```

---

#### `_asinf`

```c3
fn float _asinf(float x) @weak @extern("asinf") @nostrip
```

---

#### `_atan`

```c3
fn double _atan(double x) @weak @extern("atan") @nostrip
```

---

#### `_atanf`

```c3
fn float _atanf(float x) @weak @extern("atanf") @nostrip
```

---

#### `_atan2`

```c3
fn double _atan2(double y, double x) @weak @extern("atan2") @nostrip
```

---

#### `_atan2f`

```c3
fn float _atan2f(float y, float x) @weak @extern("atan2f") @nostrip
```

---

#### `_atanh`

```c3
fn double _atanh(double x) @weak @extern("atanh") @nostrip
```

---

#### `_atanhf`

```c3
fn float _atanhf(float x) @weak @extern("atanhf") @nostrip
```

---

#### `_ceil`

```c3
fn double _ceil(double x) @weak @extern("ceil") @nostrip
```

---

#### `_ceilf`

```c3
fn float _ceilf(float x) @weak @extern("ceilf") @nostrip
```

---

#### `_cosf`

```c3
fn float _cosf(float x) @extern("cosf") @weak @nostrip
```

---

#### `_cos`

```c3
fn double _cos(double x) @extern("cos")  @weak @nostrip
```

---

#### `EXP_LN2_HI`

```c3
const double EXP_LN2_HI = 6.93147180369123816490e-01
```

---

#### `EXP_LN2_LO`

```c3
const double EXP_LN2_LO = 1.90821492927058770002e-10
```

---

#### `EXP_INV_LN2`

```c3
const double EXP_INV_LN2 = 1.44269504088896338700e+00
```

---

#### `EXP_P1`

```c3
const double EXP_P1 = 1.66666666666666019037e-01
```

---

#### `EXP_P2`

```c3
const double EXP_P2 = -2.77777777770155933842e-03
```

---

#### `EXP_P3`

```c3
const double EXP_P3 = 6.61375632143793436117e-05
```

---

#### `EXP_P4`

```c3
const double EXP_P4 = -1.65339022054652515390e-06
```

---

#### `EXP_P5`

```c3
const double EXP_P5 = 4.13813679705723846039e-08
```

---

#### `EXPF_LN2_HI`

```c3
const float EXPF_LN2_HI = 6.9314575195e-01f
```

---

#### `EXPF_LN2_LO`

```c3
const float EXPF_LN2_LO = 1.4286067653e-06f
```

---

#### `EXPF_INV_LN2`

```c3
const float EXPF_INV_LN2 = 1.4426950216e+00f
```

---

#### `EXPF_P1`

```c3
const float EXPF_P1 = 1.6666667163e-01f
```

---

#### `EXPF_P2`

```c3
const float EXPF_P2 = -2.7777778450e-03f
```

---

#### `EXPF_P3`

```c3
const float EXPF_P3 = 6.6137559770e-05f
```

---

#### `EXPF_P4`

```c3
const float EXPF_P4 = -1.6533901999e-06f
```

---

#### `exp`

```c3
fn double exp(double x) @extern("exp")
```

---

#### `expf`

```c3
fn float expf(float x) @extern("expf")
```

---

#### `_top12f`

```c3
macro uint _top12f(float x) @private
```

---

#### `_exp2f`

```c3
fn float _exp2f(float x) @extern("exp2f") @weak @nostrip
```

---

#### `_exp2_specialcase`

```c3
fn double _exp2_specialcase(double tmp, ulong sbits, ulong ki) @private
```

---

#### `_top12d`

```c3
macro uint _top12d(double x) @private
```

---

#### `_exp2`

```c3
fn double _exp2(double x) @extern("exp2") @weak @nostrip
```

---

#### `_fabs`

```c3
fn double _fabs(double x) @weak @extern("fabs") @nostrip
```

---

#### `_fabsf`

```c3
fn float _fabsf(float x) @weak @extern("fabsf") @nostrip
```

---

#### `_floor`

```c3
fn double _floor(double x) @weak @extern("floor") @nostrip
```

---

#### `_floorf`

```c3
fn float _floorf(float x) @weak @extern("floorf") @nostrip
```

---

#### `frexp`

```c3
fn double frexp(double x, int* exp) @extern("frexp")
```

---

#### `frexpf`

```c3
fn float frexpf(float x, int* exp) @extern("frexpf")
```

---

#### `ldexp`

```c3
fn double ldexp(double x, int exp) @extern("ldexp")
```

---

#### `ldexpf`

```c3
fn float ldexpf(float x, int exp) @extern("ldexpf")
```

---

#### `LOG_LN2_HI`

```c3
const double LOG_LN2_HI = 6.93147180369123816490e-01
```

---

#### `LOG_LN2_LO`

```c3
const double LOG_LN2_LO = 1.90821492927058770002e-10
```

---

#### `LOG_L1`

```c3
const double LOG_L1 = 6.666666666666735130e-01
```

---

#### `LOG_L2`

```c3
const double LOG_L2 = 3.999999999940941908e-01
```

---

#### `LOG_L3`

```c3
const double LOG_L3 = 2.857142874366239149e-01
```

---

#### `LOG_L4`

```c3
const double LOG_L4 = 2.222219843214978396e-01
```

---

#### `LOG_L5`

```c3
const double LOG_L5 = 1.818357216161805012e-01
```

---

#### `LOG_L6`

```c3
const double LOG_L6 = 1.531383769920937332e-01
```

---

#### `LOGF_LN2_HI`

```c3
const float LOGF_LN2_HI = 6.9313812256e-01f
```

---

#### `LOGF_LN2_LO`

```c3
const float LOGF_LN2_LO = 9.0580006145e-06f
```

---

#### `LOGF_L1`

```c3
const float LOGF_L1 = 6.6666662693e-01f
```

---

#### `LOGF_L2`

```c3
const float LOGF_L2 = 4.0000972152e-01f
```

---

#### `LOGF_L3`

```c3
const float LOGF_L3 = 2.8498786688e-01f
```

---

#### `LOGF_L4`

```c3
const float LOGF_L4 = 2.4279078841e-01f
```

---

#### `SQRT2`

```c3
const double SQRT2 = 1.41421356237309504880
```

---

#### `SQRT2F`

```c3
const float SQRT2F = 1.41421356237309504880f
```

---

#### `log`

```c3
fn double log(double x) @extern("log")
```

---

#### `logf`

```c3
fn float logf(float x) @extern("logf")
```

---

#### `_log1p`

```c3
fn double _log1p(double x) @weak @extern("log1p") @nostrip
```

---

#### `_log1pf`

```c3
fn float _log1pf(float x) @weak @extern("log1pf") @nostrip
```

---

#### `TOINT`

```c3
const double TOINT = 1 / math::DOUBLE_EPSILON
```

---

#### `TOINT15`

```c3
const double TOINT15 = 1.5 / math::DOUBLE_EPSILON
```

---

#### `TOINTF`

```c3
const float TOINTF = (float)(1 / math::FLOAT_EPSILON)
```

---

#### `EXP_TABLE_BITS`

```c3
const EXP_TABLE_BITS = 7
```

---

#### `EXP_POLY_ORDER`

```c3
const EXP_POLY_ORDER = 5
```

---

#### `EXP2_POLY_ORDER`

```c3
const EXP2_POLY_ORDER = 5
```

---

#### `EXP_DATA_WIDTH`

```c3
const EXP_DATA_WIDTH = 1 << EXP_TABLE_BITS
```

---

#### `__EXP2_DATA`

```c3
const Exp2Data __EXP2_DATA = {
	// N/ln2
	.invln2N = 0x1.71547652b82fep0 * EXP_DATA_WIDTH,
	// -ln2/N
	.negln2hiN = -0x1.62e42fefa0000p-8,
	.negln2loN = -0x1.cf79abc9e3b3ap-47,
	.shift = 0x1.8p52,
	// exp polynomial coefficients.
	.poly = {
		// abs error: 1.555*2^-66
		// ulp error: 0.509 (0.511 without fma)
		// if |x| < ln2/256+eps
		// abs error if |x| < ln2/256+0x1p-15: 1.09*2^-65
		// abs error if |x| < ln2/128: 1.7145*2^-56
		0x1.ffffffffffdbdp-2,
		0x1.555555555543cp-3,
		0x1.55555cf172b91p-5,
		0x1.1111167a4d017p-7,
	},
	.exp2_shift = 0x1.8p52 / EXP_DATA_WIDTH,
	// exp2 polynomial coefficients.
	.exp2_poly = {
		// abs error: 1.2195*2^-65
		// ulp error: 0.507 (0.511 without fma)
		// if |x| < 1/256
		// abs error if |x| < 1/128: 1.9941*2^-56
		0x1.62e42fefa39efp-1,
		0x1.ebfbdff82c424p-3,
		0x1.c6b08d70cf4b5p-5,
		0x1.3b2abd24650ccp-7,
		0x1.5d7e09b4e3a84p-10,
	},
	// 2^(k/N) ~= H[k]*(1 + T[k]) for int k in [0,N)
	// tab[2*k] = asuint64(T[k])
	// tab[2*k+1] = asuint64(H[k]) - (k << 52)/N
	.tab = {
		0x0, 0x3ff0000000000000,
		0x3c9b3b4f1a88bf6e, 0x3feff63da9fb3335,
		0xbc7160139cd8dc5d, 0x3fefec9a3e778061,
		0xbc905e7a108766d1, 0x3fefe315e86e7f85,
		0x3c8cd2523567f613, 0x3fefd9b0d3158574,
		0xbc8bce8023f98efa, 0x3fefd06b29ddf6de,
		0x3c60f74e61e6c861, 0x3fefc74518759bc8,
		0x3c90a3e45b33d399, 0x3fefbe3ecac6f383,
		0x3c979aa65d837b6d, 0x3fefb5586cf9890f,
		0x3c8eb51a92fdeffc, 0x3fefac922b7247f7,
		0x3c3ebe3d702f9cd1, 0x3fefa3ec32d3d1a2,
		0xbc6a033489906e0b, 0x3fef9b66affed31b,
		0xbc9556522a2fbd0e, 0x3fef9301d0125b51,
		0xbc5080ef8c4eea55, 0x3fef8abdc06c31cc,
		0xbc91c923b9d5f416, 0x3fef829aaea92de0,
		0x3c80d3e3e95c55af, 0x3fef7a98c8a58e51,
		0xbc801b15eaa59348, 0x3fef72b83c7d517b,
		0xbc8f1ff055de323d, 0x3fef6af9388c8dea,
		0x3c8b898c3f1353bf, 0x3fef635beb6fcb75,
		0xbc96d99c7611eb26, 0x3fef5be084045cd4,
		0x3c9aecf73e3a2f60, 0x3fef54873168b9aa,
		0xbc8fe782cb86389d, 0x3fef4d5022fcd91d,
		0x3c8a6f4144a6c38d, 0x3fef463b88628cd6,
		0x3c807a05b0e4047d, 0x3fef3f49917ddc96,
		0x3c968efde3a8a894, 0x3fef387a6e756238,
		0x3c875e18f274487d, 0x3fef31ce4fb2a63f,
		0x3c80472b981fe7f2, 0x3fef2b4565e27cdd,
		0xbc96b87b3f71085e, 0x3fef24dfe1f56381,
		0x3c82f7e16d09ab31, 0x3fef1e9df51fdee1,
		0xbc3d219b1a6fbffa, 0x3fef187fd0dad990,
		0x3c8b3782720c0ab4, 0x3fef1285a6e4030b,
		0x3c6e149289cecb8f, 0x3fef0cafa93e2f56,
		0x3c834d754db0abb6, 0x3fef06fe0a31b715,
		0x3c864201e2ac744c, 0x3fef0170fc4cd831,
		0x3c8fdd395dd3f84a, 0x3feefc08b26416ff,
		0xbc86a3803b8e5b04, 0x3feef6c55f929ff1,
		0xbc924aedcc4b5068, 0x3feef1a7373aa9cb,
		0xbc9907f81b512d8e, 0x3feeecae6d05d866,
		0xbc71d1e83e9436d2, 0x3feee7db34e59ff7,
		0xbc991919b3ce1b15, 0x3feee32dc313a8e5,
		0x3c859f48a72a4c6d, 0x3feedea64c123422,
		0xbc9312607a28698a, 0x3feeda4504ac801c,
		0xbc58a78f4817895b, 0x3feed60a21f72e2a,
		0xbc7c2c9b67499a1b, 0x3feed1f5d950a897,
		0x3c4363ed60c2ac11, 0x3feece086061892d,
		0x3c9666093b0664ef, 0x3feeca41ed1d0057,
		0x3c6ecce1daa10379, 0x3feec6a2b5c13cd0,
		0x3c93ff8e3f0f1230, 0x3feec32af0d7d3de,
		0x3c7690cebb7aafb0, 0x3feebfdad5362a27,
		0x3c931dbdeb54e077, 0x3feebcb299fddd0d,
		0xbc8f94340071a38e, 0x3feeb9b2769d2ca7,
		0xbc87deccdc93a349, 0x3feeb6daa2cf6642,
		0xbc78dec6bd0f385f, 0x3feeb42b569d4f82,
		0xbc861246ec7b5cf6, 0x3feeb1a4ca5d920f,
		0x3c93350518fdd78e, 0x3feeaf4736b527da,
		0x3c7b98b72f8a9b05, 0x3feead12d497c7fd,
		0x3c9063e1e21c5409, 0x3feeab07dd485429,
		0x3c34c7855019c6ea, 0x3feea9268a5946b7,
		0x3c9432e62b64c035, 0x3feea76f15ad2148,
		0xbc8ce44a6199769f, 0x3feea5e1b976dc09,
		0xbc8c33c53bef4da8, 0x3feea47eb03a5585,
		0xbc845378892be9ae, 0x3feea34634ccc320,
		0xbc93cedd78565858, 0x3feea23882552225,
		0x3c5710aa807e1964, 0x3feea155d44ca973,
		0xbc93b3efbf5e2228, 0x3feea09e667f3bcd,
		0xbc6a12ad8734b982, 0x3feea012750bdabf,
		0xbc6367efb86da9ee, 0x3fee9fb23c651a2f,
		0xbc80dc3d54e08851, 0x3fee9f7df9519484,
		0xbc781f647e5a3ecf, 0x3fee9f75e8ec5f74,
		0xbc86ee4ac08b7db0, 0x3fee9f9a48a58174,
		0xbc8619321e55e68a, 0x3fee9feb564267c9,
		0x3c909ccb5e09d4d3, 0x3feea0694fde5d3f,
		0xbc7b32dcb94da51d, 0x3feea11473eb0187,
		0x3c94ecfd5467c06b, 0x3feea1ed0130c132,
		0x3c65ebe1abd66c55, 0x3feea2f336cf4e62,
		0xbc88a1c52fb3cf42, 0x3feea427543e1a12,
		0xbc9369b6f13b3734, 0x3feea589994cce13,
		0xbc805e843a19ff1e, 0x3feea71a4623c7ad,
		0xbc94d450d872576e, 0x3feea8d99b4492ed,
		0x3c90ad675b0e8a00, 0x3feeaac7d98a6699,
		0x3c8db72fc1f0eab4, 0x3feeace5422aa0db,
		0xbc65b6609cc5e7ff, 0x3feeaf3216b5448c,
		0x3c7bf68359f35f44, 0x3feeb1ae99157736,
		0xbc93091fa71e3d83, 0x3feeb45b0b91ffc6,
		0xbc5da9b88b6c1e29, 0x3feeb737b0cdc5e5,
		0xbc6c23f97c90b959, 0x3feeba44cbc8520f,
		0xbc92434322f4f9aa, 0x3feebd829fde4e50,
		0xbc85ca6cd7668e4b, 0x3feec0f170ca07ba,
		0x3c71affc2b91ce27, 0x3feec49182a3f090,
		0x3c6dd235e10a73bb, 0x3feec86319e32323,
		0xbc87c50422622263, 0x3feecc667b5de565,
		0x3c8b1c86e3e231d5, 0x3feed09bec4a2d33,
		0xbc91bbd1d3bcbb15, 0x3feed503b23e255d,
		0x3c90cc319cee31d2, 0x3feed99e1330b358,
		0x3c8469846e735ab3, 0x3feede6b5579fdbf,
		0xbc82dfcd978e9db4, 0x3feee36bbfd3f37a,
		0x3c8c1a7792cb3387, 0x3feee89f995ad3ad,
		0xbc907b8f4ad1d9fa, 0x3feeee07298db666,
		0xbc55c3d956dcaeba, 0x3feef3a2b84f15fb,
		0xbc90a40e3da6f640, 0x3feef9728de5593a,
		0xbc68d6f438ad9334, 0x3feeff76f2fb5e47,
		0xbc91eee26b588a35, 0x3fef05b030a1064a,
		0x3c74ffd70a5fddcd, 0x3fef0c1e904bc1d2,
		0xbc91bdfbfa9298ac, 0x3fef12c25bd71e09,
		0x3c736eae30af0cb3, 0x3fef199bdd85529c,
		0x3c8ee3325c9ffd94, 0x3fef20ab5fffd07a,
		0x3c84e08fd10959ac, 0x3fef27f12e57d14b,
		0x3c63cdaf384e1a67, 0x3fef2f6d9406e7b5,
		0x3c676b2c6c921968, 0x3fef3720dcef9069,
		0xbc808a1883ccb5d2, 0x3fef3f0b555dc3fa,
		0xbc8fad5d3ffffa6f, 0x3fef472d4a07897c,
		0xbc900dae3875a949, 0x3fef4f87080d89f2,
		0x3c74a385a63d07a7, 0x3fef5818dcfba487,
		0xbc82919e2040220f, 0x3fef60e316c98398,
		0x3c8e5a50d5c192ac, 0x3fef69e603db3285,
		0x3c843a59ac016b4b, 0x3fef7321f301b460,
		0xbc82d52107b43e1f, 0x3fef7c97337b9b5f,
		0xbc892ab93b470dc9, 0x3fef864614f5a129,
		0x3c74b604603a88d3, 0x3fef902ee78b3ff6,
		0x3c83c5ec519d7271, 0x3fef9a51fbc74c83,
		0xbc8ff7128fd391f0, 0x3fefa4afa2a490da,
		0xbc8dae98e223747d, 0x3fefaf482d8e67f1,
		0x3c8ec3bc41aa2008, 0x3fefba1bee615a27,
		0x3c842b94c3a9eb32, 0x3fefc52b376bba97,
		0x3c8a64a931d185ee, 0x3fefd0765b6e4540,
		0xbc8e37bae43be3ed, 0x3fefdbfdad9cbe14,
		0x3c77893b4d91cd9d, 0x3fefe7c1819e90d8,
		0x3c5305c14160cc89, 0x3feff3c22b8f71f1,
	}
}
```

---

#### `WANT_ROUNDING`

```c3
const bool WANT_ROUNDING = true
```

---

#### `__math_uflowf`

```c3
macro float __math_uflowf(uint sign)
```

---

#### `__math_uflow`

```c3
macro double __math_uflow(ulong sign)
```

---

#### `__math_oflowf`

```c3
macro float __math_oflowf(uint sign)
```

---

#### `__math_oflow`

```c3
macro double __math_oflow(ulong sign)
```

---

#### `__math_xflow`

```c3
macro __math_xflow(sign, v)
```

---

#### `force_eval_add`

```c3
macro force_eval_add(x, v)
```

---

#### `pow`

```c3
fn double pow(double x, double y) @extern("pow")
```

---

#### `powf`

```c3
fn float powf(float x, float y) @extern("powf")
```

---

#### `__rem_pio2f`

```c3
fn int __rem_pio2f(float x, double *y)
```

---

#### `INIT_JK`

```c3
const int[*] INIT_JK = {3,4,4,6}
```

---

#### `IPIO2`

```c3
const int[*] IPIO2 = {
0xA2F983, 0x6E4E44, 0x1529FC, 0x2757D1, 0xF534DD, 0xC0DB62,
0x95993C, 0x439041, 0xFE5163, 0xABDEBB, 0xC561B7, 0x246E3A,
0x424DD2, 0xE00649, 0x2EEA09, 0xD1921C, 0xFE1DEB, 0x1CB129,
0xA73EE8, 0x8235F5, 0x2EBB44, 0x84E99C, 0x7026B4, 0x5F7E41,
0x3991D6, 0x398353, 0x39F49C, 0x845F8B, 0xBDF928, 0x3B1FF8,
0x97FFDE, 0x05980F, 0xEF2F11, 0x8B5A0A, 0x6D1F6D, 0x367ECF,
0x27CB09, 0xB74F46, 0x3F669E, 0x5FEA2D, 0x7527BA, 0xC7EBE5,
0xF17B3D, 0x0739F7, 0x8A5292, 0xEA6BFB, 0x5FB11F, 0x8D5D08,
0x560330, 0x46FC7B, 0x6BABF0, 0xCFBC20, 0x9AF436, 0x1DA9E3,
0x91615E, 0xE61B08, 0x659985, 0x5F14A0, 0x68408D, 0xFFD880,
0x4D7327, 0x310606, 0x1556CA, 0x73A8C9, 0x60E27B, 0xC08C6B, }
```

---

#### `__rem_pio2_large`

```c3
fn int __rem_pio2_large(double* x, double* y, int e0, int nx, int prec)
```

---

#### `__rem_pio2`

```c3
fn int __rem_pio2(double x, double *y)
```

caller must handle the case when reduction is not needed: |x| ~<= pi/4


---

#### `_round`

```c3
fn double _round(double x) @extern("round") @weak @nostrip
```

---

#### `_roundf`

```c3
fn float _roundf(float x) @extern("roundf") @weak @nostrip
```

---

#### `_scalbn`

```c3
fn double _scalbn(double x, int n) @weak @extern("scalbn") @nostrip
```

---

#### `_sinf`

```c3
fn float _sinf(float x) @weak @extern("sinf") @nostrip
```

---

#### `sin`

```c3
fn double sin(double x) @extern("sin") @weak @nostrip
```

---

#### `sincosf`

```c3
fn void sincosf(float x, float *sin, float *cos) @extern("__sincosf") @weak @nostrip
```

---

#### `sincos`

```c3
fn void sincos(double x, double *sin, double *cos) @extern("__sincos") @weak @nostrip
```

---

#### `tan`

```c3
fn double tan(double x) @extern("tan") @weak @nostrip
```

---

#### `tanf`

```c3
fn float tanf(float x) @extern("tanf") @weak @nostrip
```

---

#### `sincos_broken`

```c3
fn double sincos_broken(double x) @extern("sincos") @weak @nostrip
```

---

#### `_trunc`

```c3
fn double _trunc(double x) @weak @extern("trunc") @nostrip
```

---

#### `_truncf`

```c3
fn float _truncf(float x) @weak @extern("truncf") @nostrip
```
### `std::math::quaternion {Real}`

---

#### `IDENTITY`

```c3
const Quaternion IDENTITY = { 0, 0, 0, 1 }
```

---

#### `Quaternion.add`

```c3
macro Quaternion Quaternion.add(self, Quaternion b) @operator(+)
```

---

#### `Quaternion.add_each`

```c3
macro Quaternion Quaternion.add_each(self, Real b)
```

---

#### `Quaternion.sub`

```c3
macro Quaternion Quaternion.sub(self, Quaternion b) @operator(-)
```

---

#### `Quaternion.negate`

```c3
macro Quaternion Quaternion.negate(self) @operator(-)
```

---

#### `Quaternion.sub_each`

```c3
macro Quaternion Quaternion.sub_each(self, Real b)
```

---

#### `Quaternion.scale`

```c3
macro Quaternion Quaternion.scale(self, Real s) @operator_s(*)
```

---

#### `Quaternion.normalize`

```c3
macro Quaternion Quaternion.normalize(self)
```

---

#### `Quaternion.length`

```c3
macro Real Quaternion.length(self)
```

---

#### `Quaternion.lerp`

```c3
macro Quaternion Quaternion.lerp(self, Quaternion q2, Real amount)
```

---

#### `Quaternion.to_matrixf`

```c3
macro Matrix4f Quaternion.to_matrixf(&self)
```

---

#### `Quaternion.to_matrix`

```c3
macro Matrix4 Quaternion.to_matrix(&self)
```

---

#### `Quaternion.nlerp`

```c3
fn Quaternion Quaternion.nlerp(self, Quaternion q2, Real amount)
```

---

#### `Quaternion.invert`

```c3
fn Quaternion Quaternion.invert(self)
```

---

#### `Quaternion.slerp`

```c3
fn Quaternion Quaternion.slerp(self, Quaternion q2, Real amount)
```

---

#### `Quaternion.mul`

```c3
fn Quaternion Quaternion.mul(self, Quaternion b) @operator(*)
```

---

#### `into_matrix`

```c3
macro into_matrix(Quaternion* q, $Type) @private
```
### `std::math::random`

---

#### `seed`

```c3
<*
 @require is_random(random)
*>
macro void seed(random, seed)
```

---

#### `seed_entropy`

```c3
<*
 @require is_random(random)
*>
macro void seed_entropy(random)
```

Seed the random with some best effort entropy.


---

#### `next`

```c3
<*
 @require is_random(random)
 @require range > 0
*>
macro int next(random, uint range)
```

Get the next value between 0 and range (not including range).


---

#### `next_in_range`

```c3
<*
 @require is_random(random)
 @require max >= min
*>
macro int next_in_range(random, int min, int max)
```

Get a random in the range [min, max], both included.


---

#### `DefaultRandom`

```c3
alias DefaultRandom = Sfc64Random
```

---

#### `srand`

```c3
fn void srand(ulong seed) @builtin
```

Seed the default random function.


---

#### `rand`

```c3
fn int rand(int range) @builtin
```

Get a default random value between 0 and range (not including range)


---

#### `rand_in_range`

```c3
<*
 @require max >= min
*>
fn int rand_in_range(int min, int max) @builtin
```

Get a random in the range, both included.


---

#### `rnd`

```c3
fn double rnd() @builtin
```

---

#### `next_bool`

```c3
<*
 @require is_random(random)
*>
macro bool next_bool(random)
```

Get 'true' or 'false'


---

#### `next_float`

```c3
<*
 @require is_random(random)
*>
macro float next_float(random)
```

Get a float between 0 and 1.0, not including 1.0.


---

#### `next_double`

```c3
<*
 @require is_random(random)
*>
macro double next_double(random)
```

Get a double between 0 and 1.0, not including 1.0.


---

#### `is_random`

```c3
macro bool is_random(random)
```

---

#### `@long_to_int128`

```c3
macro uint128 @long_to_int128(#function)
```

---

#### `@int_to_long`

```c3
macro ulong @int_to_long(#function)
```

---

#### `@short_to_int`

```c3
macro uint @short_to_int(#function)
```

---

#### `@char_to_short`

```c3
macro ushort @char_to_short(#function)
```

---

#### `@random_value_to_bytes`

```c3
macro @random_value_to_bytes(#function, char[] bytes)
```

---

#### `init_default_random`

```c3
macro init_default_random() @private
```

---

#### `Lcg`

```c3
typedef Lcg128Random (Random) = uint128
```
```c3
typedef Lcg64Random (Random) = ulong
```
```c3
typedef Lcg32Random (Random) = uint
```
```c3
typedef Lcg16Random (Random) = ushort
```

---

#### `Lcg128Random.set_seed`

```c3
fn void Lcg128Random.set_seed(&self, char[] input) @dynamic
```

---

#### `Lcg128Random.next_long`

```c3
fn ulong Lcg128Random.next_long(&self) @dynamic
```

---

#### `Lcg128Random.next_bytes`

```c3
<*
 @require bytes.len > 0
*>
fn void Lcg128Random.next_bytes(&self, char[] bytes) @dynamic
```

---

#### `Lcg128Random.next_int128`

```c3
fn uint128 Lcg128Random.next_int128(&self) @dynamic
```

---

#### `Lcg128Random.next_int`

```c3
fn uint Lcg128Random.next_int(&self) @dynamic
```

---

#### `Lcg128Random.next_short`

```c3
fn ushort Lcg128Random.next_short(&self) @dynamic
```

---

#### `Lcg128Random.next_byte`

```c3
fn char Lcg128Random.next_byte(&self) @dynamic
```

---

#### `Lcg64Random.set_seed`

```c3
fn void Lcg64Random.set_seed(&self, char[] seed) @dynamic
```

---

#### `Lcg64Random.next_int`

```c3
fn uint Lcg64Random.next_int(&self) @dynamic
```

---

#### `Lcg64Random.next_bytes`

```c3
<*
 @require bytes.len > 0
*>
fn void Lcg64Random.next_bytes(&self, char[] bytes) @dynamic
```

---

#### `Lcg64Random.next_int128`

```c3
fn uint128 Lcg64Random.next_int128(&self) @dynamic
```

---

#### `Lcg64Random.next_long`

```c3
fn ulong Lcg64Random.next_long(&self) @dynamic
```

---

#### `Lcg64Random.next_short`

```c3
fn ushort Lcg64Random.next_short(&self) @dynamic
```

---

#### `Lcg64Random.next_byte`

```c3
fn char Lcg64Random.next_byte(&self) @dynamic
```

---

#### `Lcg32Random.set_seed`

```c3
fn void Lcg32Random.set_seed(&self, char[] seed) @dynamic
```

---

#### `Lcg32Random.next_short`

```c3
fn ushort Lcg32Random.next_short(&self) @dynamic
```

---

#### `Lcg32Random.next_bytes`

```c3
fn void Lcg32Random.next_bytes(&self, char[] bytes) @dynamic
```

---

#### `Lcg32Random.next_int128`

```c3
fn uint128 Lcg32Random.next_int128(&self) @dynamic
```

---

#### `Lcg32Random.next_long`

```c3
fn ulong Lcg32Random.next_long(&self) @dynamic
```

---

#### `Lcg32Random.next_int`

```c3
fn uint Lcg32Random.next_int(&self) @dynamic
```

---

#### `Lcg32Random.next_byte`

```c3
fn char Lcg32Random.next_byte(&self) @dynamic
```

---

#### `Lcg16Random.set_seed`

```c3
fn void Lcg16Random.set_seed(&self, char[] seed) @dynamic
```

---

#### `Lcg16Random.next_byte`

```c3
fn char Lcg16Random.next_byte(&self) @dynamic
```

---

#### `Lcg16Random.next_bytes`

```c3
fn void Lcg16Random.next_bytes(&self, char[] bytes) @dynamic
```

---

#### `Lcg16Random.next_int128`

```c3
fn uint128 Lcg16Random.next_int128(&self) @dynamic
```

---

#### `Lcg16Random.next_long`

```c3
fn ulong Lcg16Random.next_long(&self) @dynamic
```

---

#### `Lcg16Random.next_int`

```c3
fn uint Lcg16Random.next_int(&self) @dynamic
```

---

#### `Lcg16Random.next_short`

```c3
fn ushort Lcg16Random.next_short(&self) @dynamic
```

---

#### `Mcg`

```c3
typedef Mcg128Random (Random) = uint128
```
```c3
typedef Mcg64Random (Random) = ulong
```
```c3
typedef Mcg32Random (Random) = uint
```
```c3
typedef Mcg16Random (Random) = ushort
```

---

#### `Mcg128Random.set_seed`

```c3
fn void Mcg128Random.set_seed(&self, char[] seed) @dynamic
```

---

#### `Mcg128Random.next_bytes`

```c3
<*
 @require bytes.len > 0
*>
fn void Mcg128Random.next_bytes(&self, char[] bytes) @dynamic
```

---

#### `Mcg128Random.next_long`

```c3
fn ulong Mcg128Random.next_long(&self) @dynamic
```

---

#### `Mcg128Random.next_int128`

```c3
fn uint128 Mcg128Random.next_int128(&self) @dynamic
```

---

#### `Mcg128Random.next_int`

```c3
fn uint Mcg128Random.next_int(&self) @dynamic
```

---

#### `Mcg128Random.next_short`

```c3
fn ushort Mcg128Random.next_short(&self) @dynamic
```

---

#### `Mcg128Random.next_byte`

```c3
fn char Mcg128Random.next_byte(&self) @dynamic
```

---

#### `Mcg64Random.set_seed`

```c3
fn void Mcg64Random.set_seed(&self, char[] seed) @dynamic
```

---

#### `Mcg64Random.next_bytes`

```c3
<*
 @require bytes.len > 0
*>
fn void Mcg64Random.next_bytes(&self, char[] bytes) @dynamic
```

---

#### `Mcg64Random.next_int`

```c3
fn uint Mcg64Random.next_int(&self) @dynamic
```

---

#### `Mcg64Random.next_int128`

```c3
fn uint128 Mcg64Random.next_int128(&self) @dynamic
```

---

#### `Mcg64Random.next_long`

```c3
fn ulong Mcg64Random.next_long(&self) @dynamic
```

---

#### `Mcg64Random.next_short`

```c3
fn ushort Mcg64Random.next_short(&self) @dynamic
```

---

#### `Mcg64Random.next_byte`

```c3
fn char Mcg64Random.next_byte(&self) @dynamic
```

---

#### `Mcg32Random.set_seed`

```c3
fn void Mcg32Random.set_seed(&self, char[] seed) @dynamic
```

---

#### `Mcg32Random.next_short`

```c3
fn ushort Mcg32Random.next_short(&self) @dynamic
```

---

#### `Mcg32Random.next_bytes`

```c3
<*
 @require bytes.len > 0
*>
fn void Mcg32Random.next_bytes(&self, char[] bytes) @dynamic
```

---

#### `Mcg32Random.next_int128`

```c3
fn uint128 Mcg32Random.next_int128(&self) @dynamic
```

---

#### `Mcg32Random.next_long`

```c3
fn ulong Mcg32Random.next_long(&self) @dynamic
```

---

#### `Mcg32Random.next_int`

```c3
fn uint Mcg32Random.next_int(&self) @dynamic
```

---

#### `Mcg32Random.next_byte`

```c3
fn char Mcg32Random.next_byte(&self) @dynamic
```

---

#### `Mcg16Random.set_seed`

```c3
fn void Mcg16Random.set_seed(&self, char[] seed) @dynamic
```

---

#### `Mcg16Random.next_byte`

```c3
fn char Mcg16Random.next_byte(&self) @dynamic
```

---

#### `Mcg16Random.next_bytes`

```c3
fn void Mcg16Random.next_bytes(&self, char[] bytes) @dynamic
```

---

#### `Mcg16Random.next_int128`

```c3
fn uint128 Mcg16Random.next_int128(&self) @dynamic
```

---

#### `Mcg16Random.next_long`

```c3
fn ulong Mcg16Random.next_long(&self) @dynamic
```

---

#### `Mcg16Random.next_int`

```c3
fn uint Mcg16Random.next_int(&self) @dynamic
```

---

#### `Mcg16Random.next_short`

```c3
fn ushort Mcg16Random.next_short(&self) @dynamic
```

---

#### `Msws`

```c3
struct Msws128Random (Random)
```
```c3
struct Msws64Random (Random)
```
```c3
struct Msws32Random (Random)
```
```c3
struct Msws16Random (Random)
```
```c3
struct Msws8Random (Random)
```

---

#### `Msws128Random.set_seed`

```c3
fn void Msws128Random.set_seed(&self, char[] input) @dynamic
```

---

#### `Msws128Random.next_int128`

```c3
fn uint128 Msws128Random.next_int128(&self) @dynamic
```

---

#### `Msws128Random.next_bytes`

```c3
<*
 @require bytes.len > 0
*>
fn void Msws128Random.next_bytes(&self, char[] bytes) @dynamic
```

---

#### `Msws128Random.next_long`

```c3
fn ulong Msws128Random.next_long(&self) @dynamic
```

---

#### `Msws128Random.next_int`

```c3
fn uint Msws128Random.next_int(&self) @dynamic
```

---

#### `Msws128Random.next_short`

```c3
fn ushort Msws128Random.next_short(&self) @dynamic
```

---

#### `Msws128Random.next_byte`

```c3
fn char Msws128Random.next_byte(&self) @dynamic
```

---

#### `Msws64Random.set_seed`

```c3
fn void  Msws64Random.set_seed(&self, char[] input) @dynamic
```

---

#### `Msws64Random.next_long`

```c3
fn ulong Msws64Random.next_long(&self) @dynamic
```

---

#### `Msws64Random.next_bytes`

```c3
<*
 @require bytes.len > 0
*>
fn void Msws64Random.next_bytes(&self, char[] bytes) @dynamic
```

---

#### `Msws64Random.next_int128`

```c3
fn uint128 Msws64Random.next_int128(&self) @dynamic
```

---

#### `Msws64Random.next_int`

```c3
fn uint Msws64Random.next_int(&self) @dynamic
```

---

#### `Msws64Random.next_short`

```c3
fn ushort Msws64Random.next_short(&self) @dynamic
```

---

#### `Msws64Random.next_byte`

```c3
fn char Msws64Random.next_byte(&self) @dynamic
```

---

#### `Msws32Random.set_seed`

```c3
fn void  Msws32Random.set_seed(&self, char[] input) @dynamic
```

---

#### `Msws32Random.next_int`

```c3
fn uint Msws32Random.next_int(&self) @dynamic
```

---

#### `Msws32Random.next_bytes`

```c3
<*
 @require bytes.len > 0
*>
fn void Msws32Random.next_bytes(&self, char[] bytes) @dynamic
```

---

#### `Msws32Random.next_int128`

```c3
fn uint128 Msws32Random.next_int128(&self) @dynamic
```

---

#### `Msws32Random.next_long`

```c3
fn ulong Msws32Random.next_long(&self) @dynamic
```

---

#### `Msws32Random.next_short`

```c3
fn ushort Msws32Random.next_short(&self) @dynamic
```

---

#### `Msws32Random.next_byte`

```c3
fn char Msws32Random.next_byte(&self) @dynamic
```

---

#### `Msws16Random.set_seed`

```c3
fn void  Msws16Random.set_seed(&self, char[] input) @dynamic
```

---

#### `Msws16Random.next_short`

```c3
fn ushort Msws16Random.next_short(&self) @dynamic
```

---

#### `Msws16Random.next_bytes`

```c3
<*
 @require bytes.len > 0
*>
fn void Msws16Random.next_bytes(&self, char[] bytes) @dynamic
```

---

#### `Msws16Random.next_int128`

```c3
fn uint128 Msws16Random.next_int128(&self) @dynamic
```

---

#### `Msws16Random.next_long`

```c3
fn ulong Msws16Random.next_long(&self) @dynamic
```

---

#### `Msws16Random.next_int`

```c3
fn uint Msws16Random.next_int(&self) @dynamic
```

---

#### `Msws16Random.next_byte`

```c3
fn char Msws16Random.next_byte(&self) @dynamic
```

---

#### `Msws8Random.set_seed`

```c3
fn void  Msws8Random.set_seed(&self, char[] input) @dynamic
```

---

#### `Msws8Random.next_byte`

```c3
fn char Msws8Random.next_byte(&self) @dynamic
```

---

#### `Msws8Random.next_bytes`

```c3
fn void Msws8Random.next_bytes(&self, char[] bytes) @dynamic
```

---

#### `Msws8Random.next_int128`

```c3
fn uint128 Msws8Random.next_int128(&self) @dynamic
```

---

#### `Msws8Random.next_long`

```c3
fn ulong Msws8Random.next_long(&self) @dynamic
```

---

#### `Msws8Random.next_int`

```c3
fn uint Msws8Random.next_int(&self) @dynamic
```

---

#### `Msws8Random.next_short`

```c3
fn ushort Msws8Random.next_short(&self) @dynamic
```

---

#### `Pcg`

```c3
typedef Pcg128Random (Random) = uint128
```
```c3
typedef Pcg64Random (Random) = ulong
```
```c3
typedef Pcg32Random (Random) = uint
```
```c3
typedef Pcg16Random (Random) = ushort
```

---

#### `Pcg128Random.set_seed`

```c3
fn void  Pcg128Random.set_seed(&self, char[] input) @dynamic
```

---

#### `Pcg128Random.next_long`

```c3
fn ulong Pcg128Random.next_long(&self) @dynamic
```

---

#### `Pcg128Random.next_bytes`

```c3
<*
 @require bytes.len > 0
*>
fn void Pcg128Random.next_bytes(&self, char[] bytes) @dynamic
```

---

#### `Pcg128Random.next_int128`

```c3
fn uint128 Pcg128Random.next_int128(&self) @dynamic
```

---

#### `Pcg128Random.next_int`

```c3
fn uint Pcg128Random.next_int(&self) @dynamic
```

---

#### `Pcg128Random.next_short`

```c3
fn ushort Pcg128Random.next_short(&self) @dynamic
```

---

#### `Pcg128Random.next_byte`

```c3
fn char Pcg128Random.next_byte(&self) @dynamic
```

---

#### `Pcg64Random.set_seed`

```c3
fn void Pcg64Random.set_seed(&self, char[] input) @dynamic
```

---

#### `Pcg64Random.next_int`

```c3
fn uint Pcg64Random.next_int(&self) @dynamic
```

---

#### `Pcg64Random.next_bytes`

```c3
<*
 @require bytes.len > 0
*>
fn void Pcg64Random.next_bytes(&self, char[] bytes) @dynamic
```

---

#### `Pcg64Random.next_int128`

```c3
fn uint128 Pcg64Random.next_int128(&self) @dynamic
```

---

#### `Pcg64Random.next_long`

```c3
fn ulong Pcg64Random.next_long(&self) @dynamic
```

---

#### `Pcg64Random.next_short`

```c3
fn ushort Pcg64Random.next_short(&self) @dynamic
```

---

#### `Pcg64Random.next_byte`

```c3
fn char Pcg64Random.next_byte(&self) @dynamic
```

---

#### `Pcg32Random.set_seed`

```c3
fn void Pcg32Random.set_seed(&self, char[] input) @dynamic
```

---

#### `Pcg32Random.next_short`

```c3
fn ushort Pcg32Random.next_short(&self) @dynamic
```

---

#### `Pcg32Random.next_bytes`

```c3
<*
 @require bytes.len > 0
*>
fn void Pcg32Random.next_bytes(&self, char[] bytes) @dynamic
```

---

#### `Pcg32Random.next_int128`

```c3
fn uint128 Pcg32Random.next_int128(&self) @dynamic
```

---

#### `Pcg32Random.next_long`

```c3
fn ulong Pcg32Random.next_long(&self) @dynamic
```

---

#### `Pcg32Random.next_int`

```c3
fn uint Pcg32Random.next_int(&self) @dynamic
```

---

#### `Pcg32Random.next_byte`

```c3
fn char Pcg32Random.next_byte(&self) @dynamic
```

---

#### `Pcg16Random.set_seed`

```c3
fn void Pcg16Random.set_seed(&self, char[] input) @dynamic
```

---

#### `Pcg16Random.next_byte`

```c3
fn char Pcg16Random.next_byte(&self) @dynamic
```

---

#### `Pcg16Random.next_bytes`

```c3
fn void Pcg16Random.next_bytes(&self, char[] bytes) @dynamic
```

---

#### `Pcg16Random.next_int128`

```c3
fn uint128 Pcg16Random.next_int128(&self) @dynamic
```

---

#### `Pcg16Random.next_long`

```c3
fn ulong Pcg16Random.next_long(&self) @dynamic
```

---

#### `Pcg16Random.next_int`

```c3
fn uint Pcg16Random.next_int(&self) @dynamic
```

---

#### `Pcg16Random.next_short`

```c3
fn ushort Pcg16Random.next_short(&self) @dynamic
```

---

#### `make_seed`

```c3
macro make_seed($Type, char[] input)
```

---

#### `seeder`

```c3
<*
 @param [in] input
 @param [inout] out_buffer
*>
fn void seeder(char[] input, char[] out_buffer)
```

---

#### `hash`

```c3
macro uint hash(value) @local
```

---

#### `entropy`

```c3
fn char[8 * 4] entropy() @if(!env::WASM_NOLIBC)
```
```c3
fn char[8 * 4] entropy() @if(env::WASM_NOLIBC)
```

---

#### `Sfc`

```c3
typedef Sfc128Random (Random) = uint128[4]
```
```c3
typedef Sfc64Random (Random) = ulong[4]
```
```c3
typedef Sfc32Random (Random) = uint[4]
```
```c3
typedef Sfc16Random (Random) = ushort[4]
```
```c3
typedef Sfc8Random (Random) = char[4]
```

---

#### `Sfc128Random.set_seed`

```c3
fn void Sfc128Random.set_seed(&self, char[] input) @dynamic
```

---

#### `Sfc128Random.next_int128`

```c3
fn uint128 Sfc128Random.next_int128(&self) @dynamic
```

---

#### `Sfc128Random.next_bytes`

```c3
<*
 @require bytes.len > 0
*>
fn void Sfc128Random.next_bytes(&self, char[] bytes) @dynamic
```

---

#### `Sfc128Random.next_long`

```c3
fn ulong Sfc128Random.next_long(&self) @dynamic
```

---

#### `Sfc128Random.next_int`

```c3
fn uint Sfc128Random.next_int(&self) @dynamic
```

---

#### `Sfc128Random.next_short`

```c3
fn ushort Sfc128Random.next_short(&self) @dynamic
```

---

#### `Sfc128Random.next_byte`

```c3
fn char Sfc128Random.next_byte(&self) @dynamic
```

---

#### `Sfc64Random.set_seed`

```c3
fn void  Sfc64Random.set_seed(&self, char[] input) @dynamic
```

---

#### `Sfc64Random.next_long`

```c3
fn ulong Sfc64Random.next_long(&self) @dynamic
```

---

#### `Sfc64Random.next_bytes`

```c3
<*
 @require bytes.len > 0
*>
fn void Sfc64Random.next_bytes(&self, char[] bytes) @dynamic
```

---

#### `Sfc64Random.next_int128`

```c3
fn uint128 Sfc64Random.next_int128(&self) @dynamic
```

---

#### `Sfc64Random.next_int`

```c3
fn uint Sfc64Random.next_int(&self) @dynamic
```

---

#### `Sfc64Random.next_short`

```c3
fn ushort Sfc64Random.next_short(&self) @dynamic
```

---

#### `Sfc64Random.next_byte`

```c3
fn char Sfc64Random.next_byte(&self) @dynamic
```

---

#### `Sfc32Random.set_seed`

```c3
fn void  Sfc32Random.set_seed(&self, char[] input) @dynamic
```

---

#### `Sfc32Random.next_int`

```c3
fn uint Sfc32Random.next_int(&sfc) @dynamic
```

---

#### `Sfc32Random.next_bytes`

```c3
<*
 @require bytes.len > 0
*>
fn void Sfc32Random.next_bytes(&self, char[] bytes) @dynamic
```

---

#### `Sfc32Random.next_int128`

```c3
fn uint128 Sfc32Random.next_int128(&self) @dynamic
```

---

#### `Sfc32Random.next_long`

```c3
fn ulong Sfc32Random.next_long(&self) @dynamic
```

---

#### `Sfc32Random.next_short`

```c3
fn ushort Sfc32Random.next_short(&self) @dynamic
```

---

#### `Sfc32Random.next_byte`

```c3
fn char Sfc32Random.next_byte(&self) @dynamic
```

---

#### `Sfc16Random.set_seed`

```c3
fn void  Sfc16Random.set_seed(&self, char[] input) @dynamic
```

---

#### `Sfc16Random.next_short`

```c3
fn ushort Sfc16Random.next_short(&seed) @dynamic
```

---

#### `Sfc16Random.next_bytes`

```c3
<*
 @require bytes.len > 0
*>
fn void Sfc16Random.next_bytes(&self, char[] bytes) @dynamic
```

---

#### `Sfc16Random.next_int128`

```c3
fn uint128 Sfc16Random.next_int128(&self) @dynamic
```

---

#### `Sfc16Random.next_long`

```c3
fn ulong Sfc16Random.next_long(&self) @dynamic
```

---

#### `Sfc16Random.next_int`

```c3
fn uint Sfc16Random.next_int(&self) @dynamic
```

---

#### `Sfc16Random.next_byte`

```c3
fn char Sfc16Random.next_byte(&self) @dynamic
```

---

#### `Sfc8Random.set_seed`

```c3
fn void  Sfc8Random.set_seed(&self, char[] input) @dynamic
```

---

#### `Sfc8Random.next_byte`

```c3
fn char Sfc8Random.next_byte(&self) @dynamic
```

---

#### `Sfc8Random.next_bytes`

```c3
fn void Sfc8Random.next_bytes(&self, char[] bytes) @dynamic
```

---

#### `Sfc8Random.next_int128`

```c3
fn uint128 Sfc8Random.next_int128(&self) @dynamic
```

---

#### `Sfc8Random.next_long`

```c3
fn ulong Sfc8Random.next_long(&self) @dynamic
```

---

#### `Sfc8Random.next_int`

```c3
fn uint Sfc8Random.next_int(&self) @dynamic
```

---

#### `Sfc8Random.next_short`

```c3
fn ushort Sfc8Random.next_short(&self) @dynamic
```

---

#### `SimpleRandom`

```c3
typedef SimpleRandom (Random) = ulong
```

---

#### `SimpleRandom.set_seed`

```c3
fn void SimpleRandom.set_seed(&self, char[] seed) @dynamic
```

---

#### `SimpleRandom.next_int`

```c3
fn uint SimpleRandom.next_int(&self) @dynamic
```

---

#### `SimpleRandom.next_bytes`

```c3
<*
 @require bytes.len > 0
*>
fn void SimpleRandom.next_bytes(&self, char[] bytes) @dynamic
```

---

#### `SimpleRandom.next_int128`

```c3
fn uint128 SimpleRandom.next_int128(&self) @dynamic
```

---

#### `SimpleRandom.next_long`

```c3
fn ulong SimpleRandom.next_long(&self) @dynamic
```

---

#### `SimpleRandom.next_short`

```c3
fn ushort SimpleRandom.next_short(&self) @dynamic
```

---

#### `SimpleRandom.next_byte`

```c3
fn char SimpleRandom.next_byte(&self) @dynamic
```
### `std::math::uuid`

---

#### `Uuid`

```c3
typedef Uuid (Printable) = char[16]
```

---

#### `generate`

```c3
fn Uuid generate()
```

Generate a version 4 UUID from the default random.


---

#### `generate_from_random`

```c3
fn Uuid generate_from_random(Random random)
```

Generate a version 4 UUID from the given random.


---

#### `Uuid.to_format`

```c3
fn usz? Uuid.to_format(&self, Formatter* formatter) @dynamic
```

---

#### `Uuid.to_string`

```c3
fn String Uuid.to_string(&self, Allocator allocator)
```
### `std::math::vector`

---

#### `double[<*>].sq_magnitude`

```c3
macro double[<*>].sq_magnitude(self)
```

---

#### `float[<*>].sq_magnitude`

```c3
macro float[<*>].sq_magnitude(self)
```

---

#### `double[<*>].distance_sq`

```c3
macro double[<*>].distance_sq(self, double[<*>] v2)
```

---

#### `float[<*>].distance_sq`

```c3
macro float[<*>].distance_sq(self, float[<*>] v2)
```

---

#### `float[<2>].transform`

```c3
macro float[<2>].transform(self, Matrix4f mat)
```

---

#### `float[<2>].rotate`

```c3
macro float[<2>].rotate(self, float angle)
```

---

#### `float[<2>].angle`

```c3
macro float[<2>].angle(self, float[<2>] v2)
```

---

#### `double[<2>].transform`

```c3
macro double[<2>].transform(self, Matrix4 mat)
```

---

#### `double[<2>].rotate`

```c3
macro double[<2>].rotate(self, double angle)
```

---

#### `double[<2>].angle`

```c3
macro double[<2>].angle(self, double[<2>] v2)
```

---

#### `float[<*>].clamp_mag`

```c3
macro float[<*>].clamp_mag(self, float min, float max)
```

---

#### `double[<*>].clamp_mag`

```c3
macro double[<*>].clamp_mag(self, double min, double max)
```

---

#### `float[<*>].towards`

```c3
macro float[<*>].towards(self, float[<*>] target, float max_distance)
```

---

#### `double[<*>].towards`

```c3
macro double[<*>].towards(self, double[<*>] target, double max_distance)
```

---

#### `float[<3>].cross`

```c3
fn float[<3>] float[<3>].cross(self, float[<3>] v2)
```

---

#### `double[<3>].cross`

```c3
fn double[<3>] double[<3>].cross(self, double[<3>] v2)
```

---

#### `float[<3>].perpendicular`

```c3
fn float[<3>] float[<3>].perpendicular(self)
```

---

#### `double[<3>].perpendicular`

```c3
fn double[<3>] double[<3>].perpendicular(self)
```

---

#### `float[<3>].barycenter`

```c3
fn float[<3>] float[<3>].barycenter(self, float[<3>] a, float[<3>] b, float[<3>] c)
```

---

#### `double[<3>].barycenter`

```c3
fn double[<3>] double[<3>].barycenter(self, double[<3>] a, double[<3>] b, double[<3>] c)
```

---

#### `float[<3>].transform`

```c3
fn float[<3>] float[<3>].transform(self, Matrix4f mat)
```

---

#### `double[<3>].transform`

```c3
fn double[<3>] double[<3>].transform(self, Matrix4 mat)
```

---

#### `float[<3>].angle`

```c3
fn float float[<3>].angle(self, float[<3>] v2)
```

---

#### `double[<3>].angle`

```c3
fn double double[<3>].angle(self, double[<3>] v2)
```

---

#### `float[<3>].refract`

```c3
fn float[<3>] float[<3>].refract(self, float[<3>] n, float r)
```

---

#### `double[<3>].refract`

```c3
fn double[<3>] double[<3>].refract(self, double[<3>] n, double r)
```

---

#### `float[<3>].rotate_quat`

```c3
fn float[<3>] float[<3>].rotate_quat(self, Quaternionf q)
```

---

#### `double[<3>].rotate_quat`

```c3
fn double[<3>] double[<3>].rotate_quat(self, Quaternion q)
```

---

#### `float[<3>].rotate_axis`

```c3
fn float[<3>] float[<3>].rotate_axis(self, float[<3>] axis, float angle)
```

---

#### `double[<3>].rotate_axis`

```c3
fn double[<3>] double[<3>].rotate_axis(self, double[<3>] axis, double angle)
```

---

#### `float[<3>].unproject`

```c3
fn float[<3>] float[<3>].unproject(self, Matrix4f projection, Matrix4f view)
```

---

#### `double[<3>].unproject`

```c3
fn double[<3>] double[<3>].unproject(self, Matrix4 projection, Matrix4 view)
```

---

#### `ortho_normalize`

```c3
fn void ortho_normalize(float[<3>]* v1, float[<3>]* v2)
```

---

#### `ortho_normalized`

```c3
fn void ortho_normalized(double[<3>]* v1, double[<3>]* v2)
```

---

#### `towards`

```c3
macro towards(v, target, max_distance) @private
```

---

#### `clamp_magnitude`

```c3
macro clamp_magnitude(v, min, max) @private
```

---

#### `rotate`

```c3
macro rotate(v, angle) @private
```

---

#### `perpendicular3`

```c3
macro perpendicular3(v) @private
```

---

#### `cross3`

```c3
macro cross3(v1, v2) @private
```

---

#### `transform2`

```c3
macro transform2(v, mat) @private
```

---

#### `transform3`

```c3
macro transform3(v, mat) @private
```

---

#### `angle3`

```c3
macro angle3(v1, v2) @private
```

---

#### `ortho_normalize3`

```c3
macro void ortho_normalize3(v1, v2) @private
```

---

#### `rotate_by_quat3`

```c3
macro rotate_by_quat3(v, q) @private
```

---

#### `rotate_axis_angle`

```c3
macro rotate_axis_angle(v, axis, angle) @private
```

---

#### `unproject3`

```c3
macro unproject3(v, m1, m2) @private
```

---

#### `barycenter3`

```c3
macro barycenter3(p, a, b, c) @private
```

---

#### `refract3`

```c3
macro refract3(v, n, r) @private
```
### `std::net`

---

#### `IpProtocol`

```c3
enum IpProtocol : char (AIFamily ai_family)
```

---

#### `InetAddress`

```c3
struct InetAddress (Printable)
```

---

#### `InetAddress.to_format`

```c3
fn usz? InetAddress.to_format(InetAddress* addr, Formatter* formatter) @dynamic
```

---

#### `InetAddress.to_string`

```c3
fn String InetAddress.to_string(&self, Allocator allocator)
```

---

#### `InetAddress.to_tstring`

```c3
fn String InetAddress.to_tstring(&self)
```

---

#### `ipv6_from_str`

```c3
fn InetAddress? ipv6_from_str(String s)
```

---

#### `ipv4_from_str`

```c3
fn InetAddress? ipv4_from_str(String s)
```

---

#### `InetAddress.is_loopback`

```c3
fn bool InetAddress.is_loopback(InetAddress* addr)
```

---

#### `InetAddress.is_any_local`

```c3
fn bool InetAddress.is_any_local(InetAddress* addr)
```

---

#### `InetAddress.is_link_local`

```c3
fn bool InetAddress.is_link_local(InetAddress* addr)
```

---

#### `InetAddress.is_site_local`

```c3
fn bool InetAddress.is_site_local(InetAddress* addr)
```

---

#### `InetAddress.is_multicast`

```c3
fn bool InetAddress.is_multicast(InetAddress* addr)
```

---

#### `InetAddress.is_multicast_global`

```c3
fn bool InetAddress.is_multicast_global(InetAddress* addr)
```

---

#### `InetAddress.is_multicast_node_local`

```c3
fn bool InetAddress.is_multicast_node_local(InetAddress* addr)
```

---

#### `InetAddress.is_multicast_site_local`

```c3
fn bool InetAddress.is_multicast_site_local(InetAddress* addr)
```

---

#### `InetAddress.is_multicast_org_local`

```c3
fn bool InetAddress.is_multicast_org_local(InetAddress* addr)
```

---

#### `InetAddress.is_multicast_link_local`

```c3
fn bool InetAddress.is_multicast_link_local(InetAddress* addr)
```

---

#### `addrinfo`

```c3
fn AddrInfo*? addrinfo(String host, uint port, AIFamily ai_family, AISockType ai_socktype) @if(os::SUPPORTS_INET)
```

---

#### `INVALID_URL, URL_TOO_LONG, INVALID_SOCKET, GENERAL_ERROR, INVALID_IP_STRING, ADDRINFO_FAILED, CONNECT_FAILED, LISTEN_FAILED, ACCEPT_FAILED, WRITE_FAILED, READ_FAILED, SOCKOPT_FAILED, SOCKETS_NOT_INITIALIZED, STILL_PROCESSING_CALLBACK, BAD_SOCKET_DESCRIPTOR, NOT_A_SOCKET, CONNECTION_REFUSED, CONNECTION_TIMED_OUT, ADDRESS_IN_USE, CONNECTION_ALREADY_IN_PROGRESS, ALREADY_CONNECTED, NETWORK_UNREACHABLE, OPERATION_NOT_SUPPORTED_ON_SOCKET, CONNECTION_RESET`

```c3
faultdef
	INVALID_URL,
	URL_TOO_LONG,
	INVALID_SOCKET,
	GENERAL_ERROR,
	INVALID_IP_STRING,
	ADDRINFO_FAILED,
	CONNECT_FAILED,
	LISTEN_FAILED,
	ACCEPT_FAILED,
	WRITE_FAILED,
	READ_FAILED,
	SOCKOPT_FAILED,

	SOCKETS_NOT_INITIALIZED,
	STILL_PROCESSING_CALLBACK,
	BAD_SOCKET_DESCRIPTOR,
	NOT_A_SOCKET,
	CONNECTION_REFUSED,
	CONNECTION_TIMED_OUT,
	ADDRESS_IN_USE,
	CONNECTION_ALREADY_IN_PROGRESS,
	ALREADY_CONNECTED,
	NETWORK_UNREACHABLE,
	OPERATION_NOT_SUPPORTED_ON_SOCKET,
	CONNECTION_RESET
```

---

#### `ipv4toint`

```c3
fn uint? ipv4toint(String s)
```

---

#### `int_to_ipv4`

```c3
fn String? int_to_ipv4(uint val, Allocator allocator)
```
### `std::net @if(os::SUPPORTS_INET)`

---

#### `Socket`

```c3
struct Socket (InStream, OutStream)
```

---

#### `@loop_over_ai`

```c3
macro void @loop_over_ai(AddrInfo* ai; @body(NativeSocket fd, AddrInfo* ai))
```

---

#### `POLL_FOREVER`

```c3
const Duration POLL_FOREVER = (Duration)-1
```

---

#### `PollSubscribes`

```c3
typedef PollSubscribes = ushort
```

---

#### `PollEvents`

```c3
typedef PollEvents = ushort
```

---

#### `SUBSCRIBE_ANY_READ`

```c3
const PollSubscribes SUBSCRIBE_ANY_READ     = os::POLLIN
```

---

#### `SUBSCRIBE_PRIO_READ`

```c3
const PollSubscribes SUBSCRIBE_PRIO_READ    = os::POLLPRI
```

---

#### `SUBSCRIBE_OOB_READ`

```c3
const PollSubscribes SUBSCRIBE_OOB_READ     = os::POLLRDBAND
```

---

#### `SUBSCRIBE_READ`

```c3
const PollSubscribes SUBSCRIBE_READ         = os::POLLRDNORM
```

---

#### `SUBSCRIBE_ANY_WRITE`

```c3
const PollSubscribes SUBSCRIBE_ANY_WRITE    = os::POLLOUT
```

---

#### `SUBSCRIBE_OOB_WRITE`

```c3
const PollSubscribes SUBSCRIBE_OOB_WRITE    = os::POLLWRBAND
```

---

#### `SUBSCRIBE_WRITE`

```c3
const PollSubscribes SUBSCRIBE_WRITE        = os::POLLWRNORM
```

---

#### `POLL_EVENT_READ_PRIO`

```c3
const PollEvents POLL_EVENT_READ_PRIO  = os::POLLPRI
```

---

#### `POLL_EVENT_READ_OOB`

```c3
const PollEvents POLL_EVENT_READ_OOB   = os::POLLRDBAND
```

---

#### `POLL_EVENT_READ`

```c3
const PollEvents POLL_EVENT_READ       = os::POLLRDNORM
```

---

#### `POLL_EVENT_WRITE_OOB`

```c3
const PollEvents POLL_EVENT_WRITE_OOB  = os::POLLWRBAND
```

---

#### `POLL_EVENT_WRITE`

```c3
const PollEvents POLL_EVENT_WRITE      = os::POLLWRNORM
```

---

#### `POLL_EVENT_DISCONNECT`

```c3
const PollEvents POLL_EVENT_DISCONNECT = os::POLLHUP
```

---

#### `POLL_EVENT_ERROR`

```c3
const PollEvents POLL_EVENT_ERROR      = os::POLLERR
```

---

#### `POLL_EVENT_INVALID`

```c3
const PollEvents POLL_EVENT_INVALID    = os::POLLNVAL
```

---

#### `Poll`

```c3
struct Poll
```

---

#### `poll`

```c3
<*
 @param [inout] polls
 @param timeout : "duration to poll (clamped to CInt.max ms), or POLL_FOREVER."
*>
fn ulong? poll(Poll[] polls, Duration timeout)
```

---

#### `poll_ms`

```c3
<*
 @param [inout] polls
 @param timeout_ms : "duration to poll in ms or -1. Clamped to CInt.max"
*>
fn ulong? poll_ms(Poll[] polls, long timeout_ms)
```

---

#### `new_socket`

```c3
macro Socket new_socket(fd, ai)
```

---

#### `SocketOption`

```c3
enum SocketOption : char (CInt value)
```

---

#### `Socket.get_broadcast`

```c3
fn bool? Socket.get_broadcast(&self)
```

---

#### `Socket.get_keepalive`

```c3
fn bool? Socket.get_keepalive(&self)
```

---

#### `Socket.get_reuseaddr`

```c3
fn bool? Socket.get_reuseaddr(&self)
```

---

#### `Socket.get_dontroute`

```c3
fn bool? Socket.get_dontroute(&self)
```

---

#### `Socket.get_oobinline`

```c3
fn bool? Socket.get_oobinline(&self)
```

---

#### `Socket.set_broadcast`

```c3
fn void? Socket.set_broadcast(&self, bool value)
```

---

#### `Socket.set_keepalive`

```c3
fn void? Socket.set_keepalive(&self, bool value)
```

---

#### `Socket.set_reuseaddr`

```c3
fn void? Socket.set_reuseaddr(&self, bool value)
```

---

#### `Socket.set_dontroute`

```c3
fn void? Socket.set_dontroute(&self, bool value)
```

---

#### `Socket.set_oobinline`

```c3
fn void? Socket.set_oobinline(&self, bool value)
```

---

#### `Socket.set_option`

```c3
fn void? Socket.set_option(&self, SocketOption option, bool value)
```

---

#### `Socket.get_option`

```c3
fn bool? Socket.get_option(&self, SocketOption option)
```

---

#### `Socket.read`

```c3
fn usz? Socket.read(&self, char[] bytes) @dynamic
```

---

#### `Socket.read_byte`

```c3
fn char? Socket.read_byte(&self) @dynamic
```

---

#### `Socket.write`

```c3
fn usz? Socket.write(&self, char[] bytes) @dynamic
```

---

#### `Socket.write_byte`

```c3
fn void? Socket.write_byte(&self, char byte) @dynamic
```

---

#### `Socket.destroy`

```c3
fn void? Socket.destroy(&self) @dynamic
```

---

#### `Socket.close`

```c3
fn void? Socket.close(&self) @inline @dynamic
```

---

#### `Socket.peek`

```c3
fn usz? Socket.peek(&self, char[] bytes) @dynamic
```

---

#### `SocketShutdownHow`

```c3
enum SocketShutdownHow : (CInt native_value)
```

---

#### `Socket.shutdown`

```c3
fn void? Socket.shutdown(&self, SocketShutdownHow how)
```

---

#### `apply_sockoptions`

```c3
macro apply_sockoptions(sockfd, options) @private
```

---

#### `connect_from_addrinfo`

```c3
fn Socket? connect_from_addrinfo(AddrInfo* addrinfo, SocketOption[] options) @private
```

---

#### `last_error_is_delayed_connect`

```c3
fn bool last_error_is_delayed_connect()
```

---

#### `connect_with_timeout_from_addrinfo`

```c3
fn Socket? connect_with_timeout_from_addrinfo(AddrInfo* addrinfo, SocketOption[] options, Duration timeout) @private
```

---

#### `connect_async_from_addrinfo`

```c3
fn Socket? connect_async_from_addrinfo(AddrInfo* addrinfo, SocketOption[] options) @private
```

---

#### `@network_loop_over_ai`

```c3
macro @network_loop_over_ai(network, host, port; @body(fd, ai)) @private
```
### `std::net::os`

---

#### `SUPPORTS_INET`

```c3
const bool SUPPORTS_INET = env::LIBC && (env::WIN32 || env::DARWIN || env::LINUX || env::ANDROID || env::OPENBSD)
```

---

#### `AIFamily`

```c3
typedef AIFamily = CInt
```

---

#### `AIProtocol`

```c3
typedef AIProtocol = CInt
```

---

#### `AISockType`

```c3
typedef AISockType = CInt
```

---

#### `AIFlags`

```c3
typedef AIFlags = CInt
```

---

#### `Socklen_t`

```c3
alias Socklen_t @if(!env::WIN32) = CUInt
```
```c3
alias Socklen_t @if(env::WIN32)  = usz
```

---

#### `SockAddrPtr`

```c3
typedef SockAddrPtr = void*
```

---

#### `AddrInfo`

```c3
struct AddrInfo
```

---

#### `@if(!$defined(PLATFORM_O_NONBLOCK))`

```c3
const PLATFORM_O_NONBLOCK @if(!$defined(PLATFORM_O_NONBLOCK)) = 0
```

---

#### `SOCK_STREAM`

```c3
const AISockType SOCK_STREAM                    = 1
```

---

#### `SOCK_DGRAM`

```c3
const AISockType SOCK_DGRAM                     = 2
```

---

#### `SOCK_RAW`

```c3
const AISockType SOCK_RAW                       = 3
```

---

#### `SOCK_RDM`

```c3
const AISockType SOCK_RDM                       = 4
```

---

#### `SOCK_SEQPACKET`

```c3
const AISockType SOCK_SEQPACKET                 = 5
```

---

#### `AI_PASSIVE`

```c3
const AIFlags AI_PASSIVE                        = 0x1
```

---

#### `AI_CANONNAME`

```c3
const AIFlags AI_CANONNAME                      = 0x2
```

---

#### `AI_NUMERICHOST`

```c3
const AIFlags AI_NUMERICHOST                    = 0x4
```

---

#### `AF_UNSPEC`

```c3
const AIFamily AF_UNSPEC                        = 0
```

---

#### `AF_UNIX`

```c3
const AIFamily AF_UNIX                          = 1
```

---

#### `AF_INET`

```c3
const AIFamily AF_INET                          = 2
```

---

#### `AF_INET6`

```c3
const AIFamily AF_INET6                         = PLATFORM_AF_INET6
```

---

#### `AF_IPX`

```c3
const AIFamily AF_IPX                           = PLATFORM_AF_IPX
```

---

#### `AF_APPLETALK`

```c3
const AIFamily AF_APPLETALK                     = PLATFORM_AF_APPLETALK
```

---

#### `O_NONBLOCK`

```c3
const O_NONBLOCK = PLATFORM_O_NONBLOCK
```

---

#### `getaddrinfo`

```c3
extern fn CInt getaddrinfo(ZString nodename, ZString servname, AddrInfo* hints, AddrInfo** res) @if(SUPPORTS_INET)
```
### `std::net::os @if(env::ANDROID)`

---

#### `PLATFORM_AF_AX25`

```c3
const AIFamily PLATFORM_AF_AX25         = 3
```

---

#### `PLATFORM_AF_IPX`

```c3
const AIFamily PLATFORM_AF_IPX          = 4
```

---

#### `PLATFORM_AF_APPLETALK`

```c3
const AIFamily PLATFORM_AF_APPLETALK    = 5
```

---

#### `PLATFORM_AF_NETROM`

```c3
const AIFamily PLATFORM_AF_NETROM       = 6
```

---

#### `PLATFORM_AF_BRIDGE`

```c3
const AIFamily PLATFORM_AF_BRIDGE       = 7
```

---

#### `PLATFORM_AF_AAL5`

```c3
const AIFamily PLATFORM_AF_AAL5         = 8
```

---

#### `PLATFORM_AF_X25`

```c3
const AIFamily PLATFORM_AF_X25          = 9
```

---

#### `PLATFORM_AF_INET6`

```c3
const AIFamily PLATFORM_AF_INET6        = 10
```

---

#### `PLATFORM_O_NONBLOCK`

```c3
const PLATFORM_O_NONBLOCK = 0o4000
```

---

#### `SOL_SOCKET`

```c3
const int SOL_SOCKET = 1
```

---

#### `SO_DEBUG`

```c3
const int SO_DEBUG                   = 1
```

---

#### `SO_REUSEADDR`

```c3
const int SO_REUSEADDR               = 2
```

---

#### `SO_TYPE`

```c3
const int SO_TYPE                    = 3
```

---

#### `SO_ERROR`

```c3
const int SO_ERROR                   = 4
```

---

#### `SO_DONTROUTE`

```c3
const int SO_DONTROUTE               = 5
```

---

#### `SO_BROADCAST`

```c3
const int SO_BROADCAST               = 6
```

---

#### `SO_SNDBUF`

```c3
const int SO_SNDBUF                  = 7
```

---

#### `SO_RCVBUF`

```c3
const int SO_RCVBUF                  = 8
```

---

#### `SO_KEEPALIVE`

```c3
const int SO_KEEPALIVE               = 9
```

---

#### `SO_OOBINLINE`

```c3
const int SO_OOBINLINE	             = 10
```

---

#### `SO_NO_CHECK`

```c3
const int SO_NO_CHECK                = 11
```

---

#### `SO_PRIORITY`

```c3
const int SO_PRIORITY                = 12
```

---

#### `SO_LINGER`

```c3
const int SO_LINGER	                 = 13
```

---

#### `SO_BSDCOMPAT`

```c3
const int SO_BSDCOMPAT               = 14
```

---

#### `SO_REUSEPORT`

```c3
const int SO_REUSEPORT               = 15
```

---

#### `SO_RCVLOWAT`

```c3
const int SO_RCVLOWAT                = 18
```

---

#### `SO_SNDLOWAT`

```c3
const int SO_SNDLOWAT                = 19
```

---

#### `SO_RCVTIMEO`

```c3
const int SO_RCVTIMEO                = 20
```

---

#### `SO_SNDTIMEO`

```c3
const int SO_SNDTIMEO                = 21
```

---

#### `SO_BINDTODEVICE`

```c3
const int SO_BINDTODEVICE            = 25
```

---

#### `SO_ATTACH_FILTER`

```c3
const int SO_ATTACH_FILTER           = 26
```

---

#### `SO_DETACH_FILTER`

```c3
const int SO_DETACH_FILTER           = 27
```

---

#### `SO_PEERNAME`

```c3
const int SO_PEERNAME                = 28
```

---

#### `SO_TIMESTAMP`

```c3
const int SO_TIMESTAMP	             = 29
```

---

#### `SO_ACCEPTCONN`

```c3
const int SO_ACCEPTCONN              = 30
```

---

#### `SO_PEERSEC`

```c3
const int SO_PEERSEC                 = 31
```

---

#### `SO_SNDBUFFORCE`

```c3
const int SO_SNDBUFFORCE             = 32
```

---

#### `SO_RCVBUFFORCE`

```c3
const int SO_RCVBUFFORCE             = 33
```

---

#### `SO_PASSSEC`

```c3
const int SO_PASSSEC                 = 34
```

---

#### `SO_MARK`

```c3
const int SO_MARK                    = 36
```

---

#### `SO_PROTOCOL`

```c3
const int SO_PROTOCOL                = 38
```

---

#### `SO_DOMAIN`

```c3
const int SO_DOMAIN                  = 39
```

---

#### `SO_RXQ_OVFL`

```c3
const int SO_RXQ_OVFL                = 40
```

---

#### `SO_WIFI_STATUS`

```c3
const int SO_WIFI_STATUS             = 41
```

---

#### `SO_PEEK_OFF`

```c3
const int SO_PEEK_OFF                = 42
```

---

#### `SO_NOFCS`

```c3
const int SO_NOFCS                   = 43
```

---

#### `SO_LOCK_FILTER`

```c3
const int SO_LOCK_FILTER             = 44
```

---

#### `SO_SELECT_ERR_QUEUE`

```c3
const int SO_SELECT_ERR_QUEUE        = 45
```

---

#### `SO_BUSY_POLL`

```c3
const int SO_BUSY_POLL               = 46
```

---

#### `SO_MAX_PACING_RATE`

```c3
const int SO_MAX_PACING_RATE         = 47
```

---

#### `SO_BPF_EXTENSIONS`

```c3
const int SO_BPF_EXTENSIONS          = 48
```

---

#### `SO_INCOMING_CPU`

```c3
const int SO_INCOMING_CPU            = 49
```

---

#### `SO_ATTACH_BPF`

```c3
const int SO_ATTACH_BPF              = 50
```

---

#### `SO_ATTACH_REUSEPORT_CBPF`

```c3
const int SO_ATTACH_REUSEPORT_CBPF   = 51
```

---

#### `SO_ATTACH_REUSEPORT_EBPF`

```c3
const int SO_ATTACH_REUSEPORT_EBPF   = 52
```

---

#### `SO_CNX_ADVICE`

```c3
const int SO_CNX_ADVICE              = 53
```

---

#### `SO_MEMINFO`

```c3
const int SO_MEMINFO                 = 55
```

---

#### `SO_INCOMING_NAPI_ID`

```c3
const int SO_INCOMING_NAPI_ID        = 56
```

---

#### `SO_COOKIE`

```c3
const int SO_COOKIE                  = 57
```

---

#### `SO_PEERGROUPS`

```c3
const int SO_PEERGROUPS              = 59
```

---

#### `SO_ZEROCOPY`

```c3
const int SO_ZEROCOPY                = 60
```

---

#### `SO_TXTIME`

```c3
const int SO_TXTIME                  = 61
```

---

#### `SO_BINDTOIFINDEX`

```c3
const int SO_BINDTOIFINDEX           = 62
```

---

#### `SO_DETACH_REUSEPORT_BPF`

```c3
const int SO_DETACH_REUSEPORT_BPF    = 68
```

---

#### `SO_PREFER_BUSY_POLL`

```c3
const int SO_PREFER_BUSY_POLL        = 69
```

---

#### `SO_BUSY_POLL_BUDGET`

```c3
const int SO_BUSY_POLL_BUDGET        = 70
```

---

#### `SO_NETNS_COOKIE`

```c3
const int SO_NETNS_COOKIE            = 71
```

---

#### `SO_BUF_LOCK`

```c3
const int SO_BUF_LOCK                = 72
```

---

#### `SO_RESERVE_MEM`

```c3
const int SO_RESERVE_MEM             = 73
```

---

#### `SO_TXREHASH`

```c3
const int SO_TXREHASH                = 74
```

---

#### `SO_RCVMARK`

```c3
const int SO_RCVMARK                 = 75
```

---

#### `SO_PASSPIDFD`

```c3
const int SO_PASSPIDFD               = 76
```

---

#### `SO_PEERPIDFD`

```c3
const int SO_PEERPIDFD               = 77
```

---

#### `POLLRDNORM`

```c3
const CUShort POLLRDNORM              = 0x0040
```

---

#### `POLLRDBAND`

```c3
const CUShort POLLRDBAND              = 0x0080
```

---

#### `POLLWRNORM`

```c3
const CUShort POLLWRNORM              = 0x0100
```

---

#### `POLLWRBAND`

```c3
const CUShort POLLWRBAND              = 0x0200
```

---

#### `POLLMSG`

```c3
const CUShort POLLMSG                 = 0x0400
```

---

#### `POLLREMOVE`

```c3
const CUShort POLLREMOVE              = 0x1000
```

---

#### `POLLRDHUP`

```c3
const CUShort POLLRDHUP               = 0x2000
```

---

#### `POLLFREE`

```c3
const CUShort POLLFREE                = 0x4000
```

---

#### `POLL_BUSY_LOOP`

```c3
const CUShort POLL_BUSY_LOOP          = 0x8000
```

---

#### `MSG_PEEK`

```c3
const CInt MSG_PEEK = 0x0002
```
### `std::net::os @if(env::DARWIN)`

---

#### `AI_NUMERICSERV`

```c3
const AIFlags AI_NUMERICSERV = 0x1000
```

---

#### `AI_ALL`

```c3
const AIFlags AI_ALL = 0x100
```

---

#### `AI_V4MAPPED_CFG`

```c3
const AIFlags AI_V4MAPPED_CFG = 0x200
```

---

#### `AI_ADDRCONFIG`

```c3
const AIFlags AI_ADDRCONFIG = 0x400
```

---

#### `AI_V4MAPPED`

```c3
const AIFlags AI_V4MAPPED = 0x800
```

---

#### `AI_UNUSABLE`

```c3
const AIFlags AI_UNUSABLE = 0x10000000
```

---

#### `AI_DEFAULT`

```c3
const AIFlags AI_DEFAULT = AI_V4MAPPED_CFG | AI_ADDRCONFIG
```

---

#### `PLATFORM_AF_IMPLINK`

```c3
const AIFamily PLATFORM_AF_IMPLINK         = 3
```

---

#### `PLATFORM_AF_PUP`

```c3
const AIFamily PLATFORM_AF_PUP             = 4
```

---

#### `PLATFORM_AF_CHAOS`

```c3
const AIFamily PLATFORM_AF_CHAOS           = 5
```

---

#### `PLATFORM_AF_NS`

```c3
const AIFamily PLATFORM_AF_NS              = 6
```

---

#### `PLATFORM_AF_ISO`

```c3
const AIFamily PLATFORM_AF_ISO             = 7
```

---

#### `PLATFORM_AF_ECMA`

```c3
const AIFamily PLATFORM_AF_ECMA            = 8
```

---

#### `PLATFORM_AF_DATAKIT`

```c3
const AIFamily PLATFORM_AF_DATAKIT         = 9
```

---

#### `PLATFORM_AF_CCITT`

```c3
const AIFamily PLATFORM_AF_CCITT           = 10
```

---

#### `PLATFORM_AF_SNA`

```c3
const AIFamily PLATFORM_AF_SNA             = 11
```

---

#### `PLATFORM_AF_DECNET`

```c3
const AIFamily PLATFORM_AF_DECNET          = 12
```

---

#### `PLATFORM_AF_DLI`

```c3
const AIFamily PLATFORM_AF_DLI             = 13
```

---

#### `PLATFORM_AF_LAT`

```c3
const AIFamily PLATFORM_AF_LAT             = 14
```

---

#### `PLATFORM_AF_HYLINK`

```c3
const AIFamily PLATFORM_AF_HYLINK          = 15
```

---

#### `PLATFORM_AF_APPLETALK`

```c3
const AIFamily PLATFORM_AF_APPLETALK       = 16
```

---

#### `PLATFORM_AF_ROUTE`

```c3
const AIFamily PLATFORM_AF_ROUTE           = 17
```

---

#### `PLATFORM_AF_LINK`

```c3
const AIFamily PLATFORM_AF_LINK            = 18
```

---

#### `PLATFORM_PSEUDO_AF_XTP`

```c3
const AIFamily PLATFORM_PSEUDO_AF_XTP      = 19
```

---

#### `PLATFORM_AF_COIP`

```c3
const AIFamily PLATFORM_AF_COIP            = 20
```

---

#### `PLATFORM_AF_CNT`

```c3
const AIFamily PLATFORM_AF_CNT             = 21
```

---

#### `PLATFORM_PSEUDO_AF_RTIP`

```c3
const AIFamily PLATFORM_PSEUDO_AF_RTIP     = 22
```

---

#### `PLATFORM_AF_IPX`

```c3
const AIFamily PLATFORM_AF_IPX             = 23
```

---

#### `PLATFORM_AF_SIP`

```c3
const AIFamily PLATFORM_AF_SIP             = 24
```

---

#### `PLATFORM_PSEUDO_AF_PIP`

```c3
const AIFamily PLATFORM_PSEUDO_AF_PIP      = 25
```

---

#### `PLATFORM_AF_NDRV`

```c3
const AIFamily PLATFORM_AF_NDRV            = 27
```

---

#### `PLATFORM_AF_ISDN`

```c3
const AIFamily PLATFORM_AF_ISDN            = 28
```

---

#### `PLATFORM_PSEUDO_AF_KEY`

```c3
const AIFamily PLATFORM_PSEUDO_AF_KEY      = 29
```

---

#### `PLATFORM_AF_INET6`

```c3
const AIFamily PLATFORM_AF_INET6           = 30
```

---

#### `PLATFORM_AF_NATM`

```c3
const AIFamily PLATFORM_AF_NATM            = 31
```

---

#### `PLATFORM_AF_SYSTEM`

```c3
const AIFamily PLATFORM_AF_SYSTEM          = 32
```

---

#### `PLATFORM_AF_NETBIOS`

```c3
const AIFamily PLATFORM_AF_NETBIOS         = 33
```

---

#### `PLATFORM_AF_PPP`

```c3
const AIFamily PLATFORM_AF_PPP             = 34
```

---

#### `PLATFORM_PSEUDO_AF_HDRCMPLT`

```c3
const AIFamily PLATFORM_PSEUDO_AF_HDRCMPLT = 35
```

---

#### `PLATFORM_AF_IEEE80211`

```c3
const AIFamily PLATFORM_AF_IEEE80211       = 37
```

---

#### `PLATFORM_AF_UTUN`

```c3
const AIFamily PLATFORM_AF_UTUN            = 38
```

---

#### `PLATFORM_AF_VSOCK`

```c3
const AIFamily PLATFORM_AF_VSOCK           = 40
```

---

#### `PLATFORM_AF_MAX`

```c3
const AIFamily PLATFORM_AF_MAX             = 41
```

---

#### `PLATFORM_O_NONBLOCK`

```c3
const int PLATFORM_O_NONBLOCK = 0x04
```

---

#### `SOL_SOCKET`

```c3
const int SOL_SOCKET             = 0xffff
```

---

#### `SO_DEBUG`

```c3
const int SO_DEBUG               = 0x0001
```

---

#### `SO_ACCEPTCONN`

```c3
const int SO_ACCEPTCONN          = 0x0002
```

---

#### `SO_REUSEADDR`

```c3
const int SO_REUSEADDR           = 0x0004
```

---

#### `SO_KEEPALIVE`

```c3
const int SO_KEEPALIVE           = 0x0008
```

---

#### `SO_DONTROUTE`

```c3
const int SO_DONTROUTE           = 0x0010
```

---

#### `SO_BROADCAST`

```c3
const int SO_BROADCAST           = 0x0020
```

---

#### `SO_USELOOPBACK`

```c3
const int SO_USELOOPBACK         = 0x0040
```

---

#### `SO_LINGER`

```c3
const int SO_LINGER	             = 0x0080
```

---

#### `SO_OOBINLINE`

```c3
const int SO_OOBINLINE	         = 0x0100
```

---

#### `SO_REUSEPORT`

```c3
const int SO_REUSEPORT           = 0x0200
```

---

#### `SO_TIMESTAMP`

```c3
const int SO_TIMESTAMP	         = 0x0400
```

---

#### `SO_TIMESTAMP_MONOTONIC`

```c3
const int SO_TIMESTAMP_MONOTONIC = 0x0800
```

---

#### `SO_DONTTRUNC`

```c3
const int SO_DONTTRUNC           = 0x2000
```

---

#### `SO_WANTMORE`

```c3
const int SO_WANTMORE            = 0x4000
```

---

#### `SO_WANTOOBFLAG`

```c3
const int SO_WANTOOBFLAG         = 0x8000
```

---

#### `SO_SNDBUF`

```c3
const int SO_SNDBUF              = 0x1001
```

---

#### `SO_RCVBUF`

```c3
const int SO_RCVBUF              = 0x1002
```

---

#### `SO_SNDLOWAT`

```c3
const int SO_SNDLOWAT            = 0x1003
```

---

#### `SO_RCVLOWAT`

```c3
const int SO_RCVLOWAT            = 0x1004
```

---

#### `SO_SNDTIMEO`

```c3
const int SO_SNDTIMEO            = 0x1005
```

---

#### `SO_RCVTIMEO`

```c3
const int SO_RCVTIMEO            = 0x1006
```

---

#### `SO_ERROR`

```c3
const int SO_ERROR               = 0x1007
```

---

#### `SO_TYPE`

```c3
const int SO_TYPE                = 0x1008
```

---

#### `SO_LABEL`

```c3
const int SO_LABEL               = 0x1010
```

---

#### `SO_PEERLABEL`

```c3
const int SO_PEERLABEL           = 0x1011
```

---

#### `SO_NREAD`

```c3
const int SO_NREAD               = 0x1020
```

---

#### `SO_NKE`

```c3
const int SO_NKE                 = 0x1021
```

---

#### `SO_NOSIGPIPE`

```c3
const int SO_NOSIGPIPE           = 0x1022
```

---

#### `SO_NOADDRERR`

```c3
const int SO_NOADDRERR           = 0x1023
```

---

#### `SO_NWRITE`

```c3
const int SO_NWRITE              = 0x1024
```

---

#### `SO_REUSESHAREUID`

```c3
const int SO_REUSESHAREUID       = 0x1025
```

---

#### `SO_LINGER_SEC`

```c3
const int SO_LINGER_SEC          = 0x1080
```

---

#### `POLLRDNORM`

```c3
const CShort POLLRDNORM          = 0x0040
```

---

#### `POLLRDBAND`

```c3
const CShort POLLRDBAND          = 0x0080
```

---

#### `POLLWRNORM`

```c3
const CShort POLLWRNORM          = POLLOUT
```

---

#### `POLLWRBAND`

```c3
const CShort POLLWRBAND          = 0x0100
```

---

#### `POLLEXTEND`

```c3
const CShort POLLEXTEND          = 0x0200
```

---

#### `POLLATTRIB`

```c3
const CShort POLLATTRIB          = 0x0400
```

---

#### `POLLNLINK`

```c3
const CShort POLLNLINK           = 0x0800
```

---

#### `POLLWRITE`

```c3
const CShort POLLWRITE           = 0x1000
```

---

#### `MSG_PEEK`

```c3
const CInt MSG_PEEK = 0x0002
```
### `std::net::os @if(env::LINUX)`

---

#### `PLATFORM_AF_AX25`

```c3
const AIFamily PLATFORM_AF_AX25         = 3
```

---

#### `PLATFORM_AF_IPX`

```c3
const AIFamily PLATFORM_AF_IPX          = 4
```

---

#### `PLATFORM_AF_APPLETALK`

```c3
const AIFamily PLATFORM_AF_APPLETALK    = 5
```

---

#### `PLATFORM_AF_NETROM`

```c3
const AIFamily PLATFORM_AF_NETROM       = 6
```

---

#### `PLATFORM_AF_BRIDGE`

```c3
const AIFamily PLATFORM_AF_BRIDGE       = 7
```

---

#### `PLATFORM_AF_AAL5`

```c3
const AIFamily PLATFORM_AF_AAL5         = 8
```

---

#### `PLATFORM_AF_X25`

```c3
const AIFamily PLATFORM_AF_X25          = 9
```

---

#### `PLATFORM_AF_INET6`

```c3
const AIFamily PLATFORM_AF_INET6        = 10
```

---

#### `PLATFORM_O_NONBLOCK`

```c3
const PLATFORM_O_NONBLOCK = 0o4000
```

---

#### `SOL_SOCKET`

```c3
const int SOL_SOCKET = 1
```

---

#### `SO_DEBUG`

```c3
const int SO_DEBUG                   = 1
```

---

#### `SO_REUSEADDR`

```c3
const int SO_REUSEADDR               = 2
```

---

#### `SO_TYPE`

```c3
const int SO_TYPE                    = 3
```

---

#### `SO_ERROR`

```c3
const int SO_ERROR                   = 4
```

---

#### `SO_DONTROUTE`

```c3
const int SO_DONTROUTE               = 5
```

---

#### `SO_BROADCAST`

```c3
const int SO_BROADCAST               = 6
```

---

#### `SO_SNDBUF`

```c3
const int SO_SNDBUF                  = 7
```

---

#### `SO_RCVBUF`

```c3
const int SO_RCVBUF                  = 8
```

---

#### `SO_KEEPALIVE`

```c3
const int SO_KEEPALIVE               = 9
```

---

#### `SO_OOBINLINE`

```c3
const int SO_OOBINLINE	             = 10
```

---

#### `SO_NO_CHECK`

```c3
const int SO_NO_CHECK                = 11
```

---

#### `SO_PRIORITY`

```c3
const int SO_PRIORITY                = 12
```

---

#### `SO_LINGER`

```c3
const int SO_LINGER	                 = 13
```

---

#### `SO_BSDCOMPAT`

```c3
const int SO_BSDCOMPAT               = 14
```

---

#### `SO_REUSEPORT`

```c3
const int SO_REUSEPORT               = 15
```

---

#### `SO_RCVLOWAT`

```c3
const int SO_RCVLOWAT                = 18
```

---

#### `SO_SNDLOWAT`

```c3
const int SO_SNDLOWAT                = 19
```

---

#### `SO_RCVTIMEO`

```c3
const int SO_RCVTIMEO                = 20
```

---

#### `SO_SNDTIMEO`

```c3
const int SO_SNDTIMEO                = 21
```

---

#### `SO_BINDTODEVICE`

```c3
const int SO_BINDTODEVICE            = 25
```

---

#### `SO_ATTACH_FILTER`

```c3
const int SO_ATTACH_FILTER           = 26
```

---

#### `SO_DETACH_FILTER`

```c3
const int SO_DETACH_FILTER           = 27
```

---

#### `SO_PEERNAME`

```c3
const int SO_PEERNAME                = 28
```

---

#### `SO_TIMESTAMP`

```c3
const int SO_TIMESTAMP	             = 29
```

---

#### `SO_ACCEPTCONN`

```c3
const int SO_ACCEPTCONN              = 30
```

---

#### `SO_PEERSEC`

```c3
const int SO_PEERSEC                 = 31
```

---

#### `SO_SNDBUFFORCE`

```c3
const int SO_SNDBUFFORCE             = 32
```

---

#### `SO_RCVBUFFORCE`

```c3
const int SO_RCVBUFFORCE             = 33
```

---

#### `SO_PASSSEC`

```c3
const int SO_PASSSEC                 = 34
```

---

#### `SO_MARK`

```c3
const int SO_MARK                    = 36
```

---

#### `SO_PROTOCOL`

```c3
const int SO_PROTOCOL                = 38
```

---

#### `SO_DOMAIN`

```c3
const int SO_DOMAIN                  = 39
```

---

#### `SO_RXQ_OVFL`

```c3
const int SO_RXQ_OVFL                = 40
```

---

#### `SO_WIFI_STATUS`

```c3
const int SO_WIFI_STATUS             = 41
```

---

#### `SO_PEEK_OFF`

```c3
const int SO_PEEK_OFF                = 42
```

---

#### `SO_NOFCS`

```c3
const int SO_NOFCS                   = 43
```

---

#### `SO_LOCK_FILTER`

```c3
const int SO_LOCK_FILTER             = 44
```

---

#### `SO_SELECT_ERR_QUEUE`

```c3
const int SO_SELECT_ERR_QUEUE        = 45
```

---

#### `SO_BUSY_POLL`

```c3
const int SO_BUSY_POLL               = 46
```

---

#### `SO_MAX_PACING_RATE`

```c3
const int SO_MAX_PACING_RATE         = 47
```

---

#### `SO_BPF_EXTENSIONS`

```c3
const int SO_BPF_EXTENSIONS          = 48
```

---

#### `SO_INCOMING_CPU`

```c3
const int SO_INCOMING_CPU            = 49
```

---

#### `SO_ATTACH_BPF`

```c3
const int SO_ATTACH_BPF              = 50
```

---

#### `SO_ATTACH_REUSEPORT_CBPF`

```c3
const int SO_ATTACH_REUSEPORT_CBPF   = 51
```

---

#### `SO_ATTACH_REUSEPORT_EBPF`

```c3
const int SO_ATTACH_REUSEPORT_EBPF   = 52
```

---

#### `SO_CNX_ADVICE`

```c3
const int SO_CNX_ADVICE              = 53
```

---

#### `SO_MEMINFO`

```c3
const int SO_MEMINFO                 = 55
```

---

#### `SO_INCOMING_NAPI_ID`

```c3
const int SO_INCOMING_NAPI_ID        = 56
```

---

#### `SO_COOKIE`

```c3
const int SO_COOKIE                  = 57
```

---

#### `SO_PEERGROUPS`

```c3
const int SO_PEERGROUPS              = 59
```

---

#### `SO_ZEROCOPY`

```c3
const int SO_ZEROCOPY                = 60
```

---

#### `SO_TXTIME`

```c3
const int SO_TXTIME                  = 61
```

---

#### `SO_BINDTOIFINDEX`

```c3
const int SO_BINDTOIFINDEX           = 62
```

---

#### `SO_DETACH_REUSEPORT_BPF`

```c3
const int SO_DETACH_REUSEPORT_BPF    = 68
```

---

#### `SO_PREFER_BUSY_POLL`

```c3
const int SO_PREFER_BUSY_POLL        = 69
```

---

#### `SO_BUSY_POLL_BUDGET`

```c3
const int SO_BUSY_POLL_BUDGET        = 70
```

---

#### `SO_NETNS_COOKIE`

```c3
const int SO_NETNS_COOKIE            = 71
```

---

#### `SO_BUF_LOCK`

```c3
const int SO_BUF_LOCK                = 72
```

---

#### `SO_RESERVE_MEM`

```c3
const int SO_RESERVE_MEM             = 73
```

---

#### `SO_TXREHASH`

```c3
const int SO_TXREHASH                = 74
```

---

#### `SO_RCVMARK`

```c3
const int SO_RCVMARK                 = 75
```

---

#### `SO_PASSPIDFD`

```c3
const int SO_PASSPIDFD               = 76
```

---

#### `SO_PEERPIDFD`

```c3
const int SO_PEERPIDFD               = 77
```

---

#### `POLLRDNORM`

```c3
const CUShort POLLRDNORM              = 0x0040
```

---

#### `POLLRDBAND`

```c3
const CUShort POLLRDBAND              = 0x0080
```

---

#### `POLLWRNORM`

```c3
const CUShort POLLWRNORM              = 0x0100
```

---

#### `POLLWRBAND`

```c3
const CUShort POLLWRBAND              = 0x0200
```

---

#### `POLLMSG`

```c3
const CUShort POLLMSG                 = 0x0400
```

---

#### `POLLREMOVE`

```c3
const CUShort POLLREMOVE              = 0x1000
```

---

#### `POLLRDHUP`

```c3
const CUShort POLLRDHUP               = 0x2000
```

---

#### `POLLFREE`

```c3
const CUShort POLLFREE                = 0x4000
```

---

#### `POLL_BUSY_LOOP`

```c3
const CUShort POLL_BUSY_LOOP          = 0x8000
```

---

#### `MSG_PEEK`

```c3
const CInt MSG_PEEK = 0x0002
```
### `std::net::os @if(env::OPENBSD)`

---

#### `AI_EXT`

```c3
const AIFlags AI_EXT                    = 0x8
```

---

#### `AI_NUMERICSERV`

```c3
const AIFlags AI_NUMERICSERV            = 0x10
```

---

#### `AI_FQDN`

```c3
const AIFlags AI_FQDN                   = 0x20
```

---

#### `AI_ADDRCONFIG`

```c3
const AIFlags AI_ADDRCONFIG             = 0x40
```

---

#### `PLATFORM_AF_LOCAL`

```c3
const AIFamily PLATFORM_AF_LOCAL                = AF_UNIX
```

---

#### `PLATFORM_AF_IMPLINK`

```c3
const AIFamily PLATFORM_AF_IMPLINK              =  3
```

---

#### `PLATFORM_AF_PUP`

```c3
const AIFamily PLATFORM_AF_PUP                  =  4
```

---

#### `PLATFORM_AF_CHAOS`

```c3
const AIFamily PLATFORM_AF_CHAOS                =  5
```

---

#### `PLATFORM_AF_NS`

```c3
const AIFamily PLATFORM_AF_NS                   =  6
```

---

#### `PLATFORM_AF_ISO`

```c3
const AIFamily PLATFORM_AF_ISO                  =  7
```

---

#### `PLATFORM_AF_OSI`

```c3
const AIFamily PLATFORM_AF_OSI                  = PLATFORM_AF_ISO
```

---

#### `PLATFORM_AF_ECMA`

```c3
const AIFamily PLATFORM_AF_ECMA                 =  8
```

---

#### `PLATFORM_AF_DATAKIT`

```c3
const AIFamily PLATFORM_AF_DATAKIT              =  9
```

---

#### `PLATFORM_AF_CCITT`

```c3
const AIFamily PLATFORM_AF_CCITT                = 10
```

---

#### `PLATFORM_AF_SNA`

```c3
const AIFamily PLATFORM_AF_SNA                  = 11
```

---

#### `PLATFORM_AF_DECNET`

```c3
const AIFamily PLATFORM_AF_DECNET               = 12
```

---

#### `PLATFORM_AF_DLI`

```c3
const AIFamily PLATFORM_AF_DLI                  = 13
```

---

#### `PLATFORM_AF_LAT`

```c3
const AIFamily PLATFORM_AF_LAT                  = 14
```

---

#### `PLATFORM_AF_HYLINK`

```c3
const AIFamily PLATFORM_AF_HYLINK               = 15
```

---

#### `PLATFORM_AF_APPLETALK`

```c3
const AIFamily PLATFORM_AF_APPLETALK            = 16
```

---

#### `PLATFORM_AF_ROUTE`

```c3
const AIFamily PLATFORM_AF_ROUTE                = 17
```

---

#### `PLATFORM_AF_LINK`

```c3
const AIFamily PLATFORM_AF_LINK                 = 18
```

---

#### `PLATFORM_PSEUDO_AF_XTP`

```c3
const AIFamily PLATFORM_PSEUDO_AF_XTP           = 19
```

---

#### `PLATFORM_AF_COIP`

```c3
const AIFamily PLATFORM_AF_COIP                 = 20
```

---

#### `PLATFORM_AF_CNT`

```c3
const AIFamily PLATFORM_AF_CNT                  = 21
```

---

#### `PLATFORM_PSEUDO_AF_RTIP`

```c3
const AIFamily PLATFORM_PSEUDO_AF_RTIP          = 22
```

---

#### `PLATFORM_AF_IPX`

```c3
const AIFamily PLATFORM_AF_IPX                  = 23
```

---

#### `PLATFORM_AF_INET6`

```c3
const AIFamily PLATFORM_AF_INET6                = 24
```

---

#### `PLATFORM_PSEUDO_AF_PIP`

```c3
const AIFamily PLATFORM_PSEUDO_AF_PIP           = 25
```

---

#### `PLATFORM_AF_ISDN`

```c3
const AIFamily PLATFORM_AF_ISDN                 = 26
```

---

#### `PLATFORM_AF_E164`

```c3
const AIFamily PLATFORM_AF_E164                 = PLATFORM_AF_ISDN
```

---

#### `PLATFORM_AF_NATM`

```c3
const AIFamily PLATFORM_AF_NATM                 = 27
```

---

#### `PLATFORM_AF_ENCAP`

```c3
const AIFamily PLATFORM_AF_ENCAP                = 28
```

---

#### `PLATFORM_AF_SIP`

```c3
const AIFamily PLATFORM_AF_SIP                  = 29
```

---

#### `PLATFORM_AF_KEY`

```c3
const AIFamily PLATFORM_AF_KEY                  = 30
```

---

#### `PLATFORM_PSEUDO_AF_HDRCMPLT`

```c3
const AIFamily PLATFORM_PSEUDO_AF_HDRCMPLT      = 31
```

---

#### `PLATFORM_AF_BLUETOOTH`

```c3
const AIFamily PLATFORM_AF_BLUETOOTH            = 32
```

---

#### `PLATFORM_AF_MPLS`

```c3
const AIFamily PLATFORM_AF_MPLS                 = 33
```

---

#### `PLATFORM_PSEUDO_AF_PFLOW`

```c3
const AIFamily PLATFORM_PSEUDO_AF_PFLOW         = 34
```

---

#### `PLATFORM_PSEUDO_AF_PIPEX`

```c3
const AIFamily PLATFORM_PSEUDO_AF_PIPEX         = 35
```

---

#### `PLATFORM_AF_FRAME`

```c3
const AIFamily PLATFORM_AF_FRAME                = 36
```

---

#### `PLATFORM_AF_MAX`

```c3
const AIFamily PLATFORM_AF_MAX                  = 37
```

---

#### `SOL_SOCKET`

```c3
const int SOL_SOCKET = 0xFFFF
```

---

#### `SO_DEBUG`

```c3
const int SO_DEBUG        = 0x0001
```

---

#### `SO_ACCEPTCONN`

```c3
const int SO_ACCEPTCONN   = 0x0002
```

---

#### `SO_REUSEADDR`

```c3
const int SO_REUSEADDR    = 0x0004
```

---

#### `SO_KEEPALIVE`

```c3
const int SO_KEEPALIVE    = 0x0008
```

---

#### `SO_DONTROUTE`

```c3
const int SO_DONTROUTE    = 0x0010
```

---

#### `SO_BROADCAST`

```c3
const int SO_BROADCAST    = 0x0020
```

---

#### `SO_USELOOPBACK`

```c3
const int SO_USELOOPBACK  = 0x0040
```

---

#### `SO_LINGER`

```c3
const int SO_LINGER       = 0x0080
```

---

#### `SO_OOBINLINE`

```c3
const int SO_OOBINLINE    = 0x0100
```

---

#### `SO_REUSEPORT`

```c3
const int SO_REUSEPORT    = 0x0200
```

---

#### `SO_TIMESTAMP`

```c3
const int SO_TIMESTAMP    = 0x0800
```

---

#### `SO_BINDANY`

```c3
const int SO_BINDANY      = 0x1000
```

---

#### `SO_ZEROIZE`

```c3
const int SO_ZEROIZE      = 0x2000
```

---

#### `SO_SNDBUF`

```c3
const int SO_SNDBUF       = 0x1001
```

---

#### `SO_RCVBUF`

```c3
const int SO_RCVBUF       = 0x1002
```

---

#### `SO_SNDLOWAT`

```c3
const int SO_SNDLOWAT     = 0x1003
```

---

#### `SO_RCVLOWAT`

```c3
const int SO_RCVLOWAT     = 0x1004
```

---

#### `SO_SNDTIMEO`

```c3
const int SO_SNDTIMEO     = 0x1005
```

---

#### `SO_RCVTIMEO`

```c3
const int SO_RCVTIMEO     = 0x1006
```

---

#### `SO_ERROR`

```c3
const int SO_ERROR        = 0x1007
```

---

#### `SO_TYPE`

```c3
const int SO_TYPE         = 0x1008
```

---

#### `SO_NETPROC`

```c3
const int SO_NETPROC      = 0x1020
```

---

#### `SO_RTABLE`

```c3
const int SO_RTABLE       = 0x1021
```

---

#### `SO_PEERCRED`

```c3
const int SO_PEERCRED     = 0x1022
```

---

#### `SO_SPLICE`

```c3
const int SO_SPLICE       = 0x1023
```

---

#### `SO_DOMAIN`

```c3
const int SO_DOMAIN       = 0x1024
```

---

#### `SO_PROTOCOL`

```c3
const int SO_PROTOCOL     = 0x1025
```

---

#### `POLLRDNORM`

```c3
const CUShort POLLRDNORM            = 0x0040
```

---

#### `POLLNORM`

```c3
const CUShort POLLNORM              = POLLRDNORM
```

---

#### `POLLWRNORM`

```c3
const CUShort POLLWRNORM            = POLLOUT
```

---

#### `POLLRDBAND`

```c3
const CUShort POLLRDBAND            = 0x0080
```

---

#### `POLLWRBAND`

```c3
const CUShort POLLWRBAND            = 0x0100
```

---

#### `MSG_OOB`

```c3
const CInt MSG_OOB                 = 0x1
```

---

#### `MSG_PEEK`

```c3
const CInt MSG_PEEK                = 0x2
```

---

#### `MSG_DONTROUTE`

```c3
const CInt MSG_DONTROUTE           = 0x4
```

---

#### `MSG_EOR`

```c3
const CInt MSG_EOR                 = 0x8
```

---

#### `MSG_TRUNC`

```c3
const CInt MSG_TRUNC               = 0x10
```

---

#### `MSG_CTRUNC`

```c3
const CInt MSG_CTRUNC              = 0x20
```

---

#### `MSG_WAITALL`

```c3
const CInt MSG_WAITALL             = 0x40
```

---

#### `MSG_DONTWAIT`

```c3
const CInt MSG_DONTWAIT            = 0x80
```

---

#### `MSG_BCAST`

```c3
const CInt MSG_BCAST               = 0x100
```

---

#### `MSG_MCAST`

```c3
const CInt MSG_MCAST               = 0x200
```

---

#### `MSG_NOSIGNAL`

```c3
const CInt MSG_NOSIGNAL            = 0x400
```

---

#### `MSG_CMSG_CLOEXEC`

```c3
const CInt MSG_CMSG_CLOEXEC        = 0x800
```

---

#### `MSG_WAITFORONE`

```c3
const CInt MSG_WAITFORONE          = 0x1000
```

---

#### `SOCK_CLOEXEC`

```c3
const SOCK_CLOEXEC                  = 0x8000
```

---

#### `SOCK_NONBLOCK`

```c3
const SOCK_NONBLOCK                 = 0x4000
```

---

#### `SOCK_NONBLOCK_INHERIT`

```c3
const SOCK_NONBLOCK_INHERIT         = 0x2000
```

---

#### `SOCK_DNS`

```c3
const SOCK_DNS                      = 0x1000
```

---

#### `PLATFORM_O_NONBLOCK`

```c3
const PLATFORM_O_NONBLOCK = SOCK_NONBLOCK
```
### `std::net::os @if(env::POSIX && SUPPORTS_INET)`

---

#### `F_GETFL`

```c3
const int F_GETFL = 3
```

---

#### `F_SETFL`

```c3
const int F_SETFL = 4
```

---

#### `NativeSocket`

```c3
typedef NativeSocket = inline Fd
```

---

#### `Posix_pollfd`

```c3
struct Posix_pollfd
```

---

#### `Posix_nfds_t`

```c3
alias Posix_nfds_t = CUInt
```

---

#### `connect`

```c3
extern fn CInt connect(NativeSocket socket, SockAddrPtr address, Socklen_t address_len)
```

---

#### `socket_error`

```c3
fn fault socket_error()
```

---

#### `NativeSocket.is_valid`

```c3
macro bool NativeSocket.is_valid(self)
```

---

#### `NativeSocket.close`

```c3
macro void? NativeSocket.close(self)
```

---

#### `NativeSocket.set_non_blocking`

```c3
macro void? NativeSocket.set_non_blocking(self, bool non_blocking)
```

---

#### `NativeSocket.is_non_blocking`

```c3
macro bool NativeSocket.is_non_blocking(self)
```
### `std::net::os @if(env::WIN32)`

---

#### `PLATFORM_AF_IPX`

```c3
const AIFamily PLATFORM_AF_IPX          = 6
```

---

#### `PLATFORM_AF_APPLETALK`

```c3
const AIFamily PLATFORM_AF_APPLETALK    = 16
```

---

#### `PLATFORM_AF_NETBIOS`

```c3
const AIFamily PLATFORM_AF_NETBIOS      = 17
```

---

#### `PLATFORM_AF_INET6`

```c3
const AIFamily PLATFORM_AF_INET6        = 23
```

---

#### `PLATFORM_AF_IRDA`

```c3
const AIFamily PLATFORM_AF_IRDA         = 26
```

---

#### `PLATFORM_AF_BTH`

```c3
const AIFamily PLATFORM_AF_BTH          = 32
```

---

#### `FIONREAD`

```c3
const int FIONREAD = 1074030207
```

---

#### `FIONBIO`

```c3
const int FIONBIO = -2147195266
```

---

#### `FIOASYNC`

```c3
const int FIOASYNC = -2147195267
```

---

#### `NativeSocket`

```c3
typedef NativeSocket = inline Win32_SOCKET
```

---

#### `ioctlsocket`

```c3
extern fn CInt ioctlsocket(NativeSocket, CLong cmd, CULong *argp)
```

---

#### `NativeSocket.set_non_blocking`

```c3
fn void? NativeSocket.set_non_blocking(self, bool non_blocking)
```

---

#### `NativeSocket.close`

```c3
macro void? NativeSocket.close(self)
```

---

#### `SOL_SOCKET`

```c3
const int SOL_SOCKET              = 0xffff
```

---

#### `SO_DEBUG`

```c3
const int SO_DEBUG                = 0x0001
```

---

#### `SO_ACCEPTCONN`

```c3
const int SO_ACCEPTCONN           = 0x0002
```

---

#### `SO_REUSEADDR`

```c3
const int SO_REUSEADDR            = 0x0004
```

---

#### `SO_KEEPALIVE`

```c3
const int SO_KEEPALIVE            = 0x0008
```

---

#### `SO_DONTROUTE`

```c3
const int SO_DONTROUTE            = 0x0010
```

---

#### `SO_BROADCAST`

```c3
const int SO_BROADCAST            = 0x0020
```

---

#### `SO_USELOOPBACK`

```c3
const int SO_USELOOPBACK          = 0x0040
```

---

#### `SO_LINGER`

```c3
const int SO_LINGER               = 0x0080
```

---

#### `SO_OOBINLINE`

```c3
const int SO_OOBINLINE            = 0x0100
```

---

#### `SO_SNDBUF`

```c3
const int SO_SNDBUF               = 0x1001
```

---

#### `SO_RCVBUF`

```c3
const int SO_RCVBUF               = 0x1002
```

---

#### `SO_SNDLOWAT`

```c3
const int SO_SNDLOWAT             = 0x1003
```

---

#### `SO_RCVLOWAT`

```c3
const int SO_RCVLOWAT             = 0x1004
```

---

#### `SO_SNDTIMEO`

```c3
const int SO_SNDTIMEO             = 0x1005
```

---

#### `SO_RCVTIMEO`

```c3
const int SO_RCVTIMEO             = 0x1006
```

---

#### `SO_ERROR`

```c3
const int SO_ERROR                = 0x1007
```

---

#### `SO_TYPE`

```c3
const int SO_TYPE                 = 0x1008
```

---

#### `convert_error`

```c3
fn fault convert_error(WSAError error)
```

---

#### `socket_error`

```c3
fn fault socket_error()
```

---

#### `POLLIN`

```c3
const CUShort POLLIN      = win32::POLLIN
```

---

#### `POLLPRI`

```c3
const CUShort POLLPRI     = win32::POLLPRI
```

---

#### `POLLOUT`

```c3
const CUShort POLLOUT     = win32::POLLOUT
```

---

#### `POLLERR`

```c3
const CUShort POLLERR     = win32::POLLERR
```

---

#### `POLLHUP`

```c3
const CUShort POLLHUP     = win32::POLLHUP
```

---

#### `POLLNVAL`

```c3
const CUShort POLLNVAL    = win32::POLLNVAL
```

---

#### `POLLRDNORM`

```c3
const CUShort POLLRDNORM  = win32::POLLRDNORM
```

---

#### `POLLRDBAND`

```c3
const CUShort POLLRDBAND  = win32::POLLRDBAND
```

---

#### `POLLWRNORM`

```c3
const CUShort POLLWRNORM  = win32::POLLWRNORM
```

---

#### `POLLWRBAND`

```c3
const CUShort POLLWRBAND  = win32::POLLWRBAND
```

---

#### `MSG_PEEK`

```c3
const int MSG_PEEK = 0x0002
```
### `std::net::tcp @if(os::SUPPORTS_INET)`

---

#### `TcpSocket`

```c3
typedef TcpSocket = inline Socket
```

---

#### `TcpServerSocket`

```c3
typedef TcpServerSocket = inline Socket
```

---

#### `connect`

```c3
fn TcpSocket? connect(String host, uint port, Duration timeout = time::DURATION_ZERO, SocketOption... options, IpProtocol ip_protocol = UNSPECIFIED)
```

---

#### `connect_async`

```c3
fn TcpSocket? connect_async(String host, uint port, SocketOption... options, IpProtocol ip_protocol = UNSPECIFIED)
```

---

#### `connect_to`

```c3
fn TcpSocket? connect_to(AddrInfo* ai, SocketOption... options)
```

---

#### `connect_async_to`

```c3
fn TcpSocket? connect_async_to(AddrInfo* ai, SocketOption... options)
```

---

#### `listen`

```c3
fn TcpServerSocket? listen(String host, uint port, uint backlog, SocketOption... options, IpProtocol ip_protocol = UNSPECIFIED)
```

---

#### `accept`

```c3
fn TcpSocket? accept(TcpServerSocket* server_socket)
```

---

#### `listen_to`

```c3
fn TcpServerSocket? listen_to(AddrInfo* ai, uint backlog, SocketOption... options)
```
### `std::net::udp @if(os::SUPPORTS_INET)`

---

#### `UdpSocket`

```c3
typedef UdpSocket = inline Socket
```

---

#### `connect`

```c3
fn UdpSocket? connect(String host, uint port, SocketOption... options, IpProtocol ip_protocol = UNSPECIFIED)
```

---

#### `connect_to`

```c3
fn UdpSocket? connect_to(AddrInfo* ai, SocketOption... options)
```

---

#### `connect_async`

```c3
fn UdpSocket? connect_async(String host, uint port, SocketOption... options, IpProtocol ip_protocol = UNSPECIFIED)
```

---

#### `connect_async_to`

```c3
fn UdpSocket? connect_async_to(AddrInfo* ai, SocketOption... options)
```
### `std::net::url`

---

#### `EMPTY, INVALID_SCHEME, INVALID_USER, INVALID_PASSWORD, INVALID_HOST, INVALID_PATH, INVALID_FRAGMENT`

```c3
faultdef
	EMPTY,
	INVALID_SCHEME,
	INVALID_USER,
	INVALID_PASSWORD,
	INVALID_HOST,
	INVALID_PATH,
	INVALID_FRAGMENT
```

---

#### `Url`

```c3
struct Url(Printable)
```

Represents the actual (decoded) Url.

An Url can be parsed from a String with `new_parse()` or `temp_parse()`. The
parsed fields are decoded. The only field that is not decoded is `query`.
To access the decoded query values, use `new_parse_query(query)`.

`Url.to_string()` will re-assemble the fields into a valid Url string with
proper percent-encoded values.

If the Url struct fields are filled in manually, use the actual (un-encoded)
values. To create a raw query string, initialize an `UrlQueryValues` map, use
`UrlQueryValues.add()` to add the query parameters and, finally, call
`UrlQueryValues.to_string()`.


---

#### `tparse`

```c3
<*
 @param [in] url_string
 @require url_string.len > 0 : "the url_string must be len 1 or more"
 @return "the parsed Url"
*>
fn Url? tparse(String url_string)
```

Parse a URL string into a Url struct.


---

#### `parse`

```c3
<*
 @param [in] url_string
 @require url_string.len > 0 : "the url_string must be len 1 or more"
 @return "the parsed Url"
*>
fn Url? parse(Allocator allocator, String url_string)
```

Parse a URL string into a Url struct.


---

#### `Url.to_format`

```c3
fn usz? Url.to_format(&self, Formatter* f) @dynamic
```

---

#### `Url.to_string`

```c3
fn String Url.to_string(&self, Allocator allocator)
```

---

#### `UrlQueryValueList`

```c3
alias UrlQueryValueList = List{String}
```

---

#### `UrlQueryValues`

```c3
struct UrlQueryValues
```

---

#### `parse_query_to_temp`

```c3
<*
 @param [in] query
 @return "a UrlQueryValues HashMap"
*>
fn UrlQueryValues parse_query_to_temp(String query)
```

Parse the query parameters of the Url into a UrlQueryValues map.


---

#### `parse_query`

```c3
<*
 @param [in] query
 @param [inout] allocator
 @return "a UrlQueryValues HashMap"
*>
fn UrlQueryValues parse_query(Allocator allocator, String query)
```

Parse the query parameters of the Url into a UrlQueryValues map.


---

#### `UrlQueryValues.add`

```c3
<*
 @param [in] self
 @param key
 @param value
 @return "a UrlQueryValues map"
*>
fn UrlQueryValues* UrlQueryValues.add(&self, String key, String value)
```

Add copies of the key and value strings to the UrlQueryValues map. These
copies are freed when the UrlQueryValues map is freed.


---

#### `UrlQueryValues.to_format`

```c3
fn usz? UrlQueryValues.to_format(&self, Formatter* f) @dynamic
```

---

#### `UrlQueryValues.free`

```c3
fn void UrlQueryValues.free(&self)
```

---

#### `Url.free`

```c3
<*
 @param [in] self
*>
fn void Url.free(&self)
```

Free an Url struct.


---

#### `UrlEncodingMode`

```c3
enum UrlEncodingMode : char (String allowed)
```

---

#### `INVALID_HEX`

```c3
faultdef INVALID_HEX
```

---

#### `should_encode`

```c3
<*
 @param c : "Character to check if it should be encoded."
 @param mode : "Url encoding mode."
*>
fn bool should_encode(char c, UrlEncodingMode mode) @private
```

Returns true if char c should be encoded according to RFC 3986.


---

#### `encode_len`

```c3
fn usz encode_len(String s, UrlEncodingMode mode) @inline
```

Calculate the length of the percent-encoded string.


---

#### `encode`

```c3
<*
 @param s : "String to encode"
 @param mode : "Url encoding mode"
 @param [inout] allocator
 @return "Percent-encoded String"
*>
fn String encode(Allocator allocator, String s, UrlEncodingMode mode)
```

Encode the string s for a given encoding mode.
Returned string must be freed.


---

#### `tencode`

```c3
<*
 @param s : "String to encode"
 @param mode : "Url encoding mode"
 @return "Percent-encoded String"
*>
fn String tencode(String s, UrlEncodingMode mode)
```

Encode string s for a given encoding mode, stored on the temp allocator.


---

#### `decode_len`

```c3
<*
 @return? INVALID_HEX
*>
fn usz? decode_len(String s, UrlEncodingMode mode) @inline
```

Calculate the length of the percent-decoded string.


---

#### `decode`

```c3
<*
 @param s : "String to decode"
 @param mode : "Url encoding mode"
 @param [inout] allocator
 @return "Percent-decoded String"
*>
fn String? decode(Allocator allocator, String s, UrlEncodingMode  mode)
```

Decode string s for a given encoding mode.
Returned string must be freed.


---

#### `tdecode`

```c3
<*
 @param s : "String to decode"
 @param mode : "Url encoding mode"
 @return "Percent-decoded String"
*>
fn String? tdecode(String s, UrlEncodingMode  mode)
```

Decode string s for a given encoding mode, stored on the temp allocator.

### `std::os`

---

#### `exit`

```c3
fn void exit(int result) @weak @noreturn
```

Exit the process with a given exit code. This will typically call 'exit' in LibC


---

#### `fastexit`

```c3
fn void fastexit(int result) @weak @noreturn
```

Exit the process with a given exit code. This will typically call '_Exit' in LibC
usually bypassing '@finalizer' functions.

### `std::os @if(env::DARWIN)`

---

#### `num_cpu`

```c3
fn uint num_cpu()
```
### `std::os @if(env::LINUX)`

---

#### `num_cpu`

```c3
fn uint num_cpu()
```
### `std::os @if(env::WIN32)`

---

#### `num_cpu`

```c3
fn uint num_cpu()
```
### `std::os::android @if(env::ANDROID)`

---

#### `LogPriority`

```c3
enum LogPriority : (CInt val)
```

---

#### `LogId`

```c3
enum LogId : (CInt val)
```

---

#### `LogMessage`

```c3
struct LogMessage @packed
```

---

#### `log_write`

```c3
extern fn CInt log_write(LogPriority prio, ZString tag, ZString text) @extern("__android_log_write")
```

---

#### `log_buf_write`

```c3
extern fn CInt log_buf_write(CInt bufID, CInt prio, ZString tag, ZString text) @extern("__android_log_buf_write")
```
### `std::os::backtrace`

---

#### `SEGMENT_NOT_FOUND, EXECUTABLE_PATH_NOT_FOUND, IMAGE_NOT_FOUND, NO_BACKTRACE_SYMBOLS,     RESOLUTION_FAILED`

```c3
faultdef SEGMENT_NOT_FOUND, EXECUTABLE_PATH_NOT_FOUND, IMAGE_NOT_FOUND, NO_BACKTRACE_SYMBOLS,
         RESOLUTION_FAILED
```

---

#### `BACKTRACE_UNKNOWN`

```c3
const Backtrace BACKTRACE_UNKNOWN = { 0, "", "", "", 0, null, false }
```

---

#### `Backtrace`

```c3
struct Backtrace (Printable)
```

---

#### `Backtrace.has_file`

```c3
fn bool Backtrace.has_file(&self)
```

---

#### `Backtrace.is_unknown`

```c3
fn bool Backtrace.is_unknown(&self)
```

---

#### `Backtrace.to_format`

```c3
fn usz? Backtrace.to_format(&self, Formatter* formatter) @dynamic
```

---

#### `Backtrace.free`

```c3
fn void Backtrace.free(&self)
```

---

#### `Backtrace.init`

```c3
fn Backtrace* Backtrace.init(&self, Allocator allocator, uptr offset, String function, String object_file, String file = "", uint line = 0)
```

---

#### `capture_current`

```c3
fn void*[] capture_current(void*[] buffer)
```

---

#### `BacktraceList`

```c3
alias BacktraceList = List{Backtrace}
```

---

#### `symbolize_backtrace`

```c3
alias symbolize_backtrace @if(env::LINUX)  	= linux::symbolize_backtrace
```
```c3
alias symbolize_backtrace @if(env::WIN32)  	= win32::symbolize_backtrace
```
```c3
alias symbolize_backtrace @if(env::DARWIN) 	= darwin::symbolize_backtrace
```
```c3
alias symbolize_backtrace @if(env::OPENBSD)	= openbsd::symbolize_backtrace
```
```c3
fn BacktraceList? symbolize_backtrace(Allocator allocator, void*[] backtrace) @if(!env::NATIVE_STACKTRACE)
```
### `std::os::darwin @if(env::DARWIN)`

---

#### `CTL_UNSPEC`

```c3
const CTL_UNSPEC	= 0
```

---

#### `CTL_KERN`

```c3
const CTL_KERN		= 1
```

---

#### `CTL_VM`

```c3
const CTL_VM		= 2
```

---

#### `CTL_VFS`

```c3
const CTL_VFS		= 3
```

---

#### `CTL_NET`

```c3
const CTL_NET		= 4
```

---

#### `CTL_DEBUG`

```c3
const CTL_DEBUG		= 5
```

---

#### `CTL_HW`

```c3
const CTL_HW		= 6
```

---

#### `CTL_MACHDEP`

```c3
const CTL_MACHDEP	= 7
```

---

#### `CTL_USER`

```c3
const CTL_USER		= 8
```

---

#### `CTL_MAXID`

```c3
const CTL_MAXID		= 9
```

---

#### `HW_MACHINE`

```c3
const HW_MACHINE		= 1
```

---

#### `HW_MODEL`

```c3
const HW_MODEL			= 2
```

---

#### `HW_NCPU`

```c3
const HW_NCPU			= 3
```

---

#### `HW_BYTEORDER`

```c3
const HW_BYTEORDER		= 4
```

---

#### `HW_PHYSMEM`

```c3
const HW_PHYSMEM		= 5
```

---

#### `HW_USERMEM`

```c3
const HW_USERMEM		= 6
```

---

#### `HW_PAGESIZE`

```c3
const HW_PAGESIZE		= 7
```

---

#### `HW_DISKNAMES`

```c3
const HW_DISKNAMES		= 8
```

---

#### `HW_DISKSTATS`

```c3
const HW_DISKSTATS		= 9
```

---

#### `HW_EPOCH`

```c3
const HW_EPOCH			= 10
```

---

#### `HW_FLOATINGPT`

```c3
const HW_FLOATINGPT		= 11
```

---

#### `HW_MACHINE_ARCH`

```c3
const HW_MACHINE_ARCH	= 12
```

---

#### `HW_VECTORUNIT`

```c3
const HW_VECTORUNIT		= 13
```

---

#### `HW_BUS_FREQ`

```c3
const HW_BUS_FREQ		= 14
```

---

#### `HW_CPU_FREQ`

```c3
const HW_CPU_FREQ		= 15
```

---

#### `HW_CACHELINE`

```c3
const HW_CACHELINE		= 16
```

---

#### `HW_L1ICACHESIZE`

```c3
const HW_L1ICACHESIZE	= 17
```

---

#### `HW_L1DCACHESIZE`

```c3
const HW_L1DCACHESIZE	= 18
```

---

#### `HW_L2SETTINGS`

```c3
const HW_L2SETTINGS		= 19
```

---

#### `HW_L2CACHESIZE`

```c3
const HW_L2CACHESIZE	= 20
```

---

#### `HW_L3SETTINGS`

```c3
const HW_L3SETTINGS		= 21
```

---

#### `HW_L3CACHESIZE`

```c3
const HW_L3CACHESIZE	= 22
```

---

#### `HW_MAXID`

```c3
const HW_MAXID			= 23
```

---

#### `sysctl`

```c3
extern fn CInt sysctl(CInt *name, CUInt namelen, void *oldp, usz *oldlenp, void *newp, usz newlen)
```

---

#### `Darwin_segment_command_`

```c3
struct Darwin_segment_command_64
```

---

#### `Darwin_mach_timebase_info`

```c3
struct Darwin_mach_timebase_info
```

---

#### `Darwin_mach_timebase_info_t`

```c3
alias Darwin_mach_timebase_info_t = Darwin_mach_timebase_info
```

---

#### `Darwin_mach_timebase_info_data_t`

```c3
alias Darwin_mach_timebase_info_data_t = Darwin_mach_timebase_info
```

---

#### `mach_timebase_info`

```c3
extern fn void mach_timebase_info(Darwin_mach_timebase_info_data_t* timebase)
```

---

#### `load_address`

```c3
fn uptr? load_address() @local
```

---

#### `backtrace_load_element`

```c3
fn Backtrace? backtrace_load_element(Allocator allocator, String execpath, void* buffer, void* load_address) @local
```

---

#### `symbolize_backtrace`

```c3
fn BacktraceList? symbolize_backtrace(Allocator allocator, void*[] backtrace)
```

---

#### `malloc_size`

```c3
extern fn usz malloc_size(void* ptr)
```
### `std::os::darwin::cocoa @if(env::OS_TYPE == MACOS) @link("Cocoa.framework")`

---

#### `nsApplicationMain`

```c3
extern fn int nsApplicationMain(int argc, char **argv) @extern("NSApplicationMain")
```
### `std::os::env`

---

#### `get_var`

```c3
<*
 @param [in] name
 @require name.len > 0
 @return? NOT_FOUND
*>
fn String? get_var(Allocator allocator, String name)
```

---

#### `tget_var`

```c3
fn String? tget_var(String name)
```

---

#### `set_var`

```c3
<*
 @param [in] name
 @param [in] value
 @require name.len > 0
*>
fn bool set_var(String name, String value, bool overwrite = true)
```

---

#### `get_home_dir`

```c3
fn String? get_home_dir(Allocator allocator)
```

Returns the current user's home directory.


---

#### `get_config_dir`

```c3
fn Path? get_config_dir(Allocator allocator)
```

Returns the current user's config directory.


---

#### `clear_var`

```c3
<*
 @param [in] name
 @require name.len > 0
*>
fn bool clear_var(String name)
```

---

#### `executable_path`

```c3
fn String? executable_path()
```
### `std::os::freebsd @if(env::FREEBSD)`
### `std::os::linux @if(env::LINUX)`

---

#### `malloc_usable_size`

```c3
extern fn usz malloc_usable_size(void* ptr)
```

---

#### `readlink`

```c3
extern fn isz readlink(ZString path, char* buf, usz bufsize)
```

---

#### `Elf`

```c3
struct Elf32_Phdr
```
```c3
alias Elf64_Addr = ulong
```
```c3
alias Elf64_Half = ushort
```
```c3
alias Elf64_Off = ulong
```
```c3
alias Elf64_Word = uint
```
```c3
alias Elf64_Sword = int
```
```c3
alias Elf64_Sxword = long
```
```c3
alias Elf64_Lword = ulong
```
```c3
alias Elf64_Xword = ulong
```
```c3
struct Elf64_Ehdr
```
```c3
struct Elf64_Phdr
```

---

#### `dladdr`

```c3
extern fn CInt dladdr(void* addr, Linux_Dl_info* info)
```

---

#### `Dl_iterate_phdr_callback`

```c3
alias Dl_iterate_phdr_callback64 = fn CInt(Linux_dl_phdr_info_64*, usz, void*)
```
```c3
alias Dl_iterate_phdr_callback32 = fn CInt(Linux_dl_phdr_info_32*, usz, void*)
```

---

#### `dl_iterate_phdr64`

```c3
extern fn CInt dl_iterate_phdr64(Dl_iterate_phdr_callback64 callback, void* data)
```

---

#### `Linux_dl_phdr_info_`

```c3
struct Linux_dl_phdr_info_32
```

---

#### `elf_module_image_base`

```c3
fn ulong? elf_module_image_base(String path) @local
```

---

#### `backtrace_add_from_exec`

```c3
fn void? backtrace_add_from_exec(Allocator allocator, BacktraceList* list, void* addr) @local
```

---

#### `backtrace_add_from_dlinfo`

```c3
fn void? backtrace_add_from_dlinfo(Allocator allocator, BacktraceList* list, void* addr, Linux_Dl_info* info) @local
```

---

#### `backtrace_line_parse`

```c3
fn Backtrace? backtrace_line_parse(Allocator allocator, String string, String obj_name, String func_name, bool is_inlined)
```

---

#### `backtrace_add_addr2line`

```c3
fn void? backtrace_add_addr2line(Allocator allocator, BacktraceList* list, void* addr, String addr2line, String obj_name, String func_name) @local
```

---

#### `backtrace_add_element`

```c3
fn void? backtrace_add_element(Allocator allocator, BacktraceList *list, void* addr) @local
```

---

#### `symbolize_backtrace`

```c3
fn BacktraceList? symbolize_backtrace(Allocator allocator, void*[] backtrace)
```
### `std::os::macos::cf @if(env::DARWIN) @link(env::DARWIN, "CoreFoundation.framework")`

---

#### `CFAllocatorRef`

```c3
typedef CFAllocatorRef = void*
```

---

#### `CFAllocatorContextRef`

```c3
typedef CFAllocatorContextRef = void*
```

---

#### `CFOptionFlags`

```c3
alias CFOptionFlags = usz
```

---

#### `default_allocator`

```c3
macro CFAllocatorRef default_allocator()
```

---

#### `CFAllocatorRef.dealloc`

```c3
macro void CFAllocatorRef.dealloc(CFAllocatorRef allocator, void* ptr)
```

---

#### `CFAllocatorRef.alloc`

```c3
macro void* CFAllocatorRef.alloc(CFAllocatorRef allocator, usz size)
```

---

#### `CFAllocatorRef.get_preferred_size`

```c3
macro usz CFAllocatorRef.get_preferred_size(CFAllocatorRef allocator, usz req_size)
```

---

#### `CFAllocatorRef.set_default`

```c3
macro void CFAllocatorRef.set_default(CFAllocatorRef allocator)
```

---

#### `macos_CFAllocatorCreate`

```c3
extern fn CFAllocatorRef macos_CFAllocatorCreate(CFAllocatorRef allocator, CFAllocatorContextRef context) @extern("CFAllocatorCreate") @builtin
```

---

#### `CFArrayRef`

```c3
typedef CFArrayRef = void*
```

---

#### `CFArrayCallBacksRef`

```c3
typedef CFArrayCallBacksRef = void*
```

---

#### `CFMutableArrayRef`

```c3
typedef CFMutableArrayRef = void*
```

---

#### `macos_CFArrayCreate`

```c3
extern fn CFArrayRef macos_CFArrayCreate(CFAllocatorRef allocator, void** values, CFIndex num_values, CFArrayCallBacksRef callBacks) @extern("CFArrayCreate") @builtin
```

---

#### `CFTypeRef`

```c3
typedef CFTypeRef = void*
```

---

#### `CFIndex`

```c3
alias CFIndex = isz
```

---

#### `CFRange`

```c3
struct CFRange
```

---

#### `macos_CFRetain`

```c3
extern fn CFTypeRef macos_CFRetain(CFTypeRef cf) @extern("CFRetain") @builtin
```
### `std::os::macos::objc @if(env::DARWIN) @link(env::DARWIN, "CoreFoundation.framework")`

---

#### `ObjcClass`

```c3
typedef ObjcClass = void*
```

---

#### `ObjcMethod`

```c3
typedef ObjcMethod = void*
```

---

#### `ObjcIvar`

```c3
typedef ObjcIvar = void*
```

---

#### `ObjcSelector`

```c3
typedef ObjcSelector = void*
```

---

#### `ObjcId`

```c3
alias ObjcId = void*
```

---

#### `SendVoid`

```c3
alias SendVoid = fn void*(void*, ObjcSelector)
```

---

#### `CLASS_NOT_FOUND, UNKNOWN_EVENT`

```c3
faultdef CLASS_NOT_FOUND, UNKNOWN_EVENT
```

---

#### `ObjcClass.name`

```c3
macro ZString ObjcClass.name(ObjcClass cls)
```

---

#### `ObjcClass.superclass`

```c3
macro ObjcClass ObjcClass.superclass(ObjcClass cls)
```

---

#### `ObjcClass.responds_to`

```c3
macro bool ObjcClass.responds_to(ObjcClass cls, ObjcSelector sel)
```

---

#### `ObjcClass.method`

```c3
macro ObjcMethod ObjcClass.method(ObjcClass cls, ObjcSelector name)
```

---

#### `ObjcSelector.equals`

```c3
macro bool ObjcSelector.equals(ObjcSelector a, ObjcSelector b)
```

---

#### `ObjcClass.equals`

```c3
macro bool ObjcClass.equals(ObjcClass a, ObjcClass b)
```

---

#### `alloc`

```c3
fn ObjcId alloc(ObjcClass cls)
```

---

#### `release`

```c3
fn void release(ObjcId id)
```

---

#### `class_by_name`

```c3
macro ObjcClass? class_by_name(ZString c)
```

---

#### `class_get_list`

```c3
macro ObjcClass[] class_get_list(Allocator allocator)
```

---

#### `msgSend`

```c3
extern fn void msgSend(...) @extern("objc_msgSend") @builtin
```

---

#### `getClass`

```c3
extern fn ObjcClass getClass(ZString name) @extern("objc_getClass")
```

---

#### `ApplicationActivationPolicy`

```c3
enum ApplicationActivationPolicy : (int val)
```

---

#### `WindowStyleMask`

```c3
enum WindowStyleMask : (int val)
```

---

#### `BackingStore`

```c3
enum BackingStore : (int val)
```

---

#### `EventType`

```c3
enum EventType : (long val)
```

---

#### `event_type_from`

```c3
fn EventType? event_type_from(int val)
```

---

#### `EventMask`

```c3
enum EventMask : (long val)
```

---

#### `EventModifierFlag`

```c3
enum EventModifierFlag : (int val)
```
### `std::os::netbsd @if(env::NETBSD)`
### `std::os::openbsd @if(env::OPENBSD)`

---

#### `backtrace_symbols_fmt`

```c3
extern fn ZString* backtrace_symbols_fmt(void **addrlist, usz len, ZString fmt)
```

---

#### `backtrace_add_addr2line`

```c3
fn void? backtrace_add_addr2line(Allocator allocator, BacktraceList* list, String obj, String addr2line) @local
```

---

#### `backtrace_add_from_exec`

```c3
fn void? backtrace_add_from_exec(Allocator allocator, BacktraceList* list, String fun, String obj) @local
```

---

#### `backtrace_add_element`

```c3
fn void? backtrace_add_element(Allocator allocator, BacktraceList *list, String fun, String obj) @local
```

---

#### `symbolize_backtrace`

```c3
fn BacktraceList? symbolize_backtrace(Allocator allocator, void*[] backtrace)
```
### `std::os::posix @if(env::POSIX)`

---

#### `clock_gettime`

```c3
extern fn CInt clock_gettime(int type, TimeSpec *time)
```

---

#### `Mode_t`

```c3
alias Mode_t = uint
```

---

#### `DIRPtr`

```c3
typedef DIRPtr = void*
```

---

#### `Posix_dirent`

```c3
struct Posix_dirent
```

---

#### `rmdir`

```c3
extern fn int rmdir(ZString)
```

---

#### `sysconf`

```c3
extern fn CLong sysconf(CInt name)
```

---

#### `posix_memalign`

```c3
extern fn CInt posix_memalign(void **memptr, usz alignment, usz size)
```

---

#### `PROT_NONE`

```c3
const PROT_NONE     = 0x00
```

---

#### `PROT_READ`

```c3
const PROT_READ     = 0x01
```

---

#### `PROT_WRITE`

```c3
const PROT_WRITE    = 0x02
```

---

#### `PROT_EXEC`

```c3
const PROT_EXEC     = 0x04
```

---

#### `MAP_SHARED`

```c3
const MAP_SHARED    = 0x0001
```

---

#### `MAP_PRIVATE`

```c3
const MAP_PRIVATE   = 0x0002
```

---

#### `MAP_FILE`

```c3
const MAP_FILE       = 0x0000
```

---

#### `MAP_ANONYMOUS`

```c3
const MAP_ANONYMOUS  = 0x1000
```

---

#### `MAP_FAILED`

```c3
const void* MAP_FAILED = (void *)(uptr)-1
```

---

#### `MADV_NORMAL`

```c3
const MADV_NORMAL     = 0
```

---

#### `MADV_RANDOM`

```c3
const MADV_RANDOM     = 1
```

---

#### `MADV_SEQUENTIAL`

```c3
const MADV_SEQUENTIAL = 2
```

---

#### `MADV_WILLNEED`

```c3
const MADV_WILLNEED   = 3
```

---

#### `MADV_DONTNEED`

```c3
const MADV_DONTNEED   = 4
```

---

#### `mmap`

```c3
extern fn void* mmap(void*, usz, CInt, CInt, CInt, Off_t)
```

---

#### `Posix_spawn_file_actions_t`

```c3
struct Posix_spawn_file_actions_t
```

---

#### `Posix_spawnattr_t`

```c3
struct Posix_spawnattr_t
```

---

#### `posix_spawn_file_actions_init`

```c3
extern fn CInt posix_spawn_file_actions_init(Posix_spawn_file_actions_t *file_actions)
```

---

#### `PTHREAD_MUTEX_NORMAL`

```c3
const PTHREAD_MUTEX_NORMAL = 0
```

---

#### `PTHREAD_MUTEX_ERRORCHECK`

```c3
const PTHREAD_MUTEX_ERRORCHECK = env::LINUX ? 2 : 1
```

---

#### `PTHREAD_MUTEX_RECURSIVE`

```c3
const PTHREAD_MUTEX_RECURSIVE = env::LINUX ? 1 : 2
```

---

#### `PosixThreadFn`

```c3
alias PosixThreadFn = fn void*(void*)
```

---

#### `Pthread_t`

```c3
typedef Pthread_t = void*
```

---

#### `pthread_create`

```c3
extern fn CInt pthread_create(Pthread_t*, Pthread_attr_t*, PosixThreadFn, void*)
```
### `std::os::process @if(env::WIN32 || env::POSIX)`

---

#### `FAILED_TO_CREATE_PIPE, FAILED_TO_OPEN_STDIN, FAILED_TO_OPEN_STDOUT, FAILED_TO_OPEN_STDERR, FAILED_TO_START_PROCESS, FAILED_TO_INITIALIZE_ACTIONS, PROCESS_JOIN_FAILED, PROCESS_TERMINATION_FAILED, READ_FAILED`

```c3
faultdef
	FAILED_TO_CREATE_PIPE,
	FAILED_TO_OPEN_STDIN,
	FAILED_TO_OPEN_STDOUT,
	FAILED_TO_OPEN_STDERR,
	FAILED_TO_START_PROCESS,
	FAILED_TO_INITIALIZE_ACTIONS,
	PROCESS_JOIN_FAILED,
	PROCESS_TERMINATION_FAILED,
	READ_FAILED
```

---

#### `SubProcess`

```c3
struct SubProcess
```

---

#### `SubProcessOptions`

```c3
bitstruct SubProcessOptions : int
```

---

#### `create_named_pipe_helper`

```c3
fn void? create_named_pipe_helper(void** rd, void **wr) @local @if(env::WIN32)
```

---

#### `convert_command_line_win32`

```c3
fn WString convert_command_line_win32(String[] command_line) @inline @if(env::WIN32) @local
```

---

#### `create`

```c3
<*
 @require !environment || !options.inherit_environment
*>
fn SubProcess? create(String[] command_line, SubProcessOptions options = {}, String[] environment = {}) @if(env::WIN32)
```
```c3
<*
 @require !environment || !options.inherit_environment
*>
fn SubProcess? create(String[] command_line, SubProcessOptions options = {}, String[] environment = {}) @if(env::POSIX)
```

---

#### `copy_command_line`

```c3
<*
 @require command_line.len > 0
*>
fn ZString* copy_command_line(Allocator mem, String[] command_line) @local @inline @if(env::POSIX)
```

---

#### `@if(env::POSIX)`

```c3
const ZString[1] EMPTY_ENVIRONMENT @if(env::POSIX) = { null }
```

---

#### `copy_env`

```c3
fn ZString* copy_env(Allocator mem, String[] environment) @local @inline @if(env::POSIX)
```

---

#### `execute_stdout_to_buffer`

```c3
fn String? execute_stdout_to_buffer(char[] buffer, String[] command_line, SubProcessOptions options = {}, String[] environment = {})
```

---

#### `SubProcess.join`

```c3
fn CInt? SubProcess.join(&self) @if(env::POSIX)
```
```c3
fn CInt? SubProcess.join(&self) @if(env::WIN32)
```

---

#### `SubProcess.stdout`

```c3
fn File SubProcess.stdout(&self)
```

---

#### `SubProcess.stderr`

```c3
fn File SubProcess.stderr(&self)
```

---

#### `SubProcess.destroy`

```c3
fn bool SubProcess.destroy(&self)
```

---

#### `SubProcess.terminate`

```c3
fn void? SubProcess.terminate(&self)
```

---

#### `read_from_file_win32`

```c3
<*
 @require size <= Win32_DWORD.max
*>
fn usz? read_from_file_win32(CFile file, Win32_HANDLE event_handle, char* buffer, usz size) @if(env::WIN32) @local
```

---

#### `read_from_file_posix`

```c3
fn usz? read_from_file_posix(CFile file, char* buffer, usz size) @if(env::POSIX) @local
```

---

#### `SubProcess.read_stdout`

```c3
fn usz? SubProcess.read_stdout(&self, char* buffer, usz size)
```

---

#### `SubProcess.read_stderr`

```c3
fn usz? SubProcess.read_stderr(&self, char* buffer, usz size)
```

---

#### `SubProcess.is_running`

```c3
fn bool? SubProcess.is_running(&self)
```
### `std::os::win32`

---

#### `Win`

```c3
alias Win32_BOOL = int
```
```c3
alias Win32_BOOLEAN = Win32_BYTE
```
```c3
alias Win32_BYTE = char
```
```c3
alias Win32_CCHAR = cinterop::CChar
```
```c3
alias Win32_CHAR = cinterop::CChar
```
```c3
alias Win32_COLORREF = Win32_DWORD
```
```c3
alias Win32_DWORD = uint
```
```c3
alias Win32_DWORDLONG = ulong
```
```c3
alias Win32_DWORD_PTR = Win32_ULONG_PTR
```
```c3
alias Win32_DWORD32 = uint
```
```c3
alias Win32_DWORD64 = ulong
```
```c3
alias Win32_FLOAT = float
```
```c3
alias Win32_HACCEL = Win32_HANDLE
```
```c3
alias Win32_HALF_PTR = int
```
```c3
alias Win32_HANDLE = Win32_PVOID
```
```c3
alias Win32_HBITMAP = Win32_HANDLE
```
```c3
alias Win32_HBRUSH = Win32_HANDLE
```
```c3
alias Win32_HCOLORSPACE = Win32_HANDLE
```
```c3
alias Win32_HCONV = Win32_HANDLE
```
```c3
alias Win32_HCONVLIST = Win32_HANDLE
```
```c3
alias Win32_HCURSOR = Win32_HICON
```
```c3
alias Win32_HDC = Win32_HANDLE
```
```c3
alias Win32_HDDEDATA = Win32_HANDLE
```
```c3
alias Win32_HDESK = Win32_HANDLE
```
```c3
alias Win32_HDROP = Win32_HANDLE
```
```c3
alias Win32_HDWP = Win32_HANDLE
```
```c3
alias Win32_HFILE = int
```
```c3
alias Win32_HFONT = Win32_HANDLE
```
```c3
alias Win32_HGDIOBJ = Win32_HANDLE
```
```c3
alias Win32_HGLOBAL = Win32_HANDLE
```
```c3
alias Win32_HHOOK = Win32_HANDLE
```
```c3
alias Win32_HICON = Win32_HANDLE
```
```c3
alias Win32_HINSTANCE = Win32_HANDLE
```
```c3
alias Win32_HKEY = Win32_HANDLE
```
```c3
alias Win32_HKL = Win32_HANDLE
```
```c3
alias Win32_HLOCAL = Win32_HANDLE
```
```c3
alias Win32_HMENU = Win32_HANDLE
```
```c3
alias Win32_HMETAFILE = Win32_HANDLE
```
```c3
alias Win32_HMODULE = Win32_HANDLE
```
```c3
alias Win32_HMONITOR = Win32_HANDLE
```
```c3
alias Win32_HPALETTE = Win32_HANDLE
```
```c3
alias Win32_HPEN = Win32_HANDLE
```
```c3
alias Win32_HRESULT = Win32_LONG
```
```c3
alias Win32_HRGN = Win32_HANDLE
```
```c3
alias Win32_HRSRC = Win32_HANDLE
```
```c3
alias Win32_HSZ = Win32_HANDLE
```
```c3
alias Win32_HWINSTA = Win32_HANDLE
```
```c3
alias Win32_HWND = Win32_HANDLE
```
```c3
alias Win32_INT = int
```
```c3
alias Win32_INT_PTR = iptr
```
```c3
alias Win32_INT8 = ichar
```
```c3
alias Win32_INT16 = short
```
```c3
alias Win32_INT32 = int
```
```c3
alias Win32_INT64 = long
```
```c3
alias Win32_LANGID = Win32_WORD
```
```c3
alias Win32_LCID = Win32_DWORD
```
```c3
alias Win32_LCTYPE = Win32_DWORD
```
```c3
alias Win32_LGRPID = Win32_DWORD
```
```c3
alias Win32_LONG = int
```
```c3
alias Win32_LONGLONG = long
```
```c3
alias Win32_LONG_PTR = iptr
```
```c3
alias Win32_LONG32 = int
```
```c3
alias Win32_LONG64 = long
```
```c3
alias Win32_LPARAM = Win32_LONG_PTR
```
```c3
alias Win32_LPBOOL = Win32_BOOL*
```
```c3
alias Win32_LPBYTE = Win32_BYTE*
```
```c3
alias Win32_LPCOLORREF = Win32_DWORD*
```
```c3
alias Win32_LPCSTR = Win32_CCHAR*
```
```c3
alias Win32_LPCTSTR = Win32_LPCWSTR
```
```c3
alias Win32_LPCVOID = void*
```
```c3
alias Win32_LPCWSTR = Win32_WCHAR*
```
```c3
alias Win32_LPDWORD = Win32_DWORD*
```
```c3
alias Win32_LPHANDLE = Win32_HANDLE*
```
```c3
alias Win32_LPINT = int*
```
```c3
alias Win32_LPLONG = int*
```
```c3
alias Win32_LPSTR = Win32_CCHAR*
```
```c3
alias Win32_LPTSTR = Win32_LPWSTR
```
```c3
alias Win32_LPVOID = void*
```
```c3
alias Win32_LPWORD = Win32_WORD*
```
```c3
alias Win32_LPWSTR = Win32_WCHAR*
```
```c3
alias Win32_LRESULT = Win32_LONG_PTR
```
```c3
alias Win32_NTSTATUS = Win32_LONG
```
```c3
alias Win32_PBOOL = Win32_BOOL*
```
```c3
alias Win32_PBOOLEAN = Win32_BOOLEAN*
```
```c3
alias Win32_PBYTE = Win32_BYTE*
```
```c3
alias Win32_PCHAR = Win32_CHAR*
```
```c3
alias Win32_PCSTR = Win32_CHAR*
```
```c3
alias Win32_PCTSTR = Win32_LPCWSTR
```
```c3
alias Win32_PCUNICODE_STRING = Win32_UNICODE_STRING*
```
```c3
alias Win32_PCWSTR = WString
```
```c3
alias Win32_PDWORD = Win32_DWORD*
```
```c3
alias Win32_PDWORDLONG = Win32_DWORDLONG*
```
```c3
alias Win32_PDWORDPTR = Win32_DWORD_PTR*
```
```c3
alias Win32_PDWORD32 = Win32_DWORD32*
```
```c3
alias Win32_PDWORD64 = Win32_DWORD64*
```
```c3
alias Win32_PFLOAT = Win32_FLOAT*
```
```c3
alias Win32_PHALFPTR = Win32_HALF_PTR*
```
```c3
alias Win32_PHANDLE = Win32_HANDLE*
```
```c3
alias Win32_PHKEY = Win32_HKEY*
```
```c3
alias Win32_PINT = int*
```
```c3
alias Win32_PINTPTR = Win32_INT_PTR*
```
```c3
alias Win32_PINT8 = Win32_INT8*
```
```c3
alias Win32_PINT16 = Win32_INT16*
```
```c3
alias Win32_PINT32 = Win32_INT32*
```
```c3
alias Win32_PINT64 = Win32_INT64*
```
```c3
alias Win32_PLCID = Win32_PDWORD
```
```c3
alias Win32_PLONG = Win32_LONG*
```
```c3
alias Win32_PLONGLONG = Win32_LONGLONG*
```
```c3
alias Win32_PLONG_PTR = Win32_LONG_PTR*
```
```c3
alias Win32_PLONG32 = Win32_LONG32*
```
```c3
alias Win32_PLONG64 = Win32_LONG64*
```
```c3
alias Win32_POINTER_32 = uint
```
```c3
alias Win32_POINTER_64 = uptr
```
```c3
alias Win32_POINTER_SIGNED = iptr
```
```c3
alias Win32_POINTER_UNSIGNED = uptr
```
```c3
alias Win32_PSHORT = Win32_SHORT*
```
```c3
alias Win32_PSIZE_T = usz*
```
```c3
alias Win32_PSSIZE_T = isz*
```
```c3
alias Win32_PSTR = Win32_CHAR*
```
```c3
alias Win32_PTBYTE = Win32_TBYTE*
```
```c3
alias Win32_PTCHAR = Win32_TCHAR*
```
```c3
alias Win32_PTSTR = Win32_LPWSTR
```
```c3
alias Win32_PUCHAR = Win32_UCHAR*
```
```c3
alias Win32_PUHALFPTR = Win32_UHALF_PTR*
```
```c3
alias Win32_PUINT = Win32_UINT*
```
```c3
alias Win32_PUINTPTR = Win32_UINT_PTR*
```
```c3
alias Win32_PUINT8 = Win32_UINT8*
```
```c3
alias Win32_PUINT16 = Win32_UINT16*
```
```c3
alias Win32_PUINT32 = Win32_UINT32*
```
```c3
alias Win32_PUINT64 = Win32_UINT64*
```
```c3
alias Win32_PULONG = Win32_ULONG*
```
```c3
alias Win32_PULONGLONG = Win32_ULONGLONG*
```
```c3
alias Win32_PULONG_PTR = Win32_ULONG_PTR*
```
```c3
alias Win32_PULONG32 = Win32_ULONG32*
```
```c3
alias Win32_PULONG64 = Win32_ULONG64*
```
```c3
alias Win32_PUNICODE_STRING = Win32_UNICODE_STRING*
```
```c3
alias Win32_PUSHORT = Win32_USHORT*
```
```c3
alias Win32_PVOID = void*
```
```c3
alias Win32_PWCHAR = Win32_WCHAR*
```
```c3
alias Win32_PWORD = Win32_WORD*
```
```c3
alias Win32_PWSTR = Win32_WCHAR*
```
```c3
alias Win32_QWORD = ulong
```
```c3
alias Win32_SC_HANDLE = Win32_HANDLE
```
```c3
alias Win32_SC_LOCK = Win32_LPVOID
```
```c3
alias Win32_SERVICE_STATUS_HANDLE = Win32_HANDLE
```
```c3
alias Win32_SHORT = short
```
```c3
alias Win32_SIZE_T = usz
```
```c3
alias Win32_SOCKET = Win32_HANDLE
```
```c3
alias Win32_SSIZE_T = isz
```
```c3
alias Win32_TBYTE = Win32_WCHAR
```
```c3
alias Win32_TCHAR = Win32_WCHAR
```
```c3
alias Win32_UCHAR = char
```
```c3
alias Win32_UHALF_PTR = uint
```
```c3
alias Win32_UINT = uint
```
```c3
alias Win32_UINT_PTR = uptr
```
```c3
alias Win32_UINT8 = char
```
```c3
alias Win32_UINT16 = ushort
```
```c3
alias Win32_UINT32 = uint
```
```c3
alias Win32_UINT64 = ulong
```
```c3
alias Win32_ULONG = uint
```
```c3
alias Win32_ULONGLONG = ulong
```
```c3
alias Win32_ULONG_PTR = ulong
```
```c3
alias Win32_ULONG32 = uint
```
```c3
alias Win32_ULONG64 = ulong
```
```c3
alias Win32_USHORT = ushort
```
```c3
alias Win32_USN = Win32_LONGLONG
```
```c3
alias Win32_WCHAR = Char16
```
```c3
alias Win32_WORD = ushort
```
```c3
alias Win32_WPARAM = Win32_UINT_PTR
```
```c3
struct Win32_UNICODE_STRING
```
```c3
typedef Win32_CRITICAL_SECTION = ulong[5]
```
```c3
typedef Win32_CONDITION_VARIABLE = void*
```
```c3
typedef Win32_SRWLOCK = void*
```
```c3
typedef Win32_INIT_ONCE = void*
```
```c3
struct Win32_SECURITY_ATTRIBUTES
```
```c3
alias Win32_LPSECURITY_ATTRIBUTES = Win32_SECURITY_ATTRIBUTES*
```
```c3
alias Win32_PSECURITY_ATTRIBUTES = Win32_SECURITY_ATTRIBUTES*
```
```c3
struct Win32_STARTUPINFOW
```
```c3
struct Win32_OVERLAPPED
```
```c3
alias Win32_LPOVERLAPPED = Win32_OVERLAPPED*
```
```c3
alias Win32_LPSTARTUPINFOW = Win32_STARTUPINFOW*
```
```c3
struct Win32_STARTUPINFOEXW
```
```c3
alias Win32_LPPROC_THREAD_ATTRIBUTE_LIST = void*
```
```c3
alias Win32_LPSTARTUPINFOEXW = Win32_STARTUPINFOEXW*
```
```c3
struct Win32_FILETIME
```
```c3
struct Win32_PROCESS_INFORMATION
```
```c3
alias Win32_PPROCESS_INFORMATION = Win32_PROCESS_INFORMATION*
```
```c3
alias Win32_LPPROCESS_INFORMATION = Win32_PROCESS_INFORMATION*
```
```c3
struct Win32_SYSTEM_INFO
```
```c3
alias Win32_LPSYSTEM_INFO = Win32_SYSTEM_INFO*
```
```c3
struct Win32_MODULEINFO
```
```c3
struct Win32_IMAGEHLP_LINE64
```
```c3
enum Win32_SYM_TYPE
```
```c3
struct Win32_GUID
```
```c3
struct Win32_IMAGEHLP_MODULE64
```
```c3
alias Win32_PIMAGEHLP_MODULE64 = Win32_IMAGEHLP_MODULE64*
```
```c3
struct Win32_ARM64_NT_CONTEXT @align(16)
```
```c3
struct Win32_ARM64_NT_NEON128
```
```c3
struct Win32_XMM_SAVE_AREA32
```
```c3
struct Win32_AMD64_CONTEXT @align(16)
```
```c3
alias Win32_CONTEXT = Win32_AMD64_CONTEXT
```
```c3
alias Win32_PCONTEXT = Win32_CONTEXT*
```
```c3
struct Win32_M128A @align(16)
```
```c3
struct Win32_IMAGE_DATA_DIRECTORY
```
```c3
struct Win32_IMAGE_OPTIONAL_HEADER64
```
```c3
alias Win32_PIMAGE_OPTIONAL_HEADER64 = Win32_IMAGE_OPTIONAL_HEADER64*
```
```c3
struct Win32_IMAGE_FILE_HEADER
```
```c3
alias Win32_PIMAGE_FILE_HEADER = Win32_IMAGE_FILE_HEADER*
```
```c3
struct Win32_IMAGE_NT_HEADERS
```
```c3
alias Win32_PIMAGE_NT_HEADERS = Win32_IMAGE_NT_HEADERS*
```
```c3
struct Win32_SYMBOL_INFO
```
```c3
alias Win32_PSYMBOL_INFO = Win32_SYMBOL_INFO*
```
```c3
struct Win32_MODLOAD_DATA
```
```c3
enum Win32_ADDRESS_MODE
```
```c3
struct Win32_ADDRESS64
```
```c3
struct Win32_KDHELP64
```
```c3
struct Win32_STACKFRAME64
```
```c3
alias Win32_PREAD_PROCESS_MEMORY_ROUTINE64 = fn Win32_BOOL(Win32_HANDLE hProcess, Win32_DWORD64 qwBaseAddress, Win32_PVOID lpBuffer, Win32_DWORD nSize, Win32_LPDWORD lpNumberOfBytesRead)
```
```c3
alias Win32_PFUNCTION_TABLE_ACCESS_ROUTINE64 = fn Win32_PVOID(Win32_HANDLE ahProcess, Win32_DWORD64 addrBase)
```
```c3
alias Win32_PGET_MODULE_BASE_ROUTINE64 = fn Win32_DWORD64(Win32_HANDLE hProcess, Win32_DWORD64 address)
```
```c3
alias Win32_PTRANSLATE_ADDRESS_ROUTINE64 = fn Win32_DWORD64(Win32_HANDLE hProcess, Win32_HANDLE hThread, Win32_LPADDRESS64 lpaddr)
```
```c3
alias Win32_PKDHELP64 = Win32_KDHELP64*
```
```c3
alias Win32_LPADDRESS64 = Win32_ADDRESS64*
```
```c3
alias Win32_LPSTACKFRAME64 = Win32_STACKFRAME64*
```
```c3
alias Win32_PMODLOAD_DATA = Win32_MODLOAD_DATA*
```
```c3
alias Win32_PIMAGEHLP_LINE64 = Win32_IMAGEHLP_LINE64*
```
```c3
alias Win32_LPMODULEINFO = Win32_MODULEINFO*
```

---

#### `INVALID_HANDLE_VALUE`

```c3
const INVALID_HANDLE_VALUE = (Win32_HANDLE)(uptr)-1
```

---

#### `ARM64_MAX_BREAKPOINTS`

```c3
const ARM64_MAX_BREAKPOINTS = 8
```

---

#### `ARM64_MAX_WATCHPOINTS`

```c3
const ARM64_MAX_WATCHPOINTS = 2
```

---

#### `CONTEXT_AMD64`

```c3
const CONTEXT_AMD64 = 0x00100000
```

---

#### `CONTEXT_AMD64_CONTROL`

```c3
const CONTEXT_AMD64_CONTROL = CONTEXT_AMD64 | 0x0001
```

---

#### `CONTEXT_AMD64_INTEGER`

```c3
const CONTEXT_AMD64_INTEGER = CONTEXT_AMD64 | 0x0002
```

---

#### `CONTEXT_AMD64_SEGMENTS`

```c3
const CONTEXT_AMD64_SEGMENTS = CONTEXT_AMD64 | 0x0004
```

---

#### `CONTEXT_AMD64_FLOATING_POINT`

```c3
const CONTEXT_AMD64_FLOATING_POINT = CONTEXT_AMD64 | 0x0008
```

---

#### `CONTEXT_AMD64_DEBUG_REGISTERS`

```c3
const CONTEXT_AMD64_DEBUG_REGISTERS = CONTEXT_AMD64 | 0x0010
```

---

#### `CONTEXT_AMD64_FULL`

```c3
const CONTEXT_AMD64_FULL = CONTEXT_AMD64_CONTROL | CONTEXT_AMD64_INTEGER | CONTEXT_AMD64_FLOATING_POINT
```

---

#### `CONTEXT_AMD64_ALL`

```c3
const CONTEXT_AMD64_ALL = CONTEXT_AMD64_CONTROL | CONTEXT_AMD64_INTEGER | CONTEXT_AMD64_SEGMENTS | CONTEXT_AMD64_FLOATING_POINT | CONTEXT_AMD64_DEBUG_REGISTERS
```

---

#### `CONTEXT_CONTROL`

```c3
alias CONTEXT_CONTROL = CONTEXT_AMD64_CONTROL
```

---

#### `CONTEXT_FULL`

```c3
alias CONTEXT_FULL = CONTEXT_AMD64_FULL
```

---

#### `CONTEXT_ALL`

```c3
alias CONTEXT_ALL = CONTEXT_AMD64_ALL
```
### `std::os::win32 @if(env::WIN32)`

---

#### `getSystemTimeAsFileTime`

```c3
extern fn void getSystemTimeAsFileTime(Win32_FILETIME* time) @extern("GetSystemTimeAsFileTime")
```

---

#### `Win`

```c3
enum Win32_GET_FILEEX_INFO_LEVELS
```
```c3
struct Win32_FILE_ATTRIBUTE_DATA
```
```c3
struct Win32_WIN32_FIND_DATAW
```
```c3
alias Win32_LPWIN32_FIND_DATAW = Win32_WIN32_FIND_DATAW*
```
```c3
enum Win32_AllocationType : const Win32_DWORD
```
```c3
enum Win32_Protect : const Win32_DWORD
```
```c3
enum Win32_FreeType : const Win32_DWORD
```
```c3
alias Win32_INIT_ONCE_FN = fn Win32_BOOL(Win32_INIT_ONCE* initOnce, void* parameter, void** context)
```
```c3
struct Win32_KEY_EVENT_RECORD
```
```c3
struct Win32_COORD
```
```c3
struct Win32_MOUSE_EVENT_RECORD
```
```c3
struct Win32_WINDOW_BUFFER_SIZE_RECORD
```
```c3
struct Win32_MENU_EVENT_RECORD
```
```c3
struct Win32_FOCUS_EVENT_RECORD
```
```c3
struct Win32_INPUT_RECORD
```
```c3
alias Win32_PCOORD = Win32_COORD*
```
```c3
struct Win32_RECT
```
```c3
struct Win32_POINT
```
```c3
struct Win32_SIZE
```
```c3
struct Win32_WSABUF
```
```c3
struct Win32_SOCKADDR
```
```c3
alias Win32_PSIZE = Win32_SIZE*
```
```c3
alias Win32_NPSIZE = Win32_SIZE*
```
```c3
alias Win32_LPSIZE = Win32_SIZE*
```
```c3
alias Win32_PPOINT = Win32_POINT*
```
```c3
alias Win32_NPOINT = Win32_POINT*
```
```c3
alias Win32_LPOINT = Win32_POINT*
```
```c3
alias Win32_PRECT = Win32_RECT*
```
```c3
alias Win32_NPRECT = Win32_RECT*
```
```c3
alias Win32_LPRECT = Win32_RECT*
```
```c3
alias Win32_PWSABUF = Win32_WSABUF*
```
```c3
alias Win32_LPWSABUF = Win32_WSABUF*
```
```c3
alias Win32_PSOCKADDR = Win32_SOCKADDR*
```
```c3
alias Win32_LPSOCKADDR = Win32_SOCKADDR*
```
```c3
enum Win32_MEM_EXTENDED_PARAMETER_TYPE : CInt
```
```c3
alias Win32_PMEM_EXTENDED_PARAMETER_TYPE = Win32_MEM_EXTENDED_PARAMETER_TYPE
```
```c3
enum Win32_MEM_EXTENDED_PARAMETER_ATTRIBUTE : const Win32_DWORD64
```
```c3
struct Win32_MEM_EXTENDED_PARAMETER
```
```c3
alias Win32_PMEM_EXTENDED_PARAMETER = Win32_MEM_EXTENDED_PARAMETER*
```
```c3
alias Win32_WNDPROC = fn Win32_LRESULT(Win32_HWND, Win32_UINT, Win32_WPARAM, Win32_LPARAM)
```
```c3
struct Win32_WNDCLASSEXW
```
```c3
struct Win32_MSG
```
```c3
struct Win32_PAINTSTRUCT
```
```c3
alias Win32_PWNDCLASSEXW = Win32_WNDCLASSEXW*
```
```c3
alias Win32_LPWNDCLASSEXW = Win32_WNDCLASSEXW*
```
```c3
alias Win32_NPWNDCLASSEXW = Win32_WNDCLASSEXW*
```
```c3
alias Win32_PPAINTSTRUCT = Win32_PAINTSTRUCT*
```
```c3
alias Win32_LPPAINTSTRUCT = Win32_PAINTSTRUCT*
```
```c3
alias Win32_NPPAINTSTRUCT = Win32_PAINTSTRUCT*
```
```c3
alias Win32_PMSG = Win32_MSG*
```
```c3
alias Win32_LPMSG = Win32_MSG*
```
```c3
alias Win32_NPMSG = Win32_MSG*
```
```c3
alias Win32_ATOM = ushort
```
```c3
struct Win32_addrinfo
```
```c3
alias Win32_ADDRINFO = Win32_addrinfo
```
```c3
alias Win32_ADDRINFOA = Win32_ADDRINFO
```
```c3
alias Win32_PADDRINFOA = Win32_ADDRINFO*
```
```c3
struct Win32_addrinfoW
```
```c3
alias Win32_ADDRINFOW = Win32_addrinfoW
```
```c3
alias Win32_PADDRINFOW = Win32_addrinfoW*
```
```c3
struct Win32_pollfd
```
```c3
alias Win32_WSAPOLLFD = Win32_pollfd
```
```c3
alias Win32_PWSAPOLLFD = Win32_WSAPOLLFD*
```
```c3
alias Win32_LPWSAPOLLFD = Win32_WSAPOLLFD*
```
```c3
struct Win32_InAddr
```
```c3
struct Win32_SOCKADDR_IN
```
```c3
struct Win32_SOCKADDR_STORAGE
```
```c3
alias Win32_WSAOVERLAPPED = Win32_OVERLAPPED
```
```c3
alias Win32_LPWSAOVERLAPPED = Win32_WSAOVERLAPPED*
```
```c3
alias Win32_LPWSAOVERLAPPED_COMPLETION_ROUTINE = fn void (
	Win32_DWORD dwError,
	Win32_DWORD cbTransferred,
	Win32_LPWSAOVERLAPPED
	lpOverlapped,
	Win32_DWORD dwFlags
)
```
```c3
alias Win32_LPFN_WSARECV = fn CInt(
	Win32_SOCKET socket,
	Win32_LPWSABUF buffers,
	Win32_DWORD buffer_count,
	Win32_LPDWORD bytes,
	Win32_LPDWORD flags,
	Win32_LPWSAOVERLAPPED overlapped,
	Win32_LPWSAOVERLAPPED_COMPLETION_ROUTINE completion_routine
)
```
```c3
alias Win32_LPFN_WSARECVFROM = fn CInt(
	Win32_SOCKET socket,
	Win32_LPWSABUF buffers,
	Win32_DWORD buffer_count,
	Win32_LPDWORD bytes,
	Win32_LPDWORD flags,
	Win32_SOCKADDR* addr,
	Win32_LPINT addr_len,
	Win32_LPWSAOVERLAPPED overlapped,
	Win32_LPWSAOVERLAPPED_COMPLETION_ROUTINE completion_routine
)
```
```c3
alias Win32_LPFn_CONNECTEX = fn bool(
	Win32_SOCKET,
	Win32_SOCKADDR*,
	Win32_INT,
	Win32_PVOID,
	Win32_DWORD,
	Win32_LPDWORD,
	void*
)
```
```c3
alias Win32_LPFn_ACCEPTEX = fn bool(
	Win32_SOCKET,
	Win32_SOCKET,
	Win32_PVOID,
	Win32_DWORD,
	Win32_DWORD,
	Win32_DWORD,
	Win32_LPDWORD,
	void*
)
```

---

#### `MAX_PATH`

```c3
const MAX_PATH = 260
```

---

#### `closeHandle`

```c3
extern fn Win32_BOOL closeHandle(Win32_HANDLE) @extern("CloseHandle")
```

---

#### `createSolidBrush`

```c3
extern fn Win32_HBRUSH createSolidBrush(Win32_COLORREF) @extern("CreateSolidBrush")
```

---

#### `getLastError`

```c3
extern fn Win32_DWORD getLastError() @extern("GetLastError")
```

---

#### `_aligned_malloc`

```c3
extern fn void* _aligned_malloc(usz size, usz alignment)
```

---

#### `virtualAlloc`

```c3
extern fn Win32_LPVOID virtualAlloc(Win32_LPVOID lpAddres, Win32_SIZE_T dwSize, Win32_AllocationType flAllocationType, Win32_Protect flProtect) @extern("VirtualAlloc")
```

---

#### `STARTF_USESTDHANDLES`

```c3
const Win32_DWORD STARTF_USESTDHANDLES = 0x00000100
```

---

#### `CREATE_NO_WINDOW`

```c3
const Win32_DWORD CREATE_NO_WINDOW = 0x08000000
```

---

#### `CREATE_PROTECTED_PROCESS`

```c3
const Win32_DWORD CREATE_PROTECTED_PROCESS = 0x00040000
```

---

#### `CREATE_UNICODE_ENVIRONMENT`

```c3
const Win32_DWORD CREATE_UNICODE_ENVIRONMENT = 0x00000400
```

---

#### `WAIT_OBJECT_0`

```c3
const uint WAIT_OBJECT_0 = 0
```

---

#### `WAIT_ABANDONED`

```c3
const uint WAIT_ABANDONED = 128
```

---

#### `WAIT_IO_COMPLETION`

```c3
const uint WAIT_IO_COMPLETION = 192
```

---

#### `WAIT_FAILED`

```c3
const uint WAIT_FAILED = (uint)-1
```

---

#### `HANDLE_FLAG_INHERIT`

```c3
const Win32_DWORD HANDLE_FLAG_INHERIT = 1
```

---

#### `HANDLE_FLAG_PROTECT_FROM_CLOSE`

```c3
const Win32_DWORD HANDLE_FLAG_PROTECT_FROM_CLOSE = 2
```

---

#### `INFINITE`

```c3
const uint INFINITE = (uint)-1
```

---

#### `PIPE_ACCESS_DUPLEX`

```c3
const Win32_DWORD PIPE_ACCESS_DUPLEX = 0x00000003
```

---

#### `PIPE_ACCESS_INBOUND`

```c3
const Win32_DWORD PIPE_ACCESS_INBOUND = 0x00000001
```

---

#### `PIPE_ACCESS_OUTBOUND`

```c3
const Win32_DWORD PIPE_ACCESS_OUTBOUND = 0x00000002
```

---

#### `FILE_FLAG_FIRST_PIPE_INSTANCE`

```c3
const Win32_DWORD FILE_FLAG_FIRST_PIPE_INSTANCE = 0x00080000
```

---

#### `FILE_FLAG_WRITE_THROUGH`

```c3
const Win32_DWORD FILE_FLAG_WRITE_THROUGH = 0x80000000
```

---

#### `FILE_FLAG_OVERLAPPED`

```c3
const Win32_DWORD FILE_FLAG_OVERLAPPED = 0x40000000
```

---

#### `WRITE_DAC`

```c3
const Win32_DWORD WRITE_DAC = 0x00040000
```

---

#### `WRITE_OWNER`

```c3
const Win32_DWORD WRITE_OWNER = 0x00080000
```

---

#### `ACCESS_SYSTEM_SECURITY`

```c3
const Win32_DWORD ACCESS_SYSTEM_SECURITY = 0x01000000
```

---

#### `PIPE_TYPE_BYTE`

```c3
const Win32_DWORD PIPE_TYPE_BYTE = 0
```

---

#### `PIPE_TYPE_MESSAGE`

```c3
const Win32_DWORD PIPE_TYPE_MESSAGE = 4
```

---

#### `PIPE_READMODE_BYTE`

```c3
const Win32_DWORD PIPE_READMODE_BYTE = 0
```

---

#### `PIPE_READMODE_MESSAGE`

```c3
const Win32_DWORD PIPE_READMODE_MESSAGE = 2
```

---

#### `PIPE_WAIT`

```c3
const Win32_DWORD PIPE_WAIT = 0
```

---

#### `PIPE_NOWAIT`

```c3
const Win32_DWORD PIPE_NOWAIT = 1
```

---

#### `PIPE_ACCEPT_REMOTE_CLIENTS`

```c3
const Win32_DWORD PIPE_ACCEPT_REMOTE_CLIENTS = 0
```

---

#### `PIPE_REJECT_REMOTE_CLIENTS`

```c3
const Win32_DWORD PIPE_REJECT_REMOTE_CLIENTS = 8
```

---

#### `SYMOPT_CASE_INSENSITIVE`

```c3
const SYMOPT_CASE_INSENSITIVE = 0x01
```

---

#### `SYMOPT_UNDNAME`

```c3
const SYMOPT_UNDNAME = 0x02
```

---

#### `SYMOPT_DEFERRED_LOADS`

```c3
const SYMOPT_DEFERRED_LOADS = 0x04
```

---

#### `SYMOPT_NO_CPP`

```c3
const SYMOPT_NO_CPP = 0x08
```

---

#### `SYMOPT_LOAD_LINES`

```c3
const SYMOPT_LOAD_LINES = 0x10
```

---

#### `SYMOPT_OMAP_FIND_NEAREST`

```c3
const SYMOPT_OMAP_FIND_NEAREST = 0x20
```

---

#### `SYMOPT_LOAD_ANYTHING`

```c3
const SYMOPT_LOAD_ANYTHING = 0x40
```

---

#### `SYMOPT_IGNORE_CVREC`

```c3
const SYMOPT_IGNORE_CVREC = 0x80
```

---

#### `IMAGE_FILE_MACHINE_UNKNOWN`

```c3
const IMAGE_FILE_MACHINE_UNKNOWN = 0
```

---

#### `IMAGE_FILE_MACHINE_TARGET_HOST`

```c3
const IMAGE_FILE_MACHINE_TARGET_HOST = 1
```

---

#### `IMAGE_FILE_MACHINE_I386`

```c3
const IMAGE_FILE_MACHINE_I386 = 0x014c
```

---

#### `IMAGE_FILE_MACHINE_IA64`

```c3
const IMAGE_FILE_MACHINE_IA64 = 0x0200
```

---

#### `IMAGE_FILE_MACHINE_ARM64`

```c3
const IMAGE_FILE_MACHINE_ARM64 = 0xAA64
```

---

#### `IMAGE_FILE_MACHINE_AMD64`

```c3
const IMAGE_FILE_MACHINE_AMD64 = 0x8664
```

---

#### `UNDNAME_COMPLETE`

```c3
const UNDNAME_COMPLETE = 0x0000
```

---

#### `initializeCriticalSection`

```c3
extern fn void initializeCriticalSection(Win32_CRITICAL_SECTION* section) @extern("InitializeCriticalSection")
```

---

#### `Symbol`

```c3
struct Symbol
```

---

#### `symbolize_backtrace`

```c3
fn BacktraceList? symbolize_backtrace(Allocator allocator, void*[] backtrace)
```

---

#### `resolve_backtrace`

```c3
fn Backtrace? resolve_backtrace(Allocator allocator, void* addr, Win32_HANDLE process)
```

---

#### `WS_BORDER`

```c3
const Win32_DWORD WS_BORDER           = 0x00800000L
```

---

#### `WS_CAPTION`

```c3
const Win32_DWORD WS_CAPTION          = 0x00C00000L
```

---

#### `WS_CHILD`

```c3
const Win32_DWORD WS_CHILD            = 0x40000000L
```

---

#### `WS_CHILDWINDOW`

```c3
const Win32_DWORD WS_CHILDWINDOW      = 0x40000000L
```

---

#### `WS_CLIPCHILDREN`

```c3
const Win32_DWORD WS_CLIPCHILDREN     = 0x02000000L
```

---

#### `WS_CLIPSIBLINGS`

```c3
const Win32_DWORD WS_CLIPSIBLINGS     = 0x04000000L
```

---

#### `WS_DISABLED`

```c3
const Win32_DWORD WS_DISABLED         = 0x08000000L
```

---

#### `WS_DLGFRAME`

```c3
const Win32_DWORD WS_DLGFRAME         = 0x00400000L
```

---

#### `WS_GROUP`

```c3
const Win32_DWORD WS_GROUP            = 0x00020000L
```

---

#### `WS_HSCROLL`

```c3
const Win32_DWORD WS_HSCROLL          = 0x00100000L
```

---

#### `WS_ICONIC`

```c3
const Win32_DWORD WS_ICONIC           = 0x20000000L
```

---

#### `WS_MAXIMIZE`

```c3
const Win32_DWORD WS_MAXIMIZE         = 0x01000000L
```

---

#### `WS_MAXIMIZEBOX`

```c3
const Win32_DWORD WS_MAXIMIZEBOX      = 0x00010000L
```

---

#### `WS_MINIMIZE`

```c3
const Win32_DWORD WS_MINIMIZE         = 0x20000000L
```

---

#### `WS_MINIMIZEBOX`

```c3
const Win32_DWORD WS_MINIMIZEBOX      = 0x00020000L
```

---

#### `WS_OVERLAPPED`

```c3
const Win32_DWORD WS_OVERLAPPED       = 0x00000000L
```

---

#### `WS_OVERLAPPEDWINDOW`

```c3
const Win32_DWORD WS_OVERLAPPEDWINDOW = WS_OVERLAPPED | WS_CAPTION | WS_SYSMENU | WS_THICKFRAME | WS_MINIMIZEBOX | WS_MAXIMIZEBOX
```

---

#### `WS_POPUP`

```c3
const Win32_DWORD WS_POPUP            = 0x80000000L
```

---

#### `WS_POPUPWINDOW`

```c3
const Win32_DWORD WS_POPUPWINDOW      = WS_POPUP | WS_BORDER | WS_SYSMENU
```

---

#### `WS_SIZEBOX`

```c3
const Win32_DWORD WS_SIZEBOX          = 0x00040000L
```

---

#### `WS_SYSMENU`

```c3
const Win32_DWORD WS_SYSMENU          = 0x00080000L
```

---

#### `WS_TABSTOP`

```c3
const Win32_DWORD WS_TABSTOP          = 0x00010000L
```

---

#### `WS_THICKFRAME`

```c3
const Win32_DWORD WS_THICKFRAME       = 0x00040000L
```

---

#### `WS_TILED`

```c3
const Win32_DWORD WS_TILED            = 0x00000000L
```

---

#### `WS_TILEDWINDOW`

```c3
const Win32_DWORD WS_TILEDWINDOW      = WS_OVERLAPPED | WS_CAPTION | WS_SYSMENU | WS_THICKFRAME | WS_MINIMIZEBOX | WS_MAXIMIZEBOX
```

---

#### `WS_VISIBLE`

```c3
const Win32_DWORD WS_VISIBLE          = 0x10000000L
```

---

#### `WS_VSCROLL`

```c3
const Win32_DWORD WS_VSCROLL          = 0x00200000L
```

---

#### `MB_OK`

```c3
const Win32_UINT MB_OK = 0x00000000
```

---

#### `MB_OKCANCEL`

```c3
const Win32_UINT MB_OKCANCEL = 0x00000001
```

---

#### `MB_ABORTRETRYIGNORE`

```c3
const Win32_UINT MB_ABORTRETRYIGNORE = 0x00000002
```

---

#### `MB_YESNOCANCEL`

```c3
const Win32_UINT MB_YESNOCANCEL = 0x00000003
```

---

#### `MB_YESNO`

```c3
const Win32_UINT MB_YESNO = 0x00000004
```

---

#### `MB_RETRYCANCEL`

```c3
const Win32_UINT MB_RETRYCANCEL = 0x00000005
```

---

#### `MB_CANCELTRYCONTINUE`

```c3
const Win32_UINT MB_CANCELTRYCONTINUE = 0x00000006
```

---

#### `MB_ICONHAND`

```c3
const Win32_UINT MB_ICONHAND = 0x00000010
```

---

#### `MB_ICONQUESTION`

```c3
const Win32_UINT MB_ICONQUESTION = 0x00000020
```

---

#### `MB_ICONEXCLAMATION`

```c3
const Win32_UINT MB_ICONEXCLAMATION = 0x00000030
```

---

#### `MB_ICONASTERISK`

```c3
const Win32_UINT MB_ICONASTERISK = 0x00000040
```

---

#### `MB_USERICON`

```c3
const Win32_UINT MB_USERICON = 0x00000080
```

---

#### `MB_ICONWARNING`

```c3
const Win32_UINT MB_ICONWARNING = MB_ICONEXCLAMATION
```

---

#### `MB_ICONERROR`

```c3
const Win32_UINT MB_ICONERROR = MB_ICONHAND
```

---

#### `MB_ICONINFORMATION`

```c3
const Win32_UINT MB_ICONINFORMATION = MB_ICONASTERISK
```

---

#### `MB_ICONSTOP`

```c3
const Win32_UINT MB_ICONSTOP = MB_ICONHAND
```

---

#### `@if(env::ARCH_32_BIT)`

```c3
const GWL_WNDPROC @if(env::ARCH_32_BIT) = -4
```
```c3
const GWL_HINSTANCE @if(env::ARCH_32_BIT) = -6
```
```c3
const GWL_HWNDPARENT @if(env::ARCH_32_BIT) = -8
```
```c3
const GWL_USERDATA @if(env::ARCH_32_BIT) = -21
```

---

#### `GWL_STYLE`

```c3
const GWL_STYLE = -16
```

---

#### `GWL_EXSTYLE`

```c3
const GWL_EXSTYLE = -20
```

---

#### `GWL_ID`

```c3
const GWL_ID = -12
```

---

#### `GWLP_WNDPROC`

```c3
const GWLP_WNDPROC = -4
```

---

#### `GWLP_HINSTANCE`

```c3
const GWLP_HINSTANCE = -6
```

---

#### `GWLP_HWNDPARENT`

```c3
const GWLP_HWNDPARENT = -8
```

---

#### `GWLP_USERDATA`

```c3
const GWLP_USERDATA = -21
```

---

#### `GWLP_ID`

```c3
const GWLP_ID = -12
```

---

#### `beginPaint`

```c3
extern fn Win32_HDC beginPaint(Win32_HWND, Win32_LPPAINTSTRUCT) @extern("BeginPaint")
```

---

#### `setWindowLongPtr`

```c3
macro setWindowLongPtr(Win32_HWND hWnd, CInt nIndex, dwNewLong)
```

---

#### `WSAError`

```c3
typedef WSAError = int
```

---

#### `_SS_PAD1SIZE`

```c3
const usz _SS_PAD1SIZE = 6
```

---

#### `_SS_PAD2SIZE`

```c3
const usz _SS_PAD2SIZE = 112
```

---

#### `POLLERR`

```c3
const Win32_SHORT POLLERR    = 0x0001
```

---

#### `POLLHUP`

```c3
const Win32_SHORT POLLHUP    = 0x0002
```

---

#### `POLLNVAL`

```c3
const Win32_SHORT POLLNVAL   = 0x0004
```

---

#### `POLLWRNORM`

```c3
const Win32_SHORT POLLWRNORM = 0x0010
```

---

#### `POLLWRBAND`

```c3
const Win32_SHORT POLLWRBAND = 0x0020
```

---

#### `POLLRDNORM`

```c3
const Win32_SHORT POLLRDNORM = 0x0100
```

---

#### `POLLRDBAND`

```c3
const Win32_SHORT POLLRDBAND = 0x0200
```

---

#### `POLLPRI`

```c3
const Win32_SHORT POLLPRI    = 0x0400
```

---

#### `POLLIN`

```c3
const Win32_SHORT POLLIN     = POLLRDNORM | POLLRDBAND
```

---

#### `POLLOUT`

```c3
const Win32_SHORT POLLOUT    = POLLWRNORM
```

---

#### `SD_RECEIVE`

```c3
const SD_RECEIVE = 0x00
```

---

#### `SD_SEND`

```c3
const SD_SEND    = 0x01
```

---

#### `SD_BOTH`

```c3
const SD_BOTH    = 0x02
```

---

#### `wsaPoll`

```c3
extern fn CInt wsaPoll(Win32_LPWSAPOLLFD fdArray, Win32_ULONG fds, Win32_INT timeout) @extern("WSAPoll")
```
### `std::sort`

---

#### `binarysearch`

```c3
<*
 @require @is_sortable(list) : "The list must be sortable"
 @require @is_valid_cmp_fn(cmp, list, context) : "Expected a comparison function which compares values"
 @require @is_valid_context(cmp, context) : "Expected a valid context"
*>
macro usz binarysearch(list, x, cmp = EMPTY_MACRO_SLOT, context = EMPTY_MACRO_SLOT) @builtin
```

Perform a binary search over the sorted array and return the index
in [0, array.len) where x would be inserted or cmp(i) is true and cmp(j) is true for j in [i, array.len).


---

#### `countingsort`

```c3
<*
 @require @is_sortable(list) : "The list must be indexable and support .len or .len()"
 @require @is_cmp_key_fn(key_fn, list) : "Expected a transformation function which returns an unsigned integer."
*>
macro countingsort(list, key_fn = EMPTY_MACRO_SLOT) @builtin
```

Sort list using the counting sort algorithm.


---

#### `insertionsort_indexed`

```c3
macro insertionsort_indexed(list, start, end, cmp = EMPTY_MACRO_SLOT, context = EMPTY_MACRO_SLOT) @builtin
```

---

#### `quicksort_indexed`

```c3
macro quicksort_indexed(list, start, end, cmp = EMPTY_MACRO_SLOT, context = EMPTY_MACRO_SLOT) @builtin
```

---

#### `insertionsort`

```c3
<*
 @require @is_sortable(list) : "The list must be indexable and support .len or .len()"
 @require @is_valid_cmp_fn(cmp, list, context) : "Expected a comparison function which compares values"
*>
macro insertionsort(list, cmp = EMPTY_MACRO_SLOT, context = EMPTY_MACRO_SLOT) @builtin @safemacro
```

Sort list using the quick sort algorithm.


---

#### `quicksort`

```c3
<*
 @require @is_sortable(list) : "The list must be indexable and support .len or .len()"
 @require @is_valid_cmp_fn(cmp, list, context) : "Expected a comparison function which compares values"
 @require @is_valid_context(cmp, context) : "Expected a valid context"
*>
macro quicksort(list, cmp = EMPTY_MACRO_SLOT, context = EMPTY_MACRO_SLOT) @builtin
```

Sort list using the quick sort algorithm.


---

#### `quickselect`

```c3
<*
 @require @is_sortable(list) : "The list must be indexable and support .len or .len()"
 @require @is_valid_cmp_fn(cmp, list, context) : "expected a comparison function which compares values"
 @require @is_valid_context(cmp, context) : "Expected a valid context"
*>
macro quickselect(list, isz k, cmp = EMPTY_MACRO_SLOT, context = EMPTY_MACRO_SLOT) @builtin
```

Select the (k+1)th smallest element in an unordered list using Hoare's
selection algorithm (Quickselect). k should be between 0 and len-1. The data
list will be partially sorted.


---

#### `len_from_list`

```c3
macro usz len_from_list(list)
```

---

#### `@is_sortable`

```c3
macro bool @is_sortable(#list)
```

---

#### `@is_valid_context`

```c3
macro bool @is_valid_context(#cmp, #context)
```

---

#### `@is_valid_cmp_fn`

```c3
macro bool @is_valid_cmp_fn(#cmp, #list, #context)
```

---

#### `@is_cmp_key_fn`

```c3
macro bool @is_cmp_key_fn(#key_fn, #list)
```

---

#### `is_sorted`

```c3
<*
 @require @is_sortable(list) : "The list must be indexable and support .len or .len()"
 @require @is_valid_cmp_fn(cmp, list, ctx) : "Expected a comparison function which compares values"
 @require @is_valid_context(cmp, ctx) : "Expected a valid context"
*>
macro bool is_sorted(list, cmp = EMPTY_MACRO_SLOT, ctx = EMPTY_MACRO_SLOT) @builtin
```

Returns true if list is sorted in either ascending or descending order.


---

#### `@sort_cmp`

```c3
macro int @sort_cmp(list, pos, cmp, ctx) @local
```
### `std::sort::cs{Type, KeyFn}`

---

#### `ElementType`

```c3
alias ElementType = $typeof((Type){}[0])
```

---

#### `KeyFnReturnType`

```c3
alias KeyFnReturnType @if(!NO_KEY_FN) = $typefrom(KeyFn.returns)
```
```c3
alias KeyFnReturnType @if(NO_KEY_FN) = ElementType
```

---

#### `CmpCallback`

```c3
alias CmpCallback @if(KEY_BY_VALUE && NO_KEY_FN) = fn int(ElementType, ElementType)
```
```c3
alias CmpCallback @if(!KEY_BY_VALUE && NO_KEY_FN) = fn int(ElementType*, ElementType*)
```
```c3
alias CmpCallback @if(KEY_BY_VALUE && !NO_KEY_FN) = fn int(ElementType, ElementType, KeyFn)
```
```c3
alias CmpCallback @if(!KEY_BY_VALUE && !NO_KEY_FN) = fn int(ElementType*, ElementType*, KeyFn)
```

---

#### `csort`

```c3
fn void csort(Type list, usz low, usz high, KeyFn key_fn, uint byte_idx)
```
### `std::sort::is{Type, CmpFn, Context}`

---

#### `ElementType`

```c3
alias ElementType = $typeof(((Type){})[0])
```

---

#### `isort`

```c3
fn void isort(Type list, usz low, usz high, CmpFn comp, Context context)
```
### `std::sort::qs{Type, CmpFn, Context}`

---

#### `ElementType`

```c3
alias ElementType = $typeof(((Type){})[0])
```

---

#### `qsort`

```c3
fn void qsort(Type list, isz low, isz high, CmpFn cmp, Context context)
```

---

#### `qselect`

```c3
<*
 @require low <= k : "kth smalles element is smaller than lower bounds"
 @require k <= high : "kth smalles element is larger than upper bounds"
*>
fn ElementType? qselect(Type list, isz low, isz high, isz k, CmpFn cmp, Context context)
```

---

#### `@partition`

```c3
macro @partition(Type list, isz l, isz h, CmpFn cmp, Context context)
```
### `std::thread`

---

#### `THREAD_QUEUE_FULL`

```c3
faultdef THREAD_QUEUE_FULL
```

---

#### `MutexType`

```c3
bitstruct MutexType : int
```

---

#### `Mutex`

```c3
typedef Mutex = NativeMutex
```

---

#### `RecursiveMutex`

```c3
typedef RecursiveMutex = inline Mutex
```

---

#### `TimedMutex`

```c3
typedef TimedMutex = NativeTimedMutex
```

---

#### `TimedRecursiveMutex`

```c3
typedef TimedRecursiveMutex = inline TimedMutex
```

---

#### `ConditionVariable`

```c3
typedef ConditionVariable = NativeConditionVariable
```

---

#### `Thread`

```c3
typedef Thread = inline NativeThread
```

---

#### `OnceFlag`

```c3
typedef OnceFlag = NativeOnceFlag
```

---

#### `OnceFn`

```c3
alias OnceFn = fn void()
```

---

#### `ThreadFn`

```c3
alias ThreadFn = fn int(void* arg)
```

---

#### `INIT_FAILED, DESTROY_FAILED, LOCK_FAILED, LOCK_TIMEOUT, UNLOCK_FAILED, SIGNAL_FAILED, WAIT_FAILED, WAIT_TIMEOUT, DETACH_FAILED, JOIN_FAILED, INTERRUPTED, CHANNEL_CLOSED`

```c3
faultdef
	INIT_FAILED,
	DESTROY_FAILED,
	LOCK_FAILED,
	LOCK_TIMEOUT,
	UNLOCK_FAILED,
	SIGNAL_FAILED,
	WAIT_FAILED,
	WAIT_TIMEOUT,
	DETACH_FAILED,
	JOIN_FAILED,
	INTERRUPTED,
	CHANNEL_CLOSED
```

---

#### `Mutex.init`

```c3
macro void? Mutex.init(&mutex)
```

---

#### `Mutex.is_initialized`

```c3
macro bool Mutex.is_initialized(mutex)
```

---

#### `RecursiveMutex.init`

```c3
macro void? RecursiveMutex.init(&mutex)
```

---

#### `Mutex.destroy`

```c3
macro void? Mutex.destroy(&mutex)
```

---

#### `Mutex.lock`

```c3
macro void? Mutex.lock(&mutex)
```

---

#### `Mutex.try_lock`

```c3
macro bool  Mutex.try_lock(&mutex)
```

---

#### `Mutex.unlock`

```c3
macro void? Mutex.unlock(&mutex)
```

---

#### `TimedMutex.init`

```c3
macro void? TimedMutex.init(&mutex)
```

---

#### `TimedRecursiveMutex.init`

```c3
macro void? TimedRecursiveMutex.init(&mutex)
```

---

#### `TimedMutex.destroy`

```c3
macro void? TimedMutex.destroy(&mutex)
```

---

#### `TimedMutex.lock`

```c3
macro void? TimedMutex.lock(&mutex)
```

---

#### `TimedMutex.lock_timeout`

```c3
macro void? TimedMutex.lock_timeout(&mutex, ulong ms)
```

---

#### `TimedMutex.try_lock`

```c3
macro bool  TimedMutex.try_lock(&mutex)
```

---

#### `TimedMutex.unlock`

```c3
macro void? TimedMutex.unlock(&mutex)
```

---

#### `fence`

```c3
macro void fence(AtomicOrdering $ordering) @safemacro
```

---

#### `Mutex.@in_lock`

```c3
macro void Mutex.@in_lock(&mutex; @body)
```

---

#### `ConditionVariable.init`

```c3
macro void? ConditionVariable.init(&cond)
```

---

#### `ConditionVariable.destroy`

```c3
macro void? ConditionVariable.destroy(&cond)
```

---

#### `ConditionVariable.signal`

```c3
macro void? ConditionVariable.signal(&cond)
```

---

#### `ConditionVariable.broadcast`

```c3
macro void? ConditionVariable.broadcast(&cond)
```

---

#### `ConditionVariable.wait`

```c3
macro void? ConditionVariable.wait(&cond, Mutex* mutex)
```

---

#### `ConditionVariable.wait_timeout`

```c3
<*
 @require @assignable_to(#ms_or_duration, Duration) || @assignable_to(#ms_or_duration, ulong)
 @return? thread::WAIT_TIMEOUT, thread::WAIT_FAILED
*>
macro void? ConditionVariable.wait_timeout(&cond, Mutex* mutex, #ms_or_duration) @safemacro
```

---

#### `ConditionVariable.wait_until`

```c3
<*
 @return? thread::WAIT_TIMEOUT, thread::WAIT_FAILED
*>
macro void? ConditionVariable.wait_until(&cond, Mutex* mutex, Time time)
```

---

#### `Thread.create`

```c3
<*
 @require thread_fn != null : "A non null thread function is required"
*>
macro void? Thread.create(&thread, ThreadFn thread_fn, void* arg)
```

Create and start a thread.


---

#### `Thread.detach`

```c3
macro void? Thread.detach(thread)
```

---

#### `Thread.join`

```c3
macro int? Thread.join(thread)
```

---

#### `Thread.equals`

```c3
macro bool Thread.equals(thread, Thread other)
```

---

#### `OnceFlag.call`

```c3
macro void OnceFlag.call(&flag, OnceFn func)
```

---

#### `yield`

```c3
macro void yield()
```

---

#### `current`

```c3
macro Thread current()
```

---

#### `exit`

```c3
macro void exit(int result)
```

---

#### `sleep`

```c3
macro void? sleep(Duration d) @maydiscard
```

---

#### `sleep_ms`

```c3
macro void? sleep_ms(ulong ms) @maydiscard
```

---

#### `sleep_ns`

```c3
macro void? sleep_ns(NanoDuration ns) @maydiscard
```
### `std::thread::channel {Type}`

---

#### `UnbufferedChannel`

```c3
typedef UnbufferedChannel = void*
```

---

#### `UnbufferedChannel.init`

```c3
fn void? UnbufferedChannel.init(&self, Allocator allocator)
```

---

#### `UnbufferedChannel.destroy`

```c3
fn void? UnbufferedChannel.destroy(&self)
```

---

#### `UnbufferedChannel.push`

```c3
fn void? UnbufferedChannel.push(self, Type val)
```

---

#### `UnbufferedChannel.pop`

```c3
fn Type? UnbufferedChannel.pop(self)
```

---

#### `UnbufferedChannel.close`

```c3
fn void? UnbufferedChannel.close(self)
```
### `std::thread::channel{Type}`

---

#### `BufferedChannel`

```c3
typedef BufferedChannel = void*
```

---

#### `BufferedChannel.init`

```c3
fn void? BufferedChannel.init(&self, Allocator allocator, usz size = 1)
```

---

#### `BufferedChannel.destroy`

```c3
fn void? BufferedChannel.destroy(&self)
```

---

#### `BufferedChannel.push`

```c3
fn void? BufferedChannel.push(self, Type val)
```

---

#### `BufferedChannel.pop`

```c3
fn Type? BufferedChannel.pop(self)
```

---

#### `BufferedChannel.close`

```c3
fn void? BufferedChannel.close(self)
```
### `std::thread::cpu @if(env::DARWIN)`

---

#### `CTL_UNSPEC`

```c3
const CTL_UNSPEC	= 0
```

---

#### `CTL_KERN`

```c3
const CTL_KERN		= 1
```

---

#### `CTL_VM`

```c3
const CTL_VM		= 2
```

---

#### `CTL_VFS`

```c3
const CTL_VFS		= 3
```

---

#### `CTL_NET`

```c3
const CTL_NET		= 4
```

---

#### `CTL_DEBUG`

```c3
const CTL_DEBUG		= 5
```

---

#### `CTL_HW`

```c3
const CTL_HW		= 6
```

---

#### `CTL_MACHDEP`

```c3
const CTL_MACHDEP	= 7
```

---

#### `CTL_USER`

```c3
const CTL_USER		= 8
```

---

#### `CTL_MAXID`

```c3
const CTL_MAXID		= 9
```

---

#### `HW_MACHINE`

```c3
const HW_MACHINE		= 1
```

---

#### `HW_MODEL`

```c3
const HW_MODEL			= 2
```

---

#### `HW_NCPU`

```c3
const HW_NCPU			= 3
```

---

#### `HW_BYTEORDER`

```c3
const HW_BYTEORDER		= 4
```

---

#### `HW_PHYSMEM`

```c3
const HW_PHYSMEM		= 5
```

---

#### `HW_USERMEM`

```c3
const HW_USERMEM		= 6
```

---

#### `HW_PAGESIZE`

```c3
const HW_PAGESIZE		= 7
```

---

#### `HW_DISKNAMES`

```c3
const HW_DISKNAMES		= 8
```

---

#### `HW_DISKSTATS`

```c3
const HW_DISKSTATS		= 9
```

---

#### `HW_EPOCH`

```c3
const HW_EPOCH			= 10
```

---

#### `HW_FLOATINGPT`

```c3
const HW_FLOATINGPT		= 11
```

---

#### `HW_MACHINE_ARCH`

```c3
const HW_MACHINE_ARCH	= 12
```

---

#### `HW_VECTORUNIT`

```c3
const HW_VECTORUNIT		= 13
```

---

#### `HW_BUS_FREQ`

```c3
const HW_BUS_FREQ		= 14
```

---

#### `HW_CPU_FREQ`

```c3
const HW_CPU_FREQ		= 15
```

---

#### `HW_CACHELINE`

```c3
const HW_CACHELINE		= 16
```

---

#### `HW_L1ICACHESIZE`

```c3
const HW_L1ICACHESIZE	= 17
```

---

#### `HW_L1DCACHESIZE`

```c3
const HW_L1DCACHESIZE	= 18
```

---

#### `HW_L2SETTINGS`

```c3
const HW_L2SETTINGS		= 19
```

---

#### `HW_L2CACHESIZE`

```c3
const HW_L2CACHESIZE	= 20
```

---

#### `HW_L3SETTINGS`

```c3
const HW_L3SETTINGS		= 21
```

---

#### `HW_L3CACHESIZE`

```c3
const HW_L3CACHESIZE	= 22
```

---

#### `HW_MAXID`

```c3
const HW_MAXID			= 23
```

---

#### `native_cpu`

```c3
fn uint native_cpu()
```
### `std::thread::cpu @if(env::LINUX)`

---

#### `native_cpu`

```c3
fn uint native_cpu()
```
### `std::thread::cpu @if(env::WIN32)`

---

#### `native_cpu`

```c3
fn uint native_cpu()
```
### `std::thread::event`
### `std::thread::os @if (!env::POSIX && !env::WIN32)`

---

#### `NativeMutex`

```c3
typedef NativeMutex = int
```

---

#### `NativeTimedMutex`

```c3
typedef NativeTimedMutex = int
```

---

#### `NativeConditionVariable`

```c3
typedef NativeConditionVariable = int
```

---

#### `NativeOnceFlag`

```c3
typedef NativeOnceFlag = int
```

---

#### `NativeThread`

```c3
typedef NativeThread = int
```

---

#### `NativeOnceFlag.call_once`

```c3
fn void NativeOnceFlag.call_once(&flag, OnceFn func)
```

---

#### `NativeMutex.init`

```c3
fn void? NativeMutex.init(&mtx, MutexType type)
```

---

#### `NativeMutex.is_initialized`

```c3
fn bool NativeMutex.is_initialized(&self)
```

---

#### `NativeMutex.lock`

```c3
macro void? NativeMutex.lock(&mutex)
```

---

#### `NativeMutex.try_lock`

```c3
macro bool NativeMutex.try_lock(&mutex)
```

---

#### `NativeMutex.unlock`

```c3
macro void? NativeMutex.unlock(&mutex)
```
### `std::thread::os @if(env::POSIX)`

---

#### `NativeMutex`

```c3
struct NativeMutex
```

---

#### `NativeTimedMutex`

```c3
alias NativeTimedMutex = NativeMutex
```

---

#### `NativeConditionVariable`

```c3
alias NativeConditionVariable = Pthread_cond_t
```

---

#### `NativeThread`

```c3
struct NativeThread
```

---

#### `NativeOnceFlag`

```c3
alias NativeOnceFlag = Pthread_once_t
```

---

#### `NativeMutex.init`

```c3
<*
 @require !self.is_initialized() : "Mutex is already initialized"
 @ensure self.is_initialized()
*>
fn void? NativeMutex.init(&self, MutexType type)
```

---

#### `NativeMutex.is_initialized`

```c3
fn bool NativeMutex.is_initialized(&self)
```

---

#### `NativeMutex.destroy`

```c3
<*
 @require self.is_initialized() : "Mutex was not initialized"
 @ensure !self.is_initialized()
*>
fn void? NativeMutex.destroy(&self)
```

---

#### `NativeMutex.lock`

```c3
<*
 @require self.is_initialized() : "Mutex was not initialized"
*>
fn void? NativeMutex.lock(&self)
```

---

#### `NativeMutex.lock_timeout`

```c3
<*
 @require self.is_initialized() : "Mutex was not initialized"
*>
fn void? NativeMutex.lock_timeout(&self, ulong ms)
```

---

#### `NativeMutex.try_lock`

```c3
<*
 @require self.is_initialized() : "Mutex was not initialized"
*>
fn bool NativeMutex.try_lock(&self)
```

---

#### `NativeMutex.unlock`

```c3
<*
 @require self.is_initialized() : "Mutex was not initialized"
*>
fn void? NativeMutex.unlock(&self)
```

---

#### `NativeConditionVariable.init`

```c3
fn void? NativeConditionVariable.init(&cond)
```

---

#### `NativeConditionVariable.destroy`

```c3
fn void? NativeConditionVariable.destroy(&cond)
```

---

#### `NativeConditionVariable.signal`

```c3
fn void? NativeConditionVariable.signal(&cond)
```

---

#### `NativeConditionVariable.broadcast`

```c3
fn void? NativeConditionVariable.broadcast(&cond)
```

---

#### `NativeConditionVariable.wait`

```c3
<*
 @require mtx.is_initialized()
*>
fn void? NativeConditionVariable.wait(&cond, NativeMutex* mtx)
```

---

#### `NativeConditionVariable.wait_timeout`

```c3
<*
 @require mtx.is_initialized()
 @return? thread::WAIT_TIMEOUT, thread::WAIT_FAILED
*>
fn void? NativeConditionVariable.wait_timeout(&cond, NativeMutex* mtx, ulong ms)
```

---

#### `NativeConditionVariable.wait_timeout_duration`

```c3
<*
 @require mtx.is_initialized()
 @return? thread::WAIT_TIMEOUT, thread::WAIT_FAILED
*>
fn void? NativeConditionVariable.wait_timeout_duration(&cond, NativeMutex* mtx, Duration duration)
```

---

#### `NativeConditionVariable.wait_until`

```c3
<*
 @require mtx.is_initialized()
 @return? thread::WAIT_TIMEOUT, thread::WAIT_FAILED
*>
fn void? NativeConditionVariable.wait_until(&cond, NativeMutex* mtx, Time time)
```

---

#### `callback`

```c3
fn void* callback(void* arg) @private
```

---

#### `NativeThread.create`

```c3
fn void? NativeThread.create(&thread, ThreadFn thread_fn, void* arg)
```

---

#### `NativeThread.detach`

```c3
fn void? NativeThread.detach(thread)
```

---

#### `native_thread_exit`

```c3
fn void native_thread_exit(int result)
```

---

#### `native_thread_current`

```c3
fn NativeThread native_thread_current()
```

---

#### `NativeThread.equals`

```c3
fn bool NativeThread.equals(thread, NativeThread other)
```

---

#### `NativeThread.join`

```c3
fn int? NativeThread.join(thread)
```

---

#### `NativeOnceFlag.call_once`

```c3
fn void NativeOnceFlag.call_once(&flag, OnceFn func)
```

---

#### `native_thread_yield`

```c3
fn void native_thread_yield()
```

---

#### `native_sleep_nano`

```c3
fn void? native_sleep_nano(NanoDuration nano)
```
### `std::thread::os @if(env::WIN32)`

---

#### `NativeThread`

```c3
typedef NativeThread = inline Win32_HANDLE
```

---

#### `NativeMutex`

```c3
struct NativeMutex
```

---

#### `NativeMutex.is_initialized`

```c3
fn bool NativeMutex.is_initialized(&self)
```

---

#### `NativeTimedMutex`

```c3
struct NativeTimedMutex
```

---

#### `NativeConditionVariable`

```c3
struct NativeConditionVariable
```

---

#### `NativeOnceFlag`

```c3
struct NativeOnceFlag
```

---

#### `NativeMutex.init`

```c3
<*
 @require !mtx.initialized : "Mutex is already initialized"
 @require !type.timed
 @ensure mtx.initialized
*>
fn void? NativeMutex.init(&mtx, MutexType type)
```

---

#### `NativeMutex.destroy`

```c3
<*
 @require mtx.initialized : "Mutex was not initialized"
 @require mtx.owner_thread != win32::getCurrentThreadId() : "Mutex was not unlocked before destroying it"
 @ensure !mtx.initialized
*>
fn void? NativeMutex.destroy(&mtx)
```

---

#### `NativeMutex.lock`

```c3
<*
 @require mtx.initialized : "Mutex was not initialized"
*>
fn void? NativeMutex.lock(&mtx)
```

---

#### `NativeMutex.try_lock`

```c3
<*
 @require mtx.initialized : "Mutex was not initialized"
*>
fn bool NativeMutex.try_lock(&mtx)
```

---

#### `NativeMutex.unlock`

```c3
<*
 @require mtx.initialized : "Mutex was not initialized"
*>
fn void? NativeMutex.unlock(&mtx)
```

---

#### `NativeTimedMutex.init`

```c3
<*
 @require type.timed
 @require !mtx.initialized : "Mutex is already initialized"
 @ensure mtx.initialized
*>
fn void? NativeTimedMutex.init(&mtx, MutexType type)
```

---

#### `NativeTimedMutex.destroy`

```c3
<*
 @require mtx.initialized : "Mutex was not initialized"
 @require mtx.owner_thread != win32::getCurrentThreadId() : "Mutex was not unlocked before destroying it"
 @ensure !mtx.initialized
*>
fn void? NativeTimedMutex.destroy(&mtx)
```

---

#### `NativeTimedMutex.wait_cond_var`

```c3
fn void? NativeTimedMutex.wait_cond_var(&mtx, uint ms) @local
```

---

#### `NativeTimedMutex.lock`

```c3
<*
 @require mtx.initialized : "Mutex was not initialized"
*>
fn void? NativeTimedMutex.lock(&mtx)
```

---

#### `NativeTimedMutex.lock_timeout`

```c3
<*
 @require mtx.initialized : "Mutex was not initialized"
*>
fn void? NativeTimedMutex.lock_timeout(&mtx, ulong ms)
```

---

#### `NativeTimedMutex.try_lock`

```c3
<*
 @require mtx.initialized : "Mutex was not initialized"
*>
fn bool NativeTimedMutex.try_lock(&mtx)
```

---

#### `NativeTimedMutex.unlock`

```c3
<*
 @require mtx.initialized : "Mutex was not initialized"
*>
fn void? NativeTimedMutex.unlock(&mtx)
```

---

#### `NativeConditionVariable.init`

```c3
fn void? NativeConditionVariable.init(&cond)
```

---

#### `NativeConditionVariable.destroy`

```c3
fn void? NativeConditionVariable.destroy(&cond) @maydiscard
```

---

#### `NativeConditionVariable.signal`

```c3
fn void? NativeConditionVariable.signal(&cond)
```

---

#### `NativeConditionVariable.broadcast`

```c3
fn void? NativeConditionVariable.broadcast(&cond)
```

---

#### `timedwait`

```c3
fn void? timedwait(NativeConditionVariable* cond, NativeMutex* mtx, uint timeout) @private
```

---

#### `NativeConditionVariable.wait`

```c3
<*
 @require mtx.initialized : "Mutex was not initialized"
*>
fn void? NativeConditionVariable.wait(&cond, NativeMutex* mtx) @inline
```

---

#### `NativeConditionVariable.wait_timeout`

```c3
<*
 @require mtx.initialized : "Mutex was not initialized"
 @return? thread::WAIT_TIMEOUT, thread::WAIT_FAILED
*>
fn void? NativeConditionVariable.wait_timeout(&cond, NativeMutex* mtx, ulong ms) @inline
```

---

#### `NativeConditionVariable.wait_timeout_duration`

```c3
<*
 @require mtx.initialized : "Mutex was not initialized"
 @return? thread::WAIT_TIMEOUT, thread::WAIT_FAILED
*>
fn void? NativeConditionVariable.wait_timeout_duration(&cond, NativeMutex* mtx, Duration duration) @inline
```

---

#### `NativeConditionVariable.wait_until`

```c3
<*
 @require mtx.initialized : "Mutex was not initialized"
 @return? thread::WAIT_TIMEOUT, thread::WAIT_FAILED
*>
fn void? NativeConditionVariable.wait_until(&cond, NativeMutex* mtx, Time time) @inline
```

---

#### `NativeThread.create`

```c3
fn void? NativeThread.create(&thread, ThreadFn func, void* args)
```

---

#### `NativeThread.detach`

```c3
fn void? NativeThread.detach(thread) @inline
```

---

#### `native_thread_exit`

```c3
fn void native_thread_exit(int result) @inline
```

---

#### `native_thread_yield`

```c3
fn void native_thread_yield()
```

---

#### `NativeOnceFlag.call_once`

```c3
fn void NativeOnceFlag.call_once(&flag, OnceFn func)
```

---

#### `NativeThread.join`

```c3
fn int? NativeThread.join(thread)
```

---

#### `native_thread_current`

```c3
fn NativeThread native_thread_current()
```

---

#### `NativeThread.equals`

```c3
fn bool NativeThread.equals(thread, NativeThread other)
```

---

#### `native_sleep_nano`

```c3
fn void? native_sleep_nano(NanoDuration ns)
```
### `std::thread::pool{SIZE}`

---

#### `ThreadPool`

```c3
struct ThreadPool
```

---

#### `ThreadPool.init`

```c3
<*
 @require !self.initialized : "ThreadPool must not be already initialized"
*>
fn void? ThreadPool.init(&self)
```

---

#### `ThreadPool.destroy`

```c3
fn void? ThreadPool.destroy(&self)
```

Stop all the threads and cleanup the pool.
Any pending work will be dropped.


---

#### `ThreadPool.stop_and_destroy`

```c3
fn void? ThreadPool.stop_and_destroy(&self)
```

Stop all the threads and cleanup the pool.
Any pending work will be processed.


---

#### `ThreadPool.@shutdown`

```c3
macro void? ThreadPool.@shutdown(&self, #stop) @private
```

---

#### `ThreadPool.push`

```c3
fn void? ThreadPool.push(&self, ThreadFn func, void* arg)
```

Push a new job to the pool.
Returns whether the queue is full, in which case the job is ignored.


---

#### `process_work`

```c3
fn int process_work(void* arg) @private
```
### `std::thread::threadpool @if (env::POSIX || env::WIN32)`

---

#### `ThreadPoolFn`

```c3
alias ThreadPoolFn = fn void(any[] args)
```

---

#### `FixedThreadPool`

```c3
struct FixedThreadPool
```

---

#### `FixedThreadPool.init`

```c3
<*
 @require !self.initialized : "ThreadPool must not be already initialized"
 @require threads > 0 && threads < 0x1000 : `Threads should be greater than 0 and less than 0x1000`
 @require queue_size < 0x10000 : `Queue size must be less than 65536`
*>
fn void? FixedThreadPool.init(&self, usz threads, usz queue_size = 0)
```

---

#### `FixedThreadPool.destroy`

```c3
fn void? FixedThreadPool.destroy(&self)
```

Stop all the threads and cleanup the pool.
Any pending work will be dropped.


---

#### `FixedThreadPool.stop_and_destroy`

```c3
fn void? FixedThreadPool.stop_and_destroy(&self)
```

Stop all the threads and cleanup the pool.
Any pending work will be processed.


---

#### `FixedThreadPool.@shutdown`

```c3
macro void? FixedThreadPool.@shutdown(&self, #stop) @private
```

---

#### `FixedThreadPool.push`

```c3
fn void? FixedThreadPool.push(&self, ThreadPoolFn func, args...)
```

Push a new job to the pool.
return Excuse if the queue is full, in which case the job is ignored.


---

#### `process_work`

```c3
fn int process_work(void* self_arg) @private
```

---

#### `free_qitem`

```c3
fn void free_qitem(QueueItem item) @private
```
### `std::time`

---

#### `Time`

```c3
typedef Time @structlike = long
```

---

#### `Duration`

```c3
typedef Duration @structlike = long
```

---

#### `Clock`

```c3
typedef Clock @structlike = ulong
```

---

#### `NanoDuration`

```c3
typedef NanoDuration (Printable) @structlike = long
```

---

#### `FAR_FUTURE`

```c3
const Time FAR_FUTURE = long.max
```

---

#### `FAR_PAST`

```c3
const Time FAR_PAST = long.min
```

---

#### `NANO_DURATION_ZERO`

```c3
const NanoDuration NANO_DURATION_ZERO = 0
```

---

#### `US`

```c3
const Duration US = 1
```

---

#### `MS`

```c3
const Duration MS = 1_000
```

---

#### `SEC`

```c3
const Duration SEC = 1_000_000
```

---

#### `MIN`

```c3
const Duration MIN = 60 * SEC
```

---

#### `HOUR`

```c3
const Duration HOUR = 60 * MIN
```

---

#### `DAY`

```c3
const Duration DAY = 24 * HOUR
```

---

#### `WEEK`

```c3
const Duration WEEK = 7 * DAY
```

---

#### `MONTH`

```c3
const Duration MONTH = 30 * DAY
```

---

#### `YEAR`

```c3
const Duration YEAR = 36525 * DAY / 100
```

---

#### `FOREVER`

```c3
const Duration FOREVER = long.max
```

---

#### `DURATION_ZERO`

```c3
const Duration DURATION_ZERO = 0
```

---

#### `us`

```c3
fn Duration us(long l) @inline
```

---

#### `ms`

```c3
fn Duration ms(long l) @inline
```

---

#### `sec`

```c3
fn Duration sec(long l) @inline
```

---

#### `min`

```c3
fn Duration min(long l) @inline
```

---

#### `hour`

```c3
fn Duration hour(long l) @inline
```

---

#### `from_float`

```c3
fn Duration from_float(double s) @inline
```

---

#### `DateTime`

```c3
struct DateTime
```

---

#### `TzDateTime`

```c3
struct TzDateTime
```

---

#### `Weekday`

```c3
enum Weekday : char (String name, String abbrev)
```

---

#### `Month`

```c3
enum Month : char (String name, String abbrev, int days, bool leap)
```

---

#### `now`

```c3
fn Time now()
```

---

#### `Time.add_seconds`

```c3
fn Time Time.add_seconds(time, long seconds)
```

---

#### `Time.add_minutes`

```c3
fn Time Time.add_minutes(time, long minutes)
```

---

#### `Time.add_hours`

```c3
fn Time Time.add_hours(time, long hours)
```

---

#### `Time.add_days`

```c3
fn Time Time.add_days(time, long days)
```

---

#### `Time.add_weeks`

```c3
fn Time Time.add_weeks(time, long weeks)
```

---

#### `Time.add_duration`

```c3
fn Time Time.add_duration(time, Duration duration) @operator_s(+) @inline
```

---

#### `Time.sub_duration`

```c3
fn Time Time.sub_duration(time, Duration duration) @operator(-) @inline
```

---

#### `Time.compare_to`

```c3
fn int Time.compare_to(time, Time other)
```

---

#### `Time.to_seconds`

```c3
fn double Time.to_seconds(time)
```

---

#### `Time.diff_us`

```c3
fn Duration Time.diff_us(time, Time other) @operator(-)
```

---

#### `Time.diff_sec`

```c3
fn double Time.diff_sec(time, Time other)
```

---

#### `Time.diff_min`

```c3
fn double Time.diff_min(time, Time other)
```

---

#### `Time.diff_hour`

```c3
fn double Time.diff_hour(time, Time other)
```

---

#### `Time.diff_days`

```c3
fn double Time.diff_days(time, Time other)
```

---

#### `Time.diff_weeks`

```c3
fn double Time.diff_weeks(time, Time other)
```

---

#### `NanoDuration.to_sec`

```c3
fn double NanoDuration.to_sec(nd)
```

---

#### `NanoDuration.to_ms`

```c3
fn long NanoDuration.to_ms(nd)
```

---

#### `NanoDuration.to_duration`

```c3
fn Duration NanoDuration.to_duration(nd)
```

---

#### `Duration.to_nano`

```c3
fn NanoDuration Duration.to_nano(td)
```

---

#### `Duration.to_ms`

```c3
fn long Duration.to_ms(td)
```

---

#### `Duration.mult`

```c3
macro Duration Duration.mult(#td, long #val) @operator_s(*) @safemacro
```

---

#### `NanoDuration.to_format`

```c3
fn usz? NanoDuration.to_format(&self, Formatter* formatter) @dynamic
```
### `std::time::clock`

---

#### `now`

```c3
fn Clock now()
```

---

#### `Clock.mark`

```c3
fn NanoDuration Clock.mark(&self)
```

---

#### `Clock.add_nano_duration`

```c3
fn Clock Clock.add_nano_duration(self, NanoDuration nano) @operator_s(+) @inline
```

---

#### `Clock.sub_nano_duration`

```c3
fn Clock Clock.sub_nano_duration(self, NanoDuration nano) @operator(-) @inline
```

---

#### `Clock.add_duration`

```c3
fn Clock Clock.add_duration(self, Duration duration) @operator_s(+) @inline
```

---

#### `Clock.sub_duration`

```c3
fn Clock Clock.sub_duration(self, Duration duration) @operator(-) @inline
```

---

#### `Clock.nano_diff`

```c3
fn NanoDuration Clock.nano_diff(self, Clock other) @operator(-) @inline
```

---

#### `Clock.to_now`

```c3
fn NanoDuration Clock.to_now(self) @inline
```
### `std::time::datetime @if(env::LIBC)`

---

#### `now`

```c3
fn DateTime now()
```

---

#### `from_date`

```c3
<*
 @require day >= 1 && day < 32
 @require hour >= 0 && hour < 24
 @require min >= 0 && min < 60
 @require sec >= 0 && sec < 60
 @require us >= 0 && us <= 999_999
*>
fn DateTime from_date(int year, Month month = JANUARY, int day = 1, int hour = 0, int min = 0, int sec = 0, int us = 0)
```

---

#### `from_date_tz`

```c3
<*
 @require day >= 1 && day < 32
 @require hour >= 0 && hour < 24
 @require min >= 0 && min < 60
 @require sec >= 0 && sec < 60
 @require us >= 0 && us <= 999_999
 @require gmt_offset >= -12 * 3600 && gmt_offset <= 14 * 3600
*>
fn TzDateTime from_date_tz(int year, Month month = JANUARY, int day = 1, int hour = 0, int min = 0, int sec = 0, int us = 0, int gmt_offset = 0)
```

---

#### `DateTime.to_local`

```c3
fn TzDateTime DateTime.to_local(&self)
```

---

#### `DateTime.with_gmt_offset`

```c3
<*
 @require gmt_offset >= -12 * 3600 && gmt_offset <= 14 * 3600
*>
fn TzDateTime DateTime.with_gmt_offset(self, int gmt_offset)
```

Update timestamp to gmt_offset while keeping the date and time
values unchanged.


---

#### `TzDateTime.with_gmt_offset`

```c3
<*
 @require gmt_offset >= -12 * 3600 && gmt_offset <= 14 * 3600
*>
fn TzDateTime TzDateTime.with_gmt_offset(self, int gmt_offset)
```

Update timestamp to gmt_offset while keeping the date and time
values unchanged.


---

#### `DateTime.to_gmt_offset`

```c3
<*
 @require gmt_offset >= -12 * 3600 && gmt_offset <= 14 * 3600
 @ensure self.time == return.time
*>
fn TzDateTime DateTime.to_gmt_offset(self, int gmt_offset)
```

Update the date and time values to gmt_offset while keeping the
timestamp unchanged.


---

#### `TzDateTime.to_gmt_offset`

```c3
<*
 @require gmt_offset >= -12 * 3600 && gmt_offset <= 14 * 3600
 @ensure self.time == return.time
*>
fn TzDateTime TzDateTime.to_gmt_offset(self, int gmt_offset)
```

Update the date and time values to gmt_offset while keeping the
timestamp unchanged.


---

#### `TzDateTime.eq`

```c3
fn bool TzDateTime.eq(self, TzDateTime other) @operator(==) @inline
```

---

#### `DateTime.set_date`

```c3
<*
 @require day >= 1 && day < 32
 @require hour >= 0 && hour < 24
 @require min >= 0 && min <= 60
 @require sec >= 0 && sec < 60
 @require us >= 0 && us <= 999_999
*>
fn void DateTime.set_date(&self, int year, Month month = JANUARY, int day = 1, int hour = 0, int min = 0, int sec = 0, int us = 0)
```

---

#### `DateTime.set_time`

```c3
fn void DateTime.set_time(&self, Time time)
```

---

#### `DateTime.add_us`

```c3
fn DateTime DateTime.add_us(&self, Duration d) @operator_s(+)
```

---

#### `DateTime.sub_us`

```c3
fn DateTime DateTime.sub_us(&self, Duration d) @operator(-)
```

---

#### `DateTime.add_seconds`

```c3
fn DateTime DateTime.add_seconds(&self, int seconds)
```

---

#### `DateTime.add_minutes`

```c3
fn DateTime DateTime.add_minutes(&self, int minutes)
```

---

#### `DateTime.add_hours`

```c3
fn DateTime DateTime.add_hours(&self, int hours)
```

---

#### `DateTime.add_days`

```c3
fn DateTime DateTime.add_days(&self, int days)
```

---

#### `DateTime.add_weeks`

```c3
fn DateTime DateTime.add_weeks(&self, int weeks)
```

---

#### `DateTime.add_years`

```c3
fn DateTime DateTime.add_years(&self, int years)
```

---

#### `DateTime.add_months`

```c3
fn DateTime DateTime.add_months(&self, int months)
```

---

#### `TzDateTime.add_us`

```c3
fn TzDateTime TzDateTime.add_us(&self, Duration d) @operator_s(+)
```

---

#### `TzDateTime.sub_us`

```c3
fn TzDateTime TzDateTime.sub_us(&self, Duration d) @operator(-)
```

---

#### `TzDateTime.add_seconds`

```c3
fn TzDateTime TzDateTime.add_seconds(&self, int seconds)
```

---

#### `TzDateTime.add_minutes`

```c3
fn TzDateTime TzDateTime.add_minutes(&self, int minutes)
```

---

#### `TzDateTime.add_hours`

```c3
fn TzDateTime TzDateTime.add_hours(&self, int hours)
```

---

#### `TzDateTime.add_days`

```c3
fn TzDateTime TzDateTime.add_days(&self, int days)
```

---

#### `TzDateTime.add_weeks`

```c3
fn TzDateTime TzDateTime.add_weeks(&self, int weeks)
```

---

#### `TzDateTime.add_years`

```c3
fn TzDateTime TzDateTime.add_years(&self, int years)
```

---

#### `TzDateTime.add_months`

```c3
fn TzDateTime TzDateTime.add_months(&self, int months)
```

---

#### `from_time`

```c3
fn DateTime from_time(Time time)
```

---

#### `from_time_tz`

```c3
<*
 @require gmt_offset >= -12 * 3600 && gmt_offset <= 14 * 3600
 @ensure time == return.time
*>
fn TzDateTime from_time_tz(Time time, int gmt_offset)
```

---

#### `DateTime.to_time`

```c3
fn Time DateTime.to_time(&self) @inline
```

---

#### `DateTime.after`

```c3
fn bool DateTime.after(&self, DateTime compare) @inline
```

---

#### `DateTime.before`

```c3
fn bool DateTime.before(&self, DateTime compare) @inline
```

---

#### `DateTime.compare_to`

```c3
fn int DateTime.compare_to(&self, DateTime compare)
```

---

#### `DateTime.diff_years`

```c3
fn int DateTime.diff_years(&self, DateTime from)
```

---

#### `DateTime.diff_sec`

```c3
fn double DateTime.diff_sec(self, DateTime from)
```

---

#### `DateTime.diff_us`

```c3
fn Duration DateTime.diff_us(self, DateTime from) @operator(-)
```

---

#### `DateTime.eq`

```c3
fn bool DateTime.eq(self, DateTime other) @operator(==) @inline
```

---

#### `DateTimeFormat`

```c3
enum DateTimeFormat
```

---

#### `format`

```c3
fn String format(Allocator allocator, DateTimeFormat type, TzDateTime dt)
```

---

#### `tformat`

```c3
fn String tformat(DateTimeFormat dt_format, TzDateTime dt)
```

---

#### `TzDateTime.format`

```c3
fn String TzDateTime.format(self, Allocator allocator, DateTimeFormat dt_format)
```

---

#### `DateTime.format`

```c3
fn String DateTime.format(self, Allocator allocator, DateTimeFormat dt_format)
```

---

#### `temp_numeric_tzsuffix`

```c3
<*
 @require gmt_offset >= -12 * 3600 && gmt_offset <= 14 * 3600
*>
fn String temp_numeric_tzsuffix(int gmt_offset) @private @inline
```

Returns the timezone offset in the format of "+HHMM" or "-HHMM"


---

#### `temp_numeric_tzsuffix_colon`

```c3
<*
 @require gmt_offset >= -12 * 3600 && gmt_offset <= 14 * 3600
*>
fn String temp_numeric_tzsuffix_colon(int gmt_offset) @private @inline
```

Returns the timezone offset in the format of "+HH:MM" or "-HH:MM"

### `std::time::os @if(env::DARWIN)`

---

#### `native_clock`

```c3
fn Clock native_clock()
```
### `std::time::os @if(env::POSIX)`

---

#### `native_timestamp`

```c3
fn Time native_timestamp()
```

---

#### `native_clock`

```c3
fn Clock native_clock() @if(!env::DARWIN)
```
### `std::time::os @if(env::WIN32)`

---

#### `native_clock`

```c3
fn Clock native_clock()
```

---

#### `native_timestamp`

```c3
fn Time native_timestamp()
```
