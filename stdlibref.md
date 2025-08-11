### `libc`

---

#### `EXIT_FAILURE`
```c3
const int EXIT_FAILURE
```

---

#### `EXIT_SUCCESS`
```c3
const int EXIT_SUCCESS
```

---

#### `RAND_MAX`
```c3
const int RAND_MAX
```

---

#### `WChar`
```c3
alias WChar @if(env::WIN32) = Char16
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
alias Fpos_t @if(env::WIN32) = long
```

---

#### `Mbstate_t`
```c3
struct Mbstate_t @if(!env::WIN32)
```

---

#### `func`
```c3
fn Errno errno()
```

---

#### `func`
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
const CInt SIGHUP
```

---

#### `SIGINT`
```c3
const CInt SIGINT
```

---

#### `SIGQUIT`
```c3
const CInt SIGQUIT
```

---

#### `SIGILL`
```c3
const CInt SIGILL
```

---

#### `SIGTRAP`
```c3
const CInt SIGTRAP
```

---

#### `SIGABRT`
```c3
const CInt SIGABRT
```

---

#### `SIGBUS`
```c3
const CInt SIGBUS
```

---

#### `SIGFPE`
```c3
const CInt SIGFPE
```

---

#### `SIGKILL`
```c3
const CInt SIGKILL
```

---

#### `SIGSEGV`
```c3
const CInt SIGSEGV
```

---

#### `SIGSYS`
```c3
const CInt SIGSYS
```

---

#### `SIGPIPE`
```c3
const CInt SIGPIPE
```

---

#### `SIGALRM`
```c3
const CInt SIGALRM
```

---

#### `SIGTERM`
```c3
const CInt SIGTERM
```

---

#### `SIGURG`
```c3
const CInt SIGURG
```

---

#### `SIGSTOP`
```c3
const CInt SIGSTOP
```

---

#### `SIGTSTP`
```c3
const CInt SIGTSTP
```

---

#### `SIGCONT`
```c3
const CInt SIGCONT
```

---

#### `SIGCHLD`
```c3
const CInt SIGCHLD
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
const HAS_MALLOC_SIZE
```

---

#### `SEEK_SET`
```c3
const int SEEK_SET
```

---

#### `SEEK_CUR`
```c3
const int SEEK_CUR
```

---

#### `SEEK_END`
```c3
const int SEEK_END
```

---

#### `_IOFBF`
```c3
const int _IOFBF
```

---

#### `_IOLBF`
```c3
const int _IOLBF
```

---

#### `_IONBF`
```c3
const int _IONBF
```

---

#### `BUFSIZ`
```c3
const int BUFSIZ
```

---

#### `EOF`
```c3
const int EOF
```

---

#### `FOPEN_MAX`
```c3
const int FOPEN_MAX
```

---

#### `FILENAME_MAX`
```c3
const int FILENAME_MAX
```

---

#### `macro`
```c3
macro bool libc_S_ISTYPE(value, mask) @builtin
```

---

#### `S_IFMT`
```c3
const S_IFMT
```

---

#### `S_IFIFO`
```c3
const S_IFIFO
```

---

#### `S_IFCHR`
```c3
const S_IFCHR
```

---

#### `S_IFDIR`
```c3
const S_IFDIR
```

---

#### `S_IFBLK`
```c3
const S_IFBLK
```

---

#### `S_IFREG`
```c3
const S_IFREG
```

---

#### `S_IFLNK`
```c3
const S_IFLNK
```

---

#### `S_IFSOCK`
```c3
const S_IFSOCK
```

---

#### `S_ISUID`
```c3
const S_ISUID
```

---

#### `S_ISGID`
```c3
const S_ISGID
```

---

#### `S_ISVTX`
```c3
const S_ISVTX
```

---

#### `S_IRUSR`
```c3
const S_IRUSR
```

---

#### `S_IWUSR`
```c3
const S_IWUSR
```

---

#### `S_IXUSR`
```c3
const S_IXUSR
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
alias Clock_t @if(!env::WIN32) = CLong
```

---

#### `TimeOffset`
```c3
alias TimeOffset @if(env::WASI) = int
alias TimeOffset @if(!env::WASI) = CLong 
```

---

#### `TIME_UTC`
```c3
const int TIME_UTC
```

---

#### `@if(env::WIN32)`
```c3
const CLOCKS_PER_SEC @if(env::WIN32)
```

---

#### `@if(!env::WIN32)`
```c3
const CLOCKS_PER_SEC @if(!env::WIN32)
```

---

#### `func`
```c3
<*
 @require self >= time::NANO_DURATION_ZERO
*>
fn TimeSpec NanoDuration.to_timespec(self) @inline
```


Return a "timespec" from a duration.

---

#### `func`
```c3
<*
 @require self >= time::DURATION_ZERO
*>
fn TimeSpec Duration.to_timespec(self) @inline
```


Convert a duration to a timespec.

---

#### `func`
```c3
fn TimeSpec Time.to_timespec(self) @inline
```

Convert a timestamp to a timespec.
### `libc @if(!env::LIBC)`

---

#### `func`
```c3
fn void longjmp(JmpBuf* buffer, CInt value) @weak @extern("longjmp") @nostrip
```

---

#### `func`
```c3
fn CInt setjmp(JmpBuf* buffer) @weak @extern("setjmp") @nostrip
```

---

#### `func`
```c3
fn void* malloc(usz size) @weak @extern("malloc") @nostrip
```

---

#### `func`
```c3
fn void* calloc(usz count, usz size) @weak @extern("calloc") @nostrip
```

---

#### `func`
```c3
fn void* free(void*) @weak @extern("free")
```

---

#### `func`
```c3
fn void* realloc(void* ptr, usz size) @weak @extern("realloc") @nostrip
```

---

#### `func`
```c3
fn void* memcpy(void* dest, void* src, usz n) @weak @extern("memcpy") @nostrip
```

---

#### `func`
```c3
fn void* memmove(void* dest, void* src, usz n) @weak @extern("memmove") @nostrip
```

---

#### `func`
```c3
fn void* memset(void* dest, CInt value, usz n) @weak @extern("memset") @nostrip
```

---

#### `func`
```c3
fn int fseek(CFile stream, SeekIndex offset, int whence) @weak @extern("fseek") @nostrip
```

---

#### `func`
```c3
fn CFile fopen(ZString filename, ZString mode) @weak @extern("fopen") @nostrip
```

---

#### `func`
```c3
fn CFile freopen(ZString filename, ZString mode, CFile stream) @weak @extern("fopen") @nostrip
```

---

#### `func`
```c3
fn usz fwrite(void* ptr, usz size, usz nmemb, CFile stream) @weak @extern("fwrite") @nostrip
```

---

#### `func`
```c3
fn usz fread(void* ptr, usz size, usz nmemb, CFile stream) @weak @extern("fread") @nostrip
```

---

#### `func`
```c3
fn CFile fclose(CFile) @weak @extern("fclose") @nostrip
```

---

#### `func`
```c3
fn int fflush(CFile stream) @weak @extern("fflush") @nostrip
```

---

#### `func`
```c3
fn int fputc(int c, CFile stream) @weak @extern("fputc") @nostrip
```

---

#### `func`
```c3
fn char* fgets(ZString str, int n, CFile stream) @weak @extern("fgets") @nostrip
```

---

#### `func`
```c3
fn int fgetc(CFile stream) @weak @extern("fgetc") @nostrip
```

---

#### `func`
```c3
fn int feof(CFile stream) @weak @extern("feof") @nostrip
```

---

#### `func`
```c3
fn int putc(int c, CFile stream) @weak @extern("putc") @nostrip
```

---

#### `func`
```c3
fn int putchar(int c) @weak @extern("putchar") @nostrip
```

---

#### `func`
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
struct Stat @if(!env::X86_64)

```

---

#### `extern func`
```c3
extern fn CInt stat(ZString path, Stat* stat)
```
### `libc @if(env::DARWIN || env::FREEBSD)`

---

#### `extern func`
```c3
extern fn usz malloc_size(void* ptr) @if(!env::FREEBSD)
```

---

#### `macro`
```c3
macro CFile stdout()
```

---

#### `macro`
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

#### `extern func`
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
struct Stat @if(!env::X86_64)

```

---

#### `extern func`
```c3
extern fn CInt stat(ZString path, Stat* stat)
```
### `libc @if(env::LIBC)`

---

#### `extern func`
```c3
extern fn void abort()
```

---

#### `macro`
```c3
macro CFile stdout()
```

---

#### `macro`
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
struct Stat @if(!env::X86_64)

```

---

#### `extern func`
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
struct Stat @if(!env::X86_64)

```

---

#### `extern func`
```c3
extern fn CInt stat(ZString path, Stat* stat)
```
### `libc @if(env::POSIX)`

---

#### `SHUT_RD`
```c3
const CInt SHUT_RD
```

---

#### `SHUT_WR`
```c3
const CInt SHUT_WR
```

---

#### `SHUT_RDWR`
```c3
const CInt SHUT_RDWR
```

---

#### `extern func`
```c3
extern fn CInt shutdown(Fd sockfd, CInt how)
```

---

#### `Stack_t`
```c3
struct Stack_t
```

---

#### `extern func`
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

#### `extern func`
```c3
extern fn CFile __acrt_iob_func(CInt c)
```

---

#### `extern func`
```c3
extern fn CInt get_system_info(SystemInfo*) @extern("GetSystemInfo")
```
### `libc::errno`

---

#### `OK`
```c3
const Errno OK
```

---

#### `EPERM`
```c3
const Errno EPERM
```

---

#### `ENOENT`
```c3
const Errno ENOENT
```

---

#### `ESRCH`
```c3
const Errno ESRCH
```

---

#### `EINTR`
```c3
const Errno EINTR
```

---

#### `EIO`
```c3
const Errno EIO
```

---

#### `ENXIO`
```c3
const Errno ENXIO
```

---

#### `E2BIG`
```c3
const Errno E2BIG
```

---

#### `ENOEXEC`
```c3
const Errno ENOEXEC
```

---

#### `EBADF`
```c3
const Errno EBADF
```

---

#### `ECHILD`
```c3
const Errno ECHILD
```

---

#### `@if(env::DARWIN)`
```c3
const Errno EAGAIN @if(env::DARWIN)
```

---

#### `@if(!env::DARWIN)`
```c3
const Errno EAGAIN @if(!env::DARWIN)
```

---

#### `ENOMEM`
```c3
const Errno ENOMEM
```

---

#### `EACCES`
```c3
const Errno EACCES
```

---

#### `EFAULT`
```c3
const Errno EFAULT
```

---

#### `ENOTBLK`
```c3
const Errno ENOTBLK
```

---

#### `EBUSY`
```c3
const Errno EBUSY
```

---

#### `EEXIST`
```c3
const Errno EEXIST
```

---

#### `EXDEV`
```c3
const Errno EXDEV
```

---

#### `ENODEV`
```c3
const Errno ENODEV
```

---

#### `ENOTDIR`
```c3
const Errno ENOTDIR
```

---

#### `EISDIR`
```c3
const Errno EISDIR
```

---

#### `EINVAL`
```c3
const Errno EINVAL
```

---

#### `ENFILE`
```c3
const Errno ENFILE
```

---

#### `EMFILE`
```c3
const Errno EMFILE
```

---

#### `ENOTTY`
```c3
const Errno ENOTTY
```

---

#### `ETXTBSY`
```c3
const Errno ETXTBSY
```

---

#### `EFBIG`
```c3
const Errno EFBIG
```

---

#### `ENOSPC`
```c3
const Errno ENOSPC
```

---

#### `ESPIPE`
```c3
const Errno ESPIPE
```

---

#### `EROFS`
```c3
const Errno EROFS
```

---

#### `EMLINK`
```c3
const Errno EMLINK
```

---

#### `EPIPE`
```c3
const Errno EPIPE
```

---

#### `EDOM`
```c3
const Errno EDOM
```

---

#### `ERANGE`
```c3
const Errno ERANGE
```
### `libc::errno @if(!env::WIN32 && !env::DARWIN)`

---

#### `EDEADLK`
```c3
const Errno EDEADLK
```

---

#### `ENAMETOOLONG`
```c3
const Errno ENAMETOOLONG
```

---

#### `ENOTEMPTY`
```c3
const Errno ENOTEMPTY
```

---

#### `ELOOP`
```c3
const Errno ELOOP
```

---

#### `EWOULDBLOCK`
```c3
const Errno EWOULDBLOCK
```

---

#### `EOVERFLOW`
```c3
const Errno EOVERFLOW
```

---

#### `ENOTSOCK`
```c3
const Errno ENOTSOCK
```

---

#### `EOPNOTSUPP`
```c3
const Errno EOPNOTSUPP
```

---

#### `EADDRINUSE`
```c3
const Errno EADDRINUSE
```

---

#### `EADDRNOTAVAIL`
```c3
const Errno EADDRNOTAVAIL
```

---

#### `ENETDOWN`
```c3
const Errno ENETDOWN
```

---

#### `ENETUNREACH`
```c3
const Errno ENETUNREACH
```

---

#### `ENETRESET`
```c3
const Errno ENETRESET
```

---

#### `ECONNRESET`
```c3
const Errno ECONNRESET
```

---

#### `EISCONN`
```c3
const Errno EISCONN
```

---

#### `ETIMEDOUT`
```c3
const Errno ETIMEDOUT
```

---

#### `ECONNREFUSED`
```c3
const Errno ECONNREFUSED
```

---

#### `EALREADY`
```c3
const Errno EALREADY
```

---

#### `EINPROGRESS`
```c3
const Errno EINPROGRESS
```

---

#### `EDQUOT`
```c3
const Errno EDQUOT
```
### `libc::errno @if(env::DARWIN)`

---

#### `EWOULDBLOCK`
```c3
const Errno EWOULDBLOCK
```

---

#### `EDEADLK`
```c3
const Errno EDEADLK
```

---

#### `EINPROGRESS`
```c3
const Errno EINPROGRESS
```

---

#### `EALREADY`
```c3
const Errno EALREADY
```

---

#### `ENOTSOCK`
```c3
const Errno ENOTSOCK
```

---

#### `EDESTADDRREQ`
```c3
const Errno EDESTADDRREQ
```

---

#### `EMSGSIZE`
```c3
const Errno EMSGSIZE
```

---

#### `EPROTOTYPE`
```c3
const Errno EPROTOTYPE
```

---

#### `ENOPROTOOPT`
```c3
const Errno ENOPROTOOPT
```

---

#### `EPROTONOSUPPORT`
```c3
const Errno EPROTONOSUPPORT
```

---

#### `ESOCKTNOSUPPORT`
```c3
const Errno ESOCKTNOSUPPORT
```

---

#### `ENOTSUP`
```c3
const Errno ENOTSUP
```

---

#### `EPFNOSUPPORT`
```c3
const Errno EPFNOSUPPORT
```

---

#### `EAFNOSUPPORT`
```c3
const Errno EAFNOSUPPORT
```

---

#### `EADDRINUSE`
```c3
const Errno EADDRINUSE
```

---

#### `EADDRNOTAVAIL`
```c3
const Errno EADDRNOTAVAIL
```

---

#### `ENETDOWN`
```c3
const Errno ENETDOWN
```

---

#### `ENETUNREACH`
```c3
const Errno ENETUNREACH
```

---

#### `ENETRESET`
```c3
const Errno ENETRESET
```

---

#### `ECONNABORTED`
```c3
const Errno ECONNABORTED
```

---

#### `ECONNRESET`
```c3
const Errno ECONNRESET
```

---

#### `ENOBUFS`
```c3
const Errno ENOBUFS
```

---

#### `EISCONN`
```c3
const Errno EISCONN
```

---

#### `ENOTCONN`
```c3
const Errno ENOTCONN
```

---

#### `ESHUTDOWN`
```c3
const Errno ESHUTDOWN
```

---

#### `ETIMEDOUT`
```c3
const Errno ETIMEDOUT
```

---

#### `ECONNREFUSED`
```c3
const Errno ECONNREFUSED
```

---

#### `ELOOP`
```c3
const Errno ELOOP
```

---

#### `ENAMETOOLONG`
```c3
const Errno ENAMETOOLONG
```

---

#### `EHOSTDOWN`
```c3
const Errno EHOSTDOWN
```

---

#### `EHOSTUNREACH`
```c3
const Errno EHOSTUNREACH
```

---

#### `ENOTEMPTY`
```c3
const Errno ENOTEMPTY
```

---

#### `EPROCLIM`
```c3
const Errno EPROCLIM
```

---

#### `EUSERS`
```c3
const Errno EUSERS
```

---

#### `EDQUOT`
```c3
const Errno EDQUOT
```

---

#### `ESTALE`
```c3
const Errno ESTALE
```

---

#### `EBADRPC`
```c3
const Errno EBADRPC
```

---

#### `ERPCMISMATCH`
```c3
const Errno ERPCMISMATCH
```

---

#### `EPROGUNAVAIL`
```c3
const Errno EPROGUNAVAIL
```

---

#### `EPROGMISMATCH`
```c3
const Errno EPROGMISMATCH
```

---

#### `EPROCUNAVAIL`
```c3
const Errno EPROCUNAVAIL
```

---

#### `ENOLCK`
```c3
const Errno ENOLCK
```

---

#### `ENOSYS`
```c3
const Errno ENOSYS
```

---

#### `EFTYPE`
```c3
const Errno EFTYPE
```

---

#### `EAUTH`
```c3
const Errno EAUTH
```

---

#### `ENEEDAUTH`
```c3
const Errno ENEEDAUTH
```

---

#### `EPWROFF`
```c3
const Errno EPWROFF
```

---

#### `EDEVERR`
```c3
const Errno EDEVERR
```

---

#### `EOVERFLOW`
```c3
const Errno EOVERFLOW
```

---

#### `EBADEXEC`
```c3
const Errno EBADEXEC
```

---

#### `EBADARCH`
```c3
const Errno EBADARCH
```

---

#### `ESHLIBVERS`
```c3
const Errno ESHLIBVERS
```

---

#### `EBADMACHO`
```c3
const Errno EBADMACHO
```

---

#### `ECANCELED`
```c3
const Errno ECANCELED
```

---

#### `EIDRM`
```c3
const Errno EIDRM
```

---

#### `ENOMSG`
```c3
const Errno ENOMSG
```

---

#### `EILSEQ`
```c3
const Errno EILSEQ
```

---

#### `ENOATTR`
```c3
const Errno ENOATTR
```

---

#### `EBADMSG`
```c3
const Errno EBADMSG
```

---

#### `EMULTIHOP`
```c3
const Errno EMULTIHOP
```

---

#### `ENODATA`
```c3
const Errno ENODATA
```

---

#### `ENOLINK`
```c3
const Errno ENOLINK
```

---

#### `ENOSR`
```c3
const Errno ENOSR
```

---

#### `ENOSTR`
```c3
const Errno ENOSTR
```

---

#### `EPROTO`
```c3
const Errno EPROTO
```

---

#### `ETIME`
```c3
const Errno ETIME
```

---

#### `EOPNOTSUPP`
```c3
const Errno EOPNOTSUPP
```
### `libc::errno @if(env::WIN32)`

---

#### `EDEADLK`
```c3
const Errno EDEADLK
```

---

#### `ENAMETOOLONG`
```c3
const Errno ENAMETOOLONG
```

---

#### `ENOTEMPTY`
```c3
const Errno ENOTEMPTY
```

---

#### `ELOOP`
```c3
const Errno ELOOP
```

---

#### `EOVERFLOW`
```c3
const Errno EOVERFLOW
```

---

#### `ENETDOWN`
```c3
const Errno ENETDOWN
```

---

#### `ECONNRESET`
```c3
const Errno ECONNRESET
```

---

#### `ENETUNREACH`
```c3
const Errno ENETUNREACH
```

---

#### `ENETRESET`
```c3
const Errno ENETRESET
```

---

#### `EOPNOTSUPP`
```c3
const Errno EOPNOTSUPP
```

---

#### `ETIMEDOUT`
```c3
const Errno ETIMEDOUT
```

---

#### `EALREADY`
```c3
const Errno EALREADY
```

---

#### `EINPROGRESS`
```c3
const Errno EINPROGRESS
```

---

#### `EDQUOT`
```c3
const Errno EDQUOT
```

---

#### `EWOULDBLOCK`
```c3
const Errno EWOULDBLOCK
```
### `libc::os @if(env::LIBC)`

---

#### `extern func`
```c3
extern fn int* __errno_location() @if(env::LINUX)
```

---

#### `macro`
```c3
macro void errno_set(int err) @if(env::WIN32)
```

---

#### `extern func`
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

#### `func`
```c3
fn CInt tcgetattr(Fd fd, Termios* self)
```

---

#### `func`
```c3
fn CInt tcsetattr(Fd fd, CInt optional_actions, Termios* self)
```

---

#### `func`
```c3
fn CInt tcsendbreak(Fd fd, CInt duration)
```

---

#### `func`
```c3
fn CInt tcdrain(Fd fd)
```

---

#### `func`
```c3
fn CInt tcflush(Fd fd, CInt queue_selector)
```

---

#### `func`
```c3
fn CInt tcflow(Fd fd, CInt action)
```

---

#### `func`
```c3
fn Speed cfgetospeed(Termios* self)
```

---

#### `func`
```c3
fn Speed cfgetispeed(Termios* self)
```

---

#### `func`
```c3
fn CInt cfsetospeed(Termios* self, Speed speed)
```

---

#### `func`
```c3
fn CInt cfsetispeed(Termios* self, Speed speed)
```

---

#### `func`
```c3
fn int sendBreak(Fd fd, int duration)
```

---

#### `func`
```c3
fn int drain(Fd fd)
```

---

#### `func`
```c3
fn int flush(Fd fd, int queue_selector)
```

---

#### `func`
```c3
fn int flow(Fd fd, int action)
```

---

#### `func`
```c3
fn Speed Termios.getOSpeed(Termios* self)
```

---

#### `func`
```c3
fn Speed Termios.getISpeed(Termios* self)
```

---

#### `func`
```c3
fn int Termios.setOSpeed(Termios* self, Speed speed)
```

---

#### `func`
```c3
fn int Termios.setISpeed(Termios* self, Speed speed)
```

---

#### `func`
```c3
fn int Termios.getAttr(Termios* self, Fd fd)
```

---

#### `func`
```c3
fn int Termios.setAttr(Termios* self, Fd fd, int optional_actions)
```
### `libc::termios @if(env::LIBC &&& env::POSIX)`

---

#### `func`
```c3
fn int sendBreak(Fd fd, int duration)
```

---

#### `func`
```c3
fn int drain(Fd fd)
```

---

#### `func`
```c3
fn int flush(Fd fd, int queue_selector)
```

---

#### `func`
```c3
fn int flow(Fd fd, int action)
```

---

#### `func`
```c3
fn Speed Termios.getOSpeed(Termios* self)
```

---

#### `func`
```c3
fn Speed Termios.getISpeed(Termios* self)
```

---

#### `func`
```c3
fn int Termios.setOSpeed(Termios* self, Speed speed)
```

---

#### `func`
```c3
fn int Termios.setISpeed(Termios* self, Speed speed)
```

---

#### `func`
```c3
fn int Termios.getAttr(Termios* self, Fd fd)
```

---

#### `func`
```c3
fn int Termios.setAttr(Termios* self, Fd fd, Tcactions optional_actions)
```
### `std::ascii`

---

#### `macro`
```c3
macro bool in_range_m(c, start, len)
```

---

#### `macro`
```c3
macro bool is_lower_m(c)
```

---

#### `macro`
```c3
macro bool is_upper_m(c)
```

---

#### `macro`
```c3
macro bool is_digit_m(c)
```

---

#### `macro`
```c3
macro bool is_bdigit_m(c)
```

---

#### `macro`
```c3
macro bool is_odigit_m(c)
```

---

#### `macro`
```c3
macro bool is_xdigit_m(c)
```

---

#### `macro`
```c3
macro bool is_alpha_m(c)
```

---

#### `macro`
```c3
macro bool is_print_m(c)
```

---

#### `macro`
```c3
macro bool is_graph_m(c)
```

---

#### `macro`
```c3
macro bool is_space_m(c)
```

---

#### `macro`
```c3
macro bool is_alnum_m(c)
```

---

#### `macro`
```c3
macro bool is_punct_m(c)
```

---

#### `macro`
```c3
macro bool is_blank_m(c)
```

---

#### `macro`
```c3
macro bool is_cntrl_m(c)
```

---

#### `macro`
```c3
macro to_lower_m(c)
```

---

#### `macro`
```c3
macro to_upper_m(c)
```

---

#### `func`
```c3
fn bool in_range(char c, char start, char len)
```

---

#### `func`
```c3
fn bool char.in_range(char c, char start, char len)
```

---

#### `func`
```c3
fn bool uint.in_range(uint c, uint start, uint len)
```

---

#### `func`
```c3
fn bool uint.is_lower(uint c)  @deprecated
```

---

#### `func`
```c3
fn bool uint.is_upper(uint c)  @deprecated
```

---

#### `func`
```c3
fn bool uint.is_digit(uint c)  @deprecated
```

---

#### `func`
```c3
fn bool uint.is_bdigit(uint c) @deprecated
```

---

#### `func`
```c3
fn bool uint.is_odigit(uint c) @deprecated
```

---

#### `func`
```c3
fn bool uint.is_xdigit(uint c) @deprecated
```

---

#### `func`
```c3
fn bool uint.is_alpha(uint c)  @deprecated
```

---

#### `func`
```c3
fn bool uint.is_print(uint c)  @deprecated
```

---

#### `func`
```c3
fn bool uint.is_graph(uint c)  @deprecated
```

---

#### `func`
```c3
fn bool uint.is_space(uint c)  @deprecated
```

---

#### `func`
```c3
fn bool uint.is_alnum(uint c)  @deprecated
```

---

#### `func`
```c3
fn bool uint.is_punct(uint c)  @deprecated
```

---

#### `func`
```c3
fn bool uint.is_blank(uint c)  @deprecated
```

---

#### `func`
```c3
fn bool uint.is_cntrl(uint c)  @deprecated
```

---

#### `func`
```c3
fn uint uint.to_lower(uint c)  @deprecated
```

---

#### `func`
```c3
fn uint uint.to_upper(uint c)  @deprecated
```
### `std::atomic`

---

#### `macro`
```c3
macro bool is_native_atomic_type($Type)
```

---

#### `macro`
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

#### `macro`
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

#### `macro`
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

#### `macro`
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

#### `macro`
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

#### `macro`
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

#### `macro`
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

#### `macro`
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

#### `macro`
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

#### `macro`
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

#### `macro`
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

#### `macro`
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

#### `macro`
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

#### `macro`
```c3
macro @__atomic_compare_exchange_ordering_failure(ptr, expected, desired, $success, failure, $alignment)
```

---

#### `macro`
```c3
macro @__atomic_compare_exchange_ordering_success(ptr, expected, desired, success, failure, $alignment)
```

---

#### `func`
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

#### `macro`
```c3
<*
 @param ordering : "The ordering, cannot be release or acquire-release."
 @require ordering != RELEASE && ordering != ACQUIRE_RELEASE : "Release and acquire-release are not valid for load"
*>
macro Type Atomic.load(&self, AtomicOrdering ordering = SEQ_CONSISTENT)
```


Loads data atomically, by default this uses SEQ_CONSISTENT ordering.

---

#### `macro`
```c3
<*
 @param ordering : "The ordering, cannot be acquire or acquire-release."
 @require ordering != ACQUIRE && ordering != ACQUIRE_RELEASE : "Acquire and acquire-release are not valid for store"
*>
macro void Atomic.store(&self, Type value, AtomicOrdering ordering = SEQ_CONSISTENT)
```


Stores data atomically, by default this uses SEQ_CONSISTENT ordering.

---

#### `macro`
```c3
macro Type Atomic.add(&self, Type value, AtomicOrdering ordering = SEQ_CONSISTENT)
```

---

#### `macro`
```c3
macro Type Atomic.sub(&self, Type value, AtomicOrdering ordering = SEQ_CONSISTENT)
```

---

#### `macro`
```c3
macro Type Atomic.mul(&self, Type value, AtomicOrdering ordering = SEQ_CONSISTENT)
```

---

#### `macro`
```c3
macro Type Atomic.div(&self, Type value, AtomicOrdering ordering = SEQ_CONSISTENT)
```

---

#### `macro`
```c3
macro Type Atomic.max(&self, Type value, AtomicOrdering ordering = SEQ_CONSISTENT)
```

---

#### `macro`
```c3
macro Type Atomic.min(&self, Type value, AtomicOrdering ordering = SEQ_CONSISTENT)
```

---

#### `macro`
```c3
macro Type Atomic.or(&self, Type value, AtomicOrdering ordering = SEQ_CONSISTENT) @if(types::flat_kind(Type) != FLOAT)
```

---

#### `macro`
```c3
macro Type Atomic.xor(&self, Type value, AtomicOrdering ordering = SEQ_CONSISTENT) @if(types::flat_kind(Type) != FLOAT)
```

---

#### `macro`
```c3
macro Type Atomic.and(&self, Type value, AtomicOrdering ordering = SEQ_CONSISTENT) @if(types::flat_kind(Type) != FLOAT)
```

---

#### `macro`
```c3
macro Type Atomic.shr(&self, Type amount, AtomicOrdering ordering = SEQ_CONSISTENT) @if(types::flat_kind(Type) != FLOAT)
```

---

#### `macro`
```c3
macro Type Atomic.shl(&self, Type amount, AtomicOrdering ordering = SEQ_CONSISTENT) @if(types::flat_kind(Type) != FLOAT)
```

---

#### `macro`
```c3
macro Type Atomic.set(&self, AtomicOrdering ordering = SEQ_CONSISTENT) @if(types::flat_kind(Type) == BOOL)
```

---

#### `macro`
```c3
macro Type Atomic.clear(&self, AtomicOrdering ordering = SEQ_CONSISTENT) @if(types::flat_kind(Type) == BOOL)
```
### `std::bits`

---

#### `macro`
```c3
<*
 @require types::is_intlike($typeof(i)) : `The input must be an integer or integer vector`
*>
macro reverse(i)
```


---

#### `macro`
```c3
<*
 @require types::is_intlike($typeof(i)) : `The input must be an integer or integer vector`
*>
macro bswap(i) @builtin
```


---

#### `macro`
```c3
macro uint[<*>].popcount(self)
```

---

#### `macro`
```c3
macro uint[<*>].ctz(self)
```

---

#### `macro`
```c3
macro uint[<*>].clz(self)
```

---

#### `macro`
```c3
macro uint[<*>] uint[<*>].fshl(hi, uint[<*>] lo, uint[<*>] shift)
```

---

#### `macro`
```c3
macro uint[<*>] uint[<*>].fshr(hi, uint[<*>] lo, uint[<*>] shift)
```

---

#### `macro`
```c3
macro uint[<*>] uint[<*>].rotl(self, uint[<*>] shift)
```

---

#### `macro`
```c3
macro uint[<*>] uint[<*>].rotr(self, uint[<*>] shift)
```

---

#### `macro`
```c3
macro int[<*>].popcount(self)
```

---

#### `macro`
```c3
macro int[<*>].ctz(self)
```

---

#### `macro`
```c3
macro int[<*>].clz(self)
```

---

#### `macro`
```c3
macro int[<*>] int[<*>].fshl(hi, int[<*>] lo, int[<*>] shift)
```

---

#### `macro`
```c3
macro int[<*>] int[<*>].fshr(hi, int[<*>] lo, int[<*>] shift)
```

---

#### `macro`
```c3
macro int[<*>] int[<*>].rotl(self, int[<*>] shift)
```

---

#### `macro`
```c3
macro int[<*>] int[<*>].rotr(self, int[<*>] shift)
```

---

#### `macro`
```c3
macro ushort[<*>].popcount(self)
```

---

#### `macro`
```c3
macro ushort[<*>].ctz(self)
```

---

#### `macro`
```c3
macro ushort[<*>].clz(self)
```

---

#### `macro`
```c3
macro ushort[<*>] ushort[<*>].fshl(hi, ushort[<*>] lo, ushort[<*>] shift)
```

---

#### `macro`
```c3
macro ushort[<*>] ushort[<*>].fshr(hi, ushort[<*>] lo, ushort[<*>] shift)
```

---

#### `macro`
```c3
macro ushort[<*>] ushort[<*>].rotl(self, ushort[<*>] shift)
```

---

#### `macro`
```c3
macro ushort[<*>] ushort[<*>].rotr(self, ushort[<*>] shift)
```

---

#### `macro`
```c3
macro short[<*>].popcount(self)
```

---

#### `macro`
```c3
macro short[<*>].ctz(self)
```

---

#### `macro`
```c3
macro short[<*>].clz(self)
```

---

#### `macro`
```c3
macro short[<*>] short[<*>].fshl(hi, short[<*>] lo, short[<*>] shift)
```

---

#### `macro`
```c3
macro short[<*>] short[<*>].fshr(hi, short[<*>] lo, short[<*>] shift)
```

---

#### `macro`
```c3
macro short[<*>] short[<*>].rotl(self, short[<*>] shift)
```

---

#### `macro`
```c3
macro short[<*>] short[<*>].rotr(self, short[<*>] shift)
```

---

#### `macro`
```c3
macro char[<*>].popcount(self)
```

---

#### `macro`
```c3
macro char[<*>].ctz(self)
```

---

#### `macro`
```c3
macro char[<*>].clz(self)
```

---

#### `macro`
```c3
macro char[<*>] char[<*>].fshl(hi, char[<*>] lo, char[<*>] shift)
```

---

#### `macro`
```c3
macro char[<*>] char[<*>].fshr(hi, char[<*>] lo, char[<*>] shift)
```

---

#### `macro`
```c3
macro char[<*>] char[<*>].rotl(self, char[<*>] shift)
```

---

#### `macro`
```c3
macro char[<*>] char[<*>].rotr(self, char[<*>] shift)
```

---

#### `macro`
```c3
macro ichar[<*>].popcount(self)
```

---

#### `macro`
```c3
macro ichar[<*>].ctz(self)
```

---

#### `macro`
```c3
macro ichar[<*>].clz(self)
```

---

#### `macro`
```c3
macro ichar[<*>] ichar[<*>].fshl(hi, ichar[<*>] lo, ichar[<*>] shift)
```

---

#### `macro`
```c3
macro ichar[<*>] ichar[<*>].fshr(hi, ichar[<*>] lo, ichar[<*>] shift)
```

---

#### `macro`
```c3
macro ichar[<*>] ichar[<*>].rotl(self, ichar[<*>] shift)
```

---

#### `macro`
```c3
macro ichar[<*>] ichar[<*>].rotr(self, ichar[<*>] shift)
```

---

#### `macro`
```c3
macro ulong[<*>].popcount(self)
```

---

#### `macro`
```c3
macro ulong[<*>].ctz(self)
```

---

#### `macro`
```c3
macro ulong[<*>].clz(self)
```

---

#### `macro`
```c3
macro ulong[<*>] ulong[<*>].fshl(hi, ulong[<*>] lo, ulong[<*>] shift)
```

---

#### `macro`
```c3
macro ulong[<*>] ulong[<*>].fshr(hi, ulong[<*>] lo, ulong[<*>] shift)
```

---

#### `macro`
```c3
macro ulong[<*>] ulong[<*>].rotl(self, ulong[<*>] shift)
```

---

#### `macro`
```c3
macro ulong[<*>] ulong[<*>].rotr(self, ulong[<*>] shift)
```

---

#### `macro`
```c3
macro long[<*>].popcount(self)
```

---

#### `macro`
```c3
macro long[<*>].ctz(self)
```

---

#### `macro`
```c3
macro long[<*>].clz(self)
```

---

#### `macro`
```c3
macro long[<*>] long[<*>].fshl(hi, long[<*>] lo, long[<*>] shift)
```

---

#### `macro`
```c3
macro long[<*>] long[<*>].fshr(hi, long[<*>] lo, long[<*>] shift)
```

---

#### `macro`
```c3
macro long[<*>] long[<*>].rotl(self, long[<*>] shift)
```

---

#### `macro`
```c3
macro long[<*>] long[<*>].rotr(self, long[<*>] shift)
```

---

#### `macro`
```c3
macro uint128[<*>].popcount(self)
```

---

#### `macro`
```c3
macro uint128[<*>].ctz(self)
```

---

#### `macro`
```c3
macro uint128[<*>].clz(self)
```

---

#### `macro`
```c3
macro uint128[<*>] uint128[<*>].fshl(hi, uint128[<*>] lo, uint128[<*>] shift)
```

---

#### `macro`
```c3
macro uint128[<*>] uint128[<*>].fshr(hi, uint128[<*>] lo, uint128[<*>] shift)
```

---

#### `macro`
```c3
macro uint128[<*>] uint128[<*>].rotl(self, uint128[<*>] shift)
```

---

#### `macro`
```c3
macro uint128[<*>] uint128[<*>].rotr(self, uint128[<*>] shift)
```

---

#### `macro`
```c3
macro int128[<*>].popcount(self)
```

---

#### `macro`
```c3
macro int128[<*>].ctz(self)
```

---

#### `macro`
```c3
macro int128[<*>].clz(self)
```

---

#### `macro`
```c3
macro int128[<*>] int128[<*>].fshl(hi, int128[<*>] lo, int128[<*>] shift)
```

---

#### `macro`
```c3
macro int128[<*>] int128[<*>].fshr(hi, int128[<*>] lo, int128[<*>] shift)
```

---

#### `macro`
```c3
macro int128[<*>] int128[<*>].rotl(self, int128[<*>] shift)
```

---

#### `macro`
```c3
macro int128[<*>] int128[<*>].rotr(self, int128[<*>] shift)
```

---

#### `macro`
```c3
macro uint.popcount(self)
```

---

#### `macro`
```c3
macro uint.ctz(self)
```

---

#### `macro`
```c3
macro uint.clz(self)
```

---

#### `macro`
```c3
macro uint uint.fshl(hi, uint lo, uint shift)
```

---

#### `macro`
```c3
macro uint uint.fshr(hi, uint lo, uint shift)
```

---

#### `macro`
```c3
macro uint uint.rotl(self, uint shift)
```

---

#### `macro`
```c3
macro uint uint.rotr(self, uint shift)
```

---

#### `macro`
```c3
macro int.popcount(self)
```

---

#### `macro`
```c3
macro int.ctz(self)
```

---

#### `macro`
```c3
macro int.clz(self)
```

---

#### `macro`
```c3
macro int int.fshl(hi, int lo, int shift)
```

---

#### `macro`
```c3
macro int int.fshr(hi, int lo, int shift)
```

---

#### `macro`
```c3
macro int int.rotl(self, int shift)
```

---

#### `macro`
```c3
macro int int.rotr(self, int shift)
```

---

#### `macro`
```c3
macro ushort.popcount(self)
```

---

#### `macro`
```c3
macro ushort.ctz(self)
```

---

#### `macro`
```c3
macro ushort.clz(self)
```

---

#### `macro`
```c3
macro ushort ushort.fshl(hi, ushort lo, ushort shift)
```

---

#### `macro`
```c3
macro ushort ushort.fshr(hi, ushort lo, ushort shift)
```

---

#### `macro`
```c3
macro ushort ushort.rotl(self, ushort shift)
```

---

#### `macro`
```c3
macro ushort ushort.rotr(self, ushort shift)
```

---

#### `macro`
```c3
macro short.popcount(self)
```

---

#### `macro`
```c3
macro short.ctz(self)
```

---

#### `macro`
```c3
macro short.clz(self)
```

---

#### `macro`
```c3
macro short short.fshl(hi, short lo, short shift)
```

---

#### `macro`
```c3
macro short short.fshr(hi, short lo, short shift)
```

---

#### `macro`
```c3
macro short short.rotl(self, short shift)
```

---

#### `macro`
```c3
macro short short.rotr(self, short shift)
```

---

#### `macro`
```c3
macro char.popcount(self)
```

---

#### `macro`
```c3
macro char.ctz(self)
```

---

#### `macro`
```c3
macro char.clz(self)
```

---

#### `macro`
```c3
macro char char.fshl(hi, char lo, char shift)
```

---

#### `macro`
```c3
macro char char.fshr(hi, char lo, char shift)
```

---

#### `macro`
```c3
macro char char.rotl(self, char shift)
```

---

#### `macro`
```c3
macro char char.rotr(self, char shift)
```

---

#### `macro`
```c3
macro ichar.popcount(self)
```

---

#### `macro`
```c3
macro ichar.ctz(self)
```

---

#### `macro`
```c3
macro ichar.clz(self)
```

---

#### `macro`
```c3
macro ichar ichar.fshl(hi, ichar lo, ichar shift)
```

---

#### `macro`
```c3
macro ichar ichar.fshr(hi, ichar lo, ichar shift)
```

---

#### `macro`
```c3
macro ichar ichar.rotl(self, ichar shift)
```

---

#### `macro`
```c3
macro ichar ichar.rotr(self, ichar shift)
```

---

#### `macro`
```c3
macro ulong.popcount(self)
```

---

#### `macro`
```c3
macro ulong.ctz(self)
```

---

#### `macro`
```c3
macro ulong.clz(self)
```

---

#### `macro`
```c3
macro ulong ulong.fshl(hi, ulong lo, ulong shift)
```

---

#### `macro`
```c3
macro ulong ulong.fshr(hi, ulong lo, ulong shift)
```

---

#### `macro`
```c3
macro ulong ulong.rotl(self, ulong shift)
```

---

#### `macro`
```c3
macro ulong ulong.rotr(self, ulong shift)
```

---

#### `macro`
```c3
macro long.popcount(self)
```

---

#### `macro`
```c3
macro long.ctz(self)
```

---

#### `macro`
```c3
macro long.clz(self)
```

---

#### `macro`
```c3
macro long long.fshl(hi, long lo, long shift)
```

---

#### `macro`
```c3
macro long long.fshr(hi, long lo, long shift)
```

---

#### `macro`
```c3
macro long long.rotl(self, long shift)
```

---

#### `macro`
```c3
macro long long.rotr(self, long shift)
```

---

#### `macro`
```c3
macro uint128.popcount(self)
```

---

#### `macro`
```c3
macro uint128.ctz(self)
```

---

#### `macro`
```c3
macro uint128.clz(self)
```

---

#### `macro`
```c3
macro uint128 uint128.fshl(hi, uint128 lo, uint128 shift)
```

---

#### `macro`
```c3
macro uint128 uint128.fshr(hi, uint128 lo, uint128 shift)
```

---

#### `macro`
```c3
macro uint128 uint128.rotl(self, uint128 shift)
```

---

#### `macro`
```c3
macro uint128 uint128.rotr(self, uint128 shift)
```

---

#### `macro`
```c3
macro int128.popcount(self)
```

---

#### `macro`
```c3
macro int128.ctz(self)
```

---

#### `macro`
```c3
macro int128.clz(self)
```

---

#### `macro`
```c3
macro int128 int128.fshl(hi, int128 lo, int128 shift)
```

---

#### `macro`
```c3
macro int128 int128.fshr(hi, int128 lo, int128 shift)
```

---

#### `macro`
```c3
macro int128 int128.rotl(self, int128 shift)
```

---

#### `macro`
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

#### `func`
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

#### `func`
```c3
<*
 @param initial_capacity : "The initial capacity to reserve"
*>
fn AnyList* AnyList.tinit(&self, usz initial_capacity = 16)
```


Initialize the list using the temp allocator.

---

#### `func`
```c3
fn bool AnyList.is_initialized(&self) @inline
```

---

#### `macro`
```c3
macro void AnyList.push(&self, element)
```

Push an element on the list by cloning it.

---

#### `func`
```c3
fn void AnyList.free_element(&self, any element) @inline
```

Free a retained element removed using *_retained.

---

#### `macro`
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

#### `func`
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

#### `func`
```c3
<*
 @return "A temp copy of the last value if it exists"
 @return? NO_MORE_ELEMENT
*>
fn any? AnyList.tcopy_pop(&self)
```


Copy the last value, pop it and return the copy of it.

---

#### `func`
```c3
<*
 @return "The last value if it exists"
 @return? NO_MORE_ELEMENT
*>
fn any? AnyList.pop_retained(&self)
```


Pop the last value. It must later be released using `list.free_element()`.

---

#### `func`
```c3
fn void AnyList.clear(&self)
```

Remove all elements in the list.

---

#### `macro`
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

#### `func`
```c3
<*
 @return "The first value if it exists"
 @return? NO_MORE_ELEMENT
*>
fn any? AnyList.pop_first_retained(&self)
```


Pop the first value. It must later be released using `list.free_element()`.

---

#### `func`
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

#### `func`
```c3
<*
 @return "A temp copy of the first value if it exists"
 @return? NO_MORE_ELEMENT
*>
fn any? AnyList.tcopy_pop_first(&self)
```


Copy the first value, pop it and return the temp copy of it.

---

#### `func`
```c3
<*
 @param index : "The index of the element to remove"
 @require index < self.size
*>
fn void AnyList.remove_at(&self, usz index)
```


Remove the element at the particular index.

---

#### `func`
```c3
<*
 @param [&in] other_list : "The list to add"
*>
fn void AnyList.add_all(&self, AnyList* other_list)
```


Add all the elements in another AnyList.

---

#### `func`
```c3
fn void AnyList.reverse(&self)
```

Reverse the order of the elements in the list.

---

#### `func`
```c3
<*
 @return "The slice view"
*>
fn any[] AnyList.array_view(&self)
```


Return a view of the data as a slice.

---

#### `macro`
```c3
<*
 @param value : "The value to push to the list"
*>
macro void AnyList.push_front(&self, value)
```


Push an element to the front of the list.

---

#### `macro`
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

#### `func`
```c3
<*
 @require self.size > 0 : "The list was already empty"
*>
fn void AnyList.remove_last(&self)
```


Remove the last element in the list. The list may not be empty.

---

#### `func`
```c3
<*
 @require self.size > 0
*>
fn void AnyList.remove_first(&self)
```


Remove the first element in the list, the list may not be empty.

---

#### `macro`
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

#### `func`
```c3
<*
 @return "The first element"
 @return? NO_MORE_ELEMENT
*>
fn any? AnyList.first_any(&self) @inline
```


Return the first element

---

#### `macro`
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

#### `func`
```c3
<*
 @return "The last element"
 @return? NO_MORE_ELEMENT
*>
fn any? AnyList.last_any(&self) @inline
```


Return the last element

---

#### `func`
```c3
<*
 @return "True if the list is empty"
*>
fn bool AnyList.is_empty(&self) @inline
```


Return whether the list is empty.

---

#### `func`
```c3
<*
 @return "The number of elements in the list"
*>
fn usz AnyList.len(&self) @operator(len) @inline
```


Return the length of the list.

---

#### `macro`
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

#### `func`
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

#### `func`
```c3
fn void AnyList.free(&self)
```

Completely free and clear a list.

---

#### `func`
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

#### `func`
```c3
fn usz? AnyList.to_format(&self, Formatter* formatter) @dynamic
```

Print the list to a formatter.

---

#### `func`
```c3
<*
 @param filter : "The function to determine if it should be removed or not"
 @return "the number of deleted elements"
*>
fn usz AnyList.remove_if(&self, AnyPredicate filter)
```


Remove any elements matching the predicate.

---

#### `func`
```c3
<*
 @param selection : "The function to determine if it should be kept or not"
 @return "the number of deleted elements"
*>
fn usz AnyList.retain_if(&self, AnyPredicate selection)
```


Retain the elements matching the predicate.

---

#### `func`
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

#### `func`
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

#### `func`
```c3
<*
 @param min_capacity : "The min capacity to hold"
*>
fn void AnyList.reserve(&self, usz min_capacity)
```


Reserve memory so that at least the `min_capacity` exists.

---

#### `macro`
```c3
<*
 @param index : "The index where to set the value."
 @param value : "The value to set"
 @require index <= self.size : "Index out of range"
*>
macro void AnyList.set(&self, usz index, value)
```


Set the element at any index.
### `std::collections::bitset {SIZE}`

---

#### `BITS`
```c3
const BITS
```

---

#### `SZ`
```c3
const SZ
```

---

#### `BitSet`
```c3
struct BitSet
```

---

#### `func`
```c3
<*
 @return "The number of bits set"
*>
fn usz BitSet.cardinality(&self)
```


---

#### `func`
```c3
<*
 @param i : "The index to set"
 @require i < SIZE : "Index was out of range"
*>
fn void BitSet.set(&self, usz i)
```


Set a bit in the bitset.

---

#### `macro`
```c3
<*
 @param set : "The bit set to xor with"
 @return "The resulting bit set"
*>
macro BitSet BitSet.xor_self(&self, BitSet set) @operator(^=)
```


Perform xor over all bits, mutating itself

---

#### `func`
```c3
<*
 @param set : "The bit set to xor with"
 @return "The resulting bit set"
*>
fn BitSet BitSet.xor(&self, BitSet set) @operator(^)
```


Perform xor over all bits, returning a new bit set.

---

#### `func`
```c3
<*
 @param set : "The bit set to xor with"
 @return "The resulting bit set"
*>
fn BitSet BitSet.or(&self, BitSet set) @operator(|)
```


Perform or over all bits, returning a new bit set.

---

#### `macro`
```c3
<*
 @param set : "The bit set to xor with"
 @return "The resulting bit set"
*>
macro BitSet BitSet.or_self(&self, BitSet set) @operator(|=)
```


Perform or over all bits, mutating itself

---

#### `func`
```c3
<*
 @param set : "The bit set to xor with"
 @return "The resulting bit set"
*>
fn BitSet BitSet.and(&self, BitSet set) @operator(&)
```


Perform & over all bits, returning a new bit set.

---

#### `macro`
```c3
<*
 @param set : "The bit set to xor with"
 @return "The resulting bit set"
*>
macro BitSet BitSet.and_self(&self, BitSet set) @operator(&=)
```


Perform & over all bits, mutating itself.

---

#### `func`
```c3
<*
 @param i : "The index to set"
 @require i < SIZE : "Index was out of range"
*>
fn void BitSet.unset(&self, usz i)
```


Unset (clear) a bit in the bitset.

---

#### `func`
```c3
<*
 @param i : "The index of the bit"
 @require i < SIZE : "Index was out of range"
*>
fn bool BitSet.get(&self, usz i) @operator([]) @inline
```


Get a particular bit in the bitset

---

#### `func`
```c3
fn usz BitSet.len(&self) @operator(len) @inline
```

---

#### `func`
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
const INITIAL_CAPACITY
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

#### `func`
```c3
<*
 @param [&inout] allocator : "The allocator to use"
 @param capacity : "Maximum capacity (0 for unbounded)"
 @require !self.is_initialized() : "Queue was already initialized"
*>
fn LinkedBlockingQueue* LinkedBlockingQueue.init(&self, Allocator allocator, usz capacity = 0)
```


---

#### `func`
```c3
fn LinkedBlockingQueue* LinkedBlockingQueue.tinit(&self, usz capacity = 0)
```

---

#### `func`
```c3
<*
 @require self.is_initialized() : "Queue must be initialized"
*>
fn void LinkedBlockingQueue.free(&self)
```


---

#### `func`
```c3
<*
 @param value : "Value to add to the queue"
 @require self.is_initialized() : "Queue must be initialized"
*>
fn void LinkedBlockingQueue.push(&self, Value value)
```


---

#### `func`
```c3
<*
 @require self.is_initialized() : "Queue must be initialized"
 @return "The removed value"
*>
fn Value LinkedBlockingQueue.poll(&self)
```


Get a value from the queue, blocking if there is no element in the queue.

---

#### `func`
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

#### `func`
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

#### `func`
```c3
<*
 @require self.is_initialized() : "Queue must be initialized"
 @return "Current size of the queue"
*>
fn usz LinkedBlockingQueue.size(&self)
```


---

#### `func`
```c3
<*
 @require self.is_initialized() : "Queue must be initialized"
 @return "True if queue is empty"
*>
fn bool LinkedBlockingQueue.is_empty(&self)
```


---

#### `func`
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

#### `func`
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

#### `func`
```c3
<*
 @require self.is_initialized() : "Queue must be initialized"
 @return "The head value or NO_MORE_ELEMENT? if queue is empty"
*>
fn Value? LinkedBlockingQueue.peek(&self)
```


---

#### `func`
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
const ELEMENT_IS_EQUATABLE
```

---

#### `ELEMENT_IS_POINTER`
```c3
const ELEMENT_IS_POINTER
```

---

#### `macro`
```c3
macro type_is_overaligned()
```

---

#### `ElasticArray`
```c3
struct ElasticArray (Printable)
```

---

#### `func`
```c3
fn usz? ElasticArray.to_format(&self, Formatter* formatter) @dynamic
```

---

#### `func`
```c3
fn String ElasticArray.to_tstring(&self)
```

---

#### `func`
```c3
fn void? ElasticArray.push_try(&self, Type element) @inline
```

---

#### `func`
```c3
<*
 @require self.size < MAX_SIZE : `Tried to exceed the max size`
*>
fn void ElasticArray.push(&self, Type element) @inline
```


---

#### `func`
```c3
fn Type? ElasticArray.pop(&self)
```

---

#### `func`
```c3
fn void ElasticArray.clear(&self)
```

---

#### `func`
```c3
<*
 @require self.size > 0
*>
fn Type? ElasticArray.pop_first(&self)
```


---

#### `func`
```c3
<*
 @require index < self.size
*>
fn void ElasticArray.remove_at(&self, usz index)
```


---

#### `func`
```c3
<*
 @require other_list.size + self.size <= MAX_SIZE
*>
fn void ElasticArray.add_all(&self, ElasticArray* other_list)
```


---

#### `func`
```c3
fn usz ElasticArray.add_all_to_limit(&self, ElasticArray* other_list)
```

Add as many elements as possible to the new array,
returning the number of elements that didn't fit.

---

#### `func`
```c3
<*
 @param [in] array
*>
fn usz ElasticArray.add_array_to_limit(&self, Type[] array)
```


Add as many values from this array as possible, returning the
number of elements that didn't fit.

---

#### `func`
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

#### `func`
```c3
fn Type[] ElasticArray.to_aligned_array(&self, Allocator allocator)
```

IMPORTANT The returned array must be freed using free_aligned.

---

#### `macro`
```c3
<*
 @require !type_is_overaligned() : "This function is not available on overaligned types"
*>
macro Type[] ElasticArray.to_array(&self, Allocator allocator)
```


---

#### `func`
```c3
fn Type[] ElasticArray.to_tarray(&self)
```

---

#### `func`
```c3
fn void ElasticArray.reverse(&self)
```

Reverse the elements in a list.

---

#### `func`
```c3
fn Type[] ElasticArray.array_view(&self)
```

---

#### `func`
```c3
<*
 @require self.size < MAX_SIZE : `List would exceed max size`
*>
fn void ElasticArray.push_front(&self, Type type) @inline
```


---

#### `func`
```c3
<*
 @require self.size < MAX_SIZE : `List would exceed max size`
*>
fn void? ElasticArray.push_front_try(&self, Type type) @inline
```


---

#### `func`
```c3
<*
 @require index <= self.size
*>
fn void? ElasticArray.insert_at_try(&self, usz index, Type value)
```


---

#### `func`
```c3
<*
 @require self.size < MAX_SIZE : `List would exceed max size`
 @require index <= self.size
*>
fn void ElasticArray.insert_at(&self, usz index, Type type)
```


---

#### `func`
```c3
<*
 @require index < self.size
*>
fn void ElasticArray.set_at(&self, usz index, Type type)
```


---

#### `func`
```c3
fn void? ElasticArray.remove_last(&self) @maydiscard
```

---

#### `func`
```c3
fn void? ElasticArray.remove_first(&self) @maydiscard
```

---

#### `func`
```c3
fn Type? ElasticArray.first(&self)
```

---

#### `func`
```c3
fn Type? ElasticArray.last(&self)
```

---

#### `func`
```c3
fn bool ElasticArray.is_empty(&self) @inline
```

---

#### `func`
```c3
fn usz ElasticArray.byte_size(&self) @inline
```

---

#### `func`
```c3
fn usz ElasticArray.len(&self) @operator(len) @inline
```

---

#### `func`
```c3
fn Type ElasticArray.get(&self, usz index) @inline
```

---

#### `func`
```c3
fn void ElasticArray.swap(&self, usz i, usz j)
```

---

#### `func`
```c3
<*
 @param filter : "The function to determine if it should be removed or not"
 @return "the number of deleted elements"
*>
fn usz ElasticArray.remove_if(&self, ElementPredicate filter)
```


---

#### `func`
```c3
<*
 @param selection : "The function to determine if it should be kept or not"
 @return "the number of deleted elements"
*>
fn usz ElasticArray.retain_if(&self, ElementPredicate selection)
```


---

#### `func`
```c3
fn usz ElasticArray.remove_using_test(&self, ElementTest filter, any context)
```

---

#### `func`
```c3
fn usz ElasticArray.retain_using_test(&self, ElementTest filter, any context)
```

---

#### `macro`
```c3
macro Type ElasticArray.@item_at(&self, usz index) @operator([])
```

---

#### `func`
```c3
fn Type* ElasticArray.get_ref(&self, usz index) @operator(&[]) @inline
```

---

#### `func`
```c3
fn void ElasticArray.set(&self, usz index, Type value) @operator([]=)
```

---

#### `func`
```c3
fn usz? ElasticArray.index_of(&self, Type type) @if(ELEMENT_IS_EQUATABLE)
```

---

#### `func`
```c3
fn usz? ElasticArray.rindex_of(&self, Type type) @if(ELEMENT_IS_EQUATABLE)
```

---

#### `func`
```c3
fn bool ElasticArray.equals(&self, ElasticArray other_list) @if(ELEMENT_IS_EQUATABLE)
```

---

#### `func`
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

#### `func`
```c3
<*
 @param [&inout] self : "The list to remove elements from"
 @param value : "The value to remove"
 @return "true if the value was found"
*>
fn bool ElasticArray.remove_last_item(&self, Type value) @if(ELEMENT_IS_EQUATABLE)
```


---

#### `func`
```c3
<*
 @param [&inout] self : "The list to remove elements from"
 @param value : "The value to remove"
 @return "true if the value was found"
*>
fn bool ElasticArray.remove_first_item(&self, Type value) @if(ELEMENT_IS_EQUATABLE)
```


---

#### `func`
```c3
<*
 @param [&inout] self : "The list to remove elements from"
 @param value : "The value to remove"
 @return "the number of deleted elements."
*>
fn usz ElasticArray.remove_item(&self, Type value) @if(ELEMENT_IS_EQUATABLE)
```


---

#### `func`
```c3
fn void ElasticArray.remove_all_from(&self, ElasticArray* other_list) @if(ELEMENT_IS_EQUATABLE)
```

---

#### `func`
```c3
<*
 @param [&in] self
 @return "The number non-null values in the list"
*>
fn usz ElasticArray.compact_count(&self) @if(ELEMENT_IS_POINTER)
```


---

#### `func`
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

#### `func`
```c3
fn void EnumMap.init(&self, ValueType init_value)
```

---

#### `func`
```c3
fn usz? EnumMap.to_format(&self, Formatter* formatter) @dynamic
```

---

#### `func`
```c3
<*
 @return "The total size of this map, which is the same as the number of enum values"
 @pure
*>
fn usz EnumMap.len(&self) @operator(len) @inline
```


---

#### `func`
```c3
<*
 @return "Retrieve a value given the underlying enum, if there is no entry, then the zero value for the value is returned."
*>
fn ValueType EnumMap.get(&self, Enum key) @operator([]) @inline
```


---

#### `func`
```c3
fn ValueType* EnumMap.get_ref(&self, Enum key) @operator(&[]) @inline
```

---

#### `func`
```c3
fn void EnumMap.set(&self, Enum key, ValueType value) @operator([]=) @inline
```
### `std::collections::enumset{Enum}`

---

#### `IS_CHAR_ARRAY`
```c3
const IS_CHAR_ARRAY
```

---

#### `EnumSet`
```c3
typedef EnumSet (Printable) = EnumSetType
```

---

#### `func`
```c3
fn void EnumSet.add(&self, Enum v)
```

---

#### `func`
```c3
fn void EnumSet.clear(&self)
```

---

#### `func`
```c3
fn bool EnumSet.remove(&self, Enum v)
```

---

#### `func`
```c3
fn bool EnumSet.has(&self, Enum v)
```

---

#### `func`
```c3
fn void EnumSet.add_all(&self, EnumSet s)
```

---

#### `func`
```c3
fn void EnumSet.retain_all(&self, EnumSet s)
```

---

#### `func`
```c3
fn void EnumSet.remove_all(&self, EnumSet s)
```

---

#### `func`
```c3
fn EnumSet EnumSet.and_of(&self, EnumSet s)
```

---

#### `func`
```c3
fn EnumSet EnumSet.or_of(&self, EnumSet s)
```

---

#### `func`
```c3
fn EnumSet EnumSet.diff_of(&self, EnumSet s)
```

---

#### `func`
```c3
fn EnumSet EnumSet.xor_of(&self, EnumSet s)
```

---

#### `func`
```c3
fn usz? EnumSet.to_format(&set, Formatter* formatter) @dynamic
```
### `std::collections::growablebitset{Type}`

---

#### `BITS`
```c3
const BITS
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

#### `func`
```c3
<*
 @param initial_capacity
 @param [&inout] allocator : "The allocator to use, defaults to the heap allocator"
*>
fn GrowableBitSet* GrowableBitSet.init(&self, Allocator allocator, usz initial_capacity = 1)
```


---

#### `func`
```c3
fn GrowableBitSet* GrowableBitSet.tinit(&self, usz initial_capacity = 1)
```

---

#### `func`
```c3
fn void GrowableBitSet.free(&self)
```

---

#### `func`
```c3
fn usz GrowableBitSet.cardinality(&self)
```

---

#### `func`
```c3
fn void GrowableBitSet.set(&self, usz i)
```

---

#### `func`
```c3
fn void GrowableBitSet.unset(&self, usz i)
```

---

#### `func`
```c3
fn bool GrowableBitSet.get(&self, usz i) @operator([]) @inline
```

---

#### `func`
```c3
fn usz GrowableBitSet.len(&self) @operator(len)
```

---

#### `func`
```c3
fn void GrowableBitSet.set_bool(&self, usz i, bool value) @operator([]=) @inline
```
### `std::collections::linkedlist{Type}`

---

#### `ELEMENT_IS_EQUATABLE`
```c3
const ELEMENT_IS_EQUATABLE
```

---

#### `LinkedList`
```c3
struct LinkedList
```

---

#### `func`
```c3
<*
 @param [&inout] allocator : "The allocator to use, defaults to the heap allocator"
 @return "the initialized list"
*>
fn LinkedList* LinkedList.init(&self, Allocator allocator)
```


---

#### `func`
```c3
fn LinkedList* LinkedList.tinit(&self)
```

---

#### `func`
```c3
fn bool LinkedList.is_initialized(&self) @inline
```

---

#### `func`
```c3
fn void LinkedList.push_front(&self, Type value)
```

---

#### `func`
```c3
fn void LinkedList.push(&self, Type value)
```

---

#### `func`
```c3
fn Type? LinkedList.peek(&self)
```

---

#### `func`
```c3
fn Type? LinkedList.peek_last(&self)
```

---

#### `func`
```c3
fn Type? LinkedList.first(&self)
```

---

#### `func`
```c3
fn Type? LinkedList.last(&self)
```

---

#### `func`
```c3
fn void LinkedList.free(&self)
```

---

#### `func`
```c3
fn void LinkedList.clear(&self)
```

---

#### `func`
```c3
fn usz LinkedList.len(&self) @inline
```

---

#### `macro`
```c3
<*
 @require index < self.size
*>
macro Node* LinkedList.node_at_index(&self, usz index)
```


---

#### `func`
```c3
<*
 @require index < self.size
*>
fn Type LinkedList.get(&self, usz index)
```


---

#### `func`
```c3
<*
 @require index < self.size
*>
fn void LinkedList.set(&self, usz index, Type element)
```


---

#### `func`
```c3
<*
 @require index < self.size
*>
fn void LinkedList.remove_at(&self, usz index)
```


---

#### `func`
```c3
<*
 @require index <= self.size
*>
fn void LinkedList.insert_at(&self, usz index, Type element)
```


---

#### `func`
```c3
fn usz LinkedList.remove(&self, Type t) @if(ELEMENT_IS_EQUATABLE)
```

---

#### `func`
```c3
fn Type? LinkedList.pop(&self)
```

---

#### `func`
```c3
fn bool LinkedList.is_empty(&self)
```

---

#### `func`
```c3
fn Type? LinkedList.pop_front(&self)
```

---

#### `func`
```c3
fn void? LinkedList.remove_last(&self) @maydiscard
```

---

#### `func`
```c3
fn void? LinkedList.remove_first(&self) @maydiscard
```

---

#### `func`
```c3
fn bool LinkedList.remove_first_match(&self, Type t) @if(ELEMENT_IS_EQUATABLE)
```

---

#### `func`
```c3
fn bool LinkedList.remove_last_match(&self, Type t)  @if(ELEMENT_IS_EQUATABLE)
```
### `std::collections::list_common`

---

#### `macro`
```c3
macro list_to_aligned_array($Type, self, Allocator allocator)
```

IMPORTANT The returned array must be freed using free_aligned.

---

#### `macro`
```c3
macro list_to_array($Type, self, Allocator allocator)
```

---

#### `macro`
```c3
macro void list_reverse(self)
```

---

#### `macro`
```c3
macro usz list_remove_using_test(self, filter, bool $invert, ctx)
```

---

#### `macro`
```c3
macro usz list_compact(self)
```

---

#### `macro`
```c3
macro usz list_remove_item(self, value)
```

---

#### `macro`
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
const ELEMENT_IS_EQUATABLE
```

---

#### `ELEMENT_IS_POINTER`
```c3
const ELEMENT_IS_POINTER
```

---

#### `LIST_HEAP_ALLOCATOR`
```c3
const Allocator LIST_HEAP_ALLOCATOR
```

---

#### `ONHEAP`
```c3
const List ONHEAP
```

---

#### `macro`
```c3
macro type_is_overaligned()
```

---

#### `List`
```c3
struct List (Printable)
```

---

#### `func`
```c3
<*
 @param initial_capacity : "The initial capacity to reserve"
 @param [&inout] allocator : "The allocator to use, defaults to the heap allocator"
*>
fn List* List.init(&self, Allocator allocator, usz initial_capacity = 16)
```


---

#### `func`
```c3
<*
 @param initial_capacity : "The initial capacity to reserve"
*>
fn List* List.tinit(&self, usz initial_capacity = 16)
```


Initialize the list using the temp allocator.

---

#### `func`
```c3
<*
 @param [in] values : `The values to initialize the list with.`
 @require self.size == 0 : "The List must be empty"
*>
fn List* List.init_with_array(&self, Allocator allocator, Type[] values)
```


Initialize a new list with an array.

---

#### `func`
```c3
<*
 @param [in] values : `The values to initialize the list with.`
 @require self.size == 0 : "The List must be empty"
*>
fn List* List.tinit_with_array(&self, Type[] values)
```


Initialize a temporary list with an array.

---

#### `func`
```c3
<*
 @require !self.is_initialized() : "The List must not be allocated"
*>
fn void List.init_wrapping_array(&self, Allocator allocator, Type[] types)
```


---

#### `func`
```c3
fn bool List.is_initialized(&self) @inline
```

---

#### `func`
```c3
fn usz? List.to_format(&self, Formatter* formatter) @dynamic
```

---

#### `func`
```c3
fn void List.push(&self, Type element) @inline
```

---

#### `func`
```c3
fn Type? List.pop(&self)
```

---

#### `func`
```c3
fn void List.clear(&self)
```

---

#### `func`
```c3
fn Type? List.pop_first(&self)
```

---

#### `func`
```c3
<*
 @require index < self.size : `Removed element out of bounds`
*>
fn void List.remove_at(&self, usz index)
```


---

#### `func`
```c3
fn void List.add_all(&self, List* other_list)
```

---

#### `func`
```c3
fn Type[] List.to_aligned_array(&self, Allocator allocator)
```

IMPORTANT The returned array must be freed using free_aligned.

---

#### `macro`
```c3
<*
 @require !type_is_overaligned() : "This function is not available on overaligned types"
*>
macro Type[] List.to_array(&self, Allocator allocator)
```


---

#### `func`
```c3
fn Type[] List.to_tarray(&self)
```

---

#### `func`
```c3
fn void List.reverse(&self)
```

Reverse the elements in a list.

---

#### `func`
```c3
fn Type[] List.array_view(&self)
```

---

#### `func`
```c3
<*
 @param [in] array
 @ensure self.size >= array.len
*>
fn void List.add_array(&self, Type[] array)
```


Add the values of an array to this list.

---

#### `func`
```c3
fn void List.push_front(&self, Type type) @inline
```

---

#### `func`
```c3
<*
 @require index <= self.size : `Insert was out of bounds`
*>
fn void List.insert_at(&self, usz index, Type type)
```


---

#### `func`
```c3
<*
 @require index < self.size
*>
fn void List.set_at(&self, usz index, Type type)
```


---

#### `func`
```c3
fn void? List.remove_last(&self) @maydiscard
```

---

#### `func`
```c3
fn void? List.remove_first(&self) @maydiscard
```

---

#### `func`
```c3
fn Type? List.first(&self)
```

---

#### `func`
```c3
fn Type? List.last(&self)
```

---

#### `func`
```c3
fn bool List.is_empty(&self) @inline
```

---

#### `func`
```c3
fn usz List.byte_size(&self) @inline
```

---

#### `func`
```c3
fn usz List.len(&self) @operator(len) @inline
```

---

#### `func`
```c3
<*
 @require index < self.size : `Access out of bounds`
*>
fn Type List.get(&self, usz index) @inline
```


---

#### `func`
```c3
fn void List.free(&self)
```

---

#### `func`
```c3
<*
 @require i < self.size && j < self.size : `Access out of bounds`
*>
fn void List.swap(&self, usz i, usz j)
```


---

#### `func`
```c3
<*
 @param filter : "The function to determine if it should be removed or not"
 @return "the number of deleted elements"
*>
fn usz List.remove_if(&self, ElementPredicate filter)
```


---

#### `func`
```c3
<*
 @param selection : "The function to determine if it should be kept or not"
 @return "the number of deleted elements"
*>
fn usz List.retain_if(&self, ElementPredicate selection)
```


---

#### `func`
```c3
fn usz List.remove_using_test(&self, ElementTest filter, any context)
```

---

#### `func`
```c3
fn usz List.retain_using_test(&self, ElementTest filter, any context)
```

---

#### `macro`
```c3
<*
 @require index < self.size : `Access out of bounds`
*>
macro Type List.@item_at(&self, usz index) @operator([])
```


---

#### `func`
```c3
<*
 @require index < self.size : `Access out of bounds`
*>
fn Type* List.get_ref(&self, usz index) @operator(&[]) @inline
```


---

#### `func`
```c3
<*
 @require index < self.size : `Access out of bounds`
*>
fn void List.set(&self, usz index, Type value) @operator([]=)
```


---

#### `func`
```c3
fn void List.reserve(&self, usz added)
```

---

#### `func`
```c3
fn void List._update_size_change(&self,usz old_size, usz new_size)
```

---

#### `func`
```c3
fn usz? List.index_of(&self, Type type) @if(ELEMENT_IS_EQUATABLE)
```

---

#### `func`
```c3
fn usz? List.rindex_of(&self, Type type) @if(ELEMENT_IS_EQUATABLE)
```

---

#### `func`
```c3
fn bool List.equals(&self, List other_list) @if(ELEMENT_IS_EQUATABLE)
```

---

#### `func`
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

#### `func`
```c3
<*
 @param [&inout] self : "The list to remove elements from"
 @param value : "The value to remove"
 @return "true if the value was found"
*>
fn bool List.remove_last_item(&self, Type value) @if(ELEMENT_IS_EQUATABLE)
```


---

#### `func`
```c3
<*
 @param [&inout] self : "The list to remove elements from"
 @param value : "The value to remove"
 @return "true if the value was found"
*>
fn bool List.remove_first_item(&self, Type value) @if(ELEMENT_IS_EQUATABLE)
```


---

#### `func`
```c3
<*
 @param [&inout] self : "The list to remove elements from"
 @param value : "The value to remove"
 @return "the number of deleted elements."
*>
fn usz List.remove_item(&self, Type value) @if(ELEMENT_IS_EQUATABLE)
```


---

#### `func`
```c3
fn void List.remove_all_from(&self, List* other_list) @if(ELEMENT_IS_EQUATABLE)
```

---

#### `func`
```c3
<*
 @param [&in] self
 @return "The number non-null values in the list"
*>
fn usz List.compact_count(&self) @if(ELEMENT_IS_POINTER)
```


---

#### `func`
```c3
fn usz List.compact(&self) @if(ELEMENT_IS_POINTER)
```
### `std::collections::map{Key, Value}`

---

#### `DEFAULT_INITIAL_CAPACITY`
```c3
const uint DEFAULT_INITIAL_CAPACITY
```

---

#### `MAXIMUM_CAPACITY`
```c3
const uint MAXIMUM_CAPACITY
```

---

#### `DEFAULT_LOAD_FACTOR`
```c3
const float DEFAULT_LOAD_FACTOR
```

---

#### `VALUE_IS_EQUATABLE`
```c3
const VALUE_IS_EQUATABLE
```

---

#### `COPY_KEYS`
```c3
const bool COPY_KEYS
```

---

#### `MAP_HEAP_ALLOCATOR`
```c3
const Allocator MAP_HEAP_ALLOCATOR
```

---

#### `ONHEAP`
```c3
const HashMap ONHEAP
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

#### `func`
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

#### `func`
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

#### `macro`
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

#### `macro`
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

#### `func`
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

#### `func`
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

#### `func`
```c3
<*
 @param [&in] map : "The hash map we are testing"
 @return "Returns true if it has been initialized, false otherwise"
*>
fn bool HashMap.is_initialized(&map)
```


Has this hash map been initialized yet?

---

#### `func`
```c3
<*
 @param [&inout] allocator : "The allocator to use"
 @param [&in] other_map : "The map to copy from."
 @require !self.is_initialized() : "Map was already initialized"
*>
fn HashMap* HashMap.init_from_map(&self, Allocator allocator, HashMap* other_map)
```


---

#### `func`
```c3
<*
 @param [&in] other_map : "The map to copy from."
 @require !map.is_initialized() : "Map was already initialized"
*>
fn HashMap* HashMap.tinit_from_map(&map, HashMap* other_map)
```


---

#### `func`
```c3
fn bool HashMap.is_empty(&map) @inline
```

---

#### `func`
```c3
fn usz HashMap.len(&map) @inline
```

---

#### `func`
```c3
fn Value*? HashMap.get_ref(&map, Key key)
```

---

#### `func`
```c3
fn Entry*? HashMap.get_entry(&map, Key key)
```

---

#### `macro`
```c3
<*
 @require @assignable_to(#expr, Value)
*>
macro Value HashMap.@get_or_set(&map, Key key, Value #expr)
```


Get the value or update and

---

#### `func`
```c3
fn Value? HashMap.get(&map, Key key) @operator([])
```

---

#### `func`
```c3
fn bool HashMap.has_key(&map, Key key)
```

---

#### `func`
```c3
fn bool HashMap.set(&map, Key key, Value value) @operator([]=)
```

---

#### `func`
```c3
fn void? HashMap.remove(&map, Key key) @maydiscard
```

---

#### `func`
```c3
fn void HashMap.clear(&map)
```

---

#### `func`
```c3
fn void HashMap.free(&map)
```

---

#### `func`
```c3
fn Key[] HashMap.tkeys(&self)
```

---

#### `func`
```c3
fn Key[] HashMap.keys(&self, Allocator allocator)
```

---

#### `macro`
```c3
macro HashMap.@each(map; @body(key, value))
```

---

#### `macro`
```c3
macro HashMap.@each_entry(map; @body(entry))
```

---

#### `func`
```c3
fn Value[] HashMap.tvalues(&map)
```

---

#### `func`
```c3
fn Value[] HashMap.values(&self, Allocator allocator)
```

---

#### `func`
```c3
fn bool HashMap.has_value(&map, Value v) @if(VALUE_IS_EQUATABLE)
```

---

#### `func`
```c3
fn HashMapIterator HashMap.iter(&self)
```

---

#### `func`
```c3
fn HashMapValueIterator HashMap.value_iter(&self)
```

---

#### `func`
```c3
fn HashMapKeyIterator HashMap.key_iter(&self)
```

---

#### `func`
```c3
fn usz? HashMap.to_format(&self, Formatter* f) @dynamic
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

#### `func`
```c3
<*
 @require idx < self.map.count
*>
fn Entry HashMapIterator.get(&self, usz idx) @operator([])
```


---

#### `func`
```c3
fn Value HashMapValueIterator.get(&self, usz idx) @operator([])
```

---

#### `func`
```c3
fn Key HashMapKeyIterator.get(&self, usz idx) @operator([])
```

---

#### `func`
```c3
fn usz HashMapValueIterator.len(self) @operator(len)
```

---

#### `func`
```c3
fn usz HashMapKeyIterator.len(self) @operator(len)
```

---

#### `func`
```c3
fn usz HashMapIterator.len(self) @operator(len)
```

---

#### `LINKEDONHEAP`
```c3
const LinkedHashMap LINKEDONHEAP
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

#### `func`
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

#### `func`
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

#### `macro`
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

#### `macro`
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

#### `func`
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

#### `func`
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

#### `func`
```c3
<*
 @param [&in] map : "The hash map we are testing"
 @return "Returns true if it has been initialized, false otherwise"
*>
fn bool LinkedHashMap.is_initialized(&map)
```


Has this hash map been initialized yet?

---

#### `func`
```c3
<*
 @param [&inout] allocator : "The allocator to use"
 @param [&in] other_map : "The map to copy from."
 @require !self.is_initialized() : "Map was already initialized"
*>
fn LinkedHashMap* LinkedHashMap.init_from_map(&self, Allocator allocator, LinkedHashMap* other_map)
```


---

#### `func`
```c3
<*
 @param [&in] other_map : "The map to copy from."
 @require !map.is_initialized() : "Map was already initialized"
*>
fn LinkedHashMap* LinkedHashMap.tinit_from_map(&map, LinkedHashMap* other_map)
```


---

#### `func`
```c3
fn bool LinkedHashMap.is_empty(&map) @inline
```

---

#### `func`
```c3
fn usz LinkedHashMap.len(&map) @inline
```

---

#### `func`
```c3
fn Value*? LinkedHashMap.get_ref(&map, Key key)
```

---

#### `func`
```c3
fn LinkedEntry*? LinkedHashMap.get_entry(&map, Key key)
```

---

#### `macro`
```c3
<*
 @require @assignable_to(#expr, Value)
*>
macro Value LinkedHashMap.@get_or_set(&map, Key key, Value #expr)
```


Get the value or update and

---

#### `func`
```c3
fn Value? LinkedHashMap.get(&map, Key key) @operator([])
```

---

#### `func`
```c3
fn bool LinkedHashMap.has_key(&map, Key key)
```

---

#### `func`
```c3
fn bool LinkedHashMap.set(&map, Key key, Value value) @operator([]=)
```

---

#### `func`
```c3
fn void? LinkedHashMap.remove(&map, Key key) @maydiscard
```

---

#### `func`
```c3
fn void LinkedHashMap.clear(&map)
```

---

#### `func`
```c3
fn void LinkedHashMap.free(&map)
```

---

#### `func`
```c3
fn Key[] LinkedHashMap.tkeys(&self)
```

---

#### `func`
```c3
fn Key[] LinkedHashMap.keys(&self, Allocator allocator)
```

---

#### `macro`
```c3
macro LinkedHashMap.@each(map; @body(key, value))
```

---

#### `macro`
```c3
macro LinkedHashMap.@each_entry(map; @body(entry))
```

---

#### `func`
```c3
fn Value[] LinkedHashMap.tvalues(&map)
```

---

#### `func`
```c3
fn Value[] LinkedHashMap.values(&self, Allocator allocator)
```

---

#### `func`
```c3
fn bool LinkedHashMap.has_value(&map, Value v) @if(VALUE_IS_EQUATABLE)
```

---

#### `func`
```c3
fn LinkedHashMapIterator LinkedHashMap.iter(&self)
```

---

#### `func`
```c3
fn LinkedHashMapValueIterator LinkedHashMap.value_iter(&self)
```

---

#### `func`
```c3
fn LinkedHashMapKeyIterator LinkedHashMap.key_iter(&self)
```

---

#### `func`
```c3
fn bool LinkedHashMapIterator.next(&self)
```

---

#### `func`
```c3
fn LinkedEntry*? LinkedHashMapIterator.get(&self)
```

---

#### `func`
```c3
fn Value*? LinkedHashMapValueIterator.get(&self)
```

---

#### `func`
```c3
fn Key*? LinkedHashMapKeyIterator.get(&self)
```

---

#### `func`
```c3
fn bool LinkedHashMapIterator.has_next(&self)
```

---

#### `func`
```c3
fn usz? LinkedHashMap.to_format(&self, Formatter* f) @dynamic
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

#### `func`
```c3
fn usz LinkedHashMapValueIterator.len(self) @operator(len)
```

---

#### `func`
```c3
fn usz LinkedHashMapKeyIterator.len(self) @operator(len)
```

---

#### `func`
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

#### `func`
```c3
fn usz? Maybe.to_format(&self, Formatter* f) @dynamic
```

---

#### `func`
```c3
fn void Maybe.set(&self, Type val)
```

---

#### `func`
```c3
fn void Maybe.reset(&self)
```

---

#### `func`
```c3
fn Maybe value(Type val)
```

---

#### `EMPTY`
```c3
const Maybe EMPTY
```

---

#### `macro`
```c3
macro Type? Maybe.get(self)
```

---

#### `func`
```c3
fn bool Maybe.equals(self, Maybe other) @operator(==) @if(types::is_equatable_type(Type))
```
### `std::collections::object`

---

#### `TRUE_OBJECT`
```c3
const Object TRUE_OBJECT
```

---

#### `FALSE_OBJECT`
```c3
const Object FALSE_OBJECT
```

---

#### `NULL_OBJECT`
```c3
const Object NULL_OBJECT
```

---

#### `Object`
```c3
struct Object (Printable)
```

---

#### `func`
```c3
fn usz? Object.to_format(&self, Formatter* formatter) @dynamic
```

---

#### `func`
```c3
fn Object* new_obj(Allocator allocator)
```

---

#### `func`
```c3
fn Object* new_null()
```

---

#### `func`
```c3
fn Object* new_int(int128 i, Allocator allocator)
```

---

#### `macro`
```c3
macro Object* new_enum(e, Allocator allocator)
```

---

#### `func`
```c3
fn Object* new_float(double f, Allocator allocator)
```

---

#### `func`
```c3
fn Object* new_string(String s, Allocator allocator)
```

---

#### `func`
```c3
fn Object* new_bool(bool b)
```

---

#### `func`
```c3
fn void Object.free(&self)
```

---

#### `func`
```c3
fn bool Object.is_null(&self) @inline
```

---

#### `func`
```c3
fn bool Object.is_empty(&self) @inline
```

---

#### `func`
```c3
fn bool Object.is_map(&self) @inline
```

---

#### `func`
```c3
fn bool Object.is_array(&self) @inline
```

---

#### `func`
```c3
fn bool Object.is_bool(&self) @inline
```

---

#### `func`
```c3
fn bool Object.is_string(&self) @inline
```

---

#### `func`
```c3
fn bool Object.is_float(&self) @inline
```

---

#### `func`
```c3
fn bool Object.is_int(&self) @inline
```

---

#### `func`
```c3
fn bool Object.is_keyable(&self)
```

---

#### `func`
```c3
fn bool Object.is_indexable(&self)
```

---

#### `macro`
```c3
macro Object* Object.set(&self, String key, value)
```

---

#### `macro`
```c3
<*
 @require self.is_indexable()
*>
macro Object* Object.set_at(&self, usz index, String key, value)
```


---

#### `macro`
```c3
<*
 @require self.is_indexable()
 @ensure return != null
*>
macro Object* Object.push(&self, value)
```


---

#### `func`
```c3
<*
 @require self.is_keyable()
*>
fn Object*? Object.get(&self, String key)
```


---

#### `func`
```c3
fn bool Object.has_key(&self, String key)
```

---

#### `func`
```c3
<*
 @require self.is_indexable()
*>
fn Object* Object.get_at(&self, usz index)
```


---

#### `func`
```c3
<*
 @require self.is_indexable()
*>
fn usz Object.get_len(&self)
```


---

#### `func`
```c3
<*
 @require self.is_indexable()
*>
fn void Object.push_object(&self, Object* to_append)
```


---

#### `func`
```c3
<*
 @require self.is_indexable()
*>
fn void Object.set_object_at(&self, usz index, Object* to_set)
```


---

#### `macro`
```c3
<*
 @require $Type.kindof.is_int() : "Expected an integer type."
*>
macro get_integer_value(Object* value, $Type)
```


---

#### `func`
```c3
fn ichar? Object.get_ichar(&self, String key)
```

---

#### `func`
```c3
fn short? Object.get_short(&self, String key)
```

---

#### `func`
```c3
fn int? Object.get_int(&self, String key)
```

---

#### `func`
```c3
fn long? Object.get_long(&self, String key)
```

---

#### `func`
```c3
fn int128? Object.get_int128(&self, String key)
```

---

#### `func`
```c3
fn ichar? Object.get_ichar_at(&self, usz index)
```

---

#### `func`
```c3
fn short? Object.get_short_at(&self, usz index)
```

---

#### `func`
```c3
fn int? Object.get_int_at(&self, usz index)
```

---

#### `func`
```c3
fn long? Object.get_long_at(&self, usz index)
```

---

#### `func`
```c3
fn int128? Object.get_int128_at(&self, usz index)
```

---

#### `func`
```c3
fn char? Object.get_char(&self, String key)
```

---

#### `func`
```c3
fn short? Object.get_ushort(&self, String key)
```

---

#### `func`
```c3
fn uint? Object.get_uint(&self, String key)
```

---

#### `func`
```c3
fn ulong? Object.get_ulong(&self, String key)
```

---

#### `func`
```c3
fn uint128? Object.get_uint128(&self, String key)
```

---

#### `func`
```c3
fn char? Object.get_char_at(&self, usz index)
```

---

#### `func`
```c3
fn ushort? Object.get_ushort_at(&self, usz index)
```

---

#### `func`
```c3
fn uint? Object.get_uint_at(&self, usz index)
```

---

#### `func`
```c3
fn ulong? Object.get_ulong_at(&self, usz index)
```

---

#### `func`
```c3
fn uint128? Object.get_uint128_at(&self, usz index)
```

---

#### `func`
```c3
<*
 @require self.is_keyable()
*>
fn String? Object.get_string(&self, String key)
```


---

#### `func`
```c3
<*
 @require self.is_indexable()
*>
fn String? Object.get_string_at(&self, usz index)
```


---

#### `macro`
```c3
<*
 @require self.is_keyable()
*>
macro String? Object.get_enum(&self, $EnumType, String key)
```


---

#### `macro`
```c3
<*
 @require self.is_indexable()
*>
macro String? Object.get_enum_at(&self, $EnumType, usz index)
```


---

#### `func`
```c3
<*
 @require self.is_keyable()
*>
fn bool? Object.get_bool(&self, String key)
```


---

#### `func`
```c3
<*
 @require self.is_indexable()
*>
fn bool? Object.get_bool_at(&self, usz index)
```


---

#### `func`
```c3
<*
 @require self.is_keyable()
*>
fn double? Object.get_float(&self, String key)
```


---

#### `func`
```c3
<*
 @require self.is_indexable()
*>
fn double? Object.get_float_at(&self, usz index)
```


---

#### `func`
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

#### `func`
```c3
fn usz? Pair.to_format(&self, Formatter* f) @dynamic
```

---

#### `macro`
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

#### `func`
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

#### `func`
```c3
fn PrivatePriorityQueue* PrivatePriorityQueue.init(&self, Allocator allocator, usz initial_capacity = 16, ) @inline
```

---

#### `func`
```c3
fn PrivatePriorityQueue* PrivatePriorityQueue.tinit(&self, usz initial_capacity = 16) @inline
```

---

#### `func`
```c3
fn void PrivatePriorityQueue.push(&self, Type element)
```

---

#### `func`
```c3
<*
 @require index < self.len() : "Index out of range"
*>
fn void PrivatePriorityQueue.remove_at(&self, usz index)
```


---

#### `func`
```c3
<*
 @require self != null
*>
fn Type? PrivatePriorityQueue.pop(&self)
```


---

#### `func`
```c3
fn Type? PrivatePriorityQueue.first(&self)
```

---

#### `func`
```c3
fn void PrivatePriorityQueue.free(&self)
```

---

#### `func`
```c3
fn usz PrivatePriorityQueue.len(&self) @operator(len)
```

---

#### `func`
```c3
fn bool PrivatePriorityQueue.is_empty(&self)
```

---

#### `func`
```c3
<*
 @require index < self.len()
*>
fn Type PrivatePriorityQueue.get(&self, usz index) @operator([])
```


---

#### `func`
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

#### `func`
```c3
fn usz Range.len(&self) @operator(len)
```

---

#### `func`
```c3
fn bool Range.contains(&self, Type value) @inline
```

---

#### `func`
```c3
<*
 @require index < self.len() : "Can't index into an empty range"
*>
fn Type Range.get(&self, usz index) @operator([])
```


---

#### `func`
```c3
fn usz? Range.to_format(&self, Formatter* formatter) @dynamic
```

---

#### `ExclusiveRange`
```c3
struct ExclusiveRange (Printable)
```

---

#### `func`
```c3
fn usz ExclusiveRange.len(&self) @operator(len)
```

---

#### `func`
```c3
fn bool ExclusiveRange.contains(&self, Type value) @inline
```

---

#### `func`
```c3
fn usz? ExclusiveRange.to_format(&self, Formatter* formatter) @dynamic
```

---

#### `func`
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

#### `func`
```c3
fn void RingBuffer.init(&self) @inline
```

---

#### `func`
```c3
fn void RingBuffer.push(&self, Element c)
```

---

#### `func`
```c3
fn Element RingBuffer.get(&self, usz index) @operator([])
```

---

#### `func`
```c3
fn Element? RingBuffer.pop(&self)
```

---

#### `func`
```c3
fn usz? RingBuffer.to_format(&self, Formatter* format) @dynamic
```

---

#### `func`
```c3
fn usz RingBuffer.read(&self, usz index, Element[] buffer)
```

---

#### `func`
```c3
fn void RingBuffer.write(&self, Element[] buffer)
```
### `std::collections::set {Value}`

---

#### `DEFAULT_INITIAL_CAPACITY`
```c3
const uint DEFAULT_INITIAL_CAPACITY
```

---

#### `MAXIMUM_CAPACITY`
```c3
const uint MAXIMUM_CAPACITY
```

---

#### `DEFAULT_LOAD_FACTOR`
```c3
const float DEFAULT_LOAD_FACTOR
```

---

#### `SET_HEAP_ALLOCATOR`
```c3
const Allocator SET_HEAP_ALLOCATOR
```

---

#### `ONHEAP`
```c3
const HashSet ONHEAP
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

#### `func`
```c3
fn int HashSet.len(&self) @operator(len)
```

---

#### `func`
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

#### `func`
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

#### `macro`
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

#### `macro`
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

#### `func`
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

#### `func`
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

#### `func`
```c3
<*
 @param [&in] set : "The hash set we are testing"
 @return "Returns true if it has been initialized, false otherwise"
*>
fn bool HashSet.is_initialized(&set)
```


Has this hash set been initialized yet?

---

#### `func`
```c3
<*
 @param [&inout] allocator : "The allocator to use"
 @param [&in] other_set : "The set to copy from."
 @require !self.is_initialized() : "Set was already initialized"
*>
fn HashSet* HashSet.init_from_set(&self, Allocator allocator, HashSet* other_set)
```


---

#### `func`
```c3
<*
 @param [&in] other_set : "The set to copy from."
 @require !set.is_initialized() : "Set was already initialized"
*>
fn HashSet* HashSet.tinit_from_set(&set, HashSet* other_set)
```


---

#### `func`
```c3
<*
 @return "true if it is empty"
 @pure
*>
fn bool HashSet.is_empty(&set) @inline
```


Check if the set is empty

---

#### `func`
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

#### `func`
```c3
<*
 @param [&in] other
 @return "The number of new elements added"
 @ensure return <= other.count
*>
fn usz HashSet.add_all_from(&set, HashSet* other)
```


---

#### `func`
```c3
<*
 @param value : "The value to add"
 @return "true if the value didn't exist in the set"
*>
fn bool HashSet.add(&set, Value value)
```


---

#### `macro`
```c3
macro HashSet.@each(set; @body(value))
```

Iterate over all the values in the set

---

#### `func`
```c3
<*
 @param value : "The value to check"
 @return "true if it exists in the set"
*>
fn bool HashSet.contains(&set, Value value)
```


Check if the set contains the given value.

---

#### `func`
```c3
<*
 @param value : "The value to remove"
 @return? NOT_FOUND : "If the entry is not found"
*>
fn void? HashSet.remove(&set, Value value) @maydiscard
```


Remove a single value from the set.

---

#### `func`
```c3
fn usz HashSet.remove_all(&set, Value[] values)
```

---

#### `func`
```c3
<*
 @param [&in] other : "Other set"
*>
fn usz HashSet.remove_all_from(&set, HashSet* other)
```


---

#### `func`
```c3
fn void HashSet.free(&set)
```

Free all memory allocated by the hash set.

---

#### `func`
```c3
<*
 @ensure set.count == 0
*>
fn void HashSet.clear(&set)
```


Clear all elements from the set while keeping the underlying storage

---

#### `func`
```c3
fn void HashSet.reserve(&set, usz capacity)
```

---

#### `func`
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

#### `func`
```c3
fn HashSet HashSet.tset_union(&self, HashSet* other)
```

---

#### `func`
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

#### `func`
```c3
fn HashSet HashSet.tintersection(&self, HashSet* other)
```

---

#### `func`
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

#### `func`
```c3
fn HashSet HashSet.tdifference(&self, HashSet* other)
```

---

#### `func`
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

#### `func`
```c3
fn HashSet HashSet.tsymmetric_difference(&self, HashSet* other)
```

---

#### `func`
```c3
<*
 @param [&in] other : "The other set to check against"
 @return "True if all elements of this set are in the other set"
*>
fn bool HashSet.is_subset(&self, HashSet* other)
```


Check if this hash set is a subset of another set.

---

#### `func`
```c3
fn usz? HashSet.to_format(&self, Formatter* f) @dynamic
```

---

#### `HashSetIterator`
```c3
struct HashSetIterator
```

---

#### `func`
```c3
fn HashSetIterator HashSet.iter(&set)
```

---

#### `func`
```c3
fn Value? HashSetIterator.next(&self)
```

---

#### `func`
```c3
fn usz HashSetIterator.len(&self) @operator(len)
```

---

#### `LINKEDONHEAP`
```c3
const LinkedHashSet LINKEDONHEAP
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

#### `func`
```c3
fn int LinkedHashSet.len(&self) @operator(len)
```

---

#### `func`
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

#### `func`
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

#### `macro`
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

#### `macro`
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

#### `func`
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

#### `func`
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

#### `func`
```c3
<*
 @param [&in] set : "The linked hash set we are testing"
 @return "Returns true if it has been initialized, false otherwise"
*>
fn bool LinkedHashSet.is_initialized(&set)
```


Has this linked hash set been initialized yet?

---

#### `func`
```c3
<*
 @param [&inout] allocator : "The allocator to use"
 @param [&in] other_set : "The set to copy from."
 @require !self.is_initialized() : "Set was already initialized"
*>
fn LinkedHashSet* LinkedHashSet.init_from_set(&self, Allocator allocator, LinkedHashSet* other_set)
```


---

#### `func`
```c3
<*
 @param [&in] other_set : "The set to copy from."
 @require !set.is_initialized() : "Set was already initialized"
*>
fn LinkedHashSet* LinkedHashSet.tinit_from_set(&set, LinkedHashSet* other_set)
```


---

#### `func`
```c3
<*
 @return "true if it is empty"
 @pure
*>
fn bool LinkedHashSet.is_empty(&set) @inline
```


Check if the set is empty

---

#### `func`
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

#### `func`
```c3
<*
 @param [&in] other
 @return "The number of new elements added"
 @ensure return <= other.count
*>
fn usz LinkedHashSet.add_all_from(&set, LinkedHashSet* other)
```


---

#### `func`
```c3
<*
 @param value : "The value to add"
 @return "true if the value didn't exist in the set"
*>
fn bool LinkedHashSet.add(&set, Value value)
```


---

#### `macro`
```c3
macro LinkedHashSet.@each(set; @body(value))
```

Iterate over all the values in the set

---

#### `func`
```c3
<*
 @param value : "The value to check"
 @return "true if it exists in the set"
*>
fn bool LinkedHashSet.contains(&set, Value value)
```


Check if the set contains the given value.

---

#### `func`
```c3
<*
 @param value : "The value to remove"
 @return? NOT_FOUND : "If the entry is not found"
*>
fn void? LinkedHashSet.remove(&set, Value value) @maydiscard
```


Remove a single value from the set.

---

#### `func`
```c3
fn usz LinkedHashSet.remove_all(&set, Value[] values)
```

---

#### `func`
```c3
<*
 @param [&in] other : "Other set"
*>
fn usz LinkedHashSet.remove_all_from(&set, LinkedHashSet* other)
```


---

#### `func`
```c3
fn void LinkedHashSet.free(&set)
```

Free all memory allocated by the hash set.

---

#### `func`
```c3
<*
 @ensure set.count == 0
*>
fn void LinkedHashSet.clear(&set)
```


Clear all elements from the set while keeping the underlying storage

---

#### `func`
```c3
fn void LinkedHashSet.reserve(&set, usz capacity)
```

---

#### `func`
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

#### `func`
```c3
fn LinkedHashSet LinkedHashSet.tset_union(&self, LinkedHashSet* other)
```

---

#### `func`
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

#### `func`
```c3
fn LinkedHashSet LinkedHashSet.tintersection(&self, LinkedHashSet* other)
```

---

#### `func`
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

#### `func`
```c3
fn LinkedHashSet LinkedHashSet.tdifference(&self, LinkedHashSet* other)
```

---

#### `func`
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

#### `func`
```c3
fn LinkedHashSet LinkedHashSet.tsymmetric_difference(&self, LinkedHashSet* other)
```

---

#### `func`
```c3
<*
 @param [&in] other : "The other set to check against"
 @return "True if all elements of this set are in the other set"
*>
fn bool LinkedHashSet.is_subset(&self, LinkedHashSet* other)
```


Check if this hash set is a subset of another set.

---

#### `func`
```c3
fn usz? LinkedHashSet.to_format(&self, Formatter* f) @dynamic
```

---

#### `LinkedHashSetIterator`
```c3
struct LinkedHashSetIterator
```

---

#### `func`
```c3
fn LinkedHashSetIterator LinkedHashSet.iter(&set)
```

---

#### `func`
```c3
fn bool LinkedHashSetIterator.next(&self)
```

---

#### `func`
```c3
fn Value*? LinkedHashSetIterator.get(&self)
```

---

#### `func`
```c3
fn bool LinkedHashSetIterator.has_next(&self)
```

---

#### `func`
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

#### `func`
```c3
fn usz? Triple.to_format(&self, Formatter* f) @dynamic
```

---

#### `macro`
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

#### `func`
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
const uint PIXELS_MAX
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

#### `func`
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

#### `func`
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

#### `func`
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

#### `func`
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

#### `macro`
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

#### `macro`
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

#### `macro`
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

#### `macro`
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

#### `macro`
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

#### `macro`
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

#### `func`
```c3
<*
 @return `The length of the "outer" slice`
*>
fn usz Slice2d.len(&self) @operator(len)
```


---

#### `func`
```c3
<*
 @return `The total number of elements.`
*>
fn usz Slice2d.count(&self)
```


---

#### `macro`
```c3
macro void Slice2d.@each(&self; @body(usz[<2>], Type))
```

Step through each element of the slice.

---

#### `macro`
```c3
macro void Slice2d.@each_ref(&self; @body(usz[<2>], Type*))
```

Step through each element of the slice *by reference*

---

#### `macro`
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

#### `macro`
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

#### `macro`
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

#### `macro`
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

#### `macro`
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

#### `macro`
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

#### `macro`
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

#### `func`
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

#### `macro`
```c3
macro bool @is_lower(c)
```

---

#### `macro`
```c3
macro bool @is_upper(c)
```

---

#### `macro`
```c3
macro bool @is_digit(c)
```

---

#### `macro`
```c3
macro bool @is_bdigit(c)
```

---

#### `macro`
```c3
macro bool @is_odigit(c)
```

---

#### `macro`
```c3
macro bool @is_xdigit(c)
```

---

#### `macro`
```c3
macro bool @is_alpha(c)
```

---

#### `macro`
```c3
macro bool @is_print(c)
```

---

#### `macro`
```c3
macro bool @is_graph(c)
```

---

#### `macro`
```c3
macro bool @is_space(c)
```

---

#### `macro`
```c3
macro bool @is_alnum(c)
```

---

#### `macro`
```c3
macro bool @is_punct(c)
```

---

#### `macro`
```c3
macro bool @is_blank(c)
```

---

#### `macro`
```c3
macro bool @is_cntrl(c)
```

---

#### `macro`
```c3
macro char @to_lower(c)
```

---

#### `macro`
```c3
macro char @to_upper(c)
```

---

#### `func`
```c3
fn bool is_lower(char c)
```

---

#### `func`
```c3
fn bool is_upper(char c)
```

---

#### `func`
```c3
fn bool is_digit(char c)
```

---

#### `func`
```c3
fn bool is_bdigit(char c)
```

---

#### `func`
```c3
fn bool is_odigit(char c)
```

---

#### `func`
```c3
fn bool is_xdigit(char c)
```

---

#### `func`
```c3
fn bool is_alpha(char c)
```

---

#### `func`
```c3
fn bool is_print(char c)
```

---

#### `func`
```c3
fn bool is_graph(char c)
```

---

#### `func`
```c3
fn bool is_space(char c)
```

---

#### `func`
```c3
fn bool is_alnum(char c)
```

---

#### `func`
```c3
fn bool is_punct(char c)
```

---

#### `func`
```c3
fn bool is_blank(char c)
```

---

#### `func`
```c3
fn bool is_cntrl(char c)
```

---

#### `func`
```c3
fn char to_lower(char c)
```

---

#### `func`
```c3
fn char to_upper(char c)
```

---

#### `macro`
```c3
macro bool char.is_lower(char c)
```

---

#### `macro`
```c3
macro bool char.is_upper(char c)
```

---

#### `macro`
```c3
macro bool char.is_digit(char c)
```

---

#### `macro`
```c3
macro bool char.is_bdigit(char c)
```

---

#### `macro`
```c3
macro bool char.is_odigit(char c)
```

---

#### `macro`
```c3
macro bool char.is_xdigit(char c)
```

---

#### `macro`
```c3
macro bool char.is_alpha(char c)
```

---

#### `macro`
```c3
macro bool char.is_print(char c)
```

---

#### `macro`
```c3
macro bool char.is_graph(char c)
```

---

#### `macro`
```c3
macro bool char.is_space(char c)
```

---

#### `macro`
```c3
macro bool char.is_alnum(char c)
```

---

#### `macro`
```c3
macro bool char.is_punct(char c)
```

---

#### `macro`
```c3
macro bool char.is_blank(char c)
```

---

#### `macro`
```c3
macro bool char.is_cntrl(char c)
```

---

#### `macro`
```c3
macro char char.to_lower(char c)
```

---

#### `macro`
```c3
macro char char.to_upper(char c)
```

---

#### `macro`
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
const char[256] HEX_VALUE
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
bitstruct Int128LE : int128 @littleendian

```

---

#### `UInt`
```c3
bitstruct UInt128BE : uint128 @bigendian
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

#### `macro`
```c3
<*
 @require @is_array_or_slice_of_char(bytes) : "argument must be an array, a pointer to an array or a slice of char"
 @require is_bitorder($Type) : "type must be a bitorder integer"
*>
macro read(bytes, $Type)
```


---

#### `macro`
```c3
<*
 @require @is_arrayptr_or_slice_of_char(bytes) : "argument must be a pointer to an array or a slice of char"
 @require is_bitorder($Type) : "type must be a bitorder integer"
*>
macro write(x, bytes, $Type)
```


---

#### `macro`
```c3
macro is_bitorder($Type)
```

---

#### `macro`
```c3
macro bool is_array_or_slice_of_char(bytes) @deprecated("Use @is_array_or_slice_of_char")
```

---

#### `macro`
```c3
macro bool @is_array_or_slice_of_char(#bytes) @const
```

---

#### `macro`
```c3
macro bool is_arrayptr_or_slice_of_char(bytes) @deprecated("Use @is_arrayptr_or_slice_of_char")
```

---

#### `macro`
```c3
macro bool @is_arrayptr_or_slice_of_char(#bytes) @const
```
### `std::core::builtin`

---

#### `@builtin`
```c3
const EmptySlot EMPTY_MACRO_SLOT @builtin
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

#### `macro`
```c3
macro @is_empty_macro_slot(#arg) @const @builtin
```

---

#### `macro`
```c3
macro @is_valid_macro_slot(#arg) @const @builtin
```

---

#### `macro`
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

#### `macro`
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

#### `macro`
```c3
<*
 @require $defined(#a = #b, #b = #a) : `The values must be mutually assignable`
*>
macro void @swap(#a, #b) @builtin
```


Swap two variables

---

#### `macro`
```c3
macro usz bitsizeof($Type) @builtin @const
```

---

#### `macro`
```c3
macro usz @bitsizeof(#expr) @builtin @const
```

---

#### `macro`
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

#### `macro`
```c3
macro bool @assignable_to(#foo, $Type) @const @builtin
```

---

#### `macro`
```c3
macro @addr(#val) @builtin
```

---

#### `macro`
```c3
macro typeid @typeid(#value) @const @builtin
```

---

#### `macro`
```c3
macro TypeKind @typekind(#value) @const @builtin
```

---

#### `macro`
```c3
macro bool @typeis(#value, $Type) @const @builtin
```

---

#### `func`
```c3
fn bool print_backtrace(String message, int backtraces_to_ignore) @if
```

---

#### `func`
```c3
fn void default_panic(String message, String file, String function, uint line) @if(env::NATIVE_STACKTRACE)
```

---

#### `macro`
```c3
macro void abort(String string = "Unrecoverable error reached", ...) @format(0) @builtin @noreturn
```

---

#### `func`
```c3
fn void default_panic(String message, String file, String function, uint line) @if
```

---

#### `PanicFn`
```c3
alias PanicFn = fn void(String message, String file, String function, uint line)
```

---

#### `func`
```c3
fn void panicf(String fmt, String file, String function, uint line, args...)
```

---

#### `macro`
```c3
<*
 @param [in] string : "The panic message or format string"
*>
macro void unreachable(String string = "Unreachable statement reached.", ...) @builtin @noreturn
```


Marks the path as unreachable. This will panic in safe mode, and in fast will simply be assumed
never happens.

---

#### `macro`
```c3
<*
 @param [in] string : "The error message"
*>
macro void unsupported(String string = "Unsupported function invoked") @builtin @noreturn
```


Marks the path as unsupported, this is similar to unreachable.

---

#### `macro`
```c3
macro void breakpoint() @builtin
```

Unconditionally break into an attached debugger when reached.

---

#### `macro`
```c3
macro any_make(void* ptr, typeid type) @builtin
```

---

#### `macro`
```c3
macro any.retype_to(&self, typeid type)
```

---

#### `macro`
```c3
macro any.as_inner(&self)
```

---

#### `macro`
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

#### `macro`
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

#### `macro`
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

#### `macro`
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

#### `macro`
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

#### `macro`
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

#### `macro`
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

#### `macro`
```c3
macro swizzle(v, ...) @builtin
```

---

#### `macro`
```c3
macro swizzle2(v, v2, ...) @builtin
```

---

#### `macro`
```c3
<*
 @require types::is_int($typeof($value)) : "Input value must be an integer"
 @require $sizeof($value) * 8 <= 128 : "Input value must be 128 bits wide or lower"
*>
macro @clz($value) @builtin @const
```


Returns the count of leading zero bits from an integer at compile-time.

---

#### `macro`
```c3
<*
 @require @typekind(#expr) == OPTIONAL : `@catch expects an Optional value`
*>
macro fault @catch(#expr) @builtin
```


Return the excuse in the Optional if it is Empty, otherwise
return a null fault.

---

#### `macro`
```c3
<*
 @require @typekind(#expr) == OPTIONAL : `@ok expects an Optional value`
*>
macro bool @ok(#expr) @builtin
```


Check if an Optional expression holds a value or is empty, returning true
if it has a value.

---

#### `macro`
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

#### `macro`
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

#### `macro`
```c3
<*
 @require $defined(&#value, (char*)&#value) : "This must be a value that can be viewed as a char array"
*>
macro char[] @as_char_view(#value) @builtin
```


---

#### `macro`
```c3
macro isz @str_find(String $string, String $needle) @builtin
```

---

#### `macro`
```c3
macro String @str_upper(String $str) @builtin
```

---

#### `macro`
```c3
macro String @str_lower(String $str) @builtin
```

---

#### `macro`
```c3
macro uint @str_hash(String $str) @builtin
```

---

#### `macro`
```c3
macro @generic_hash_core(h, value)
```

---

#### `macro`
```c3
macro @generic_hash(value)
```

---

#### `macro`
```c3
macro uint int128.hash(self)
```

---

#### `macro`
```c3
macro uint uint128.hash(self)
```

---

#### `macro`
```c3
macro uint long.hash(self)
```

---

#### `macro`
```c3
macro uint ulong.hash(self)
```

---

#### `macro`
```c3
macro uint int.hash(self)
```

---

#### `macro`
```c3
macro uint uint.hash(self)
```

---

#### `macro`
```c3
macro uint short.hash(self)
```

---

#### `macro`
```c3
macro uint ushort.hash(self)
```

---

#### `macro`
```c3
macro uint ichar.hash(self)
```

---

#### `macro`
```c3
macro uint char.hash(self)
```

---

#### `macro`
```c3
macro uint bool.hash(self)
```

---

#### `macro`
```c3
macro uint int128[*].hash(&self)
```

---

#### `macro`
```c3
macro uint uint128[*].hash(&self)
```

---

#### `macro`
```c3
macro uint long[*].hash(&self)
```

---

#### `macro`
```c3
macro uint ulong[*].hash(&self)
```

---

#### `macro`
```c3
macro uint int[*].hash(&self)
```

---

#### `macro`
```c3
macro uint uint[*].hash(&self)
```

---

#### `macro`
```c3
macro uint short[*].hash(&self)
```

---

#### `macro`
```c3
macro uint ushort[*].hash(&self)
```

---

#### `macro`
```c3
macro uint char[*].hash(&self)
```

---

#### `macro`
```c3
macro uint ichar[*].hash(&self)
```

---

#### `macro`
```c3
macro uint bool[*].hash(&self)
```

---

#### `macro`
```c3
macro uint int128[<*>].hash(self)
```

---

#### `macro`
```c3
macro uint uint128[<*>].hash(self)
```

---

#### `macro`
```c3
macro uint long[<*>].hash(self)
```

---

#### `macro`
```c3
macro uint ulong[<*>].hash(self)
```

---

#### `macro`
```c3
macro uint int[<*>].hash(self)
```

---

#### `macro`
```c3
macro uint uint[<*>].hash(self)
```

---

#### `macro`
```c3
macro uint short[<*>].hash(self)
```

---

#### `macro`
```c3
macro uint ushort[<*>].hash(self)
```

---

#### `macro`
```c3
macro uint char[<*>].hash(self)
```

---

#### `macro`
```c3
macro uint ichar[<*>].hash(self)
```

---

#### `macro`
```c3
macro uint bool[<*>].hash(self)
```

---

#### `macro`
```c3
macro uint typeid.hash(typeid t)
```

---

#### `macro`
```c3
macro uint String.hash(String c)
```

---

#### `macro`
```c3
macro uint char[].hash(char[] c)
```

---

#### `macro`
```c3
macro uint void*.hash(void* ptr)
```

---

#### `MAX_FRAMEADDRESS`
```c3
const MAX_FRAMEADDRESS
```

---

#### `macro`
```c3
<*
 @require n >= 0
*>
macro void* get_frameaddress(int n)
```


---

#### `macro`
```c3
<*
 @require n >= 0
*>
macro void* get_returnaddress(int n)
```


---

#### `macro`
```c3
<*
 @require types::@comparable_value(a) && types::@comparable_value(b)
*>
macro less(a, b) @builtin
```


---

#### `macro`
```c3
<*
 @require types::@comparable_value(a) && types::@comparable_value(b)
*>
macro less_eq(a, b) @builtin
```


---

#### `macro`
```c3
<*
 @require types::@comparable_value(a) && types::@comparable_value(b)
*>
macro greater(a, b) @builtin
```


---

#### `macro`
```c3
<*
 @require types::@comparable_value(a) && types::@comparable_value(b)
*>
macro int compare_to(a, b) @builtin
```


---

#### `macro`
```c3
<*
 @require types::@comparable_value(a) && types::@comparable_value(b)
*>
macro greater_eq(a, b) @builtin
```


---

#### `macro`
```c3
<*
 @require types::@equatable_value(a) && types::@equatable_value(b) : `values must be equatable`
*>
macro bool equals(a, b) @builtin
```


---

#### `macro`
```c3
macro min(x, ...) @builtin
```

---

#### `macro`
```c3
macro max(x, ...) @builtin
```
### `std::core::builtin @if((env::LINUX || env::ANDROID || env::DARWIN) && env::COMPILER_SAFE_MODE && env::DEBUG_SYMBOLS)`

---

#### `func`
```c3
fn void sig_panic(String message)
```

---

#### `func`
```c3
fn void sig_bus_error(CInt i)
```

---

#### `func`
```c3
fn void sig_segmentation_fault(CInt i)
```
### `std::core::cinterop`

---

#### `C_INT_SIZE`
```c3
const C_INT_SIZE
```

---

#### `C_LONG_SIZE`
```c3
const C_LONG_SIZE
```

---

#### `C_SHORT_SIZE`
```c3
const C_SHORT_SIZE
```

---

#### `C_LONG_LONG_SIZE`
```c3
const C_LONG_LONG_SIZE
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
### `std::core::cpudetect @if(env::X86 || env::X86_64)`

---

#### `CpuId`
```c3
struct CpuId
```

---

#### `func`
```c3
fn CpuId x86_cpuid(uint eax, uint ecx = 0)
```

---

#### `X`
```c3
enum X86Feature
```

---

#### `func`
```c3
fn void add_feature_if_bit(X86Feature feature, uint register, int bit)
```

---

#### `func`
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

#### `func`
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

#### `func`
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

#### `func`
```c3
fn DString new_with_capacity(Allocator allocator, usz capacity)
```

---

#### `func`
```c3
fn DString temp_with_capacity(usz capacity)
```

---

#### `func`
```c3
fn DString new(Allocator allocator, String c = "")
```

---

#### `func`
```c3
fn DString temp(String s = "")
```

---

#### `func`
```c3
fn void DString.replace_char(self, char ch, char replacement)
```

---

#### `func`
```c3
fn void DString.replace(&self, String needle, String replacement)
```

---

#### `func`
```c3
fn DString DString.concat(self, Allocator allocator, DString b) @nodiscard
```

---

#### `func`
```c3
fn DString DString.tconcat(self, DString b)
```

---

#### `func`
```c3
fn ZString DString.zstr_view(&self)
```

---

#### `func`
```c3
fn usz DString.capacity(self)
```

---

#### `func`
```c3
fn usz DString.len(&self) @dynamic @operator(len)
```

---

#### `func`
```c3
<*
 @require new_size <= self.len()
*>
fn void DString.chop(self, usz new_size)
```


---

#### `func`
```c3
fn String DString.str_view(self)
```

---

#### `func`
```c3
<*
 @require index < self.len()
 @require self.data() != null : "Empty string"
*>
fn char DString.char_at(self, usz index) @operator([])
```


---

#### `func`
```c3
<*
 @require index < self.len()
 @require self.data() != null  : "Empty string"
*>
fn char* DString.char_ref(&self, usz index) @operator(&[])
```


---

#### `func`
```c3
fn usz DString.append_utf32(&self, Char32[] chars)
```

---

#### `func`
```c3
<*
 @require index < self.len()
*>
fn void DString.set(self, usz index, char c) @operator([]=)
```


---

#### `func`
```c3
fn void DString.append_repeat(&self, char c, usz times)
```

---

#### `func`
```c3
<*
 @require c <= 0x10ffff
*>
fn usz DString.append_char32(&self, Char32 c)
```


---

#### `func`
```c3
fn DString DString.tcopy(&self)
```

---

#### `func`
```c3
fn DString DString.copy(self, Allocator allocator) @nodiscard
```

---

#### `func`
```c3
fn ZString DString.copy_zstr(self, Allocator allocator) @nodiscard
```

---

#### `func`
```c3
fn String DString.copy_str(self, Allocator allocator) @nodiscard
```

---

#### `func`
```c3
fn String DString.tcopy_str(self) @nodiscard
```

---

#### `func`
```c3
fn bool DString.equals(self, DString other_string)
```

---

#### `func`
```c3
fn void DString.free(&self)
```

---

#### `func`
```c3
fn bool DString.less(self, DString other_string)
```

---

#### `func`
```c3
fn void DString.append_chars(&self, String str)
```

---

#### `func`
```c3
fn Char32[] DString.copy_utf32(&self, Allocator allocator)
```

---

#### `func`
```c3
fn void DString.append_string(&self, DString str)
```

---

#### `func`
```c3
fn void DString.clear(self)
```

---

#### `func`
```c3
fn usz? DString.write(&self, char[] buffer) @dynamic
```

---

#### `func`
```c3
fn void? DString.write_byte(&self, char c) @dynamic
```

---

#### `func`
```c3
fn void DString.append_char(&self, char c)
```

---

#### `func`
```c3
<*
 @require start < self.len()
 @require end < self.len()
 @require end >= start : "End must be same or equal to the start"
*>
fn void DString.delete_range(&self, usz start, usz end)
```


---

#### `func`
```c3
<*
 @require start < self.len()
 @require start + len <= self.len()
*>
fn void DString.delete(&self, usz start, usz len = 1)
```


---

#### `macro`
```c3
macro void DString.append(&self, value)
```

---

#### `func`
```c3
<*
 @require index <= self.len()
*>
fn void DString.insert_chars_at(&self, usz index, String s)
```


---

#### `func`
```c3
<*
 @require index <= self.len()
*>
fn void DString.insert_string_at(&self, usz index, DString str)
```


---

#### `func`
```c3
<*
 @require index <= self.len()
*>
fn void DString.insert_char_at(&self, usz index, char c)
```


---

#### `func`
```c3
<*
 @require index <= self.len()
*>
fn usz DString.insert_char32_at(&self, usz index, Char32 c)
```


---

#### `func`
```c3
<*
 @require index <= self.len()
*>
fn usz DString.insert_utf32_at(&self, usz index, Char32[] chars)
```


---

#### `macro`
```c3
macro void DString.insert_at(&self, usz index, value)
```

---

#### `func`
```c3
fn usz? DString.appendf(&self, String format, args...) @maydiscard
```

---

#### `func`
```c3
fn usz? DString.appendfn(&self, String format, args...) @maydiscard
```

---

#### `func`
```c3
fn DString join(Allocator allocator, String[] s, String joiner) @nodiscard
```

---

#### `func`
```c3
fn void DString.reverse(self)
```

---

#### `func`
```c3
fn void DString.reserve(&self, usz addition)
```

---

#### `func`
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
const String COMPILER_BUILD_HASH
```

---

#### `COMPILER_BUILD_DATE`
```c3
const String COMPILER_BUILD_DATE
```

---

#### `OS_TYPE`
```c3
const OsType OS_TYPE
```

---

#### `ARCH_TYPE`
```c3
const ArchType ARCH_TYPE
```

---

#### `MAX_VECTOR_SIZE`
```c3
const usz MAX_VECTOR_SIZE
```

---

#### `ARCH_32_BIT`
```c3
const bool ARCH_32_BIT
```

---

#### `ARCH_64_BIT`
```c3
const bool ARCH_64_BIT
```

---

#### `LIBC`
```c3
const bool LIBC
```

---

#### `NO_LIBC`
```c3
const bool NO_LIBC
```

---

#### `COMPILER_OPT_LEVEL`
```c3
const CompilerOptLevel COMPILER_OPT_LEVEL
```

---

#### `BIG_ENDIAN`
```c3
const bool BIG_ENDIAN
```

---

#### `I128_NATIVE_SUPPORT`
```c3
const bool I128_NATIVE_SUPPORT
```

---

#### `F16_SUPPORT`
```c3
const bool F16_SUPPORT
```

---

#### `F128_SUPPORT`
```c3
const bool F128_SUPPORT
```

---

#### `REGISTER_SIZE`
```c3
const REGISTER_SIZE
```

---

#### `COMPILER_SAFE_MODE`
```c3
const bool COMPILER_SAFE_MODE
```

---

#### `DEBUG_SYMBOLS`
```c3
const bool DEBUG_SYMBOLS
```

---

#### `BACKTRACE`
```c3
const bool BACKTRACE
```

---

#### `LLVM_VERSION`
```c3
const usz LLVM_VERSION
```

---

#### `BENCHMARKING`
```c3
const bool BENCHMARKING
```

---

#### `TESTING`
```c3
const bool TESTING
```

---

#### `PANIC_MSG`
```c3
const bool PANIC_MSG
```

---

#### `MEMORY_ENV`
```c3
const MemoryEnvironment MEMORY_ENV
```

---

#### `TRACK_MEMORY`
```c3
const bool TRACK_MEMORY
```

---

#### `X86_64`
```c3
const bool X86_64
```

---

#### `X86`
```c3
const bool X86
```

---

#### `AARCH64`
```c3
const bool AARCH64
```

---

#### `NATIVE_STACKTRACE`
```c3
const bool NATIVE_STACKTRACE
```

---

#### `LINUX`
```c3
const bool LINUX
```

---

#### `DARWIN`
```c3
const bool DARWIN
```

---

#### `WIN32`
```c3
const bool WIN32
```

---

#### `POSIX`
```c3
const bool POSIX
```

---

#### `OPENBSD`
```c3
const bool OPENBSD
```

---

#### `FREEBSD`
```c3
const bool FREEBSD
```

---

#### `NETBSD`
```c3
const bool NETBSD
```

---

#### `BSD_FAMILY`
```c3
const bool BSD_FAMILY
```

---

#### `WASI`
```c3
const bool WASI
```

---

#### `ANDROID`
```c3
const bool ANDROID
```

---

#### `@builtin`
```c3
const bool WASM_NOLIBC @builtin
```

---

#### `ADDRESS_SANITIZER`
```c3
const bool ADDRESS_SANITIZER
```

---

#### `MEMORY_SANITIZER`
```c3
const bool MEMORY_SANITIZER
```

---

#### `THREAD_SANITIZER`
```c3
const bool THREAD_SANITIZER
```

---

#### `ANY_SANITIZER`
```c3
const bool ANY_SANITIZER
```

---

#### `LANGUAGE_DEV_VERSION`
```c3
const int LANGUAGE_DEV_VERSION
```

---

#### `HAS_NATIVE_ERRNO`
```c3
const bool HAS_NATIVE_ERRNO
```

---

#### `macro`
```c3
macro bool os_is_darwin() @const
```

---

#### `macro`
```c3
macro bool os_is_posix() @const
```

---

#### `AUTHORS`
```c3
const String[] AUTHORS
```

---

#### `AUTHOR_EMAILS`
```c3
const String[] AUTHOR_EMAILS
```

---

#### `BUILTIN_EXPECT_IS_DISABLED`
```c3
const BUILTIN_EXPECT_IS_DISABLED
```

---

#### `BUILTIN_PREFETCH_IS_DISABLED`
```c3
const BUILTIN_PREFETCH_IS_DISABLED
```
### `std::core::log`

---

#### `FULL_LOG`
```c3
const FULL_LOG
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
const LogCategory CATEGORY_APPLICATION
```

---

#### `CATEGORY_SYSTEM`
```c3
const LogCategory CATEGORY_SYSTEM
```

---

#### `CATEGORY_KERNEL`
```c3
const LogCategory CATEGORY_KERNEL
```

---

#### `CATEGORY_AUDIO`
```c3
const LogCategory CATEGORY_AUDIO
```

---

#### `CATEGORY_VIDEO`
```c3
const LogCategory CATEGORY_VIDEO
```

---

#### `CATEGORY_RENDER`
```c3
const LogCategory CATEGORY_RENDER
```

---

#### `CATEGORY_INPUT`
```c3
const LogCategory CATEGORY_INPUT
```

---

#### `CATEGORY_NETWORK`
```c3
const LogCategory CATEGORY_NETWORK
```

---

#### `CATEGORY_SOCKET`
```c3
const LogCategory CATEGORY_SOCKET
```

---

#### `CATEGORY_SECURITY`
```c3
const LogCategory CATEGORY_SECURITY
```

---

#### `CATEGORY_TEST`
```c3
const LogCategory CATEGORY_TEST
```

---

#### `CATEGORY_ERROR`
```c3
const LogCategory CATEGORY_ERROR
```

---

#### `CATEGORY_ASSERT`
```c3
const LogCategory CATEGORY_ASSERT
```

---

#### `CATEGORY_CRASH`
```c3
const LogCategory CATEGORY_CRASH
```

---

#### `CATEGORY_STATS`
```c3
const LogCategory CATEGORY_STATS
```

---

#### `CATEGORY_CUSTOM_START`
```c3
const LogCategory CATEGORY_CUSTOM_START
```

---

#### `LogPriority`
```c3
enum LogPriority : int
```

---

#### `macro`
```c3
macro void verbose(String fmt, ..., LogCategory category = default_category)
```

---

#### `macro`
```c3
macro void debug(String fmt, ..., LogCategory category = default_category)
```

---

#### `macro`
```c3
macro void info(String fmt, ..., LogCategory category = default_category)
```

---

#### `macro`
```c3
macro void warn(String fmt, ..., LogCategory category = default_category)
```

---

#### `macro`
```c3
macro void error(String fmt, ..., LogCategory category = default_category)
```

---

#### `macro`
```c3
macro void critical(String fmt, ..., LogCategory category = default_category)
```

---

#### `macro`
```c3
macro void @category_scope(LogCategory new_category; @body)
```

---

#### `macro`
```c3
<*
 @require tag_prefix.len <= 3 : "The prefix may not exceed 3 bytes"
*>
macro void @tag_scope(String tag_prefix = ""; @body)
```


---

#### `macro`
```c3
<*
 @require tag_prefix.len <= 3 : "The prefix may not exceed 3 bytes"
*>
macro void push_tag(String tag_prefix = "")
```


---

#### `func`
```c3
<*
 @require tag_prefix.len <= 3 : "The prefix may not exceed 3 bytes"
*>
fn LogTag create_tag(String tag_prefix)
```


---

#### `func`
```c3
fn void set_priority_for_category(LogCategory category, LogPriority new_priority)
```

---

#### `func`
```c3
fn LogPriority get_priority_for_category(LogCategory category)
```

---

#### `func`
```c3
fn void set_priority_all(LogPriority new_priority)
```

---

#### `func`
```c3
fn void set_logger(Logger logger)
```

---

#### `macro`
```c3
macro void init()
```

---

#### `func`
```c3
fn void call_log(LogPriority prio, LogCategory category, String fmt, args...)
```

---

#### `func`
```c3
fn String? get_category_name(LogCategory category)
```

---

#### `func`
```c3
fn void set_category_name(LogCategory category, String name)
```

---

#### `NullLogger`
```c3
struct NullLogger (Logger)
```

---

#### `func`
```c3
fn void NullLogger.log(&self, LogPriority priority, LogCategory category, LogTag tag, String file, String function, int line, String fmt, any[] args) @dynamic
```

---

#### `MultiLogger`
```c3
struct MultiLogger (Logger)
```

---

#### `func`
```c3
fn void MultiLogger.log(&self, LogPriority priority, LogCategory category, LogTag tag, String file, String function, int line, String fmt, any[] args) @dynamic
```
### `std::core::main_stub`

---

#### `macro`
```c3
macro int @main_to_err_main(#m, int, char**)
```

---

#### `macro`
```c3
macro int @main_to_int_main(#m, int, char**)
```

---

#### `macro`
```c3
macro int @main_to_void_main(#m, int, char**)
```

---

#### `macro`
```c3
macro int @main_to_err_main_args(#m, int argc, char** argv)
```

---

#### `macro`
```c3
macro int @main_to_int_main_args(#m, int argc, char** argv)
```

---

#### `macro`
```c3
macro int @_main_runner(#m, int argc, char** argv)
```

---

#### `macro`
```c3
macro int @main_to_void_main_args(#m, int argc, char** argv)
```
### `std::core::main_stub @if(env::WIN32)`

---

#### `extern func`
```c3
extern fn Char16** _win_command_line_to_argv_w(ushort* cmd_line, int* argc_ptr) @extern("CommandLineToArgvW")
```

---

#### `macro`
```c3
macro int @win_to_err_main_noargs(#m, void* handle, void* prev_handle, Char16* cmd_line, int show_cmd)
```

---

#### `macro`
```c3
macro int @win_to_int_main_noargs(#m, void* handle, void* prev_handle, Char16* cmd_line, int show_cmd)
```

---

#### `macro`
```c3
macro int @win_to_void_main_noargs(#m, void* handle, void* prev_handle, Char16* cmd_line, int show_cmd)
```

---

#### `macro`
```c3
macro int @win_to_err_main_args(#m, void* handle, void* prev_handle, Char16* cmd_line, int show_cmd)
```

---

#### `macro`
```c3
macro int @win_to_int_main_args(#m, void* handle, void* prev_handle, Char16* cmd_line, int show_cmd)
```

---

#### `macro`
```c3
macro int @win_to_void_main_args(#m, void* handle, void* prev_handle, Char16* cmd_line, int show_cmd)
```

---

#### `macro`
```c3
macro int @win_to_err_main(#m, void* handle, void* prev_handle, Char16* cmd_line, int show_cmd)
```

---

#### `macro`
```c3
macro int @win_to_int_main(#m, void* handle, void* prev_handle, Char16* cmd_line, int show_cmd)
```

---

#### `macro`
```c3
macro int @win_to_void_main(#m, void* handle, void* prev_handle, Char16* cmd_line, int show_cmd)
```

---

#### `macro`
```c3
macro int @wmain_to_err_main_args(#m, int argc, Char16** argv)
```

---

#### `macro`
```c3
macro int @wmain_to_int_main_args(#m, int argc, Char16** argv)
```

---

#### `macro`
```c3
macro int @_wmain_runner(#m, int argc, Char16** argv)
```

---

#### `macro`
```c3
macro int @wmain_to_void_main_args(#m, int argc, Char16** argv)
```
### `std::core::mem`

---

#### `MAX_MEMORY_ALIGNMENT`
```c3
const MAX_MEMORY_ALIGNMENT
```

---

#### `DEFAULT_MEM_ALIGNMENT`
```c3
const DEFAULT_MEM_ALIGNMENT
```

---

#### `KB`
```c3
const ulong KB
```

---

#### `MB`
```c3
const ulong MB
```

---

#### `GB`
```c3
const ulong GB
```

---

#### `TB`
```c3
const ulong TB
```

---

#### `OUT_OF_MEMORY, INVALID_ALLOC_SIZE`
```c3
faultdef OUT_OF_MEMORY, INVALID_ALLOC_SIZE
```

---

#### `func`
```c3
fn usz os_pagesize()
```

---

#### `macro`
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

#### `macro`
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

#### `macro`
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

#### `macro`
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

#### `macro`
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

#### `macro`
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

#### `macro`
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

#### `macro`
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

#### `macro`
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

#### `macro`
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

#### `macro`
```c3
<*
 @param #x : "The variable or dereferenced pointer to load."
 @return "The value of the variable"
 @require $defined(&#x) : "This must be a variable or dereferenced pointer"
*>
macro @volatile_load(#x) @builtin
```


---

#### `macro`
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

#### `macro`
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

#### `macro`
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

#### `macro`
```c3
<*
 @require $success != AtomicOrdering.NOT_ATOMIC && $success != AtomicOrdering.UNORDERED : "Acquire ordering is not valid."
 @require $failure != AtomicOrdering.RELEASE && $failure != AtomicOrdering.ACQUIRE_RELEASE : "Acquire release is not valid."
*>
macro compare_exchange(ptr, compare, value, AtomicOrdering $success = SEQ_CONSISTENT, AtomicOrdering $failure = SEQ_CONSISTENT, bool $volatile = true, bool $weak = false, usz $alignment = 0)
```


---

#### `macro`
```c3
<*
 @require $success != AtomicOrdering.NOT_ATOMIC && $success != AtomicOrdering.UNORDERED : "Acquire ordering is not valid."
 @require $failure != AtomicOrdering.RELEASE && $failure != AtomicOrdering.ACQUIRE_RELEASE : "Acquire release is not valid."
*>
macro compare_exchange_volatile(ptr, compare, value, AtomicOrdering $success = SEQ_CONSISTENT, AtomicOrdering $failure = SEQ_CONSISTENT)
```


---

#### `func`
```c3
<*
 @require math::is_power_of_2(alignment)
*>
fn usz aligned_offset(usz offset, usz alignment)
```


---

#### `macro`
```c3
macro void* aligned_pointer(void* ptr, usz alignment)
```

---

#### `func`
```c3
<*
 @require math::is_power_of_2(alignment)
*>
fn bool ptr_is_aligned(void* ptr, usz alignment) @inline
```


---

#### `func`
```c3
fn bool ptr_is_page_aligned(void* ptr) @inline
```

---

#### `macro`
```c3
macro void zero_volatile(char[] data)
```

---

#### `macro`
```c3
macro void clear(void* dst, usz len, usz $dst_align = 0, bool $is_volatile = false)
```

---

#### `macro`
```c3
macro void clear_inline(void* dst, usz $len, usz $dst_align = 0, bool $is_volatile = false)
```

---

#### `macro`
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

#### `macro`
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

#### `macro`
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

#### `macro`
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

#### `macro`
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

#### `macro`
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

#### `macro`
```c3
<*
 @return `true if the alignment of the type exceeds DEFAULT_MEM_ALIGNMENT.`
*>
macro bool type_alloc_must_be_aligned($Type)
```


Check if an allocation must be aligned given the type.

---

#### `macro`
```c3
macro void @scoped(Allocator allocator; @body())
```

Run with a specific allocator inside of the macro body.

---

#### `macro`
```c3
<*
 @param $enabled : "Set to false to disable tracking"
*>
macro void @report_heap_allocs_in_scope($enabled = true; @body())
```


Run the tracking allocator in the scope, then
print out stats.

---

#### `macro`
```c3
<*
 @param $report : "Set to false to disable memory report"
*>
macro void @assert_leak($report = true; @body()) @builtin
```


Assert on memory leak in the scope of the macro body.

---

#### `macro`
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

#### `macro`
```c3
macro void @stack_pool(usz $size; @body) @builtin
```

---

#### `func`
```c3
fn PoolState temp_push()
```

Push the current temp allocator. A push must always be balanced with a pop using the current state.

---

#### `func`
```c3
fn void temp_pop(PoolState old_state)
```

Pop the current temp allocator. A pop must always be balanced with a push.

---

#### `macro`
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

#### `macro`
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

#### `macro`
```c3
macro TrackingEnv* get_tracking_env()
```

---

#### `macro`
```c3
<*
 @param value : "The value to clone"
 @return "A pointer to the cloned value"
 @require $alignof(value) <= mem::DEFAULT_MEM_ALIGNMENT : "Types with alignment exceeding the default must use 'clone_aligned' instead"
*>
macro @clone(value) @builtin @nodiscard
```


---

#### `macro`
```c3
<*
 @param value : "The value to clone"
 @return "A pointer to the cloned value, which must be released using free_aligned"
*>
macro @clone_aligned(value) @builtin @nodiscard
```


---

#### `macro`
```c3
<*
 @param value : "The value to clone"
 @return "A pointer to the cloned value"
*>
macro @tclone(value) @builtin @nodiscard
```


---

#### `func`
```c3
fn void* malloc(usz size) @builtin @inline @nodiscard
```

---

#### `func`
```c3
fn void* malloc_aligned(usz size, usz alignment) @builtin @inline @nodiscard
```

Allocate using an aligned allocation. This is necessary for types with a default memory alignment
exceeding DEFAULT_MEM_ALIGNMENT. IMPORTANT! It must be freed using free_aligned.

---

#### `func`
```c3
fn void* tmalloc(usz size, usz alignment = 0) @builtin @inline @nodiscard
```

---

#### `macro`
```c3
<*
 @require $vacount < 2 : "Too many arguments."
 @require $vacount == 0 ||| @assignable_to($vaexpr[0], $Type) : "The second argument must be an initializer for the type"
 @require $Type.alignof <= DEFAULT_MEM_ALIGNMENT : "Types with alignment exceeding the default must use 'alloc_aligned' instead"
*>
macro new($Type, ...) @nodiscard
```


---

#### `macro`
```c3
<*
 @require $vacount < 2 : "Too many arguments."
 @require $vacount == 0 ||| @assignable_to($vaexpr[0], $Type) : "The second argument must be an initializer for the type"
 @require $Type.alignof <= DEFAULT_MEM_ALIGNMENT : "Types with alignment exceeding the default must use 'alloc_aligned' instead"
*>
macro new_with_padding($Type, usz padding, ...) @nodiscard
```


---

#### `macro`
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

#### `macro`
```c3
<*
 @require $Type.alignof <= DEFAULT_MEM_ALIGNMENT : "Types with alignment exceeding the default must use 'alloc_aligned' instead"
*>
macro alloc($Type) @nodiscard
```


---

#### `macro`
```c3
<*
 @require $Type.alignof <= DEFAULT_MEM_ALIGNMENT : "Types with alignment exceeding the default must use 'alloc_aligned' instead"
*>
macro alloc_with_padding($Type, usz padding) @nodiscard
```


---

#### `macro`
```c3
macro alloc_aligned($Type) @nodiscard
```

Allocate using an aligned allocation. This is necessary for types with a default memory alignment
exceeding DEFAULT_MEM_ALIGNMENT. IMPORTANT! It must be freed using free_aligned.

---

#### `macro`
```c3
<*
 @require $vacount < 2 : "Too many arguments."
 @require $vacount == 0 ||| @assignable_to($vaexpr[0], $Type) : "The second argument must be an initializer for the type"
*>
macro tnew($Type, ...) @nodiscard
```


---

#### `macro`
```c3
<*
 @require $vacount < 2 : "Too many arguments."
 @require $vacount == 0 ||| @assignable_to($vaexpr[0], $Type) : "The second argument must be an initializer for the type"
*>
macro temp_with_padding($Type, usz padding, ...) @nodiscard
```


---

#### `macro`
```c3
macro talloc($Type) @nodiscard
```

---

#### `macro`
```c3
macro talloc_with_padding($Type, usz padding) @nodiscard
```

---

#### `macro`
```c3
<*
 @require $Type.alignof <= DEFAULT_MEM_ALIGNMENT : "Types with alignment exceeding the default must use 'new_array_aligned' instead"
*>
macro new_array($Type, usz elements) @nodiscard
```


---

#### `macro`
```c3
macro new_array_aligned($Type, usz elements) @nodiscard
```

Allocate using an aligned allocation. This is necessary for types with a default memory alignment
exceeding DEFAULT_MEM_ALIGNMENT. IMPORTANT! It must be freed using free_aligned.

---

#### `macro`
```c3
<*
 @require $Type.alignof <= DEFAULT_MEM_ALIGNMENT : "Types with alignment exceeding the default must use 'alloc_array_aligned' instead"
*>
macro alloc_array($Type, usz elements) @nodiscard
```


---

#### `macro`
```c3
macro alloc_array_aligned($Type, usz elements) @nodiscard
```

Allocate using an aligned allocation. This is necessary for types with a default memory alignment
exceeding DEFAULT_MEM_ALIGNMENT. IMPORTANT! It must be freed using free_aligned.

---

#### `macro`
```c3
macro talloc_array($Type, usz elements) @nodiscard
```

---

#### `macro`
```c3
macro temp_array($Type, usz elements) @nodiscard
```

---

#### `func`
```c3
fn void* calloc(usz size) @builtin @inline @nodiscard
```

---

#### `func`
```c3
fn void* calloc_aligned(usz size, usz alignment) @builtin @inline @nodiscard
```

Allocate using an aligned allocation. This is necessary for types with a default memory alignment
exceeding DEFAULT_MEM_ALIGNMENT. IMPORTANT! It must be freed using free_aligned.

---

#### `func`
```c3
fn void* tcalloc(usz size, usz alignment = 0) @builtin @inline @nodiscard
```

---

#### `func`
```c3
fn void* realloc(void *ptr, usz new_size) @builtin @inline @nodiscard
```

---

#### `func`
```c3
fn void* realloc_aligned(void *ptr, usz new_size, usz alignment) @builtin @inline @nodiscard
```

---

#### `func`
```c3
fn void free(void* ptr) @builtin @inline
```

---

#### `func`
```c3
fn void free_aligned(void* ptr) @builtin @inline
```

---

#### `func`
```c3
fn void* trealloc(void* ptr, usz size, usz alignment = mem::DEFAULT_MEM_ALIGNMENT) @builtin @inline @nodiscard
```

---

#### `macro`
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
### `std::core::mem @if(env::NO_LIBC)`

---

#### `func`
```c3
fn CInt __memcmp(void* s1, void* s2, usz n) @weak @export("memcmp")
```

---

#### `func`
```c3
fn void* __memset(void* str, CInt c, usz n) @weak @export("memset")
```

---

#### `func`
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

#### `macro`
```c3
macro Type UnalignedRef.get(self)
```

---

#### `macro`
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

#### `func`
```c3
<*
 @param [inout] data : "The memory to use for the arena."
*>
fn ArenaAllocator* ArenaAllocator.init(&self, char[] data)
```


Initialize a memory arena for use using the provided bytes.

---

#### `func`
```c3
fn void ArenaAllocator.clear(&self)
```

Reset the usage completely.

---

#### `macro`
```c3
<*
 @param [inout] bytes : `The bytes to use, may be empty.`
 @return `An arena allocator using the bytes`
*>
macro ArenaAllocator* wrap(char[] bytes)
```


Given some memory, create an arena allocator on the stack for it.

---

#### `func`
```c3
<*
 @return `The value to pass to 'reset' in order to reset to the current use.`
*>
fn usz ArenaAllocator.mark(&self)
```


"Mark" the current state of the arena allocator by returning the use count.

---

#### `func`
```c3
<*
 @param mark : `The previous mark.`
 @require mark <= self.used : "Invalid mark - out of range"
*>
fn void ArenaAllocator.reset(&self, usz mark)
```


Reset to a previous mark.

---

#### `func`
```c3
<*
 @require ptr != null
*>
fn void ArenaAllocator.release(&self, void* ptr, bool) @dynamic
```


Implements the Allocator interface method.

---

#### `func`
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

#### `func`
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

#### `macro`
```c3
macro usz ExtraPage.pagesize(&self)
```

---

#### `macro`
```c3
macro bool ExtraPage.is_aligned(&self)
```

---

#### `func`
```c3
<*
 @require size >= 16
*>
fn BackedArenaAllocator*? new_backed_allocator(usz size, Allocator allocator)
```


---

#### `func`
```c3
fn void BackedArenaAllocator.destroy(&self)
```

---

#### `func`
```c3
fn usz BackedArenaAllocator.mark(&self)
```

---

#### `func`
```c3
fn void BackedArenaAllocator.release(&self, void* old_pointer, bool) @dynamic
```

---

#### `func`
```c3
fn void BackedArenaAllocator.reset(&self, usz mark)
```

---

#### `func`
```c3
fn void*? BackedArenaAllocator.resize(&self, void* pointer, usz size, usz alignment) @dynamic
```

---

#### `func`
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

#### `func`
```c3
<*
 @param [&inout] allocator
 @require page_size >= 128
*>
fn void DynamicArenaAllocator.init(&self, Allocator allocator, usz page_size)
```


---

#### `func`
```c3
fn void DynamicArenaAllocator.free(&self)
```

---

#### `func`
```c3
<*
 @require ptr != null
 @require self.page != null  : `tried to free pointer on invalid allocator`
*>
fn void DynamicArenaAllocator.release(&self, void* ptr, bool) @dynamic
```


---

#### `func`
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

#### `func`
```c3
fn void DynamicArenaAllocator.reset(&self)
```

---

#### `func`
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

#### `func`
```c3
<*
 @require allocator != null  : "An underlying memory provider must be given"
 @require !self.free_list : "The allocator may not be already initialized"
*>
fn void SimpleHeapAllocator.init(&self, MemoryAllocFn allocator)
```


---

#### `func`
```c3
fn void*? SimpleHeapAllocator.acquire(&self, usz size, AllocInitType init_type, usz alignment) @dynamic
```

---

#### `func`
```c3
fn void*? SimpleHeapAllocator.resize(&self, void* old_pointer, usz size, usz alignment) @dynamic
```

---

#### `func`
```c3
fn void SimpleHeapAllocator.release(&self, void* old_pointer, bool aligned) @dynamic
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

#### `func`
```c3
<*
 @param [&inout] allocator
*>
fn void OnStackAllocator.init(&self, char[] data, Allocator allocator)
```


Initialize a memory arena for use using the provided bytes.

---

#### `func`
```c3
fn void OnStackAllocator.free(&self)
```

---

#### `OnStackAllocatorHeader`
```c3
struct OnStackAllocatorHeader
```

---

#### `func`
```c3
<*
 @require old_pointer != null
*>
fn void OnStackAllocator.release(&self, void* old_pointer, bool aligned) @dynamic
```


---

#### `func`
```c3
<*
 @require size > 0
 @require old_pointer != null
 @require alignment <= mem::MAX_MEMORY_ALIGNMENT : `alignment too big`
*>
fn void*? OnStackAllocator.resize(&self, void* old_pointer, usz size, usz alignment) @dynamic
```


---

#### `func`
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
const MAX_BACKTRACE
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

#### `func`
```c3
<*
 @param [&inout] allocator : "The allocator to track"
*>
fn void TrackingAllocator.init(&self, Allocator allocator)
```


Initialize a tracking allocator to wrap (and track) another allocator.

---

#### `func`
```c3
fn void TrackingAllocator.free(&self)
```

Free this tracking allocator.

---

#### `func`
```c3
<*
 @return "the total allocated memory not yet freed."
*>
fn usz TrackingAllocator.allocated(&self)
```


---

#### `func`
```c3
<*
 @return "the total memory allocated (freed or not)."
*>
fn usz TrackingAllocator.total_allocated(&self)
```


---

#### `func`
```c3
<*
 @return "the total number of allocations (freed or not)."
*>
fn usz TrackingAllocator.total_allocation_count(&self)
```


---

#### `func`
```c3
fn Allocation[] TrackingAllocator.allocations_tlist(&self, Allocator allocator)
```

---

#### `func`
```c3
<*
 @return "the number of non-freed allocations."
*>
fn usz TrackingAllocator.allocation_count(&self)
```


---

#### `func`
```c3
fn void*? TrackingAllocator.acquire(&self, usz size, AllocInitType init_type, usz alignment) @dynamic
```

---

#### `func`
```c3
fn void*? TrackingAllocator.resize(&self, void* old_pointer, usz size, usz alignment) @dynamic
```

---

#### `func`
```c3
fn void TrackingAllocator.release(&self, void* old_pointer, bool is_aligned) @dynamic
```

---

#### `func`
```c3
fn void TrackingAllocator.clear(&self)
```

---

#### `func`
```c3
fn bool TrackingAllocator.has_leaks(&self)
```

---

#### `func`
```c3
fn void TrackingAllocator.print_report(&self)
```

---

#### `func`
```c3
fn void? TrackingAllocator.fprint_report(&self, OutStream out)
```

---

#### `DEFAULT_SIZE_PREFIX`
```c3
const DEFAULT_SIZE_PREFIX
```

---

#### `DEFAULT_SIZE_PREFIX_ALIGNMENT`
```c3
const DEFAULT_SIZE_PREFIX_ALIGNMENT
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

#### `func`
```c3
fn usz alignment_for_allocation(usz alignment) @inline
```

---

#### `macro`
```c3
macro void* malloc(Allocator allocator, usz size) @nodiscard
```

---

#### `macro`
```c3
macro void*? malloc_try(Allocator allocator, usz size) @nodiscard
```

---

#### `macro`
```c3
macro void* calloc(Allocator allocator, usz size) @nodiscard
```

---

#### `macro`
```c3
macro void*? calloc_try(Allocator allocator, usz size) @nodiscard
```

---

#### `macro`
```c3
macro void* realloc(Allocator allocator, void* ptr, usz new_size) @nodiscard
```

---

#### `macro`
```c3
macro void*? realloc_try(Allocator allocator, void* ptr, usz new_size) @nodiscard
```

---

#### `macro`
```c3
macro void free(Allocator allocator, void* ptr)
```

---

#### `macro`
```c3
macro void*? malloc_aligned(Allocator allocator, usz size, usz alignment) @nodiscard
```

---

#### `macro`
```c3
macro void*? calloc_aligned(Allocator allocator, usz size, usz alignment) @nodiscard
```

---

#### `macro`
```c3
macro void*? realloc_aligned(Allocator allocator, void* ptr, usz new_size, usz alignment) @nodiscard
```

---

#### `macro`
```c3
macro void free_aligned(Allocator allocator, void* ptr)
```

---

#### `macro`
```c3
<*
 @require $Type.alignof <= mem::DEFAULT_MEM_ALIGNMENT : "Types with alignment exceeding the default must use 'new_aligned' instead"
 @require $vacount < 2 : "Too many arguments."
 @require $vacount == 0 ||| @assignable_to($vaexpr[0], $Type) : "The second argument must be an initializer for the type"
*>
macro new(Allocator allocator, $Type, ...) @nodiscard
```


---

#### `macro`
```c3
<*
 @require $Type.alignof <= mem::DEFAULT_MEM_ALIGNMENT : "Types with alignment exceeding the default must use 'new_aligned' instead"
 @require $vacount < 2 : "Too many arguments."
 @require $vacount == 0 ||| @assignable_to($vaexpr[0], $Type) : "The second argument must be an initializer for the type"
*>
macro new_try(Allocator allocator, $Type, ...) @nodiscard
```


---

#### `macro`
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

#### `macro`
```c3
<*
 @require $Type.alignof <= mem::DEFAULT_MEM_ALIGNMENT
*>
macro new_with_padding(Allocator allocator, $Type, usz padding) @nodiscard
```


---

#### `macro`
```c3
<*
 @require $Type.alignof <= mem::DEFAULT_MEM_ALIGNMENT : "Types with alignment exceeding the default must use 'alloc_aligned' instead"
*>
macro alloc(Allocator allocator, $Type) @nodiscard
```


---

#### `macro`
```c3
<*
 @require $Type.alignof <= mem::DEFAULT_MEM_ALIGNMENT : "Types with alignment exceeding the default must use 'alloc_aligned' instead"
*>
macro alloc_try(Allocator allocator, $Type) @nodiscard
```


---

#### `macro`
```c3
macro alloc_aligned(Allocator allocator, $Type) @nodiscard
```

Allocate using an aligned allocation. This is necessary for types with a default memory alignment
exceeding DEFAULT_MEM_ALIGNMENT. IMPORTANT! It must be freed using free_aligned.

---

#### `macro`
```c3
<*
 @require $Type.alignof <= mem::DEFAULT_MEM_ALIGNMENT
*>
macro alloc_with_padding(Allocator allocator, $Type, usz padding) @nodiscard
```


---

#### `macro`
```c3
<*
 @require $Type.alignof <= mem::DEFAULT_MEM_ALIGNMENT : "Types with alignment exceeding the default must use 'new_array_aligned' instead"
*>
macro new_array(Allocator allocator, $Type, usz elements) @nodiscard
```


---

#### `macro`
```c3
<*
 @require $Type.alignof <= mem::DEFAULT_MEM_ALIGNMENT : "Types with alignment exceeding the default must use 'new_array_aligned' instead"
*>
macro new_array_try(Allocator allocator, $Type, usz elements) @nodiscard
```


---

#### `macro`
```c3
macro new_array_aligned(Allocator allocator, $Type, usz elements) @nodiscard
```

Allocate using an aligned allocation. This is necessary for types with a default memory alignment
exceeding DEFAULT_MEM_ALIGNMENT. IMPORTANT! It must be freed using free_aligned.

---

#### `macro`
```c3
<*
 @require $Type.alignof <= mem::DEFAULT_MEM_ALIGNMENT : "Types with alignment exceeding the default must use 'alloc_array_aligned' instead"
*>
macro alloc_array(Allocator allocator, $Type, usz elements) @nodiscard
```


---

#### `macro`
```c3
macro alloc_array_aligned(Allocator allocator, $Type, usz elements) @nodiscard
```

Allocate using an aligned allocation. This is necessary for types with a default memory alignment
exceeding DEFAULT_MEM_ALIGNMENT. IMPORTANT! It must be freed using free_aligned.

---

#### `macro`
```c3
<*
 @require $Type.alignof <= mem::DEFAULT_MEM_ALIGNMENT : "Types with alignment exceeding the default must use 'alloc_array_aligned' instead"
*>
macro alloc_array_try(Allocator allocator, $Type, usz elements) @nodiscard
```


---

#### `macro`
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

#### `macro`
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

#### `func`
```c3
fn any clone_any(Allocator allocator, any value) @nodiscard
```

---

#### `macro`
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

#### `macro`
```c3
macro void? @aligned_free(#free_fn, void* old_pointer)
```

---

#### `macro`
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

#### `func`
```c3
fn PoolState push_pool(usz reserve = 0)
```

---

#### `func`
```c3
fn void pop_pool(PoolState old)
```

---

#### `macro`
```c3
macro Allocator heap() @deprecated("Use 'mem' instead.")
```

---

#### `macro`
```c3
macro Allocator temp() @deprecated("Use 'tmem' instead")
```

---

#### `tmem`
```c3
alias tmem @builtin = current_temp
```

---

#### `func`
```c3
fn void destroy_temp_allocators()
```

Call this to destroy any memory used by the temp allocators. This will invalidate all temp memory.

---

#### `func`
```c3
fn void*? LazyTempAllocator.acquire(&self, usz bytes, AllocInitType init_type, usz alignment) @dynamic
```

---

#### `func`
```c3
fn void*? LazyTempAllocator.resize(&self, void* old_ptr, usz new_bytes, usz alignment) @dynamic
```

---

#### `func`
```c3
fn void LazyTempAllocator.release(&self, void* old_ptr, bool aligned) @dynamic
```

---

#### `NULL_ALLOCATOR`
```c3
const NullAllocator NULL_ALLOCATOR
```

---

#### `NullAllocator`
```c3
typedef NullAllocator (Allocator) = uptr
```

---

#### `func`
```c3
fn void*? NullAllocator.acquire(&self, usz bytes, AllocInitType init_type, usz alignment) @dynamic
```

---

#### `func`
```c3
fn void*? NullAllocator.resize(&self, void* old_ptr, usz new_bytes, usz alignment) @dynamic
```

---

#### `func`
```c3
fn void NullAllocator.release(&self, void* old_ptr, bool aligned) @dynamic
```

---

#### `WASM_BLOCK_SIZE`
```c3
const usz WASM_BLOCK_SIZE
```

---

#### `WasmMemory`
```c3
struct WasmMemory
```

---

#### `func`
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

#### `macro`
```c3
macro usz TempAllocatorPage.pagesize(&self)
```

---

#### `macro`
```c3
macro bool TempAllocatorPage.is_aligned(&self)
```

---

#### `func`
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

#### `func`
```c3
<*
 @require !self.derived
*>
fn TempAllocator*? TempAllocator.derive_allocator(&self, usz reserve = 0)
```


---

#### `func`
```c3
fn void TempAllocator.reset(&self)
```

Reset the entire temp allocator, which will merge all the children into it.

---

#### `func`
```c3
<*
 @require self.allocated : "Only a top level allocator should be freed."
*>
fn void TempAllocator.free(&self)
```


---

#### `func`
```c3
fn void TempAllocator.release(&self, void* old_pointer, bool) @dynamic
```

---

#### `func`
```c3
fn void*? TempAllocator.resize(&self, void* pointer, usz size, usz alignment) @dynamic
```

---

#### `func`
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

#### `func`
```c3
fn void*? LibcAllocator.acquire(&self, usz bytes, AllocInitType init_type, usz alignment) @dynamic
```

---

#### `func`
```c3
fn void*? LibcAllocator.resize(&self, void* old_ptr, usz new_bytes, usz alignment) @dynamic
```

---

#### `func`
```c3
fn void LibcAllocator.release(&self, void* old_ptr, bool aligned) @dynamic
```
### `std::core::mem::allocator @if((env::POSIX || env::WIN32) && $feature(VMEM_TEMP))`

---

#### `func`
```c3
fn TempAllocator*? new_temp_allocator(Allocator allocator, usz size, usz reserve = temp_allocator_reserve_size, usz min_size = temp_allocator_min_size, usz realloc_size = temp_allocator_realloc_size)
```

---

#### `TempAllocator`
```c3
struct TempAllocator (Allocator)
```

---

#### `func`
```c3
<*
 @require size > 0
 @require !alignment || math::is_power_of_2(alignment)
 @require alignment <= mem::MAX_MEMORY_ALIGNMENT : `alignment too big`
*>
fn void*? TempAllocator.acquire(&self, usz size, AllocInitType init_type, usz alignment) @dynamic
```


---

#### `func`
```c3
fn TempAllocator*? TempAllocator.derive_allocator(&self, usz reserve = 0)
```

---

#### `func`
```c3
fn void TempAllocator.reset(&self)
```

Reset the entire temp allocator, destroying all children

---

#### `func`
```c3
fn void TempAllocator.free(&self)
```

---

#### `func`
```c3
fn void*? TempAllocator.resize(&self, void* pointer, usz size, usz alignment) @dynamic
```

---

#### `func`
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
const LibcAllocator LIBC_ALLOCATOR
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

#### `func`
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

#### `func`
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

#### `func`
```c3
fn bool Vmem.owns_pointer(&self, void* ptr) @inline
```

---

#### `func`
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

#### `func`
```c3
<*
 @require ptr != null
*>
fn void Vmem.release(&self, void* ptr, bool) @dynamic
```


Implements the Allocator interface method.

---

#### `func`
```c3
fn usz Vmem.mark(&self)
```

---

#### `func`
```c3
<*
 @require mark <= self.allocated : "Invalid mark"
*>
fn void Vmem.reset(&self, usz mark)
```


---

#### `func`
```c3
fn void Vmem.free(&self)
```
### `std::core::mem::allocator @if(env::POSIX)`

---

#### `func`
```c3
fn void*? LibcAllocator.acquire(&self, usz bytes, AllocInitType init_type, usz alignment) @dynamic
```

---

#### `func`
```c3
fn void*? LibcAllocator.resize(&self, void* old_ptr, usz new_bytes, usz alignment) @dynamic
```

---

#### `func`
```c3
fn void LibcAllocator.release(&self, void* old_ptr, bool aligned) @dynamic
```
### `std::core::mem::allocator @if(env::WIN32)`

---

#### `func`
```c3
fn void*? LibcAllocator.acquire(&self, usz bytes, AllocInitType init_type, usz alignment) @dynamic
```

---

#### `func`
```c3
fn void*? LibcAllocator.resize(&self, void* old_ptr, usz new_bytes, usz alignment) @dynamic
```

---

#### `func`
```c3
fn void LibcAllocator.release(&self, void* old_ptr, bool aligned) @dynamic
```
### `std::core::mem::mempool`

---

#### `INITIAL_CAPACITY`
```c3
const INITIAL_CAPACITY
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

#### `macro`
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

#### `macro`
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

#### `macro`
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

#### `macro`
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

#### `func`
```c3
<*
 @require self.initialized : "The block pool must be initialized"
*>
fn void FixedBlockPool.free(&self)
```


Free up the entire block pool

---

#### `func`
```c3
<*
 @require self.initialized : "The block pool must be initialized"
*>
fn void* FixedBlockPool.alloc(&self)
```


Allocate an block on the block pool, re-uses previously deallocated blocks

---

#### `func`
```c3
<*
 @require self.initialized : "The block pool must be initialized"
 @require self.check_ptr(ptr) : "The pointer should be part of the pool"
*>
fn void FixedBlockPool.dealloc(&self, void* ptr)
```


Deallocate a block from the block pool
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

#### `macro`
```c3
<*
 @require @assignable_to(refcounted, RefCounted*) : "Expected a ref counted value"
*>
macro retain(refcounted)
```


---

#### `macro`
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

#### `func`
```c3
fn Ref wrap(Type* ptr, Allocator allocator = mem)
```

---

#### `macro`
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

#### `func`
```c3
fn Ref* Ref.retain(&self)
```

---

#### `func`
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

#### `func`
```c3
fn usz aligned_alloc_size(usz size)
```

---

#### `func`
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

#### `func`
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

#### `func`
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

#### `func`
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

#### `func`
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

#### `func`
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

#### `func`
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

#### `macro`
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

#### `macro`
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

#### `func`
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

#### `func`
```c3
<*
 @require self.ptr != null : "Virtual memory must be initialized to call destroy"
*>
fn void? VirtualMemory.destroy(&self)
```


Releases the memory region
### `std::core::mem::volatile { Type }`

---

#### `Volatile`
```c3
typedef Volatile @structlike = Type
```

---

#### `macro`
```c3
macro Type Volatile.get(&self)
```

---

#### `macro`
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

#### `macro`
```c3
macro @enum_lookup($Type, #value, value)
```

---

#### `macro`
```c3
macro @enum_lookup_new($Type, $name, value)
```

---

#### `BenchmarkFn`
```c3
alias BenchmarkFn = fn void ()
```

---

#### `DEFAULT_BENCHMARK_WARMUP_ITERATIONS`
```c3
const DEFAULT_BENCHMARK_WARMUP_ITERATIONS
```

---

#### `DEFAULT_BENCHMARK_MAX_ITERATIONS`
```c3
const DEFAULT_BENCHMARK_MAX_ITERATIONS
```

---

#### `func`
```c3
fn void set_benchmark_warmup_iterations(uint value) @builtin
```

---

#### `func`
```c3
fn void set_benchmark_max_iterations(uint value) @builtin
```

---

#### `func`
```c3
fn void set_benchmark_func_iterations(String func, uint value) @builtin
```

---

#### `macro`
```c3
macro @start_benchmark()
```

---

#### `macro`
```c3
macro @end_benchmark()
```

---

#### `macro`
```c3
macro @log_benchmark(msg, args...)
```

---

#### `func`
```c3
fn bool run_benchmarks(BenchmarkUnit[] benchmarks)
```

---

#### `func`
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

#### `func`
```c3
fn TestUnit[] test_collection_create(Allocator allocator)
```

---

#### `func`
```c3
fn int cmp_test_unit(TestUnit a, TestUnit b)
```

---

#### `func`
```c3
fn bool default_test_runner(String[] args)
```
### `std::core::runtime @if(WASM_NOLIBC)`

---

#### `extern func`
```c3
extern fn void __wasm_call_ctors()
```
### `std::core::sanitizer`

---

#### `macro`
```c3
macro void annotate_contiguous_container(void* beg, void* end, void* old_mid, void* new_mid)
```

---

#### `macro`
```c3
macro void annotate_double_ended_contiguous_container(void* storage_beg, void* storage_end, void* old_container_beg, void* old_container_end, void* new_container_beg, void* new_container_end)
```

---

#### `macro`
```c3
macro void print_stack_trace()
```

---

#### `func`
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

#### `extern func`
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

#### `macro`
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

#### `macro`
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

#### `macro`
```c3
<*
 @return "True if 'addr' is poisoned (that is, 1-byte read/write access to this address would result in an error report from ASan). Otherwise returns false."
 @param addr : "Address to check."
*>
macro bool address_is_poisoned(void* addr)
```


Checks if an address is poisoned.

---

#### `macro`
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

#### `func`
```c3
fn void set_error_report_callback(ErrorCallback callback)
```

Sets the callback function to be called during ASan error reporting.
### `std::core::sanitizer::asan @if(env::ADDRESS_SANITIZER)`

---

#### `extern func`
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
const MutexFlags MUTEX_LINKER_INIT
```

---

#### `MUTEX_WRITE_REENTRANT`
```c3
const MutexFlags MUTEX_WRITE_REENTRANT
```

---

#### `MUTEX_READ_REENTRANT`
```c3
const MutexFlags MUTEX_READ_REENTRANT
```

---

#### `MUTEX_NOT_STATIC`
```c3
const MutexFlags MUTEX_NOT_STATIC
```

---

#### `MUTEX_READ_LOCK`
```c3
const MutexFlags MUTEX_READ_LOCK
```

---

#### `MUTEX_TRY_LOCK`
```c3
const MutexFlags MUTEX_TRY_LOCK
```

---

#### `MUTEX_TRY_LOCK_FAILED`
```c3
const MutexFlags MUTEX_TRY_LOCK_FAILED
```

---

#### `MUTEX_RECURSIVE_LOCK`
```c3
const MutexFlags MUTEX_RECURSIVE_LOCK
```

---

#### `MUTEX_RECURSIVE_UNLOCK`
```c3
const MutexFlags MUTEX_RECURSIVE_UNLOCK
```

---

#### `MUTEX_TRY_READ_LOCK`
```c3
const MutexFlags MUTEX_TRY_READ_LOCK
```

---

#### `MUTEX_TRY_READ_LOCK_FAILED`
```c3
const MutexFlags MUTEX_TRY_READ_LOCK_FAILED
```

---

#### `macro`
```c3
macro void mutex_create(void* addr, MutexFlags flags)
```

---

#### `macro`
```c3
macro void mutex_destroy(void* addr, MutexFlags flags)
```

---

#### `macro`
```c3
macro void mutex_pre_lock(void* addr, MutexFlags flags)
```

---

#### `macro`
```c3
macro void mutex_post_lock(void* addr, MutexFlags flags, CInt recursion)
```

---

#### `macro`
```c3
macro CInt mutex_pre_unlock(void* addr, MutexFlags flags)
```

---

#### `macro`
```c3
macro void mutex_post_unlock(void* addr, MutexFlags flags)
```

---

#### `macro`
```c3
macro void mutex_pre_signal(void* addr, MutexFlags flags)
```

---

#### `macro`
```c3
macro void mutex_post_signal(void* addr, MutexFlags flags)
```

---

#### `macro`
```c3
macro void mutex_pre_divert(void* addr, MutexFlags flags)
```

---

#### `macro`
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
alias Char16 = ushort
```

Char32 is a UTF32 codepoint
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

#### `macro`
```c3
<*
 @param $string : "The string to encode"
*>
macro Char32* @wstring32(String $string) @builtin
```


Create a pointer to an UTF32 encoded string at compile time.

---

#### `macro`
```c3
<*
 @param $string : "The string to encode"
*>
macro Char32[] @char32(String $string) @builtin
```


Create a slice of an UTF32 encoded string at compile time.

---

#### `macro`
```c3
<*
 @param $string : "The string to encode"
*>
macro WString @wstring(String $string) @builtin
```


Create a WString (an UTF16 encoded string) at compile time.

---

#### `macro`
```c3
<*
 @param $string : "The string to encode"
*>
macro Char16[] @char16(String $string) @builtin
```


Create a slice of an UTF32 encoded string at compile time.

---

#### `macro`
```c3
macro String @sprintf(String $format, ...) @builtin @const
```

---

#### `func`
```c3
<*
 @param [in] fmt : `The formatting string`
*>
fn ZString tformat_zstr(String fmt, args...) @format(0)
```


Return a temporary ZString created using the formatting function.

---

#### `func`
```c3
<*
 @param [inout] allocator : `The allocator to use`
 @param [in] fmt : `The formatting string`
*>
fn String format(Allocator allocator, String fmt, args...) @format(1)
```


Return a new String created using the formatting function.

---

#### `func`
```c3
<*
 @param [inout] buffer : `The buffer to use`
 @param [in] fmt : `The formatting string`
*>
fn String bformat(char[] buffer, String fmt, args...) @format(1)
```


Return a new String created using the formatting function.

---

#### `func`
```c3
<*
 @param [in] fmt : `The formatting string`
*>
fn String tformat(String fmt, args...) @format(0)
```


Return a temporary String created using the formatting function.

---

#### `macro`
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

#### `func`
```c3
fn String join(Allocator allocator, String[] s, String joiner)
```

---

#### `func`
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

#### `func`
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

#### `func`
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

#### `func`
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

#### `func`
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

#### `func`
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

#### `func`
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

#### `func`
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

#### `func`
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

#### `func`
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

#### `func`
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

#### `func`
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

#### `func`
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

#### `func`
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

#### `func`
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

#### `func`
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

#### `func`
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

#### `func`
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

#### `func`
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

#### `func`
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

#### `func`
```c3
fn bool ZString.eq(self, ZString other) @operator(==)
```

---

#### `func`
```c3
fn String ZString.str_view(self)
```

---

#### `func`
```c3
fn usz ZString.char_len(str)
```

---

#### `func`
```c3
fn usz ZString.len(self)
```

---

#### `func`
```c3
fn usz WString.len(self)
```

---

#### `func`
```c3
fn ZString String.zstr_copy(self, Allocator allocator)
```

---

#### `func`
```c3
fn String String.concat(self, Allocator allocator, String s2)
```

---

#### `func`
```c3
fn String String.tconcat(self, String s2)
```

---

#### `func`
```c3
fn ZString String.zstr_tcopy(self)
```

---

#### `func`
```c3
fn String String.copy(self, Allocator allocator)
```

Copy this string, by duplicating the string, always adding a zero byte
sentinel, so that it safely can be converted to a ZString by a
cast.

---

#### `func`
```c3
fn void String.free(&self, Allocator allocator)
```

---

#### `func`
```c3
fn String String.tcopy(self)
```

---

#### `func`
```c3
fn String ZString.copy(self, Allocator allocator)
```

---

#### `func`
```c3
fn String ZString.tcopy(self)
```

---

#### `func`
```c3
<*
 @return "The UTF-16 string as a slice, allocated using the given allocator"
 @return? INVALID_UTF8 : "If the string contained an invalid UTF-8 sequence"
*>
fn Char16[]? String.to_utf16(self, Allocator allocator)
```


Convert an UTF-8 string to UTF-16

---

#### `func`
```c3
fn Char16[]? String.to_temp_utf16(self)
```

---

#### `func`
```c3
fn WString? String.to_wstring(self, Allocator allocator)
```

---

#### `func`
```c3
fn WString? String.to_temp_wstring(self)
```

---

#### `func`
```c3
fn Char32[]? String.to_utf32(self, Allocator allocator)
```

---

#### `func`
```c3
fn Char32[]? String.to_temp_utf32(self)
```

---

#### `func`
```c3
<*
 @param [inout] self
 @pure
*>
fn void String.convert_to_lower(self)
```


Convert a string to ASCII lower case in place.

---

#### `func`
```c3
fn String String.to_lower_copy(self, Allocator allocator)
```

---

#### `func`
```c3
fn String String.to_lower_tcopy(self)
```

---

#### `func`
```c3
<*
 @param [inout] self
 @pure
*>
fn void String.convert_to_upper(self)
```


Convert a string to ASCII upper case.

---

#### `func`
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

#### `func`
```c3
fn String String.capitalize_copy(self, Allocator allocator)
```

---

#### `func`
```c3
<*
 @param [in] self
 @return `"FooBar" from "foo_bar" the resulting pointer may safely be cast to ZString.`
*>
fn String String.snake_to_pascal_copy(self, Allocator allocator)
```


Convert a string from `snake_case` to PascalCase.

---

#### `func`
```c3
<*
 @param [inout] self
*>
fn void String.convert_snake_to_pascal(&self)
```


Movifies the current string from `snake_case` to PascalCase.

---

#### `func`
```c3
<*
 @param [in] self
 @return `"foo_bar" from "FooBar" the resulting pointer may safely be cast to ZString.`
*>
fn String String.pascal_to_snake_copy(self, Allocator allocator)
```


Convert a string from `PascalCase` to `snake_case`.

---

#### `func`
```c3
fn StringIterator String.iterator(self)
```

---

#### `func`
```c3
<*
 @param [in] self
 @return `a temporary String converted to ASCII upper case.`
*>
fn String String.to_upper_tcopy(self)
```


---

#### `func`
```c3
fn String? from_utf32(Allocator allocator, Char32[] utf32)
```

---

#### `func`
```c3
fn String? from_utf16(Allocator allocator, Char16[] utf16)
```

---

#### `func`
```c3
fn String? from_wstring(Allocator allocator, WString wstring)
```

---

#### `func`
```c3
fn String? tfrom_wstring(WString wstring)
```

---

#### `func`
```c3
fn String? tfrom_utf16(Char16[] utf16)
```

---

#### `func`
```c3
fn usz String.utf8_codepoints(s)
```

---

#### `func`
```c3
fn bool String.is_zstr(self) @deprecated("Unsafe, use copy instead")
```

Determine whether the current string actually points to a ZString-like string.

This is done by looking at the byte one step after the end of the string. If this
is zero, it is considered zero terminated.

This function can safely be used with data pointing to null. However, it will not
work correctly if the pointer is invalid, for example it is already freed.

---

#### `func`
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

#### `macro`
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

#### `func`
```c3
fn int128? String.to_int128(self, int base = 10)
```

---

#### `func`
```c3
fn long? String.to_long(self, int base = 10)
```

---

#### `func`
```c3
fn int? String.to_int(self, int base = 10)
```

---

#### `func`
```c3
fn short? String.to_short(self, int base = 10)
```

---

#### `func`
```c3
fn ichar? String.to_ichar(self, int base = 10)
```

---

#### `func`
```c3
fn uint128? String.to_uint128(self, int base = 10)
```

---

#### `func`
```c3
fn ulong? String.to_ulong(self, int base = 10)
```

---

#### `func`
```c3
fn uint? String.to_uint(self, int base = 10)
```

---

#### `func`
```c3
fn ushort? String.to_ushort(self, int base = 10)
```

---

#### `func`
```c3
fn char? String.to_uchar(self, int base = 10)
```

---

#### `func`
```c3
fn double? String.to_double(self)
```

---

#### `func`
```c3
fn float? String.to_float(self)
```

---

#### `func`
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

#### `func`
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

#### `func`
```c3
fn Splitter String.splitter(self, String split) @deprecated("Use tokenize_all instead")
```

---

#### `macro`
```c3
<*
 @param [&inout] allocator : "The allocator to use"
 @param x : "The struct to create a description of"
*>
macro String from_struct(Allocator allocator, x)
```


This macro will create a string description of a struct.

---

#### `macro`
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

#### `func`
```c3
fn void Splitter.reset(&self)
```

---

#### `func`
```c3
fn String? Splitter.next(&self)
```

---

#### `INVALID_ESCAPE_SEQUENCE, UNTERMINATED_STRING, INVALID_HEX_ESCAPE, INVALID_UNICODE_ESCAPE`
```c3
faultdef INVALID_ESCAPE_SEQUENCE, UNTERMINATED_STRING, INVALID_HEX_ESCAPE, INVALID_UNICODE_ESCAPE
```

---

#### `func`
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

#### `func`
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

#### `func`
```c3
<*
 @param s : "The string to check"
 @return "The length needed for the escaped version"
*>
fn usz escape_len(String s)
```


Calculate the length needed for an escaped string (including quotes).

---

#### `func`
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

#### `func`
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

#### `func`
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
const KMAX
```

---

#### `MASK`
```c3
const MASK
```

---

#### `B1B_DIG`
```c3
const B1B_DIG
```

---

#### `B1B_MAX`
```c3
const uint[2] B1B_MAX
```

---

#### `macro`
```c3
<*
 @require chars.len > 0
*>
macro double? decfloat(char[] chars, int $bits, int $emin, int sign)
```


---

#### `macro`
```c3
macro double? hexfloat(char[] chars, int $bits, int $emin, int sign)
```
### `std::core::string::ansi`

---

#### `Ansi`
```c3
enum Ansi : const inline String
```

---

#### `macro`
```c3
<*
 @return `the formatting char for the given background color`
*>
macro String color_8bit(char $index, bool $bg = false) @const
```


8-bit color code

---

#### `macro`
```c3
<*
 @return `the string for the given foreground color`
*>
macro String color_rgb(char $r, char $g, char $b, bool $bg = false) @const
```


24-bit color code

---

#### `macro`
```c3
<*
 @require $rgb <= 0xFF_FF_FF : `Expected a 24 bit RGB value`
 @return `the string char for the given foreground color`
*>
macro String color(uint $rgb, bool $bg = false) @const
```


24-bit color code rgb

---

#### `func`
```c3
<*
 @require rgb <= 0xFF_FF_FF : `Expected a 24 bit RGB value`
 @return `the string char for the given foreground color`
*>
fn String make_color(Allocator mem, uint rgb, bool bg = false)
```


24-bit color code rgb

---

#### `func`
```c3
<*
 @require rgb <= 0xFF_FF_FF : `Expected a 24 bit RGB value`
 @return `the string char for the given foreground color`
*>
fn String make_tcolor(uint rgb, bool bg = false)
```


24-bit color code rgb

---

#### `func`
```c3
<*
 @return `the string char for the given foreground color`
*>
fn String make_color_rgb(Allocator mem, char r, char g, char b, bool bg = false)
```


24-bit color code rgb

---

#### `func`
```c3
<*
 @return `the string char for the given foreground color`
*>
fn String make_tcolor_rgb(char r, char g, char b, bool bg = false)
```


24-bit color code rgb
### `std::core::string::conv`

---

#### `func`
```c3
<*
 @param c : `The utf32 codepoint to convert`
 @param [out] output : `the resulting buffer`
 @return? string::CONVERSION_FAILED
*>
fn usz? char32_to_utf8(Char32 c, char[] output)
```


---

#### `func`
```c3
<*
 @param c : `The character to convert.`
 @param [inout] output : `the resulting UTF16 buffer to write to.`
*>
fn void char32_to_utf16_unsafe(Char32 c, Char16** output)
```


Convert a code pointer into 1-2 UTF16 characters.

---

#### `func`
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

#### `func`
```c3
<*
 @param c : `The utf32 codepoint to convert`
 @param [inout] output : `the resulting buffer`
*>
fn usz char32_to_utf8_unsafe(Char32 c, char** output)
```


---

#### `func`
```c3
<*
 @param [in] ptr : `pointer to the first character to parse`
 @param [inout] size : `Set to max characters to read, set to characters read`
 @return `the parsed 32 bit codepoint`
*>
fn Char32? utf8_to_char32(char* ptr, usz* size)
```


---

#### `func`
```c3
<*
 @param utf8 : `An UTF-8 encoded slice of bytes`
 @return `the number of encoded code points`
*>
fn usz utf8_codepoints(String utf8)
```


---

#### `func`
```c3
<*
 @param [in] utf32 : `the utf32 data to calculate from`
 @return `the length of the resulting UTF8 array`
*>
fn usz utf8len_for_utf32(Char32[] utf32)
```


Calculate the UTF8 length required to encode an UTF32 array.

---

#### `func`
```c3
<*
 @param [in] utf16 : `the utf16 data to calculate from`
 @return `the length of the resulting UTF8 array`
*>
fn usz utf8len_for_utf16(Char16[] utf16)
```


Calculate the UTF8 length required to encode an UTF16 array.

---

#### `func`
```c3
<*
 @param utf8 : `the utf8 data to calculate from`
 @return `the length of the resulting UTF16 array`
*>
fn usz utf16len_for_utf8(String utf8)
```


Calculate the UTF16 length required to encode a UTF8 array.

---

#### `func`
```c3
<*
 @param [in] utf32 : `the UTF32 array to check the length for`
 @return `the required length of an UTF16 array to hold the UTF32 data.`
*>
fn usz utf16len_for_utf32(Char32[] utf32)
```


---

#### `func`
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

#### `func`
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

#### `func`
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

#### `func`
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

#### `func`
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

#### `func`
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

#### `func`
```c3
fn void StringIterator.reset(&self)
```

---

#### `func`
```c3
fn Char32? StringIterator.next(&self)
```

---

#### `func`
```c3
fn Char32? StringIterator.peek(&self)
```

---

#### `func`
```c3
fn bool StringIterator.has_next(&self)
```

---

#### `func`
```c3
fn Char32? StringIterator.get(&self)
```
### `std::core::test`

---

#### `macro`
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

#### `macro`
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

#### `macro`
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

#### `macro`
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

#### `macro`
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

#### `macro`
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

#### `macro`
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

#### `macro`
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

#### `macro`
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

#### `macro`
```c3
<*
 @param left : `left argument of any comparable type`
 @param right : `right argument of any comparable type`
 @require runtime::test_context != null : "Only allowed in @test functions"
*>
macro le(left, right)
```


Check if left <= right
### `std::core::types`

---

#### `VALUE_OUT_OF_RANGE, VALUE_OUT_OF_UNSIGNED_RANGE`
```c3
faultdef VALUE_OUT_OF_RANGE, VALUE_OUT_OF_UNSIGNED_RANGE
```

---

#### `macro`
```c3
<*
 @require $Type.kindof.is_int() : "Type was not an integer"
 @require v.type.kindof == ENUM : "Value was not an enum"
*>
macro any_to_enum_ordinal(any v, $Type)
```


---

#### `macro`
```c3
<*
 @require $Type.kindof.is_int() : "Type was not an integer"
 @require v.type.kindof.is_int() : "Value was not an integer"
*>
macro any_to_int(any v, $Type)
```


---

#### `func`
```c3
fn bool typeid.is_subtype_of(self, typeid other)
```

---

#### `macro`
```c3
macro bool is_subtype_of($Type, $OtherType)
```

---

#### `macro`
```c3
macro bool is_numerical($Type)
```

---

#### `func`
```c3
fn bool TypeKind.is_int(kind) @inline
```

---

#### `macro`
```c3
macro bool is_slice_convertable($Type)
```

---

#### `macro`
```c3
macro bool is_bool($Type) @const
```

---

#### `macro`
```c3
macro bool is_int($Type) @const
```

---

#### `macro`
```c3
<*
 @require is_numerical($Type) : "Expected a numerical type"
*>
macro bool is_signed($Type) @const
```


---

#### `macro`
```c3
<*
 @require is_numerical($Type) : "Expected a numerical type"
*>
macro bool is_unsigned($Type) @const
```


---

#### `macro`
```c3
macro typeid flat_type($Type) @const
```

---

#### `macro`
```c3
macro TypeKind flat_kind($Type) @const
```

---

#### `macro`
```c3
macro bool is_indexable($Type) @const
```

---

#### `macro`
```c3
macro bool is_ref_indexable($Type) @const
```

---

#### `macro`
```c3
macro bool is_flat_intlike($Type) @const
```

---

#### `macro`
```c3
macro bool is_intlike($Type) @const
```

---

#### `macro`
```c3
macro bool is_underlying_int($Type) @const
```

---

#### `macro`
```c3
macro bool is_float($Type) @const
```

---

#### `macro`
```c3
macro bool is_floatlike($Type) @const
```

---

#### `macro`
```c3
macro bool is_vector($Type) @const
```

---

#### `macro`
```c3
macro typeid inner_type($Type) @const
```

---

#### `macro`
```c3
macro TypeKind inner_kind($Type) @const
```

---

#### `macro`
```c3
macro bool is_same($TypeA, $TypeB) @const
```

---

#### `macro`
```c3
macro bool @has_same(#a, #b, ...) @const
```

---

#### `macro`
```c3
macro bool may_load_atomic($Type) @const
```

---

#### `macro`
```c3
macro lower_to_atomic_compatible_type($Type) @const
```

---

#### `macro`
```c3
macro bool is_promotable_to_floatlike($Type) @const
```

---

#### `macro`
```c3
macro bool is_promotable_to_float($Type) @const
```

---

#### `macro`
```c3
macro bool is_same_vector_type($Type1, $Type2) @const
```

---

#### `macro`
```c3
macro bool has_equals($Type) @const
```

---

#### `macro`
```c3
macro bool is_equatable_type($Type) @const
```

---

#### `macro`
```c3
macro bool implements_copy($Type) @const
```

Checks if a type implements the copy protocol.

---

#### `macro`
```c3
macro bool @equatable_value(#value) @const
```

---

#### `macro`
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

#### `macro`
```c3
macro bool @is_same_type(#value1, #value2) @const
```

Return true if two values have the same type before any conversions.

---

#### `macro`
```c3
macro bool @is_bool(#value) @const
```

---

#### `macro`
```c3
macro bool @is_int(#value) @const
```

---

#### `macro`
```c3
macro bool @is_flat_intlike(#value) @const
```

---

#### `macro`
```c3
macro bool @is_floatlike(#value) @const
```

---

#### `macro`
```c3
macro bool @is_float(#value) @const
```

---

#### `macro`
```c3
macro bool @is_promotable_to_floatlike(#value) @const
```

---

#### `macro`
```c3
macro bool @is_promotable_to_float(#value) @const
```

---

#### `macro`
```c3
macro bool @is_vector(#value) @const
```

---

#### `macro`
```c3
macro bool @is_same_vector_type(#value1, #value2) @const
```

---

#### `macro`
```c3
macro bool @assign_to(#value1, #value2) @const
```

---

#### `macro`
```c3
macro bool @is_lvalue(#value)
```

---

#### `macro`
```c3
macro bool @is_const(#foo) @const @builtin
```

---

#### `macro`
```c3
macro promote_int(x)
```

---

#### `macro`
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

#### `macro`
```c3
macro promote_int_same(x, y)
```

---

#### `macro`
```c3
macro TypeKind @inner_kind(#value) @const
```
### `std::crypto`

---

#### `func`
```c3
fn bool safe_compare(void* data1, void* data2, usz len)
```
### `std::crypto::dh`

---

#### `func`
```c3
fn BigInt generate_secret(BigInt p, BigInt x, BigInt y)
```

---

#### `func`
```c3
fn BigInt public_key(BigInt p, BigInt g, BigInt x)
```
### `std::crypto::ed25519`

---

#### `Ed`
```c3
alias Ed25519PrivateKey = char[32]
alias Ed25519PublicKey = char[Ed25519PrivateKey.len]
alias Ed25519Signature = char[2 * Ed25519PublicKey.len]
```

---

#### `func`
```c3
<*
 @param [in] private_key : "32 bytes of cryptographically secure random data"
 @require private_key.len == Ed25519PrivateKey.len
*>
fn Ed25519PublicKey public_keygen(char[] private_key)
```


Generate a public key from a private key.

---

#### `func`
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

#### `func`
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
### `std::crypto::rc4`

---

#### `Rc`
```c3
struct Rc4
```

---

#### `func`
```c3
<*
 @param [in] key : "The key to use"
 @require key.len > 0 : "The key must be at least 1 byte long"
*>
fn void Rc4.init(&self, char[] key)
```


Initialize the RC4 state.

---

#### `func`
```c3
<*
 @param [in] key
 @param [inout] data
*>
fn void crypt(char[] key, char[] data)
```


Run a single pass of en/decryption using a particular key.

---

#### `func`
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

#### `func`
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
const char NO_PAD
```

---

#### `DEFAULT_PAD`
```c3
const char DEFAULT_PAD
```

---

#### `func`
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

#### `func`
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

#### `func`
```c3
fn String? tencode(char[] code, char padding = DEFAULT_PAD, Base32Alphabet* alphabet = &STANDARD) @inline
```

---

#### `func`
```c3
fn char[]? tdecode(char[] code, char padding = DEFAULT_PAD, Base32Alphabet* alphabet = &STANDARD) @inline
```

---

#### `func`
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

#### `func`
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

#### `func`
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

#### `func`
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
const int STD_PADDING
```

---

#### `NO_PADDING`
```c3
const int NO_PADDING
```

---

#### `Alphabet`
```c3
typedef Alphabet = char[32]
```

---

#### `STD_ALPHABET`
```c3
const Alphabet STD_ALPHABET
```

---

#### `HEX_ALPHABET`
```c3
const Alphabet HEX_ALPHABET
```

---

#### `STANDARD`
```c3
const Base32Alphabet STANDARD
```

---

#### `HEX`
```c3
const Base32Alphabet HEX
```
### `std::encoding::base64`

---

#### `NO_PAD`
```c3
const char NO_PAD
```

---

#### `DEFAULT_PAD`
```c3
const char DEFAULT_PAD
```

---

#### `Base`
```c3
struct Base64Alphabet
```

---

#### `STANDARD`
```c3
const Base64Alphabet STANDARD
```

---

#### `URL`
```c3
const Base64Alphabet URL
```

---

#### `STD_ALPHABET`
```c3
const STD_ALPHABET
```

---

#### `URL_ALPHABET`
```c3
const URL_ALPHABET
```

---

#### `func`
```c3
fn String encode(Allocator allocator, char[] src, char padding = DEFAULT_PAD, Base64Alphabet* alphabet = &STANDARD)
```

---

#### `func`
```c3
fn char[]? decode(Allocator allocator, char[] src, char padding = DEFAULT_PAD, Base64Alphabet* alphabet = &STANDARD)
```

---

#### `func`
```c3
fn String tencode(char[] code, char padding = DEFAULT_PAD, Base64Alphabet* alphabet = &STANDARD) @inline
```

---

#### `func`
```c3
fn char[]? tdecode(char[] code, char padding = DEFAULT_PAD, Base64Alphabet* alphabet = &STANDARD) @inline
```

---

#### `func`
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

#### `func`
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

#### `func`
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

#### `func`
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

#### `func`
```c3
fn usz? CsvRow.to_format(&self, Formatter* f) @dynamic
```

---

#### `func`
```c3
fn usz CsvRow.len(&self) @operator(len)
```

---

#### `func`
```c3
<*
 @require col < self.list.len
*>
fn String CsvRow.get_col(&self, usz col) @operator([])
```


---

#### `func`
```c3
fn void CsvReader.init(&self, InStream stream, String separator = ",")
```

---

#### `func`
```c3
<*
 @param [&inout] allocator
*>
fn CsvRow? CsvReader.read_row(self, Allocator allocator)
```


---

#### `func`
```c3
fn CsvRow? CsvReader.tread_row(self)
```

---

#### `func`
```c3
<*
 @require self.allocator != null  : `Row already freed`
*>
fn void CsvRow.free(&self)
```


---

#### `func`
```c3
fn void? CsvReader.skip_row(self) @maydiscard
```

---

#### `macro`
```c3
macro void? @each_row(InStream stream, String separator = ",", int max_rows = int.max; @body(String[] row)) @maydiscard
```

---

#### `macro`
```c3
macro void? CsvReader.@each_row(self, int rows = int.max; @body(String[] row)) @maydiscard
```
### `std::encoding::hex`

---

#### `func`
```c3
fn String encode_buffer(char[] code, char[] buffer)
```

---

#### `func`
```c3
fn char[]? decode_buffer(char[] code, char[] buffer)
```

---

#### `func`
```c3
fn String encode(Allocator allocator, char[] code)
```

---

#### `func`
```c3
fn char[]? decode(Allocator allocator, char[] code)
```

---

#### `func`
```c3
fn String tencode(char[] code) @inline
```

---

#### `func`
```c3
fn char[]? tdecode(char[] code) @inline
```

---

#### `func`
```c3
<*
 @param n : "Size of the input to be encoded."
 @return "The size of the input once encoded."
*>
fn usz encode_len(usz n)
```


Calculate the size of the encoded data.

---

#### `func`
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

#### `macro`
```c3
<*
 @param n : "Size of the input to be decoded."
 @return "The size of the input once decoded."
*>
macro usz decode_len(usz n)
```


Calculate the size of the decoded data.

---

#### `func`
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

#### `func`
```c3
fn Object*? parse_string(Allocator allocator, String s)
```

---

#### `func`
```c3
fn Object*? tparse_string(String s)
```

---

#### `func`
```c3
fn Object*? parse(Allocator allocator, InStream s)
```

---

#### `func`
```c3
fn Object*? tparse(InStream s)
```

---

#### `func`
```c3
fn JsonTokenType? lex_string(JsonContext* context)
```
### `std::experimental::scheduler{Event}`

---

#### `FrameScheduler`
```c3
struct FrameScheduler
```

---

#### `func`
```c3
fn void FrameScheduler.init(&self)
```

---

#### `macro`
```c3
macro void FrameScheduler.@destroy(&self; @destruct(Event e))
```

---

#### `func`
```c3
fn void FrameScheduler.queue_delayed_event(&self, Event event, Duration delay)
```

---

#### `func`
```c3
fn bool FrameScheduler.has_delayed(&self)
```

---

#### `func`
```c3
fn void FrameScheduler.queue_event(&self, Event event)
```

---

#### `func`
```c3
fn Event? FrameScheduler.pop_event(&self)
```
### `std::hash::a5hash`

---

#### `func`
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

#### `func`
```c3
fn void Adler32.init(&self)
```

---

#### `func`
```c3
fn void Adler32.updatec(&self, char c)
```

---

#### `func`
```c3
fn void Adler32.update(&self, char[] data)
```

---

#### `func`
```c3
fn uint Adler32.final(&self)
```

---

#### `func`
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

#### `func`
```c3
fn void Crc32.init(&self, uint seed = 0)
```

---

#### `func`
```c3
fn void Crc32.updatec(&self, char c)
```

---

#### `func`
```c3
fn void Crc32.update(&self, char[] data)
```

---

#### `func`
```c3
fn uint Crc32.final(&self)
```

---

#### `func`
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

#### `func`
```c3
fn void Crc64.init(&self, uint seed = 0)
```

---

#### `func`
```c3
fn void Crc64.updatec(&self, char c)
```

---

#### `func`
```c3
fn void Crc64.update(&self, char[] data)
```

---

#### `func`
```c3
fn ulong Crc64.final(&self)
```

---

#### `func`
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

#### `func`
```c3
fn void Fnv32a.init(&self)
```

---

#### `func`
```c3
fn void Fnv32a.update(&self, char[] data)
```

---

#### `macro`
```c3
macro void Fnv32a.update_char(&self, char c)
```

---

#### `func`
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

#### `func`
```c3
fn void Fnv64a.init(&self)
```

---

#### `func`
```c3
fn void Fnv64a.update(&self, char[] data)
```

---

#### `macro`
```c3
macro void Fnv64a.update_char(&self, char c)
```

---

#### `func`
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

#### `func`
```c3
fn char[HASH_BYTES] hash(char[] key, char[] message)
```

---

#### `func`
```c3
<*
 @require output.len > 0 : "Output must be greater than zero"
 @require output.len < int.max / HASH_BYTES : "Output is too large"
*>
fn void pbkdf2(char[] pw, char[] salt, uint iterations, char[] output)
```


---

#### `func`
```c3
fn void Hmac.init(&self, char[] key)
```

---

#### `func`
```c3
fn void Hmac.update(&self, char[] data)
```

---

#### `func`
```c3
fn char[HASH_BYTES] Hmac.final(&self)
```

---

#### `macro`
```c3
macro @derive(Hmac *hmac_start, char[] salt, uint iterations, usz index, char[] out)
```
### `std::hash::komi`

---

#### `func`
```c3
fn ulong hash(char[] data, ulong seed = 0)
```
### `std::hash::md5`

---

#### `BLOCK_BYTES`
```c3
const BLOCK_BYTES
```

---

#### `HASH_BYTES`
```c3
const HASH_BYTES
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

#### `func`
```c3
fn char[HASH_BYTES] hash(char[] data)
```

---

#### `func`
```c3
fn void Md5.init(&self)
```

---

#### `func`
```c3
fn void Md5.update(&ctx, char[] data)
```

---

#### `func`
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

#### `func`
```c3
fn uint128 hash(char[] data, ulong seed = 0)
```

---

#### `func`
```c3
fn void MetroHash128.init(&self, ulong seed = 0)
```

---

#### `func`
```c3
fn void MetroHash128.update(&self, char[] data)
```

---

#### `func`
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

#### `func`
```c3
fn ulong hash(char[] data, ulong seed = 0)
```

---

#### `func`
```c3
fn void MetroHash64.init(&self, ulong seed = 0)
```

---

#### `func`
```c3
fn void MetroHash64.update(&self, char[] data)
```

---

#### `func`
```c3
fn ulong MetroHash64.final(&self)
```
### `std::hash::sha1`

---

#### `BLOCK_BYTES`
```c3
const BLOCK_BYTES
```

---

#### `HASH_BYTES`
```c3
const HASH_BYTES
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

#### `func`
```c3
fn char[HASH_BYTES] hash(char[] data)
```

---

#### `func`
```c3
fn void Sha1.init(&self)
```

---

#### `func`
```c3
<*
 @param [in] data
 @require data.len <= uint.max
*>
fn void Sha1.update(&self, char[] data)
```


---

#### `func`
```c3
fn char[HASH_BYTES] Sha1.final(&self)
```
### `std::hash::sha256`

---

#### `BLOCK_SIZE`
```c3
const BLOCK_SIZE
```

---

#### `HASH_SIZE`
```c3
const HASH_SIZE
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

#### `func`
```c3
fn char[HASH_SIZE] hash(char[] data)
```

---

#### `func`
```c3
fn void Sha256.init(&self)
```

---

#### `func`
```c3
<*
 @param [in] data
 @require data.len <= uint.max
*>
fn void Sha256.update(&self, char[] data)
```


---

#### `func`
```c3
fn char[HASH_SIZE] Sha256.final(&self)
```
### `std::hash::sha512`

---

#### `BLOCK_SIZE`
```c3
const BLOCK_SIZE
```

---

#### `HASH_SIZE`
```c3
const HASH_SIZE
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

#### `HashTruncationType`
```c3
enum HashTruncationType : uint (uint truncation_width, ulong[8] initial_state)
```

---

#### `func`
```c3
<*
 @param [in] data
*>
fn char[HASH_SIZE] hash(char[] data)
```


---

#### `func`
```c3
fn void Sha512.init(&self)
```

---

#### `func`
```c3
<*
 @param [in] data
 @require data.len <= ulong.max
*>
fn void Sha512.update(&self, char[] data)
```


---

#### `func`
```c3
fn char[HASH_SIZE] Sha512.final(&self)
```
### `std::hash::siphash { OutType, BLOCK_ROUNDS, FINALIZE_ROUNDS }`

---

#### `SipHash`
```c3
struct SipHash
```

---

#### `func`
```c3
fn OutType hash(char[] data, uint128 key)
```

---

#### `func`
```c3
fn void SipHash.init(&self, uint128 key)
```

---

#### `func`
```c3
<*
 @param [in] data : "Bytes to hash"
*>
fn void SipHash.update(&self, char[] data)
```


---

#### `func`
```c3
fn OutType SipHash.final(&self)
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
const BLOCK_SIZE
```

---

#### `HASH_SIZE`
```c3
const HASH_SIZE
```

---

#### `BLOCK_128`
```c3
const BLOCK_128
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

#### `func`
```c3
fn char[HASH_SIZE] hash(char[] data)
```

---

#### `macro`
```c3
macro void Whirlpool.init(&self)
```

---

#### `func`
```c3
<*
 @require data.len <= isz.max : "Update with smaller slices"
*>
fn void Whirlpool.update(&self, char[] data)
```


---

#### `func`
```c3
fn char[HASH_SIZE] Whirlpool.final(&self)
```

---

#### `ROUNDS`
```c3
const ROUNDS
```
### `std::hash::wyhash2`

---

#### `func`
```c3
fn ulong wyr3(char* in, usz len) @inline
```

---

#### `func`
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

#### `func`
```c3
fn void BitReader.init(&self, InStream byte_reader)
```

---

#### `func`
```c3
fn void BitReader.clear(&self) @inline
```

---

#### `func`
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
const int WRITER_BITS
```

---

#### `func`
```c3
fn void BitWriter.init(&self, OutStream byte_writer)
```

---

#### `func`
```c3
fn void? BitWriter.flush(&self)
```

---

#### `func`
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
const int PRINTF_NTOA_BUFFER_SIZE
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

#### `macro`
```c3
macro bool is_struct_with_default_print($Type)
```

---

#### `macro`
```c3
<*
 @require @typekind(value) == STRUCT || @typekind(value) == BITSTRUCT : `This macro is only valid on macros`
*>
macro usz? struct_to_format(value, Formatter* f, bool $force_dump)
```


Introspect a struct and print it to a formatter

---

#### `func`
```c3
fn usz? ReflectedParam.to_format(&self, Formatter* f) @dynamic
```

---

#### `func`
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

#### `func`
```c3
fn void Formatter.init(&self, OutputFn out_fn, void* data = null)
```

---

#### `func`
```c3
fn usz? Formatter.print_with_function(&self, Printable arg)
```

---

#### `macro`
```c3
macro usz? @report_fault(Formatter* f, $fault)
```

---

#### `macro`
```c3
macro usz? @wrap_bad(Formatter* f, #action)
```

---

#### `func`
```c3
fn usz? Formatter.vprintf(&self, String format, any[] anys)
```

---

#### `func`
```c3
fn usz? Formatter.print(&self, String str)
```

---

#### `XDIGITS_H`
```c3
const char[16] XDIGITS_H
```

---

#### `XDIGITS_L`
```c3
const char[16] XDIGITS_L
```

---

#### `BAD_FORMAT`
```c3
faultdef BAD_FORMAT
```

---

#### `func`
```c3
fn usz? print_hex_chars(Formatter* f, char[] out, bool uppercase) @inline
```

---

#### `macro`
```c3
macro Formatter.first_err(&self, fault f)
```

---

#### `func`
```c3
fn usz? Formatter.pad(&self, char c, isz width, isz len) @inline
```

---

#### `func`
```c3
fn char* fmt_u(uint128 x, char* s)
```

---

#### `func`
```c3
fn usz? Formatter.out_chars(&self, char[] s)
```

---

#### `FloatFormatting`
```c3
enum FloatFormatting
```

---

#### `func`
```c3
fn usz? Formatter.etoa(&self, double y)
```

---

#### `func`
```c3
fn usz? Formatter.ftoa(&self, double y)
```

---

#### `func`
```c3
fn usz? Formatter.gtoa(&self, double y)
```

---

#### `func`
```c3
fn usz? Formatter.atoa(&self, double y)
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

#### `macro`
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

#### `macro`
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

#### `macro`
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

#### `macro`
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

#### `func`
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

#### `func`
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

#### `macro`
```c3
<*
 @require @is_outstream(out) : "The output must implement OutStream"
*>
macro usz? fprintn(out, x = "")
```


---

#### `macro`
```c3
macro void print(x)
```

Print any value to stdout.

---

#### `macro`
```c3
<*
 @param x : "The value to print"
*>
macro void printn(x = "")
```


Print any value to stdout, appending an '\n’ after.

---

#### `macro`
```c3
macro void eprint(x)
```

Print any value to stderr.

---

#### `macro`
```c3
<*
 @param x : "The value to print"
*>
macro void eprintn(x = "")
```


Print any value to stderr, appending an '\n’ after.

---

#### `func`
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

#### `func`
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

#### `func`
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

#### `func`
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

#### `func`
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

#### `func`
```c3
fn usz? available(InStream s)
```

---

#### `macro`
```c3
macro bool @is_instream(#expr)
```

---

#### `macro`
```c3
macro bool @is_outstream(#expr)
```

---

#### `macro`
```c3
<*
 @param [&out] ref
 @require @is_instream(stream) : "Expected a stream"
*>
macro usz? read_any(stream, any ref)
```


---

#### `macro`
```c3
<*
 @param [&in] ref : "the object to write."
 @require @is_outstream(stream)
 @ensure return == ref.type.sizeof
*>
macro usz? write_any(stream, any ref)
```


---

#### `macro`
```c3
<*
 @require @is_instream(stream)
*>
macro usz? read_all(stream, char[] buffer)
```


---

#### `macro`
```c3
<*
 @require @is_instream(stream)
*>
macro char[]? read_fully(Allocator allocator, stream)
```


---

#### `macro`
```c3
<*
 @require @is_outstream(stream)
*>
macro usz? write_all(stream, char[] buffer)
```


---

#### `macro`
```c3
macro usz? read_using_read_byte(s, char[] buffer)
```

---

#### `macro`
```c3
macro void? write_byte_using_write(s, char c)
```

---

#### `macro`
```c3
macro char? read_byte_using_read(s)
```

---

#### `ReadByteFn`
```c3
alias ReadByteFn = fn char?()
```

---

#### `macro`
```c3
macro usz? write_using_write_byte(s, char[] bytes)
```

---

#### `macro`
```c3
macro void? pushback_using_seek(s)
```

---

#### `func`
```c3
fn usz? copy_to(InStream in, OutStream dst, char[] buffer = {})
```

---

#### `macro`
```c3
<*
 @require @is_instream(stream)
 @require @typekind(x_ptr) == POINTER && $typeof(x_ptr).inner.kindof.is_int()
*>
macro usz? read_varint(stream, x_ptr)
```


---

#### `macro`
```c3
<*
 @require @is_outstream(stream)
 @require @typekind(x).is_int()
*>
macro usz? write_varint(stream, x)
```


---

#### `macro`
```c3
<*
 @require @is_instream(stream)
*>
macro ushort? read_be_ushort(stream)
```


---

#### `macro`
```c3
<*
 @require @is_instream(stream)
*>
macro short? read_be_short(stream)
```


---

#### `macro`
```c3
<*
 @require @is_outstream(stream)
*>
macro void? write_be_short(stream, ushort s)
```


---

#### `macro`
```c3
<*
 @require @is_instream(stream)
*>
macro uint? read_be_uint(stream)
```


---

#### `macro`
```c3
<*
 @require @is_instream(stream)
*>
macro int? read_be_int(stream)
```


---

#### `macro`
```c3
<*
 @require @is_outstream(stream)
*>
macro void? write_be_int(stream, uint s)
```


---

#### `macro`
```c3
<*
 @require @is_instream(stream)
*>
macro ulong? read_be_ulong(stream)
```


---

#### `macro`
```c3
<*
 @require @is_instream(stream)
*>
macro long? read_be_long(stream)
```


---

#### `macro`
```c3
<*
 @require @is_outstream(stream)
*>
macro void? write_be_long(stream, ulong s)
```


---

#### `macro`
```c3
<*
 @require @is_instream(stream)
*>
macro uint128? read_be_uint128(stream)
```


---

#### `macro`
```c3
<*
 @require @is_instream(stream)
*>
macro int128? read_be_int128(stream)
```


---

#### `macro`
```c3
<*
 @require @is_outstream(stream)
*>
macro void? write_be_int128(stream, uint128 s)
```


---

#### `macro`
```c3
<*
 @require @is_outstream(stream)
 @require data.len < 256 : "Data exceeded 255"
*>
macro usz? write_tiny_bytearray(stream, char[] data)
```


---

#### `macro`
```c3
<*
 @require @is_instream(stream)
*>
macro char[]? read_tiny_bytearray(stream, Allocator allocator)
```


---

#### `macro`
```c3
<*
 @require @is_outstream(stream)
 @require data.len < 0x1000 : "Data exceeded 65535"
*>
macro usz? write_short_bytearray(stream, char[] data)
```


---

#### `macro`
```c3
<*
 @require @is_instream(stream)
*>
macro char[]? read_short_bytearray(stream, Allocator allocator)
```


---

#### `func`
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

#### `func`
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

#### `func`
```c3
fn String ReadBuffer.str_view(&self) @inline
```

---

#### `func`
```c3
fn void? ReadBuffer.close(&self) @dynamic
```

---

#### `func`
```c3
fn usz? ReadBuffer.read(&self, char[] bytes) @dynamic
```

---

#### `func`
```c3
fn char? ReadBuffer.read_byte(&self) @dynamic
```

---

#### `WriteBuffer`
```c3
struct WriteBuffer (OutStream)
```

---

#### `func`
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

#### `func`
```c3
fn String WriteBuffer.str_view(&self) @inline
```

---

#### `func`
```c3
fn void? WriteBuffer.close(&self) @dynamic
```

---

#### `func`
```c3
fn void? WriteBuffer.flush(&self) @dynamic
```

---

#### `func`
```c3
fn usz? WriteBuffer.write(&self, char[] bytes) @dynamic
```

---

#### `func`
```c3
fn void? WriteBuffer.write_byte(&self, char c) @dynamic
```

---

#### `ByteBuffer`
```c3
struct ByteBuffer (InStream, OutStream)
```

---

#### `func`
```c3
<*
 @require self.bytes.len == 0 : "Buffer already initialized."
*>
fn ByteBuffer* ByteBuffer.init(&self, Allocator allocator, usz max_read, usz initial_capacity = 16)
```


ByteBuffer provides a streamable read/write buffer.
max_read defines how many bytes might be kept before its internal buffer is shrinked.

---

#### `func`
```c3
fn ByteBuffer* ByteBuffer.tinit(&self, usz max_read, usz initial_capacity = 16)
```

---

#### `func`
```c3
<*
 @require buf.len > 0
 @require self.bytes.len == 0 : "Buffer already initialized."
*>
fn ByteBuffer* ByteBuffer.init_with_buffer(&self, char[] buf)
```


---

#### `func`
```c3
fn void ByteBuffer.free(&self)
```

---

#### `func`
```c3
fn usz? ByteBuffer.write(&self, char[] bytes) @dynamic
```

---

#### `func`
```c3
fn void? ByteBuffer.write_byte(&self, char c) @dynamic
```

---

#### `func`
```c3
fn usz? ByteBuffer.read(&self, char[] bytes) @dynamic
```

---

#### `func`
```c3
fn char? ByteBuffer.read_byte(&self) @dynamic
```

---

#### `func`
```c3
fn void? ByteBuffer.pushback_byte(&self) @dynamic
```

Only the last byte of a successful read can be pushed back.

---

#### `func`
```c3
fn usz? ByteBuffer.seek(&self, isz offset, Seek seek) @dynamic
```

---

#### `func`
```c3
fn usz? ByteBuffer.available(&self) @inline @dynamic
```

---

#### `func`
```c3
fn void ByteBuffer.grow(&self, usz n)
```

---

#### `macro`
```c3
macro ByteBuffer.shrink(&self)
```

---

#### `ByteReader`
```c3
struct ByteReader (InStream)
```

---

#### `func`
```c3
fn usz ByteReader.len(&self) @dynamic
```

---

#### `func`
```c3
fn ByteReader* ByteReader.init(&self, char[] bytes)
```

---

#### `func`
```c3
fn usz? ByteReader.read(&self, char[] bytes) @dynamic
```

---

#### `func`
```c3
fn char? ByteReader.read_byte(&self) @dynamic
```

---

#### `func`
```c3
fn void? ByteReader.pushback_byte(&self) @dynamic
```

---

#### `func`
```c3
fn usz? ByteReader.seek(&self, isz offset, Seek seek) @dynamic
```

---

#### `func`
```c3
fn usz? ByteReader.write_to(&self, OutStream writer) @dynamic
```

---

#### `func`
```c3
fn usz? ByteReader.available(&self) @inline @dynamic
```

---

#### `ByteWriter`
```c3
struct ByteWriter (OutStream)
```

---

#### `func`
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

#### `func`
```c3
<*
 @param [&inout] self
 @require self.bytes.len == 0 : "Init may not run on already initialized data"
 @ensure self.index == 0
*>
fn ByteWriter* ByteWriter.tinit(&self)
```


---

#### `func`
```c3
fn ByteWriter* ByteWriter.init_with_buffer(&self, char[] data)
```

---

#### `func`
```c3
fn void? ByteWriter.destroy(&self) @dynamic
```

---

#### `func`
```c3
fn String ByteWriter.str_view(&self) @inline
```

---

#### `func`
```c3
fn void? ByteWriter.ensure_capacity(&self, usz len) @inline
```

---

#### `func`
```c3
fn usz? ByteWriter.write(&self, char[] bytes) @dynamic
```

---

#### `func`
```c3
fn void? ByteWriter.write_byte(&self, char c) @dynamic
```

---

#### `func`
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

#### `func`
```c3
<*
 @param [&inout] wrapped_stream : "The stream to read from"
 @param limit : "The max limit to read"
*>
fn LimitReader* LimitReader.init(&self, InStream wrapped_stream, usz limit)
```


---

#### `func`
```c3
fn void? LimitReader.close(&self) @dynamic
```

---

#### `func`
```c3
fn usz? LimitReader.read(&self, char[] bytes) @dynamic
```

---

#### `func`
```c3
fn char? LimitReader.read_byte(&self) @dynamic
```

---

#### `func`
```c3
fn usz? LimitReader.available(&self) @inline @dynamic
```

---

#### `MultiReader`
```c3
struct MultiReader (InStream)
```

---

#### `func`
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

#### `func`
```c3
<*
 @param [&inout] self
 @require self.readers.len == 0 : "Init may not run on already initialized data"
 @ensure self.index == 0
*>
fn MultiReader* MultiReader.tinit(&self, InStream... readers)
```


---

#### `func`
```c3
fn void MultiReader.free(&self)
```

---

#### `func`
```c3
fn usz? MultiReader.read(&self, char[] bytes) @dynamic
```

---

#### `func`
```c3
fn char? MultiReader.read_byte(&self) @dynamic
```

---

#### `MultiWriter`
```c3
struct MultiWriter (OutStream)
```

---

#### `func`
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

#### `func`
```c3
<*
 @param [&inout] self
 @require writers.len > 0
 @require self.writers.len == 0 : "Init may not run on already initialized data"
*>
fn MultiWriter* MultiWriter.tinit(&self, OutStream... writers)
```


---

#### `func`
```c3
fn void MultiWriter.free(&self)
```

---

#### `func`
```c3
fn usz? MultiWriter.write(&self, char[] bytes) @dynamic
```

---

#### `func`
```c3
fn void? MultiWriter.write_byte(&self, char c) @dynamic
```

---

#### `Scanner`
```c3
struct Scanner (InStream)
```

---

#### `func`
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

#### `func`
```c3
fn char[] Scanner.flush(&self) @dynamic
```

Return and clear any remaining unscanned data.

---

#### `func`
```c3
fn void? Scanner.close(&self) @dynamic
```

---

#### `func`
```c3
<*
 @require pattern.len > 0 : "Non-empty pattern required."
 @require self.buf.len > pattern.len : "Pattern too large."
*>
fn char[]? Scanner.scan(&self, String pattern = "\n")
```


Scan the stream for the next split character and return data up to the match.

---

#### `func`
```c3
fn usz? Scanner.read(&self, char[] bytes) @dynamic
```

---

#### `func`
```c3
fn char? Scanner.read_byte(&self) @dynamic
```

---

#### `TeeReader`
```c3
struct TeeReader (InStream)
```

---

#### `macro`
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

#### `func`
```c3
<*
 @param [&inout] self
 @param [&inout] r : "Stream r to read from."
 @param [&inout] w : "Stream w to write to what it reads from r."
*>
fn TeeReader* TeeReader.init(&self, InStream r, OutStream w)
```


---

#### `func`
```c3
fn usz? TeeReader.read(&self, char[] bytes) @dynamic
```

---

#### `func`
```c3
fn char? TeeReader.read_byte(&self) @dynamic
```
### `std::io @if (env::LIBC)`

---

#### `func`
```c3
fn void putchar(char c) @inline
```

Libc `putchar`, prints a single character to stdout.

---

#### `func`
```c3
<*
 @return `stdout as a File`
*>
fn File* stdout()
```


Get standard out.

---

#### `func`
```c3
<*
 @return `stderr as a File`
*>
fn File* stderr()
```


Get standard err.

---

#### `func`
```c3
<*
 @return `stdin as a File`
*>
fn File* stdin()
```


Get standard in.
### `std::io @if(!env::LIBC)`

---

#### `func`
```c3
fn void putchar(char c) @inline
```

---

#### `func`
```c3
fn File* stdout()
```

---

#### `func`
```c3
fn File* stderr()
```

---

#### `func`
```c3
fn File* stdin()
```
### `std::io::file`

---

#### `func`
```c3
fn File? open(String filename, String mode)
```

---

#### `func`
```c3
fn File? open_path(Path path, String mode)
```

---

#### `func`
```c3
fn bool exists(String file)
```

---

#### `func`
```c3
fn File from_handle(CFile file)
```

---

#### `func`
```c3
fn bool is_file(String path)
```

---

#### `func`
```c3
fn bool is_dir(String path)
```

---

#### `func`
```c3
fn usz? get_size(String path)
```

---

#### `func`
```c3
fn void? delete(String filename)
```

---

#### `func`
```c3
<*
 @require self.file != null
*>
fn void? File.reopen(&self, String filename, String mode)
```


---

#### `func`
```c3
<*
 @require self.file != null
*>
fn usz? File.seek(&self, isz offset, Seek seek_mode = Seek.SET) @dynamic
```


---

#### `func`
```c3
<*
 @require self.file != null
*>
fn void? File.write_byte(&self, char c) @dynamic
```


---

#### `func`
```c3
<*
 @param [&inout] self
*>
fn void? File.close(&self) @inline @dynamic
```


---

#### `func`
```c3
<*
 @require self.file != null
*>
fn bool File.eof(&self) @inline
```


---

#### `func`
```c3
<*
 @param [in] buffer
*>
fn usz? File.read(&self, char[] buffer) @dynamic
```


---

#### `func`
```c3
<*
 @param [out] buffer
 @require self.file != null : `File must be initialized`
*>
fn usz? File.write(&self, char[] buffer) @dynamic
```


---

#### `func`
```c3
fn Fd File.fd(self) @if(env::LIBC)
```

---

#### `func`
```c3
fn bool File.isatty(self) @if(env::LIBC)
```

---

#### `func`
```c3
fn char? File.read_byte(&self) @dynamic
```

---

#### `func`
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

#### `func`
```c3
fn char[]? load(Allocator allocator, String filename)
```

---

#### `func`
```c3
fn char[]? load_path(Allocator allocator, Path path)
```

---

#### `func`
```c3
fn char[]? load_temp(String filename)
```

---

#### `func`
```c3
fn char[]? load_path_temp(Path path)
```

---

#### `func`
```c3
fn void? save(String filename, char[] data)
```

---

#### `func`
```c3
<*
 @require self.file != null : `File must be initialized`
*>
fn void? File.flush(&self) @dynamic
```

### `std::io::file @if(env::LIBC &&& env::POSIX)`

---

#### `func`
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

#### `func`
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

#### `func`
```c3
<*
 @return "Slice of the mapped range where the first byte matches the file's byte at the offset specified to File::file_mmap()"
*>
fn char[] FileMmap.bytes(&self)
```


Provides a slice of bytes to the expected mapped range discarding the extra bytes due to misaligment of offset and/or size.

---

#### `func`
```c3
fn void? FileMmap.destroy(&self) @maydiscard
```

Destroys the underlyng VirtualMemory object ie. calls munmap()"
### `std::io::os`

---

#### `macro`
```c3
macro void? native_chdir(Path path)
```

---

#### `func`
```c3
fn void? native_stat(Stat* stat, String path) @if(env::DARWIN || env::LINUX || env::ANDROID || env::BSD_FAMILY)
```

---

#### `func`
```c3
fn usz? native_file_size(String path) @if(env::WIN32)
```

---

#### `func`
```c3
fn usz? native_file_size(String path) @if(!env::WIN32 && !env::DARWIN)
```

---

#### `func`
```c3
fn usz? native_file_size(String path) @if(env::DARWIN)
```

---

#### `func`
```c3
fn bool native_file_or_dir_exists(String path)
```

---

#### `func`
```c3
fn bool native_is_file(String path)
```

---

#### `func`
```c3
fn bool native_is_dir(String path)
```

---

#### `macro`
```c3
macro String? getcwd(Allocator allocator)
```

---

#### `macro`
```c3
macro bool? native_mkdir(Path path, MkdirPermissions permissions)
```

---

#### `macro`
```c3
macro bool? native_rmdir(Path path)
```
### `std::io::os @if(env::LIBC)`

---

#### `func`
```c3
<*
 @require mode.len > 0
 @require filename.len > 0
*>
fn void*? native_fopen(String filename, String mode) @inline
```


---

#### `func`
```c3
fn void? native_remove(String filename)
```

---

#### `func`
```c3
<*
 @require mode.len > 0
 @require filename.len > 0
*>
fn void*? native_freopen(void* file, String filename, String mode) @inline
```


---

#### `func`
```c3
fn void? native_fseek(void* file, isz offset, Seek seek_mode) @inline
```

---

#### `func`
```c3
fn usz? native_ftell(CFile file) @inline
```

---

#### `func`
```c3
fn usz? native_fwrite(CFile file, char[] buffer) @inline
```

---

#### `func`
```c3
fn void? native_fputc(CInt c, CFile stream) @inline
```

---

#### `func`
```c3
fn usz? native_fread(CFile file, char[] buffer) @inline
```

---

#### `func`
```c3
fn Path? native_temp_directory(Allocator allocator) @if(!env::WIN32)
```

---

#### `func`
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

#### `func`
```c3
fn @weak @if(!$defined(native_fopen_fn))
```

---

#### `func`
```c3
<*
 @require filename.len > 0
*>
fn void? native_remove(String filename) @inline
```


Delete a file.

---

#### `func`
```c3
<*
 @require mode.len > 0
 @require filename.len > 0
*>
fn void*? native_freopen(void* file, String filename, String mode) @inline
```


---

#### `func`
```c3
fn void? native_fseek(void* file, isz offset, Seek seek_mode) @inline
```

---

#### `func`
```c3
fn usz? native_ftell(CFile file) @inline
```

---

#### `func`
```c3
fn usz? native_fwrite(CFile file, char[] buffer) @inline
```

---

#### `func`
```c3
fn usz? native_fread(CFile file, char[] buffer) @inline
```

---

#### `func`
```c3
fn void? native_fputc(CInt c, CFile stream) @inline
```

---

#### `macro`
```c3
macro Path? native_temp_directory(Allocator allocator)
```
### `std::io::os @if(env::POSIX)`

---

#### `func`
```c3
fn PathList? native_ls(Path dir, bool no_dirs, bool no_symlinks, String mask, Allocator allocator)
```

---

#### `func`
```c3
<*
 @require dir.str_view().len > 0
*>
fn void? native_rmtree(Path dir)
```

### `std::io::os @if(env::WIN32)`

---

#### `func`
```c3
fn PathList? native_ls(Path dir, bool no_dirs, bool no_symlinks, String mask, Allocator allocator)
```

---

#### `func`
```c3
fn void? native_rmtree(Path path)
```
### `std::io::path`

---

#### `DEFAULT_ENV`
```c3
const PathEnv DEFAULT_ENV
```

---

#### `PREFERRED_SEPARATOR_WIN32`
```c3
const char PREFERRED_SEPARATOR_WIN32
```

---

#### `PREFERRED_SEPARATOR_POSIX`
```c3
const char PREFERRED_SEPARATOR_POSIX
```

---

#### `PREFERRED_SEPARATOR`
```c3
const char PREFERRED_SEPARATOR
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

#### `func`
```c3
fn Path? cwd(Allocator allocator)
```

---

#### `func`
```c3
fn bool is_dir(Path path)
```

---

#### `func`
```c3
fn bool is_file(Path path)
```

---

#### `func`
```c3
fn usz? file_size(Path path)
```

---

#### `func`
```c3
fn bool exists(Path path)
```

---

#### `func`
```c3
fn Path? tcwd()
```

---

#### `macro`
```c3
<*
 @require @is_pathlike(path) : "Expected a Path or String to chdir"
*>
macro void? chdir(path)
```


---

#### `func`
```c3
fn Path? temp_directory(Allocator allocator)
```

---

#### `func`
```c3
fn void? delete(Path path)
```

---

#### `macro`
```c3
macro bool @is_pathlike(#path)
```

---

#### `macro`
```c3
macro bool is_separator(char c, PathEnv path_env = DEFAULT_ENV)
```

---

#### `macro`
```c3
macro bool is_posix_separator(char c)
```

---

#### `macro`
```c3
macro bool is_win32_separator(char c)
```

---

#### `func`
```c3
fn PathList? ls(Allocator allocator, Path dir, bool no_dirs = false, bool no_symlinks = false, String mask = "")
```

---

#### `MkdirPermissions`
```c3
enum MkdirPermissions
```

---

#### `macro`
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

#### `macro`
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

#### `func`
```c3
fn void? rmtree(Path path)
```

Like [rmdir] but deletes a directory even if it contains items.

---

#### `func`
```c3
<*
 @return? INVALID_PATH : `if the path was invalid`
*>
fn Path? new(Allocator allocator, String path, PathEnv path_env = DEFAULT_ENV)
```


Creates a new path.

---

#### `func`
```c3
<*
 @return? INVALID_PATH : `if the path was invalid`
*>
fn Path? temp(String path, PathEnv path_env = DEFAULT_ENV)
```


Creates a new path using the temp allocator.

---

#### `func`
```c3
fn Path? from_wstring(Allocator allocator, WString path)
```

---

#### `func`
```c3
fn Path? from_win32_wstring(Allocator allocator, WString path) @deprecated("Use 'from_wstring' instead")
```

---

#### `func`
```c3
fn Path? for_windows(Allocator allocator, String path)
```

---

#### `func`
```c3
fn Path? for_posix(Allocator allocator, String path)
```

---

#### `func`
```c3
fn bool Path.equals(self, Path p2) @operator(==)
```

---

#### `func`
```c3
<*
 @param [in] filename
*>
fn Path? Path.append(self, Allocator allocator, String filename)
```


Append the string to the current path.

---

#### `func`
```c3
fn Path? Path.tappend(self, String filename)
```

---

#### `func`
```c3
fn bool? String.is_absolute_path(self)
```

---

#### `func`
```c3
fn bool? Path.is_absolute(self)
```

---

#### `func`
```c3
fn Path? String.to_absolute_path(self, Allocator allocator)
```

---

#### `func`
```c3
<*
 @require self.env == DEFAULT_ENV : "This method is only available on native paths"
*>
fn Path? Path.absolute(self, Allocator allocator)
```


---

#### `func`
```c3
fn String? String.file_basename(self, Allocator allocator)
```

---

#### `func`
```c3
fn String? String.file_tbasename(self)
```

---

#### `func`
```c3
fn String Path.basename(self)
```

---

#### `func`
```c3
fn String? String.path_tdirname(self)
```

---

#### `func`
```c3
fn String? String.path_dirname(self, Allocator allocator)
```

---

#### `func`
```c3
fn String Path.dirname(self)
```

---

#### `func`
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

#### `func`
```c3
fn String? Path.extension(self)
```

---

#### `func`
```c3
fn String Path.volume_name(self)
```

---

#### `func`
```c3
fn Path? String.to_path(self, Allocator allocator)
```

---

#### `func`
```c3
fn Path? String.to_tpath(self)
```

---

#### `func`
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

#### `func`
```c3
fn String? normalize(String path_str, PathEnv path_env = DEFAULT_ENV)
```

---

#### `func`
```c3
fn ZString Path.as_zstr(self) @deprecated
```

---

#### `func`
```c3
fn String Path.root_directory(self)
```

---

#### `PathWalker`
```c3
alias PathWalker = fn bool? (Path, bool is_dir, void*)
```

---

#### `func`
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

#### `func`
```c3
<*
 @require path.env == DEFAULT_ENV : "This method is only available on native paths"
*>
fn bool? traverse(Path path, TraverseCallback callback, any data)
```


Walk the path recursively. TraverseCallback is run for every file and
directory found. Return true to abort the walk.

---

#### `func`
```c3
fn String Path.str_view(self) @inline
```

---

#### `func`
```c3
fn bool Path.has_suffix(self, String str)
```

---

#### `func`
```c3
<*
 @require self.allocator != null : "This Path should never be freed"
*>
fn void Path.free(self)
```


---

#### `func`
```c3
fn usz? Path.to_format(&self, Formatter* formatter) @dynamic
```

---

#### `RESERVED_PATH_CHAR_POSIX`
```c3
const bool[256] RESERVED_PATH_CHAR_POSIX
```

---

#### `RESERVED_PATH_CHAR_WIN32`
```c3
const bool[256] RESERVED_PATH_CHAR_WIN32
```

---

#### `macro`
```c3
macro bool is_reserved_win32_path_char(char c)
```

---

#### `macro`
```c3
macro bool is_reserved_path_char(char c, PathEnv path_env = DEFAULT_ENV)
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
const E
```

---

#### `LOG2E`
```c3
const LOG2E
```

---

#### `LOG10E`
```c3
const LOG10E
```

---

#### `LN2`
```c3
const LN2
```

---

#### `LN10`
```c3
const LN10
```

---

#### `PI`
```c3
const PI
```

---

#### `PI_2`
```c3
const PI_2
```

---

#### `PI_4`
```c3
const PI_4
```

---

#### `DIV_PI`
```c3
const DIV_PI
```

---

#### `DIV_2_PI`
```c3
const DIV_2_PI
```

---

#### `DIV_2_SQRTPI`
```c3
const DIV_2_SQRTPI
```

---

#### `SQRT2`
```c3
const SQRT2
```

---

#### `DIV_1_SQRT2`
```c3
const double DIV_1_SQRT2
```

---

#### `HALF_MAX`
```c3
const HALF_MAX
```

---

#### `HALF_MIN`
```c3
const HALF_MIN
```

---

#### `HALF_DENORM_MIN`
```c3
const HALF_DENORM_MIN
```

---

#### `HALF_DIG`
```c3
const HALF_DIG
```

---

#### `HALF_DEC_DIGITS`
```c3
const HALF_DEC_DIGITS
```

---

#### `HALF_MANT_DIG`
```c3
const HALF_MANT_DIG
```

---

#### `HALF_MAX_10_EXP`
```c3
const HALF_MAX_10_EXP
```

---

#### `HALF_MIN_10_EXP`
```c3
const HALF_MIN_10_EXP
```

---

#### `HALF_MAX_EXP`
```c3
const HALF_MAX_EXP
```

---

#### `HALF_MIN_EXP`
```c3
const HALF_MIN_EXP
```

---

#### `HALF_EPSILON`
```c3
const HALF_EPSILON
```

---

#### `FLOAT_MAX`
```c3
const FLOAT_MAX
```

---

#### `FLOAT_MIN`
```c3
const FLOAT_MIN
```

---

#### `FLOAT_DENORM_MIN`
```c3
const FLOAT_DENORM_MIN
```

---

#### `FLOAT_DIG`
```c3
const FLOAT_DIG
```

---

#### `FLOAT_DEC_DIGITS`
```c3
const FLOAT_DEC_DIGITS
```

---

#### `FLOAT_MANT_DIG`
```c3
const FLOAT_MANT_DIG
```

---

#### `FLOAT_MAX_10_EXP`
```c3
const FLOAT_MAX_10_EXP
```

---

#### `FLOAT_MIN_10_EXP`
```c3
const FLOAT_MIN_10_EXP
```

---

#### `FLOAT_MAX_EXP`
```c3
const FLOAT_MAX_EXP
```

---

#### `FLOAT_MIN_EXP`
```c3
const FLOAT_MIN_EXP
```

---

#### `FLOAT_EPSILON`
```c3
const FLOAT_EPSILON
```

---

#### `DOUBLE_MAX`
```c3
const DOUBLE_MAX
```

---

#### `DOUBLE_MIN`
```c3
const DOUBLE_MIN
```

---

#### `DOUBLE_DENORM_MIN`
```c3
const DOUBLE_DENORM_MIN
```

---

#### `DOUBLE_DIG`
```c3
const DOUBLE_DIG
```

---

#### `DOUBLE_DEC_DIGITS`
```c3
const DOUBLE_DEC_DIGITS
```

---

#### `DOUBLE_MANT_DIG`
```c3
const DOUBLE_MANT_DIG
```

---

#### `DOUBLE_MAX_10_EXP`
```c3
const DOUBLE_MAX_10_EXP
```

---

#### `DOUBLE_MIN_10_EXP`
```c3
const DOUBLE_MIN_10_EXP
```

---

#### `DOUBLE_MAX_EXP`
```c3
const DOUBLE_MAX_EXP
```

---

#### `DOUBLE_MIN_EXP`
```c3
const DOUBLE_MIN_EXP
```

---

#### `DOUBLE_EPSILON`
```c3
const DOUBLE_EPSILON
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

#### `macro`
```c3
<*
 @require types::is_numerical($typeof(x)) : `The input must be a numerical value or numerical vector`
*>
macro deg_to_rad(x)
```


---

#### `macro`
```c3
<*
 @require types::is_numerical($typeof(x)) : `The input must be a numerical value or numerical vector`
*>
macro abs(x)
```


---

#### `macro`
```c3
<*
 @require values::@is_int(x) || values::@is_float(x) : "Expected an integer or floating point value"
 @require values::@is_int(y) || values::@is_float(y) : "Expected an integer or floating point value"
*>
macro is_approx(x, y, eps)
```


---

#### `macro`
```c3
<*
 @require values::@is_int(x) || values::@is_float(x) : "Expected an integer or floating point value"
 @require values::@is_int(y) || values::@is_float(y) : "Expected an integer or floating point value"
*>
macro is_approx_rel(x, y, eps)
```


---

#### `macro`
```c3
<*
 @require values::@is_int(x) : `The input must be an integer`
*>
macro sign(x)
```


---

#### `macro`
```c3
<*
 @require values::@is_int(x) || values::@is_float(x) : "Expected an integer or floating point value"
 @require values::@is_int(y) || values::@is_float(y) : "Expected an integer or floating point value"
*>
macro atan2(x, y)
```


---

#### `macro`
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

#### `macro`
```c3
<*
 @param x : `the angle in radians`
 @require values::@is_int(x) || values::@is_float(x) : "Expected an integer or floating point value"
*>
macro sincos(x)
```


Return a vector with sin / cos of the given angle.

---

#### `macro`
```c3
<*
 @require values::@is_int(x) || values::@is_float(x) : "Expected an integer or floating point value"
*>
macro atan(x)
```


---

#### `macro`
```c3
<*
 @require values::@is_int(x) || values::@is_float(x) : "Expected an integer or floating point value"
*>
macro atanh(x)
```


---

#### `macro`
```c3
<*
 @require values::@is_int(x) || values::@is_float(x) : "Expected an integer or floating point value"
*>
macro acos(x)
```


---

#### `macro`
```c3
<*
 @require values::@is_int(x) || values::@is_float(x) : "Expected an integer or floating point value"
*>
macro acosh(x)
```


---

#### `macro`
```c3
<*
 @require values::@is_int(x) || values::@is_float(x) : "Expected an integer or floating point value"
*>
macro asin(x)
```


---

#### `macro`
```c3
<*
 @require values::@is_int(x) || values::@is_float(x) : "Expected an integer or floating point value"
*>
macro asinh(x)
```


---

#### `macro`
```c3
<*
 @require values::@is_floatlike(x) : `The input must be a floating point value or float vector`
*>
macro ceil(x)
```


---

#### `macro`
```c3
<*
 @require @typeis($input, double) || @typeis($input, float) : "Only float and double may be used"
*>
macro @ceil($input) @const
```


Ceil for compile time evaluation.

---

#### `macro`
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

#### `macro`
```c3
<*
 @require values::@is_promotable_to_floatlike(mag) : `The input must be a number value or float vector`
 @require $defined(($typeof(values::promote_int(mag)))mag) : `It's not possible to cast the sign to the type of the magnitude`
*>
macro copysign(mag, sgn)
```


---

#### `macro`
```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number value or float vector`
*>
macro cos(x)
```


---

#### `macro`
```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number value or float vector`
*>
macro cosec(x)
```


---

#### `macro`
```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number value or float vector`
*>
macro cosech(x)
```


---

#### `macro`
```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number value or float vector`
*>
macro cosh(x)
```


---

#### `macro`
```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number value or float vector`
*>
macro cotan(x)
```


---

#### `macro`
```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number value or float vector`
*>
macro cotanh(x)
```


---

#### `macro`
```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number value or float vector`
*>
macro exp(x)
```


---

#### `macro`
```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number value or float vector`
*>
macro exp2(x)
```


---

#### `macro`
```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number value or float vector`
*>
macro floor(x)
```


---

#### `macro`
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

#### `macro`
```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number or a float vector`
 @require values::@is_promotable_to_floatlike(y) : `The input must be a number or a float vector`
 @require values::@is_same_vector_type(x, y) : `The input types must match`
*>
macro hypot(x, y)
```


---

#### `macro`
```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number or a float vector`
*>
macro ln(x)
```


---

#### `macro`
```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number or a float vector`
 @require values::@is_promotable_to_floatlike(base) : `The base must be a number or a float vector`
*>
macro log(x, base)
```


---

#### `macro`
```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number or a float vector`
*>
macro log2(x)
```


---

#### `macro`
```c3
<*
 @require values::@is_int($x) : `The input value must be an integer.`
 @require $x >= 0 : `The input value must be a positive integer.`
 @return `A floored base-2 log of an input integer value.`
*>
macro @intlog2($x)
```


---

#### `macro`
```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number or a float vector`
*>
macro log10(x)
```


---

#### `macro`
```c3
<*
 @require types::is_numerical($typeof(x)) : `The input must be a floating point value or float vector`
 @require types::is_same($typeof(x), $typeof(y)) : `The input types must be equal`
*>
macro max(x, y, ...)
```


---

#### `macro`
```c3
<*
 @require types::is_numerical($typeof(x)) : `The input must be a numerical value or numerical vector`
 @require types::is_same($typeof(x), $typeof(y)) : `The input types must be equal`
*>
macro min(x, y, ...)
```


---

#### `macro`
```c3
<*
 @require types::@is_float(a) : `The input must be a floating point value`
 @require types::@has_same(a, b, c) : `The input types must be equal`
*>
macro muladd(a, b, c)
```


---

#### `macro`
```c3
<*
 @require values::@is_floatlike(x) : `The input must be a floating point value or float vector`
*>
macro nearbyint(x)
```


---

#### `macro`
```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number or a float vector`
 @require @assignable_to(exp, $typeof(values::promote_int(x))) || values::@is_int(exp) : `The input must be an integer, castable to the type of x`
*>
macro pow(x, exp)
```


---

#### `macro`
```c3
<*
 @require values::@is_promotable_to_float(x) : `The input must be integer or floating type`
*>
macro frexp(x, int* e)
```


---

#### `macro`
```c3
<*
 @require values::@is_promotable_to_float(x) : `The input must be integer or floating type`
*>
macro int signbit(x)
```


---

#### `macro`
```c3
<*
 @require values::@is_floatlike(x) : `The input must be a number or a float vector`
*>
macro rint(x)
```


---

#### `macro`
```c3
<*
 @require values::@is_floatlike(x) : `The input must be a floating point value or float vector`
*>
macro round(x)
```


---

#### `macro`
```c3
<*
 @require values::@is_floatlike(x) : `The input must be a floating point value or float vector`
*>
macro round_to_decimals(x, int decimal_places)
```


---

#### `macro`
```c3
<*
 @require values::@is_floatlike(x) : `The input must be a floating point value or float vector`
*>
macro roundeven(x)
```


---

#### `macro`
```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number or a float vector`
*>
macro sec(x)
```


---

#### `macro`
```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number or a float vector`
*>
macro sech(x)
```


---

#### `macro`
```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number or a float vector`
*>
macro sin(x)
```


---

#### `macro`
```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number or a float vector`
*>
macro sinh(x)
```


---

#### `macro`
```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number or a float vector`
*>
macro sqr(x)
```


---

#### `macro`
```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number or a float vector`
*>
macro sqrt(x)
```


---

#### `macro`
```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number or a float vector`
*>
macro tan(x)
```


---

#### `macro`
```c3
<*
 @require values::@is_promotable_to_float(x) : `The input must be a float`
*>
macro bool is_finite(x)
```


---

#### `macro`
```c3
<*
 @require values::@is_promotable_to_float(x) : `The input must be a float`
*>
macro is_nan(x)
```


---

#### `macro`
```c3
<*
 @require values::@is_promotable_to_float(x) : `The input must be a float`
*>
macro is_inf(x)
```


---

#### `macro`
```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number or a float vector`
*>
macro tanh(x)
```


---

#### `macro`
```c3
<*
 @require values::@is_floatlike(x) : `The input must be a floating point value or float vector`
*>
macro trunc(x)
```


---

#### `macro`
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

#### `macro`
```c3
macro float float.ceil(float x)
```

---

#### `macro`
```c3
macro float float.clamp(float x, float lower, float upper)
```

---

#### `macro`
```c3
macro float float.copysign(float mag, float sgn)
```

---

#### `macro`
```c3
macro float float.floor(float x)
```

---

#### `macro`
```c3
macro float float.fma(float a, float b, float c)
```

---

#### `macro`
```c3
macro float float.muladd(float a, float b, float c)
```

---

#### `macro`
```c3
macro float float.nearbyint(float x)
```

---

#### `macro`
```c3
macro float float.pow(float x, exp)
```

---

#### `macro`
```c3
macro float float.rint(float x)
```

---

#### `macro`
```c3
macro float float.round(float x)
```

---

#### `macro`
```c3
macro float float.roundeven(float x)
```

---

#### `macro`
```c3
macro float float.trunc(float x)
```

---

#### `macro`
```c3
macro float float[<*>].sum(float[<*>] x, float start = 0.0)
```

---

#### `macro`
```c3
macro float float[<*>].product(float[<*>] x, float start = 1.0)
```

---

#### `macro`
```c3
macro float float[<*>].max(float[<*>] x)
```

---

#### `macro`
```c3
macro float float[<*>].min(float[<*>] x)
```

---

#### `macro`
```c3
macro float[<*>] float[<*>].ceil(float[<*>] x)
```

---

#### `macro`
```c3
macro float[<*>] float[<*>].clamp(float[<*>] x, float[<*>] lower, float[<*>] upper)
```

---

#### `macro`
```c3
macro float[<*>] float[<*>].copysign(float[<*>] mag, float[<*>] sgn)
```

---

#### `macro`
```c3
macro float[<*>] float[<*>].fma(float[<*>] a, float[<*>] b, float[<*>] c)
```

---

#### `macro`
```c3
macro float[<*>] float[<*>].floor(float[<*>] x)
```

---

#### `macro`
```c3
macro float[<*>] float[<*>].nearbyint(float[<*>] x)
```

---

#### `macro`
```c3
macro float[<*>] float[<*>].pow(float[<*>] x, exp)
```

---

#### `macro`
```c3
macro float[<*>] float[<*>].rint(float[<*>] x)
```

---

#### `macro`
```c3
macro float[<*>] float[<*>].round(float[<*>] x)
```

---

#### `macro`
```c3
macro float[<*>] float[<*>].roundeven(float[<*>] x)
```

---

#### `macro`
```c3
macro float[<*>] float[<*>].trunc(float[<*>] x)
```

---

#### `macro`
```c3
macro float float[<*>].dot(float[<*>] x, float[<*>] y)
```

---

#### `macro`
```c3
macro float float[<*>].length(float[<*>] x)
```

---

#### `macro`
```c3
macro float float[<*>].distance(float[<*>] x, float[<*>] y)
```

---

#### `macro`
```c3
macro float[<*>] float[<*>].normalize(float[<*>] x)
```

---

#### `macro`
```c3
macro float[<*>] float[<*>].lerp(float[<*>] x, float[<*>] y, float amount)
```

---

#### `macro`
```c3
macro float[<*>] float[<*>].reflect(float[<*>] x, float[<*>] y)
```

---

#### `macro`
```c3
macro bool float[<*>].equals(float[<*>] x, float[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] float[<*>].comp_lt(float[<*>] x, float[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] float[<*>].comp_le(float[<*>] x, float[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] float[<*>].comp_eq(float[<*>] x, float[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] float[<*>].comp_gt(float[<*>] x, float[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] float[<*>].comp_ge(float[<*>] x, float[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] float[<*>].comp_ne(float[<*>] x, float[<*>] y)
```

---

#### `macro`
```c3
macro double double.ceil(double x)
```

---

#### `macro`
```c3
macro double double.clamp(double x, double lower, double upper)
```

---

#### `macro`
```c3
macro double double.copysign(double mag, double sgn)
```

---

#### `macro`
```c3
macro double double.floor(double x)
```

---

#### `macro`
```c3
macro double double.fma(double a, double b, double c)
```

---

#### `macro`
```c3
macro double double.muladd(double a, double b, double c)
```

---

#### `macro`
```c3
macro double double.nearbyint(double x)
```

---

#### `macro`
```c3
macro double double.pow(double x, exp)
```

---

#### `macro`
```c3
macro double double.rint(double x)
```

---

#### `macro`
```c3
macro double double.round(double x)
```

---

#### `macro`
```c3
macro double double.roundeven(double x)
```

---

#### `macro`
```c3
macro double double.trunc(double x)
```

---

#### `macro`
```c3
macro double double[<*>].sum(double[<*>] x, double start = 0.0)
```

---

#### `macro`
```c3
macro double double[<*>].product(double[<*>] x, double start = 1.0)
```

---

#### `macro`
```c3
macro double double[<*>].max(double[<*>] x)
```

---

#### `macro`
```c3
macro double double[<*>].min(double[<*>] x)
```

---

#### `macro`
```c3
macro double[<*>] double[<*>].ceil(double[<*>] x)
```

---

#### `macro`
```c3
macro double[<*>] double[<*>].clamp(double[<*>] x, double[<*>] lower, double[<*>] upper)
```

---

#### `macro`
```c3
macro double[<*>] double[<*>].copysign(double[<*>] mag, double[<*>] sgn)
```

---

#### `macro`
```c3
macro double[<*>] double[<*>].floor(double[<*>] x)
```

---

#### `macro`
```c3
macro double[<*>] double[<*>].fma(double[<*>] a, double[<*>] b, double[<*>] c)
```

---

#### `macro`
```c3
macro double[<*>] double[<*>].nearbyint(double[<*>] x)
```

---

#### `macro`
```c3
macro double[<*>] double[<*>].pow(double[<*>] x, exp)
```

---

#### `macro`
```c3
macro double[<*>] double[<*>].rint(double[<*>] x)
```

---

#### `macro`
```c3
macro double[<*>] double[<*>].round(double[<*>] x)
```

---

#### `macro`
```c3
macro double[<*>] double[<*>].roundeven(double[<*>] x)
```

---

#### `macro`
```c3
macro double[<*>] double[<*>].trunc(double[<*>] x)
```

---

#### `macro`
```c3
macro double double[<*>].dot(double[<*>] x, double[<*>] y)
```

---

#### `macro`
```c3
macro double double[<*>].length(double[<*>] x)
```

---

#### `macro`
```c3
macro double double[<*>].distance(double[<*>] x, double[<*>] y)
```

---

#### `macro`
```c3
macro double[<*>] double[<*>].normalize(double[<*>] x)
```

---

#### `macro`
```c3
macro double[<*>] double[<*>].reflect(double[<*>] x, double[<*>] y)
```

---

#### `macro`
```c3
macro double[<*>] double[<*>].lerp(double[<*>] x, double[<*>] y, double amount)
```

---

#### `macro`
```c3
macro bool double[<*>].equals(double[<*>] x, double[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] double[<*>].comp_lt(double[<*>] x, double[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] double[<*>].comp_le(double[<*>] x, double[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] double[<*>].comp_eq(double[<*>] x, double[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] double[<*>].comp_gt(double[<*>] x, double[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] double[<*>].comp_ge(double[<*>] x, double[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] double[<*>].comp_ne(double[<*>] x, double[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] ichar[<*>].comp_lt(ichar[<*>] x, ichar[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] ichar[<*>].comp_le(ichar[<*>] x, ichar[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] ichar[<*>].comp_eq(ichar[<*>] x, ichar[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] ichar[<*>].comp_gt(ichar[<*>] x, ichar[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] ichar[<*>].comp_ge(ichar[<*>] x, ichar[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] ichar[<*>].comp_ne(ichar[<*>] x, ichar[<*>] y)
```

---

#### `macro`
```c3
macro ichar ichar[<*>].sum(ichar[<*>] x)
```

---

#### `macro`
```c3
macro ichar ichar[<*>].product(ichar[<*>] x)
```

---

#### `macro`
```c3
macro ichar ichar[<*>].and(ichar[<*>] x)
```

---

#### `macro`
```c3
macro ichar ichar[<*>].or(ichar[<*>] x)
```

---

#### `macro`
```c3
macro ichar ichar[<*>].xor(ichar[<*>] x)
```

---

#### `macro`
```c3
macro ichar ichar[<*>].max(ichar[<*>] x)
```

---

#### `macro`
```c3
macro ichar ichar[<*>].min(ichar[<*>] x)
```

---

#### `macro`
```c3
macro ichar ichar[<*>].dot(ichar[<*>] x, ichar[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] short[<*>].comp_lt(short[<*>] x, short[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] short[<*>].comp_le(short[<*>] x, short[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] short[<*>].comp_eq(short[<*>] x, short[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] short[<*>].comp_gt(short[<*>] x, short[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] short[<*>].comp_ge(short[<*>] x, short[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] short[<*>].comp_ne(short[<*>] x, short[<*>] y)
```

---

#### `macro`
```c3
macro short short[<*>].sum(short[<*>] x)
```

---

#### `macro`
```c3
macro short short[<*>].product(short[<*>] x)
```

---

#### `macro`
```c3
macro short short[<*>].and(short[<*>] x)
```

---

#### `macro`
```c3
macro short short[<*>].or(short[<*>] x)
```

---

#### `macro`
```c3
macro short short[<*>].xor(short[<*>] x)
```

---

#### `macro`
```c3
macro short short[<*>].max(short[<*>] x)
```

---

#### `macro`
```c3
macro short short[<*>].min(short[<*>] x)
```

---

#### `macro`
```c3
macro short short[<*>].dot(short[<*>] x, short[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] int[<*>].comp_lt(int[<*>] x, int[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] int[<*>].comp_le(int[<*>] x, int[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] int[<*>].comp_eq(int[<*>] x, int[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] int[<*>].comp_gt(int[<*>] x, int[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] int[<*>].comp_ge(int[<*>] x, int[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] int[<*>].comp_ne(int[<*>] x, int[<*>] y)
```

---

#### `macro`
```c3
macro int int[<*>].sum(int[<*>] x)
```

---

#### `macro`
```c3
macro int int[<*>].product(int[<*>] x)
```

---

#### `macro`
```c3
macro int int[<*>].and(int[<*>] x)
```

---

#### `macro`
```c3
macro int int[<*>].or(int[<*>] x)
```

---

#### `macro`
```c3
macro int int[<*>].xor(int[<*>] x)
```

---

#### `macro`
```c3
macro int int[<*>].max(int[<*>] x)
```

---

#### `macro`
```c3
macro int int[<*>].min(int[<*>] x)
```

---

#### `macro`
```c3
macro int int[<*>].dot(int[<*>] x, int[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] long[<*>].comp_lt(long[<*>] x, long[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] long[<*>].comp_le(long[<*>] x, long[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] long[<*>].comp_eq(long[<*>] x, long[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] long[<*>].comp_gt(long[<*>] x, long[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] long[<*>].comp_ge(long[<*>] x, long[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] long[<*>].comp_ne(long[<*>] x, long[<*>] y)
```

---

#### `macro`
```c3
macro long long[<*>].sum(long[<*>] x)
```

---

#### `macro`
```c3
macro long long[<*>].product(long[<*>] x)
```

---

#### `macro`
```c3
macro long long[<*>].and(long[<*>] x)
```

---

#### `macro`
```c3
macro long long[<*>].or(long[<*>] x)
```

---

#### `macro`
```c3
macro long long[<*>].xor(long[<*>] x)
```

---

#### `macro`
```c3
macro long long[<*>].max(long[<*>] x)
```

---

#### `macro`
```c3
macro long long[<*>].min(long[<*>] x)
```

---

#### `macro`
```c3
macro long long[<*>].dot(long[<*>] x, long[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] int128[<*>].comp_lt(int128[<*>] x, int128[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] int128[<*>].comp_le(int128[<*>] x, int128[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] int128[<*>].comp_eq(int128[<*>] x, int128[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] int128[<*>].comp_gt(int128[<*>] x, int128[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] int128[<*>].comp_ge(int128[<*>] x, int128[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] int128[<*>].comp_ne(int128[<*>] x, int128[<*>] y)
```

---

#### `macro`
```c3
macro int128 int128[<*>].sum(int128[<*>] x)
```

---

#### `macro`
```c3
macro int128 int128[<*>].product(int128[<*>] x)
```

---

#### `macro`
```c3
macro int128 int128[<*>].and(int128[<*>] x)
```

---

#### `macro`
```c3
macro int128 int128[<*>].or(int128[<*>] x)
```

---

#### `macro`
```c3
macro int128 int128[<*>].xor(int128[<*>] x)
```

---

#### `macro`
```c3
macro int128 int128[<*>].max(int128[<*>] x)
```

---

#### `macro`
```c3
macro int128 int128[<*>].min(int128[<*>] x)
```

---

#### `macro`
```c3
macro int128 int128[<*>].dot(int128[<*>] x, int128[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] bool[<*>].comp_lt(bool[<*>] x, bool[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] bool[<*>].comp_le(bool[<*>] x, bool[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] bool[<*>].comp_eq(bool[<*>] x, bool[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] bool[<*>].comp_gt(bool[<*>] x, bool[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] bool[<*>].comp_ge(bool[<*>] x, bool[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] bool[<*>].comp_ne(bool[<*>] x, bool[<*>] y)
```

---

#### `macro`
```c3
macro bool bool[<*>].sum(bool[<*>] x)
```

---

#### `macro`
```c3
macro bool bool[<*>].product(bool[<*>] x)
```

---

#### `macro`
```c3
macro bool bool[<*>].and(bool[<*>] x)
```

---

#### `macro`
```c3
macro bool bool[<*>].or(bool[<*>] x)
```

---

#### `macro`
```c3
macro bool bool[<*>].xor(bool[<*>] x)
```

---

#### `macro`
```c3
macro bool bool[<*>].max(bool[<*>] x)
```

---

#### `macro`
```c3
macro bool bool[<*>].min(bool[<*>] x)
```

---

#### `macro`
```c3
macro bool[<*>] char[<*>].comp_lt(char[<*>] x, char[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] char[<*>].comp_le(char[<*>] x, char[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] char[<*>].comp_eq(char[<*>] x, char[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] char[<*>].comp_gt(char[<*>] x, char[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] char[<*>].comp_ge(char[<*>] x, char[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] char[<*>].comp_ne(char[<*>] x, char[<*>] y)
```

---

#### `macro`
```c3
macro char char[<*>].sum(char[<*>] x)
```

---

#### `macro`
```c3
macro char char[<*>].product(char[<*>] x)
```

---

#### `macro`
```c3
macro char char[<*>].and(char[<*>] x)
```

---

#### `macro`
```c3
macro char char[<*>].or(char[<*>] x)
```

---

#### `macro`
```c3
macro char char[<*>].xor(char[<*>] x)
```

---

#### `macro`
```c3
macro char char[<*>].max(char[<*>] x)
```

---

#### `macro`
```c3
macro char char[<*>].min(char[<*>] x)
```

---

#### `macro`
```c3
macro char char[<*>].dot(char[<*>] x, char[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] ushort[<*>].comp_lt(ushort[<*>] x, ushort[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] ushort[<*>].comp_le(ushort[<*>] x, ushort[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] ushort[<*>].comp_eq(ushort[<*>] x, ushort[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] ushort[<*>].comp_gt(ushort[<*>] x, ushort[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] ushort[<*>].comp_ge(ushort[<*>] x, ushort[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] ushort[<*>].comp_ne(ushort[<*>] x, ushort[<*>] y)
```

---

#### `macro`
```c3
macro ushort ushort[<*>].sum(ushort[<*>] x)
```

---

#### `macro`
```c3
macro ushort ushort[<*>].product(ushort[<*>] x)
```

---

#### `macro`
```c3
macro ushort ushort[<*>].and(ushort[<*>] x)
```

---

#### `macro`
```c3
macro ushort ushort[<*>].or(ushort[<*>] x)
```

---

#### `macro`
```c3
macro ushort ushort[<*>].xor(ushort[<*>] x)
```

---

#### `macro`
```c3
macro ushort ushort[<*>].max(ushort[<*>] x)
```

---

#### `macro`
```c3
macro ushort ushort[<*>].min(ushort[<*>] x)
```

---

#### `macro`
```c3
macro ushort ushort[<*>].dot(ushort[<*>] x, ushort[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] uint[<*>].comp_lt(uint[<*>] x, uint[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] uint[<*>].comp_le(uint[<*>] x, uint[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] uint[<*>].comp_eq(uint[<*>] x, uint[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] uint[<*>].comp_gt(uint[<*>] x, uint[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] uint[<*>].comp_ge(uint[<*>] x, uint[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] uint[<*>].comp_ne(uint[<*>] x, uint[<*>] y)
```

---

#### `macro`
```c3
macro uint uint[<*>].sum(uint[<*>] x)
```

---

#### `macro`
```c3
macro uint uint[<*>].product(uint[<*>] x)
```

---

#### `macro`
```c3
macro uint uint[<*>].and(uint[<*>] x)
```

---

#### `macro`
```c3
macro uint uint[<*>].or(uint[<*>] x)
```

---

#### `macro`
```c3
macro uint uint[<*>].xor(uint[<*>] x)
```

---

#### `macro`
```c3
macro uint uint[<*>].max(uint[<*>] x)
```

---

#### `macro`
```c3
macro uint uint[<*>].min(uint[<*>] x)
```

---

#### `macro`
```c3
macro uint uint[<*>].dot(uint[<*>] x, uint[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] ulong[<*>].comp_lt(ulong[<*>] x, ulong[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] ulong[<*>].comp_le(ulong[<*>] x, ulong[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] ulong[<*>].comp_eq(ulong[<*>] x, ulong[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] ulong[<*>].comp_gt(ulong[<*>] x, ulong[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] ulong[<*>].comp_ge(ulong[<*>] x, ulong[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] ulong[<*>].comp_ne(ulong[<*>] x, ulong[<*>] y)
```

---

#### `macro`
```c3
macro ulong ulong[<*>].sum(ulong[<*>] x)
```

---

#### `macro`
```c3
macro ulong ulong[<*>].product(ulong[<*>] x)
```

---

#### `macro`
```c3
macro ulong ulong[<*>].and(ulong[<*>] x)
```

---

#### `macro`
```c3
macro ulong ulong[<*>].or(ulong[<*>] x)
```

---

#### `macro`
```c3
macro ulong ulong[<*>].xor(ulong[<*>] x)
```

---

#### `macro`
```c3
macro ulong ulong[<*>].max(ulong[<*>] x)
```

---

#### `macro`
```c3
macro ulong ulong[<*>].min(ulong[<*>] x)
```

---

#### `macro`
```c3
macro ulong ulong[<*>].dot(ulong[<*>] x, ulong[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] uint128[<*>].comp_lt(uint128[<*>] x, uint128[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] uint128[<*>].comp_le(uint128[<*>] x, uint128[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] uint128[<*>].comp_eq(uint128[<*>] x, uint128[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] uint128[<*>].comp_gt(uint128[<*>] x, uint128[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] uint128[<*>].comp_ge(uint128[<*>] x, uint128[<*>] y)
```

---

#### `macro`
```c3
macro bool[<*>] uint128[<*>].comp_ne(uint128[<*>] x, uint128[<*>] y)
```

---

#### `macro`
```c3
macro uint128 uint128[<*>].sum(uint128[<*>] x)
```

---

#### `macro`
```c3
macro uint128 uint128[<*>].product(uint128[<*>] x)
```

---

#### `macro`
```c3
macro uint128 uint128[<*>].and(uint128[<*>] x)
```

---

#### `macro`
```c3
macro uint128 uint128[<*>].or(uint128[<*>] x)
```

---

#### `macro`
```c3
macro uint128 uint128[<*>].xor(uint128[<*>] x)
```

---

#### `macro`
```c3
macro uint128 uint128[<*>].max(uint128[<*>] x)
```

---

#### `macro`
```c3
macro uint128 uint128[<*>].min(uint128[<*>] x)
```

---

#### `macro`
```c3
macro uint128 uint128[<*>].dot(uint128[<*>] x, uint128[<*>] y)
```

---

#### `macro`
```c3
macro char char.sat_add(char x, char y)
```

---

#### `macro`
```c3
macro char char.sat_sub(char x, char y)
```

---

#### `macro`
```c3
macro char char.sat_mul(char x, char y)
```

---

#### `macro`
```c3
macro char char.sat_shl(char x, char y)
```

---

#### `macro`
```c3
macro char? char.overflow_add(char x, char y)
```

---

#### `macro`
```c3
macro char? char.overflow_sub(char x, char y)
```

---

#### `macro`
```c3
macro char? char.overflow_mul(char x, char y)
```

---

#### `macro`
```c3
macro ichar ichar.sat_add(ichar x, ichar y)
```

---

#### `macro`
```c3
macro ichar ichar.sat_sub(ichar x, ichar y)
```

---

#### `macro`
```c3
macro ichar ichar.sat_mul(ichar x, ichar y)
```

---

#### `macro`
```c3
macro ichar ichar.sat_shl(ichar x, ichar y)
```

---

#### `macro`
```c3
macro ichar? ichar.overflow_add(ichar x, ichar y)
```

---

#### `macro`
```c3
macro ichar? ichar.overflow_sub(ichar x, ichar y)
```

---

#### `macro`
```c3
macro ichar? ichar.overflow_mul(ichar x, ichar y)
```

---

#### `macro`
```c3
macro ushort ushort.sat_add(ushort x, ushort y)
```

---

#### `macro`
```c3
macro ushort ushort.sat_sub(ushort x, ushort y)
```

---

#### `macro`
```c3
macro ushort ushort.sat_mul(ushort x, ushort y)
```

---

#### `macro`
```c3
macro ushort ushort.sat_shl(ushort x, ushort y)
```

---

#### `macro`
```c3
macro ushort? ushort.overflow_add(ushort x, ushort y)
```

---

#### `macro`
```c3
macro ushort? ushort.overflow_sub(ushort x, ushort y)
```

---

#### `macro`
```c3
macro ushort? ushort.overflow_mul(ushort x, ushort y)
```

---

#### `macro`
```c3
macro short short.sat_add(short x, short y)
```

---

#### `macro`
```c3
macro short short.sat_sub(short x, short y)
```

---

#### `macro`
```c3
macro short short.sat_mul(short x, short y)
```

---

#### `macro`
```c3
macro short short.sat_shl(short x, short y)
```

---

#### `macro`
```c3
macro short? short.overflow_add(short x, short y)
```

---

#### `macro`
```c3
macro short? short.overflow_sub(short x, short y)
```

---

#### `macro`
```c3
macro short? short.overflow_mul(short x, short y)
```

---

#### `macro`
```c3
macro uint uint.sat_add(uint x, uint y)
```

---

#### `macro`
```c3
macro uint uint.sat_sub(uint x, uint y)
```

---

#### `macro`
```c3
macro uint uint.sat_mul(uint x, uint y)
```

---

#### `macro`
```c3
macro uint uint.sat_shl(uint x, uint y)
```

---

#### `macro`
```c3
macro uint? uint.overflow_add(uint x, uint y)
```

---

#### `macro`
```c3
macro uint? uint.overflow_sub(uint x, uint y)
```

---

#### `macro`
```c3
macro uint? uint.overflow_mul(uint x, uint y)
```

---

#### `macro`
```c3
macro int int.sat_add(int x, int y)
```

---

#### `macro`
```c3
macro int int.sat_sub(int x, int y)
```

---

#### `macro`
```c3
macro int int.sat_mul(int x, int y)
```

---

#### `macro`
```c3
macro int int.sat_shl(int x, int y)
```

---

#### `macro`
```c3
macro int? int.overflow_add(int x, int y)
```

---

#### `macro`
```c3
macro int? int.overflow_sub(int x, int y)
```

---

#### `macro`
```c3
macro int? int.overflow_mul(int x, int y)
```

---

#### `macro`
```c3
macro ulong ulong.sat_add(ulong x, ulong y)
```

---

#### `macro`
```c3
macro ulong ulong.sat_sub(ulong x, ulong y)
```

---

#### `macro`
```c3
macro ulong ulong.sat_mul(ulong x, ulong y)
```

---

#### `macro`
```c3
macro ulong ulong.sat_shl(ulong x, ulong y)
```

---

#### `macro`
```c3
macro ulong? ulong.overflow_add(ulong x, ulong y)
```

---

#### `macro`
```c3
macro ulong? ulong.overflow_sub(ulong x, ulong y)
```

---

#### `macro`
```c3
macro ulong? ulong.overflow_mul(ulong x, ulong y)
```

---

#### `macro`
```c3
macro long long.sat_add(long x, long y)
```

---

#### `macro`
```c3
macro long long.sat_sub(long x, long y)
```

---

#### `macro`
```c3
macro long long.sat_mul(long x, long y)
```

---

#### `macro`
```c3
macro long long.sat_shl(long x, long y)
```

---

#### `macro`
```c3
macro long? long.overflow_add(long x, long y)
```

---

#### `macro`
```c3
macro long? long.overflow_sub(long x, long y)
```

---

#### `macro`
```c3
macro long? long.overflow_mul(long x, long y)
```

---

#### `macro`
```c3
macro uint128 uint128.sat_add(uint128 x, uint128 y)
```

---

#### `macro`
```c3
macro uint128 uint128.sat_sub(uint128 x, uint128 y)
```

---

#### `macro`
```c3
macro uint128 uint128.sat_mul(uint128 x, uint128 y)
```

---

#### `macro`
```c3
macro uint128 uint128.sat_shl(uint128 x, uint128 y)
```

---

#### `macro`
```c3
macro uint128? uint128.overflow_add(uint128 x, uint128 y)
```

---

#### `macro`
```c3
macro uint128? uint128.overflow_sub(uint128 x, uint128 y)
```

---

#### `macro`
```c3
macro uint128? uint128.overflow_mul(uint128 x, uint128 y)
```

---

#### `macro`
```c3
macro int128 int128.sat_add(int128 x, int128 y)
```

---

#### `macro`
```c3
macro int128 int128.sat_sub(int128 x, int128 y)
```

---

#### `macro`
```c3
macro int128 int128.sat_mul(int128 x, int128 y)
```

---

#### `macro`
```c3
macro int128 int128.sat_shl(int128 x, int128 y)
```

---

#### `macro`
```c3
macro int128? int128.overflow_add(int128 x, int128 y)
```

---

#### `macro`
```c3
macro int128? int128.overflow_sub(int128 x, int128 y)
```

---

#### `macro`
```c3
macro int128? int128.overflow_mul(int128 x, int128 y)
```

---

#### `macro`
```c3
<*
 @require values::@is_int(x) : `The input must be an integer`
*>
macro bool is_odd(x)
```


---

#### `macro`
```c3
<*
 @require values::@is_int(x) : `The input must be an integer`
*>
macro bool is_even(x)
```


---

#### `macro`
```c3
macro bool char.is_even(char x)
```

---

#### `macro`
```c3
macro bool char.is_odd(char x)
```

---

#### `macro`
```c3
macro bool ichar.is_even(ichar x)
```

---

#### `macro`
```c3
macro bool ichar.is_odd(ichar x)
```

---

#### `macro`
```c3
macro bool ushort.is_even(ushort x)
```

---

#### `macro`
```c3
macro bool ushort.is_odd(ushort x)
```

---

#### `macro`
```c3
macro bool short.is_even(short x)
```

---

#### `macro`
```c3
macro bool short.is_odd(short x)
```

---

#### `macro`
```c3
macro bool uint.is_even(uint x)
```

---

#### `macro`
```c3
macro bool uint.is_odd(uint x)
```

---

#### `macro`
```c3
macro bool int.is_even(int x)
```

---

#### `macro`
```c3
macro bool int.is_odd(int x)
```

---

#### `macro`
```c3
macro bool ulong.is_even(ulong x)
```

---

#### `macro`
```c3
macro bool ulong.is_odd(ulong x)
```

---

#### `macro`
```c3
macro bool long.is_even(long x)
```

---

#### `macro`
```c3
macro bool long.is_odd(long x)
```

---

#### `macro`
```c3
macro bool uint128.is_even(uint128 x)
```

---

#### `macro`
```c3
macro bool uint128.is_odd(uint128 x)
```

---

#### `macro`
```c3
macro bool int128.is_even(int128 x)
```

---

#### `macro`
```c3
macro bool int128.is_odd(int128 x)
```

---

#### `macro`
```c3
<*
 @require types::is_underlying_int($typeof(x)) : `is_power_of_2 may only be used on integer types`
*>
macro bool is_power_of_2(x)
```


---

#### `macro`
```c3
macro next_power_of_2(x)
```

---

#### `macro`
```c3
macro uint double.high_word(double d)
```

---

#### `macro`
```c3
macro uint double.low_word(double d)
```

---

#### `macro`
```c3
macro uint float.word(float d)
```

---

#### `macro`
```c3
macro void double.set_high_word(double* d, uint u)
```

---

#### `macro`
```c3
macro void double.set_low_word(double* d, uint u)
```

---

#### `macro`
```c3
macro void float.set_word(float* f, uint u)
```

---

#### `macro`
```c3
macro double scalbn(double x, int n)
```

---

#### `extern func`
```c3
extern fn double _atan(double x) @MathLibc("atan")
```

---

#### `func`
```c3
fn void _sincosf(float a, float* s, float* c) @extern("sincosf") @if(env::WIN32)
```

---

#### `extern func`
```c3
extern fn double _tan(double x) @MathLibc("tan")
```

---

#### `func`
```c3
fn float _frexpf(float x, int* e)
```

---

#### `macro`
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

#### `macro`
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

#### `macro`
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

#### `macro`
```c3
<*
 @require types::is_vector($Type) || ($Type.kindof == ARRAY &&& types::is_numerical($typefrom($Type.inner)))
*>
macro iota($Type)
```


---

#### `macro`
```c3
macro char char.muldiv(self, char mul, char div)
```

---

#### `macro`
```c3
macro ichar ichar.muldiv(self, ichar mul, ichar div)
```

---

#### `macro`
```c3
macro short short.muldiv(self, short mul, short div)
```

---

#### `macro`
```c3
macro ushort ushort.muldiv(self, ushort mul, ushort div)
```

---

#### `macro`
```c3
macro int int.muldiv(self, int mul, int div)
```

---

#### `macro`
```c3
macro uint uint.muldiv(self, uint mul, uint div)
```

---

#### `macro`
```c3
macro long long.muldiv(self, long mul, long div)
```

---

#### `macro`
```c3
macro ulong ulong.muldiv(self, ulong mul, ulong div)
```

---

#### `macro`
```c3
<*
 @require @is_same_vector_or_scalar(self, mul) : `mul must be a vector of the same type as self, or be an integer scalar`
 @require @is_same_vector_or_scalar(self, div) : `div must be a vector of the same type as self, or be an integer scalar`
*>
macro char[<*>] char[<*>].muldiv(self, mul, div)
```


---

#### `macro`
```c3
<*
 @require @is_same_vector_or_scalar(self, mul) : `mul must be a vector of the same type as self, or be an integer scalar`
 @require @is_same_vector_or_scalar(self, div) : `div must be a vector of the same type as self, or be an integer scalar`
*>
macro ichar[<*>] ichar[<*>].muldiv(self, mul, div)
```


---

#### `macro`
```c3
<*
 @require @is_same_vector_or_scalar(self, mul) : `mul must be a vector of the same type as self, or be an integer scalar`
 @require @is_same_vector_or_scalar(self, div) : `div must be a vector of the same type as self, or be an integer scalar`
*>
macro short[<*>] short[<*>].muldiv(self, mul, div)
```


---

#### `macro`
```c3
<*
 @require @is_same_vector_or_scalar(self, mul) : `mul must be a vector of the same type as self, or be an integer scalar`
 @require @is_same_vector_or_scalar(self, div) : `div must be a vector of the same type as self, or be an integer scalar`
*>
macro ushort[<*>] ushort[<*>].muldiv(self, mul, div)
```


---

#### `macro`
```c3
<*
 @require @is_same_vector_or_scalar(self, mul) : `mul must be a vector of the same type as self, or be an integer scalar`
 @require @is_same_vector_or_scalar(self, div) : `div must be a vector of the same type as self, or be an integer scalar`
*>
macro int[<*>] int[<*>].muldiv(self, mul, div)
```


---

#### `macro`
```c3
<*
 @require @is_same_vector_or_scalar(self, mul) : `mul must be a vector of the same type as self, or be an integer scalar`
 @require @is_same_vector_or_scalar(self, div) : `div must be a vector of the same type as self, or be an integer scalar`
*>
macro uint[<*>] uint[<*>].muldiv(self, mul, div)
```


---

#### `macro`
```c3
<*
 @require @is_same_vector_or_scalar(self, mul) : `mul must be a vector of the same type as self, or be an integer scalar`
 @require @is_same_vector_or_scalar(self, div) : `div must be a vector of the same type as self, or be an integer scalar`
*>
macro long[<*>] long[<*>].muldiv(self, mul, div)
```


---

#### `macro`
```c3
<*
 @require @is_same_vector_or_scalar(self, mul) : `mul must be a vector of the same type as self, or be an integer scalar`
 @require @is_same_vector_or_scalar(self, div) : `div must be a vector of the same type as self, or be an integer scalar`
*>
macro ulong[<*>] ulong[<*>].muldiv(self, mul, div)
```


---

#### `macro`
```c3
<*
 @require $vacount >= 2 : "At least two arguments are required."
*>
macro lcm(...)
```


Calculate the least common multiple for the provided arguments.

---

#### `macro`
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
alias Matrix2  = Matrix2x2 {double}
alias Matrix3f = Matrix3x3 {float}
alias Matrix3  = Matrix3x3 {double}
alias Matrix4f = Matrix4x4 {float}
alias Matrix4  = Matrix4x4 {double}
```

---

#### `matrix`
```c3
alias matrix4_ortho  @builtin = matrix::ortho {double}
alias matrix4f_ortho @builtin = matrix::ortho {float}
alias matrix4_perspective  @builtin = matrix::perspective {double}
alias matrix4f_perspective @builtin = matrix::perspective {float}
```

---

#### `MATRIX`
```c3
alias MATRIX2_IDENTITY  @builtin = matrix::IDENTITY2 {double}
alias MATRIX2F_IDENTITY @builtin = matrix::IDENTITY2 {float}
alias MATRIX3_IDENTITY  @builtin = matrix::IDENTITY3 {double}
alias MATRIX3F_IDENTITY @builtin = matrix::IDENTITY3 {float}
alias MATRIX4_IDENTITY  @builtin = matrix::IDENTITY4 {double}
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
const MAX_LEN
```

---

#### `ZERO`
```c3
const BigInt ZERO
```

---

#### `ONE`
```c3
const BigInt ONE
```

---

#### `BigInt`
```c3
struct BigInt (Printable)
```

---

#### `func`
```c3
fn BigInt from_int(int128 val)
```

---

#### `func`
```c3
fn BigInt* BigInt.init(&self, int128 value)
```

---

#### `func`
```c3
fn BigInt* BigInt.init_with_u128(&self, uint128 value)
```

---

#### `func`
```c3
<*
 @require values.len <= MAX_LEN
*>
fn BigInt* BigInt.init_with_array(&self, uint[] values)
```


---

#### `func`
```c3
fn BigInt*? BigInt.init_string_radix(&self, String value, int radix)
```

---

#### `func`
```c3
fn bool BigInt.is_negative(&self)
```

---

#### `func`
```c3
fn BigInt BigInt.add(self, BigInt other) @operator(+)
```

---

#### `func`
```c3
fn void BigInt.add_this(&self, BigInt other) @operator(+=)
```

---

#### `macro`
```c3
macro uint find_length(uint* data, uint length)
```

---

#### `func`
```c3
fn BigInt BigInt.mult(self, BigInt bi2) @operator(*)
```

---

#### `func`
```c3
fn void BigInt.mult_this(&self, BigInt bi2) @operator(*=)
```

---

#### `func`
```c3
fn void BigInt.negate(&self)
```

---

#### `macro`
```c3
macro bool BigInt.is_zero(&self)
```

---

#### `func`
```c3
fn BigInt BigInt.sub(self, BigInt other) @operator(-)
```

---

#### `func`
```c3
fn BigInt* BigInt.sub_this(&self, BigInt other) @operator(-=)
```

---

#### `func`
```c3
fn int BigInt.bitcount(&self)
```

---

#### `func`
```c3
fn BigInt BigInt.unary_minus(&self) @operator(-)
```

---

#### `macro`
```c3
macro BigInt BigInt.div(self, BigInt other) @operator(/)
```

---

#### `func`
```c3
fn void BigInt.div_this(&self, BigInt other) @operator(/=)
```

---

#### `func`
```c3
fn BigInt BigInt.mod(self, BigInt bi2) @operator(%)
```

---

#### `func`
```c3
fn void BigInt.mod_this(&self, BigInt bi2) @operator(%=)
```

---

#### `func`
```c3
fn void BigInt.bit_negate_this(&self)
```

---

#### `func`
```c3
fn BigInt BigInt.bit_negate(self) @operator(~)
```

---

#### `func`
```c3
fn BigInt BigInt.shr(self, int shift) @operator(>>)
```

---

#### `func`
```c3
fn void BigInt.shr_this(self, int shift) @operator(>>=)
```

---

#### `func`
```c3
fn BigInt BigInt.shl(self, int shift) @operator(<<)
```

---

#### `macro`
```c3
macro bool BigInt.equals(&self, BigInt other) @operator(==)
```

---

#### `macro`
```c3
macro bool BigInt.greater_than(&self, BigInt other)
```

---

#### `macro`
```c3
macro bool BigInt.less_than(&self, BigInt other)
```

---

#### `func`
```c3
fn bool BigInt.is_odd(&self)
```

---

#### `func`
```c3
fn bool BigInt.is_one(&self)
```

---

#### `macro`
```c3
macro bool BigInt.greater_or_equal(&self, BigInt other)
```

---

#### `macro`
```c3
macro bool BigInt.less_or_equal(&self, BigInt)
```

---

#### `func`
```c3
fn BigInt BigInt.abs(&self)
```

---

#### `func`
```c3
fn usz? BigInt.to_format(&self, Formatter* format) @dynamic
```

---

#### `func`
```c3
fn String BigInt.to_string(&self, Allocator allocator) @dynamic
```

---

#### `func`
```c3
<*
 @require radix > 1 && radix <= 36 : "Radix must be 2-36"
*>
fn String BigInt.to_string_with_radix(&self, int radix, Allocator allocator)
```


---

#### `func`
```c3
<*
 @require !exp.is_negative() : "Positive exponents only"
*>
fn BigInt BigInt.mod_pow(&self, BigInt exp, BigInt mod)
```


---

#### `func`
```c3
fn BigInt barrett_reduction(BigInt x, BigInt n, BigInt constant)
```

Fast calculation of modular reduction using Barrett's reduction.
Requires x < b^(2k), where b is the base.  In this case, base is
2^32 (uint).

---

#### `func`
```c3
fn BigInt BigInt.sqrt(&self)
```

---

#### `func`
```c3
fn BigInt BigInt.bit_and(self, BigInt bi2) @operator(&)
```

---

#### `func`
```c3
fn void BigInt.bit_and_this(&self, BigInt bi2)
```

---

#### `func`
```c3
fn BigInt BigInt.bit_or(self, BigInt bi2) @operator(|)
```

---

#### `func`
```c3
fn void BigInt.bit_or_this(&self, BigInt bi2)
```

---

#### `func`
```c3
fn BigInt BigInt.bit_xor(self, BigInt bi2) @operator(^)
```

---

#### `func`
```c3
fn void BigInt.bit_xor_this(&self, BigInt bi2)
```

---

#### `func`
```c3
fn void BigInt.shl_this(&self, int shift) @operator(<<=)
```

---

#### `func`
```c3
fn BigInt BigInt.gcd(&self, BigInt other)
```

---

#### `func`
```c3
fn BigInt BigInt.lcm(&self, BigInt other)
```

---

#### `func`
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
const Complex IDENTITY
```

---

#### `IMAGINARY`
```c3
const Complex IMAGINARY
```

---

#### `macro`
```c3
macro Complex Complex.add(self, Complex b) @operator(+)
```

---

#### `macro`
```c3
macro Complex Complex.add_this(&self, Complex b) @operator(+=)
```

---

#### `macro`
```c3
macro Complex Complex.add_real(self, Real r) @operator_s(+)
```

---

#### `macro`
```c3
macro Complex Complex.add_each(self, Real b)
```

---

#### `macro`
```c3
macro Complex Complex.sub(self, Complex b) @operator(-)
```

---

#### `macro`
```c3
macro Complex Complex.sub_this(&self, Complex b) @operator(-=)
```

---

#### `macro`
```c3
macro Complex Complex.sub_real(self, Real r) @operator(-)
```

---

#### `macro`
```c3
macro Complex Complex.sub_real_inverse(self, Real r) @operator_r(-)
```

---

#### `macro`
```c3
macro Complex Complex.sub_each(self, Real b)
```

---

#### `macro`
```c3
macro Complex Complex.scale(self, Real r) @operator_s(*)
```

---

#### `macro`
```c3
macro Complex Complex.mul(self, Complex b)@operator(*)
```

---

#### `macro`
```c3
macro Complex Complex.div_real(self, Real r) @operator(/)
```

---

#### `macro`
```c3
macro Complex Complex.div_real_inverse(Complex c, Real r) @operator_r(/)
```

---

#### `macro`
```c3
macro Complex Complex.div(self, Complex b) @operator(/)
```

---

#### `macro`
```c3
macro Complex Complex.inverse(self)
```

---

#### `macro`
```c3
macro Complex Complex.conjugate(self)
```

---

#### `macro`
```c3
macro Complex Complex.negate(self) @operator(-)
```

---

#### `macro`
```c3
macro bool Complex.equals(self, Complex b) @operator(==)
```

---

#### `macro`
```c3
macro bool Complex.equals_real(self, Real r) @operator_s(==)
```

---

#### `macro`
```c3
macro bool Complex.not_equals(self, Complex b) @operator(!=)
```

---

#### `func`
```c3
fn usz? Complex.to_format(&self, Formatter* f) @dynamic
```
### `std::math::easing`

---

#### `func`
```c3
fn float linear_none(float t, float b, float c, float d) @inline
```

---

#### `func`
```c3
fn float linear_in(float t, float b, float c, float d) @inline
```

---

#### `func`
```c3
fn float linear_out(float t, float b, float c, float d) @inline
```

---

#### `func`
```c3
fn float linear_inout(float t, float b, float c, float d) @inline
```

---

#### `func`
```c3
fn float sine_in(float t, float b, float c, float d) @inline
```

---

#### `func`
```c3
fn float sine_out(float t, float b, float c, float d) @inline
```

---

#### `func`
```c3
fn float sine_inout(float t, float b, float c, float d) @inline
```

---

#### `func`
```c3
fn float circ_in(float t, float b, float c, float d) @inline
```

---

#### `func`
```c3
fn float circ_out(float t, float b, float c, float d) @inline
```

---

#### `func`
```c3
fn float circ_inout(float t, float b, float c, float d) @inline
```

---

#### `func`
```c3
fn float cubic_in(float t, float b, float c, float d) @inline
```

---

#### `func`
```c3
fn float cubic_out(float t, float b, float c, float d) @inline
```

---

#### `func`
```c3
fn float cubic_inout(float t, float b, float c, float d) @inline
```

---

#### `func`
```c3
fn float quad_in(float t, float b, float c, float d) @inline
```

---

#### `func`
```c3
fn float quad_out(float t, float b, float c, float d) @inline
```

---

#### `func`
```c3
fn float quad_inout(float t, float b, float c, float d) @inline
```

---

#### `func`
```c3
fn float expo_in(float t, float b, float c, float d) @inline
```

---

#### `func`
```c3
fn float expo_out(float t, float b, float c, float d) @inline
```

---

#### `func`
```c3
fn float expo_inout(float t, float b, float c, float d) @inline
```

---

#### `func`
```c3
fn float back_in(float t, float b, float c, float d, float s = 1.70158f) @inline
```

---

#### `func`
```c3
fn float back_out(float t, float b, float c, float d, float s = 1.70158f) @inline
```

---

#### `func`
```c3
fn float back_inout(float t, float b, float c, float d, float s = 1.70158f) @inline
```

---

#### `func`
```c3
fn float bounce_out(float t, float b, float c, float d) @inline
```

---

#### `func`
```c3
fn float bounce_in(float t, float b, float c, float d) @inline
```

---

#### `func`
```c3
fn float bounce_inout(float t, float b, float c, float d) @inline
```

---

#### `func`
```c3
fn float elastic_in(float t, float b, float c, float d) @inline
```

---

#### `func`
```c3
fn float elastic_out(float t, float b, float c, float d) @inline
```

---

#### `func`
```c3
fn float elastic_inout(float t, float b, float c, float d) @inline
```
### `std::math::math_rt`

---

#### `func`
```c3
fn int128 __divti3(int128 a, int128 b) @extern("__divti3") @weak @nostrip
```

---

#### `macro`
```c3
macro uint128 @__udivmodti4(uint128 a, uint128 b, bool $return_rem)
```

---

#### `func`
```c3
fn uint128 __umodti3(uint128 n, uint128 d) @extern("__umodti3") @weak @nostrip
```

---

#### `func`
```c3
fn uint128 __udivti3(uint128 n, uint128 d) @extern("__udivti3") @weak @nostrip
```

---

#### `func`
```c3
fn int128 __modti3(int128 a, int128 b) @extern("__modti3") @weak @nostrip
```

---

#### `func`
```c3
fn uint128 __lshrti3(uint128 a, uint b) @extern("__lshrti3") @weak @nostrip
```

---

#### `func`
```c3
fn int128 __ashrti3(int128 a, uint b) @extern("__ashrti3") @weak @nostrip
```

---

#### `func`
```c3
fn int128 __ashlti3(int128 a, uint b) @extern("__ashlti3") @weak @nostrip
```

---

#### `func`
```c3
fn int128 __multi3(int128 a, int128 b) @extern("__multi3") @weak @nostrip
```

---

#### `func`
```c3
fn float __floattisf(int128 a) @extern("__floattisf") @weak @nostrip
```

---

#### `func`
```c3
fn double __floattidf(int128 a) @extern("__floattidf") @weak @nostrip
```

---

#### `func`
```c3
fn float __floatuntisf(uint128 a) @extern("__floatuntisf") @weak @nostrip
```

---

#### `func`
```c3
fn double __floatuntidf(uint128 a) @extern("__floatuntidf") @weak @nostrip
```

---

#### `func`
```c3
fn uint128 __fixunsdfti(double a) @weak @extern("__fixunsdfti") @nostrip
```

---

#### `func`
```c3
fn uint128 __fixunssfti(float a) @weak @extern("__fixunssfti") @nostrip
```

---

#### `func`
```c3
fn int128 __fixdfti(double a) @weak @extern("__fixdfti") @nostrip
```

---

#### `func`
```c3
fn int128 __fixsfti(float a) @weak @extern("__fixsfti") @nostrip
```

---

#### `func`
```c3
fn float __roundevenf(float f) @extern("roundevenf") @weak @nostrip
```

---

#### `func`
```c3
fn double __roundeven(double d) @extern("roundeven") @weak @nostrip
```

---

#### `func`
```c3
fn double __powidf2(double a, int b) @extern("__powidf2") @weak @nostrip
```
### `std::math::matrix {Real}`

---

#### `Matrix`
```c3
struct Matrix2x2
struct Matrix3x3

struct Matrix4x4

```

---

#### `func`
```c3
fn Real[<2>] Matrix2x2.apply(&self, Real[<2>] vec) @operator(*)
```

---

#### `func`
```c3
fn Real[<3>] Matrix3x3.apply(&self, Real[<3>] vec) @operator(*)
```

---

#### `func`
```c3
fn Real[<4>] Matrix4x4.apply(&self, Real[<4>] vec) @operator(*)
```

---

#### `func`
```c3
fn Matrix2x2 Matrix2x2.mul(&self, Matrix2x2 b) @operator(*)
```

---

#### `func`
```c3
fn Matrix3x3 Matrix3x3.mul(&self, Matrix3x3 b) @operator(*)
```

---

#### `func`
```c3
fn Matrix4x4 Matrix4x4.mul(Matrix4x4* self, Matrix4x4 b) @operator(*)
```

---

#### `func`
```c3
fn Matrix2x2 Matrix2x2.component_mul(&self, Real s)
```

---

#### `func`
```c3
fn Matrix3x3 Matrix3x3.component_mul(&self, Real s)
```

---

#### `func`
```c3
fn Matrix4x4 Matrix4x4.component_mul(&self, Real s)
```

---

#### `func`
```c3
fn Matrix2x2 Matrix2x2.add(&self, Matrix2x2 mat2) @operator(+)
```

---

#### `func`
```c3
fn Matrix3x3 Matrix3x3.add(&self, Matrix3x3 mat2) @operator(+)
```

---

#### `func`
```c3
fn Matrix4x4 Matrix4x4.add(&self, Matrix4x4 mat2) @operator(+)
```

---

#### `func`
```c3
fn Matrix2x2 Matrix2x2.sub(&self, Matrix2x2 mat2) @operator(-)
```

---

#### `func`
```c3
fn Matrix3x3 Matrix3x3.sub(&self, Matrix3x3 mat2) @operator(-)
```

---

#### `func`
```c3
fn Matrix4x4 Matrix4x4.sub(&self, Matrix4x4 mat2) @operator(-)
```

---

#### `func`
```c3
fn Matrix2x2 Matrix2x2.negate(&self) @operator(-)
```

---

#### `func`
```c3
fn Matrix3x3 Matrix3x3.negate(&self) @operator(-)
```

---

#### `func`
```c3
fn Matrix4x4 Matrix4x4.negate(&self) @operator(-)
```

---

#### `func`
```c3
fn bool Matrix2x2.eq(&self, Matrix2x2 mat2) @operator(==)
```

---

#### `func`
```c3
fn bool Matrix3x3.eq(&self, Matrix3x3 mat2) @operator(==)
```

---

#### `func`
```c3
fn bool Matrix4x4.eq(&self, Matrix4x4 mat2) @operator(==)
```

---

#### `func`
```c3
fn bool Matrix2x2.neq(&self, Matrix2x2 mat2) @operator(!=)
```

---

#### `func`
```c3
fn bool Matrix3x3.neq(&self, Matrix3x3 mat2) @operator(!=)
```

---

#### `func`
```c3
fn bool Matrix4x4.neq(&self, Matrix4x4 mat2) @operator(!=)
```

---

#### `func`
```c3
fn Matrix4x4 look_at(Real[<3>] eye, Real[<3>] target, Real[<3>] up)
```

---

#### `func`
```c3
fn Matrix2x2 Matrix2x2.transpose(&self)
```

---

#### `func`
```c3
fn Matrix3x3 Matrix3x3.transpose(&self)
```

---

#### `func`
```c3
fn Matrix4x4 Matrix4x4.transpose(&self)
```

---

#### `func`
```c3
fn Real Matrix2x2.determinant(&self)
```

---

#### `func`
```c3
fn Real Matrix3x3.determinant(&self)
```

---

#### `func`
```c3
fn Real Matrix4x4.determinant(&self)
```

---

#### `func`
```c3
fn Matrix2x2 Matrix2x2.adjoint(&self)
```

---

#### `func`
```c3
fn Matrix3x3 Matrix3x3.adjoint(&self)
```

---

#### `func`
```c3
fn Matrix4x4 Matrix4x4.adjoint(&self)
```

---

#### `func`
```c3
fn Matrix2x2? Matrix2x2.inverse(&self)
```

---

#### `func`
```c3
fn Matrix3x3? Matrix3x3.inverse(&self)
```

---

#### `func`
```c3
fn Matrix4x4? Matrix4x4.inverse(&self)
```

---

#### `func`
```c3
fn Matrix3x3 Matrix3x3.translate(&self, Real[<2>] v)
```

---

#### `func`
```c3
fn Matrix4x4 Matrix4x4.translate(&self, Real[<3>] v)
```

---

#### `func`
```c3
fn Matrix3x3 Matrix3x3.rotate(&self, Real r)
```

---

#### `func`
```c3
fn Matrix4x4 Matrix4x4.rotate_z(&self, Real r)
```

---

#### `func`
```c3
fn Matrix4x4 Matrix4x4.rotate_y(&self, Real r)
```

---

#### `func`
```c3
fn Matrix4x4 Matrix4x4.rotate_x(&self, Real r)
```

---

#### `func`
```c3
fn Matrix3x3 Matrix3x3.scale(&self, Real[<2>] v)
```

---

#### `func`
```c3
fn Real Matrix2x2.trace(&self)
```

---

#### `func`
```c3
fn Real Matrix3x3.trace(&self)
```

---

#### `func`
```c3
fn Real Matrix4x4.trace(&self)
```

---

#### `func`
```c3
fn Matrix4x4 Matrix4x4.scale(&self, Real[<3>] v)
```

---

#### `func`
```c3
fn Matrix4x4 ortho(Real left, Real right, Real top, Real bottom, Real near, Real far)
```

---

#### `func`
```c3
fn Matrix4x4 perspective(Real fov, Real aspect_ratio, Real near, Real far)
```

---

#### `IDENTITY2`
```c3
const Matrix2x2 IDENTITY2
```

---

#### `IDENTITY3`
```c3
const Matrix3x3 IDENTITY3
```

---

#### `IDENTITY4`
```c3
const Matrix4x4 IDENTITY4
```
### `std::math::nolibc @if(env::NO_LIBC || $feature(C3_MATH))`

---

#### `func`
```c3
fn double __cos(double x, double y) @extern("__cos") @weak @nostrip
```

---

#### `func`
```c3
fn float __cosdf(double x) @extern("__cosdf") @weak @nostrip
```

---

#### `func`
```c3
fn double fmod(double x, double y) @extern("fmod") @weak @nostrip
```

---

#### `func`
```c3
fn float fmodf(float x, float y) @extern("fmodf") @weak @nostrip
```

---

#### `func`
```c3
fn double __sin(double x, double y, int iy) @extern("__sin") @weak @nostrip
```

---

#### `func`
```c3
fn float __sindf(double x) @extern("__sindf") @weak @nostrip
```

---

#### `TAN_T`
```c3
const double[*] TAN_T
```

---

#### `func`
```c3
fn double __tan(double x, double y, int odd) @extern("__tan") @weak @nostrip
```

---

#### `TANDF`
```c3
const double[*] TANDF
```

---

#### `func`
```c3
fn float __tandf(double x, int odd) @extern("__tandf") @weak @nostrip
```

---

#### `func`
```c3
fn double _acos(double x) @weak @extern("acos") @nostrip
```

---

#### `func`
```c3
fn float _acosf(float x) @weak @extern("acosf") @nostrip
```

---

#### `func`
```c3
fn double _asin(double x) @weak @extern("asin") @nostrip
```

---

#### `func`
```c3
fn float _asinf(float x) @weak @extern("asinf") @nostrip
```

---

#### `func`
```c3
fn double _atan(double x) @weak @extern("atan") @nostrip
```

---

#### `func`
```c3
fn float _atanf(float x) @weak @extern("atanf") @nostrip
```

---

#### `func`
```c3
fn double _atan2(double y, double x) @weak @extern("atan2") @nostrip
```

---

#### `func`
```c3
fn float _atan2f(float y, float x) @weak @extern("atan2f") @nostrip
```

---

#### `func`
```c3
fn double _atanh(double x) @weak @extern("atanh") @nostrip
```

---

#### `func`
```c3
fn float _atanhf(float x) @weak @extern("atanhf") @nostrip
```

---

#### `func`
```c3
fn double _ceil(double x) @weak @extern("ceil") @nostrip
```

---

#### `func`
```c3
fn float _ceilf(float x) @weak @extern("ceilf") @nostrip
```

---

#### `func`
```c3
fn float _cosf(float x) @extern("cosf") @weak @nostrip
```

---

#### `func`
```c3
fn double _cos(double x) @extern("cos")  @weak @nostrip
```

---

#### `EXP_LN2_HI`
```c3
const double EXP_LN2_HI
```

---

#### `EXP_LN2_LO`
```c3
const double EXP_LN2_LO
```

---

#### `EXP_INV_LN2`
```c3
const double EXP_INV_LN2
```

---

#### `EXP_P1`
```c3
const double EXP_P1
```

---

#### `EXP_P2`
```c3
const double EXP_P2
```

---

#### `EXP_P3`
```c3
const double EXP_P3
```

---

#### `EXP_P4`
```c3
const double EXP_P4
```

---

#### `EXP_P5`
```c3
const double EXP_P5
```

---

#### `EXPF_LN2_HI`
```c3
const float EXPF_LN2_HI
```

---

#### `EXPF_LN2_LO`
```c3
const float EXPF_LN2_LO
```

---

#### `EXPF_INV_LN2`
```c3
const float EXPF_INV_LN2
```

---

#### `EXPF_P1`
```c3
const float EXPF_P1
```

---

#### `EXPF_P2`
```c3
const float EXPF_P2
```

---

#### `EXPF_P3`
```c3
const float EXPF_P3
```

---

#### `EXPF_P4`
```c3
const float EXPF_P4
```

---

#### `func`
```c3
fn double exp(double x) @extern("exp")
```

---

#### `func`
```c3
fn float expf(float x) @extern("expf")
```

---

#### `func`
```c3
fn float _exp2f(float x) @extern("exp2f") @weak @nostrip
```

---

#### `func`
```c3
fn double _exp2(double x) @extern("exp2") @weak @nostrip
```

---

#### `func`
```c3
fn double _fabs(double x) @weak @extern("fabs") @nostrip
```

---

#### `func`
```c3
fn float _fabsf(float x) @weak @extern("fabsf") @nostrip
```

---

#### `func`
```c3
fn double _floor(double x) @weak @extern("floor") @nostrip
```

---

#### `func`
```c3
fn float _floorf(float x) @weak @extern("floorf") @nostrip
```

---

#### `func`
```c3
fn double frexp(double x, int* exp) @extern("frexp")
```

---

#### `func`
```c3
fn float frexpf(float x, int* exp) @extern("frexpf")
```

---

#### `func`
```c3
fn double ldexp(double x, int exp) @extern("ldexp")
```

---

#### `func`
```c3
fn float ldexpf(float x, int exp) @extern("ldexpf")
```

---

#### `LOG_LN2_HI`
```c3
const double LOG_LN2_HI
```

---

#### `LOG_LN2_LO`
```c3
const double LOG_LN2_LO
```

---

#### `LOG_L1`
```c3
const double LOG_L1
```

---

#### `LOG_L2`
```c3
const double LOG_L2
```

---

#### `LOG_L3`
```c3
const double LOG_L3
```

---

#### `LOG_L4`
```c3
const double LOG_L4
```

---

#### `LOG_L5`
```c3
const double LOG_L5
```

---

#### `LOG_L6`
```c3
const double LOG_L6
```

---

#### `LOGF_LN2_HI`
```c3
const float LOGF_LN2_HI
```

---

#### `LOGF_LN2_LO`
```c3
const float LOGF_LN2_LO
```

---

#### `LOGF_L1`
```c3
const float LOGF_L1
```

---

#### `LOGF_L2`
```c3
const float LOGF_L2
```

---

#### `LOGF_L3`
```c3
const float LOGF_L3
```

---

#### `LOGF_L4`
```c3
const float LOGF_L4
```

---

#### `SQRT2`
```c3
const double SQRT2
```

---

#### `SQRT2F`
```c3
const float SQRT2F
```

---

#### `func`
```c3
fn double log(double x) @extern("log")
```

---

#### `func`
```c3
fn float logf(float x) @extern("logf")
```

---

#### `func`
```c3
fn double _log1p(double x) @weak @extern("log1p") @nostrip
```

---

#### `func`
```c3
fn float _log1pf(float x) @weak @extern("log1pf") @nostrip
```

---

#### `TOINT`
```c3
const double TOINT
```

---

#### `TOINT15`
```c3
const double TOINT15
```

---

#### `TOINTF`
```c3
const float TOINTF
```

---

#### `EXP_TABLE_BITS`
```c3
const EXP_TABLE_BITS
```

---

#### `EXP_POLY_ORDER`
```c3
const EXP_POLY_ORDER
```

---

#### `EXP2_POLY_ORDER`
```c3
const EXP2_POLY_ORDER
```

---

#### `EXP_DATA_WIDTH`
```c3
const EXP_DATA_WIDTH
```

---

#### `__EXP2_DATA`
```c3
const Exp2Data __EXP2_DATA
```

---

#### `WANT_ROUNDING`
```c3
const bool WANT_ROUNDING
```

---

#### `macro`
```c3
macro float __math_uflowf(uint sign)
```

---

#### `macro`
```c3
macro double __math_uflow(ulong sign)
```

---

#### `macro`
```c3
macro float __math_oflowf(uint sign)
```

---

#### `macro`
```c3
macro double __math_oflow(ulong sign)
```

---

#### `macro`
```c3
macro __math_xflow(sign, v)
```

---

#### `macro`
```c3
macro force_eval_add(x, v)
```

---

#### `func`
```c3
fn double pow(double x, double y) @extern("pow")
```

---

#### `func`
```c3
fn float powf(float x, float y) @extern("powf")
```

---

#### `func`
```c3
fn int __rem_pio2f(float x, double *y)
```

---

#### `INIT_JK`
```c3
const int[*] INIT_JK
```

---

#### `IPIO2`
```c3
const int[*] IPIO2
```

---

#### `func`
```c3
fn int __rem_pio2_large(double* x, double* y, int e0, int nx, int prec)
```

---

#### `func`
```c3
fn int __rem_pio2(double x, double *y)
```

caller must handle the case when reduction is not needed: |x| ~<= pi/4

---

#### `func`
```c3
fn double _round(double x) @extern("round") @weak @nostrip
```

---

#### `func`
```c3
fn float _roundf(float x) @extern("roundf") @weak @nostrip
```

---

#### `func`
```c3
fn double _scalbn(double x, int n) @weak @extern("scalbn") @nostrip
```

---

#### `func`
```c3
fn float _sinf(float x) @weak @extern("sinf") @nostrip
```

---

#### `func`
```c3
fn double sin(double x) @extern("sin") @weak @nostrip
```

---

#### `func`
```c3
fn void sincosf(float x, float *sin, float *cos) @extern("__sincosf") @weak @nostrip
```

---

#### `func`
```c3
fn void sincos(double x, double *sin, double *cos) @extern("__sincos") @weak @nostrip
```

---

#### `func`
```c3
fn double tan(double x) @extern("tan") @weak @nostrip
```

---

#### `func`
```c3
fn float tanf(float x) @extern("tanf") @weak @nostrip
```

---

#### `func`
```c3
fn double sincos_broken(double x) @extern("sincos") @weak @nostrip
```

---

#### `func`
```c3
fn double _trunc(double x) @weak @extern("trunc") @nostrip
```

---

#### `func`
```c3
fn float _truncf(float x) @weak @extern("truncf") @nostrip
```
### `std::math::quaternion {Real}`

---

#### `IDENTITY`
```c3
const Quaternion IDENTITY
```

---

#### `macro`
```c3
macro Quaternion Quaternion.add(self, Quaternion b) @operator(+)
```

---

#### `macro`
```c3
macro Quaternion Quaternion.add_each(self, Real b)
```

---

#### `macro`
```c3
macro Quaternion Quaternion.sub(self, Quaternion b) @operator(-)
```

---

#### `macro`
```c3
macro Quaternion Quaternion.negate(self) @operator(-)
```

---

#### `macro`
```c3
macro Quaternion Quaternion.sub_each(self, Real b)
```

---

#### `macro`
```c3
macro Quaternion Quaternion.scale(self, Real s) @operator_s(*)
```

---

#### `macro`
```c3
macro Quaternion Quaternion.normalize(self)
```

---

#### `macro`
```c3
macro Real Quaternion.length(self)
```

---

#### `macro`
```c3
macro Quaternion Quaternion.lerp(self, Quaternion q2, Real amount)
```

---

#### `macro`
```c3
macro Matrix4f Quaternion.to_matrixf(&self)
```

---

#### `macro`
```c3
macro Matrix4 Quaternion.to_matrix(&self)
```

---

#### `func`
```c3
fn Quaternion Quaternion.nlerp(self, Quaternion q2, Real amount)
```

---

#### `func`
```c3
fn Quaternion Quaternion.invert(self)
```

---

#### `func`
```c3
fn Quaternion Quaternion.slerp(self, Quaternion q2, Real amount)
```

---

#### `func`
```c3
fn Quaternion Quaternion.mul(self, Quaternion b) @operator(*)
```
### `std::math::random`

---

#### `macro`
```c3
<*
 @require is_random(random)
*>
macro void seed(random, seed)
```


---

#### `macro`
```c3
<*
 @require is_random(random)
*>
macro void seed_entropy(random)
```


Seed the random with some best effort entropy.

---

#### `macro`
```c3
<*
 @require is_random(random)
 @require range > 0
*>
macro int next(random, uint range)
```


Get the next value between 0 and range (not including range).

---

#### `macro`
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

#### `func`
```c3
fn void srand(ulong seed) @builtin
```

Seed the default random function.

---

#### `func`
```c3
fn int rand(int range) @builtin
```

Get a default random value between 0 and range (not including range)

---

#### `func`
```c3
<*
 @require max >= min
*>
fn int rand_in_range(int min, int max) @builtin
```


Get a random in the range, both included.

---

#### `func`
```c3
fn double rnd() @builtin
```

---

#### `macro`
```c3
<*
 @require is_random(random)
*>
macro bool next_bool(random)
```


Get 'true' or 'false'

---

#### `macro`
```c3
<*
 @require is_random(random)
*>
macro float next_float(random)
```


Get a float between 0 and 1.0, not including 1.0.

---

#### `macro`
```c3
<*
 @require is_random(random)
*>
macro double next_double(random)
```


Get a double between 0 and 1.0, not including 1.0.

---

#### `macro`
```c3
macro bool is_random(random)
```

---

#### `macro`
```c3
macro uint128 @long_to_int128(#function)
```

---

#### `macro`
```c3
macro ulong @int_to_long(#function)
```

---

#### `macro`
```c3
macro uint @short_to_int(#function)
```

---

#### `macro`
```c3
macro ushort @char_to_short(#function)
```

---

#### `macro`
```c3
macro @random_value_to_bytes(#function, char[] bytes)
```

---

#### `Lcg`
```c3
typedef Lcg128Random (Random) = uint128
typedef Lcg64Random (Random) = ulong
typedef Lcg32Random (Random) = uint
typedef Lcg16Random (Random) = ushort
```

---

#### `func`
```c3
fn void Lcg128Random.set_seed(&self, char[] input) @dynamic
```

---

#### `func`
```c3
fn ulong Lcg128Random.next_long(&self) @dynamic
```

---

#### `func`
```c3
<*
 @require bytes.len > 0
*>
fn void Lcg128Random.next_bytes(&self, char[] bytes) @dynamic
```


---

#### `func`
```c3
fn uint128 Lcg128Random.next_int128(&self) @dynamic
```

---

#### `func`
```c3
fn uint Lcg128Random.next_int(&self) @dynamic
```

---

#### `func`
```c3
fn ushort Lcg128Random.next_short(&self) @dynamic
```

---

#### `func`
```c3
fn char Lcg128Random.next_byte(&self) @dynamic
```

---

#### `func`
```c3
fn void Lcg64Random.set_seed(&self, char[] seed) @dynamic
```

---

#### `func`
```c3
fn uint Lcg64Random.next_int(&self) @dynamic
```

---

#### `func`
```c3
<*
 @require bytes.len > 0
*>
fn void Lcg64Random.next_bytes(&self, char[] bytes) @dynamic
```


---

#### `func`
```c3
fn uint128 Lcg64Random.next_int128(&self) @dynamic
```

---

#### `func`
```c3
fn ulong Lcg64Random.next_long(&self) @dynamic
```

---

#### `func`
```c3
fn ushort Lcg64Random.next_short(&self) @dynamic
```

---

#### `func`
```c3
fn char Lcg64Random.next_byte(&self) @dynamic
```

---

#### `func`
```c3
fn void Lcg32Random.set_seed(&self, char[] seed) @dynamic
```

---

#### `func`
```c3
fn ushort Lcg32Random.next_short(&self) @dynamic
```

---

#### `func`
```c3
fn void Lcg32Random.next_bytes(&self, char[] bytes) @dynamic
```

---

#### `func`
```c3
fn uint128 Lcg32Random.next_int128(&self) @dynamic
```

---

#### `func`
```c3
fn ulong Lcg32Random.next_long(&self) @dynamic
```

---

#### `func`
```c3
fn uint Lcg32Random.next_int(&self) @dynamic
```

---

#### `func`
```c3
fn char Lcg32Random.next_byte(&self) @dynamic
```

---

#### `func`
```c3
fn void Lcg16Random.set_seed(&self, char[] seed) @dynamic
```

---

#### `func`
```c3
fn char Lcg16Random.next_byte(&self) @dynamic
```

---

#### `func`
```c3
fn void Lcg16Random.next_bytes(&self, char[] bytes) @dynamic
```

---

#### `func`
```c3
fn uint128 Lcg16Random.next_int128(&self) @dynamic
```

---

#### `func`
```c3
fn ulong Lcg16Random.next_long(&self) @dynamic
```

---

#### `func`
```c3
fn uint Lcg16Random.next_int(&self) @dynamic
```

---

#### `func`
```c3
fn ushort Lcg16Random.next_short(&self) @dynamic
```

---

#### `Mcg`
```c3
typedef Mcg128Random (Random) = uint128
typedef Mcg64Random (Random) = ulong
typedef Mcg32Random (Random) = uint
typedef Mcg16Random (Random) = ushort
```

---

#### `func`
```c3
fn void Mcg128Random.set_seed(&self, char[] seed) @dynamic
```

---

#### `func`
```c3
<*
 @require bytes.len > 0
*>
fn void Mcg128Random.next_bytes(&self, char[] bytes) @dynamic
```


---

#### `func`
```c3
fn ulong Mcg128Random.next_long(&self) @dynamic
```

---

#### `func`
```c3
fn uint128 Mcg128Random.next_int128(&self) @dynamic
```

---

#### `func`
```c3
fn uint Mcg128Random.next_int(&self) @dynamic
```

---

#### `func`
```c3
fn ushort Mcg128Random.next_short(&self) @dynamic
```

---

#### `func`
```c3
fn char Mcg128Random.next_byte(&self) @dynamic
```

---

#### `func`
```c3
fn void Mcg64Random.set_seed(&self, char[] seed) @dynamic
```

---

#### `func`
```c3
<*
 @require bytes.len > 0
*>
fn void Mcg64Random.next_bytes(&self, char[] bytes) @dynamic
```


---

#### `func`
```c3
fn uint Mcg64Random.next_int(&self) @dynamic
```

---

#### `func`
```c3
fn uint128 Mcg64Random.next_int128(&self) @dynamic
```

---

#### `func`
```c3
fn ulong Mcg64Random.next_long(&self) @dynamic
```

---

#### `func`
```c3
fn ushort Mcg64Random.next_short(&self) @dynamic
```

---

#### `func`
```c3
fn char Mcg64Random.next_byte(&self) @dynamic
```

---

#### `func`
```c3
fn void Mcg32Random.set_seed(&self, char[] seed) @dynamic
```

---

#### `func`
```c3
fn ushort Mcg32Random.next_short(&self) @dynamic
```

---

#### `func`
```c3
<*
 @require bytes.len > 0
*>
fn void Mcg32Random.next_bytes(&self, char[] bytes) @dynamic
```


---

#### `func`
```c3
fn uint128 Mcg32Random.next_int128(&self) @dynamic
```

---

#### `func`
```c3
fn ulong Mcg32Random.next_long(&self) @dynamic
```

---

#### `func`
```c3
fn uint Mcg32Random.next_int(&self) @dynamic
```

---

#### `func`
```c3
fn char Mcg32Random.next_byte(&self) @dynamic
```

---

#### `func`
```c3
fn void Mcg16Random.set_seed(&self, char[] seed) @dynamic
```

---

#### `func`
```c3
fn char Mcg16Random.next_byte(&self) @dynamic
```

---

#### `func`
```c3
fn void Mcg16Random.next_bytes(&self, char[] bytes) @dynamic
```

---

#### `func`
```c3
fn uint128 Mcg16Random.next_int128(&self) @dynamic
```

---

#### `func`
```c3
fn ulong Mcg16Random.next_long(&self) @dynamic
```

---

#### `func`
```c3
fn uint Mcg16Random.next_int(&self) @dynamic
```

---

#### `func`
```c3
fn ushort Mcg16Random.next_short(&self) @dynamic
```

---

#### `Msws`
```c3
struct Msws128Random (Random)
struct Msws64Random (Random)

struct Msws32Random (Random)

struct Msws16Random (Random)

struct Msws8Random (Random)

```

---

#### `func`
```c3
fn void Msws128Random.set_seed(&self, char[] input) @dynamic
```

---

#### `func`
```c3
fn uint128 Msws128Random.next_int128(&self) @dynamic
```

---

#### `func`
```c3
<*
 @require bytes.len > 0
*>
fn void Msws128Random.next_bytes(&self, char[] bytes) @dynamic
```


---

#### `func`
```c3
fn ulong Msws128Random.next_long(&self) @dynamic
```

---

#### `func`
```c3
fn uint Msws128Random.next_int(&self) @dynamic
```

---

#### `func`
```c3
fn ushort Msws128Random.next_short(&self) @dynamic
```

---

#### `func`
```c3
fn char Msws128Random.next_byte(&self) @dynamic
```

---

#### `func`
```c3
fn void  Msws64Random.set_seed(&self, char[] input) @dynamic
```

---

#### `func`
```c3
fn ulong Msws64Random.next_long(&self) @dynamic
```

---

#### `func`
```c3
<*
 @require bytes.len > 0
*>
fn void Msws64Random.next_bytes(&self, char[] bytes) @dynamic
```


---

#### `func`
```c3
fn uint128 Msws64Random.next_int128(&self) @dynamic
```

---

#### `func`
```c3
fn uint Msws64Random.next_int(&self) @dynamic
```

---

#### `func`
```c3
fn ushort Msws64Random.next_short(&self) @dynamic
```

---

#### `func`
```c3
fn char Msws64Random.next_byte(&self) @dynamic
```

---

#### `func`
```c3
fn void  Msws32Random.set_seed(&self, char[] input) @dynamic
```

---

#### `func`
```c3
fn uint Msws32Random.next_int(&self) @dynamic
```

---

#### `func`
```c3
<*
 @require bytes.len > 0
*>
fn void Msws32Random.next_bytes(&self, char[] bytes) @dynamic
```


---

#### `func`
```c3
fn uint128 Msws32Random.next_int128(&self) @dynamic
```

---

#### `func`
```c3
fn ulong Msws32Random.next_long(&self) @dynamic
```

---

#### `func`
```c3
fn ushort Msws32Random.next_short(&self) @dynamic
```

---

#### `func`
```c3
fn char Msws32Random.next_byte(&self) @dynamic
```

---

#### `func`
```c3
fn void  Msws16Random.set_seed(&self, char[] input) @dynamic
```

---

#### `func`
```c3
fn ushort Msws16Random.next_short(&self) @dynamic
```

---

#### `func`
```c3
<*
 @require bytes.len > 0
*>
fn void Msws16Random.next_bytes(&self, char[] bytes) @dynamic
```


---

#### `func`
```c3
fn uint128 Msws16Random.next_int128(&self) @dynamic
```

---

#### `func`
```c3
fn ulong Msws16Random.next_long(&self) @dynamic
```

---

#### `func`
```c3
fn uint Msws16Random.next_int(&self) @dynamic
```

---

#### `func`
```c3
fn char Msws16Random.next_byte(&self) @dynamic
```

---

#### `func`
```c3
fn void  Msws8Random.set_seed(&self, char[] input) @dynamic
```

---

#### `func`
```c3
fn char Msws8Random.next_byte(&self) @dynamic
```

---

#### `func`
```c3
fn void Msws8Random.next_bytes(&self, char[] bytes) @dynamic
```

---

#### `func`
```c3
fn uint128 Msws8Random.next_int128(&self) @dynamic
```

---

#### `func`
```c3
fn ulong Msws8Random.next_long(&self) @dynamic
```

---

#### `func`
```c3
fn uint Msws8Random.next_int(&self) @dynamic
```

---

#### `func`
```c3
fn ushort Msws8Random.next_short(&self) @dynamic
```

---

#### `Pcg`
```c3
typedef Pcg128Random (Random) = uint128
typedef Pcg64Random (Random) = ulong
typedef Pcg32Random (Random) = uint
typedef Pcg16Random (Random) = ushort
```

---

#### `func`
```c3
fn void  Pcg128Random.set_seed(&self, char[] input) @dynamic
```

---

#### `func`
```c3
fn ulong Pcg128Random.next_long(&self) @dynamic
```

---

#### `func`
```c3
<*
 @require bytes.len > 0
*>
fn void Pcg128Random.next_bytes(&self, char[] bytes) @dynamic
```


---

#### `func`
```c3
fn uint128 Pcg128Random.next_int128(&self) @dynamic
```

---

#### `func`
```c3
fn uint Pcg128Random.next_int(&self) @dynamic
```

---

#### `func`
```c3
fn ushort Pcg128Random.next_short(&self) @dynamic
```

---

#### `func`
```c3
fn char Pcg128Random.next_byte(&self) @dynamic
```

---

#### `func`
```c3
fn void Pcg64Random.set_seed(&self, char[] input) @dynamic
```

---

#### `func`
```c3
fn uint Pcg64Random.next_int(&self) @dynamic
```

---

#### `func`
```c3
<*
 @require bytes.len > 0
*>
fn void Pcg64Random.next_bytes(&self, char[] bytes) @dynamic
```


---

#### `func`
```c3
fn uint128 Pcg64Random.next_int128(&self) @dynamic
```

---

#### `func`
```c3
fn ulong Pcg64Random.next_long(&self) @dynamic
```

---

#### `func`
```c3
fn ushort Pcg64Random.next_short(&self) @dynamic
```

---

#### `func`
```c3
fn char Pcg64Random.next_byte(&self) @dynamic
```

---

#### `func`
```c3
fn void Pcg32Random.set_seed(&self, char[] input) @dynamic
```

---

#### `func`
```c3
fn ushort Pcg32Random.next_short(&self) @dynamic
```

---

#### `func`
```c3
<*
 @require bytes.len > 0
*>
fn void Pcg32Random.next_bytes(&self, char[] bytes) @dynamic
```


---

#### `func`
```c3
fn uint128 Pcg32Random.next_int128(&self) @dynamic
```

---

#### `func`
```c3
fn ulong Pcg32Random.next_long(&self) @dynamic
```

---

#### `func`
```c3
fn uint Pcg32Random.next_int(&self) @dynamic
```

---

#### `func`
```c3
fn char Pcg32Random.next_byte(&self) @dynamic
```

---

#### `func`
```c3
fn void Pcg16Random.set_seed(&self, char[] input) @dynamic
```

---

#### `func`
```c3
fn char Pcg16Random.next_byte(&self) @dynamic
```

---

#### `func`
```c3
fn void Pcg16Random.next_bytes(&self, char[] bytes) @dynamic
```

---

#### `func`
```c3
fn uint128 Pcg16Random.next_int128(&self) @dynamic
```

---

#### `func`
```c3
fn ulong Pcg16Random.next_long(&self) @dynamic
```

---

#### `func`
```c3
fn uint Pcg16Random.next_int(&self) @dynamic
```

---

#### `func`
```c3
fn ushort Pcg16Random.next_short(&self) @dynamic
```

---

#### `macro`
```c3
macro make_seed($Type, char[] input)
```

---

#### `func`
```c3
<*
 @param [in] input
 @param [inout] out_buffer
*>
fn void seeder(char[] input, char[] out_buffer)
```


---

#### `func`
```c3
fn char[8 * 4] entropy() @if(!env::WASM_NOLIBC)
```

---

#### `func`
```c3
fn char[8 * 4] entropy() @if(env::WASM_NOLIBC)
```

---

#### `Sfc`
```c3
typedef Sfc128Random (Random) = uint128[4]
typedef Sfc64Random (Random) = ulong[4]
typedef Sfc32Random (Random) = uint[4]
typedef Sfc16Random (Random) = ushort[4]
typedef Sfc8Random (Random) = char[4]
```

---

#### `func`
```c3
fn void Sfc128Random.set_seed(&self, char[] input) @dynamic
```

---

#### `func`
```c3
fn uint128 Sfc128Random.next_int128(&self) @dynamic
```

---

#### `func`
```c3
<*
 @require bytes.len > 0
*>
fn void Sfc128Random.next_bytes(&self, char[] bytes) @dynamic
```


---

#### `func`
```c3
fn ulong Sfc128Random.next_long(&self) @dynamic
```

---

#### `func`
```c3
fn uint Sfc128Random.next_int(&self) @dynamic
```

---

#### `func`
```c3
fn ushort Sfc128Random.next_short(&self) @dynamic
```

---

#### `func`
```c3
fn char Sfc128Random.next_byte(&self) @dynamic
```

---

#### `func`
```c3
fn void  Sfc64Random.set_seed(&self, char[] input) @dynamic
```

---

#### `func`
```c3
fn ulong Sfc64Random.next_long(&self) @dynamic
```

---

#### `func`
```c3
<*
 @require bytes.len > 0
*>
fn void Sfc64Random.next_bytes(&self, char[] bytes) @dynamic
```


---

#### `func`
```c3
fn uint128 Sfc64Random.next_int128(&self) @dynamic
```

---

#### `func`
```c3
fn uint Sfc64Random.next_int(&self) @dynamic
```

---

#### `func`
```c3
fn ushort Sfc64Random.next_short(&self) @dynamic
```

---

#### `func`
```c3
fn char Sfc64Random.next_byte(&self) @dynamic
```

---

#### `func`
```c3
fn void  Sfc32Random.set_seed(&self, char[] input) @dynamic
```

---

#### `func`
```c3
fn uint Sfc32Random.next_int(&sfc) @dynamic
```

---

#### `func`
```c3
<*
 @require bytes.len > 0
*>
fn void Sfc32Random.next_bytes(&self, char[] bytes) @dynamic
```


---

#### `func`
```c3
fn uint128 Sfc32Random.next_int128(&self) @dynamic
```

---

#### `func`
```c3
fn ulong Sfc32Random.next_long(&self) @dynamic
```

---

#### `func`
```c3
fn ushort Sfc32Random.next_short(&self) @dynamic
```

---

#### `func`
```c3
fn char Sfc32Random.next_byte(&self) @dynamic
```

---

#### `func`
```c3
fn void  Sfc16Random.set_seed(&self, char[] input) @dynamic
```

---

#### `func`
```c3
fn ushort Sfc16Random.next_short(&seed) @dynamic
```

---

#### `func`
```c3
<*
 @require bytes.len > 0
*>
fn void Sfc16Random.next_bytes(&self, char[] bytes) @dynamic
```


---

#### `func`
```c3
fn uint128 Sfc16Random.next_int128(&self) @dynamic
```

---

#### `func`
```c3
fn ulong Sfc16Random.next_long(&self) @dynamic
```

---

#### `func`
```c3
fn uint Sfc16Random.next_int(&self) @dynamic
```

---

#### `func`
```c3
fn char Sfc16Random.next_byte(&self) @dynamic
```

---

#### `func`
```c3
fn void  Sfc8Random.set_seed(&self, char[] input) @dynamic
```

---

#### `func`
```c3
fn char Sfc8Random.next_byte(&self) @dynamic
```

---

#### `func`
```c3
fn void Sfc8Random.next_bytes(&self, char[] bytes) @dynamic
```

---

#### `func`
```c3
fn uint128 Sfc8Random.next_int128(&self) @dynamic
```

---

#### `func`
```c3
fn ulong Sfc8Random.next_long(&self) @dynamic
```

---

#### `func`
```c3
fn uint Sfc8Random.next_int(&self) @dynamic
```

---

#### `func`
```c3
fn ushort Sfc8Random.next_short(&self) @dynamic
```

---

#### `SimpleRandom`
```c3
typedef SimpleRandom (Random) = ulong
```

---

#### `func`
```c3
fn void SimpleRandom.set_seed(&self, char[] seed) @dynamic
```

---

#### `func`
```c3
fn uint SimpleRandom.next_int(&self) @dynamic
```

---

#### `func`
```c3
<*
 @require bytes.len > 0
*>
fn void SimpleRandom.next_bytes(&self, char[] bytes) @dynamic
```


---

#### `func`
```c3
fn uint128 SimpleRandom.next_int128(&self) @dynamic
```

---

#### `func`
```c3
fn ulong SimpleRandom.next_long(&self) @dynamic
```

---

#### `func`
```c3
fn ushort SimpleRandom.next_short(&self) @dynamic
```

---

#### `func`
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

#### `func`
```c3
fn Uuid generate()
```

Generate a version 4 UUID from the default random.

---

#### `func`
```c3
fn Uuid generate_from_random(Random random)
```

Generate a version 4 UUID from the given random.

---

#### `func`
```c3
fn usz? Uuid.to_format(&self, Formatter* formatter) @dynamic
```

---

#### `func`
```c3
fn String Uuid.to_string(&self, Allocator allocator)
```
### `std::math::vector`

---

#### `macro`
```c3
macro double[<*>].sq_magnitude(self)
```

---

#### `macro`
```c3
macro float[<*>].sq_magnitude(self)
```

---

#### `macro`
```c3
macro double[<*>].distance_sq(self, double[<*>] v2)
```

---

#### `macro`
```c3
macro float[<*>].distance_sq(self, float[<*>] v2)
```

---

#### `macro`
```c3
macro float[<2>].transform(self, Matrix4f mat)
```

---

#### `macro`
```c3
macro float[<2>].rotate(self, float angle)
```

---

#### `macro`
```c3
macro float[<2>].angle(self, float[<2>] v2)
```

---

#### `macro`
```c3
macro double[<2>].transform(self, Matrix4 mat)
```

---

#### `macro`
```c3
macro double[<2>].rotate(self, double angle)
```

---

#### `macro`
```c3
macro double[<2>].angle(self, double[<2>] v2)
```

---

#### `macro`
```c3
macro float[<*>].clamp_mag(self, float min, float max)
```

---

#### `macro`
```c3
macro double[<*>].clamp_mag(self, double min, double max)
```

---

#### `macro`
```c3
macro float[<*>].towards(self, float[<*>] target, float max_distance)
```

---

#### `macro`
```c3
macro double[<*>].towards(self, double[<*>] target, double max_distance)
```

---

#### `func`
```c3
fn float[<3>] float[<3>].cross(self, float[<3>] v2)
```

---

#### `func`
```c3
fn double[<3>] double[<3>].cross(self, double[<3>] v2)
```

---

#### `func`
```c3
fn float[<3>] float[<3>].perpendicular(self)
```

---

#### `func`
```c3
fn double[<3>] double[<3>].perpendicular(self)
```

---

#### `func`
```c3
fn float[<3>] float[<3>].barycenter(self, float[<3>] a, float[<3>] b, float[<3>] c)
```

---

#### `func`
```c3
fn double[<3>] double[<3>].barycenter(self, double[<3>] a, double[<3>] b, double[<3>] c)
```

---

#### `func`
```c3
fn float[<3>] float[<3>].transform(self, Matrix4f mat)
```

---

#### `func`
```c3
fn double[<3>] double[<3>].transform(self, Matrix4 mat)
```

---

#### `func`
```c3
fn float float[<3>].angle(self, float[<3>] v2)
```

---

#### `func`
```c3
fn double double[<3>].angle(self, double[<3>] v2)
```

---

#### `func`
```c3
fn float[<3>] float[<3>].refract(self, float[<3>] n, float r)
```

---

#### `func`
```c3
fn double[<3>] double[<3>].refract(self, double[<3>] n, double r)
```

---

#### `func`
```c3
fn float[<3>] float[<3>].rotate_quat(self, Quaternionf q)
```

---

#### `func`
```c3
fn double[<3>] double[<3>].rotate_quat(self, Quaternion q)
```

---

#### `func`
```c3
fn float[<3>] float[<3>].rotate_axis(self, float[<3>] axis, float angle)
```

---

#### `func`
```c3
fn double[<3>] double[<3>].rotate_axis(self, double[<3>] axis, double angle)
```

---

#### `func`
```c3
fn float[<3>] float[<3>].unproject(self, Matrix4f projection, Matrix4f view)
```

---

#### `func`
```c3
fn double[<3>] double[<3>].unproject(self, Matrix4 projection, Matrix4 view)
```

---

#### `func`
```c3
fn void ortho_normalize(float[<3>]* v1, float[<3>]* v2)
```

---

#### `func`
```c3
fn void ortho_normalized(double[<3>]* v1, double[<3>]* v2)
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

#### `func`
```c3
fn usz? InetAddress.to_format(InetAddress* addr, Formatter* formatter) @dynamic
```

---

#### `func`
```c3
fn String InetAddress.to_string(&self, Allocator allocator)
```

---

#### `func`
```c3
fn String InetAddress.to_tstring(&self)
```

---

#### `func`
```c3
fn InetAddress? ipv6_from_str(String s)
```

---

#### `func`
```c3
fn InetAddress? ipv4_from_str(String s)
```

---

#### `func`
```c3
fn bool InetAddress.is_loopback(InetAddress* addr)
```

---

#### `func`
```c3
fn bool InetAddress.is_any_local(InetAddress* addr)
```

---

#### `func`
```c3
fn bool InetAddress.is_link_local(InetAddress* addr)
```

---

#### `func`
```c3
fn bool InetAddress.is_site_local(InetAddress* addr)
```

---

#### `func`
```c3
fn bool InetAddress.is_multicast(InetAddress* addr)
```

---

#### `func`
```c3
fn bool InetAddress.is_multicast_global(InetAddress* addr)
```

---

#### `func`
```c3
fn bool InetAddress.is_multicast_node_local(InetAddress* addr)
```

---

#### `func`
```c3
fn bool InetAddress.is_multicast_site_local(InetAddress* addr)
```

---

#### `func`
```c3
fn bool InetAddress.is_multicast_org_local(InetAddress* addr)
```

---

#### `func`
```c3
fn bool InetAddress.is_multicast_link_local(InetAddress* addr)
```

---

#### `func`
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

#### `func`
```c3
fn uint? ipv4toint(String s)
```

---

#### `func`
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

#### `macro`
```c3
macro void @loop_over_ai(AddrInfo* ai; @body(NativeSocket fd, AddrInfo* ai))
```

---

#### `POLL_FOREVER`
```c3
const Duration POLL_FOREVER
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
const PollSubscribes SUBSCRIBE_ANY_READ
```

---

#### `SUBSCRIBE_PRIO_READ`
```c3
const PollSubscribes SUBSCRIBE_PRIO_READ
```

---

#### `SUBSCRIBE_OOB_READ`
```c3
const PollSubscribes SUBSCRIBE_OOB_READ
```

---

#### `SUBSCRIBE_READ`
```c3
const PollSubscribes SUBSCRIBE_READ
```

---

#### `SUBSCRIBE_ANY_WRITE`
```c3
const PollSubscribes SUBSCRIBE_ANY_WRITE
```

---

#### `SUBSCRIBE_OOB_WRITE`
```c3
const PollSubscribes SUBSCRIBE_OOB_WRITE
```

---

#### `SUBSCRIBE_WRITE`
```c3
const PollSubscribes SUBSCRIBE_WRITE
```

---

#### `POLL_EVENT_READ_PRIO`
```c3
const PollEvents POLL_EVENT_READ_PRIO
```

---

#### `POLL_EVENT_READ_OOB`
```c3
const PollEvents POLL_EVENT_READ_OOB
```

---

#### `POLL_EVENT_READ`
```c3
const PollEvents POLL_EVENT_READ
```

---

#### `POLL_EVENT_WRITE_OOB`
```c3
const PollEvents POLL_EVENT_WRITE_OOB
```

---

#### `POLL_EVENT_WRITE`
```c3
const PollEvents POLL_EVENT_WRITE
```

---

#### `POLL_EVENT_DISCONNECT`
```c3
const PollEvents POLL_EVENT_DISCONNECT
```

---

#### `POLL_EVENT_ERROR`
```c3
const PollEvents POLL_EVENT_ERROR
```

---

#### `POLL_EVENT_INVALID`
```c3
const PollEvents POLL_EVENT_INVALID
```

---

#### `Poll`
```c3
struct Poll
```

---

#### `func`
```c3
<*
 @param [inout] polls
 @param timeout : "duration to poll (clamped to CInt.max ms), or POLL_FOREVER."
*>
fn ulong? poll(Poll[] polls, Duration timeout)
```


---

#### `func`
```c3
<*
 @param [inout] polls
 @param timeout_ms : "duration to poll in ms or -1. Clamped to CInt.max"
*>
fn ulong? poll_ms(Poll[] polls, long timeout_ms)
```


---

#### `macro`
```c3
macro Socket new_socket(fd, ai)
```

---

#### `SocketOption`
```c3
enum SocketOption : char (CInt value)
```

---

#### `func`
```c3
fn bool? Socket.get_broadcast(&self)
```

---

#### `func`
```c3
fn bool? Socket.get_keepalive(&self)
```

---

#### `func`
```c3
fn bool? Socket.get_reuseaddr(&self)
```

---

#### `func`
```c3
fn bool? Socket.get_dontroute(&self)
```

---

#### `func`
```c3
fn bool? Socket.get_oobinline(&self)
```

---

#### `func`
```c3
fn void? Socket.set_broadcast(&self, bool value)
```

---

#### `func`
```c3
fn void? Socket.set_keepalive(&self, bool value)
```

---

#### `func`
```c3
fn void? Socket.set_reuseaddr(&self, bool value)
```

---

#### `func`
```c3
fn void? Socket.set_dontroute(&self, bool value)
```

---

#### `func`
```c3
fn void? Socket.set_oobinline(&self, bool value)
```

---

#### `func`
```c3
fn void? Socket.set_option(&self, SocketOption option, bool value)
```

---

#### `func`
```c3
fn bool? Socket.get_option(&self, SocketOption option)
```

---

#### `func`
```c3
fn usz? Socket.read(&self, char[] bytes) @dynamic
```

---

#### `func`
```c3
fn char? Socket.read_byte(&self) @dynamic
```

---

#### `func`
```c3
fn usz? Socket.write(&self, char[] bytes) @dynamic
```

---

#### `func`
```c3
fn void? Socket.write_byte(&self, char byte) @dynamic
```

---

#### `func`
```c3
fn void? Socket.destroy(&self) @dynamic
```

---

#### `func`
```c3
fn void? Socket.close(&self) @inline @dynamic
```

---

#### `func`
```c3
fn usz? Socket.peek(&self, char[] bytes) @dynamic
```

---

#### `SocketShutdownHow`
```c3
enum SocketShutdownHow : (CInt native_value)
```

---

#### `func`
```c3
fn void? Socket.shutdown(&self, SocketShutdownHow how)
```

---

#### `func`
```c3
fn bool last_error_is_delayed_connect()
```
### `std::net::os`

---

#### `SUPPORTS_INET`
```c3
const bool SUPPORTS_INET
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
const PLATFORM_O_NONBLOCK @if(!$defined(PLATFORM_O_NONBLOCK))
```

---

#### `SOCK_STREAM`
```c3
const AISockType SOCK_STREAM
```

---

#### `SOCK_DGRAM`
```c3
const AISockType SOCK_DGRAM
```

---

#### `SOCK_RAW`
```c3
const AISockType SOCK_RAW
```

---

#### `SOCK_RDM`
```c3
const AISockType SOCK_RDM
```

---

#### `SOCK_SEQPACKET`
```c3
const AISockType SOCK_SEQPACKET
```

---

#### `AI_PASSIVE`
```c3
const AIFlags AI_PASSIVE
```

---

#### `AI_CANONNAME`
```c3
const AIFlags AI_CANONNAME
```

---

#### `AI_NUMERICHOST`
```c3
const AIFlags AI_NUMERICHOST
```

---

#### `AF_UNSPEC`
```c3
const AIFamily AF_UNSPEC
```

---

#### `AF_UNIX`
```c3
const AIFamily AF_UNIX
```

---

#### `AF_INET`
```c3
const AIFamily AF_INET
```

---

#### `AF_INET6`
```c3
const AIFamily AF_INET6
```

---

#### `AF_IPX`
```c3
const AIFamily AF_IPX
```

---

#### `AF_APPLETALK`
```c3
const AIFamily AF_APPLETALK
```

---

#### `O_NONBLOCK`
```c3
const O_NONBLOCK
```

---

#### `extern func`
```c3
extern fn CInt getaddrinfo(ZString nodename, ZString servname, AddrInfo* hints, AddrInfo** res) @if(SUPPORTS_INET)
```
### `std::net::os @if(env::ANDROID)`

---

#### `PLATFORM_AF_AX25`
```c3
const AIFamily PLATFORM_AF_AX25
```

---

#### `PLATFORM_AF_IPX`
```c3
const AIFamily PLATFORM_AF_IPX
```

---

#### `PLATFORM_AF_APPLETALK`
```c3
const AIFamily PLATFORM_AF_APPLETALK
```

---

#### `PLATFORM_AF_NETROM`
```c3
const AIFamily PLATFORM_AF_NETROM
```

---

#### `PLATFORM_AF_BRIDGE`
```c3
const AIFamily PLATFORM_AF_BRIDGE
```

---

#### `PLATFORM_AF_AAL5`
```c3
const AIFamily PLATFORM_AF_AAL5
```

---

#### `PLATFORM_AF_X25`
```c3
const AIFamily PLATFORM_AF_X25
```

---

#### `PLATFORM_AF_INET6`
```c3
const AIFamily PLATFORM_AF_INET6
```

---

#### `PLATFORM_O_NONBLOCK`
```c3
const PLATFORM_O_NONBLOCK
```

---

#### `SOL_SOCKET`
```c3
const int SOL_SOCKET
```

---

#### `SO_DEBUG`
```c3
const int SO_DEBUG
```

---

#### `SO_REUSEADDR`
```c3
const int SO_REUSEADDR
```

---

#### `SO_TYPE`
```c3
const int SO_TYPE
```

---

#### `SO_ERROR`
```c3
const int SO_ERROR
```

---

#### `SO_DONTROUTE`
```c3
const int SO_DONTROUTE
```

---

#### `SO_BROADCAST`
```c3
const int SO_BROADCAST
```

---

#### `SO_SNDBUF`
```c3
const int SO_SNDBUF
```

---

#### `SO_RCVBUF`
```c3
const int SO_RCVBUF
```

---

#### `SO_KEEPALIVE`
```c3
const int SO_KEEPALIVE
```

---

#### `SO_OOBINLINE`
```c3
const int SO_OOBINLINE
```

---

#### `SO_NO_CHECK`
```c3
const int SO_NO_CHECK
```

---

#### `SO_PRIORITY`
```c3
const int SO_PRIORITY
```

---

#### `SO_LINGER`
```c3
const int SO_LINGER
```

---

#### `SO_BSDCOMPAT`
```c3
const int SO_BSDCOMPAT
```

---

#### `SO_REUSEPORT`
```c3
const int SO_REUSEPORT
```

---

#### `SO_RCVLOWAT`
```c3
const int SO_RCVLOWAT
```

---

#### `SO_SNDLOWAT`
```c3
const int SO_SNDLOWAT
```

---

#### `SO_RCVTIMEO`
```c3
const int SO_RCVTIMEO
```

---

#### `SO_SNDTIMEO`
```c3
const int SO_SNDTIMEO
```

---

#### `SO_BINDTODEVICE`
```c3
const int SO_BINDTODEVICE
```

---

#### `SO_ATTACH_FILTER`
```c3
const int SO_ATTACH_FILTER
```

---

#### `SO_DETACH_FILTER`
```c3
const int SO_DETACH_FILTER
```

---

#### `SO_PEERNAME`
```c3
const int SO_PEERNAME
```

---

#### `SO_TIMESTAMP`
```c3
const int SO_TIMESTAMP
```

---

#### `SO_ACCEPTCONN`
```c3
const int SO_ACCEPTCONN
```

---

#### `SO_PEERSEC`
```c3
const int SO_PEERSEC
```

---

#### `SO_SNDBUFFORCE`
```c3
const int SO_SNDBUFFORCE
```

---

#### `SO_RCVBUFFORCE`
```c3
const int SO_RCVBUFFORCE
```

---

#### `SO_PASSSEC`
```c3
const int SO_PASSSEC
```

---

#### `SO_MARK`
```c3
const int SO_MARK
```

---

#### `SO_PROTOCOL`
```c3
const int SO_PROTOCOL
```

---

#### `SO_DOMAIN`
```c3
const int SO_DOMAIN
```

---

#### `SO_RXQ_OVFL`
```c3
const int SO_RXQ_OVFL
```

---

#### `SO_WIFI_STATUS`
```c3
const int SO_WIFI_STATUS
```

---

#### `SO_PEEK_OFF`
```c3
const int SO_PEEK_OFF
```

---

#### `SO_NOFCS`
```c3
const int SO_NOFCS
```

---

#### `SO_LOCK_FILTER`
```c3
const int SO_LOCK_FILTER
```

---

#### `SO_SELECT_ERR_QUEUE`
```c3
const int SO_SELECT_ERR_QUEUE
```

---

#### `SO_BUSY_POLL`
```c3
const int SO_BUSY_POLL
```

---

#### `SO_MAX_PACING_RATE`
```c3
const int SO_MAX_PACING_RATE
```

---

#### `SO_BPF_EXTENSIONS`
```c3
const int SO_BPF_EXTENSIONS
```

---

#### `SO_INCOMING_CPU`
```c3
const int SO_INCOMING_CPU
```

---

#### `SO_ATTACH_BPF`
```c3
const int SO_ATTACH_BPF
```

---

#### `SO_ATTACH_REUSEPORT_CBPF`
```c3
const int SO_ATTACH_REUSEPORT_CBPF
```

---

#### `SO_ATTACH_REUSEPORT_EBPF`
```c3
const int SO_ATTACH_REUSEPORT_EBPF
```

---

#### `SO_CNX_ADVICE`
```c3
const int SO_CNX_ADVICE
```

---

#### `SO_MEMINFO`
```c3
const int SO_MEMINFO
```

---

#### `SO_INCOMING_NAPI_ID`
```c3
const int SO_INCOMING_NAPI_ID
```

---

#### `SO_COOKIE`
```c3
const int SO_COOKIE
```

---

#### `SO_PEERGROUPS`
```c3
const int SO_PEERGROUPS
```

---

#### `SO_ZEROCOPY`
```c3
const int SO_ZEROCOPY
```

---

#### `SO_TXTIME`
```c3
const int SO_TXTIME
```

---

#### `SO_BINDTOIFINDEX`
```c3
const int SO_BINDTOIFINDEX
```

---

#### `SO_DETACH_REUSEPORT_BPF`
```c3
const int SO_DETACH_REUSEPORT_BPF
```

---

#### `SO_PREFER_BUSY_POLL`
```c3
const int SO_PREFER_BUSY_POLL
```

---

#### `SO_BUSY_POLL_BUDGET`
```c3
const int SO_BUSY_POLL_BUDGET
```

---

#### `SO_NETNS_COOKIE`
```c3
const int SO_NETNS_COOKIE
```

---

#### `SO_BUF_LOCK`
```c3
const int SO_BUF_LOCK
```

---

#### `SO_RESERVE_MEM`
```c3
const int SO_RESERVE_MEM
```

---

#### `SO_TXREHASH`
```c3
const int SO_TXREHASH
```

---

#### `SO_RCVMARK`
```c3
const int SO_RCVMARK
```

---

#### `SO_PASSPIDFD`
```c3
const int SO_PASSPIDFD
```

---

#### `SO_PEERPIDFD`
```c3
const int SO_PEERPIDFD
```

---

#### `POLLRDNORM`
```c3
const CUShort POLLRDNORM
```

---

#### `POLLRDBAND`
```c3
const CUShort POLLRDBAND
```

---

#### `POLLWRNORM`
```c3
const CUShort POLLWRNORM
```

---

#### `POLLWRBAND`
```c3
const CUShort POLLWRBAND
```

---

#### `POLLMSG`
```c3
const CUShort POLLMSG
```

---

#### `POLLREMOVE`
```c3
const CUShort POLLREMOVE
```

---

#### `POLLRDHUP`
```c3
const CUShort POLLRDHUP
```

---

#### `POLLFREE`
```c3
const CUShort POLLFREE
```

---

#### `POLL_BUSY_LOOP`
```c3
const CUShort POLL_BUSY_LOOP
```

---

#### `MSG_PEEK`
```c3
const CInt MSG_PEEK
```
### `std::net::os @if(env::DARWIN)`

---

#### `AI_NUMERICSERV`
```c3
const AIFlags AI_NUMERICSERV
```

---

#### `AI_ALL`
```c3
const AIFlags AI_ALL
```

---

#### `AI_V4MAPPED_CFG`
```c3
const AIFlags AI_V4MAPPED_CFG
```

---

#### `AI_ADDRCONFIG`
```c3
const AIFlags AI_ADDRCONFIG
```

---

#### `AI_V4MAPPED`
```c3
const AIFlags AI_V4MAPPED
```

---

#### `AI_UNUSABLE`
```c3
const AIFlags AI_UNUSABLE
```

---

#### `AI_DEFAULT`
```c3
const AIFlags AI_DEFAULT
```

---

#### `PLATFORM_AF_IMPLINK`
```c3
const AIFamily PLATFORM_AF_IMPLINK
```

---

#### `PLATFORM_AF_PUP`
```c3
const AIFamily PLATFORM_AF_PUP
```

---

#### `PLATFORM_AF_CHAOS`
```c3
const AIFamily PLATFORM_AF_CHAOS
```

---

#### `PLATFORM_AF_NS`
```c3
const AIFamily PLATFORM_AF_NS
```

---

#### `PLATFORM_AF_ISO`
```c3
const AIFamily PLATFORM_AF_ISO
```

---

#### `PLATFORM_AF_ECMA`
```c3
const AIFamily PLATFORM_AF_ECMA
```

---

#### `PLATFORM_AF_DATAKIT`
```c3
const AIFamily PLATFORM_AF_DATAKIT
```

---

#### `PLATFORM_AF_CCITT`
```c3
const AIFamily PLATFORM_AF_CCITT
```

---

#### `PLATFORM_AF_SNA`
```c3
const AIFamily PLATFORM_AF_SNA
```

---

#### `PLATFORM_AF_DECNET`
```c3
const AIFamily PLATFORM_AF_DECNET
```

---

#### `PLATFORM_AF_DLI`
```c3
const AIFamily PLATFORM_AF_DLI
```

---

#### `PLATFORM_AF_LAT`
```c3
const AIFamily PLATFORM_AF_LAT
```

---

#### `PLATFORM_AF_HYLINK`
```c3
const AIFamily PLATFORM_AF_HYLINK
```

---

#### `PLATFORM_AF_APPLETALK`
```c3
const AIFamily PLATFORM_AF_APPLETALK
```

---

#### `PLATFORM_AF_ROUTE`
```c3
const AIFamily PLATFORM_AF_ROUTE
```

---

#### `PLATFORM_AF_LINK`
```c3
const AIFamily PLATFORM_AF_LINK
```

---

#### `PLATFORM_PSEUDO_AF_XTP`
```c3
const AIFamily PLATFORM_PSEUDO_AF_XTP
```

---

#### `PLATFORM_AF_COIP`
```c3
const AIFamily PLATFORM_AF_COIP
```

---

#### `PLATFORM_AF_CNT`
```c3
const AIFamily PLATFORM_AF_CNT
```

---

#### `PLATFORM_PSEUDO_AF_RTIP`
```c3
const AIFamily PLATFORM_PSEUDO_AF_RTIP
```

---

#### `PLATFORM_AF_IPX`
```c3
const AIFamily PLATFORM_AF_IPX
```

---

#### `PLATFORM_AF_SIP`
```c3
const AIFamily PLATFORM_AF_SIP
```

---

#### `PLATFORM_PSEUDO_AF_PIP`
```c3
const AIFamily PLATFORM_PSEUDO_AF_PIP
```

---

#### `PLATFORM_AF_NDRV`
```c3
const AIFamily PLATFORM_AF_NDRV
```

---

#### `PLATFORM_AF_ISDN`
```c3
const AIFamily PLATFORM_AF_ISDN
```

---

#### `PLATFORM_PSEUDO_AF_KEY`
```c3
const AIFamily PLATFORM_PSEUDO_AF_KEY
```

---

#### `PLATFORM_AF_INET6`
```c3
const AIFamily PLATFORM_AF_INET6
```

---

#### `PLATFORM_AF_NATM`
```c3
const AIFamily PLATFORM_AF_NATM
```

---

#### `PLATFORM_AF_SYSTEM`
```c3
const AIFamily PLATFORM_AF_SYSTEM
```

---

#### `PLATFORM_AF_NETBIOS`
```c3
const AIFamily PLATFORM_AF_NETBIOS
```

---

#### `PLATFORM_AF_PPP`
```c3
const AIFamily PLATFORM_AF_PPP
```

---

#### `PLATFORM_PSEUDO_AF_HDRCMPLT`
```c3
const AIFamily PLATFORM_PSEUDO_AF_HDRCMPLT
```

---

#### `PLATFORM_AF_IEEE80211`
```c3
const AIFamily PLATFORM_AF_IEEE80211
```

---

#### `PLATFORM_AF_UTUN`
```c3
const AIFamily PLATFORM_AF_UTUN
```

---

#### `PLATFORM_AF_VSOCK`
```c3
const AIFamily PLATFORM_AF_VSOCK
```

---

#### `PLATFORM_AF_MAX`
```c3
const AIFamily PLATFORM_AF_MAX
```

---

#### `PLATFORM_O_NONBLOCK`
```c3
const int PLATFORM_O_NONBLOCK
```

---

#### `SOL_SOCKET`
```c3
const int SOL_SOCKET
```

---

#### `SO_DEBUG`
```c3
const int SO_DEBUG
```

---

#### `SO_ACCEPTCONN`
```c3
const int SO_ACCEPTCONN
```

---

#### `SO_REUSEADDR`
```c3
const int SO_REUSEADDR
```

---

#### `SO_KEEPALIVE`
```c3
const int SO_KEEPALIVE
```

---

#### `SO_DONTROUTE`
```c3
const int SO_DONTROUTE
```

---

#### `SO_BROADCAST`
```c3
const int SO_BROADCAST
```

---

#### `SO_USELOOPBACK`
```c3
const int SO_USELOOPBACK
```

---

#### `SO_LINGER`
```c3
const int SO_LINGER
```

---

#### `SO_OOBINLINE`
```c3
const int SO_OOBINLINE
```

---

#### `SO_REUSEPORT`
```c3
const int SO_REUSEPORT
```

---

#### `SO_TIMESTAMP`
```c3
const int SO_TIMESTAMP
```

---

#### `SO_TIMESTAMP_MONOTONIC`
```c3
const int SO_TIMESTAMP_MONOTONIC
```

---

#### `SO_DONTTRUNC`
```c3
const int SO_DONTTRUNC
```

---

#### `SO_WANTMORE`
```c3
const int SO_WANTMORE
```

---

#### `SO_WANTOOBFLAG`
```c3
const int SO_WANTOOBFLAG
```

---

#### `SO_SNDBUF`
```c3
const int SO_SNDBUF
```

---

#### `SO_RCVBUF`
```c3
const int SO_RCVBUF
```

---

#### `SO_SNDLOWAT`
```c3
const int SO_SNDLOWAT
```

---

#### `SO_RCVLOWAT`
```c3
const int SO_RCVLOWAT
```

---

#### `SO_SNDTIMEO`
```c3
const int SO_SNDTIMEO
```

---

#### `SO_RCVTIMEO`
```c3
const int SO_RCVTIMEO
```

---

#### `SO_ERROR`
```c3
const int SO_ERROR
```

---

#### `SO_TYPE`
```c3
const int SO_TYPE
```

---

#### `SO_LABEL`
```c3
const int SO_LABEL
```

---

#### `SO_PEERLABEL`
```c3
const int SO_PEERLABEL
```

---

#### `SO_NREAD`
```c3
const int SO_NREAD
```

---

#### `SO_NKE`
```c3
const int SO_NKE
```

---

#### `SO_NOSIGPIPE`
```c3
const int SO_NOSIGPIPE
```

---

#### `SO_NOADDRERR`
```c3
const int SO_NOADDRERR
```

---

#### `SO_NWRITE`
```c3
const int SO_NWRITE
```

---

#### `SO_REUSESHAREUID`
```c3
const int SO_REUSESHAREUID
```

---

#### `SO_LINGER_SEC`
```c3
const int SO_LINGER_SEC
```

---

#### `POLLRDNORM`
```c3
const CShort POLLRDNORM
```

---

#### `POLLRDBAND`
```c3
const CShort POLLRDBAND
```

---

#### `POLLWRNORM`
```c3
const CShort POLLWRNORM
```

---

#### `POLLWRBAND`
```c3
const CShort POLLWRBAND
```

---

#### `POLLEXTEND`
```c3
const CShort POLLEXTEND
```

---

#### `POLLATTRIB`
```c3
const CShort POLLATTRIB
```

---

#### `POLLNLINK`
```c3
const CShort POLLNLINK
```

---

#### `POLLWRITE`
```c3
const CShort POLLWRITE
```

---

#### `MSG_PEEK`
```c3
const CInt MSG_PEEK
```
### `std::net::os @if(env::LINUX)`

---

#### `PLATFORM_AF_AX25`
```c3
const AIFamily PLATFORM_AF_AX25
```

---

#### `PLATFORM_AF_IPX`
```c3
const AIFamily PLATFORM_AF_IPX
```

---

#### `PLATFORM_AF_APPLETALK`
```c3
const AIFamily PLATFORM_AF_APPLETALK
```

---

#### `PLATFORM_AF_NETROM`
```c3
const AIFamily PLATFORM_AF_NETROM
```

---

#### `PLATFORM_AF_BRIDGE`
```c3
const AIFamily PLATFORM_AF_BRIDGE
```

---

#### `PLATFORM_AF_AAL5`
```c3
const AIFamily PLATFORM_AF_AAL5
```

---

#### `PLATFORM_AF_X25`
```c3
const AIFamily PLATFORM_AF_X25
```

---

#### `PLATFORM_AF_INET6`
```c3
const AIFamily PLATFORM_AF_INET6
```

---

#### `PLATFORM_O_NONBLOCK`
```c3
const PLATFORM_O_NONBLOCK
```

---

#### `SOL_SOCKET`
```c3
const int SOL_SOCKET
```

---

#### `SO_DEBUG`
```c3
const int SO_DEBUG
```

---

#### `SO_REUSEADDR`
```c3
const int SO_REUSEADDR
```

---

#### `SO_TYPE`
```c3
const int SO_TYPE
```

---

#### `SO_ERROR`
```c3
const int SO_ERROR
```

---

#### `SO_DONTROUTE`
```c3
const int SO_DONTROUTE
```

---

#### `SO_BROADCAST`
```c3
const int SO_BROADCAST
```

---

#### `SO_SNDBUF`
```c3
const int SO_SNDBUF
```

---

#### `SO_RCVBUF`
```c3
const int SO_RCVBUF
```

---

#### `SO_KEEPALIVE`
```c3
const int SO_KEEPALIVE
```

---

#### `SO_OOBINLINE`
```c3
const int SO_OOBINLINE
```

---

#### `SO_NO_CHECK`
```c3
const int SO_NO_CHECK
```

---

#### `SO_PRIORITY`
```c3
const int SO_PRIORITY
```

---

#### `SO_LINGER`
```c3
const int SO_LINGER
```

---

#### `SO_BSDCOMPAT`
```c3
const int SO_BSDCOMPAT
```

---

#### `SO_REUSEPORT`
```c3
const int SO_REUSEPORT
```

---

#### `SO_RCVLOWAT`
```c3
const int SO_RCVLOWAT
```

---

#### `SO_SNDLOWAT`
```c3
const int SO_SNDLOWAT
```

---

#### `SO_RCVTIMEO`
```c3
const int SO_RCVTIMEO
```

---

#### `SO_SNDTIMEO`
```c3
const int SO_SNDTIMEO
```

---

#### `SO_BINDTODEVICE`
```c3
const int SO_BINDTODEVICE
```

---

#### `SO_ATTACH_FILTER`
```c3
const int SO_ATTACH_FILTER
```

---

#### `SO_DETACH_FILTER`
```c3
const int SO_DETACH_FILTER
```

---

#### `SO_PEERNAME`
```c3
const int SO_PEERNAME
```

---

#### `SO_TIMESTAMP`
```c3
const int SO_TIMESTAMP
```

---

#### `SO_ACCEPTCONN`
```c3
const int SO_ACCEPTCONN
```

---

#### `SO_PEERSEC`
```c3
const int SO_PEERSEC
```

---

#### `SO_SNDBUFFORCE`
```c3
const int SO_SNDBUFFORCE
```

---

#### `SO_RCVBUFFORCE`
```c3
const int SO_RCVBUFFORCE
```

---

#### `SO_PASSSEC`
```c3
const int SO_PASSSEC
```

---

#### `SO_MARK`
```c3
const int SO_MARK
```

---

#### `SO_PROTOCOL`
```c3
const int SO_PROTOCOL
```

---

#### `SO_DOMAIN`
```c3
const int SO_DOMAIN
```

---

#### `SO_RXQ_OVFL`
```c3
const int SO_RXQ_OVFL
```

---

#### `SO_WIFI_STATUS`
```c3
const int SO_WIFI_STATUS
```

---

#### `SO_PEEK_OFF`
```c3
const int SO_PEEK_OFF
```

---

#### `SO_NOFCS`
```c3
const int SO_NOFCS
```

---

#### `SO_LOCK_FILTER`
```c3
const int SO_LOCK_FILTER
```

---

#### `SO_SELECT_ERR_QUEUE`
```c3
const int SO_SELECT_ERR_QUEUE
```

---

#### `SO_BUSY_POLL`
```c3
const int SO_BUSY_POLL
```

---

#### `SO_MAX_PACING_RATE`
```c3
const int SO_MAX_PACING_RATE
```

---

#### `SO_BPF_EXTENSIONS`
```c3
const int SO_BPF_EXTENSIONS
```

---

#### `SO_INCOMING_CPU`
```c3
const int SO_INCOMING_CPU
```

---

#### `SO_ATTACH_BPF`
```c3
const int SO_ATTACH_BPF
```

---

#### `SO_ATTACH_REUSEPORT_CBPF`
```c3
const int SO_ATTACH_REUSEPORT_CBPF
```

---

#### `SO_ATTACH_REUSEPORT_EBPF`
```c3
const int SO_ATTACH_REUSEPORT_EBPF
```

---

#### `SO_CNX_ADVICE`
```c3
const int SO_CNX_ADVICE
```

---

#### `SO_MEMINFO`
```c3
const int SO_MEMINFO
```

---

#### `SO_INCOMING_NAPI_ID`
```c3
const int SO_INCOMING_NAPI_ID
```

---

#### `SO_COOKIE`
```c3
const int SO_COOKIE
```

---

#### `SO_PEERGROUPS`
```c3
const int SO_PEERGROUPS
```

---

#### `SO_ZEROCOPY`
```c3
const int SO_ZEROCOPY
```

---

#### `SO_TXTIME`
```c3
const int SO_TXTIME
```

---

#### `SO_BINDTOIFINDEX`
```c3
const int SO_BINDTOIFINDEX
```

---

#### `SO_DETACH_REUSEPORT_BPF`
```c3
const int SO_DETACH_REUSEPORT_BPF
```

---

#### `SO_PREFER_BUSY_POLL`
```c3
const int SO_PREFER_BUSY_POLL
```

---

#### `SO_BUSY_POLL_BUDGET`
```c3
const int SO_BUSY_POLL_BUDGET
```

---

#### `SO_NETNS_COOKIE`
```c3
const int SO_NETNS_COOKIE
```

---

#### `SO_BUF_LOCK`
```c3
const int SO_BUF_LOCK
```

---

#### `SO_RESERVE_MEM`
```c3
const int SO_RESERVE_MEM
```

---

#### `SO_TXREHASH`
```c3
const int SO_TXREHASH
```

---

#### `SO_RCVMARK`
```c3
const int SO_RCVMARK
```

---

#### `SO_PASSPIDFD`
```c3
const int SO_PASSPIDFD
```

---

#### `SO_PEERPIDFD`
```c3
const int SO_PEERPIDFD
```

---

#### `POLLRDNORM`
```c3
const CUShort POLLRDNORM
```

---

#### `POLLRDBAND`
```c3
const CUShort POLLRDBAND
```

---

#### `POLLWRNORM`
```c3
const CUShort POLLWRNORM
```

---

#### `POLLWRBAND`
```c3
const CUShort POLLWRBAND
```

---

#### `POLLMSG`
```c3
const CUShort POLLMSG
```

---

#### `POLLREMOVE`
```c3
const CUShort POLLREMOVE
```

---

#### `POLLRDHUP`
```c3
const CUShort POLLRDHUP
```

---

#### `POLLFREE`
```c3
const CUShort POLLFREE
```

---

#### `POLL_BUSY_LOOP`
```c3
const CUShort POLL_BUSY_LOOP
```

---

#### `MSG_PEEK`
```c3
const CInt MSG_PEEK
```
### `std::net::os @if(env::OPENBSD)`

---

#### `AI_EXT`
```c3
const AIFlags AI_EXT
```

---

#### `AI_NUMERICSERV`
```c3
const AIFlags AI_NUMERICSERV
```

---

#### `AI_FQDN`
```c3
const AIFlags AI_FQDN
```

---

#### `AI_ADDRCONFIG`
```c3
const AIFlags AI_ADDRCONFIG
```

---

#### `PLATFORM_AF_LOCAL`
```c3
const AIFamily PLATFORM_AF_LOCAL
```

---

#### `PLATFORM_AF_IMPLINK`
```c3
const AIFamily PLATFORM_AF_IMPLINK
```

---

#### `PLATFORM_AF_PUP`
```c3
const AIFamily PLATFORM_AF_PUP
```

---

#### `PLATFORM_AF_CHAOS`
```c3
const AIFamily PLATFORM_AF_CHAOS
```

---

#### `PLATFORM_AF_NS`
```c3
const AIFamily PLATFORM_AF_NS
```

---

#### `PLATFORM_AF_ISO`
```c3
const AIFamily PLATFORM_AF_ISO
```

---

#### `PLATFORM_AF_OSI`
```c3
const AIFamily PLATFORM_AF_OSI
```

---

#### `PLATFORM_AF_ECMA`
```c3
const AIFamily PLATFORM_AF_ECMA
```

---

#### `PLATFORM_AF_DATAKIT`
```c3
const AIFamily PLATFORM_AF_DATAKIT
```

---

#### `PLATFORM_AF_CCITT`
```c3
const AIFamily PLATFORM_AF_CCITT
```

---

#### `PLATFORM_AF_SNA`
```c3
const AIFamily PLATFORM_AF_SNA
```

---

#### `PLATFORM_AF_DECNET`
```c3
const AIFamily PLATFORM_AF_DECNET
```

---

#### `PLATFORM_AF_DLI`
```c3
const AIFamily PLATFORM_AF_DLI
```

---

#### `PLATFORM_AF_LAT`
```c3
const AIFamily PLATFORM_AF_LAT
```

---

#### `PLATFORM_AF_HYLINK`
```c3
const AIFamily PLATFORM_AF_HYLINK
```

---

#### `PLATFORM_AF_APPLETALK`
```c3
const AIFamily PLATFORM_AF_APPLETALK
```

---

#### `PLATFORM_AF_ROUTE`
```c3
const AIFamily PLATFORM_AF_ROUTE
```

---

#### `PLATFORM_AF_LINK`
```c3
const AIFamily PLATFORM_AF_LINK
```

---

#### `PLATFORM_PSEUDO_AF_XTP`
```c3
const AIFamily PLATFORM_PSEUDO_AF_XTP
```

---

#### `PLATFORM_AF_COIP`
```c3
const AIFamily PLATFORM_AF_COIP
```

---

#### `PLATFORM_AF_CNT`
```c3
const AIFamily PLATFORM_AF_CNT
```

---

#### `PLATFORM_PSEUDO_AF_RTIP`
```c3
const AIFamily PLATFORM_PSEUDO_AF_RTIP
```

---

#### `PLATFORM_AF_IPX`
```c3
const AIFamily PLATFORM_AF_IPX
```

---

#### `PLATFORM_AF_INET6`
```c3
const AIFamily PLATFORM_AF_INET6
```

---

#### `PLATFORM_PSEUDO_AF_PIP`
```c3
const AIFamily PLATFORM_PSEUDO_AF_PIP
```

---

#### `PLATFORM_AF_ISDN`
```c3
const AIFamily PLATFORM_AF_ISDN
```

---

#### `PLATFORM_AF_E164`
```c3
const AIFamily PLATFORM_AF_E164
```

---

#### `PLATFORM_AF_NATM`
```c3
const AIFamily PLATFORM_AF_NATM
```

---

#### `PLATFORM_AF_ENCAP`
```c3
const AIFamily PLATFORM_AF_ENCAP
```

---

#### `PLATFORM_AF_SIP`
```c3
const AIFamily PLATFORM_AF_SIP
```

---

#### `PLATFORM_AF_KEY`
```c3
const AIFamily PLATFORM_AF_KEY
```

---

#### `PLATFORM_PSEUDO_AF_HDRCMPLT`
```c3
const AIFamily PLATFORM_PSEUDO_AF_HDRCMPLT
```

---

#### `PLATFORM_AF_BLUETOOTH`
```c3
const AIFamily PLATFORM_AF_BLUETOOTH
```

---

#### `PLATFORM_AF_MPLS`
```c3
const AIFamily PLATFORM_AF_MPLS
```

---

#### `PLATFORM_PSEUDO_AF_PFLOW`
```c3
const AIFamily PLATFORM_PSEUDO_AF_PFLOW
```

---

#### `PLATFORM_PSEUDO_AF_PIPEX`
```c3
const AIFamily PLATFORM_PSEUDO_AF_PIPEX
```

---

#### `PLATFORM_AF_FRAME`
```c3
const AIFamily PLATFORM_AF_FRAME
```

---

#### `PLATFORM_AF_MAX`
```c3
const AIFamily PLATFORM_AF_MAX
```

---

#### `SOL_SOCKET`
```c3
const int SOL_SOCKET
```

---

#### `SO_DEBUG`
```c3
const int SO_DEBUG
```

---

#### `SO_ACCEPTCONN`
```c3
const int SO_ACCEPTCONN
```

---

#### `SO_REUSEADDR`
```c3
const int SO_REUSEADDR
```

---

#### `SO_KEEPALIVE`
```c3
const int SO_KEEPALIVE
```

---

#### `SO_DONTROUTE`
```c3
const int SO_DONTROUTE
```

---

#### `SO_BROADCAST`
```c3
const int SO_BROADCAST
```

---

#### `SO_USELOOPBACK`
```c3
const int SO_USELOOPBACK
```

---

#### `SO_LINGER`
```c3
const int SO_LINGER
```

---

#### `SO_OOBINLINE`
```c3
const int SO_OOBINLINE
```

---

#### `SO_REUSEPORT`
```c3
const int SO_REUSEPORT
```

---

#### `SO_TIMESTAMP`
```c3
const int SO_TIMESTAMP
```

---

#### `SO_BINDANY`
```c3
const int SO_BINDANY
```

---

#### `SO_ZEROIZE`
```c3
const int SO_ZEROIZE
```

---

#### `SO_SNDBUF`
```c3
const int SO_SNDBUF
```

---

#### `SO_RCVBUF`
```c3
const int SO_RCVBUF
```

---

#### `SO_SNDLOWAT`
```c3
const int SO_SNDLOWAT
```

---

#### `SO_RCVLOWAT`
```c3
const int SO_RCVLOWAT
```

---

#### `SO_SNDTIMEO`
```c3
const int SO_SNDTIMEO
```

---

#### `SO_RCVTIMEO`
```c3
const int SO_RCVTIMEO
```

---

#### `SO_ERROR`
```c3
const int SO_ERROR
```

---

#### `SO_TYPE`
```c3
const int SO_TYPE
```

---

#### `SO_NETPROC`
```c3
const int SO_NETPROC
```

---

#### `SO_RTABLE`
```c3
const int SO_RTABLE
```

---

#### `SO_PEERCRED`
```c3
const int SO_PEERCRED
```

---

#### `SO_SPLICE`
```c3
const int SO_SPLICE
```

---

#### `SO_DOMAIN`
```c3
const int SO_DOMAIN
```

---

#### `SO_PROTOCOL`
```c3
const int SO_PROTOCOL
```

---

#### `POLLRDNORM`
```c3
const CUShort POLLRDNORM
```

---

#### `POLLNORM`
```c3
const CUShort POLLNORM
```

---

#### `POLLWRNORM`
```c3
const CUShort POLLWRNORM
```

---

#### `POLLRDBAND`
```c3
const CUShort POLLRDBAND
```

---

#### `POLLWRBAND`
```c3
const CUShort POLLWRBAND
```

---

#### `MSG_OOB`
```c3
const CInt MSG_OOB
```

---

#### `MSG_PEEK`
```c3
const CInt MSG_PEEK
```

---

#### `MSG_DONTROUTE`
```c3
const CInt MSG_DONTROUTE
```

---

#### `MSG_EOR`
```c3
const CInt MSG_EOR
```

---

#### `MSG_TRUNC`
```c3
const CInt MSG_TRUNC
```

---

#### `MSG_CTRUNC`
```c3
const CInt MSG_CTRUNC
```

---

#### `MSG_WAITALL`
```c3
const CInt MSG_WAITALL
```

---

#### `MSG_DONTWAIT`
```c3
const CInt MSG_DONTWAIT
```

---

#### `MSG_BCAST`
```c3
const CInt MSG_BCAST
```

---

#### `MSG_MCAST`
```c3
const CInt MSG_MCAST
```

---

#### `MSG_NOSIGNAL`
```c3
const CInt MSG_NOSIGNAL
```

---

#### `MSG_CMSG_CLOEXEC`
```c3
const CInt MSG_CMSG_CLOEXEC
```

---

#### `MSG_WAITFORONE`
```c3
const CInt MSG_WAITFORONE
```

---

#### `SOCK_CLOEXEC`
```c3
const SOCK_CLOEXEC
```

---

#### `SOCK_NONBLOCK`
```c3
const SOCK_NONBLOCK
```

---

#### `SOCK_NONBLOCK_INHERIT`
```c3
const SOCK_NONBLOCK_INHERIT
```

---

#### `SOCK_DNS`
```c3
const SOCK_DNS
```

---

#### `PLATFORM_O_NONBLOCK`
```c3
const PLATFORM_O_NONBLOCK
```
### `std::net::os @if(env::POSIX && SUPPORTS_INET)`

---

#### `F_GETFL`
```c3
const int F_GETFL
```

---

#### `F_SETFL`
```c3
const int F_SETFL
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

#### `extern func`
```c3
extern fn CInt connect(NativeSocket socket, SockAddrPtr address, Socklen_t address_len)
```

---

#### `func`
```c3
fn fault socket_error()
```

---

#### `macro`
```c3
macro bool NativeSocket.is_valid(self)
```

---

#### `macro`
```c3
macro void? NativeSocket.close(self)
```

---

#### `macro`
```c3
macro void? NativeSocket.set_non_blocking(self, bool non_blocking)
```

---

#### `macro`
```c3
macro bool NativeSocket.is_non_blocking(self)
```
### `std::net::os @if(env::WIN32)`

---

#### `PLATFORM_AF_IPX`
```c3
const AIFamily PLATFORM_AF_IPX
```

---

#### `PLATFORM_AF_APPLETALK`
```c3
const AIFamily PLATFORM_AF_APPLETALK
```

---

#### `PLATFORM_AF_NETBIOS`
```c3
const AIFamily PLATFORM_AF_NETBIOS
```

---

#### `PLATFORM_AF_INET6`
```c3
const AIFamily PLATFORM_AF_INET6
```

---

#### `PLATFORM_AF_IRDA`
```c3
const AIFamily PLATFORM_AF_IRDA
```

---

#### `PLATFORM_AF_BTH`
```c3
const AIFamily PLATFORM_AF_BTH
```

---

#### `FIONREAD`
```c3
const int FIONREAD
```

---

#### `FIONBIO`
```c3
const int FIONBIO
```

---

#### `FIOASYNC`
```c3
const int FIOASYNC
```

---

#### `NativeSocket`
```c3
typedef NativeSocket = inline Win32_SOCKET
```

---

#### `extern func`
```c3
extern fn CInt ioctlsocket(NativeSocket, CLong cmd, CULong *argp)
```

---

#### `func`
```c3
fn void? NativeSocket.set_non_blocking(self, bool non_blocking)
```

---

#### `macro`
```c3
macro void? NativeSocket.close(self)
```

---

#### `SOL_SOCKET`
```c3
const int SOL_SOCKET
```

---

#### `SO_DEBUG`
```c3
const int SO_DEBUG
```

---

#### `SO_ACCEPTCONN`
```c3
const int SO_ACCEPTCONN
```

---

#### `SO_REUSEADDR`
```c3
const int SO_REUSEADDR
```

---

#### `SO_KEEPALIVE`
```c3
const int SO_KEEPALIVE
```

---

#### `SO_DONTROUTE`
```c3
const int SO_DONTROUTE
```

---

#### `SO_BROADCAST`
```c3
const int SO_BROADCAST
```

---

#### `SO_USELOOPBACK`
```c3
const int SO_USELOOPBACK
```

---

#### `SO_LINGER`
```c3
const int SO_LINGER
```

---

#### `SO_OOBINLINE`
```c3
const int SO_OOBINLINE
```

---

#### `SO_SNDBUF`
```c3
const int SO_SNDBUF
```

---

#### `SO_RCVBUF`
```c3
const int SO_RCVBUF
```

---

#### `SO_SNDLOWAT`
```c3
const int SO_SNDLOWAT
```

---

#### `SO_RCVLOWAT`
```c3
const int SO_RCVLOWAT
```

---

#### `SO_SNDTIMEO`
```c3
const int SO_SNDTIMEO
```

---

#### `SO_RCVTIMEO`
```c3
const int SO_RCVTIMEO
```

---

#### `SO_ERROR`
```c3
const int SO_ERROR
```

---

#### `SO_TYPE`
```c3
const int SO_TYPE
```

---

#### `func`
```c3
fn fault convert_error(WSAError error)
```

---

#### `func`
```c3
fn fault socket_error()
```

---

#### `POLLIN`
```c3
const CUShort POLLIN
```

---

#### `POLLPRI`
```c3
const CUShort POLLPRI
```

---

#### `POLLOUT`
```c3
const CUShort POLLOUT
```

---

#### `POLLERR`
```c3
const CUShort POLLERR
```

---

#### `POLLHUP`
```c3
const CUShort POLLHUP
```

---

#### `POLLNVAL`
```c3
const CUShort POLLNVAL
```

---

#### `POLLRDNORM`
```c3
const CUShort POLLRDNORM
```

---

#### `POLLRDBAND`
```c3
const CUShort POLLRDBAND
```

---

#### `POLLWRNORM`
```c3
const CUShort POLLWRNORM
```

---

#### `POLLWRBAND`
```c3
const CUShort POLLWRBAND
```

---

#### `MSG_PEEK`
```c3
const int MSG_PEEK
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

#### `func`
```c3
fn TcpSocket? connect(String host, uint port, Duration timeout = time::DURATION_ZERO, SocketOption... options, IpProtocol ip_protocol = UNSPECIFIED)
```

---

#### `func`
```c3
fn TcpSocket? connect_async(String host, uint port, SocketOption... options, IpProtocol ip_protocol = UNSPECIFIED)
```

---

#### `func`
```c3
fn TcpSocket? connect_to(AddrInfo* ai, SocketOption... options)
```

---

#### `func`
```c3
fn TcpSocket? connect_async_to(AddrInfo* ai, SocketOption... options)
```

---

#### `func`
```c3
fn TcpServerSocket? listen(String host, uint port, uint backlog, SocketOption... options, IpProtocol ip_protocol = UNSPECIFIED)
```

---

#### `func`
```c3
fn TcpSocket? accept(TcpServerSocket* server_socket)
```

---

#### `func`
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

#### `func`
```c3
fn UdpSocket? connect(String host, uint port, SocketOption... options, IpProtocol ip_protocol = UNSPECIFIED)
```

---

#### `func`
```c3
fn UdpSocket? connect_to(AddrInfo* ai, SocketOption... options)
```

---

#### `func`
```c3
fn UdpSocket? connect_async(String host, uint port, SocketOption... options, IpProtocol ip_protocol = UNSPECIFIED)
```

---

#### `func`
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

#### `func`
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

#### `func`
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

#### `func`
```c3
fn usz? Url.to_format(&self, Formatter* f) @dynamic
```

---

#### `func`
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

#### `func`
```c3
<*
 @param [in] query
 @return "a UrlQueryValues HashMap"
*>
fn UrlQueryValues parse_query_to_temp(String query)
```


Parse the query parameters of the Url into a UrlQueryValues map.

---

#### `func`
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

#### `func`
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

#### `func`
```c3
fn usz? UrlQueryValues.to_format(&self, Formatter* f) @dynamic
```

---

#### `func`
```c3
fn void UrlQueryValues.free(&self)
```

---

#### `func`
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

#### `func`
```c3
fn usz encode_len(String s, UrlEncodingMode mode) @inline
```

Calculate the length of the percent-encoded string.

---

#### `func`
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

#### `func`
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

#### `func`
```c3
<*
 @return? INVALID_HEX
*>
fn usz? decode_len(String s, UrlEncodingMode mode) @inline
```


Calculate the length of the percent-decoded string.

---

#### `func`
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

#### `func`
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

#### `func`
```c3
fn void exit(int result) @weak @noreturn
```

Exit the process with a given exit code. This will typically call 'exit' in LibC

---

#### `func`
```c3
fn void fastexit(int result) @weak @noreturn
```

Exit the process with a given exit code. This will typically call '_Exit' in LibC
usually bypassing '@finalizer' functions.
### `std::os @if(env::DARWIN)`

---

#### `func`
```c3
fn uint num_cpu()
```
### `std::os @if(env::LINUX)`

---

#### `func`
```c3
fn uint num_cpu()
```
### `std::os @if(env::WIN32)`

---

#### `func`
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

#### `extern func`
```c3
extern fn CInt log_write(LogPriority prio, ZString tag, ZString text) @extern("__android_log_write")
```

---

#### `extern func`
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
const Backtrace BACKTRACE_UNKNOWN
```

---

#### `Backtrace`
```c3
struct Backtrace (Printable)
```

---

#### `func`
```c3
fn bool Backtrace.has_file(&self)
```

---

#### `func`
```c3
fn bool Backtrace.is_unknown(&self)
```

---

#### `func`
```c3
fn usz? Backtrace.to_format(&self, Formatter* formatter) @dynamic
```

---

#### `func`
```c3
fn void Backtrace.free(&self)
```

---

#### `func`
```c3
fn Backtrace* Backtrace.init(&self, Allocator allocator, uptr offset, String function, String object_file, String file = "", uint line = 0)
```

---

#### `func`
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
alias symbolize_backtrace @if(env::WIN32)  	= win32::symbolize_backtrace
alias symbolize_backtrace @if(env::DARWIN) 	= darwin::symbolize_backtrace
alias symbolize_backtrace @if(env::OPENBSD)	= openbsd::symbolize_backtrace
```

---

#### `func`
```c3
fn BacktraceList? symbolize_backtrace(Allocator allocator, void*[] backtrace) @if(!env::NATIVE_STACKTRACE)
```
### `std::os::darwin @if(env::DARWIN)`

---

#### `CTL_UNSPEC`
```c3
const CTL_UNSPEC
```

---

#### `CTL_KERN`
```c3
const CTL_KERN
```

---

#### `CTL_VM`
```c3
const CTL_VM
```

---

#### `CTL_VFS`
```c3
const CTL_VFS
```

---

#### `CTL_NET`
```c3
const CTL_NET
```

---

#### `CTL_DEBUG`
```c3
const CTL_DEBUG
```

---

#### `CTL_HW`
```c3
const CTL_HW
```

---

#### `CTL_MACHDEP`
```c3
const CTL_MACHDEP
```

---

#### `CTL_USER`
```c3
const CTL_USER
```

---

#### `CTL_MAXID`
```c3
const CTL_MAXID
```

---

#### `HW_MACHINE`
```c3
const HW_MACHINE
```

---

#### `HW_MODEL`
```c3
const HW_MODEL
```

---

#### `HW_NCPU`
```c3
const HW_NCPU
```

---

#### `HW_BYTEORDER`
```c3
const HW_BYTEORDER
```

---

#### `HW_PHYSMEM`
```c3
const HW_PHYSMEM
```

---

#### `HW_USERMEM`
```c3
const HW_USERMEM
```

---

#### `HW_PAGESIZE`
```c3
const HW_PAGESIZE
```

---

#### `HW_DISKNAMES`
```c3
const HW_DISKNAMES
```

---

#### `HW_DISKSTATS`
```c3
const HW_DISKSTATS
```

---

#### `HW_EPOCH`
```c3
const HW_EPOCH
```

---

#### `HW_FLOATINGPT`
```c3
const HW_FLOATINGPT
```

---

#### `HW_MACHINE_ARCH`
```c3
const HW_MACHINE_ARCH
```

---

#### `HW_VECTORUNIT`
```c3
const HW_VECTORUNIT
```

---

#### `HW_BUS_FREQ`
```c3
const HW_BUS_FREQ
```

---

#### `HW_CPU_FREQ`
```c3
const HW_CPU_FREQ
```

---

#### `HW_CACHELINE`
```c3
const HW_CACHELINE
```

---

#### `HW_L1ICACHESIZE`
```c3
const HW_L1ICACHESIZE
```

---

#### `HW_L1DCACHESIZE`
```c3
const HW_L1DCACHESIZE
```

---

#### `HW_L2SETTINGS`
```c3
const HW_L2SETTINGS
```

---

#### `HW_L2CACHESIZE`
```c3
const HW_L2CACHESIZE
```

---

#### `HW_L3SETTINGS`
```c3
const HW_L3SETTINGS
```

---

#### `HW_L3CACHESIZE`
```c3
const HW_L3CACHESIZE
```

---

#### `HW_MAXID`
```c3
const HW_MAXID
```

---

#### `extern func`
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

#### `extern func`
```c3
extern fn void mach_timebase_info(Darwin_mach_timebase_info_data_t* timebase)
```

---

#### `func`
```c3
fn BacktraceList? symbolize_backtrace(Allocator allocator, void*[] backtrace)
```

---

#### `extern func`
```c3
extern fn usz malloc_size(void* ptr)
```
### `std::os::darwin::cocoa @if(env::OS_TYPE == MACOS) @link("Cocoa.framework")`

---

#### `extern func`
```c3
extern fn int nsApplicationMain(int argc, char **argv) @extern("NSApplicationMain")
```
### `std::os::env`

---

#### `func`
```c3
<*
 @param [in] name
 @require name.len > 0
 @return? NOT_FOUND
*>
fn String? get_var(Allocator allocator, String name)
```


---

#### `func`
```c3
fn String? tget_var(String name)
```

---

#### `func`
```c3
<*
 @param [in] name
 @param [in] value
 @require name.len > 0
*>
fn bool set_var(String name, String value, bool overwrite = true)
```


---

#### `func`
```c3
fn String? get_home_dir(Allocator allocator)
```

Returns the current user's home directory.

---

#### `func`
```c3
fn Path? get_config_dir(Allocator allocator)
```

Returns the current user's config directory.

---

#### `func`
```c3
<*
 @param [in] name
 @require name.len > 0
*>
fn bool clear_var(String name)
```


---

#### `func`
```c3
fn String? executable_path()
```
### `std::os::freebsd @if(env::FREEBSD)`
### `std::os::linux @if(env::LINUX)`

---

#### `extern func`
```c3
extern fn usz malloc_usable_size(void* ptr)
```

---

#### `extern func`
```c3
extern fn isz readlink(ZString path, char* buf, usz bufsize)
```

---

#### `Elf`
```c3
struct Elf32_Phdr
alias Elf64_Addr = ulong
alias Elf64_Half = ushort
alias Elf64_Off = ulong
alias Elf64_Word = uint
alias Elf64_Sword = int
alias Elf64_Sxword = long
alias Elf64_Lword = ulong
alias Elf64_Xword = ulong
struct Elf64_Ehdr

struct Elf64_Phdr

```

---

#### `extern func`
```c3
extern fn CInt dladdr(void* addr, Linux_Dl_info* info)
```

---

#### `Dl_iterate_phdr_callback`
```c3
alias Dl_iterate_phdr_callback64 = fn CInt(Linux_dl_phdr_info_64*, usz, void*)
alias Dl_iterate_phdr_callback32 = fn CInt(Linux_dl_phdr_info_32*, usz, void*)
```

---

#### `extern func`
```c3
extern fn CInt dl_iterate_phdr64(Dl_iterate_phdr_callback64 callback, void* data)
```

---

#### `Linux_dl_phdr_info_`
```c3
struct Linux_dl_phdr_info_32
```

---

#### `func`
```c3
fn Backtrace? backtrace_line_parse(Allocator allocator, String string, String obj_name, String func_name, bool is_inlined)
```

---

#### `func`
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

#### `macro`
```c3
macro CFAllocatorRef default_allocator()
```

---

#### `macro`
```c3
macro void CFAllocatorRef.dealloc(CFAllocatorRef allocator, void* ptr)
```

---

#### `macro`
```c3
macro void* CFAllocatorRef.alloc(CFAllocatorRef allocator, usz size)
```

---

#### `macro`
```c3
macro usz CFAllocatorRef.get_preferred_size(CFAllocatorRef allocator, usz req_size)
```

---

#### `macro`
```c3
macro void CFAllocatorRef.set_default(CFAllocatorRef allocator)
```

---

#### `extern func`
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

#### `extern func`
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

#### `extern func`
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

#### `macro`
```c3
macro ZString ObjcClass.name(ObjcClass cls)
```

---

#### `macro`
```c3
macro ObjcClass ObjcClass.superclass(ObjcClass cls)
```

---

#### `macro`
```c3
macro bool ObjcClass.responds_to(ObjcClass cls, ObjcSelector sel)
```

---

#### `macro`
```c3
macro ObjcMethod ObjcClass.method(ObjcClass cls, ObjcSelector name)
```

---

#### `macro`
```c3
macro bool ObjcSelector.equals(ObjcSelector a, ObjcSelector b)
```

---

#### `macro`
```c3
macro bool ObjcClass.equals(ObjcClass a, ObjcClass b)
```

---

#### `func`
```c3
fn ObjcId alloc(ObjcClass cls)
```

---

#### `func`
```c3
fn void release(ObjcId id)
```

---

#### `macro`
```c3
macro ObjcClass? class_by_name(ZString c)
```

---

#### `macro`
```c3
macro ObjcClass[] class_get_list(Allocator allocator)
```

---

#### `extern func`
```c3
extern fn void msgSend(...) @extern("objc_msgSend") @builtin
```

---

#### `extern func`
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

#### `func`
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

#### `extern func`
```c3
extern fn ZString* backtrace_symbols_fmt(void **addrlist, usz len, ZString fmt)
```

---

#### `func`
```c3
fn BacktraceList? symbolize_backtrace(Allocator allocator, void*[] backtrace)
```
### `std::os::posix @if(env::POSIX)`

---

#### `extern func`
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

#### `extern func`
```c3
extern fn int rmdir(ZString)
```

---

#### `extern func`
```c3
extern fn CLong sysconf(CInt name)
```

---

#### `extern func`
```c3
extern fn CInt posix_memalign(void **memptr, usz alignment, usz size)
```

---

#### `PROT_NONE`
```c3
const PROT_NONE
```

---

#### `PROT_READ`
```c3
const PROT_READ
```

---

#### `PROT_WRITE`
```c3
const PROT_WRITE
```

---

#### `PROT_EXEC`
```c3
const PROT_EXEC
```

---

#### `MAP_SHARED`
```c3
const MAP_SHARED
```

---

#### `MAP_PRIVATE`
```c3
const MAP_PRIVATE
```

---

#### `MAP_FILE`
```c3
const MAP_FILE
```

---

#### `MAP_ANONYMOUS`
```c3
const MAP_ANONYMOUS
```

---

#### `MAP_FAILED`
```c3
const void* MAP_FAILED
```

---

#### `MADV_NORMAL`
```c3
const MADV_NORMAL
```

---

#### `MADV_RANDOM`
```c3
const MADV_RANDOM
```

---

#### `MADV_SEQUENTIAL`
```c3
const MADV_SEQUENTIAL
```

---

#### `MADV_WILLNEED`
```c3
const MADV_WILLNEED
```

---

#### `MADV_DONTNEED`
```c3
const MADV_DONTNEED
```

---

#### `extern func`
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

#### `extern func`
```c3
extern fn CInt posix_spawn_file_actions_init(Posix_spawn_file_actions_t *file_actions)
```

---

#### `PTHREAD_MUTEX_NORMAL`
```c3
const PTHREAD_MUTEX_NORMAL
```

---

#### `PTHREAD_MUTEX_ERRORCHECK`
```c3
const PTHREAD_MUTEX_ERRORCHECK
```

---

#### `PTHREAD_MUTEX_RECURSIVE`
```c3
const PTHREAD_MUTEX_RECURSIVE
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

#### `extern func`
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

#### `func`
```c3
<*
 @require !environment || !options.inherit_environment
*>
fn SubProcess? create(String[] command_line, SubProcessOptions options = {}, String[] environment = {}) @if(env::WIN32)
```


---

#### `@if(env::POSIX)`
```c3
const ZString[1] EMPTY_ENVIRONMENT @if(env::POSIX)
```

---

#### `func`
```c3
fn String? execute_stdout_to_buffer(char[] buffer, String[] command_line, SubProcessOptions options = {}, String[] environment = {})
```

---

#### `func`
```c3
<*
 @require !environment || !options.inherit_environment
*>
fn SubProcess? create(String[] command_line, SubProcessOptions options = {}, String[] environment = {}) @if(env::POSIX)
```


---

#### `func`
```c3
fn CInt? SubProcess.join(&self) @if(env::POSIX)
```

---

#### `func`
```c3
fn File SubProcess.stdout(&self)
```

---

#### `func`
```c3
fn File SubProcess.stderr(&self)
```

---

#### `func`
```c3
fn CInt? SubProcess.join(&self) @if(env::WIN32)
```

---

#### `func`
```c3
fn bool SubProcess.destroy(&self)
```

---

#### `func`
```c3
fn void? SubProcess.terminate(&self)
```

---

#### `func`
```c3
fn usz? SubProcess.read_stdout(&self, char* buffer, usz size)
```

---

#### `func`
```c3
fn usz? SubProcess.read_stderr(&self, char* buffer, usz size)
```

---

#### `func`
```c3
fn bool? SubProcess.is_running(&self)
```
### `std::os::win32`

---

#### `Win`
```c3
alias Win32_BOOL = int
alias Win32_BOOLEAN = Win32_BYTE
alias Win32_BYTE = char
alias Win32_CCHAR = cinterop::CChar
alias Win32_CHAR = cinterop::CChar
alias Win32_COLORREF = Win32_DWORD
alias Win32_DWORD = uint
alias Win32_DWORDLONG = ulong
alias Win32_DWORD_PTR = Win32_ULONG_PTR
alias Win32_DWORD32 = uint
alias Win32_DWORD64 = ulong
alias Win32_FLOAT = float
alias Win32_HACCEL = Win32_HANDLE
alias Win32_HALF_PTR = int
alias Win32_HANDLE = Win32_PVOID
alias Win32_HBITMAP = Win32_HANDLE
alias Win32_HBRUSH = Win32_HANDLE
alias Win32_HCOLORSPACE = Win32_HANDLE
alias Win32_HCONV = Win32_HANDLE
alias Win32_HCONVLIST = Win32_HANDLE
alias Win32_HCURSOR = Win32_HICON
alias Win32_HDC = Win32_HANDLE
alias Win32_HDDEDATA = Win32_HANDLE
alias Win32_HDESK = Win32_HANDLE
alias Win32_HDROP = Win32_HANDLE
alias Win32_HDWP = Win32_HANDLE
alias Win32_HFILE = int
alias Win32_HFONT = Win32_HANDLE
alias Win32_HGDIOBJ = Win32_HANDLE
alias Win32_HGLOBAL = Win32_HANDLE
alias Win32_HHOOK = Win32_HANDLE
alias Win32_HICON = Win32_HANDLE
alias Win32_HINSTANCE = Win32_HANDLE
alias Win32_HKEY = Win32_HANDLE
alias Win32_HKL = Win32_HANDLE
alias Win32_HLOCAL = Win32_HANDLE
alias Win32_HMENU = Win32_HANDLE
alias Win32_HMETAFILE = Win32_HANDLE
alias Win32_HMODULE = Win32_HANDLE
alias Win32_HMONITOR = Win32_HANDLE
alias Win32_HPALETTE = Win32_HANDLE
alias Win32_HPEN = Win32_HANDLE
alias Win32_HRESULT = Win32_LONG
alias Win32_HRGN = Win32_HANDLE
alias Win32_HRSRC = Win32_HANDLE
alias Win32_HSZ = Win32_HANDLE
alias Win32_HWINSTA = Win32_HANDLE
alias Win32_HWND = Win32_HANDLE
alias Win32_INT = int
alias Win32_INT_PTR = iptr
alias Win32_INT8 = ichar
alias Win32_INT16 = short
alias Win32_INT32 = int
alias Win32_INT64 = long
alias Win32_LANGID = Win32_WORD
alias Win32_LCID = Win32_DWORD
alias Win32_LCTYPE = Win32_DWORD
alias Win32_LGRPID = Win32_DWORD
alias Win32_LONG = int
alias Win32_LONGLONG = long
alias Win32_LONG_PTR = iptr
alias Win32_LONG32 = int
alias Win32_LONG64 = long
alias Win32_LPARAM = Win32_LONG_PTR
alias Win32_LPBOOL = Win32_BOOL*
alias Win32_LPBYTE = Win32_BYTE*
alias Win32_LPCOLORREF = Win32_DWORD*
alias Win32_LPCSTR = Win32_CCHAR*
alias Win32_LPCTSTR = Win32_LPCWSTR
alias Win32_LPCVOID = void*
alias Win32_LPCWSTR = Win32_WCHAR*
alias Win32_LPDWORD = Win32_DWORD*
alias Win32_LPHANDLE = Win32_HANDLE*
alias Win32_LPINT = int*
alias Win32_LPLONG = int*
alias Win32_LPSTR = Win32_CCHAR*
alias Win32_LPTSTR = Win32_LPWSTR
alias Win32_LPVOID = void*
alias Win32_LPWORD = Win32_WORD*
alias Win32_LPWSTR = Win32_WCHAR*
alias Win32_LRESULT = Win32_LONG_PTR
alias Win32_NTSTATUS = Win32_LONG
alias Win32_PBOOL = Win32_BOOL*
alias Win32_PBOOLEAN = Win32_BOOLEAN*
alias Win32_PBYTE = Win32_BYTE*
alias Win32_PCHAR = Win32_CHAR*
alias Win32_PCSTR = Win32_CHAR*
alias Win32_PCTSTR = Win32_LPCWSTR
alias Win32_PCUNICODE_STRING = Win32_UNICODE_STRING*
alias Win32_PCWSTR = WString
alias Win32_PDWORD = Win32_DWORD*
alias Win32_PDWORDLONG = Win32_DWORDLONG*
alias Win32_PDWORDPTR = Win32_DWORD_PTR*
alias Win32_PDWORD32 = Win32_DWORD32*
alias Win32_PDWORD64 = Win32_DWORD64*
alias Win32_PFLOAT = Win32_FLOAT*
alias Win32_PHALFPTR = Win32_HALF_PTR*
alias Win32_PHANDLE = Win32_HANDLE*
alias Win32_PHKEY = Win32_HKEY*
alias Win32_PINT = int*
alias Win32_PINTPTR = Win32_INT_PTR*
alias Win32_PINT8 = Win32_INT8*
alias Win32_PINT16 = Win32_INT16*
alias Win32_PINT32 = Win32_INT32*
alias Win32_PINT64 = Win32_INT64*
alias Win32_PLCID = Win32_PDWORD
alias Win32_PLONG = Win32_LONG*
alias Win32_PLONGLONG = Win32_LONGLONG*
alias Win32_PLONG_PTR = Win32_LONG_PTR*
alias Win32_PLONG32 = Win32_LONG32*
alias Win32_PLONG64 = Win32_LONG64*
alias Win32_POINTER_32 = uint
alias Win32_POINTER_64 = uptr
alias Win32_POINTER_SIGNED = iptr
alias Win32_POINTER_UNSIGNED = uptr
alias Win32_PSHORT = Win32_SHORT*
alias Win32_PSIZE_T = usz*
alias Win32_PSSIZE_T = isz*
alias Win32_PSTR = Win32_CHAR*
alias Win32_PTBYTE = Win32_TBYTE*
alias Win32_PTCHAR = Win32_TCHAR*
alias Win32_PTSTR = Win32_LPWSTR
alias Win32_PUCHAR = Win32_UCHAR*
alias Win32_PUHALFPTR = Win32_UHALF_PTR*
alias Win32_PUINT = Win32_UINT*
alias Win32_PUINTPTR = Win32_UINT_PTR*
alias Win32_PUINT8 = Win32_UINT8*
alias Win32_PUINT16 = Win32_UINT16*
alias Win32_PUINT32 = Win32_UINT32*
alias Win32_PUINT64 = Win32_UINT64*
alias Win32_PULONG = Win32_ULONG*
alias Win32_PULONGLONG = Win32_ULONGLONG*
alias Win32_PULONG_PTR = Win32_ULONG_PTR*
alias Win32_PULONG32 = Win32_ULONG32*
alias Win32_PULONG64 = Win32_ULONG64*
alias Win32_PUNICODE_STRING = Win32_UNICODE_STRING*
alias Win32_PUSHORT = Win32_USHORT*
alias Win32_PVOID = void*
alias Win32_PWCHAR = Win32_WCHAR*
alias Win32_PWORD = Win32_WORD*
alias Win32_PWSTR = Win32_WCHAR*
alias Win32_QWORD = ulong
alias Win32_SC_HANDLE = Win32_HANDLE
alias Win32_SC_LOCK = Win32_LPVOID
alias Win32_SERVICE_STATUS_HANDLE = Win32_HANDLE
alias Win32_SHORT = short
alias Win32_SIZE_T = usz
alias Win32_SOCKET = Win32_HANDLE
alias Win32_SSIZE_T = isz
alias Win32_TBYTE = Win32_WCHAR
alias Win32_TCHAR = Win32_WCHAR
alias Win32_UCHAR = char
alias Win32_UHALF_PTR = uint
alias Win32_UINT = uint
alias Win32_UINT_PTR = uptr
alias Win32_UINT8 = char
alias Win32_UINT16 = ushort
alias Win32_UINT32 = uint
alias Win32_UINT64 = ulong
alias Win32_ULONG = uint
alias Win32_ULONGLONG = ulong
alias Win32_ULONG_PTR = ulong
alias Win32_ULONG32 = uint
alias Win32_ULONG64 = ulong
alias Win32_USHORT = ushort
alias Win32_USN = Win32_LONGLONG
alias Win32_WCHAR = Char16
alias Win32_WORD = ushort
alias Win32_WPARAM = Win32_UINT_PTR
struct Win32_UNICODE_STRING

typedef Win32_CRITICAL_SECTION = ulong[5]
typedef Win32_CONDITION_VARIABLE = void*
typedef Win32_SRWLOCK = void*
typedef Win32_INIT_ONCE = void*
struct Win32_SECURITY_ATTRIBUTES

alias Win32_LPSECURITY_ATTRIBUTES = Win32_SECURITY_ATTRIBUTES*
alias Win32_PSECURITY_ATTRIBUTES = Win32_SECURITY_ATTRIBUTES*
struct Win32_STARTUPINFOW

struct Win32_OVERLAPPED

alias Win32_LPOVERLAPPED = Win32_OVERLAPPED*
alias Win32_LPSTARTUPINFOW = Win32_STARTUPINFOW*
struct Win32_STARTUPINFOEXW

alias Win32_LPPROC_THREAD_ATTRIBUTE_LIST = void*
alias Win32_LPSTARTUPINFOEXW = Win32_STARTUPINFOEXW*
struct Win32_FILETIME

struct Win32_PROCESS_INFORMATION

alias Win32_PPROCESS_INFORMATION = Win32_PROCESS_INFORMATION*
alias Win32_LPPROCESS_INFORMATION = Win32_PROCESS_INFORMATION*
struct Win32_SYSTEM_INFO

alias Win32_LPSYSTEM_INFO = Win32_SYSTEM_INFO*
struct Win32_MODULEINFO

struct Win32_IMAGEHLP_LINE64

enum Win32_SYM_TYPE

struct Win32_GUID

struct Win32_IMAGEHLP_MODULE64

alias Win32_PIMAGEHLP_MODULE64 = Win32_IMAGEHLP_MODULE64*
struct Win32_ARM64_NT_CONTEXT @align(16)

struct Win32_ARM64_NT_NEON128

struct Win32_XMM_SAVE_AREA32

struct Win32_AMD64_CONTEXT @align(16)

alias Win32_CONTEXT = Win32_AMD64_CONTEXT
alias Win32_PCONTEXT = Win32_CONTEXT*
struct Win32_M128A @align(16)

struct Win32_IMAGE_DATA_DIRECTORY

struct Win32_IMAGE_OPTIONAL_HEADER64

alias Win32_PIMAGE_OPTIONAL_HEADER64 = Win32_IMAGE_OPTIONAL_HEADER64*
struct Win32_IMAGE_FILE_HEADER

alias Win32_PIMAGE_FILE_HEADER = Win32_IMAGE_FILE_HEADER*
struct Win32_IMAGE_NT_HEADERS

alias Win32_PIMAGE_NT_HEADERS = Win32_IMAGE_NT_HEADERS*
struct Win32_SYMBOL_INFO

alias Win32_PSYMBOL_INFO = Win32_SYMBOL_INFO*
struct Win32_MODLOAD_DATA

enum Win32_ADDRESS_MODE

struct Win32_ADDRESS64

struct Win32_KDHELP64

struct Win32_STACKFRAME64

alias Win32_PREAD_PROCESS_MEMORY_ROUTINE64 = fn Win32_BOOL(Win32_HANDLE hProcess, Win32_DWORD64 qwBaseAddress, Win32_PVOID lpBuffer, Win32_DWORD nSize, Win32_LPDWORD lpNumberOfBytesRead)
alias Win32_PFUNCTION_TABLE_ACCESS_ROUTINE64 = fn Win32_PVOID(Win32_HANDLE ahProcess, Win32_DWORD64 addrBase)
alias Win32_PGET_MODULE_BASE_ROUTINE64 = fn Win32_DWORD64(Win32_HANDLE hProcess, Win32_DWORD64 address)
alias Win32_PTRANSLATE_ADDRESS_ROUTINE64 = fn Win32_DWORD64(Win32_HANDLE hProcess, Win32_HANDLE hThread, Win32_LPADDRESS64 lpaddr)
alias Win32_PKDHELP64 = Win32_KDHELP64*
alias Win32_LPADDRESS64 = Win32_ADDRESS64*
alias Win32_LPSTACKFRAME64 = Win32_STACKFRAME64*
alias Win32_PMODLOAD_DATA = Win32_MODLOAD_DATA*
alias Win32_PIMAGEHLP_LINE64 = Win32_IMAGEHLP_LINE64*
alias Win32_LPMODULEINFO = Win32_MODULEINFO*
```

---

#### `INVALID_HANDLE_VALUE`
```c3
const INVALID_HANDLE_VALUE
```

---

#### `ARM64_MAX_BREAKPOINTS`
```c3
const ARM64_MAX_BREAKPOINTS
```

---

#### `ARM64_MAX_WATCHPOINTS`
```c3
const ARM64_MAX_WATCHPOINTS
```

---

#### `CONTEXT_AMD64`
```c3
const CONTEXT_AMD64
```

---

#### `CONTEXT_AMD64_CONTROL`
```c3
const CONTEXT_AMD64_CONTROL
```

---

#### `CONTEXT_AMD64_INTEGER`
```c3
const CONTEXT_AMD64_INTEGER
```

---

#### `CONTEXT_AMD64_SEGMENTS`
```c3
const CONTEXT_AMD64_SEGMENTS
```

---

#### `CONTEXT_AMD64_FLOATING_POINT`
```c3
const CONTEXT_AMD64_FLOATING_POINT
```

---

#### `CONTEXT_AMD64_DEBUG_REGISTERS`
```c3
const CONTEXT_AMD64_DEBUG_REGISTERS
```

---

#### `CONTEXT_AMD64_FULL`
```c3
const CONTEXT_AMD64_FULL
```

---

#### `CONTEXT_AMD64_ALL`
```c3
const CONTEXT_AMD64_ALL
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

#### `extern func`
```c3
extern fn void getSystemTimeAsFileTime(Win32_FILETIME* time) @extern("GetSystemTimeAsFileTime")
```

---

#### `Win`
```c3
enum Win32_GET_FILEEX_INFO_LEVELS
struct Win32_FILE_ATTRIBUTE_DATA

struct Win32_WIN32_FIND_DATAW

alias Win32_LPWIN32_FIND_DATAW = Win32_WIN32_FIND_DATAW*
enum Win32_AllocationType : const Win32_DWORD

enum Win32_Protect : const Win32_DWORD

enum Win32_FreeType : const Win32_DWORD

alias Win32_INIT_ONCE_FN = fn Win32_BOOL(Win32_INIT_ONCE* initOnce, void* parameter, void** context)
struct Win32_KEY_EVENT_RECORD 

struct Win32_COORD 

struct Win32_MOUSE_EVENT_RECORD 

struct Win32_WINDOW_BUFFER_SIZE_RECORD 

struct Win32_MENU_EVENT_RECORD 

struct Win32_FOCUS_EVENT_RECORD 

struct Win32_INPUT_RECORD 

alias Win32_PCOORD = Win32_COORD*
struct Win32_RECT

struct Win32_POINT

struct Win32_SIZE

struct Win32_WSABUF 

struct Win32_SOCKADDR 

alias Win32_PSIZE = Win32_SIZE*
alias Win32_NPSIZE = Win32_SIZE*
alias Win32_LPSIZE = Win32_SIZE*
alias Win32_PPOINT = Win32_POINT*
alias Win32_NPOINT = Win32_POINT*
alias Win32_LPOINT = Win32_POINT*
alias Win32_PRECT = Win32_RECT*
alias Win32_NPRECT = Win32_RECT*
alias Win32_LPRECT = Win32_RECT*
alias Win32_PWSABUF = Win32_WSABUF*
alias Win32_LPWSABUF = Win32_WSABUF*
alias Win32_PSOCKADDR = Win32_SOCKADDR*
alias Win32_LPSOCKADDR = Win32_SOCKADDR*
enum Win32_MEM_EXTENDED_PARAMETER_TYPE : CInt

alias Win32_PMEM_EXTENDED_PARAMETER_TYPE = Win32_MEM_EXTENDED_PARAMETER_TYPE
enum Win32_MEM_EXTENDED_PARAMETER_ATTRIBUTE : const Win32_DWORD64

struct Win32_MEM_EXTENDED_PARAMETER

alias Win32_PMEM_EXTENDED_PARAMETER = Win32_MEM_EXTENDED_PARAMETER*
alias Win32_WNDPROC = fn Win32_LRESULT(Win32_HWND, Win32_UINT, Win32_WPARAM, Win32_LPARAM)
struct Win32_WNDCLASSEXW

struct Win32_MSG

struct Win32_PAINTSTRUCT

alias Win32_PWNDCLASSEXW = Win32_WNDCLASSEXW*
alias Win32_LPWNDCLASSEXW = Win32_WNDCLASSEXW*
alias Win32_NPWNDCLASSEXW = Win32_WNDCLASSEXW*
alias Win32_PPAINTSTRUCT = Win32_PAINTSTRUCT*
alias Win32_LPPAINTSTRUCT = Win32_PAINTSTRUCT*
alias Win32_NPPAINTSTRUCT = Win32_PAINTSTRUCT*
alias Win32_PMSG = Win32_MSG*
alias Win32_LPMSG = Win32_MSG*
alias Win32_NPMSG = Win32_MSG*
alias Win32_ATOM = ushort
struct Win32_addrinfo

alias Win32_ADDRINFO = Win32_addrinfo
alias Win32_ADDRINFOA = Win32_ADDRINFO
alias Win32_PADDRINFOA = Win32_ADDRINFO*
struct Win32_addrinfoW 
alias Win32_ADDRINFOW = Win32_addrinfoW
alias Win32_PADDRINFOW = Win32_addrinfoW*
struct Win32_pollfd

alias Win32_WSAPOLLFD = Win32_pollfd
alias Win32_PWSAPOLLFD = Win32_WSAPOLLFD*
alias Win32_LPWSAPOLLFD = Win32_WSAPOLLFD*
struct Win32_InAddr 

struct Win32_SOCKADDR_IN 

struct Win32_SOCKADDR_STORAGE 

alias Win32_WSAOVERLAPPED = Win32_OVERLAPPED
alias Win32_LPWSAOVERLAPPED = Win32_WSAOVERLAPPED*
alias Win32_LPWSAOVERLAPPED_COMPLETION_ROUTINE = fn void (
	Win32_DWORD dwError,
	Win32_DWORD cbTransferred,
	Win32_LPWSAOVERLAPPED
	lpOverlapped,
	Win32_DWORD dwFlags
)
alias Win32_LPFN_WSARECV = fn CInt(
	Win32_SOCKET socket,
	Win32_LPWSABUF buffers,
	Win32_DWORD buffer_count,
	Win32_LPDWORD bytes,
	Win32_LPDWORD flags,
	Win32_LPWSAOVERLAPPED overlapped,
	Win32_LPWSAOVERLAPPED_COMPLETION_ROUTINE completion_routine
)
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
alias Win32_LPFn_CONNECTEX = fn bool(
	Win32_SOCKET,
	Win32_SOCKADDR*,
	Win32_INT,
	Win32_PVOID,
	Win32_DWORD,
	Win32_LPDWORD,
	void*
)
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
const MAX_PATH
```

---

#### `extern func`
```c3
extern fn Win32_BOOL closeHandle(Win32_HANDLE) @extern("CloseHandle")
```

---

#### `extern func`
```c3
extern fn Win32_HBRUSH createSolidBrush(Win32_COLORREF) @extern("CreateSolidBrush")
```

---

#### `extern func`
```c3
extern fn Win32_DWORD getLastError() @extern("GetLastError")
```

---

#### `extern func`
```c3
extern fn void* _aligned_malloc(usz size, usz alignment)
```

---

#### `extern func`
```c3
extern fn Win32_LPVOID virtualAlloc(Win32_LPVOID lpAddres, Win32_SIZE_T dwSize, Win32_AllocationType flAllocationType, Win32_Protect flProtect) @extern("VirtualAlloc")
```

---

#### `STARTF_USESTDHANDLES`
```c3
const Win32_DWORD STARTF_USESTDHANDLES
```

---

#### `CREATE_NO_WINDOW`
```c3
const Win32_DWORD CREATE_NO_WINDOW
```

---

#### `CREATE_PROTECTED_PROCESS`
```c3
const Win32_DWORD CREATE_PROTECTED_PROCESS
```

---

#### `CREATE_UNICODE_ENVIRONMENT`
```c3
const Win32_DWORD CREATE_UNICODE_ENVIRONMENT
```

---

#### `WAIT_OBJECT_0`
```c3
const uint WAIT_OBJECT_0
```

---

#### `WAIT_ABANDONED`
```c3
const uint WAIT_ABANDONED
```

---

#### `WAIT_IO_COMPLETION`
```c3
const uint WAIT_IO_COMPLETION
```

---

#### `WAIT_FAILED`
```c3
const uint WAIT_FAILED
```

---

#### `HANDLE_FLAG_INHERIT`
```c3
const Win32_DWORD HANDLE_FLAG_INHERIT
```

---

#### `HANDLE_FLAG_PROTECT_FROM_CLOSE`
```c3
const Win32_DWORD HANDLE_FLAG_PROTECT_FROM_CLOSE
```

---

#### `INFINITE`
```c3
const uint INFINITE
```

---

#### `PIPE_ACCESS_DUPLEX`
```c3
const Win32_DWORD PIPE_ACCESS_DUPLEX
```

---

#### `PIPE_ACCESS_INBOUND`
```c3
const Win32_DWORD PIPE_ACCESS_INBOUND
```

---

#### `PIPE_ACCESS_OUTBOUND`
```c3
const Win32_DWORD PIPE_ACCESS_OUTBOUND
```

---

#### `FILE_FLAG_FIRST_PIPE_INSTANCE`
```c3
const Win32_DWORD FILE_FLAG_FIRST_PIPE_INSTANCE
```

---

#### `FILE_FLAG_WRITE_THROUGH`
```c3
const Win32_DWORD FILE_FLAG_WRITE_THROUGH
```

---

#### `FILE_FLAG_OVERLAPPED`
```c3
const Win32_DWORD FILE_FLAG_OVERLAPPED
```

---

#### `WRITE_DAC`
```c3
const Win32_DWORD WRITE_DAC
```

---

#### `WRITE_OWNER`
```c3
const Win32_DWORD WRITE_OWNER
```

---

#### `ACCESS_SYSTEM_SECURITY`
```c3
const Win32_DWORD ACCESS_SYSTEM_SECURITY
```

---

#### `PIPE_TYPE_BYTE`
```c3
const Win32_DWORD PIPE_TYPE_BYTE
```

---

#### `PIPE_TYPE_MESSAGE`
```c3
const Win32_DWORD PIPE_TYPE_MESSAGE
```

---

#### `PIPE_READMODE_BYTE`
```c3
const Win32_DWORD PIPE_READMODE_BYTE
```

---

#### `PIPE_READMODE_MESSAGE`
```c3
const Win32_DWORD PIPE_READMODE_MESSAGE
```

---

#### `PIPE_WAIT`
```c3
const Win32_DWORD PIPE_WAIT
```

---

#### `PIPE_NOWAIT`
```c3
const Win32_DWORD PIPE_NOWAIT
```

---

#### `PIPE_ACCEPT_REMOTE_CLIENTS`
```c3
const Win32_DWORD PIPE_ACCEPT_REMOTE_CLIENTS
```

---

#### `PIPE_REJECT_REMOTE_CLIENTS`
```c3
const Win32_DWORD PIPE_REJECT_REMOTE_CLIENTS
```

---

#### `SYMOPT_CASE_INSENSITIVE`
```c3
const SYMOPT_CASE_INSENSITIVE
```

---

#### `SYMOPT_UNDNAME`
```c3
const SYMOPT_UNDNAME
```

---

#### `SYMOPT_DEFERRED_LOADS`
```c3
const SYMOPT_DEFERRED_LOADS
```

---

#### `SYMOPT_NO_CPP`
```c3
const SYMOPT_NO_CPP
```

---

#### `SYMOPT_LOAD_LINES`
```c3
const SYMOPT_LOAD_LINES
```

---

#### `SYMOPT_OMAP_FIND_NEAREST`
```c3
const SYMOPT_OMAP_FIND_NEAREST
```

---

#### `SYMOPT_LOAD_ANYTHING`
```c3
const SYMOPT_LOAD_ANYTHING
```

---

#### `SYMOPT_IGNORE_CVREC`
```c3
const SYMOPT_IGNORE_CVREC
```

---

#### `IMAGE_FILE_MACHINE_UNKNOWN`
```c3
const IMAGE_FILE_MACHINE_UNKNOWN
```

---

#### `IMAGE_FILE_MACHINE_TARGET_HOST`
```c3
const IMAGE_FILE_MACHINE_TARGET_HOST
```

---

#### `IMAGE_FILE_MACHINE_I386`
```c3
const IMAGE_FILE_MACHINE_I386
```

---

#### `IMAGE_FILE_MACHINE_IA64`
```c3
const IMAGE_FILE_MACHINE_IA64
```

---

#### `IMAGE_FILE_MACHINE_ARM64`
```c3
const IMAGE_FILE_MACHINE_ARM64
```

---

#### `IMAGE_FILE_MACHINE_AMD64`
```c3
const IMAGE_FILE_MACHINE_AMD64
```

---

#### `UNDNAME_COMPLETE`
```c3
const UNDNAME_COMPLETE
```

---

#### `extern func`
```c3
extern fn void initializeCriticalSection(Win32_CRITICAL_SECTION* section) @extern("InitializeCriticalSection")
```

---

#### `Symbol`
```c3
struct Symbol
```

---

#### `func`
```c3
fn BacktraceList? symbolize_backtrace(Allocator allocator, void*[] backtrace)
```

---

#### `func`
```c3
fn Backtrace? resolve_backtrace(Allocator allocator, void* addr, Win32_HANDLE process)
```

---

#### `WS_BORDER`
```c3
const Win32_DWORD WS_BORDER
```

---

#### `WS_CAPTION`
```c3
const Win32_DWORD WS_CAPTION
```

---

#### `WS_CHILD`
```c3
const Win32_DWORD WS_CHILD
```

---

#### `WS_CHILDWINDOW`
```c3
const Win32_DWORD WS_CHILDWINDOW
```

---

#### `WS_CLIPCHILDREN`
```c3
const Win32_DWORD WS_CLIPCHILDREN
```

---

#### `WS_CLIPSIBLINGS`
```c3
const Win32_DWORD WS_CLIPSIBLINGS
```

---

#### `WS_DISABLED`
```c3
const Win32_DWORD WS_DISABLED
```

---

#### `WS_DLGFRAME`
```c3
const Win32_DWORD WS_DLGFRAME
```

---

#### `WS_GROUP`
```c3
const Win32_DWORD WS_GROUP
```

---

#### `WS_HSCROLL`
```c3
const Win32_DWORD WS_HSCROLL
```

---

#### `WS_ICONIC`
```c3
const Win32_DWORD WS_ICONIC
```

---

#### `WS_MAXIMIZE`
```c3
const Win32_DWORD WS_MAXIMIZE
```

---

#### `WS_MAXIMIZEBOX`
```c3
const Win32_DWORD WS_MAXIMIZEBOX
```

---

#### `WS_MINIMIZE`
```c3
const Win32_DWORD WS_MINIMIZE
```

---

#### `WS_MINIMIZEBOX`
```c3
const Win32_DWORD WS_MINIMIZEBOX
```

---

#### `WS_OVERLAPPED`
```c3
const Win32_DWORD WS_OVERLAPPED
```

---

#### `WS_OVERLAPPEDWINDOW`
```c3
const Win32_DWORD WS_OVERLAPPEDWINDOW
```

---

#### `WS_POPUP`
```c3
const Win32_DWORD WS_POPUP
```

---

#### `WS_POPUPWINDOW`
```c3
const Win32_DWORD WS_POPUPWINDOW
```

---

#### `WS_SIZEBOX`
```c3
const Win32_DWORD WS_SIZEBOX
```

---

#### `WS_SYSMENU`
```c3
const Win32_DWORD WS_SYSMENU
```

---

#### `WS_TABSTOP`
```c3
const Win32_DWORD WS_TABSTOP
```

---

#### `WS_THICKFRAME`
```c3
const Win32_DWORD WS_THICKFRAME
```

---

#### `WS_TILED`
```c3
const Win32_DWORD WS_TILED
```

---

#### `WS_TILEDWINDOW`
```c3
const Win32_DWORD WS_TILEDWINDOW
```

---

#### `WS_VISIBLE`
```c3
const Win32_DWORD WS_VISIBLE
```

---

#### `WS_VSCROLL`
```c3
const Win32_DWORD WS_VSCROLL
```

---

#### `MB_OK`
```c3
const Win32_UINT MB_OK
```

---

#### `MB_OKCANCEL`
```c3
const Win32_UINT MB_OKCANCEL
```

---

#### `MB_ABORTRETRYIGNORE`
```c3
const Win32_UINT MB_ABORTRETRYIGNORE
```

---

#### `MB_YESNOCANCEL`
```c3
const Win32_UINT MB_YESNOCANCEL
```

---

#### `MB_YESNO`
```c3
const Win32_UINT MB_YESNO
```

---

#### `MB_RETRYCANCEL`
```c3
const Win32_UINT MB_RETRYCANCEL
```

---

#### `MB_CANCELTRYCONTINUE`
```c3
const Win32_UINT MB_CANCELTRYCONTINUE
```

---

#### `MB_ICONHAND`
```c3
const Win32_UINT MB_ICONHAND
```

---

#### `MB_ICONQUESTION`
```c3
const Win32_UINT MB_ICONQUESTION
```

---

#### `MB_ICONEXCLAMATION`
```c3
const Win32_UINT MB_ICONEXCLAMATION
```

---

#### `MB_ICONASTERISK`
```c3
const Win32_UINT MB_ICONASTERISK
```

---

#### `MB_USERICON`
```c3
const Win32_UINT MB_USERICON
```

---

#### `MB_ICONWARNING`
```c3
const Win32_UINT MB_ICONWARNING
```

---

#### `MB_ICONERROR`
```c3
const Win32_UINT MB_ICONERROR
```

---

#### `MB_ICONINFORMATION`
```c3
const Win32_UINT MB_ICONINFORMATION
```

---

#### `MB_ICONSTOP`
```c3
const Win32_UINT MB_ICONSTOP
```

---

#### `@if(env::ARCH_32_BIT)`
```c3
const GWL_WNDPROC @if(env::ARCH_32_BIT)
const GWL_HINSTANCE @if(env::ARCH_32_BIT) 
const GWL_HWNDPARENT @if(env::ARCH_32_BIT) 
const GWL_USERDATA @if(env::ARCH_32_BIT) 
```

---

#### `GWL_STYLE`
```c3
const GWL_STYLE
```

---

#### `GWL_EXSTYLE`
```c3
const GWL_EXSTYLE
```

---

#### `GWL_ID`
```c3
const GWL_ID
```

---

#### `GWLP_WNDPROC`
```c3
const GWLP_WNDPROC
```

---

#### `GWLP_HINSTANCE`
```c3
const GWLP_HINSTANCE
```

---

#### `GWLP_HWNDPARENT`
```c3
const GWLP_HWNDPARENT
```

---

#### `GWLP_USERDATA`
```c3
const GWLP_USERDATA
```

---

#### `GWLP_ID`
```c3
const GWLP_ID
```

---

#### `extern func`
```c3
extern fn Win32_HDC beginPaint(Win32_HWND, Win32_LPPAINTSTRUCT) @extern("BeginPaint")
```

---

#### `macro`
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
const usz _SS_PAD1SIZE
```

---

#### `_SS_PAD2SIZE`
```c3
const usz _SS_PAD2SIZE
```

---

#### `POLLERR`
```c3
const Win32_SHORT POLLERR
```

---

#### `POLLHUP`
```c3
const Win32_SHORT POLLHUP
```

---

#### `POLLNVAL`
```c3
const Win32_SHORT POLLNVAL
```

---

#### `POLLWRNORM`
```c3
const Win32_SHORT POLLWRNORM
```

---

#### `POLLWRBAND`
```c3
const Win32_SHORT POLLWRBAND
```

---

#### `POLLRDNORM`
```c3
const Win32_SHORT POLLRDNORM
```

---

#### `POLLRDBAND`
```c3
const Win32_SHORT POLLRDBAND
```

---

#### `POLLPRI`
```c3
const Win32_SHORT POLLPRI
```

---

#### `POLLIN`
```c3
const Win32_SHORT POLLIN
```

---

#### `POLLOUT`
```c3
const Win32_SHORT POLLOUT
```

---

#### `SD_RECEIVE`
```c3
const SD_RECEIVE
```

---

#### `SD_SEND`
```c3
const SD_SEND
```

---

#### `SD_BOTH`
```c3
const SD_BOTH
```

---

#### `extern func`
```c3
extern fn CInt wsaPoll(Win32_LPWSAPOLLFD fdArray, Win32_ULONG fds, Win32_INT timeout) @extern("WSAPoll")
```
### `std::sort`

---

#### `macro`
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

#### `macro`
```c3
<*
 @require @is_sortable(list) : "The list must be indexable and support .len or .len()"
 @require @is_cmp_key_fn(key_fn, list) : "Expected a transformation function which returns an unsigned integer."
*>
macro countingsort(list, key_fn = EMPTY_MACRO_SLOT) @builtin
```


Sort list using the counting sort algorithm.

---

#### `macro`
```c3
macro insertionsort_indexed(list, start, end, cmp = EMPTY_MACRO_SLOT, context = EMPTY_MACRO_SLOT) @builtin
```

---

#### `macro`
```c3
macro quicksort_indexed(list, start, end, cmp = EMPTY_MACRO_SLOT, context = EMPTY_MACRO_SLOT) @builtin
```

---

#### `macro`
```c3
<*
 @require @is_sortable(list) : "The list must be indexable and support .len or .len()"
 @require @is_valid_cmp_fn(cmp, list, context) : "Expected a comparison function which compares values"
*>
macro insertionsort(list, cmp = EMPTY_MACRO_SLOT, context = EMPTY_MACRO_SLOT) @builtin @safemacro
```


Sort list using the quick sort algorithm.

---

#### `macro`
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

#### `macro`
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

#### `macro`
```c3
macro usz len_from_list(list)
```

---

#### `macro`
```c3
macro bool @is_sortable(#list)
```

---

#### `macro`
```c3
macro bool @is_valid_context(#cmp, #context)
```

---

#### `macro`
```c3
macro bool @is_valid_cmp_fn(#cmp, #list, #context)
```

---

#### `macro`
```c3
macro bool @is_cmp_key_fn(#key_fn, #list)
```

---

#### `macro`
```c3
<*
 @require @is_sortable(list) : "The list must be indexable and support .len or .len()"
 @require @is_valid_cmp_fn(cmp, list, ctx) : "Expected a comparison function which compares values"
 @require @is_valid_context(cmp, ctx) : "Expected a valid context"
*>
macro bool is_sorted(list, cmp = EMPTY_MACRO_SLOT, ctx = EMPTY_MACRO_SLOT) @builtin
```


Returns true if list is sorted in either ascending or descending order.
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
alias KeyFnReturnType @if(NO_KEY_FN) = ElementType
```

---

#### `CmpCallback`
```c3
alias CmpCallback @if(KEY_BY_VALUE && NO_KEY_FN) = fn int(ElementType, ElementType)
alias CmpCallback @if(!KEY_BY_VALUE && NO_KEY_FN) = fn int(ElementType*, ElementType*)
alias CmpCallback @if(KEY_BY_VALUE && !NO_KEY_FN) = fn int(ElementType, ElementType, KeyFn)
alias CmpCallback @if(!KEY_BY_VALUE && !NO_KEY_FN) = fn int(ElementType*, ElementType*, KeyFn)
```

---

#### `func`
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

#### `func`
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

#### `func`
```c3
fn void qsort(Type list, isz low, isz high, CmpFn cmp, Context context)
```

---

#### `func`
```c3
<*
 @require low <= k : "kth smalles element is smaller than lower bounds"
 @require k <= high : "kth smalles element is larger than upper bounds"
*>
fn ElementType? qselect(Type list, isz low, isz high, isz k, CmpFn cmp, Context context)
```


---

#### `macro`
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

#### `macro`
```c3
macro void? Mutex.init(&mutex)
```

---

#### `macro`
```c3
macro bool Mutex.is_initialized(mutex)
```

---

#### `macro`
```c3
macro void? RecursiveMutex.init(&mutex)
```

---

#### `macro`
```c3
macro void? Mutex.destroy(&mutex)
```

---

#### `macro`
```c3
macro void? Mutex.lock(&mutex)
```

---

#### `macro`
```c3
macro bool  Mutex.try_lock(&mutex)
```

---

#### `macro`
```c3
macro void? Mutex.unlock(&mutex)
```

---

#### `macro`
```c3
macro void? TimedMutex.init(&mutex)
```

---

#### `macro`
```c3
macro void? TimedRecursiveMutex.init(&mutex)
```

---

#### `macro`
```c3
macro void? TimedMutex.destroy(&mutex)
```

---

#### `macro`
```c3
macro void? TimedMutex.lock(&mutex)
```

---

#### `macro`
```c3
macro void? TimedMutex.lock_timeout(&mutex, ulong ms)
```

---

#### `macro`
```c3
macro bool  TimedMutex.try_lock(&mutex)
```

---

#### `macro`
```c3
macro void? TimedMutex.unlock(&mutex)
```

---

#### `macro`
```c3
macro void fence(AtomicOrdering $ordering) @safemacro
```

---

#### `macro`
```c3
macro void Mutex.@in_lock(&mutex; @body)
```

---

#### `macro`
```c3
macro void? ConditionVariable.init(&cond)
```

---

#### `macro`
```c3
macro void? ConditionVariable.destroy(&cond)
```

---

#### `macro`
```c3
macro void? ConditionVariable.signal(&cond)
```

---

#### `macro`
```c3
macro void? ConditionVariable.broadcast(&cond)
```

---

#### `macro`
```c3
macro void? ConditionVariable.wait(&cond, Mutex* mutex)
```

---

#### `macro`
```c3
<*
 @require @assignable_to(#ms_or_duration, Duration) || @assignable_to(#ms_or_duration, ulong)
 @return? thread::WAIT_TIMEOUT, thread::WAIT_FAILED
*>
macro void? ConditionVariable.wait_timeout(&cond, Mutex* mutex, #ms_or_duration) @safemacro
```


---

#### `macro`
```c3
<*
 @return? thread::WAIT_TIMEOUT, thread::WAIT_FAILED
*>
macro void? ConditionVariable.wait_until(&cond, Mutex* mutex, Time time)
```


---

#### `macro`
```c3
<*
 @require thread_fn != null : "A non null thread function is required"
*>
macro void? Thread.create(&thread, ThreadFn thread_fn, void* arg)
```


Create and start a thread.

---

#### `macro`
```c3
macro void? Thread.detach(thread)
```

---

#### `macro`
```c3
macro int? Thread.join(thread)
```

---

#### `macro`
```c3
macro bool Thread.equals(thread, Thread other)
```

---

#### `macro`
```c3
macro void OnceFlag.call(&flag, OnceFn func)
```

---

#### `macro`
```c3
macro void yield()
```

---

#### `macro`
```c3
macro Thread current()
```

---

#### `macro`
```c3
macro void exit(int result)
```

---

#### `macro`
```c3
macro void? sleep(Duration d) @maydiscard
```

---

#### `macro`
```c3
macro void? sleep_ms(ulong ms) @maydiscard
```

---

#### `macro`
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

#### `func`
```c3
fn void? UnbufferedChannel.init(&self, Allocator allocator)
```

---

#### `func`
```c3
fn void? UnbufferedChannel.destroy(&self)
```

---

#### `func`
```c3
fn void? UnbufferedChannel.push(self, Type val)
```

---

#### `func`
```c3
fn Type? UnbufferedChannel.pop(self)
```

---

#### `func`
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

#### `func`
```c3
fn void? BufferedChannel.init(&self, Allocator allocator, usz size = 1)
```

---

#### `func`
```c3
fn void? BufferedChannel.destroy(&self)
```

---

#### `func`
```c3
fn void? BufferedChannel.push(self, Type val)
```

---

#### `func`
```c3
fn Type? BufferedChannel.pop(self)
```

---

#### `func`
```c3
fn void? BufferedChannel.close(self)
```
### `std::thread::cpu @if(env::DARWIN)`

---

#### `CTL_UNSPEC`
```c3
const CTL_UNSPEC
```

---

#### `CTL_KERN`
```c3
const CTL_KERN
```

---

#### `CTL_VM`
```c3
const CTL_VM
```

---

#### `CTL_VFS`
```c3
const CTL_VFS
```

---

#### `CTL_NET`
```c3
const CTL_NET
```

---

#### `CTL_DEBUG`
```c3
const CTL_DEBUG
```

---

#### `CTL_HW`
```c3
const CTL_HW
```

---

#### `CTL_MACHDEP`
```c3
const CTL_MACHDEP
```

---

#### `CTL_USER`
```c3
const CTL_USER
```

---

#### `CTL_MAXID`
```c3
const CTL_MAXID
```

---

#### `HW_MACHINE`
```c3
const HW_MACHINE
```

---

#### `HW_MODEL`
```c3
const HW_MODEL
```

---

#### `HW_NCPU`
```c3
const HW_NCPU
```

---

#### `HW_BYTEORDER`
```c3
const HW_BYTEORDER
```

---

#### `HW_PHYSMEM`
```c3
const HW_PHYSMEM
```

---

#### `HW_USERMEM`
```c3
const HW_USERMEM
```

---

#### `HW_PAGESIZE`
```c3
const HW_PAGESIZE
```

---

#### `HW_DISKNAMES`
```c3
const HW_DISKNAMES
```

---

#### `HW_DISKSTATS`
```c3
const HW_DISKSTATS
```

---

#### `HW_EPOCH`
```c3
const HW_EPOCH
```

---

#### `HW_FLOATINGPT`
```c3
const HW_FLOATINGPT
```

---

#### `HW_MACHINE_ARCH`
```c3
const HW_MACHINE_ARCH
```

---

#### `HW_VECTORUNIT`
```c3
const HW_VECTORUNIT
```

---

#### `HW_BUS_FREQ`
```c3
const HW_BUS_FREQ
```

---

#### `HW_CPU_FREQ`
```c3
const HW_CPU_FREQ
```

---

#### `HW_CACHELINE`
```c3
const HW_CACHELINE
```

---

#### `HW_L1ICACHESIZE`
```c3
const HW_L1ICACHESIZE
```

---

#### `HW_L1DCACHESIZE`
```c3
const HW_L1DCACHESIZE
```

---

#### `HW_L2SETTINGS`
```c3
const HW_L2SETTINGS
```

---

#### `HW_L2CACHESIZE`
```c3
const HW_L2CACHESIZE
```

---

#### `HW_L3SETTINGS`
```c3
const HW_L3SETTINGS
```

---

#### `HW_L3CACHESIZE`
```c3
const HW_L3CACHESIZE
```

---

#### `HW_MAXID`
```c3
const HW_MAXID
```

---

#### `func`
```c3
fn uint native_cpu()
```
### `std::thread::cpu @if(env::LINUX)`

---

#### `func`
```c3
fn uint native_cpu()
```
### `std::thread::cpu @if(env::WIN32)`

---

#### `func`
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

#### `func`
```c3
fn void NativeOnceFlag.call_once(&flag, OnceFn func)
```

---

#### `func`
```c3
fn void? NativeMutex.init(&mtx, MutexType type)
```

---

#### `func`
```c3
fn bool NativeMutex.is_initialized(&self)
```

---

#### `macro`
```c3
macro void? NativeMutex.lock(&mutex)
```

---

#### `macro`
```c3
macro bool NativeMutex.try_lock(&mutex)
```

---

#### `macro`
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

#### `func`
```c3
<*
 @require !self.is_initialized() : "Mutex is already initialized"
 @ensure self.is_initialized()
*>
fn void? NativeMutex.init(&self, MutexType type)
```


---

#### `func`
```c3
fn bool NativeMutex.is_initialized(&self)
```

---

#### `func`
```c3
<*
 @require self.is_initialized() : "Mutex was not initialized"
 @ensure !self.is_initialized()
*>
fn void? NativeMutex.destroy(&self)
```


---

#### `func`
```c3
<*
 @require self.is_initialized() : "Mutex was not initialized"
*>
fn void? NativeMutex.lock(&self)
```


---

#### `func`
```c3
<*
 @require self.is_initialized() : "Mutex was not initialized"
*>
fn void? NativeMutex.lock_timeout(&self, ulong ms)
```


---

#### `func`
```c3
<*
 @require self.is_initialized() : "Mutex was not initialized"
*>
fn bool NativeMutex.try_lock(&self)
```


---

#### `func`
```c3
<*
 @require self.is_initialized() : "Mutex was not initialized"
*>
fn void? NativeMutex.unlock(&self)
```


---

#### `func`
```c3
fn void? NativeConditionVariable.init(&cond)
```

---

#### `func`
```c3
fn void? NativeConditionVariable.destroy(&cond)
```

---

#### `func`
```c3
fn void? NativeConditionVariable.signal(&cond)
```

---

#### `func`
```c3
fn void? NativeConditionVariable.broadcast(&cond)
```

---

#### `func`
```c3
<*
 @require mtx.is_initialized()
*>
fn void? NativeConditionVariable.wait(&cond, NativeMutex* mtx)
```


---

#### `func`
```c3
<*
 @require mtx.is_initialized()
 @return? thread::WAIT_TIMEOUT, thread::WAIT_FAILED
*>
fn void? NativeConditionVariable.wait_timeout(&cond, NativeMutex* mtx, ulong ms)
```


---

#### `func`
```c3
<*
 @require mtx.is_initialized()
 @return? thread::WAIT_TIMEOUT, thread::WAIT_FAILED
*>
fn void? NativeConditionVariable.wait_timeout_duration(&cond, NativeMutex* mtx, Duration duration)
```


---

#### `func`
```c3
<*
 @require mtx.is_initialized()
 @return? thread::WAIT_TIMEOUT, thread::WAIT_FAILED
*>
fn void? NativeConditionVariable.wait_until(&cond, NativeMutex* mtx, Time time)
```


---

#### `func`
```c3
fn void? NativeThread.create(&thread, ThreadFn thread_fn, void* arg)
```

---

#### `func`
```c3
fn void? NativeThread.detach(thread)
```

---

#### `func`
```c3
fn void native_thread_exit(int result)
```

---

#### `func`
```c3
fn NativeThread native_thread_current()
```

---

#### `func`
```c3
fn bool NativeThread.equals(thread, NativeThread other)
```

---

#### `func`
```c3
fn int? NativeThread.join(thread)
```

---

#### `func`
```c3
fn void NativeOnceFlag.call_once(&flag, OnceFn func)
```

---

#### `func`
```c3
fn void native_thread_yield()
```

---

#### `func`
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

#### `func`
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

#### `func`
```c3
<*
 @require !mtx.initialized : "Mutex is already initialized"
 @require !type.timed
 @ensure mtx.initialized
*>
fn void? NativeMutex.init(&mtx, MutexType type)
```


---

#### `func`
```c3
<*
 @require mtx.initialized : "Mutex was not initialized"
 @require mtx.owner_thread != win32::getCurrentThreadId() : "Mutex was not unlocked before destroying it"
 @ensure !mtx.initialized
*>
fn void? NativeMutex.destroy(&mtx)
```


---

#### `func`
```c3
<*
 @require mtx.initialized : "Mutex was not initialized"
*>
fn void? NativeMutex.lock(&mtx)
```


---

#### `func`
```c3
<*
 @require mtx.initialized : "Mutex was not initialized"
*>
fn bool NativeMutex.try_lock(&mtx)
```


---

#### `func`
```c3
<*
 @require mtx.initialized : "Mutex was not initialized"
*>
fn void? NativeMutex.unlock(&mtx)
```


---

#### `func`
```c3
<*
 @require type.timed
 @require !mtx.initialized : "Mutex is already initialized"
 @ensure mtx.initialized
*>
fn void? NativeTimedMutex.init(&mtx, MutexType type)
```


---

#### `func`
```c3
<*
 @require mtx.initialized : "Mutex was not initialized"
 @require mtx.owner_thread != win32::getCurrentThreadId() : "Mutex was not unlocked before destroying it"
 @ensure !mtx.initialized
*>
fn void? NativeTimedMutex.destroy(&mtx)
```


---

#### `func`
```c3
<*
 @require mtx.initialized : "Mutex was not initialized"
*>
fn void? NativeTimedMutex.lock(&mtx)
```


---

#### `func`
```c3
<*
 @require mtx.initialized : "Mutex was not initialized"
*>
fn void? NativeTimedMutex.lock_timeout(&mtx, ulong ms)
```


---

#### `func`
```c3
<*
 @require mtx.initialized : "Mutex was not initialized"
*>
fn bool NativeTimedMutex.try_lock(&mtx)
```


---

#### `func`
```c3
<*
 @require mtx.initialized : "Mutex was not initialized"
*>
fn void? NativeTimedMutex.unlock(&mtx)
```


---

#### `func`
```c3
fn void? NativeConditionVariable.init(&cond)
```

---

#### `func`
```c3
fn void? NativeConditionVariable.destroy(&cond) @maydiscard
```

---

#### `func`
```c3
fn void? NativeConditionVariable.signal(&cond)
```

---

#### `func`
```c3
fn void? NativeConditionVariable.broadcast(&cond)
```

---

#### `func`
```c3
<*
 @require mtx.initialized : "Mutex was not initialized"
*>
fn void? NativeConditionVariable.wait(&cond, NativeMutex* mtx) @inline
```


---

#### `func`
```c3
<*
 @require mtx.initialized : "Mutex was not initialized"
 @return? thread::WAIT_TIMEOUT, thread::WAIT_FAILED
*>
fn void? NativeConditionVariable.wait_timeout(&cond, NativeMutex* mtx, ulong ms) @inline
```


---

#### `func`
```c3
<*
 @require mtx.initialized : "Mutex was not initialized"
 @return? thread::WAIT_TIMEOUT, thread::WAIT_FAILED
*>
fn void? NativeConditionVariable.wait_timeout_duration(&cond, NativeMutex* mtx, Duration duration) @inline
```


---

#### `func`
```c3
<*
 @require mtx.initialized : "Mutex was not initialized"
 @return? thread::WAIT_TIMEOUT, thread::WAIT_FAILED
*>
fn void? NativeConditionVariable.wait_until(&cond, NativeMutex* mtx, Time time) @inline
```


---

#### `func`
```c3
fn void? NativeThread.create(&thread, ThreadFn func, void* args)
```

---

#### `func`
```c3
fn void? NativeThread.detach(thread) @inline
```

---

#### `func`
```c3
fn void native_thread_exit(int result) @inline
```

---

#### `func`
```c3
fn void native_thread_yield()
```

---

#### `func`
```c3
fn void NativeOnceFlag.call_once(&flag, OnceFn func)
```

---

#### `func`
```c3
fn int? NativeThread.join(thread)
```

---

#### `func`
```c3
fn NativeThread native_thread_current()
```

---

#### `func`
```c3
fn bool NativeThread.equals(thread, NativeThread other)
```

---

#### `func`
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

#### `func`
```c3
<*
 @require !self.initialized : "ThreadPool must not be already initialized"
*>
fn void? ThreadPool.init(&self)
```


---

#### `func`
```c3
fn void? ThreadPool.destroy(&self)
```

Stop all the threads and cleanup the pool.
Any pending work will be dropped.

---

#### `func`
```c3
fn void? ThreadPool.stop_and_destroy(&self)
```

Stop all the threads and cleanup the pool.
Any pending work will be processed.

---

#### `func`
```c3
fn void? ThreadPool.push(&self, ThreadFn func, void* arg)
```

Push a new job to the pool.
Returns whether the queue is full, in which case the job is ignored.
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

#### `func`
```c3
<*
 @require !self.initialized : "ThreadPool must not be already initialized"
 @require threads > 0 && threads < 0x1000 : `Threads should be greater than 0 and less than 0x1000`
 @require queue_size < 0x10000 : `Queue size must be less than 65536`
*>
fn void? FixedThreadPool.init(&self, usz threads, usz queue_size = 0)
```


---

#### `func`
```c3
fn void? FixedThreadPool.destroy(&self)
```

Stop all the threads and cleanup the pool.
Any pending work will be dropped.

---

#### `func`
```c3
fn void? FixedThreadPool.stop_and_destroy(&self)
```

Stop all the threads and cleanup the pool.
Any pending work will be processed.

---

#### `func`
```c3
fn void? FixedThreadPool.push(&self, ThreadPoolFn func, args...)
```

Push a new job to the pool.
return Excuse if the queue is full, in which case the job is ignored.
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
const Time FAR_FUTURE
```

---

#### `FAR_PAST`
```c3
const Time FAR_PAST
```

---

#### `NANO_DURATION_ZERO`
```c3
const NanoDuration NANO_DURATION_ZERO
```

---

#### `US`
```c3
const Duration US
```

---

#### `MS`
```c3
const Duration MS
```

---

#### `SEC`
```c3
const Duration SEC
```

---

#### `MIN`
```c3
const Duration MIN
```

---

#### `HOUR`
```c3
const Duration HOUR
```

---

#### `DAY`
```c3
const Duration DAY
```

---

#### `WEEK`
```c3
const Duration WEEK
```

---

#### `MONTH`
```c3
const Duration MONTH
```

---

#### `YEAR`
```c3
const Duration YEAR
```

---

#### `FOREVER`
```c3
const Duration FOREVER
```

---

#### `DURATION_ZERO`
```c3
const Duration DURATION_ZERO
```

---

#### `func`
```c3
fn Duration us(long l) @inline
```

---

#### `func`
```c3
fn Duration ms(long l) @inline
```

---

#### `func`
```c3
fn Duration sec(long l) @inline
```

---

#### `func`
```c3
fn Duration min(long l) @inline
```

---

#### `func`
```c3
fn Duration hour(long l) @inline
```

---

#### `func`
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

#### `func`
```c3
fn Time now()
```

---

#### `func`
```c3
fn Time Time.add_seconds(time, long seconds)
```

---

#### `func`
```c3
fn Time Time.add_minutes(time, long minutes)
```

---

#### `func`
```c3
fn Time Time.add_hours(time, long hours)
```

---

#### `func`
```c3
fn Time Time.add_days(time, long days)
```

---

#### `func`
```c3
fn Time Time.add_weeks(time, long weeks)
```

---

#### `func`
```c3
fn Time Time.add_duration(time, Duration duration) @operator_s(+) @inline
```

---

#### `func`
```c3
fn Time Time.sub_duration(time, Duration duration) @operator(-) @inline
```

---

#### `func`
```c3
fn int Time.compare_to(time, Time other)
```

---

#### `func`
```c3
fn double Time.to_seconds(time)
```

---

#### `func`
```c3
fn Duration Time.diff_us(time, Time other) @operator(-)
```

---

#### `func`
```c3
fn double Time.diff_sec(time, Time other)
```

---

#### `func`
```c3
fn double Time.diff_min(time, Time other)
```

---

#### `func`
```c3
fn double Time.diff_hour(time, Time other)
```

---

#### `func`
```c3
fn double Time.diff_days(time, Time other)
```

---

#### `func`
```c3
fn double Time.diff_weeks(time, Time other)
```

---

#### `func`
```c3
fn double NanoDuration.to_sec(nd)
```

---

#### `func`
```c3
fn long NanoDuration.to_ms(nd)
```

---

#### `func`
```c3
fn Duration NanoDuration.to_duration(nd)
```

---

#### `func`
```c3
fn NanoDuration Duration.to_nano(td)
```

---

#### `func`
```c3
fn long Duration.to_ms(td)
```

---

#### `macro`
```c3
macro Duration Duration.mult(#td, long #val) @operator_s(*) @safemacro
```

---

#### `func`
```c3
fn usz? NanoDuration.to_format(&self, Formatter* formatter) @dynamic
```
### `std::time::clock`

---

#### `func`
```c3
fn Clock now()
```

---

#### `func`
```c3
fn NanoDuration Clock.mark(&self)
```

---

#### `func`
```c3
fn Clock Clock.add_nano_duration(self, NanoDuration nano) @operator_s(+) @inline
```

---

#### `func`
```c3
fn Clock Clock.sub_nano_duration(self, NanoDuration nano) @operator(-) @inline
```

---

#### `func`
```c3
fn Clock Clock.add_duration(self, Duration duration) @operator_s(+) @inline
```

---

#### `func`
```c3
fn Clock Clock.sub_duration(self, Duration duration) @operator(-) @inline
```

---

#### `func`
```c3
fn NanoDuration Clock.nano_diff(self, Clock other) @operator(-) @inline
```

---

#### `func`
```c3
fn NanoDuration Clock.to_now(self) @inline
```
### `std::time::datetime @if(env::LIBC)`

---

#### `func`
```c3
fn DateTime now()
```

---

#### `func`
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

#### `func`
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

#### `func`
```c3
fn TzDateTime DateTime.to_local(&self)
```

---

#### `func`
```c3
<*
 @require gmt_offset >= -12 * 3600 && gmt_offset <= 14 * 3600
*>
fn TzDateTime DateTime.with_gmt_offset(self, int gmt_offset)
```


Update timestamp to gmt_offset while keeping the date and time
values unchanged.

---

#### `func`
```c3
<*
 @require gmt_offset >= -12 * 3600 && gmt_offset <= 14 * 3600
*>
fn TzDateTime TzDateTime.with_gmt_offset(self, int gmt_offset)
```


Update timestamp to gmt_offset while keeping the date and time
values unchanged.

---

#### `func`
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

#### `func`
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

#### `func`
```c3
fn bool TzDateTime.eq(self, TzDateTime other) @operator(==) @inline
```

---

#### `func`
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

#### `func`
```c3
fn void DateTime.set_time(&self, Time time)
```

---

#### `func`
```c3
fn DateTime DateTime.add_us(&self, Duration d) @operator_s(+)
```

---

#### `func`
```c3
fn DateTime DateTime.sub_us(&self, Duration d) @operator(-)
```

---

#### `func`
```c3
fn DateTime DateTime.add_seconds(&self, int seconds)
```

---

#### `func`
```c3
fn DateTime DateTime.add_minutes(&self, int minutes)
```

---

#### `func`
```c3
fn DateTime DateTime.add_hours(&self, int hours)
```

---

#### `func`
```c3
fn DateTime DateTime.add_days(&self, int days)
```

---

#### `func`
```c3
fn DateTime DateTime.add_weeks(&self, int weeks)
```

---

#### `func`
```c3
fn DateTime DateTime.add_years(&self, int years)
```

---

#### `func`
```c3
fn DateTime DateTime.add_months(&self, int months)
```

---

#### `func`
```c3
fn TzDateTime TzDateTime.add_us(&self, Duration d) @operator_s(+)
```

---

#### `func`
```c3
fn TzDateTime TzDateTime.sub_us(&self, Duration d) @operator(-)
```

---

#### `func`
```c3
fn TzDateTime TzDateTime.add_seconds(&self, int seconds)
```

---

#### `func`
```c3
fn TzDateTime TzDateTime.add_minutes(&self, int minutes)
```

---

#### `func`
```c3
fn TzDateTime TzDateTime.add_hours(&self, int hours)
```

---

#### `func`
```c3
fn TzDateTime TzDateTime.add_days(&self, int days)
```

---

#### `func`
```c3
fn TzDateTime TzDateTime.add_weeks(&self, int weeks)
```

---

#### `func`
```c3
fn TzDateTime TzDateTime.add_years(&self, int years)
```

---

#### `func`
```c3
fn TzDateTime TzDateTime.add_months(&self, int months)
```

---

#### `func`
```c3
fn DateTime from_time(Time time)
```

---

#### `func`
```c3
<*
 @require gmt_offset >= -12 * 3600 && gmt_offset <= 14 * 3600
 @ensure time == return.time
*>
fn TzDateTime from_time_tz(Time time, int gmt_offset)
```


---

#### `func`
```c3
fn Time DateTime.to_time(&self) @inline
```

---

#### `func`
```c3
fn bool DateTime.after(&self, DateTime compare) @inline
```

---

#### `func`
```c3
fn bool DateTime.before(&self, DateTime compare) @inline
```

---

#### `func`
```c3
fn int DateTime.compare_to(&self, DateTime compare)
```

---

#### `func`
```c3
fn int DateTime.diff_years(&self, DateTime from)
```

---

#### `func`
```c3
fn double DateTime.diff_sec(self, DateTime from)
```

---

#### `func`
```c3
fn Duration DateTime.diff_us(self, DateTime from) @operator(-)
```

---

#### `func`
```c3
fn bool DateTime.eq(self, DateTime other) @operator(==) @inline
```

---

#### `DateTimeFormat`
```c3
enum DateTimeFormat
```

---

#### `func`
```c3
fn String format(Allocator allocator, DateTimeFormat type, TzDateTime dt)
```

---

#### `func`
```c3
fn String tformat(DateTimeFormat dt_format, TzDateTime dt)
```

---

#### `func`
```c3
fn String TzDateTime.format(self, Allocator allocator, DateTimeFormat dt_format)
```

---

#### `func`
```c3
fn String DateTime.format(self, Allocator allocator, DateTimeFormat dt_format)
```
### `std::time::os @if(env::DARWIN)`

---

#### `func`
```c3
fn Clock native_clock()
```
### `std::time::os @if(env::POSIX)`

---

#### `func`
```c3
fn Time native_timestamp()
```

---

#### `func`
```c3
fn Clock native_clock() @if(!env::DARWIN)
```
### `std::time::os @if(env::WIN32)`

---

#### `func`
```c3
fn Clock native_clock()
```

---

#### `func`
```c3
fn Time native_timestamp()
```
