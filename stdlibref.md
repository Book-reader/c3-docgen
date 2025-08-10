### `libc`
```c3
const int EXIT_FAILURE
```
```c3
const int EXIT_SUCCESS
```
```c3
const int RAND_MAX
```
```c3
alias WChar @if(env::WIN32) = Char16
```
```c3
alias WChar @if(!env::WIN32) = Char32
```
```c3
struct DivResult
```
```c3
struct LongDivResult
```
```c3
struct Fpos_t @if(!env::WIN32)
```
```c3
struct Mbstate_t @if(!env::WIN32)
```
```c3
fn Errno errno()
```
```c3
fn void errno_set(Errno e)
```
```c3
typedef Errno = inline CInt
```
```c3
alias TerminateFunction = fn void()
```
```c3
alias CompareFunction = fn int(void*, void*)
```
```c3
alias JmpBuf = uptr[$$JMP_BUF_SIZE]
```
```c3
alias Fd = CInt
```
```c3
alias Fpos_t @if(env::WIN32) = long
```
```c3
alias SignalFunction = fn void(CInt)
```
```c3
const CInt SIGHUP
```
```c3
const CInt SIGINT
```
```c3
const CInt SIGQUIT
```
```c3
const CInt SIGILL
```
```c3
const CInt SIGTRAP
```
```c3
const CInt SIGABRT
```
```c3
const CInt SIGBUS
```
```c3
const CInt SIGFPE
```
```c3
const CInt SIGKILL
```
```c3
const CInt SIGSEGV
```
```c3
const CInt SIGSYS
```
```c3
const CInt SIGPIPE
```
```c3
const CInt SIGALRM
```
```c3
const CInt SIGTERM
```
```c3
const CInt SIGURG
```
```c3
const CInt SIGSTOP
```
```c3
const CInt SIGTSTP
```
```c3
const CInt SIGCONT
```
```c3
const CInt SIGCHLD
```
```c3
alias Time_t = $typefrom(env::WIN32 ? long.typeid : CLong.typeid)
```
```c3
alias Off_t = $typefrom(env::WIN32 ? int.typeid : usz.typeid)
```
```c3
alias CFile = void*
```
```c3
const HAS_MALLOC_SIZE
```
```c3
const int SEEK_SET
```
```c3
const int SEEK_CUR
```
```c3
const int SEEK_END
```
```c3
const int _IOFBF
```
```c3
const int _IOLBF
```
```c3
const int _IONBF
```
```c3
const int BUFSIZ
```
```c3
const int EOF
```
```c3
const int FOPEN_MAX
```
```c3
const int FILENAME_MAX
```
```c3
macro bool libc_S_ISTYPE(value, mask) @builtin
```
```c3
const S_IFMT
```
```c3
const S_IFIFO
```
```c3
const S_IFCHR
```
```c3
const S_IFDIR
```
```c3
const S_IFBLK
```
```c3
const S_IFREG
```
```c3
const S_IFLNK
```
```c3
const S_IFSOCK
```
```c3
const S_ISUID
```
```c3
const S_ISGID
```
```c3
const S_ISVTX
```
```c3
const S_IRUSR
```
```c3
const S_IWUSR
```
```c3
const S_IXUSR
```
```c3
alias SeekIndex = CLong
```
```c3
struct Tm
```
```c3
struct TimeSpec
```
```c3
alias Clock_t @if(env::WIN32) = int
```
```c3
alias Clock_t @if(!env::WIN32) = CLong
```
```c3
alias TimeOffset @if(env::WASI) = int
```
```c3
alias TimeOffset @if(!env::WASI) = CLong
```
```c3
const int TIME_UTC
```
```c3
const CLOCKS_PER_SEC @if(env::WIN32)
```
```c3
const CLOCKS_PER_SEC @if(!env::WIN32)
```

Return a "timespec" from a duration.
```c3
<*
 @require self >= time::NANO_DURATION_ZERO
*>
```
```c3
fn TimeSpec NanoDuration.to_timespec(self) @inline
```

Convert a duration to a timespec.
```c3
<*
 @require self >= time::DURATION_ZERO
*>
```
```c3
fn TimeSpec Duration.to_timespec(self) @inline
```

Convert a timestamp to a timespec.
```c3
fn TimeSpec Time.to_timespec(self) @inline
```
### `libc @if(!env::LIBC)`
```c3
fn void longjmp(JmpBuf* buffer, CInt value) @weak @extern("longjmp") @nostrip
```
```c3
fn CInt setjmp(JmpBuf* buffer) @weak @extern("setjmp") @nostrip
```
```c3
fn void* malloc(usz size) @weak @extern("malloc") @nostrip
```
```c3
fn void* calloc(usz count, usz size) @weak @extern("calloc") @nostrip
```
```c3
fn void* free(void*) @weak @extern("free")
```
```c3
fn void* realloc(void* ptr, usz size) @weak @extern("realloc") @nostrip
```
```c3
fn void* memcpy(void* dest, void* src, usz n) @weak @extern("memcpy") @nostrip
```
```c3
fn void* memmove(void* dest, void* src, usz n) @weak @extern("memmove") @nostrip
```
```c3
fn void* memset(void* dest, CInt value, usz n) @weak @extern("memset") @nostrip
```
```c3
fn int fseek(CFile stream, SeekIndex offset, int whence) @weak @extern("fseek") @nostrip
```
```c3
fn CFile fopen(ZString filename, ZString mode) @weak @extern("fopen") @nostrip
```
```c3
fn CFile freopen(ZString filename, ZString mode, CFile stream) @weak @extern("fopen") @nostrip
```
```c3
fn usz fwrite(void* ptr, usz size, usz nmemb, CFile stream) @weak @extern("fwrite") @nostrip
```
```c3
fn usz fread(void* ptr, usz size, usz nmemb, CFile stream) @weak @extern("fread") @nostrip
```
```c3
fn CFile fclose(CFile) @weak @extern("fclose") @nostrip
```
```c3
fn int fflush(CFile stream) @weak @extern("fflush") @nostrip
```
```c3
fn int fputc(int c, CFile stream) @weak @extern("fputc") @nostrip
```
```c3
fn char* fgets(ZString str, int n, CFile stream) @weak @extern("fgets") @nostrip
```
```c3
fn int fgetc(CFile stream) @weak @extern("fgetc") @nostrip
```
```c3
fn int feof(CFile stream) @weak @extern("feof") @nostrip
```
```c3
fn int putc(int c, CFile stream) @weak @extern("putc") @nostrip
```
```c3
fn int putchar(int c) @weak @extern("putchar") @nostrip
```
```c3
fn int puts(ZString str) @weak @extern("puts") @nostrip
```
### `libc @if(env::ANDROID)`
```c3
alias Blksize_t = $typefrom(env::X86_64 ? long.typeid : CInt.typeid)
```
```c3
alias Nlink_t = $typefrom(env::X86_64 ? ulong.typeid : CUInt.typeid)
```
```c3
alias Blkcnt_t = long
```
```c3
alias Ino_t = ulong
```
```c3
alias Dev_t = ulong
```
```c3
alias Mode_t = uint
```
```c3
alias Ino64_t = ulong
```
```c3
alias Blkcnt64_t = long
```
```c3
struct Stat @if(env::X86_64)
```
```c3
struct Stat @if(!env::X86_64)
```
```c3
extern fn CInt stat(ZString path, Stat* stat)
```
### `libc @if(env::DARWIN || env::FREEBSD)`
```c3
extern fn usz malloc_size(void* ptr) @if(!env::FREEBSD)
```
```c3
macro CFile stdout()
```
```c3
macro CFile stderr()
```
### `libc @if(env::DARWIN)`
```c3
alias Dev_t = int
```
```c3
alias Mode_t = ushort
```
```c3
alias Nlink_t = ushort
```
```c3
alias Blkcnt_t = long
```
```c3
alias Blksize_t = int
```
```c3
alias Ino_t = ulong
```
```c3
struct Stat
```
```c3
extern fn int stat(ZString str, Stat* stat) @extern("stat64")
```
### `libc @if(env::FREEBSD)`
```c3
alias Blksize_t = int
```
```c3
alias Nlink_t = $typefrom(env::X86_64 ? ulong.typeid : CUInt.typeid)
```
```c3
alias Dev_t = ulong
```
```c3
alias Ino_t = ulong
```
```c3
alias Mode_t = ushort
```
```c3
alias Blkcnt_t = long
```
```c3
alias Fflags_t = uint
```
```c3
struct Stat @if(env::X86_64)
```
```c3
struct Stat @if(!env::X86_64)
```
```c3
extern fn CInt stat(ZString path, Stat* stat)
```
### `libc @if(env::LIBC)`
```c3
extern fn void abort()
```
```c3
macro CFile stdout()
```
```c3
macro CFile stderr()
```
### `libc @if(env::LINUX)`
```c3
alias Blksize_t = $typefrom(env::X86_64 ? long.typeid : CInt.typeid)
```
```c3
alias Nlink_t = $typefrom(env::X86_64 ? ulong.typeid : CUInt.typeid)
```
```c3
alias Blkcnt_t = long
```
```c3
alias Ino_t = ulong
```
```c3
alias Dev_t = ulong
```
```c3
alias Mode_t = uint
```
```c3
alias Ino64_t = ulong
```
```c3
alias Blkcnt64_t = long
```
```c3
struct Stat @if(env::X86_64)
```
```c3
struct Stat @if(!env::X86_64)
```
```c3
extern fn CInt stat(ZString path, Stat* stat)
```
### `libc @if(env::OPENBSD)`
```c3
alias Blksize_t = int
```
```c3
alias Nlink_t = $typefrom(env::X86_64 ? uint.typeid : CUInt.typeid)
```
```c3
alias Dev_t = int
```
```c3
alias Ino_t = ulong
```
```c3
alias Mode_t = uint
```
```c3
alias Blkcnt_t = long
```
```c3
alias Fflags_t = uint
```
```c3
struct Stat @if(env::X86_64)
```
```c3
struct Stat @if(!env::X86_64)
```
```c3
extern fn CInt stat(ZString path, Stat* stat)
```
### `libc @if(env::POSIX)`
```c3
const CInt SHUT_RD
```
```c3
const CInt SHUT_WR
```
```c3
const CInt SHUT_RDWR
```
```c3
extern fn CInt shutdown(Fd sockfd, CInt how)
```
```c3
struct Stack_t
```
```c3
extern fn CInt sigaltstack(Stack_t* ss, Stack_t* old_ss)
```
### `libc @if(env::WIN32)`
```c3
alias fdopen = _fdopen
```
```c3
alias close = _close
```
```c3
alias fileno = _fileno
```
```c3
alias isatty = _isatty
```
```c3
alias difftime = _difftime64
```
```c3
alias fseek = _fseeki64
```
```c3
alias ftell = _ftelli64
```
```c3
alias timegm = _mkgmtime64
```
```c3
alias mktime = _mktime64
```
```c3
extern fn CFile __acrt_iob_func(CInt c)
```
```c3
extern fn CInt get_system_info(SystemInfo*) @extern("GetSystemInfo")
```
### `libc::errno`
```c3
const Errno OK
```
```c3
const Errno EPERM
```
```c3
const Errno ENOENT
```
```c3
const Errno ESRCH
```
```c3
const Errno EINTR
```
```c3
const Errno EIO
```
```c3
const Errno ENXIO
```
```c3
const Errno E2BIG
```
```c3
const Errno ENOEXEC
```
```c3
const Errno EBADF
```
```c3
const Errno ECHILD
```
```c3
const Errno EAGAIN @if(env::DARWIN)
```
```c3
const Errno EAGAIN @if(!env::DARWIN)
```
```c3
const Errno ENOMEM
```
```c3
const Errno EACCES
```
```c3
const Errno EFAULT
```
```c3
const Errno ENOTBLK
```
```c3
const Errno EBUSY
```
```c3
const Errno EEXIST
```
```c3
const Errno EXDEV
```
```c3
const Errno ENODEV
```
```c3
const Errno ENOTDIR
```
```c3
const Errno EISDIR
```
```c3
const Errno EINVAL
```
```c3
const Errno ENFILE
```
```c3
const Errno EMFILE
```
```c3
const Errno ENOTTY
```
```c3
const Errno ETXTBSY
```
```c3
const Errno EFBIG
```
```c3
const Errno ENOSPC
```
```c3
const Errno ESPIPE
```
```c3
const Errno EROFS
```
```c3
const Errno EMLINK
```
```c3
const Errno EPIPE
```
```c3
const Errno EDOM
```
```c3
const Errno ERANGE
```
### `libc::errno @if(!env::WIN32 && !env::DARWIN)`
```c3
const Errno EDEADLK
```
```c3
const Errno ENAMETOOLONG
```
```c3
const Errno ENOTEMPTY
```
```c3
const Errno ELOOP
```
```c3
const Errno EWOULDBLOCK
```
```c3
const Errno EOVERFLOW
```
```c3
const Errno ENOTSOCK
```
```c3
const Errno EOPNOTSUPP
```
```c3
const Errno EADDRINUSE
```
```c3
const Errno EADDRNOTAVAIL
```
```c3
const Errno ENETDOWN
```
```c3
const Errno ENETUNREACH
```
```c3
const Errno ENETRESET
```
```c3
const Errno ECONNRESET
```
```c3
const Errno EISCONN
```
```c3
const Errno ETIMEDOUT
```
```c3
const Errno ECONNREFUSED
```
```c3
const Errno EALREADY
```
```c3
const Errno EINPROGRESS
```
```c3
const Errno EDQUOT
```
### `libc::errno @if(env::DARWIN)`
```c3
const Errno EWOULDBLOCK
```
```c3
const Errno EDEADLK
```
```c3
const Errno EINPROGRESS
```
```c3
const Errno EALREADY
```
```c3
const Errno ENOTSOCK
```
```c3
const Errno EDESTADDRREQ
```
```c3
const Errno EMSGSIZE
```
```c3
const Errno EPROTOTYPE
```
```c3
const Errno ENOPROTOOPT
```
```c3
const Errno EPROTONOSUPPORT
```
```c3
const Errno ESOCKTNOSUPPORT
```
```c3
const Errno ENOTSUP
```
```c3
const Errno EPFNOSUPPORT
```
```c3
const Errno EAFNOSUPPORT
```
```c3
const Errno EADDRINUSE
```
```c3
const Errno EADDRNOTAVAIL
```
```c3
const Errno ENETDOWN
```
```c3
const Errno ENETUNREACH
```
```c3
const Errno ENETRESET
```
```c3
const Errno ECONNABORTED
```
```c3
const Errno ECONNRESET
```
```c3
const Errno ENOBUFS
```
```c3
const Errno EISCONN
```
```c3
const Errno ENOTCONN
```
```c3
const Errno ESHUTDOWN
```
```c3
const Errno ETIMEDOUT
```
```c3
const Errno ECONNREFUSED
```
```c3
const Errno ELOOP
```
```c3
const Errno ENAMETOOLONG
```
```c3
const Errno EHOSTDOWN
```
```c3
const Errno EHOSTUNREACH
```
```c3
const Errno ENOTEMPTY
```
```c3
const Errno EPROCLIM
```
```c3
const Errno EUSERS
```
```c3
const Errno EDQUOT
```
```c3
const Errno ESTALE
```
```c3
const Errno EBADRPC
```
```c3
const Errno ERPCMISMATCH
```
```c3
const Errno EPROGUNAVAIL
```
```c3
const Errno EPROGMISMATCH
```
```c3
const Errno EPROCUNAVAIL
```
```c3
const Errno ENOLCK
```
```c3
const Errno ENOSYS
```
```c3
const Errno EFTYPE
```
```c3
const Errno EAUTH
```
```c3
const Errno ENEEDAUTH
```
```c3
const Errno EPWROFF
```
```c3
const Errno EDEVERR
```
```c3
const Errno EOVERFLOW
```
```c3
const Errno EBADEXEC
```
```c3
const Errno EBADARCH
```
```c3
const Errno ESHLIBVERS
```
```c3
const Errno EBADMACHO
```
```c3
const Errno ECANCELED
```
```c3
const Errno EIDRM
```
```c3
const Errno ENOMSG
```
```c3
const Errno EILSEQ
```
```c3
const Errno ENOATTR
```
```c3
const Errno EBADMSG
```
```c3
const Errno EMULTIHOP
```
```c3
const Errno ENODATA
```
```c3
const Errno ENOLINK
```
```c3
const Errno ENOSR
```
```c3
const Errno ENOSTR
```
```c3
const Errno EPROTO
```
```c3
const Errno ETIME
```
```c3
const Errno EOPNOTSUPP
```
### `libc::errno @if(env::WIN32)`
```c3
const Errno EDEADLK
```
```c3
const Errno ENAMETOOLONG
```
```c3
const Errno ENOTEMPTY
```
```c3
const Errno ELOOP
```
```c3
const Errno EOVERFLOW
```
```c3
const Errno ENETDOWN
```
```c3
const Errno ECONNRESET
```
```c3
const Errno ENETUNREACH
```
```c3
const Errno ENETRESET
```
```c3
const Errno EOPNOTSUPP
```
```c3
const Errno ETIMEDOUT
```
```c3
const Errno EALREADY
```
```c3
const Errno EINPROGRESS
```
```c3
const Errno EDQUOT
```
```c3
const Errno EWOULDBLOCK
```
### `libc::os @if(env::LIBC)`
```c3
extern fn int* __errno_location() @if(env::LINUX)
```
```c3
macro void errno_set(int err) @if(env::WIN32)
```
```c3
extern fn void _get_errno(int* result) @if(env::WIN32)
```
### `libc::termios @if(!env::LIBC ||| !env::POSIX)`
```c3
typedef Cc = char
```
```c3
typedef Speed = CUInt
```
```c3
typedef Tcflags = CUInt
```
```c3
struct Termios
```
```c3
fn CInt tcgetattr(Fd fd, Termios* self)
```
```c3
fn CInt tcsetattr(Fd fd, CInt optional_actions, Termios* self)
```
```c3
fn CInt tcsendbreak(Fd fd, CInt duration)
```
```c3
fn CInt tcdrain(Fd fd)
```
```c3
fn CInt tcflush(Fd fd, CInt queue_selector)
```
```c3
fn CInt tcflow(Fd fd, CInt action)
```
```c3
fn Speed cfgetospeed(Termios* self)
```
```c3
fn Speed cfgetispeed(Termios* self)
```
```c3
fn CInt cfsetospeed(Termios* self, Speed speed)
```
```c3
fn CInt cfsetispeed(Termios* self, Speed speed)
```
```c3
fn int sendBreak(Fd fd, int duration)
```
```c3
fn int drain(Fd fd)
```
```c3
fn int flush(Fd fd, int queue_selector)
```
```c3
fn int flow(Fd fd, int action)
```
```c3
fn Speed Termios.getOSpeed(Termios* self)
```
```c3
fn Speed Termios.getISpeed(Termios* self)
```
```c3
fn int Termios.setOSpeed(Termios* self, Speed speed)
```
```c3
fn int Termios.setISpeed(Termios* self, Speed speed)
```
```c3
fn int Termios.getAttr(Termios* self, Fd fd)
```
```c3
fn int Termios.setAttr(Termios* self, Fd fd, int optional_actions)
```
### `libc::termios @if(env::LIBC &&& env::POSIX)`
```c3
fn int sendBreak(Fd fd, int duration)
```
```c3
fn int drain(Fd fd)
```
```c3
fn int flush(Fd fd, int queue_selector)
```
```c3
fn int flow(Fd fd, int action)
```
```c3
fn Speed Termios.getOSpeed(Termios* self)
```
```c3
fn Speed Termios.getISpeed(Termios* self)
```
```c3
fn int Termios.setOSpeed(Termios* self, Speed speed)
```
```c3
fn int Termios.setISpeed(Termios* self, Speed speed)
```
```c3
fn int Termios.getAttr(Termios* self, Fd fd)
```
```c3
fn int Termios.setAttr(Termios* self, Fd fd, Tcactions optional_actions)
```
### `std::ascii`
```c3
macro bool in_range_m(c, start, len)
```
```c3
macro bool is_lower_m(c)
```
```c3
macro bool is_upper_m(c)
```
```c3
macro bool is_digit_m(c)
```
```c3
macro bool is_bdigit_m(c)
```
```c3
macro bool is_odigit_m(c)
```
```c3
macro bool is_xdigit_m(c)
```
```c3
macro bool is_alpha_m(c)
```
```c3
macro bool is_print_m(c)
```
```c3
macro bool is_graph_m(c)
```
```c3
macro bool is_space_m(c)
```
```c3
macro bool is_alnum_m(c)
```
```c3
macro bool is_punct_m(c)
```
```c3
macro bool is_blank_m(c)
```
```c3
macro bool is_cntrl_m(c)
```
```c3
macro to_lower_m(c)
```
```c3
macro to_upper_m(c)
```
```c3
fn bool in_range(char c, char start, char len)
```
```c3
fn bool char.in_range(char c, char start, char len)
```
```c3
fn bool uint.in_range(uint c, uint start, uint len)
```
```c3
fn bool uint.is_lower(uint c)  @deprecated
```
```c3
fn bool uint.is_upper(uint c)  @deprecated
```
```c3
fn bool uint.is_digit(uint c)  @deprecated
```
```c3
fn bool uint.is_bdigit(uint c) @deprecated
```
```c3
fn bool uint.is_odigit(uint c) @deprecated
```
```c3
fn bool uint.is_xdigit(uint c) @deprecated
```
```c3
fn bool uint.is_alpha(uint c)  @deprecated
```
```c3
fn bool uint.is_print(uint c)  @deprecated
```
```c3
fn bool uint.is_graph(uint c)  @deprecated
```
```c3
fn bool uint.is_space(uint c)  @deprecated
```
```c3
fn bool uint.is_alnum(uint c)  @deprecated
```
```c3
fn bool uint.is_punct(uint c)  @deprecated
```
```c3
fn bool uint.is_blank(uint c)  @deprecated
```
```c3
fn bool uint.is_cntrl(uint c)  @deprecated
```
```c3
fn uint uint.to_lower(uint c)  @deprecated
```
```c3
fn uint uint.to_upper(uint c)  @deprecated
```
### `std::atomic`
```c3
macro bool is_native_atomic_type($Type)
```

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
```
```c3
macro fetch_add(ptr, y, AtomicOrdering $ordering = SEQ_CONSISTENT, bool $volatile = false, usz $alignment = 0)
```

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
```
```c3
macro fetch_sub(ptr, y, AtomicOrdering $ordering = SEQ_CONSISTENT, bool $volatile = false, usz $alignment = 0)
```

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
```
```c3
macro fetch_mul(ptr, y, AtomicOrdering $ordering = SEQ_CONSISTENT)
```

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
```
```c3
macro fetch_div(ptr, y, AtomicOrdering $ordering = SEQ_CONSISTENT)
```

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
```
```c3
macro fetch_or(ptr, y, AtomicOrdering $ordering = SEQ_CONSISTENT, bool $volatile = false, usz $alignment = 0)
```

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
```
```c3
macro fetch_xor(ptr, y, AtomicOrdering $ordering = SEQ_CONSISTENT, bool $volatile = false, usz $alignment = 0)
```

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
```
```c3
macro fetch_and(ptr, y, AtomicOrdering $ordering = SEQ_CONSISTENT, bool $volatile = false, usz $alignment = 0)
```

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
```
```c3
macro fetch_shift_right(ptr, y, AtomicOrdering $ordering = SEQ_CONSISTENT)
```

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
```
```c3
macro fetch_shift_left(ptr, y, AtomicOrdering $ordering = SEQ_CONSISTENT)
```

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
```
```c3
macro flag_set(ptr, AtomicOrdering $ordering = SEQ_CONSISTENT)
```

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
```
```c3
macro flag_clear(ptr, AtomicOrdering $ordering = SEQ_CONSISTENT)
```

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
```
```c3
macro fetch_max(ptr, y, AtomicOrdering $ordering = SEQ_CONSISTENT, bool $volatile = false, usz $alignment = 0)
```

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
```
```c3
macro fetch_min(ptr, y, AtomicOrdering $ordering = SEQ_CONSISTENT, bool $volatile = false, usz $alignment = 0)
```
```c3
macro @__atomic_compare_exchange_ordering_failure(ptr, expected, desired, $success, failure, $alignment)
```
```c3
macro @__atomic_compare_exchange_ordering_success(ptr, expected, desired, success, failure, $alignment)
```
```c3
fn CInt __atomic_compare_exchange(CInt size, any ptr, any expected, any desired, CInt success, CInt failure) @weak @export("__atomic_compare_exchange")
```
### `std::atomic::types{Type}`
```c3
struct Atomic
```

Loads data atomically, by default this uses SEQ_CONSISTENT ordering.
```c3
<*
 @param ordering : "The ordering, cannot be release or acquire-release."
 @require ordering != RELEASE && ordering != ACQUIRE_RELEASE : "Release and acquire-release are not valid for load"
*>
```
```c3
macro Type Atomic.load(&self, AtomicOrdering ordering = SEQ_CONSISTENT)
```

Stores data atomically, by default this uses SEQ_CONSISTENT ordering.
```c3
<*
 @param ordering : "The ordering, cannot be acquire or acquire-release."
 @require ordering != ACQUIRE && ordering != ACQUIRE_RELEASE : "Acquire and acquire-release are not valid for store"
*>
```
```c3
macro void Atomic.store(&self, Type value, AtomicOrdering ordering = SEQ_CONSISTENT)
```
```c3
macro Type Atomic.add(&self, Type value, AtomicOrdering ordering = SEQ_CONSISTENT)
```
```c3
macro Type Atomic.sub(&self, Type value, AtomicOrdering ordering = SEQ_CONSISTENT)
```
```c3
macro Type Atomic.mul(&self, Type value, AtomicOrdering ordering = SEQ_CONSISTENT)
```
```c3
macro Type Atomic.div(&self, Type value, AtomicOrdering ordering = SEQ_CONSISTENT)
```
```c3
macro Type Atomic.max(&self, Type value, AtomicOrdering ordering = SEQ_CONSISTENT)
```
```c3
macro Type Atomic.min(&self, Type value, AtomicOrdering ordering = SEQ_CONSISTENT)
```
```c3
macro Type Atomic.or(&self, Type value, AtomicOrdering ordering = SEQ_CONSISTENT) @if(types::flat_kind(Type) != FLOAT)
```
```c3
macro Type Atomic.xor(&self, Type value, AtomicOrdering ordering = SEQ_CONSISTENT) @if(types::flat_kind(Type) != FLOAT)
```
```c3
macro Type Atomic.and(&self, Type value, AtomicOrdering ordering = SEQ_CONSISTENT) @if(types::flat_kind(Type) != FLOAT)
```
```c3
macro Type Atomic.shr(&self, Type amount, AtomicOrdering ordering = SEQ_CONSISTENT) @if(types::flat_kind(Type) != FLOAT)
```
```c3
macro Type Atomic.shl(&self, Type amount, AtomicOrdering ordering = SEQ_CONSISTENT) @if(types::flat_kind(Type) != FLOAT)
```
```c3
macro Type Atomic.set(&self, AtomicOrdering ordering = SEQ_CONSISTENT) @if(types::flat_kind(Type) == BOOL)
```
```c3
macro Type Atomic.clear(&self, AtomicOrdering ordering = SEQ_CONSISTENT) @if(types::flat_kind(Type) == BOOL)
```
### `std::bits`

```c3
<*
 @require types::is_intlike($typeof(i)) : `The input must be an integer or integer vector`
*>
```
```c3
macro reverse(i)
```

```c3
<*
 @require types::is_intlike($typeof(i)) : `The input must be an integer or integer vector`
*>
```
```c3
macro bswap(i) @builtin
```
```c3
macro uint[<*>].popcount(self)
```
```c3
macro uint[<*>].ctz(self)
```
```c3
macro uint[<*>].clz(self)
```
```c3
macro uint[<*>] uint[<*>].fshl(hi, uint[<*>] lo, uint[<*>] shift)
```
```c3
macro uint[<*>] uint[<*>].fshr(hi, uint[<*>] lo, uint[<*>] shift)
```
```c3
macro uint[<*>] uint[<*>].rotl(self, uint[<*>] shift)
```
```c3
macro uint[<*>] uint[<*>].rotr(self, uint[<*>] shift)
```
```c3
macro int[<*>].popcount(self)
```
```c3
macro int[<*>].ctz(self)
```
```c3
macro int[<*>].clz(self)
```
```c3
macro int[<*>] int[<*>].fshl(hi, int[<*>] lo, int[<*>] shift)
```
```c3
macro int[<*>] int[<*>].fshr(hi, int[<*>] lo, int[<*>] shift)
```
```c3
macro int[<*>] int[<*>].rotl(self, int[<*>] shift)
```
```c3
macro int[<*>] int[<*>].rotr(self, int[<*>] shift)
```
```c3
macro ushort[<*>].popcount(self)
```
```c3
macro ushort[<*>].ctz(self)
```
```c3
macro ushort[<*>].clz(self)
```
```c3
macro ushort[<*>] ushort[<*>].fshl(hi, ushort[<*>] lo, ushort[<*>] shift)
```
```c3
macro ushort[<*>] ushort[<*>].fshr(hi, ushort[<*>] lo, ushort[<*>] shift)
```
```c3
macro ushort[<*>] ushort[<*>].rotl(self, ushort[<*>] shift)
```
```c3
macro ushort[<*>] ushort[<*>].rotr(self, ushort[<*>] shift)
```
```c3
macro short[<*>].popcount(self)
```
```c3
macro short[<*>].ctz(self)
```
```c3
macro short[<*>].clz(self)
```
```c3
macro short[<*>] short[<*>].fshl(hi, short[<*>] lo, short[<*>] shift)
```
```c3
macro short[<*>] short[<*>].fshr(hi, short[<*>] lo, short[<*>] shift)
```
```c3
macro short[<*>] short[<*>].rotl(self, short[<*>] shift)
```
```c3
macro short[<*>] short[<*>].rotr(self, short[<*>] shift)
```
```c3
macro char[<*>].popcount(self)
```
```c3
macro char[<*>].ctz(self)
```
```c3
macro char[<*>].clz(self)
```
```c3
macro char[<*>] char[<*>].fshl(hi, char[<*>] lo, char[<*>] shift)
```
```c3
macro char[<*>] char[<*>].fshr(hi, char[<*>] lo, char[<*>] shift)
```
```c3
macro char[<*>] char[<*>].rotl(self, char[<*>] shift)
```
```c3
macro char[<*>] char[<*>].rotr(self, char[<*>] shift)
```
```c3
macro ichar[<*>].popcount(self)
```
```c3
macro ichar[<*>].ctz(self)
```
```c3
macro ichar[<*>].clz(self)
```
```c3
macro ichar[<*>] ichar[<*>].fshl(hi, ichar[<*>] lo, ichar[<*>] shift)
```
```c3
macro ichar[<*>] ichar[<*>].fshr(hi, ichar[<*>] lo, ichar[<*>] shift)
```
```c3
macro ichar[<*>] ichar[<*>].rotl(self, ichar[<*>] shift)
```
```c3
macro ichar[<*>] ichar[<*>].rotr(self, ichar[<*>] shift)
```
```c3
macro ulong[<*>].popcount(self)
```
```c3
macro ulong[<*>].ctz(self)
```
```c3
macro ulong[<*>].clz(self)
```
```c3
macro ulong[<*>] ulong[<*>].fshl(hi, ulong[<*>] lo, ulong[<*>] shift)
```
```c3
macro ulong[<*>] ulong[<*>].fshr(hi, ulong[<*>] lo, ulong[<*>] shift)
```
```c3
macro ulong[<*>] ulong[<*>].rotl(self, ulong[<*>] shift)
```
```c3
macro ulong[<*>] ulong[<*>].rotr(self, ulong[<*>] shift)
```
```c3
macro long[<*>].popcount(self)
```
```c3
macro long[<*>].ctz(self)
```
```c3
macro long[<*>].clz(self)
```
```c3
macro long[<*>] long[<*>].fshl(hi, long[<*>] lo, long[<*>] shift)
```
```c3
macro long[<*>] long[<*>].fshr(hi, long[<*>] lo, long[<*>] shift)
```
```c3
macro long[<*>] long[<*>].rotl(self, long[<*>] shift)
```
```c3
macro long[<*>] long[<*>].rotr(self, long[<*>] shift)
```
```c3
macro uint128[<*>].popcount(self)
```
```c3
macro uint128[<*>].ctz(self)
```
```c3
macro uint128[<*>].clz(self)
```
```c3
macro uint128[<*>] uint128[<*>].fshl(hi, uint128[<*>] lo, uint128[<*>] shift)
```
```c3
macro uint128[<*>] uint128[<*>].fshr(hi, uint128[<*>] lo, uint128[<*>] shift)
```
```c3
macro uint128[<*>] uint128[<*>].rotl(self, uint128[<*>] shift)
```
```c3
macro uint128[<*>] uint128[<*>].rotr(self, uint128[<*>] shift)
```
```c3
macro int128[<*>].popcount(self)
```
```c3
macro int128[<*>].ctz(self)
```
```c3
macro int128[<*>].clz(self)
```
```c3
macro int128[<*>] int128[<*>].fshl(hi, int128[<*>] lo, int128[<*>] shift)
```
```c3
macro int128[<*>] int128[<*>].fshr(hi, int128[<*>] lo, int128[<*>] shift)
```
```c3
macro int128[<*>] int128[<*>].rotl(self, int128[<*>] shift)
```
```c3
macro int128[<*>] int128[<*>].rotr(self, int128[<*>] shift)
```
```c3
macro uint.popcount(self)
```
```c3
macro uint.ctz(self)
```
```c3
macro uint.clz(self)
```
```c3
macro uint uint.fshl(hi, uint lo, uint shift)
```
```c3
macro uint uint.fshr(hi, uint lo, uint shift)
```
```c3
macro uint uint.rotl(self, uint shift)
```
```c3
macro uint uint.rotr(self, uint shift)
```
```c3
macro int.popcount(self)
```
```c3
macro int.ctz(self)
```
```c3
macro int.clz(self)
```
```c3
macro int int.fshl(hi, int lo, int shift)
```
```c3
macro int int.fshr(hi, int lo, int shift)
```
```c3
macro int int.rotl(self, int shift)
```
```c3
macro int int.rotr(self, int shift)
```
```c3
macro ushort.popcount(self)
```
```c3
macro ushort.ctz(self)
```
```c3
macro ushort.clz(self)
```
```c3
macro ushort ushort.fshl(hi, ushort lo, ushort shift)
```
```c3
macro ushort ushort.fshr(hi, ushort lo, ushort shift)
```
```c3
macro ushort ushort.rotl(self, ushort shift)
```
```c3
macro ushort ushort.rotr(self, ushort shift)
```
```c3
macro short.popcount(self)
```
```c3
macro short.ctz(self)
```
```c3
macro short.clz(self)
```
```c3
macro short short.fshl(hi, short lo, short shift)
```
```c3
macro short short.fshr(hi, short lo, short shift)
```
```c3
macro short short.rotl(self, short shift)
```
```c3
macro short short.rotr(self, short shift)
```
```c3
macro char.popcount(self)
```
```c3
macro char.ctz(self)
```
```c3
macro char.clz(self)
```
```c3
macro char char.fshl(hi, char lo, char shift)
```
```c3
macro char char.fshr(hi, char lo, char shift)
```
```c3
macro char char.rotl(self, char shift)
```
```c3
macro char char.rotr(self, char shift)
```
```c3
macro ichar.popcount(self)
```
```c3
macro ichar.ctz(self)
```
```c3
macro ichar.clz(self)
```
```c3
macro ichar ichar.fshl(hi, ichar lo, ichar shift)
```
```c3
macro ichar ichar.fshr(hi, ichar lo, ichar shift)
```
```c3
macro ichar ichar.rotl(self, ichar shift)
```
```c3
macro ichar ichar.rotr(self, ichar shift)
```
```c3
macro ulong.popcount(self)
```
```c3
macro ulong.ctz(self)
```
```c3
macro ulong.clz(self)
```
```c3
macro ulong ulong.fshl(hi, ulong lo, ulong shift)
```
```c3
macro ulong ulong.fshr(hi, ulong lo, ulong shift)
```
```c3
macro ulong ulong.rotl(self, ulong shift)
```
```c3
macro ulong ulong.rotr(self, ulong shift)
```
```c3
macro long.popcount(self)
```
```c3
macro long.ctz(self)
```
```c3
macro long.clz(self)
```
```c3
macro long long.fshl(hi, long lo, long shift)
```
```c3
macro long long.fshr(hi, long lo, long shift)
```
```c3
macro long long.rotl(self, long shift)
```
```c3
macro long long.rotr(self, long shift)
```
```c3
macro uint128.popcount(self)
```
```c3
macro uint128.ctz(self)
```
```c3
macro uint128.clz(self)
```
```c3
macro uint128 uint128.fshl(hi, uint128 lo, uint128 shift)
```
```c3
macro uint128 uint128.fshr(hi, uint128 lo, uint128 shift)
```
```c3
macro uint128 uint128.rotl(self, uint128 shift)
```
```c3
macro uint128 uint128.rotr(self, uint128 shift)
```
```c3
macro int128.popcount(self)
```
```c3
macro int128.ctz(self)
```
```c3
macro int128.clz(self)
```
```c3
macro int128 int128.fshl(hi, int128 lo, int128 shift)
```
```c3
macro int128 int128.fshr(hi, int128 lo, int128 shift)
```
```c3
macro int128 int128.rotl(self, int128 shift)
```
```c3
macro int128 int128.rotr(self, int128 shift)
```
### `std::collections::anylist`
```c3
alias AnyPredicate = fn bool(any value)
```
```c3
alias AnyTest = fn bool(any type, any context)
```

The AnyList contains a heterogenous set of types. Anything placed in the
list will shallowly copied in order to be stored as an `any`. This means
that the list will copy and free its elements.

However, because we're getting `any` values back when we pop, those operations
need to take an allocator, as we can only copy then pop then return the copy.

If we're not doing pop, then things are easier, since we can just hand over
the existing any.
```c3
struct AnyList (Printable)
```

Initialize the list. If not initialized then it will use the temp allocator
when something is pushed to it.
```c3
<*
 @param [&inout] allocator : "The allocator to use"
 @param initial_capacity : "The initial capacity to reserve, defaults to 16"
*>
```
```c3
fn AnyList* AnyList.init(&self, Allocator allocator, usz initial_capacity = 16)
```

Initialize the list using the temp allocator.
```c3
<*
 @param initial_capacity : "The initial capacity to reserve"
*>
```
```c3
fn AnyList* AnyList.tinit(&self, usz initial_capacity = 16)
```
```c3
fn bool AnyList.is_initialized(&self) @inline
```

Push an element on the list by cloning it.
```c3
macro void AnyList.push(&self, element)
```

Free a retained element removed using *_retained.
```c3
fn void AnyList.free_element(&self, any element) @inline
```

Pop a value who's type is known. If the type is incorrect, this
will still pop the element.
```c3
<*
 @param $Type : "The type we assume the value has"
 @return "The last value as the type given"
 @return? TYPE_MISMATCH, NO_MORE_ELEMENT
*>
```
```c3
macro AnyList.pop(&self, $Type)
```

Copy the last value, pop it and return the copy of it.
```c3
<*
 @param [&inout] allocator : "The allocator to use for copying"
 @return "A copy of the last value if it exists"
 @return? NO_MORE_ELEMENT
*>
```
```c3
fn any? AnyList.copy_pop(&self, Allocator allocator)
```

Copy the last value, pop it and return the copy of it.
```c3
<*
 @return "A temp copy of the last value if it exists"
 @return? NO_MORE_ELEMENT
*>
```
```c3
fn any? AnyList.tcopy_pop(&self)
```

Pop the last value. It must later be released using `list.free_element()`.
```c3
<*
 @return "The last value if it exists"
 @return? NO_MORE_ELEMENT
*>
```
```c3
fn any? AnyList.pop_retained(&self)
```

Remove all elements in the list.
```c3
fn void AnyList.clear(&self)
```

Pop a value who's type is known. If the type is incorrect, this
will still pop the element.
```c3
<*
 @param $Type : "The type we assume the value has"
 @return "The first value as the type given"
 @return? TYPE_MISMATCH, NO_MORE_ELEMENT
*>
```
```c3
macro AnyList.pop_first(&self, $Type)
```

Pop the first value. It must later be released using `list.free_element()`.
```c3
<*
 @return "The first value if it exists"
 @return? NO_MORE_ELEMENT
*>
```
```c3
fn any? AnyList.pop_first_retained(&self)
```

Copy the first value, pop it and return the copy of it.
```c3
<*
 @param [&inout] allocator : "The allocator to use for copying"
 @return "A copy of the first value if it exists"
 @return? NO_MORE_ELEMENT
*>
```
```c3
fn any? AnyList.copy_pop_first(&self, Allocator allocator)
```

Copy the first value, pop it and return the temp copy of it.
```c3
<*
 @return "A temp copy of the first value if it exists"
 @return? NO_MORE_ELEMENT
*>
```
```c3
fn any? AnyList.tcopy_pop_first(&self)
```

Remove the element at the particular index.
```c3
<*
 @param index : "The index of the element to remove"
 @require index < self.size
*>
```
```c3
fn void AnyList.remove_at(&self, usz index)
```

Add all the elements in another AnyList.
```c3
<*
 @param [&in] other_list : "The list to add"
*>
```
```c3
fn void AnyList.add_all(&self, AnyList* other_list)
```

Reverse the order of the elements in the list.
```c3
fn void AnyList.reverse(&self)
```

Return a view of the data as a slice.
```c3
<*
 @return "The slice view"
*>
```
```c3
fn any[] AnyList.array_view(&self)
```

Push an element to the front of the list.
```c3
<*
 @param value : "The value to push to the list"
*>
```
```c3
macro void AnyList.push_front(&self, value)
```

Insert an element at a particular index.
```c3
<*
 @param index : "the index where the element should be inserted"
 @param type : "the value to insert"
 @require index <= self.size : "The index is out of bounds"
*>
```
```c3
macro void AnyList.insert_at(&self, usz index, type)
```

Remove the last element in the list. The list may not be empty.
```c3
<*
 @require self.size > 0 : "The list was already empty"
*>
```
```c3
fn void AnyList.remove_last(&self)
```

Remove the first element in the list, the list may not be empty.
```c3
<*
 @require self.size > 0
*>
```
```c3
fn void AnyList.remove_first(&self)
```

Return the first element by value, assuming it is the given type.
```c3
<*
 @param $Type : "The type of the first element"
 @return "The first element"
 @return? TYPE_MISMATCH, NO_MORE_ELEMENT
*>
```
```c3
macro AnyList.first(&self, $Type)
```

Return the first element
```c3
<*
 @return "The first element"
 @return? NO_MORE_ELEMENT
*>
```
```c3
fn any? AnyList.first_any(&self) @inline
```

Return the last element by value, assuming it is the given type.
```c3
<*
 @param $Type : "The type of the last element"
 @return "The last element"
 @return? TYPE_MISMATCH, NO_MORE_ELEMENT
*>
```
```c3
macro AnyList.last(&self, $Type)
```

Return the last element
```c3
<*
 @return "The last element"
 @return? NO_MORE_ELEMENT
*>
```
```c3
fn any? AnyList.last_any(&self) @inline
```

Return whether the list is empty.
```c3
<*
 @return "True if the list is empty"
*>
```
```c3
fn bool AnyList.is_empty(&self) @inline
```

Return the length of the list.
```c3
<*
 @return "The number of elements in the list"
*>
```
```c3
fn usz AnyList.len(&self) @operator(len) @inline
```

Return an element in the list by value, assuming it is the given type.
```c3
<*
 @param index : "The index of the element to retrieve"
 @param $Type : "The type of the element"
 @return "The element at the index"
 @return? TYPE_MISMATCH, NO_MORE_ELEMENT
 @require index < self.size : "Index out of range"
*>
```
```c3
macro AnyList.get(&self, usz index, $Type)
```

Return an element in the list.
```c3
<*
 @param index : "The index of the element to retrieve"
 @return "The element at the index"
 @return? TYPE_MISMATCH, NO_MORE_ELEMENT
 @require index < self.size : "Index out of range"
*>
```
```c3
fn any AnyList.get_any(&self, usz index) @inline @operator([])
```

Completely free and clear a list.
```c3
fn void AnyList.free(&self)
```

Swap two elements in a list.
```c3
<*
 @param i : "Index of one of the elements"
 @param j : "Index of the other element"
 @require i < self.size : "The first index is out of range"
 @require j < self.size : "The second index is out of range"
*>
```
```c3
fn void AnyList.swap(&self, usz i, usz j)
```

Print the list to a formatter.
```c3
fn usz? AnyList.to_format(&self, Formatter* formatter) @dynamic
```

Remove any elements matching the predicate.
```c3
<*
 @param filter : "The function to determine if it should be removed or not"
 @return "the number of deleted elements"
*>
```
```c3
fn usz AnyList.remove_if(&self, AnyPredicate filter)
```

Retain the elements matching the predicate.
```c3
<*
 @param selection : "The function to determine if it should be kept or not"
 @return "the number of deleted elements"
*>
```
```c3
fn usz AnyList.retain_if(&self, AnyPredicate selection)
```

Remove any elements matching the predicate.
```c3
<*
 @param filter : "The function to determine if it should be removed or not"
 @param context : "The context to the function"
 @return "the number of deleted elements"
*>
```
```c3
fn usz AnyList.remove_using_test(&self, AnyTest filter, any context)
```

Retain any elements matching the predicate.
```c3
<*
 @param selection : "The function to determine if it should be retained or not"
 @param context : "The context to the function"
 @return "the number of deleted elements"
*>
```
```c3
fn usz AnyList.retain_using_test(&self, AnyTest selection, any context)
```

Reserve memory so that at least the `min_capacity` exists.
```c3
<*
 @param min_capacity : "The min capacity to hold"
*>
```
```c3
fn void AnyList.reserve(&self, usz min_capacity)
```

Set the element at any index.
```c3
<*
 @param index : "The index where to set the value."
 @param value : "The value to set"
 @require index <= self.size : "Index out of range"
*>
```
```c3
macro void AnyList.set(&self, usz index, value)
```
### `std::collections::bitset {SIZE}`
```c3
const BITS
```
```c3
const SZ
```
```c3
struct BitSet
```

```c3
<*
 @return "The number of bits set"
*>
```
```c3
fn usz BitSet.cardinality(&self)
```

Set a bit in the bitset.
```c3
<*
 @param i : "The index to set"
 @require i < SIZE : "Index was out of range"
*>
```
```c3
fn void BitSet.set(&self, usz i)
```

Perform xor over all bits, mutating itself
```c3
<*
 @param set : "The bit set to xor with"
 @return "The resulting bit set"
*>
```
```c3
macro BitSet BitSet.xor_self(&self, BitSet set) @operator(^=)
```

Perform xor over all bits, returning a new bit set.
```c3
<*
 @param set : "The bit set to xor with"
 @return "The resulting bit set"
*>
```
```c3
fn BitSet BitSet.xor(&self, BitSet set) @operator(^)
```

Perform or over all bits, returning a new bit set.
```c3
<*
 @param set : "The bit set to xor with"
 @return "The resulting bit set"
*>
```
```c3
fn BitSet BitSet.or(&self, BitSet set) @operator(|)
```

Perform or over all bits, mutating itself
```c3
<*
 @param set : "The bit set to xor with"
 @return "The resulting bit set"
*>
```
```c3
macro BitSet BitSet.or_self(&self, BitSet set) @operator(|=)
```

Perform & over all bits, returning a new bit set.
```c3
<*
 @param set : "The bit set to xor with"
 @return "The resulting bit set"
*>
```
```c3
fn BitSet BitSet.and(&self, BitSet set) @operator(&)
```

Perform & over all bits, mutating itself.
```c3
<*
 @param set : "The bit set to xor with"
 @return "The resulting bit set"
*>
```
```c3
macro BitSet BitSet.and_self(&self, BitSet set) @operator(&=)
```

Unset (clear) a bit in the bitset.
```c3
<*
 @param i : "The index to set"
 @require i < SIZE : "Index was out of range"
*>
```
```c3
fn void BitSet.unset(&self, usz i)
```

Get a particular bit in the bitset
```c3
<*
 @param i : "The index of the bit"
 @require i < SIZE : "Index was out of range"
*>
```
```c3
fn bool BitSet.get(&self, usz i) @operator([]) @inline
```
```c3
fn usz BitSet.len(&self) @operator(len) @inline
```

Change a particular bit in the bitset
```c3
<*
 @param i : "The index of the bit"
 @param value : "The value to set the bit to"
 @require i < SIZE : "Index was out of range"
*>
```
```c3
fn void BitSet.set_bool(&self, usz i, bool value) @operator([]=) @inline
```
### `std::collections::blockingqueue { Value }`
```c3
const INITIAL_CAPACITY
```
```c3
struct QueueEntry
```
```c3
struct LinkedBlockingQueue
```

```c3
<*
 @param [&inout] allocator : "The allocator to use"
 @param capacity : "Maximum capacity (0 for unbounded)"
 @require !self.is_initialized() : "Queue was already initialized"
*>
```
```c3
fn LinkedBlockingQueue* LinkedBlockingQueue.init(&self, Allocator allocator, usz capacity = 0)
```
```c3
fn LinkedBlockingQueue* LinkedBlockingQueue.tinit(&self, usz capacity = 0)
```

```c3
<*
 @require self.is_initialized() : "Queue must be initialized"
*>
```
```c3
fn void LinkedBlockingQueue.free(&self)
```

```c3
<*
 @param value : "Value to add to the queue"
 @require self.is_initialized() : "Queue must be initialized"
*>
```
```c3
fn void LinkedBlockingQueue.push(&self, Value value)
```

Get a value from the queue, blocking if there is no element in the queue.
```c3
<*
 @require self.is_initialized() : "Queue must be initialized"
 @return "The removed value"
*>
```
```c3
fn Value LinkedBlockingQueue.poll(&self)
```

Pop an element from the queue, fail is it is empty.
```c3
<*
 @require self.is_initialized() : "Queue must be initialized"
 @return "The removed value"
 @return? NO_MORE_ELEMENT : "If the queue is empty"
*>
```
```c3
fn Value? LinkedBlockingQueue.pop(&self)
```

Poll with a timeout.
```c3
<*
 @param timeout : "Timeout in microseconds"
 @require self.is_initialized() : "Queue must be initialized"
 @return "The removed value or null if timeout occurred"
 @return? NO_MORE_ELEMENT : "If we reached the timeout"
*>
```
```c3
fn Value? LinkedBlockingQueue.poll_timeout(&self, Duration timeout)
```

```c3
<*
 @require self.is_initialized() : "Queue must be initialized"
 @return "Current size of the queue"
*>
```
```c3
fn usz LinkedBlockingQueue.size(&self)
```

```c3
<*
 @require self.is_initialized() : "Queue must be initialized"
 @return "True if queue is empty"
*>
```
```c3
fn bool LinkedBlockingQueue.is_empty(&self)
```

Try to push, return CAPACITY_EXCEEDED if the queue is full.
```c3
<*
 @param value : "Value to add to the queue"
 @require self.is_initialized() : "Queue must be initialized"
 @return? CAPACITY_EXCEEDED : "If the queue is full"
*>
```
```c3
fn void? LinkedBlockingQueue.try_push(&self, Value value)
```

Try to push, return CAPACITY_EXCEEDED if the queue is still full after timeout is reached.
```c3
<*
 @param value : "Value to add to the queue"
 @param timeout : "Timeout in microseconds"
 @require self.is_initialized() : "Queue must be initialized"
 @return? CAPACITY_EXCEEDED : "If the queue is full"
*>
```
```c3
fn void? LinkedBlockingQueue.push_timeout(&self, Value value, Duration timeout)
```

```c3
<*
 @require self.is_initialized() : "Queue must be initialized"
 @return "The head value or NO_MORE_ELEMENT? if queue is empty"
*>
```
```c3
fn Value? LinkedBlockingQueue.peek(&self)
```

```c3
<*
 @return "True if queue is initialized"
*>
```
```c3
fn bool LinkedBlockingQueue.is_initialized(&self)
```
### `std::collections::elastic_array {Type, MAX_SIZE}`
```c3
alias ElementPredicate = fn bool(Type *type)
```
```c3
alias ElementTest = fn bool(Type *type, any context)
```
```c3
const ELEMENT_IS_EQUATABLE
```
```c3
const ELEMENT_IS_POINTER
```
```c3
macro type_is_overaligned()
```
```c3
struct ElasticArray (Printable)
```
```c3
fn usz? ElasticArray.to_format(&self, Formatter* formatter) @dynamic
```
```c3
fn String ElasticArray.to_tstring(&self)
```
```c3
fn void? ElasticArray.push_try(&self, Type element) @inline
```

```c3
<*
 @require self.size < MAX_SIZE : `Tried to exceed the max size`
*>
```
```c3
fn void ElasticArray.push(&self, Type element) @inline
```
```c3
fn Type? ElasticArray.pop(&self)
```
```c3
fn void ElasticArray.clear(&self)
```

```c3
<*
 @require self.size > 0
*>
```
```c3
fn Type? ElasticArray.pop_first(&self)
```

```c3
<*
 @require index < self.size
*>
```
```c3
fn void ElasticArray.remove_at(&self, usz index)
```

```c3
<*
 @require other_list.size + self.size <= MAX_SIZE
*>
```
```c3
fn void ElasticArray.add_all(&self, ElasticArray* other_list)
```

Add as many elements as possible to the new array,
returning the number of elements that didn't fit.
```c3
fn usz ElasticArray.add_all_to_limit(&self, ElasticArray* other_list)
```

Add as many values from this array as possible, returning the
number of elements that didn't fit.
```c3
<*
 @param [in] array
*>
```
```c3
fn usz ElasticArray.add_array_to_limit(&self, Type[] array)
```

Add the values of an array to this list.
```c3
<*
 @param [in] array
 @require array.len + self.size <= MAX_SIZE : `Size would exceed max.`
 @ensure self.size >= array.len
*>
```
```c3
fn void ElasticArray.add_array(&self, Type[] array)
```

IMPORTANT The returned array must be freed using free_aligned.
```c3
fn Type[] ElasticArray.to_aligned_array(&self, Allocator allocator)
```

```c3
<*
 @require !type_is_overaligned() : "This function is not available on overaligned types"
*>
```
```c3
macro Type[] ElasticArray.to_array(&self, Allocator allocator)
```
```c3
fn Type[] ElasticArray.to_tarray(&self)
```

Reverse the elements in a list.
```c3
fn void ElasticArray.reverse(&self)
```
```c3
fn Type[] ElasticArray.array_view(&self)
```

```c3
<*
 @require self.size < MAX_SIZE : `List would exceed max size`
*>
```
```c3
fn void ElasticArray.push_front(&self, Type type) @inline
```

```c3
<*
 @require self.size < MAX_SIZE : `List would exceed max size`
*>
```
```c3
fn void? ElasticArray.push_front_try(&self, Type type) @inline
```

```c3
<*
 @require index <= self.size
*>
```
```c3
fn void? ElasticArray.insert_at_try(&self, usz index, Type value)
```

```c3
<*
 @require self.size < MAX_SIZE : `List would exceed max size`
 @require index <= self.size
*>
```
```c3
fn void ElasticArray.insert_at(&self, usz index, Type type)
```

```c3
<*
 @require index < self.size
*>
```
```c3
fn void ElasticArray.set_at(&self, usz index, Type type)
```
```c3
fn void? ElasticArray.remove_last(&self) @maydiscard
```
```c3
fn void? ElasticArray.remove_first(&self) @maydiscard
```
```c3
fn Type? ElasticArray.first(&self)
```
```c3
fn Type? ElasticArray.last(&self)
```
```c3
fn bool ElasticArray.is_empty(&self) @inline
```
```c3
fn usz ElasticArray.byte_size(&self) @inline
```
```c3
fn usz ElasticArray.len(&self) @operator(len) @inline
```
```c3
fn Type ElasticArray.get(&self, usz index) @inline
```
```c3
fn void ElasticArray.swap(&self, usz i, usz j)
```

```c3
<*
 @param filter : "The function to determine if it should be removed or not"
 @return "the number of deleted elements"
*>
```
```c3
fn usz ElasticArray.remove_if(&self, ElementPredicate filter)
```

```c3
<*
 @param selection : "The function to determine if it should be kept or not"
 @return "the number of deleted elements"
*>
```
```c3
fn usz ElasticArray.retain_if(&self, ElementPredicate selection)
```
```c3
fn usz ElasticArray.remove_using_test(&self, ElementTest filter, any context)
```
```c3
fn usz ElasticArray.retain_using_test(&self, ElementTest filter, any context)
```
```c3
macro Type ElasticArray.@item_at(&self, usz index) @operator([])
```
```c3
fn Type* ElasticArray.get_ref(&self, usz index) @operator(&[]) @inline
```
```c3
fn void ElasticArray.set(&self, usz index, Type value) @operator([]=)
```
```c3
fn usz? ElasticArray.index_of(&self, Type type) @if(ELEMENT_IS_EQUATABLE)
```
```c3
fn usz? ElasticArray.rindex_of(&self, Type type) @if(ELEMENT_IS_EQUATABLE)
```
```c3
fn bool ElasticArray.equals(&self, ElasticArray other_list) @if(ELEMENT_IS_EQUATABLE)
```

Check for presence of a value in a list.
```c3
<*
 @param [&in] self : "the list to find elements in"
 @param value : "The value to search for"
 @return "True if the value is found, false otherwise"
*>
```
```c3
fn bool ElasticArray.contains(&self, Type value) @if(ELEMENT_IS_EQUATABLE)
```

```c3
<*
 @param [&inout] self : "The list to remove elements from"
 @param value : "The value to remove"
 @return "true if the value was found"
*>
```
```c3
fn bool ElasticArray.remove_last_item(&self, Type value) @if(ELEMENT_IS_EQUATABLE)
```

```c3
<*
 @param [&inout] self : "The list to remove elements from"
 @param value : "The value to remove"
 @return "true if the value was found"
*>
```
```c3
fn bool ElasticArray.remove_first_item(&self, Type value) @if(ELEMENT_IS_EQUATABLE)
```

```c3
<*
 @param [&inout] self : "The list to remove elements from"
 @param value : "The value to remove"
 @return "the number of deleted elements."
*>
```
```c3
fn usz ElasticArray.remove_item(&self, Type value) @if(ELEMENT_IS_EQUATABLE)
```
```c3
fn void ElasticArray.remove_all_from(&self, ElasticArray* other_list) @if(ELEMENT_IS_EQUATABLE)
```

```c3
<*
 @param [&in] self
 @return "The number non-null values in the list"
*>
```
```c3
fn usz ElasticArray.compact_count(&self) @if(ELEMENT_IS_POINTER)
```
```c3
fn usz ElasticArray.compact(&self) @if(ELEMENT_IS_POINTER)
```
### `std::collections::enummap{Enum, ValueType}`
```c3
struct EnumMap (Printable)
```
```c3
fn void EnumMap.init(&self, ValueType init_value)
```
```c3
fn usz? EnumMap.to_format(&self, Formatter* formatter) @dynamic
```

```c3
<*
 @return "The total size of this map, which is the same as the number of enum values"
 @pure
*>
```
```c3
fn usz EnumMap.len(&self) @operator(len) @inline
```

```c3
<*
 @return "Retrieve a value given the underlying enum, if there is no entry, then the zero value for the value is returned."
*>
```
```c3
fn ValueType EnumMap.get(&self, Enum key) @operator([]) @inline
```
```c3
fn ValueType* EnumMap.get_ref(&self, Enum key) @operator(&[]) @inline
```
```c3
fn void EnumMap.set(&self, Enum key, ValueType value) @operator([]=) @inline
```
### `std::collections::enumset{Enum}`
```c3
const IS_CHAR_ARRAY
```
```c3
typedef EnumSet (Printable) = EnumSetType
```
```c3
fn void EnumSet.add(&self, Enum v)
```
```c3
fn void EnumSet.clear(&self)
```
```c3
fn bool EnumSet.remove(&self, Enum v)
```
```c3
fn bool EnumSet.has(&self, Enum v)
```
```c3
fn void EnumSet.add_all(&self, EnumSet s)
```
```c3
fn void EnumSet.retain_all(&self, EnumSet s)
```
```c3
fn void EnumSet.remove_all(&self, EnumSet s)
```
```c3
fn EnumSet EnumSet.and_of(&self, EnumSet s)
```
```c3
fn EnumSet EnumSet.or_of(&self, EnumSet s)
```
```c3
fn EnumSet EnumSet.diff_of(&self, EnumSet s)
```
```c3
fn EnumSet EnumSet.xor_of(&self, EnumSet s)
```
```c3
fn usz? EnumSet.to_format(&set, Formatter* formatter) @dynamic
```
### `std::collections::growablebitset{Type}`
```c3
const BITS
```
```c3
alias GrowableBitSetList = List{Type}
```
```c3
struct GrowableBitSet
```

```c3
<*
 @param initial_capacity
 @param [&inout] allocator : "The allocator to use, defaults to the heap allocator"
*>
```
```c3
fn GrowableBitSet* GrowableBitSet.init(&self, Allocator allocator, usz initial_capacity = 1)
```
```c3
fn GrowableBitSet* GrowableBitSet.tinit(&self, usz initial_capacity = 1)
```
```c3
fn void GrowableBitSet.free(&self)
```
```c3
fn usz GrowableBitSet.cardinality(&self)
```
```c3
fn void GrowableBitSet.set(&self, usz i)
```
```c3
fn void GrowableBitSet.unset(&self, usz i)
```
```c3
fn bool GrowableBitSet.get(&self, usz i) @operator([]) @inline
```
```c3
fn usz GrowableBitSet.len(&self) @operator(len)
```
```c3
fn void GrowableBitSet.set_bool(&self, usz i, bool value) @operator([]=) @inline
```
### `std::collections::linkedlist{Type}`
```c3
const ELEMENT_IS_EQUATABLE
```
```c3
struct LinkedList
```

```c3
<*
 @param [&inout] allocator : "The allocator to use, defaults to the heap allocator"
 @return "the initialized list"
*>
```
```c3
fn LinkedList* LinkedList.init(&self, Allocator allocator)
```
```c3
fn LinkedList* LinkedList.tinit(&self)
```
```c3
fn bool LinkedList.is_initialized(&self) @inline
```
```c3
fn void LinkedList.push_front(&self, Type value)
```
```c3
fn void LinkedList.push(&self, Type value)
```
```c3
fn Type? LinkedList.peek(&self)
```
```c3
fn Type? LinkedList.peek_last(&self)
```
```c3
fn Type? LinkedList.first(&self)
```
```c3
fn Type? LinkedList.last(&self)
```
```c3
fn void LinkedList.free(&self)
```
```c3
fn void LinkedList.clear(&self)
```
```c3
fn usz LinkedList.len(&self) @inline
```

```c3
<*
 @require index < self.size
*>
```
```c3
macro Node* LinkedList.node_at_index(&self, usz index)
```

```c3
<*
 @require index < self.size
*>
```
```c3
fn Type LinkedList.get(&self, usz index)
```

```c3
<*
 @require index < self.size
*>
```
```c3
fn void LinkedList.set(&self, usz index, Type element)
```

```c3
<*
 @require index < self.size
*>
```
```c3
fn void LinkedList.remove_at(&self, usz index)
```

```c3
<*
 @require index <= self.size
*>
```
```c3
fn void LinkedList.insert_at(&self, usz index, Type element)
```
```c3
fn usz LinkedList.remove(&self, Type t) @if(ELEMENT_IS_EQUATABLE)
```
```c3
fn Type? LinkedList.pop(&self)
```
```c3
fn bool LinkedList.is_empty(&self)
```
```c3
fn Type? LinkedList.pop_front(&self)
```
```c3
fn void? LinkedList.remove_last(&self) @maydiscard
```
```c3
fn void? LinkedList.remove_first(&self) @maydiscard
```
```c3
fn bool LinkedList.remove_first_match(&self, Type t) @if(ELEMENT_IS_EQUATABLE)
```
```c3
fn bool LinkedList.remove_last_match(&self, Type t)  @if(ELEMENT_IS_EQUATABLE)
```
### `std::collections::list_common`

IMPORTANT The returned array must be freed using free_aligned.
```c3
macro list_to_aligned_array($Type, self, Allocator allocator)
```
```c3
macro list_to_array($Type, self, Allocator allocator)
```
```c3
macro void list_reverse(self)
```
```c3
macro usz list_remove_using_test(self, filter, bool $invert, ctx)
```
```c3
macro usz list_compact(self)
```
```c3
macro usz list_remove_item(self, value)
```
```c3
macro usz list_remove_if(self, filter, bool $invert)
```
### `std::collections::list{Type}`
```c3
alias ElementPredicate = fn bool(Type *type)
```
```c3
alias ElementTest = fn bool(Type *type, any context)
```
```c3
const ELEMENT_IS_EQUATABLE
```
```c3
const ELEMENT_IS_POINTER
```
```c3
const Allocator LIST_HEAP_ALLOCATOR
```
```c3
const List ONHEAP
```
```c3
macro type_is_overaligned()
```
```c3
struct List (Printable)
```

```c3
<*
 @param initial_capacity : "The initial capacity to reserve"
 @param [&inout] allocator : "The allocator to use, defaults to the heap allocator"
*>
```
```c3
fn List* List.init(&self, Allocator allocator, usz initial_capacity = 16)
```

Initialize the list using the temp allocator.
```c3
<*
 @param initial_capacity : "The initial capacity to reserve"
*>
```
```c3
fn List* List.tinit(&self, usz initial_capacity = 16)
```

Initialize a new list with an array.
```c3
<*
 @param [in] values : `The values to initialize the list with.`
 @require self.size == 0 : "The List must be empty"
*>
```
```c3
fn List* List.init_with_array(&self, Allocator allocator, Type[] values)
```

Initialize a temporary list with an array.
```c3
<*
 @param [in] values : `The values to initialize the list with.`
 @require self.size == 0 : "The List must be empty"
*>
```
```c3
fn List* List.tinit_with_array(&self, Type[] values)
```

```c3
<*
 @require !self.is_initialized() : "The List must not be allocated"
*>
```
```c3
fn void List.init_wrapping_array(&self, Allocator allocator, Type[] types)
```
```c3
fn bool List.is_initialized(&self) @inline
```
```c3
fn usz? List.to_format(&self, Formatter* formatter) @dynamic
```
```c3
fn void List.push(&self, Type element) @inline
```
```c3
fn Type? List.pop(&self)
```
```c3
fn void List.clear(&self)
```
```c3
fn Type? List.pop_first(&self)
```

```c3
<*
 @require index < self.size : `Removed element out of bounds`
*>
```
```c3
fn void List.remove_at(&self, usz index)
```
```c3
fn void List.add_all(&self, List* other_list)
```

IMPORTANT The returned array must be freed using free_aligned.
```c3
fn Type[] List.to_aligned_array(&self, Allocator allocator)
```

```c3
<*
 @require !type_is_overaligned() : "This function is not available on overaligned types"
*>
```
```c3
macro Type[] List.to_array(&self, Allocator allocator)
```
```c3
fn Type[] List.to_tarray(&self)
```

Reverse the elements in a list.
```c3
fn void List.reverse(&self)
```
```c3
fn Type[] List.array_view(&self)
```

Add the values of an array to this list.
```c3
<*
 @param [in] array
 @ensure self.size >= array.len
*>
```
```c3
fn void List.add_array(&self, Type[] array)
```
```c3
fn void List.push_front(&self, Type type) @inline
```

```c3
<*
 @require index <= self.size : `Insert was out of bounds`
*>
```
```c3
fn void List.insert_at(&self, usz index, Type type)
```

```c3
<*
 @require index < self.size
*>
```
```c3
fn void List.set_at(&self, usz index, Type type)
```
```c3
fn void? List.remove_last(&self) @maydiscard
```
```c3
fn void? List.remove_first(&self) @maydiscard
```
```c3
fn Type? List.first(&self)
```
```c3
fn Type? List.last(&self)
```
```c3
fn bool List.is_empty(&self) @inline
```
```c3
fn usz List.byte_size(&self) @inline
```
```c3
fn usz List.len(&self) @operator(len) @inline
```

```c3
<*
 @require index < self.size : `Access out of bounds`
*>
```
```c3
fn Type List.get(&self, usz index) @inline
```
```c3
fn void List.free(&self)
```

```c3
<*
 @require i < self.size && j < self.size : `Access out of bounds`
*>
```
```c3
fn void List.swap(&self, usz i, usz j)
```

```c3
<*
 @param filter : "The function to determine if it should be removed or not"
 @return "the number of deleted elements"
*>
```
```c3
fn usz List.remove_if(&self, ElementPredicate filter)
```

```c3
<*
 @param selection : "The function to determine if it should be kept or not"
 @return "the number of deleted elements"
*>
```
```c3
fn usz List.retain_if(&self, ElementPredicate selection)
```
```c3
fn usz List.remove_using_test(&self, ElementTest filter, any context)
```
```c3
fn usz List.retain_using_test(&self, ElementTest filter, any context)
```

```c3
<*
 @require index < self.size : `Access out of bounds`
*>
```
```c3
macro Type List.@item_at(&self, usz index) @operator([])
```

```c3
<*
 @require index < self.size : `Access out of bounds`
*>
```
```c3
fn Type* List.get_ref(&self, usz index) @operator(&[]) @inline
```

```c3
<*
 @require index < self.size : `Access out of bounds`
*>
```
```c3
fn void List.set(&self, usz index, Type value) @operator([]=)
```
```c3
fn void List.reserve(&self, usz added)
```
```c3
fn void List._update_size_change(&self,usz old_size, usz new_size)
```
```c3
fn usz? List.index_of(&self, Type type) @if(ELEMENT_IS_EQUATABLE)
```
```c3
fn usz? List.rindex_of(&self, Type type) @if(ELEMENT_IS_EQUATABLE)
```
```c3
fn bool List.equals(&self, List other_list) @if(ELEMENT_IS_EQUATABLE)
```

Check for presence of a value in a list.
```c3
<*
 @param [&in] self : "the list to find elements in"
 @param value : "The value to search for"
 @return "True if the value is found, false otherwise"
*>
```
```c3
fn bool List.contains(&self, Type value) @if(ELEMENT_IS_EQUATABLE)
```

```c3
<*
 @param [&inout] self : "The list to remove elements from"
 @param value : "The value to remove"
 @return "true if the value was found"
*>
```
```c3
fn bool List.remove_last_item(&self, Type value) @if(ELEMENT_IS_EQUATABLE)
```

```c3
<*
 @param [&inout] self : "The list to remove elements from"
 @param value : "The value to remove"
 @return "true if the value was found"
*>
```
```c3
fn bool List.remove_first_item(&self, Type value) @if(ELEMENT_IS_EQUATABLE)
```

```c3
<*
 @param [&inout] self : "The list to remove elements from"
 @param value : "The value to remove"
 @return "the number of deleted elements."
*>
```
```c3
fn usz List.remove_item(&self, Type value) @if(ELEMENT_IS_EQUATABLE)
```
```c3
fn void List.remove_all_from(&self, List* other_list) @if(ELEMENT_IS_EQUATABLE)
```

```c3
<*
 @param [&in] self
 @return "The number non-null values in the list"
*>
```
```c3
fn usz List.compact_count(&self) @if(ELEMENT_IS_POINTER)
```
```c3
fn usz List.compact(&self) @if(ELEMENT_IS_POINTER)
```
### `std::collections::map{Key, Value}`
```c3
const uint DEFAULT_INITIAL_CAPACITY
```
```c3
const uint MAXIMUM_CAPACITY
```
```c3
const float DEFAULT_LOAD_FACTOR
```
```c3
const VALUE_IS_EQUATABLE
```
```c3
const bool COPY_KEYS
```
```c3
const Allocator MAP_HEAP_ALLOCATOR
```
```c3
const HashMap ONHEAP
```
```c3
struct Entry
```
```c3
struct HashMap (Printable)
```

```c3
<*
 @param [&inout] allocator : "The allocator to use"
 @require capacity > 0 : "The capacity must be 1 or higher"
 @require load_factor > 0.0 : "The load factor must be higher than 0"
 @require !self.is_initialized() : "Map was already initialized"
 @require capacity < MAXIMUM_CAPACITY : "Capacity cannot exceed maximum"
*>
```
```c3
fn HashMap* HashMap.init(&self, Allocator allocator, uint capacity = DEFAULT_INITIAL_CAPACITY, float load_factor = DEFAULT_LOAD_FACTOR)
```

```c3
<*
 @require capacity > 0 : "The capacity must be 1 or higher"
 @require load_factor > 0.0 : "The load factor must be higher than 0"
 @require !self.is_initialized() : "Map was already initialized"
 @require capacity < MAXIMUM_CAPACITY : "Capacity cannot exceed maximum"
*>
```
```c3
fn HashMap* HashMap.tinit(&self, uint capacity = DEFAULT_INITIAL_CAPACITY, float load_factor = DEFAULT_LOAD_FACTOR)
```

```c3
<*
 @param [&inout] allocator : "The allocator to use"
 @require $vacount % 2 == 0 : "There must be an even number of arguments provided for keys and values"
 @require capacity > 0 : "The capacity must be 1 or higher"
 @require load_factor > 0.0 : "The load factor must be higher than 0"
 @require !self.is_initialized() : "Map was already initialized"
 @require capacity < MAXIMUM_CAPACITY : "Capacity cannot exceed maximum"
*>
```
```c3
macro HashMap* HashMap.init_with_key_values(&self, Allocator allocator, ..., uint capacity = DEFAULT_INITIAL_CAPACITY, float load_factor = DEFAULT_LOAD_FACTOR)
```

```c3
<*
 @require $vacount % 2 == 0 : "There must be an even number of arguments provided for keys and values"
 @require capacity > 0 : "The capacity must be 1 or higher"
 @require load_factor > 0.0 : "The load factor must be higher than 0"
 @require !self.is_initialized() : "Map was already initialized"
 @require capacity < MAXIMUM_CAPACITY : "Capacity cannot exceed maximum"
*>
```
```c3
macro HashMap* HashMap.tinit_with_key_values(&self, ..., uint capacity = DEFAULT_INITIAL_CAPACITY, float load_factor = DEFAULT_LOAD_FACTOR)
```

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
```
```c3
fn HashMap* HashMap.init_from_keys_and_values(&self, Allocator allocator, Key[] keys, Value[] values, uint capacity = DEFAULT_INITIAL_CAPACITY, float load_factor = DEFAULT_LOAD_FACTOR)
```

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
```
```c3
fn HashMap* HashMap.tinit_from_keys_and_values(&self, Key[] keys, Value[] values, uint capacity = DEFAULT_INITIAL_CAPACITY, float load_factor = DEFAULT_LOAD_FACTOR)
```

Has this hash map been initialized yet?
```c3
<*
 @param [&in] map : "The hash map we are testing"
 @return "Returns true if it has been initialized, false otherwise"
*>
```
```c3
fn bool HashMap.is_initialized(&map)
```

```c3
<*
 @param [&inout] allocator : "The allocator to use"
 @param [&in] other_map : "The map to copy from."
 @require !self.is_initialized() : "Map was already initialized"
*>
```
```c3
fn HashMap* HashMap.init_from_map(&self, Allocator allocator, HashMap* other_map)
```

```c3
<*
 @param [&in] other_map : "The map to copy from."
 @require !map.is_initialized() : "Map was already initialized"
*>
```
```c3
fn HashMap* HashMap.tinit_from_map(&map, HashMap* other_map)
```
```c3
fn bool HashMap.is_empty(&map) @inline
```
```c3
fn usz HashMap.len(&map) @inline
```
```c3
fn Value*? HashMap.get_ref(&map, Key key)
```
```c3
fn Entry*? HashMap.get_entry(&map, Key key)
```

Get the value or update and
```c3
<*
 @require @assignable_to(#expr, Value)
*>
```
```c3
macro Value HashMap.@get_or_set(&map, Key key, Value #expr)
```
```c3
fn Value? HashMap.get(&map, Key key) @operator([])
```
```c3
fn bool HashMap.has_key(&map, Key key)
```
```c3
fn bool HashMap.set(&map, Key key, Value value) @operator([]=)
```
```c3
fn void? HashMap.remove(&map, Key key) @maydiscard
```
```c3
fn void HashMap.clear(&map)
```
```c3
fn void HashMap.free(&map)
```
```c3
fn Key[] HashMap.tkeys(&self)
```
```c3
fn Key[] HashMap.keys(&self, Allocator allocator)
```
```c3
macro HashMap.@each(map; @body(key, value))
```
```c3
macro HashMap.@each_entry(map; @body(entry))
```
```c3
fn Value[] HashMap.tvalues(&map)
```
```c3
fn Value[] HashMap.values(&self, Allocator allocator)
```
```c3
fn bool HashMap.has_value(&map, Value v) @if(VALUE_IS_EQUATABLE)
```
```c3
fn HashMapIterator HashMap.iter(&self)
```
```c3
fn HashMapValueIterator HashMap.value_iter(&self)
```
```c3
fn HashMapKeyIterator HashMap.key_iter(&self)
```
```c3
fn usz? HashMap.to_format(&self, Formatter* f) @dynamic
```
```c3
struct HashMapIterator
```
```c3
typedef HashMapValueIterator = HashMapIterator
```
```c3
typedef HashMapKeyIterator = HashMapIterator
```

```c3
<*
 @require idx < self.map.count
*>
```
```c3
fn Entry HashMapIterator.get(&self, usz idx) @operator([])
```
```c3
fn Value HashMapValueIterator.get(&self, usz idx) @operator([])
```
```c3
fn Key HashMapKeyIterator.get(&self, usz idx) @operator([])
```
```c3
fn usz HashMapValueIterator.len(self) @operator(len)
```
```c3
fn usz HashMapKeyIterator.len(self) @operator(len)
```
```c3
fn usz HashMapIterator.len(self) @operator(len)
```
```c3
const LinkedHashMap LINKEDONHEAP
```
```c3
struct LinkedEntry
```
```c3
struct LinkedHashMap (Printable)
```

```c3
<*
 @param [&inout] allocator : "The allocator to use"
 @require capacity > 0 : "The capacity must be 1 or higher"
 @require load_factor > 0.0 : "The load factor must be higher than 0"
 @require !self.is_initialized() : "Map was already initialized"
 @require capacity < MAXIMUM_CAPACITY : "Capacity cannot exceed maximum"
*>
```
```c3
fn LinkedHashMap* LinkedHashMap.init(&self, Allocator allocator, usz capacity = DEFAULT_INITIAL_CAPACITY, float load_factor = DEFAULT_LOAD_FACTOR)
```

```c3
<*
 @require capacity > 0 : "The capacity must be 1 or higher"
 @require load_factor > 0.0 : "The load factor must be higher than 0"
 @require !self.is_initialized() : "Map was already initialized"
 @require capacity < MAXIMUM_CAPACITY : "Capacity cannot exceed maximum"
*>
```
```c3
fn LinkedHashMap* LinkedHashMap.tinit(&self, usz capacity = DEFAULT_INITIAL_CAPACITY, float load_factor = DEFAULT_LOAD_FACTOR)
```

```c3
<*
 @param [&inout] allocator : "The allocator to use"
 @require $vacount % 2 == 0 : "There must be an even number of arguments provided for keys and values"
 @require capacity > 0 : "The capacity must be 1 or higher"
 @require load_factor > 0.0 : "The load factor must be higher than 0"
 @require !self.is_initialized() : "Map was already initialized"
 @require capacity < MAXIMUM_CAPACITY : "Capacity cannot exceed maximum"
*>
```
```c3
macro LinkedHashMap* LinkedHashMap.init_with_key_values(&self, Allocator allocator, ..., uint capacity = DEFAULT_INITIAL_CAPACITY, float load_factor = DEFAULT_LOAD_FACTOR)
```

```c3
<*
 @require $vacount % 2 == 0 : "There must be an even number of arguments provided for keys and values"
 @require capacity > 0 : "The capacity must be 1 or higher"
 @require load_factor > 0.0 : "The load factor must be higher than 0"
 @require !self.is_initialized() : "Map was already initialized"
 @require capacity < MAXIMUM_CAPACITY : "Capacity cannot exceed maximum"
*>
```
```c3
macro LinkedHashMap* LinkedHashMap.tinit_with_key_values(&self, ..., uint capacity = DEFAULT_INITIAL_CAPACITY, float load_factor = DEFAULT_LOAD_FACTOR)
```

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
```
```c3
fn LinkedHashMap* LinkedHashMap.init_from_keys_and_values(&self, Allocator allocator, Key[] keys, Value[] values, uint capacity = DEFAULT_INITIAL_CAPACITY, float load_factor = DEFAULT_LOAD_FACTOR)
```

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
```
```c3
fn LinkedHashMap* LinkedHashMap.tinit_from_keys_and_values(&self, Key[] keys, Value[] values, uint capacity = DEFAULT_INITIAL_CAPACITY, float load_factor = DEFAULT_LOAD_FACTOR)
```

Has this hash map been initialized yet?
```c3
<*
 @param [&in] map : "The hash map we are testing"
 @return "Returns true if it has been initialized, false otherwise"
*>
```
```c3
fn bool LinkedHashMap.is_initialized(&map)
```

```c3
<*
 @param [&inout] allocator : "The allocator to use"
 @param [&in] other_map : "The map to copy from."
 @require !self.is_initialized() : "Map was already initialized"
*>
```
```c3
fn LinkedHashMap* LinkedHashMap.init_from_map(&self, Allocator allocator, LinkedHashMap* other_map)
```

```c3
<*
 @param [&in] other_map : "The map to copy from."
 @require !map.is_initialized() : "Map was already initialized"
*>
```
```c3
fn LinkedHashMap* LinkedHashMap.tinit_from_map(&map, LinkedHashMap* other_map)
```
```c3
fn bool LinkedHashMap.is_empty(&map) @inline
```
```c3
fn usz LinkedHashMap.len(&map) @inline
```
```c3
fn Value*? LinkedHashMap.get_ref(&map, Key key)
```
```c3
fn LinkedEntry*? LinkedHashMap.get_entry(&map, Key key)
```

Get the value or update and
```c3
<*
 @require @assignable_to(#expr, Value)
*>
```
```c3
macro Value LinkedHashMap.@get_or_set(&map, Key key, Value #expr)
```
```c3
fn Value? LinkedHashMap.get(&map, Key key) @operator([])
```
```c3
fn bool LinkedHashMap.has_key(&map, Key key)
```
```c3
fn bool LinkedHashMap.set(&map, Key key, Value value) @operator([]=)
```
```c3
fn void? LinkedHashMap.remove(&map, Key key) @maydiscard
```
```c3
fn void LinkedHashMap.clear(&map)
```
```c3
fn void LinkedHashMap.free(&map)
```
```c3
fn Key[] LinkedHashMap.tkeys(&self)
```
```c3
fn Key[] LinkedHashMap.keys(&self, Allocator allocator)
```
```c3
macro LinkedHashMap.@each(map; @body(key, value))
```
```c3
macro LinkedHashMap.@each_entry(map; @body(entry))
```
```c3
fn Value[] LinkedHashMap.tvalues(&map)
```
```c3
fn Value[] LinkedHashMap.values(&self, Allocator allocator)
```
```c3
fn bool LinkedHashMap.has_value(&map, Value v) @if(VALUE_IS_EQUATABLE)
```
```c3
fn LinkedHashMapIterator LinkedHashMap.iter(&self)
```
```c3
fn LinkedHashMapValueIterator LinkedHashMap.value_iter(&self)
```
```c3
fn LinkedHashMapKeyIterator LinkedHashMap.key_iter(&self)
```
```c3
fn bool LinkedHashMapIterator.next(&self)
```
```c3
fn LinkedEntry*? LinkedHashMapIterator.get(&self)
```
```c3
fn Value*? LinkedHashMapValueIterator.get(&self)
```
```c3
fn Key*? LinkedHashMapKeyIterator.get(&self)
```
```c3
fn bool LinkedHashMapIterator.has_next(&self)
```
```c3
fn usz? LinkedHashMap.to_format(&self, Formatter* f) @dynamic
```
```c3
struct LinkedHashMapIterator
```
```c3
typedef LinkedHashMapValueIterator = inline LinkedHashMapIterator
```
```c3
typedef LinkedHashMapKeyIterator = inline LinkedHashMapIterator
```
```c3
fn usz LinkedHashMapValueIterator.len(self) @operator(len)
```
```c3
fn usz LinkedHashMapKeyIterator.len(self) @operator(len)
```
```c3
fn usz LinkedHashMapIterator.len(self) @operator(len)
```
### `std::collections::maybe{Type}`
```c3
struct Maybe (Printable)
```
```c3
fn usz? Maybe.to_format(&self, Formatter* f) @dynamic
```
```c3
fn void Maybe.set(&self, Type val)
```
```c3
fn void Maybe.reset(&self)
```
```c3
fn Maybe value(Type val)
```
```c3
const Maybe EMPTY
```
```c3
macro Type? Maybe.get(self)
```
```c3
fn bool Maybe.equals(self, Maybe other) @operator(==) @if(types::is_equatable_type(Type))
```
### `std::collections::object`
```c3
const Object TRUE_OBJECT
```
```c3
const Object FALSE_OBJECT
```
```c3
const Object NULL_OBJECT
```
```c3
struct Object (Printable)
```
```c3
fn usz? Object.to_format(&self, Formatter* formatter) @dynamic
```
```c3
fn Object* new_obj(Allocator allocator)
```
```c3
fn Object* new_null()
```
```c3
fn Object* new_int(int128 i, Allocator allocator)
```
```c3
macro Object* new_enum(e, Allocator allocator)
```
```c3
fn Object* new_float(double f, Allocator allocator)
```
```c3
fn Object* new_string(String s, Allocator allocator)
```
```c3
fn Object* new_bool(bool b)
```
```c3
fn void Object.free(&self)
```
```c3
fn bool Object.is_null(&self) @inline
```
```c3
fn bool Object.is_empty(&self) @inline
```
```c3
fn bool Object.is_map(&self) @inline
```
```c3
fn bool Object.is_array(&self) @inline
```
```c3
fn bool Object.is_bool(&self) @inline
```
```c3
fn bool Object.is_string(&self) @inline
```
```c3
fn bool Object.is_float(&self) @inline
```
```c3
fn bool Object.is_int(&self) @inline
```
```c3
fn bool Object.is_keyable(&self)
```
```c3
fn bool Object.is_indexable(&self)
```
```c3
macro Object* Object.set(&self, String key, value)
```

```c3
<*
 @require self.is_indexable()
*>
```
```c3
macro Object* Object.set_at(&self, usz index, String key, value)
```

```c3
<*
 @require self.is_indexable()
 @ensure return != null
*>
```
```c3
macro Object* Object.push(&self, value)
```

```c3
<*
 @require self.is_keyable()
*>
```
```c3
fn Object*? Object.get(&self, String key)
```
```c3
fn bool Object.has_key(&self, String key)
```

```c3
<*
 @require self.is_indexable()
*>
```
```c3
fn Object* Object.get_at(&self, usz index)
```

```c3
<*
 @require self.is_indexable()
*>
```
```c3
fn usz Object.get_len(&self)
```

```c3
<*
 @require self.is_indexable()
*>
```
```c3
fn void Object.push_object(&self, Object* to_append)
```

```c3
<*
 @require self.is_indexable()
*>
```
```c3
fn void Object.set_object_at(&self, usz index, Object* to_set)
```

```c3
<*
 @require $Type.kindof.is_int() : "Expected an integer type."
*>
```
```c3
macro get_integer_value(Object* value, $Type)
```
```c3
fn ichar? Object.get_ichar(&self, String key)
```
```c3
fn short? Object.get_short(&self, String key)
```
```c3
fn int? Object.get_int(&self, String key)
```
```c3
fn long? Object.get_long(&self, String key)
```
```c3
fn int128? Object.get_int128(&self, String key)
```
```c3
fn ichar? Object.get_ichar_at(&self, usz index)
```
```c3
fn short? Object.get_short_at(&self, usz index)
```
```c3
fn int? Object.get_int_at(&self, usz index)
```
```c3
fn long? Object.get_long_at(&self, usz index)
```
```c3
fn int128? Object.get_int128_at(&self, usz index)
```
```c3
fn char? Object.get_char(&self, String key)
```
```c3
fn short? Object.get_ushort(&self, String key)
```
```c3
fn uint? Object.get_uint(&self, String key)
```
```c3
fn ulong? Object.get_ulong(&self, String key)
```
```c3
fn uint128? Object.get_uint128(&self, String key)
```
```c3
fn char? Object.get_char_at(&self, usz index)
```
```c3
fn ushort? Object.get_ushort_at(&self, usz index)
```
```c3
fn uint? Object.get_uint_at(&self, usz index)
```
```c3
fn ulong? Object.get_ulong_at(&self, usz index)
```
```c3
fn uint128? Object.get_uint128_at(&self, usz index)
```

```c3
<*
 @require self.is_keyable()
*>
```
```c3
fn String? Object.get_string(&self, String key)
```

```c3
<*
 @require self.is_indexable()
*>
```
```c3
fn String? Object.get_string_at(&self, usz index)
```

```c3
<*
 @require self.is_keyable()
*>
```
```c3
macro String? Object.get_enum(&self, $EnumType, String key)
```

```c3
<*
 @require self.is_indexable()
*>
```
```c3
macro String? Object.get_enum_at(&self, $EnumType, usz index)
```

```c3
<*
 @require self.is_keyable()
*>
```
```c3
fn bool? Object.get_bool(&self, String key)
```

```c3
<*
 @require self.is_indexable()
*>
```
```c3
fn bool? Object.get_bool_at(&self, usz index)
```

```c3
<*
 @require self.is_keyable()
*>
```
```c3
fn double? Object.get_float(&self, String key)
```

```c3
<*
 @require self.is_indexable()
*>
```
```c3
fn double? Object.get_float_at(&self, usz index)
```
```c3
fn Object* Object.get_or_create_obj(&self, String key)
```
### `std::collections::pair{Type1, Type2}`
```c3
struct Pair (Printable)
```
```c3
fn usz? Pair.to_format(&self, Formatter* f) @dynamic
```

```c3
<*
 @param [&out] a
 @param [&out] b
 @require @assignable_to(self.first, $typeof(*a)) : "You cannot assign the first value to a"
 @require @assignable_to(self.second, $typeof(*b)) : "You cannot assign the second value to b"
*>
```
```c3
macro void Pair.unpack(&self, a, b)
```
```c3
fn bool Pair.equal(self, Pair other) @operator(==) @if
```
### `std::collections::priorityqueue::private{Type, MAX}`
```c3
struct PrivatePriorityQueue (Printable)
```
```c3
fn PrivatePriorityQueue* PrivatePriorityQueue.init(&self, Allocator allocator, usz initial_capacity = 16, ) @inline
```
```c3
fn PrivatePriorityQueue* PrivatePriorityQueue.tinit(&self, usz initial_capacity = 16) @inline
```
```c3
fn void PrivatePriorityQueue.push(&self, Type element)
```

```c3
<*
 @require index < self.len() : "Index out of range"
*>
```
```c3
fn void PrivatePriorityQueue.remove_at(&self, usz index)
```

```c3
<*
 @require self != null
*>
```
```c3
fn Type? PrivatePriorityQueue.pop(&self)
```
```c3
fn Type? PrivatePriorityQueue.first(&self)
```
```c3
fn void PrivatePriorityQueue.free(&self)
```
```c3
fn usz PrivatePriorityQueue.len(&self) @operator(len)
```
```c3
fn bool PrivatePriorityQueue.is_empty(&self)
```

```c3
<*
 @require index < self.len()
*>
```
```c3
fn Type PrivatePriorityQueue.get(&self, usz index) @operator([])
```
```c3
fn usz? PrivatePriorityQueue.to_format(&self, Formatter* formatter) @dynamic
```
### `std::collections::priorityqueue{Type}`
```c3
typedef PriorityQueue = inline PrivatePriorityQueue{Type, false}
```
```c3
typedef PriorityQueueMax = inline PrivatePriorityQueue{Type, true}
```
### `std::collections::range{Type}`
```c3
struct Range (Printable)
```
```c3
fn usz Range.len(&self) @operator(len)
```
```c3
fn bool Range.contains(&self, Type value) @inline
```

```c3
<*
 @require index < self.len() : "Can't index into an empty range"
*>
```
```c3
fn Type Range.get(&self, usz index) @operator([])
```
```c3
fn usz? Range.to_format(&self, Formatter* formatter) @dynamic
```
```c3
struct ExclusiveRange (Printable)
```
```c3
fn usz ExclusiveRange.len(&self) @operator(len)
```
```c3
fn bool ExclusiveRange.contains(&self, Type value) @inline
```
```c3
fn usz? ExclusiveRange.to_format(&self, Formatter* formatter) @dynamic
```

```c3
<*
 @require index < self.len() : "Can't index into an empty range"
*>
```
```c3
fn Type ExclusiveRange.get(&self, usz index) @operator([])
```
### `std::collections::ringbuffer{Type}`
```c3
alias Element = $typeof((Type){}[0])
```
```c3
struct RingBuffer (Printable)
```
```c3
fn void RingBuffer.init(&self) @inline
```
```c3
fn void RingBuffer.push(&self, Element c)
```
```c3
fn Element RingBuffer.get(&self, usz index) @operator([])
```
```c3
fn Element? RingBuffer.pop(&self)
```
```c3
fn usz? RingBuffer.to_format(&self, Formatter* format) @dynamic
```
```c3
fn usz RingBuffer.read(&self, usz index, Element[] buffer)
```
```c3
fn void RingBuffer.write(&self, Element[] buffer)
```
### `std::collections::set {Value}`
```c3
const uint DEFAULT_INITIAL_CAPACITY
```
```c3
const uint MAXIMUM_CAPACITY
```
```c3
const float DEFAULT_LOAD_FACTOR
```
```c3
const Allocator SET_HEAP_ALLOCATOR
```

Copy the ONHEAP allocator to initialize to a set that is heap allocated
```c3
const HashSet ONHEAP
```
```c3
struct Entry
```
```c3
struct HashSet (Printable)
```
```c3
fn int HashSet.len(&self) @operator(len)
```

```c3
<*
 @param [&inout] allocator : "The allocator to use"
 @require capacity > 0 : "The capacity must be 1 or higher"
 @require load_factor > 0.0 : "The load factor must be higher than 0"
 @require !self.is_initialized() : "Set was already initialized"
 @require capacity < MAXIMUM_CAPACITY : "Capacity cannot exceed maximum"
*>
```
```c3
fn HashSet* HashSet.init(&self, Allocator allocator, usz capacity = DEFAULT_INITIAL_CAPACITY, float load_factor = DEFAULT_LOAD_FACTOR)
```

```c3
<*
 @require capacity > 0 : "The capacity must be 1 or higher"
 @require load_factor > 0.0 : "The load factor must be higher than 0"
 @require !self.is_initialized() : "Set was already initialized"
 @require capacity < MAXIMUM_CAPACITY : "Capacity cannot exceed maximum"
*>
```
```c3
fn HashSet* HashSet.tinit(&self, uint capacity = DEFAULT_INITIAL_CAPACITY, float load_factor = DEFAULT_LOAD_FACTOR)
```

```c3
<*
 @param [&inout] allocator : "The allocator to use"
 @require capacity > 0 : "The capacity must be 1 or higher"
 @require load_factor > 0.0 : "The load factor must be higher than 0"
 @require !self.is_initialized() : "Set was already initialized"
 @require capacity < MAXIMUM_CAPACITY : "Capacity cannot exceed maximum"
*>
```
```c3
macro HashSet* HashSet.init_with_values(&self, Allocator allocator, ..., uint capacity = DEFAULT_INITIAL_CAPACITY, float load_factor = DEFAULT_LOAD_FACTOR)
```

```c3
<*
 @require capacity > 0 : "The capacity must be 1 or higher"
 @require load_factor > 0.0 : "The load factor must be higher than 0"
 @require !self.is_initialized() : "Set was already initialized"
 @require capacity < MAXIMUM_CAPACITY : "Capacity cannot exceed maximum"
*>
```
```c3
macro HashSet* HashSet.tinit_with_values(&self, ..., uint capacity = DEFAULT_INITIAL_CAPACITY, float load_factor = DEFAULT_LOAD_FACTOR)
```

```c3
<*
 @param [in] values : "The values for the HashSet"
 @param [&inout] allocator : "The allocator to use"
 @require capacity > 0 : "The capacity must be 1 or higher"
 @require load_factor > 0.0 : "The load factor must be higher than 0"
 @require !self.is_initialized() : "Set was already initialized"
 @require capacity < MAXIMUM_CAPACITY : "Capacity cannot exceed maximum"
*>
```
```c3
fn HashSet* HashSet.init_from_values(&self, Allocator allocator, Value[] values, uint capacity = DEFAULT_INITIAL_CAPACITY, float load_factor = DEFAULT_LOAD_FACTOR)
```

```c3
<*
 @param [in] values : "The values for the HashSet entries"
 @require capacity > 0 : "The capacity must be 1 or higher"
 @require load_factor > 0.0 : "The load factor must be higher than 0"
 @require !self.is_initialized() : "Set was already initialized"
 @require capacity < MAXIMUM_CAPACITY : "Capacity cannot exceed maximum"
*>
```
```c3
fn HashSet* HashSet.tinit_from_values(&self, Value[] values, uint capacity = DEFAULT_INITIAL_CAPACITY, float load_factor = DEFAULT_LOAD_FACTOR)
```

Has this hash set been initialized yet?
```c3
<*
 @param [&in] set : "The hash set we are testing"
 @return "Returns true if it has been initialized, false otherwise"
*>
```
```c3
fn bool HashSet.is_initialized(&set)
```

```c3
<*
 @param [&inout] allocator : "The allocator to use"
 @param [&in] other_set : "The set to copy from."
 @require !self.is_initialized() : "Set was already initialized"
*>
```
```c3
fn HashSet* HashSet.init_from_set(&self, Allocator allocator, HashSet* other_set)
```

```c3
<*
 @param [&in] other_set : "The set to copy from."
 @require !set.is_initialized() : "Set was already initialized"
*>
```
```c3
fn HashSet* HashSet.tinit_from_set(&set, HashSet* other_set)
```

Check if the set is empty
```c3
<*
 @return "true if it is empty"
 @pure
*>
```
```c3
fn bool HashSet.is_empty(&set) @inline
```

Add all elements in the slice to the set.
```c3
<*
 @param [in] list
 @return "The number of new elements added"
 @ensure total <= list.len
*>
```
```c3
fn usz HashSet.add_all(&set, Value[] list)
```

```c3
<*
 @param [&in] other
 @return "The number of new elements added"
 @ensure return <= other.count
*>
```
```c3
fn usz HashSet.add_all_from(&set, HashSet* other)
```

```c3
<*
 @param value : "The value to add"
 @return "true if the value didn't exist in the set"
*>
```
```c3
fn bool HashSet.add(&set, Value value)
```

Iterate over all the values in the set
```c3
macro HashSet.@each(set; @body(value))
```

Check if the set contains the given value.
```c3
<*
 @param value : "The value to check"
 @return "true if it exists in the set"
*>
```
```c3
fn bool HashSet.contains(&set, Value value)
```

Remove a single value from the set.
```c3
<*
 @param value : "The value to remove"
 @return? NOT_FOUND : "If the entry is not found"
*>
```
```c3
fn void? HashSet.remove(&set, Value value) @maydiscard
```
```c3
fn usz HashSet.remove_all(&set, Value[] values)
```

```c3
<*
 @param [&in] other : "Other set"
*>
```
```c3
fn usz HashSet.remove_all_from(&set, HashSet* other)
```

Free all memory allocated by the hash set.
```c3
fn void HashSet.free(&set)
```

Clear all elements from the set while keeping the underlying storage
```c3
<*
 @ensure set.count == 0
*>
```
```c3
fn void HashSet.clear(&set)
```
```c3
fn void HashSet.reserve(&set, usz capacity)
```

Returns the union of two sets (A | B)
```c3
<*
 @param [&in] other : "The other set to union with"
 @param [&inout] allocator : "Allocator for the new set"
 @return "A new set containing the union of both sets"
*>
```
```c3
fn HashSet HashSet.set_union(&self, Allocator allocator, HashSet* other)
```
```c3
fn HashSet HashSet.tset_union(&self, HashSet* other)
```

Returns the intersection of the two sets (A & B)
```c3
<*
 @param [&in] other : "The other set to intersect with"
 @param [&inout] allocator : "Allocator for the new set"
 @return "A new set containing the intersection of both sets"
*>
```
```c3
fn HashSet HashSet.intersection(&self, Allocator allocator, HashSet* other)
```
```c3
fn HashSet HashSet.tintersection(&self, HashSet* other)
```

Return this set - other, so (A & ~B)
```c3
<*
 @param [&in] other : "The other set to compare with"
 @param [&inout] allocator : "Allocator for the new set"
 @return "A new set containing elements in this set but not in the other"
*>
```
```c3
fn HashSet HashSet.difference(&self, Allocator allocator, HashSet* other)
```
```c3
fn HashSet HashSet.tdifference(&self, HashSet* other)
```

Return (A ^ B)
```c3
<*
 @param [&in] other : "The other set to compare with"
 @param [&inout] allocator : "Allocator for the new set"
 @return "A new set containing elements in this set or the other, but not both"
*>
```
```c3
fn HashSet HashSet.symmetric_difference(&self, Allocator allocator, HashSet* other)
```
```c3
fn HashSet HashSet.tsymmetric_difference(&self, HashSet* other)
```

Check if this hash set is a subset of another set.
```c3
<*
 @param [&in] other : "The other set to check against"
 @return "True if all elements of this set are in the other set"
*>
```
```c3
fn bool HashSet.is_subset(&self, HashSet* other)
```
```c3
fn usz? HashSet.to_format(&self, Formatter* f) @dynamic
```
```c3
struct HashSetIterator
```
```c3
fn HashSetIterator HashSet.iter(&set)
```
```c3
fn Value? HashSetIterator.next(&self)
```
```c3
fn usz HashSetIterator.len(&self) @operator(len)
```
```c3
const LinkedHashSet LINKEDONHEAP
```
```c3
struct LinkedEntry
```
```c3
struct LinkedHashSet (Printable)
```
```c3
fn int LinkedHashSet.len(&self) @operator(len)
```

```c3
<*
 @param [&inout] allocator : "The allocator to use"
 @require capacity > 0 : "The capacity must be 1 or higher"
 @require load_factor > 0.0 : "The load factor must be higher than 0"
 @require !self.is_initialized() : "Set was already initialized"
 @require capacity < MAXIMUM_CAPACITY : "Capacity cannot exceed maximum"
*>
```
```c3
fn LinkedHashSet* LinkedHashSet.init(&self, Allocator allocator, usz capacity = DEFAULT_INITIAL_CAPACITY, float load_factor = DEFAULT_LOAD_FACTOR)
```

```c3
<*
 @require capacity > 0 : "The capacity must be 1 or higher"
 @require load_factor > 0.0 : "The load factor must be higher than 0"
 @require !self.is_initialized() : "Set was already initialized"
 @require capacity < MAXIMUM_CAPACITY : "Capacity cannot exceed maximum"
*>
```
```c3
fn LinkedHashSet* LinkedHashSet.tinit(&self, usz capacity = DEFAULT_INITIAL_CAPACITY, float load_factor = DEFAULT_LOAD_FACTOR)
```

```c3
<*
 @param [&inout] allocator : "The allocator to use"
 @require capacity > 0 : "The capacity must be 1 or higher"
 @require load_factor > 0.0 : "The load factor must be higher than 0"
 @require !self.is_initialized() : "Set was already initialized"
 @require capacity < MAXIMUM_CAPACITY : "Capacity cannot exceed maximum"
*>
```
```c3
macro LinkedHashSet* LinkedHashSet.init_with_values(&self, Allocator allocator, ..., uint capacity = DEFAULT_INITIAL_CAPACITY, float load_factor = DEFAULT_LOAD_FACTOR)
```

```c3
<*
 @require capacity > 0 : "The capacity must be 1 or higher"
 @require load_factor > 0.0 : "The load factor must be higher than 0"
 @require !self.is_initialized() : "Set was already initialized"
 @require capacity < MAXIMUM_CAPACITY : "Capacity cannot exceed maximum"
*>
```
```c3
macro LinkedHashSet* LinkedHashSet.tinit_with_values(&self, ..., uint capacity = DEFAULT_INITIAL_CAPACITY, float load_factor = DEFAULT_LOAD_FACTOR)
```

```c3
<*
 @param [in] values : "The values for the LinkedHashSet"
 @param [&inout] allocator : "The allocator to use"
 @require capacity > 0 : "The capacity must be 1 or higher"
 @require load_factor > 0.0 : "The load factor must be higher than 0"
 @require !self.is_initialized() : "Set was already initialized"
 @require capacity < MAXIMUM_CAPACITY : "Capacity cannot exceed maximum"
*>
```
```c3
fn LinkedHashSet* LinkedHashSet.init_from_values(&self, Allocator allocator, Value[] values, uint capacity = DEFAULT_INITIAL_CAPACITY, float load_factor = DEFAULT_LOAD_FACTOR)
```

```c3
<*
 @param [in] values : "The values for the LinkedHashSet entries"
 @require capacity > 0 : "The capacity must be 1 or higher"
 @require load_factor > 0.0 : "The load factor must be higher than 0"
 @require !self.is_initialized() : "Set was already initialized"
 @require capacity < MAXIMUM_CAPACITY : "Capacity cannot exceed maximum"
*>
```
```c3
fn LinkedHashSet* LinkedHashSet.tinit_from_values(&self, Value[] values, uint capacity = DEFAULT_INITIAL_CAPACITY, float load_factor = DEFAULT_LOAD_FACTOR)
```

Has this linked hash set been initialized yet?
```c3
<*
 @param [&in] set : "The linked hash set we are testing"
 @return "Returns true if it has been initialized, false otherwise"
*>
```
```c3
fn bool LinkedHashSet.is_initialized(&set)
```

```c3
<*
 @param [&inout] allocator : "The allocator to use"
 @param [&in] other_set : "The set to copy from."
 @require !self.is_initialized() : "Set was already initialized"
*>
```
```c3
fn LinkedHashSet* LinkedHashSet.init_from_set(&self, Allocator allocator, LinkedHashSet* other_set)
```

```c3
<*
 @param [&in] other_set : "The set to copy from."
 @require !set.is_initialized() : "Set was already initialized"
*>
```
```c3
fn LinkedHashSet* LinkedHashSet.tinit_from_set(&set, LinkedHashSet* other_set)
```

Check if the set is empty
```c3
<*
 @return "true if it is empty"
 @pure
*>
```
```c3
fn bool LinkedHashSet.is_empty(&set) @inline
```

Add all elements in the slice to the set.
```c3
<*
 @param [in] list
 @return "The number of new elements added"
 @ensure total <= list.len
*>
```
```c3
fn usz LinkedHashSet.add_all(&set, Value[] list)
```

```c3
<*
 @param [&in] other
 @return "The number of new elements added"
 @ensure return <= other.count
*>
```
```c3
fn usz LinkedHashSet.add_all_from(&set, LinkedHashSet* other)
```

```c3
<*
 @param value : "The value to add"
 @return "true if the value didn't exist in the set"
*>
```
```c3
fn bool LinkedHashSet.add(&set, Value value)
```

Iterate over all the values in the set
```c3
macro LinkedHashSet.@each(set; @body(value))
```

Check if the set contains the given value.
```c3
<*
 @param value : "The value to check"
 @return "true if it exists in the set"
*>
```
```c3
fn bool LinkedHashSet.contains(&set, Value value)
```

Remove a single value from the set.
```c3
<*
 @param value : "The value to remove"
 @return? NOT_FOUND : "If the entry is not found"
*>
```
```c3
fn void? LinkedHashSet.remove(&set, Value value) @maydiscard
```
```c3
fn usz LinkedHashSet.remove_all(&set, Value[] values)
```

```c3
<*
 @param [&in] other : "Other set"
*>
```
```c3
fn usz LinkedHashSet.remove_all_from(&set, LinkedHashSet* other)
```

Free all memory allocated by the hash set.
```c3
fn void LinkedHashSet.free(&set)
```

Clear all elements from the set while keeping the underlying storage
```c3
<*
 @ensure set.count == 0
*>
```
```c3
fn void LinkedHashSet.clear(&set)
```
```c3
fn void LinkedHashSet.reserve(&set, usz capacity)
```

Returns the union of two sets (A | B)
```c3
<*
 @param [&in] other : "The other set to union with"
 @param [&inout] allocator : "Allocator for the new set"
 @return "A new set containing the union of both sets"
*>
```
```c3
fn LinkedHashSet LinkedHashSet.set_union(&self, Allocator allocator, LinkedHashSet* other)
```
```c3
fn LinkedHashSet LinkedHashSet.tset_union(&self, LinkedHashSet* other)
```

Returns the intersection of the two sets (A & B)
```c3
<*
 @param [&in] other : "The other set to intersect with"
 @param [&inout] allocator : "Allocator for the new set"
 @return "A new set containing the intersection of both sets"
*>
```
```c3
fn LinkedHashSet LinkedHashSet.intersection(&self, Allocator allocator, LinkedHashSet* other)
```
```c3
fn LinkedHashSet LinkedHashSet.tintersection(&self, LinkedHashSet* other)
```

Return this set - other, so (A & ~B)
```c3
<*
 @param [&in] other : "The other set to compare with"
 @param [&inout] allocator : "Allocator for the new set"
 @return "A new set containing elements in this set but not in the other"
*>
```
```c3
fn LinkedHashSet LinkedHashSet.difference(&self, Allocator allocator, LinkedHashSet* other)
```
```c3
fn LinkedHashSet LinkedHashSet.tdifference(&self, LinkedHashSet* other)
```

Return (A ^ B)
```c3
<*
 @param [&in] other : "The other set to compare with"
 @param [&inout] allocator : "Allocator for the new set"
 @return "A new set containing elements in this set or the other, but not both"
*>
```
```c3
fn LinkedHashSet LinkedHashSet.symmetric_difference(&self, Allocator allocator, LinkedHashSet* other)
```
```c3
fn LinkedHashSet LinkedHashSet.tsymmetric_difference(&self, LinkedHashSet* other)
```

Check if this hash set is a subset of another set.
```c3
<*
 @param [&in] other : "The other set to check against"
 @return "True if all elements of this set are in the other set"
*>
```
```c3
fn bool LinkedHashSet.is_subset(&self, LinkedHashSet* other)
```
```c3
fn usz? LinkedHashSet.to_format(&self, Formatter* f) @dynamic
```
```c3
struct LinkedHashSetIterator
```
```c3
fn LinkedHashSetIterator LinkedHashSet.iter(&set)
```
```c3
fn bool LinkedHashSetIterator.next(&self)
```
```c3
fn Value*? LinkedHashSetIterator.get(&self)
```
```c3
fn bool LinkedHashSetIterator.has_next(&self)
```
```c3
fn usz LinkedHashSetIterator.len(&self) @operator(len)
```
### `std::collections::triple{Type1, Type2, Type3}`
```c3
struct Triple (Printable)
```
```c3
fn usz? Triple.to_format(&self, Formatter* f) @dynamic
```

```c3
<*
 @param [&out] a
 @param [&out] b
 @param [&out] c
 @require @assignable_to(self.first, $typeof(*a)) : "You cannot assign the first value to a"
 @require @assignable_to(self.second, $typeof(*b)) : "You cannot assign the second value to b"
 @require @assignable_to(self.third, $typeof(*c)) : "You cannot assign the second value to c"
*>
```
```c3
macro void Triple.unpack(&self, a, b, c)
```
```c3
fn bool Triple.equal(self, Triple other) @operator(==) @if
```
### `std::collections::tuple{Type1, Type2}`
```c3
struct Tuple @deprecated("Use 'Pair' instead")
```
### `std::compression::qoi`
```c3
const uint PIXELS_MAX
```

Colorspace.
Purely informative. It will be saved to the file header,
but does not affect how chunks are en-/decoded.
```c3
enum QOIColorspace : char (char id)
```

Channels.
The channels used in an image.
AUTO can be used when decoding to automatically determine
the channels from the file's header.
```c3
enum QOIChannels : char (char id)
```

Descriptor.
Contains information about an image.
```c3
struct QOIDesc
```

QOI Errors.
These are all the possible bad outcomes.
```c3
faultdef INVALID_PARAMETERS, FILE_OPEN_FAILED, FILE_WRITE_FAILED, INVALID_DATA, TOO_MANY_PIXELS
```

Encode raw RGB or RGBA pixels into a QOI image in memory.

The function returns an optional, which can either be a QOIError
or a char[] pointing to the encoded data on success.

The returned qoi data should be free()d after use, or the encoding
and use of the data should be wrapped in a @pool() { ... }; block.
See the write() function for an example.
```c3
<*
 @param [in] input : `The raw RGB or RGBA pixels to encode`
 @param [&in] desc : `The descriptor of the image`
 @return? INVALID_PARAMETERS, TOO_MANY_PIXELS, INVALID_DATA
*>
```
```c3
fn char[]? encode(Allocator allocator, char[] input, QOIDesc* desc) @nodiscard
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
```c3
<*
 @param [in] data : `The QOI image data to decode`
 @param [&out] desc : `The descriptor to fill with the image's info`
 @param channels : `The channels to be used`
 @return? INVALID_DATA, TOO_MANY_PIXELS
*>
```
```c3
fn char[]? decode(Allocator allocator, char[] data, QOIDesc* desc, QOIChannels channels = AUTO) @nodiscard
```
### `std::compression::qoi @if(!$feature(QOI_NO_STDIO))`

Encode raw RGB or RGBA pixels into a QOI image and write it to the
file system.

The desc struct must be filled with the image width, height, the
used channels (QOIChannels.RGB or RGBA) and the colorspace
(QOIColorspace.SRGB or LINEAR).

The function returns an optional, which can either be a QOIError
or the number of bytes written on success.
```c3
<*
 @param [in] filename : `The file's name to write the image to`
 @param [in] input : `The raw RGB or RGBA pixels to encode`
 @param [&in] desc : `The descriptor of the image`
*>
```
```c3
fn usz? write(String filename, char[] input, QOIDesc* desc)
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
```c3
<*
 @param [in] filename : `The file's name to read the image from`
 @param [&out] desc : `The descriptor to fill with the image's info`
 @param channels : `The channels to be used`
 @return? FILE_OPEN_FAILED, INVALID_DATA, TOO_MANY_PIXELS
*>
```
```c3
fn char[]? read(Allocator allocator, String filename, QOIDesc* desc, QOIChannels channels = AUTO)
```
### `std::core::array`

Returns true if the array contains at least one element, else false
 
```c3
<*
 @param [in] array
 @param [in] element
 @require @typekind(array) == SLICE || @typekind(array) == ARRAY
 @require @typeis(array[0], $typeof(element)) : "array and element must have the same type"
*>
```
```c3
macro bool contains(array, element)
```

Return the first index of element found in the array, searching from the start.
 
```c3
<*
 @param [in] array
 @param [in] element
 @return "the first index of the element"
 @return? NOT_FOUND
*>
```
```c3
macro index_of(array, element)
```

Slice a 2d array and create a Slice2d from it.
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
```
```c3
macro slice2d(array_ptr, x = 0, xlen = 0, y = 0, ylen = 0)
```

Return the first index of element found in the array, searching in reverse from the end.
 
```c3
<*
 @param [in] array
 @param [in] element
 @return "the last index of the element"
 @return? NOT_FOUND
*>
```
```c3
macro rindex_of(array, element)
```

Concatenate two arrays or slices, returning a slice containing the concatenation of them.
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
```
```c3
macro concat(Allocator allocator, arr1, arr2) @nodiscard
```

Concatenate two arrays or slices, returning a slice containing the concatenation of them,
allocated using the temp allocator.
```c3
<*
 @param [in] arr1
 @param [in] arr2
 @require @typekind(arr1) == SLICE || @typekind(arr1) == ARRAY
 @require @typekind(arr2) == SLICE || @typekind(arr2) == ARRAY
 @require @typeis(arr1[0], $typeof(arr2[0])) : "Arrays must have the same type"
 @ensure return.len == arr1.len + arr2.len
*>
```
```c3
macro tconcat(arr1, arr2) @nodiscard
```
### `std::core::array::slice {Type}`

A slice2d allows slicing an array like int[10][10] into an arbitrary "int[][]"-like counterpart
Typically you'd use array::slice2d(...) to create one.
```c3
struct Slice2d
```

```c3
<*
 @return `The length of the "outer" slice`
*>
```
```c3
fn usz Slice2d.len(&self) @operator(len)
```

```c3
<*
 @return `The total number of elements.`
*>
```
```c3
fn usz Slice2d.count(&self)
```

Step through each element of the slice.
```c3
macro void Slice2d.@each(&self; @body(usz[<2>], Type))
```

Step through each element of the slice *by reference*
```c3
macro void Slice2d.@each_ref(&self; @body(usz[<2>], Type*))
```

Return a row as a slice.
```c3
<*
 @param idy : "The row to return"
 @return "The slice for the particular row"
 @require idy >= 0 && idy < self.ylen
*>
```
```c3
macro Type[] Slice2d.get_row(self, usz idy) @operator([])
```

Get the value at a particular x/y position in the slice.
```c3
<*
 @param coord : "The xy coordinate"
 @return "The value at that coordinate"
 @require coord.y >= 0 && coord.y < self.ylen : "y value out of range"
 @require coord.x >= 0 && coord.x < self.xlen : "x value out of range"
*>
```
```c3
macro Type Slice2d.get_coord(self, usz[<2>] coord)
```

Get a pointer to the value at a particular x/y position in the slice.
```c3
<*
 @param coord : "The xy coordinate"
 @return "A pointer to the value at that coordinate"
 @require coord.y >= 0 && coord.y < self.ylen : "y value out of range"
 @require coord.x >= 0 && coord.x < self.xlen : "x value out of range"
*>
```
```c3
macro Type* Slice2d.get_coord_ref(self, usz[<2>] coord)
```

Get the value at a particular x/y position in the slice.
```c3
<*
 @param x : "The x coordinate"
 @param y : "The x coordinate"
 @return "The value at that coordinate"
 @require y >= 0 && y < self.ylen : "y value out of range"
 @require x >= 0 && x < self.xlen : "x value out of range"
*>
```
```c3
macro Type Slice2d.get_xy(self, x, y)
```

Get the value at a particular x/y position in the slice by reference.
```c3
<*
 @param x : "The x coordinate"
 @param y : "The y coordinate"
 @return "A pointer to the value at that coordinate"
 @require y >= 0 && y < self.ylen : "y value out of range"
 @require x >= 0 && x < self.xlen : "x value out of range"
*>
```
```c3
macro Type* Slice2d.get_xy_ref(self, x, y)
```

Set the ´value at a particular x/y position in the slice.
```c3
<*
 @param coord : "The xy coordinate"
 @param value : "The new value"
 @require coord.y >= 0 && coord.y < self.ylen : "y value out of range"
 @require coord.x >= 0 && coord.x < self.xlen : "x value out of range"
*>
```
```c3
macro void Slice2d.set_coord(self, usz[<2>] coord, Type value)
```

Set the value at a particular x/y position in the slice.
```c3
<*
 @param x : "The x coordinate"
 @param y : "The y coordinate"
 @param value : "The new value"
 @require y >= 0 && y < self.ylen : "y value out of range"
 @require x >= 0 && x < self.xlen : "x value out of range"
*>
```
```c3
macro void Slice2d.set_xy(self, x, y, Type value)
```

Reslice a slice2d returning a new slice.
```c3
<*
 @param x : "The starting x"
 @param xlen : "The length along x"
 @param y : "The starting y"
 @param ylen : "The length along y"
 @require y >= 0 && y < self.ylen
 @require x >= 0 && x < self.xlen
*>
```
```c3
fn Slice2d Slice2d.slice(&self, isz x = 0, isz xlen = 0, isz y = 0, isz ylen = 0)
```
### `std::core::ascii`
```c3
macro bool @is_lower(c)
```
```c3
macro bool @is_upper(c)
```
```c3
macro bool @is_digit(c)
```
```c3
macro bool @is_bdigit(c)
```
```c3
macro bool @is_odigit(c)
```
```c3
macro bool @is_xdigit(c)
```
```c3
macro bool @is_alpha(c)
```
```c3
macro bool @is_print(c)
```
```c3
macro bool @is_graph(c)
```
```c3
macro bool @is_space(c)
```
```c3
macro bool @is_alnum(c)
```
```c3
macro bool @is_punct(c)
```
```c3
macro bool @is_blank(c)
```
```c3
macro bool @is_cntrl(c)
```
```c3
macro char @to_lower(c)
```
```c3
macro char @to_upper(c)
```
```c3
fn bool is_lower(char c)
```
```c3
fn bool is_upper(char c)
```
```c3
fn bool is_digit(char c)
```
```c3
fn bool is_bdigit(char c)
```
```c3
fn bool is_odigit(char c)
```
```c3
fn bool is_xdigit(char c)
```
```c3
fn bool is_alpha(char c)
```
```c3
fn bool is_print(char c)
```
```c3
fn bool is_graph(char c)
```
```c3
fn bool is_space(char c)
```
```c3
fn bool is_alnum(char c)
```
```c3
fn bool is_punct(char c)
```
```c3
fn bool is_blank(char c)
```
```c3
fn bool is_cntrl(char c)
```
```c3
fn char to_lower(char c)
```
```c3
fn char to_upper(char c)
```
```c3
macro bool char.is_lower(char c)
```
```c3
macro bool char.is_upper(char c)
```
```c3
macro bool char.is_digit(char c)
```
```c3
macro bool char.is_bdigit(char c)
```
```c3
macro bool char.is_odigit(char c)
```
```c3
macro bool char.is_xdigit(char c)
```
```c3
macro bool char.is_alpha(char c)
```
```c3
macro bool char.is_print(char c)
```
```c3
macro bool char.is_graph(char c)
```
```c3
macro bool char.is_space(char c)
```
```c3
macro bool char.is_alnum(char c)
```
```c3
macro bool char.is_punct(char c)
```
```c3
macro bool char.is_blank(char c)
```
```c3
macro bool char.is_cntrl(char c)
```
```c3
macro char char.to_lower(char c)
```
```c3
macro char char.to_upper(char c)
```

Convert a-f/A-F/0-9 to the appropriate hex value.
```c3
<*
 @require c.is_xdigit()
 @ensure return >= 0 && return <= 15
*>
```
```c3
macro char char.from_hex(char c)
```
```c3
const char[256] HEX_VALUE
```
### `std::core::bitorder`
```c3
bitstruct ShortBE : short @bigendian
```
```c3
bitstruct UShortBE : ushort @bigendian
```
```c3
bitstruct IntBE : int @bigendian
```
```c3
bitstruct UIntBE : int @bigendian
```
```c3
bitstruct LongBE : long @bigendian
```
```c3
bitstruct ULongBE : ulong @bigendian
```
```c3
bitstruct Int128BE : int128 @bigendian
```
```c3
bitstruct UInt128BE : uint128 @bigendian
```
```c3
bitstruct ShortLE : short @littleendian
```
```c3
bitstruct UShortLE : ushort @littleendian
```
```c3
bitstruct IntLE : int @littleendian
```
```c3
bitstruct UIntLE : int @littleendian
```
```c3
bitstruct LongLE : long @littleendian
```
```c3
bitstruct ULongLE : ulong @littleendian
```
```c3
bitstruct Int128LE : int128 @littleendian
```
```c3
bitstruct UInt128LE : uint128 @littleendian
```

```c3
<*
 @require @is_array_or_slice_of_char(bytes) : "argument must be an array, a pointer to an array or a slice of char"
 @require is_bitorder($Type) : "type must be a bitorder integer"
*>
```
```c3
macro read(bytes, $Type)
```

```c3
<*
 @require @is_arrayptr_or_slice_of_char(bytes) : "argument must be a pointer to an array or a slice of char"
 @require is_bitorder($Type) : "type must be a bitorder integer"
*>
```
```c3
macro write(x, bytes, $Type)
```
```c3
macro is_bitorder($Type)
```
```c3
macro bool is_array_or_slice_of_char(bytes) @deprecated("Use @is_array_or_slice_of_char")
```
```c3
macro bool @is_array_or_slice_of_char(#bytes) @const
```
```c3
macro bool is_arrayptr_or_slice_of_char(bytes) @deprecated("Use @is_arrayptr_or_slice_of_char")
```
```c3
macro bool @is_arrayptr_or_slice_of_char(#bytes) @const
```
### `std::core::builtin`

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
```c3
const EmptySlot EMPTY_MACRO_SLOT @builtin
```
```c3
typedef EmptySlot = void*
```
```c3
macro @is_empty_macro_slot(#arg) @const @builtin
```
```c3
macro @is_valid_macro_slot(#arg) @const @builtin
```

Returns a random value at compile time.
```c3
<*
 @ensure return >= 0.0 && return < 1.0
 @return "A compile time random"
*>
```
```c3
macro @rnd() @const @builtin
```
```c3
faultdef NO_MORE_ELEMENT @builtin
```
```c3
faultdef NOT_FOUND @builtin
```
```c3
faultdef TYPE_MISMATCH @builtin
```
```c3
faultdef CAPACITY_EXCEEDED @builtin
```
```c3
faultdef NOT_IMPLEMENTED @builtin
```
```c3
alias VoidFn = fn void()
```

Stores a variable on the stack, then restores it at the end of the
macro scope.
```c3
<*
 @param #variable : `the variable to store and restore`
 @require values::@is_lvalue(#variable)
*>
```
```c3
macro void @scope(#variable; @body) @builtin
```

Swap two variables
```c3
<*
 @require $defined(#a = #b, #b = #a) : `The values must be mutually assignable`
*>
```
```c3
macro void @swap(#a, #b) @builtin
```
```c3
macro usz bitsizeof($Type) @builtin @const
```
```c3
macro usz @bitsizeof(#expr) @builtin @const
```

Convert an `any` type to a type, returning an failure if there is a type mismatch.
```c3
<*
 @param v : `the any to convert to the given type.`
 @param $Type : `the type to convert to`
 @return `The any.ptr converted to its type.`
 @ensure @typeis(return, $Type*)
 @return? TYPE_MISMATCH
*>
```
```c3
macro anycast(any v, $Type) @builtin
```
```c3
macro bool @assignable_to(#foo, $Type) @const @builtin
```
```c3
macro @addr(#val) @builtin
```
```c3
macro typeid @typeid(#value) @const @builtin
```
```c3
macro TypeKind @typekind(#value) @const @builtin
```
```c3
macro bool @typeis(#value, $Type) @const @builtin
```
```c3
fn bool print_backtrace(String message, int backtraces_to_ignore) @if
```
```c3
fn void default_panic(String message, String file, String function, uint line) @if(env::NATIVE_STACKTRACE)
```
```c3
macro void abort(String string = "Unrecoverable error reached", ...) @format(0) @builtin @noreturn
```
```c3
fn void default_panic(String message, String file, String function, uint line) @if
```
```c3
alias PanicFn = fn void(String message, String file, String function, uint line)
```
```c3
fn void panicf(String fmt, String file, String function, uint line, args...)
```

Marks the path as unreachable. This will panic in safe mode, and in fast will simply be assumed
never happens.
```c3
<*
 @param [in] string : "The panic message or format string"
*>
```
```c3
macro void unreachable(String string = "Unreachable statement reached.", ...) @builtin @noreturn
```

Marks the path as unsupported, this is similar to unreachable.
```c3
<*
 @param [in] string : "The error message"
*>
```
```c3
macro void unsupported(String string = "Unsupported function invoked") @builtin @noreturn
```

Unconditionally break into an attached debugger when reached.
```c3
macro void breakpoint() @builtin
```
```c3
macro any_make(void* ptr, typeid type) @builtin
```
```c3
macro any.retype_to(&self, typeid type)
```
```c3
macro any.as_inner(&self)
```

```c3
<*
 @param expr : "the expression to cast"
 @param $Type : "the type to cast to"
 @require $sizeof(expr) == $Type.sizeof  : "Cannot bitcast between types of different size."
 @ensure @typeis(return, $Type)
*>
```
```c3
macro bitcast(expr, $Type) @builtin
```

```c3
<*
 @param $Type : `The type of the enum`
 @param [in] enum_name : `The name of the enum to search for`
 @require $Type.kindof == ENUM : `Only enums may be used`
 @ensure @typeis(return, $Type)
 @return? NOT_FOUND
*>
```
```c3
macro enum_by_name($Type, String enum_name) @builtin
```

```c3
<*
 @param $Type : `The type of the enum`
 @require $Type.kindof == ENUM : `Only enums may be used`
 @require $defined($Type.#value) : `Expected '#value' to match an enum associated value`
 @require @assignable_to(value, $typeof(($Type){}.#value)) : `Expected the value to match the type of the associated value`
 @ensure @typeis(return, $Type)
 @return? NOT_FOUND
*>
```
```c3
macro @enum_from_value($Type, #value, value) @builtin @deprecated("Use Enum.lookup_field and Enum.lookup")
```

Mark an expression as likely to be true
```c3
<*
 @param #value : "expression to be marked likely"
 @param $probability : "in the range 0 - 1"
 @require $probability >= 0 && $probability <= 1.0
*>
```
```c3
macro bool @likely(bool #value, $probability = 1.0) @builtin
```

Mark an expression as unlikely to be true
```c3
<*
 @param #value : "expression to be marked unlikely"
 @param $probability : "in the range 0 - 1"
 @require $probability >= 0 && $probability <= 1.0
*>
```
```c3
macro bool @unlikely(bool #value, $probability = 1.0) @builtin
```

```c3
<*
 @require values::@is_int(#value) || values::@is_bool(#value)
 @require @assignable_to(expected, $typeof(#value))
 @require $probability >= 0 && $probability <= 1.0
*>
```
```c3
macro @expect(#value, expected, $probability = 1.0) @builtin
```

Locality for prefetch, levels 0 - 3, corresponding
to "extremely local" to "no locality"
```c3
enum PrefetchLocality
```

Prefetch a pointer.
```c3
<*
 @param [in] ptr : `Pointer to prefetch`
 @param $locality : `Locality ranging from none to extremely local`
 @param $write : `Prefetch for write, otherwise prefetch for read.`
*>
```
```c3
macro @prefetch(void* ptr, PrefetchLocality $locality = VERY_NEAR, bool $write = false) @builtin
```
```c3
macro swizzle(v, ...) @builtin
```
```c3
macro swizzle2(v, v2, ...) @builtin
```

Returns the count of leading zero bits from an integer at compile-time.
```c3
<*
 @require types::is_int($typeof($value)) : "Input value must be an integer"
 @require $sizeof($value) * 8 <= 128 : "Input value must be 128 bits wide or lower"
*>
```
```c3
macro @clz($value) @builtin @const
```

Return the excuse in the Optional if it is Empty, otherwise
return a null fault.
```c3
<*
 @require @typekind(#expr) == OPTIONAL : `@catch expects an Optional value`
*>
```
```c3
macro fault @catch(#expr) @builtin
```

Check if an Optional expression holds a value or is empty, returning true
if it has a value.
```c3
<*
 @require @typekind(#expr) == OPTIONAL : `@ok expects an Optional value`
*>
```
```c3
macro bool @ok(#expr) @builtin
```

Check if an Optional expression evaluates to a fault. If so, return it;
else, assign the result to an expression.
```c3
<*
 @require $defined(#v = #v) : "#v must be a variable"
 @require $defined(#expr!) : "Expected an optional expression"
 @require @assignable_to(#expr!!, $typeof(#v))  : `Type of #expr must be an optional of #v's type`
*>
```
```c3
macro void? @try(#v, #expr) @builtin
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
```c3
<*
 @require $defined(#v = #v) : "#v must be a variable"
 @require $defined(#expr!) : "Expected an optional expression"
 @require @assignable_to(#expr!!, $typeof(#v))  : `Type of #expr must be an optional of #v's type`
 @return "True if it was the expected fault, false if the variable was assigned, otherwise returns an optional."
*>
```
```c3
macro bool? @try_catch(#v, #expr, fault expected_fault) @builtin
```

```c3
<*
 @require $defined(&#value, (char*)&#value) : "This must be a value that can be viewed as a char array"
*>
```
```c3
macro char[] @as_char_view(#value) @builtin
```
```c3
macro isz @str_find(String $string, String $needle) @builtin
```
```c3
macro String @str_upper(String $str) @builtin
```
```c3
macro String @str_lower(String $str) @builtin
```
```c3
macro uint @str_hash(String $str) @builtin
```
```c3
macro @generic_hash_core(h, value)
```
```c3
macro @generic_hash(value)
```
```c3
macro uint int128.hash(self)
```
```c3
macro uint uint128.hash(self)
```
```c3
macro uint long.hash(self)
```
```c3
macro uint ulong.hash(self)
```
```c3
macro uint int.hash(self)
```
```c3
macro uint uint.hash(self)
```
```c3
macro uint short.hash(self)
```
```c3
macro uint ushort.hash(self)
```
```c3
macro uint ichar.hash(self)
```
```c3
macro uint char.hash(self)
```
```c3
macro uint bool.hash(self)
```
```c3
macro uint int128[*].hash(&self)
```
```c3
macro uint uint128[*].hash(&self)
```
```c3
macro uint long[*].hash(&self)
```
```c3
macro uint ulong[*].hash(&self)
```
```c3
macro uint int[*].hash(&self)
```
```c3
macro uint uint[*].hash(&self)
```
```c3
macro uint short[*].hash(&self)
```
```c3
macro uint ushort[*].hash(&self)
```
```c3
macro uint char[*].hash(&self)
```
```c3
macro uint ichar[*].hash(&self)
```
```c3
macro uint bool[*].hash(&self)
```
```c3
macro uint int128[<*>].hash(self)
```
```c3
macro uint uint128[<*>].hash(self)
```
```c3
macro uint long[<*>].hash(self)
```
```c3
macro uint ulong[<*>].hash(self)
```
```c3
macro uint int[<*>].hash(self)
```
```c3
macro uint uint[<*>].hash(self)
```
```c3
macro uint short[<*>].hash(self)
```
```c3
macro uint ushort[<*>].hash(self)
```
```c3
macro uint char[<*>].hash(self)
```
```c3
macro uint ichar[<*>].hash(self)
```
```c3
macro uint bool[<*>].hash(self)
```
```c3
macro uint typeid.hash(typeid t)
```
```c3
macro uint String.hash(String c)
```
```c3
macro uint char[].hash(char[] c)
```
```c3
macro uint void*.hash(void* ptr)
```
```c3
const MAX_FRAMEADDRESS
```

```c3
<*
 @require n >= 0
*>
```
```c3
macro void* get_frameaddress(int n)
```

```c3
<*
 @require n >= 0
*>
```
```c3
macro void* get_returnaddress(int n)
```

```c3
<*
 @require types::@comparable_value(a) && types::@comparable_value(b)
*>
```
```c3
macro less(a, b) @builtin
```

```c3
<*
 @require types::@comparable_value(a) && types::@comparable_value(b)
*>
```
```c3
macro less_eq(a, b) @builtin
```

```c3
<*
 @require types::@comparable_value(a) && types::@comparable_value(b)
*>
```
```c3
macro greater(a, b) @builtin
```

```c3
<*
 @require types::@comparable_value(a) && types::@comparable_value(b)
*>
```
```c3
macro int compare_to(a, b) @builtin
```

```c3
<*
 @require types::@comparable_value(a) && types::@comparable_value(b)
*>
```
```c3
macro greater_eq(a, b) @builtin
```

```c3
<*
 @require types::@equatable_value(a) && types::@equatable_value(b) : `values must be equatable`
*>
```
```c3
macro bool equals(a, b) @builtin
```
```c3
macro min(x, ...) @builtin
```
```c3
macro max(x, ...) @builtin
```
### `std::core::builtin @if((env::LINUX || env::ANDROID || env::DARWIN) && env::COMPILER_SAFE_MODE && env::DEBUG_SYMBOLS)`
```c3
fn void sig_panic(String message)
```
```c3
fn void sig_bus_error(CInt i)
```
```c3
fn void sig_segmentation_fault(CInt i)
```
### `std::core::cinterop`
```c3
const C_INT_SIZE
```
```c3
const C_LONG_SIZE
```
```c3
const C_SHORT_SIZE
```
```c3
const C_LONG_LONG_SIZE
```
```c3
alias CShort = $typefrom(signed_int_from_bitsize($$C_SHORT_SIZE))
```
```c3
alias CUShort = $typefrom(unsigned_int_from_bitsize($$C_SHORT_SIZE))
```
```c3
alias CInt = $typefrom(signed_int_from_bitsize($$C_INT_SIZE))
```
```c3
alias CUInt = $typefrom(unsigned_int_from_bitsize($$C_INT_SIZE))
```
```c3
alias CLong = $typefrom(signed_int_from_bitsize($$C_LONG_SIZE))
```
```c3
alias CULong = $typefrom(unsigned_int_from_bitsize($$C_LONG_SIZE))
```
```c3
alias CLongLong = $typefrom(signed_int_from_bitsize($$C_LONG_LONG_SIZE))
```
```c3
alias CULongLong = $typefrom(unsigned_int_from_bitsize($$C_LONG_LONG_SIZE))
```
```c3
alias CSChar = ichar
```
```c3
alias CUChar = char
```
```c3
alias CChar = $typefrom($$C_CHAR_IS_SIGNED ? ichar.typeid : char.typeid)
```
```c3
enum CBool : char
```
### `std::core::cpudetect @if(env::X86 || env::X86_64)`
```c3
struct CpuId
```
```c3
fn CpuId x86_cpuid(uint eax, uint ecx = 0)
```
```c3
enum X86Feature
```
```c3
fn void add_feature_if_bit(X86Feature feature, uint register, int bit)
```
```c3
fn void x86_initialize_cpu_features()
```
### `std::core::dstring`

The DString offers a dynamic string builder.
```c3
typedef DString (OutStream) = DStringOpaque*
```
```c3
typedef DStringOpaque = void
```

Initialize the DString with a particular allocator.
```c3
<*
 @param [&inout] allocator : "The allocator to use"
 @param capacity : "Starting capacity, defaults to MIN_CAPACITY and cannot be smaller"
 @return "Return the DString itself"
 @require !self.data() : "String already initialized"
*>
```
```c3
fn DString DString.init(&self, Allocator allocator, usz capacity = MIN_CAPACITY)
```

Initialize the DString with the temp allocator. Note that if the dstring is never
initialized, this is the allocator it will default to.
```c3
<*
 @param capacity : "Starting capacity, defaults to MIN_CAPACITY and cannot be smaller"
 @return "Return the DString itself"
 @require !self.data() : "String already initialized"
*>
```
```c3
fn DString DString.tinit(&self, usz capacity = MIN_CAPACITY)
```
```c3
fn DString new_with_capacity(Allocator allocator, usz capacity)
```
```c3
fn DString temp_with_capacity(usz capacity)
```
```c3
fn DString new(Allocator allocator, String c = "")
```
```c3
fn DString temp(String s = "")
```
```c3
fn void DString.replace_char(self, char ch, char replacement)
```
```c3
fn void DString.replace(&self, String needle, String replacement)
```
```c3
fn DString DString.concat(self, Allocator allocator, DString b) @nodiscard
```
```c3
fn DString DString.tconcat(self, DString b)
```
```c3
fn ZString DString.zstr_view(&self)
```
```c3
fn usz DString.capacity(self)
```
```c3
fn usz DString.len(&self) @dynamic @operator(len)
```

```c3
<*
 @require new_size <= self.len()
*>
```
```c3
fn void DString.chop(self, usz new_size)
```
```c3
fn String DString.str_view(self)
```

```c3
<*
 @require index < self.len()
 @require self.data() != null : "Empty string"
*>
```
```c3
fn char DString.char_at(self, usz index) @operator([])
```

```c3
<*
 @require index < self.len()
 @require self.data() != null  : "Empty string"
*>
```
```c3
fn char* DString.char_ref(&self, usz index) @operator(&[])
```
```c3
fn usz DString.append_utf32(&self, Char32[] chars)
```

```c3
<*
 @require index < self.len()
*>
```
```c3
fn void DString.set(self, usz index, char c) @operator([]=)
```
```c3
fn void DString.append_repeat(&self, char c, usz times)
```

```c3
<*
 @require c <= 0x10ffff
*>
```
```c3
fn usz DString.append_char32(&self, Char32 c)
```
```c3
fn DString DString.tcopy(&self)
```
```c3
fn DString DString.copy(self, Allocator allocator) @nodiscard
```
```c3
fn ZString DString.copy_zstr(self, Allocator allocator) @nodiscard
```
```c3
fn String DString.copy_str(self, Allocator allocator) @nodiscard
```
```c3
fn String DString.tcopy_str(self) @nodiscard
```
```c3
fn bool DString.equals(self, DString other_string)
```
```c3
fn void DString.free(&self)
```
```c3
fn bool DString.less(self, DString other_string)
```
```c3
fn void DString.append_chars(&self, String str)
```
```c3
fn Char32[] DString.copy_utf32(&self, Allocator allocator)
```
```c3
fn void DString.append_string(&self, DString str)
```
```c3
fn void DString.clear(self)
```
```c3
fn usz? DString.write(&self, char[] buffer) @dynamic
```
```c3
fn void? DString.write_byte(&self, char c) @dynamic
```
```c3
fn void DString.append_char(&self, char c)
```

```c3
<*
 @require start < self.len()
 @require end < self.len()
 @require end >= start : "End must be same or equal to the start"
*>
```
```c3
fn void DString.delete_range(&self, usz start, usz end)
```

```c3
<*
 @require start < self.len()
 @require start + len <= self.len()
*>
```
```c3
fn void DString.delete(&self, usz start, usz len = 1)
```
```c3
macro void DString.append(&self, value)
```

```c3
<*
 @require index <= self.len()
*>
```
```c3
fn void DString.insert_chars_at(&self, usz index, String s)
```

```c3
<*
 @require index <= self.len()
*>
```
```c3
fn void DString.insert_string_at(&self, usz index, DString str)
```

```c3
<*
 @require index <= self.len()
*>
```
```c3
fn void DString.insert_char_at(&self, usz index, char c)
```

```c3
<*
 @require index <= self.len()
*>
```
```c3
fn usz DString.insert_char32_at(&self, usz index, Char32 c)
```

```c3
<*
 @require index <= self.len()
*>
```
```c3
fn usz DString.insert_utf32_at(&self, usz index, Char32[] chars)
```
```c3
macro void DString.insert_at(&self, usz index, value)
```
```c3
fn usz? DString.appendf(&self, String format, args...) @maydiscard
```
```c3
fn usz? DString.appendfn(&self, String format, args...) @maydiscard
```
```c3
fn DString join(Allocator allocator, String[] s, String joiner) @nodiscard
```
```c3
fn void DString.reverse(self)
```
```c3
fn void DString.reserve(&self, usz addition)
```
```c3
fn usz? DString.read_from_stream(&self, InStream reader)
```
### `std::core::env`
```c3
enum CompilerOptLevel
```
```c3
enum MemoryEnvironment
```
```c3
enum OsType
```
```c3
enum ArchType
```
```c3
const String COMPILER_BUILD_HASH
```
```c3
const String COMPILER_BUILD_DATE
```
```c3
const OsType OS_TYPE
```
```c3
const ArchType ARCH_TYPE
```
```c3
const usz MAX_VECTOR_SIZE
```
```c3
const bool ARCH_32_BIT
```
```c3
const bool ARCH_64_BIT
```
```c3
const bool LIBC
```
```c3
const bool NO_LIBC
```
```c3
const CompilerOptLevel COMPILER_OPT_LEVEL
```
```c3
const bool BIG_ENDIAN
```
```c3
const bool I128_NATIVE_SUPPORT
```
```c3
const bool F16_SUPPORT
```
```c3
const bool F128_SUPPORT
```
```c3
const REGISTER_SIZE
```
```c3
const bool COMPILER_SAFE_MODE
```
```c3
const bool DEBUG_SYMBOLS
```
```c3
const bool BACKTRACE
```
```c3
const usz LLVM_VERSION
```
```c3
const bool BENCHMARKING
```
```c3
const bool TESTING
```
```c3
const bool PANIC_MSG
```
```c3
const MemoryEnvironment MEMORY_ENV
```
```c3
const bool TRACK_MEMORY
```
```c3
const bool X86_64
```
```c3
const bool X86
```
```c3
const bool AARCH64
```
```c3
const bool NATIVE_STACKTRACE
```
```c3
const bool LINUX
```
```c3
const bool DARWIN
```
```c3
const bool WIN32
```
```c3
const bool POSIX
```
```c3
const bool OPENBSD
```
```c3
const bool FREEBSD
```
```c3
const bool NETBSD
```
```c3
const bool BSD_FAMILY
```
```c3
const bool WASI
```
```c3
const bool ANDROID
```
```c3
const bool WASM_NOLIBC @builtin
```
```c3
const bool ADDRESS_SANITIZER
```
```c3
const bool MEMORY_SANITIZER
```
```c3
const bool THREAD_SANITIZER
```
```c3
const bool ANY_SANITIZER
```
```c3
const int LANGUAGE_DEV_VERSION
```
```c3
const bool HAS_NATIVE_ERRNO
```
```c3
macro bool os_is_darwin() @const
```
```c3
macro bool os_is_posix() @const
```
```c3
const String[] AUTHORS
```
```c3
const String[] AUTHOR_EMAILS
```
```c3
const BUILTIN_EXPECT_IS_DISABLED
```
```c3
const BUILTIN_PREFETCH_IS_DISABLED
```
### `std::core::log`
```c3
const FULL_LOG
```
```c3
typedef LogCategory = inline char
```
```c3
typedef LogTag = char[12]
```
```c3
const LogCategory CATEGORY_APPLICATION
```
```c3
const LogCategory CATEGORY_SYSTEM
```
```c3
const LogCategory CATEGORY_KERNEL
```
```c3
const LogCategory CATEGORY_AUDIO
```
```c3
const LogCategory CATEGORY_VIDEO
```
```c3
const LogCategory CATEGORY_RENDER
```
```c3
const LogCategory CATEGORY_INPUT
```
```c3
const LogCategory CATEGORY_NETWORK
```
```c3
const LogCategory CATEGORY_SOCKET
```
```c3
const LogCategory CATEGORY_SECURITY
```
```c3
const LogCategory CATEGORY_TEST
```
```c3
const LogCategory CATEGORY_ERROR
```
```c3
const LogCategory CATEGORY_ASSERT
```
```c3
const LogCategory CATEGORY_CRASH
```
```c3
const LogCategory CATEGORY_STATS
```
```c3
const LogCategory CATEGORY_CUSTOM_START
```
```c3
enum LogPriority : int
```
```c3
macro void verbose(String fmt, ..., LogCategory category = default_category)
```
```c3
macro void debug(String fmt, ..., LogCategory category = default_category)
```
```c3
macro void info(String fmt, ..., LogCategory category = default_category)
```
```c3
macro void warn(String fmt, ..., LogCategory category = default_category)
```
```c3
macro void error(String fmt, ..., LogCategory category = default_category)
```
```c3
macro void critical(String fmt, ..., LogCategory category = default_category)
```
```c3
macro void @category_scope(LogCategory new_category; @body)
```

```c3
<*
 @require tag_prefix.len <= 3 : "The prefix may not exceed 3 bytes"
*>
```
```c3
macro void @tag_scope(String tag_prefix = ""; @body)
```

```c3
<*
 @require tag_prefix.len <= 3 : "The prefix may not exceed 3 bytes"
*>
```
```c3
macro void push_tag(String tag_prefix = "")
```

```c3
<*
 @require tag_prefix.len <= 3 : "The prefix may not exceed 3 bytes"
*>
```
```c3
fn LogTag create_tag(String tag_prefix)
```
```c3
fn void set_priority_for_category(LogCategory category, LogPriority new_priority)
```
```c3
fn LogPriority get_priority_for_category(LogCategory category)
```
```c3
fn void set_priority_all(LogPriority new_priority)
```
```c3
fn void set_logger(Logger logger)
```
```c3
macro void init()
```
```c3
fn void call_log(LogPriority prio, LogCategory category, String fmt, args...)
```
```c3
fn String? get_category_name(LogCategory category)
```
```c3
fn void set_category_name(LogCategory category, String name)
```
```c3
struct NullLogger (Logger)
```
```c3
fn void NullLogger.log(&self, LogPriority priority, LogCategory category, LogTag tag, String file, String function, int line, String fmt, any[] args) @dynamic
```
```c3
struct MultiLogger (Logger)
```
```c3
fn void MultiLogger.log(&self, LogPriority priority, LogCategory category, LogTag tag, String file, String function, int line, String fmt, any[] args) @dynamic
```
### `std::core::main_stub`
```c3
macro int @main_to_err_main(#m, int, char**)
```
```c3
macro int @main_to_int_main(#m, int, char**)
```
```c3
macro int @main_to_void_main(#m, int, char**)
```
```c3
macro int @main_to_err_main_args(#m, int argc, char** argv)
```
```c3
macro int @main_to_int_main_args(#m, int argc, char** argv)
```
```c3
macro int @_main_runner(#m, int argc, char** argv)
```
```c3
macro int @main_to_void_main_args(#m, int argc, char** argv)
```
### `std::core::main_stub @if(env::WIN32)`
```c3
extern fn Char16** _win_command_line_to_argv_w(ushort* cmd_line, int* argc_ptr) @extern("CommandLineToArgvW")
```
```c3
macro int @win_to_err_main_noargs(#m, void* handle, void* prev_handle, Char16* cmd_line, int show_cmd)
```
```c3
macro int @win_to_int_main_noargs(#m, void* handle, void* prev_handle, Char16* cmd_line, int show_cmd)
```
```c3
macro int @win_to_void_main_noargs(#m, void* handle, void* prev_handle, Char16* cmd_line, int show_cmd)
```
```c3
macro int @win_to_err_main_args(#m, void* handle, void* prev_handle, Char16* cmd_line, int show_cmd)
```
```c3
macro int @win_to_int_main_args(#m, void* handle, void* prev_handle, Char16* cmd_line, int show_cmd)
```
```c3
macro int @win_to_void_main_args(#m, void* handle, void* prev_handle, Char16* cmd_line, int show_cmd)
```
```c3
macro int @win_to_err_main(#m, void* handle, void* prev_handle, Char16* cmd_line, int show_cmd)
```
```c3
macro int @win_to_int_main(#m, void* handle, void* prev_handle, Char16* cmd_line, int show_cmd)
```
```c3
macro int @win_to_void_main(#m, void* handle, void* prev_handle, Char16* cmd_line, int show_cmd)
```
```c3
macro int @wmain_to_err_main_args(#m, int argc, Char16** argv)
```
```c3
macro int @wmain_to_int_main_args(#m, int argc, Char16** argv)
```
```c3
macro int @_wmain_runner(#m, int argc, Char16** argv)
```
```c3
macro int @wmain_to_void_main_args(#m, int argc, Char16** argv)
```
### `std::core::mem`
```c3
const MAX_MEMORY_ALIGNMENT
```
```c3
const DEFAULT_MEM_ALIGNMENT
```
```c3
const ulong KB
```
```c3
const ulong MB
```
```c3
const ulong GB
```
```c3
const ulong TB
```
```c3
faultdef OUT_OF_MEMORY, INVALID_ALLOC_SIZE
```
```c3
fn usz os_pagesize()
```

Load a vector from memory according to a mask assuming default alignment.
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
```
```c3
macro masked_load(ptr, bool[<*>] mask, passthru)
```

Load a vector from memory according to a mask.
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
```
```c3
macro @masked_load_aligned(ptr, bool[<*>] mask, passthru, usz $alignment)
```

Load values from a pointer vector, assuming default alignment.
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
```
```c3
macro gather(ptrvec, bool[<*>] mask, passthru)
```

Load values from a pointer vector.
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
```
```c3
macro @gather_aligned(ptrvec, bool[<*>] mask, passthru, usz $alignment)
```

Store parts of a vector according to the mask, assuming default alignment.
```c3
<*
 @param ptr : "The pointer address to store to."
 @param value : "The value to store masked"
 @param mask : "The mask for the store"
 @require @assignable_to(&&value, $typeof(ptr)) : "Pointer and value must match"
 @require @typekind(value) == VECTOR : "Expected value to be a vector"
 @require value.len == mask.len : "Mask and value must have the same length"
*>
```
```c3
macro masked_store(ptr, value, bool[<*>] mask)
```

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
```
```c3
macro @masked_store_aligned(ptr, value, bool[<*>] mask, usz $alignment)
```

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
```
```c3
macro scatter(ptrvec, value, bool[<*>] mask)
```

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
```
```c3
macro @scatter_aligned(ptrvec, value, bool[<*>] mask, usz $alignment)
```

```c3
<*
 @param #x : "The variable or dereferenced pointer to load."
 @param $alignment : "The alignment to assume for the load"
 @return "The value of the variable"
 @require @constant_is_power_of_2($alignment) : "The alignment must be a power of two"
 @require $defined(&#x) : "This must be a variable or dereferenced pointer"
*>
```
```c3
macro @unaligned_load(#x, usz $alignment) @builtin
```

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
```
```c3
macro @unaligned_store(#x, value, usz $alignment) @builtin
```

```c3
<*
 @param #x : "The variable or dereferenced pointer to load."
 @return "The value of the variable"
 @require $defined(&#x) : "This must be a variable or dereferenced pointer"
*>
```
```c3
macro @volatile_load(#x) @builtin
```

```c3
<*
 @param #x : "The variable or dereferenced pointer to store to."
 @param value : "The value to store."
 @return "The value stored"
 @require $defined(&#x) : "This must be a variable or dereferenced pointer"
 @require $defined(#x = value) : "The value doesn't match the variable"
*>
```
```c3
macro @volatile_store(#x, value) @builtin
```
```c3
enum AtomicOrdering : int
```

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
```
```c3
macro @atomic_load(#x, AtomicOrdering $ordering = SEQ_CONSISTENT, $volatile = false) @builtin
```

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
```
```c3
macro void @atomic_store(#x, value, AtomicOrdering $ordering = SEQ_CONSISTENT, $volatile = false) @builtin
```

```c3
<*
 @require $success != AtomicOrdering.NOT_ATOMIC && $success != AtomicOrdering.UNORDERED : "Acquire ordering is not valid."
 @require $failure != AtomicOrdering.RELEASE && $failure != AtomicOrdering.ACQUIRE_RELEASE : "Acquire release is not valid."
*>
```
```c3
macro compare_exchange(ptr, compare, value, AtomicOrdering $success = SEQ_CONSISTENT, AtomicOrdering $failure = SEQ_CONSISTENT, bool $volatile = true, bool $weak = false, usz $alignment = 0)
```

```c3
<*
 @require $success != AtomicOrdering.NOT_ATOMIC && $success != AtomicOrdering.UNORDERED : "Acquire ordering is not valid."
 @require $failure != AtomicOrdering.RELEASE && $failure != AtomicOrdering.ACQUIRE_RELEASE : "Acquire release is not valid."
*>
```
```c3
macro compare_exchange_volatile(ptr, compare, value, AtomicOrdering $success = SEQ_CONSISTENT, AtomicOrdering $failure = SEQ_CONSISTENT)
```

```c3
<*
 @require math::is_power_of_2(alignment)
*>
```
```c3
fn usz aligned_offset(usz offset, usz alignment)
```
```c3
macro void* aligned_pointer(void* ptr, usz alignment)
```

```c3
<*
 @require math::is_power_of_2(alignment)
*>
```
```c3
fn bool ptr_is_aligned(void* ptr, usz alignment) @inline
```
```c3
fn bool ptr_is_page_aligned(void* ptr) @inline
```
```c3
macro void zero_volatile(char[] data)
```
```c3
macro void clear(void* dst, usz len, usz $dst_align = 0, bool $is_volatile = false)
```
```c3
macro void clear_inline(void* dst, usz $len, usz $dst_align = 0, bool $is_volatile = false)
```

Copy memory from src to dst efficiently, assuming the memory ranges do not overlap.
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
```
```c3
macro void copy(void* dst, void* src, usz len, usz $dst_align = 0, usz $src_align = 0, bool $is_volatile = false)
```

Copy memory from src to dst efficiently, assuming the memory ranges do not overlap, it
will always be inlined and never call memcopy
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
```
```c3
macro void copy_inline(void* dst, void* src, usz $len, usz $dst_align = 0, usz $src_align = 0, bool $is_volatile = false)
```

Copy memory from src to dst but correctly handle the possibility of overlapping ranges.
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
```
```c3
macro void move(void* dst, void* src, usz len, usz $dst_align = 0, usz $src_align = 0, bool $is_volatile = false)
```

Sets all memory in a region to that of the provided byte.
```c3
<*
 @param [&out] dst : "The destination to copy to"
 @param val : "The value to copy into memory"
 @param len : "The number of bytes to copy"
 @param $dst_align : "the alignment of the destination if different from the default, 0 assumes the default"
 @param $is_volatile : "True if this copy should be treated as volatile, i.e. it can't be optimized away."
 @ensure !len || (dst[0] == val && dst[len - 1] == val)
*>
```
```c3
macro void set(void* dst, char val, usz len, usz $dst_align = 0, bool $is_volatile = false)
```

Sets all memory in a region to that of the provided byte. Never calls OS memset.
```c3
<*
 @param [&out] dst : "The destination to copy to"
 @param val : "The value to copy into memory"
 @param $len : "The number of bytes to copy"
 @param $dst_align : "the alignment of the destination if different from the default, 0 assumes the default"
 @param $is_volatile : "True if this copy should be treated as volatile, i.e. it can't be optimized away."
 @ensure !$len || (dst[0] == val && dst[$len - 1] == val)
*>
```
```c3
macro void set_inline(void* dst, char val, usz $len, usz $dst_align = 0, bool $is_volatile = false)
```

Test if n elements are equal in a slice, pointed to by a pointer etc.
```c3
<*
 @require values::@inner_kind(a) == TypeKind.SLICE || values::@inner_kind(a) == TypeKind.POINTER
 @require values::@inner_kind(b) == TypeKind.SLICE || values::@inner_kind(b) == TypeKind.POINTER
 @require values::@inner_kind(a) != TypeKind.SLICE || len == -1
 @require values::@inner_kind(a) != TypeKind.POINTER || len > -1
 @require values::@assign_to(a, b) && values::@assign_to(b, a)
*>
```
```c3
macro bool equals(a, b, isz len = -1, usz $align = 0)
```

Check if an allocation must be aligned given the type.
```c3
<*
 @return `true if the alignment of the type exceeds DEFAULT_MEM_ALIGNMENT.`
*>
```
```c3
macro bool type_alloc_must_be_aligned($Type)
```

Run with a specific allocator inside of the macro body.
```c3
macro void @scoped(Allocator allocator; @body())
```

Run the tracking allocator in the scope, then
print out stats.
```c3
<*
 @param $enabled : "Set to false to disable tracking"
*>
```
```c3
macro void @report_heap_allocs_in_scope($enabled = true; @body())
```

Assert on memory leak in the scope of the macro body.
```c3
<*
 @param $report : "Set to false to disable memory report"
*>
```
```c3
macro void @assert_leak($report = true; @body()) @builtin
```

Allocate [size] bytes on the stack to use for allocation,
with the heap allocator as the backing allocator.

Release everything on scope exit.
```c3
<*
 @param $size : `the size of the buffer`
*>
```
```c3
macro void @stack_mem(usz $size; @body(Allocator mem)) @builtin
```
```c3
macro void @stack_pool(usz $size; @body) @builtin
```

Push the current temp allocator. A push must always be balanced with a pop using the current state.
```c3
fn PoolState temp_push()
```

Pop the current temp allocator. A pop must always be balanced with a push.
```c3
fn void temp_pop(PoolState old_state)
```

```c3
<*
 @require pool_size >= 64
 @require realloc_size >= 64
 @require allocator.type != TempAllocator.typeid : "You may not create a temp allocator with a TempAllocator as the backing allocator."
 @require min_size > TempAllocator.sizeof + 64 : "Min size must meaningfully hold the data + some bytes"
*>
```
```c3
macro void @pool_init(Allocator allocator, usz pool_size,
	usz reserve_size = allocator::temp_allocator_reserve_size,
	usz min_size = allocator::temp_allocator_min_size,
	usz realloc_size = allocator::temp_allocator_realloc_size; @body) @builtin
```

Create a new temporary allocator.

The `reserve` parameter allows you to determine how many bytes should be reserved for
allocations on the current temporary allocator, if allocations are made inside of the pool scope.
It is made available for optimization, and can usually be ignored.
```c3
<*
 @param reserve : "The amount of bytes to reserve for out-of-order allocations, 0 gives the default."
*>
```
```c3
macro void @pool(usz reserve = 0; @body) @builtin
```
```c3
macro TrackingEnv* get_tracking_env()
```

```c3
<*
 @param value : "The value to clone"
 @return "A pointer to the cloned value"
 @require $alignof(value) <= mem::DEFAULT_MEM_ALIGNMENT : "Types with alignment exceeding the default must use 'clone_aligned' instead"
*>
```
```c3
macro @clone(value) @builtin @nodiscard
```

```c3
<*
 @param value : "The value to clone"
 @return "A pointer to the cloned value, which must be released using free_aligned"
*>
```
```c3
macro @clone_aligned(value) @builtin @nodiscard
```

```c3
<*
 @param value : "The value to clone"
 @return "A pointer to the cloned value"
*>
```
```c3
macro @tclone(value) @builtin @nodiscard
```
```c3
fn void* malloc(usz size) @builtin @inline @nodiscard
```

Allocate using an aligned allocation. This is necessary for types with a default memory alignment
exceeding DEFAULT_MEM_ALIGNMENT. IMPORTANT! It must be freed using free_aligned.
```c3
fn void* malloc_aligned(usz size, usz alignment) @builtin @inline @nodiscard
```
```c3
fn void* tmalloc(usz size, usz alignment = 0) @builtin @inline @nodiscard
```

```c3
<*
 @require $vacount < 2 : "Too many arguments."
 @require $vacount == 0 ||| @assignable_to($vaexpr[0], $Type) : "The second argument must be an initializer for the type"
 @require $Type.alignof <= DEFAULT_MEM_ALIGNMENT : "Types with alignment exceeding the default must use 'alloc_aligned' instead"
*>
```
```c3
macro new($Type, ...) @nodiscard
```

```c3
<*
 @require $vacount < 2 : "Too many arguments."
 @require $vacount == 0 ||| @assignable_to($vaexpr[0], $Type) : "The second argument must be an initializer for the type"
 @require $Type.alignof <= DEFAULT_MEM_ALIGNMENT : "Types with alignment exceeding the default must use 'alloc_aligned' instead"
*>
```
```c3
macro new_with_padding($Type, usz padding, ...) @nodiscard
```

Allocate using an aligned allocation. This is necessary for types with a default memory alignment
exceeding DEFAULT_MEM_ALIGNMENT. IMPORTANT! It must be freed using free_aligned.
```c3
<*
 @require $vacount < 2 : "Too many arguments."
 @require $vacount == 0 ||| @assignable_to($vaexpr[0], $Type) : "The second argument must be an initializer for the type"
*>
```
```c3
macro new_aligned($Type, ...) @nodiscard
```

```c3
<*
 @require $Type.alignof <= DEFAULT_MEM_ALIGNMENT : "Types with alignment exceeding the default must use 'alloc_aligned' instead"
*>
```
```c3
macro alloc($Type) @nodiscard
```

```c3
<*
 @require $Type.alignof <= DEFAULT_MEM_ALIGNMENT : "Types with alignment exceeding the default must use 'alloc_aligned' instead"
*>
```
```c3
macro alloc_with_padding($Type, usz padding) @nodiscard
```

Allocate using an aligned allocation. This is necessary for types with a default memory alignment
exceeding DEFAULT_MEM_ALIGNMENT. IMPORTANT! It must be freed using free_aligned.
```c3
macro alloc_aligned($Type) @nodiscard
```

```c3
<*
 @require $vacount < 2 : "Too many arguments."
 @require $vacount == 0 ||| @assignable_to($vaexpr[0], $Type) : "The second argument must be an initializer for the type"
*>
```
```c3
macro tnew($Type, ...) @nodiscard
```

```c3
<*
 @require $vacount < 2 : "Too many arguments."
 @require $vacount == 0 ||| @assignable_to($vaexpr[0], $Type) : "The second argument must be an initializer for the type"
*>
```
```c3
macro temp_with_padding($Type, usz padding, ...) @nodiscard
```
```c3
macro talloc($Type) @nodiscard
```
```c3
macro talloc_with_padding($Type, usz padding) @nodiscard
```

```c3
<*
 @require $Type.alignof <= DEFAULT_MEM_ALIGNMENT : "Types with alignment exceeding the default must use 'new_array_aligned' instead"
*>
```
```c3
macro new_array($Type, usz elements) @nodiscard
```

Allocate using an aligned allocation. This is necessary for types with a default memory alignment
exceeding DEFAULT_MEM_ALIGNMENT. IMPORTANT! It must be freed using free_aligned.
```c3
macro new_array_aligned($Type, usz elements) @nodiscard
```

```c3
<*
 @require $Type.alignof <= DEFAULT_MEM_ALIGNMENT : "Types with alignment exceeding the default must use 'alloc_array_aligned' instead"
*>
```
```c3
macro alloc_array($Type, usz elements) @nodiscard
```

Allocate using an aligned allocation. This is necessary for types with a default memory alignment
exceeding DEFAULT_MEM_ALIGNMENT. IMPORTANT! It must be freed using free_aligned.
```c3
macro alloc_array_aligned($Type, usz elements) @nodiscard
```
```c3
macro talloc_array($Type, usz elements) @nodiscard
```
```c3
macro temp_array($Type, usz elements) @nodiscard
```
```c3
fn void* calloc(usz size) @builtin @inline @nodiscard
```

Allocate using an aligned allocation. This is necessary for types with a default memory alignment
exceeding DEFAULT_MEM_ALIGNMENT. IMPORTANT! It must be freed using free_aligned.
```c3
fn void* calloc_aligned(usz size, usz alignment) @builtin @inline @nodiscard
```
```c3
fn void* tcalloc(usz size, usz alignment = 0) @builtin @inline @nodiscard
```
```c3
fn void* realloc(void *ptr, usz new_size) @builtin @inline @nodiscard
```
```c3
fn void* realloc_aligned(void *ptr, usz new_size, usz alignment) @builtin @inline @nodiscard
```
```c3
fn void free(void* ptr) @builtin @inline
```
```c3
fn void free_aligned(void* ptr) @builtin @inline
```
```c3
fn void* trealloc(void* ptr, usz size, usz alignment = mem::DEFAULT_MEM_ALIGNMENT) @builtin @inline @nodiscard
```

Takes the address of a possibly unaligned variable or member,
and offers safe access to that member, by constructing an UnalignedRef.
```c3
<*
 @require $defined(&#arg) : "It must be possible to take the address of the argument."
 @return "An 'UnalignedRef' with the proper type and alignment, with a pointer to argument"
*>
```
```c3
macro @unaligned_addr(#arg) @builtin
```
### `std::core::mem @if(WASM_NOLIBC)`
### `std::core::mem @if(env::NO_LIBC)`
```c3
fn CInt __memcmp(void* s1, void* s2, usz n) @weak @export("memcmp")
```
```c3
fn void* __memset(void* str, CInt c, usz n) @weak @export("memset")
```
```c3
fn void* __memcpy(void* dst, void* src, usz n) @weak @export("memcpy")
```
### `std::core::mem::alignment { Type, ALIGNMENT }`

An UnalignedRef offers correctly aligned access to addresses that may be unaligned or overaligned.
```c3
typedef UnalignedRef = Type*
```
```c3
macro Type UnalignedRef.get(self)
```
```c3
macro Type UnalignedRef.set(&self, Type val)
```
### `std::core::mem::allocator`
```c3
struct ArenaAllocator (Allocator)
```

Initialize a memory arena for use using the provided bytes.
```c3
<*
 @param [inout] data : "The memory to use for the arena."
*>
```
```c3
fn ArenaAllocator* ArenaAllocator.init(&self, char[] data)
```

Reset the usage completely.
```c3
fn void ArenaAllocator.clear(&self)
```

Given some memory, create an arena allocator on the stack for it.
```c3
<*
 @param [inout] bytes : `The bytes to use, may be empty.`
 @return `An arena allocator using the bytes`
*>
```
```c3
macro ArenaAllocator* wrap(char[] bytes)
```

"Mark" the current state of the arena allocator by returning the use count.
```c3
<*
 @return `The value to pass to 'reset' in order to reset to the current use.`
*>
```
```c3
fn usz ArenaAllocator.mark(&self)
```

Reset to a previous mark.
```c3
<*
 @param mark : `The previous mark.`
 @require mark <= self.used : "Invalid mark - out of range"
*>
```
```c3
fn void ArenaAllocator.reset(&self, usz mark)
```

Implements the Allocator interface method.
```c3
<*
 @require ptr != null
*>
```
```c3
fn void ArenaAllocator.release(&self, void* ptr, bool) @dynamic
```

Implements the Allocator interface method.
```c3
<*
 @require !alignment || math::is_power_of_2(alignment)
 @require alignment <= mem::MAX_MEMORY_ALIGNMENT : `alignment too big`
 @require size > 0
 @return? mem::INVALID_ALLOC_SIZE, mem::OUT_OF_MEMORY
*>
```
```c3
fn void*? ArenaAllocator.acquire(&self, usz size, AllocInitType init_type, usz alignment) @dynamic
```

Implements the Allocator interface method.
```c3
<*
 @require !alignment || math::is_power_of_2(alignment)
 @require alignment <= mem::MAX_MEMORY_ALIGNMENT : `alignment too big`
 @require old_pointer != null
 @require size > 0
 @return? mem::INVALID_ALLOC_SIZE, mem::OUT_OF_MEMORY
*>
```
```c3
fn void*? ArenaAllocator.resize(&self, void *old_pointer, usz size, usz alignment) @dynamic
```

The backed arena allocator provides an allocator that will allocate from a pre-allocated chunk of memory
provided by it's backing allocator. The allocator supports mark / reset operations, so it can be used
as a stack (push-pop) allocator. If the initial memory is used up, it will fall back to regular allocations,
that will be safely freed on `reset`.

While this allocator is similar to the dynamic arena, it supports multiple "save points", which the dynamic arena
doesn't.
```c3
struct BackedArenaAllocator (Allocator)
```
```c3
macro usz ExtraPage.pagesize(&self)
```
```c3
macro bool ExtraPage.is_aligned(&self)
```

```c3
<*
 @require size >= 16
*>
```
```c3
fn BackedArenaAllocator*? new_backed_allocator(usz size, Allocator allocator)
```
```c3
fn void BackedArenaAllocator.destroy(&self)
```
```c3
fn usz BackedArenaAllocator.mark(&self)
```
```c3
fn void BackedArenaAllocator.release(&self, void* old_pointer, bool) @dynamic
```
```c3
fn void BackedArenaAllocator.reset(&self, usz mark)
```
```c3
fn void*? BackedArenaAllocator.resize(&self, void* pointer, usz size, usz alignment) @dynamic
```

```c3
<*
 @require size > 0
 @require !alignment || math::is_power_of_2(alignment)
 @require alignment <= mem::MAX_MEMORY_ALIGNMENT : `alignment too big`
*>
```
```c3
fn void*? BackedArenaAllocator.acquire(&self, usz size, AllocInitType init_type, usz alignment) @dynamic
```

The dynamic arena allocator is an arena allocator that can grow by adding additional arena "pages".
It only supports reset, at which point all pages except the first one is released to the backing
allocator.

If you want multiple save points, use the BackedArenaAllocator instead.

The advantage over the BackedArenaAllocator, is that when allocating beyond the first "page", it will
retain the characteristics of an arena allocator (allocating a large piece of memory then handing off
memory from that memory), wheras the BackedArenaAllocator will have heap allocator characteristics.
```c3
struct DynamicArenaAllocator (Allocator)
```

```c3
<*
 @param [&inout] allocator
 @require page_size >= 128
*>
```
```c3
fn void DynamicArenaAllocator.init(&self, Allocator allocator, usz page_size)
```
```c3
fn void DynamicArenaAllocator.free(&self)
```

```c3
<*
 @require ptr != null
 @require self.page != null  : `tried to free pointer on invalid allocator`
*>
```
```c3
fn void DynamicArenaAllocator.release(&self, void* ptr, bool) @dynamic
```

```c3
<*
 @require size > 0 : `Resize doesn't support zeroing`
 @require old_pointer != null : `Resize doesn't handle null pointers`
 @require self.page != null  : `tried to realloc pointer on invalid allocator`
 @return? mem::INVALID_ALLOC_SIZE, mem::OUT_OF_MEMORY
*>
```
```c3
fn void*? DynamicArenaAllocator.resize(&self, void* old_pointer, usz size, usz alignment) @dynamic
```
```c3
fn void DynamicArenaAllocator.reset(&self)
```

```c3
<*
 @require size > 0 : `acquire expects size > 0`
 @require !alignment || math::is_power_of_2(alignment)
 @return? mem::INVALID_ALLOC_SIZE, mem::OUT_OF_MEMORY
*>
```
```c3
fn void*? DynamicArenaAllocator.acquire(&self, usz size, AllocInitType init_type, usz alignment) @dynamic
```

The SimpleHeapAllocator implements a simple heap allocator on top of an allocator function.

It uses the given allocator function to allocate memory from some source, but never frees it.
This allocator is intended to be used in environments where there isn't any native libc malloc,
and it has to be emulated from a memory region, or wrapping linear memory as is the case for plain WASM.
```c3
struct SimpleHeapAllocator (Allocator)
```

```c3
<*
 @require allocator != null  : "An underlying memory provider must be given"
 @require !self.free_list : "The allocator may not be already initialized"
*>
```
```c3
fn void SimpleHeapAllocator.init(&self, MemoryAllocFn allocator)
```
```c3
fn void*? SimpleHeapAllocator.acquire(&self, usz size, AllocInitType init_type, usz alignment) @dynamic
```
```c3
fn void*? SimpleHeapAllocator.resize(&self, void* old_pointer, usz size, usz alignment) @dynamic
```
```c3
fn void SimpleHeapAllocator.release(&self, void* old_pointer, bool aligned) @dynamic
```

The OnStackAllocator is similar to the ArenaAllocator: it allocates from a chunk of memory
given to it.

The difference is that when it runs out of memory it will go directly to its backing allocator
rather than failing.

It is utilized by the @stack_mem macro as an alternative to the temp allocator.
```c3
struct OnStackAllocator (Allocator)
```

Initialize a memory arena for use using the provided bytes.
```c3
<*
 @param [&inout] allocator
*>
```
```c3
fn void OnStackAllocator.init(&self, char[] data, Allocator allocator)
```
```c3
fn void OnStackAllocator.free(&self)
```
```c3
struct OnStackAllocatorHeader
```

```c3
<*
 @require old_pointer != null
*>
```
```c3
fn void OnStackAllocator.release(&self, void* old_pointer, bool aligned) @dynamic
```

```c3
<*
 @require size > 0
 @require old_pointer != null
 @require alignment <= mem::MAX_MEMORY_ALIGNMENT : `alignment too big`
*>
```
```c3
fn void*? OnStackAllocator.resize(&self, void* old_pointer, usz size, usz alignment) @dynamic
```

```c3
<*
 @require alignment <= mem::MAX_MEMORY_ALIGNMENT : `alignment too big`
 @require size > 0
*>
```
```c3
fn void*? OnStackAllocator.acquire(&self, usz size, AllocInitType init_type, usz alignment) @dynamic
```
```c3
const MAX_BACKTRACE
```
```c3
struct Allocation
```
```c3
alias AllocMap = HashMap { uptr, Allocation }
```
```c3
struct TrackingAllocator (Allocator)
```

Initialize a tracking allocator to wrap (and track) another allocator.
```c3
<*
 @param [&inout] allocator : "The allocator to track"
*>
```
```c3
fn void TrackingAllocator.init(&self, Allocator allocator)
```

Free this tracking allocator.
```c3
fn void TrackingAllocator.free(&self)
```

```c3
<*
 @return "the total allocated memory not yet freed."
*>
```
```c3
fn usz TrackingAllocator.allocated(&self)
```

```c3
<*
 @return "the total memory allocated (freed or not)."
*>
```
```c3
fn usz TrackingAllocator.total_allocated(&self)
```

```c3
<*
 @return "the total number of allocations (freed or not)."
*>
```
```c3
fn usz TrackingAllocator.total_allocation_count(&self)
```
```c3
fn Allocation[] TrackingAllocator.allocations_tlist(&self, Allocator allocator)
```

```c3
<*
 @return "the number of non-freed allocations."
*>
```
```c3
fn usz TrackingAllocator.allocation_count(&self)
```
```c3
fn void*? TrackingAllocator.acquire(&self, usz size, AllocInitType init_type, usz alignment) @dynamic
```
```c3
fn void*? TrackingAllocator.resize(&self, void* old_pointer, usz size, usz alignment) @dynamic
```
```c3
fn void TrackingAllocator.release(&self, void* old_pointer, bool is_aligned) @dynamic
```
```c3
fn void TrackingAllocator.clear(&self)
```
```c3
fn bool TrackingAllocator.has_leaks(&self)
```
```c3
fn void TrackingAllocator.print_report(&self)
```
```c3
fn void? TrackingAllocator.fprint_report(&self, OutStream out)
```
```c3
const DEFAULT_SIZE_PREFIX
```
```c3
const DEFAULT_SIZE_PREFIX_ALIGNMENT
```
```c3
struct TrackingEnv
```
```c3
enum AllocInitType
```
```c3
alias MemoryAllocFn = fn char[]?(usz)
```
```c3
fn usz alignment_for_allocation(usz alignment) @inline
```
```c3
macro void* malloc(Allocator allocator, usz size) @nodiscard
```
```c3
macro void*? malloc_try(Allocator allocator, usz size) @nodiscard
```
```c3
macro void* calloc(Allocator allocator, usz size) @nodiscard
```
```c3
macro void*? calloc_try(Allocator allocator, usz size) @nodiscard
```
```c3
macro void* realloc(Allocator allocator, void* ptr, usz new_size) @nodiscard
```
```c3
macro void*? realloc_try(Allocator allocator, void* ptr, usz new_size) @nodiscard
```
```c3
macro void free(Allocator allocator, void* ptr)
```
```c3
macro void*? malloc_aligned(Allocator allocator, usz size, usz alignment) @nodiscard
```
```c3
macro void*? calloc_aligned(Allocator allocator, usz size, usz alignment) @nodiscard
```
```c3
macro void*? realloc_aligned(Allocator allocator, void* ptr, usz new_size, usz alignment) @nodiscard
```
```c3
macro void free_aligned(Allocator allocator, void* ptr)
```

```c3
<*
 @require $Type.alignof <= mem::DEFAULT_MEM_ALIGNMENT : "Types with alignment exceeding the default must use 'new_aligned' instead"
 @require $vacount < 2 : "Too many arguments."
 @require $vacount == 0 ||| @assignable_to($vaexpr[0], $Type) : "The second argument must be an initializer for the type"
*>
```
```c3
macro new(Allocator allocator, $Type, ...) @nodiscard
```

```c3
<*
 @require $Type.alignof <= mem::DEFAULT_MEM_ALIGNMENT : "Types with alignment exceeding the default must use 'new_aligned' instead"
 @require $vacount < 2 : "Too many arguments."
 @require $vacount == 0 ||| @assignable_to($vaexpr[0], $Type) : "The second argument must be an initializer for the type"
*>
```
```c3
macro new_try(Allocator allocator, $Type, ...) @nodiscard
```

Allocate using an aligned allocation. This is necessary for types with a default memory alignment
exceeding DEFAULT_MEM_ALIGNMENT. IMPORTANT! It must be freed using free_aligned.
```c3
<*
 @require $vacount < 2 : "Too many arguments."
 @require $vacount == 0 ||| @assignable_to($vaexpr[0], $Type) : "The second argument must be an initializer for the type"
*>
```
```c3
macro new_aligned(Allocator allocator, $Type, ...) @nodiscard
```

```c3
<*
 @require $Type.alignof <= mem::DEFAULT_MEM_ALIGNMENT
*>
```
```c3
macro new_with_padding(Allocator allocator, $Type, usz padding) @nodiscard
```

```c3
<*
 @require $Type.alignof <= mem::DEFAULT_MEM_ALIGNMENT : "Types with alignment exceeding the default must use 'alloc_aligned' instead"
*>
```
```c3
macro alloc(Allocator allocator, $Type) @nodiscard
```

```c3
<*
 @require $Type.alignof <= mem::DEFAULT_MEM_ALIGNMENT : "Types with alignment exceeding the default must use 'alloc_aligned' instead"
*>
```
```c3
macro alloc_try(Allocator allocator, $Type) @nodiscard
```

Allocate using an aligned allocation. This is necessary for types with a default memory alignment
exceeding DEFAULT_MEM_ALIGNMENT. IMPORTANT! It must be freed using free_aligned.
```c3
macro alloc_aligned(Allocator allocator, $Type) @nodiscard
```

```c3
<*
 @require $Type.alignof <= mem::DEFAULT_MEM_ALIGNMENT
*>
```
```c3
macro alloc_with_padding(Allocator allocator, $Type, usz padding) @nodiscard
```

```c3
<*
 @require $Type.alignof <= mem::DEFAULT_MEM_ALIGNMENT : "Types with alignment exceeding the default must use 'new_array_aligned' instead"
*>
```
```c3
macro new_array(Allocator allocator, $Type, usz elements) @nodiscard
```

```c3
<*
 @require $Type.alignof <= mem::DEFAULT_MEM_ALIGNMENT : "Types with alignment exceeding the default must use 'new_array_aligned' instead"
*>
```
```c3
macro new_array_try(Allocator allocator, $Type, usz elements) @nodiscard
```

Allocate using an aligned allocation. This is necessary for types with a default memory alignment
exceeding DEFAULT_MEM_ALIGNMENT. IMPORTANT! It must be freed using free_aligned.
```c3
macro new_array_aligned(Allocator allocator, $Type, usz elements) @nodiscard
```

```c3
<*
 @require $Type.alignof <= mem::DEFAULT_MEM_ALIGNMENT : "Types with alignment exceeding the default must use 'alloc_array_aligned' instead"
*>
```
```c3
macro alloc_array(Allocator allocator, $Type, usz elements) @nodiscard
```

Allocate using an aligned allocation. This is necessary for types with a default memory alignment
exceeding DEFAULT_MEM_ALIGNMENT. IMPORTANT! It must be freed using free_aligned.
```c3
macro alloc_array_aligned(Allocator allocator, $Type, usz elements) @nodiscard
```

```c3
<*
 @require $Type.alignof <= mem::DEFAULT_MEM_ALIGNMENT : "Types with alignment exceeding the default must use 'alloc_array_aligned' instead"
*>
```
```c3
macro alloc_array_try(Allocator allocator, $Type, usz elements) @nodiscard
```

Clone a value.
```c3
<*
 @param [&inout] allocator : "The allocator to use to clone"
 @param value : "The value to clone"
 @return "A pointer to the cloned value"
 @require $alignof(value) <= mem::DEFAULT_MEM_ALIGNMENT : "Types with alignment exceeding the default must use 'clone_aligned' instead"
*>
```
```c3
macro clone(Allocator allocator, value) @nodiscard
```

Clone overaligned values. Must be released using free_aligned.
```c3
<*
 @param [&inout] allocator : "The allocator to use to clone"
 @param value : "The value to clone"
 @return "A pointer to the cloned value"
*>
```
```c3
macro clone_aligned(Allocator allocator, value) @nodiscard
```
```c3
fn any clone_any(Allocator allocator, any value) @nodiscard
```

```c3
<*
 @require bytes > 0
 @require alignment > 0
 @require bytes <= isz.max
*>
```
```c3
macro void*? @aligned_alloc(#alloc_fn, usz bytes, usz alignment)
```
```c3
struct AlignedBlock
```
```c3
macro void? @aligned_free(#free_fn, void* old_pointer)
```

```c3
<*
 @require bytes > 0
 @require alignment > 0
*>
```
```c3
macro void*? @aligned_realloc(#calloc_fn, #free_fn, void* old_pointer, usz bytes, usz alignment)
```
```c3
alias mem @builtin = thread_allocator
```
```c3
typedef PoolState = TempAllocator*
```
```c3
fn PoolState push_pool(usz reserve = 0)
```
```c3
fn void pop_pool(PoolState old)
```
```c3
macro Allocator heap() @deprecated("Use 'mem' instead.")
```
```c3
macro Allocator temp() @deprecated("Use 'tmem' instead")
```
```c3
alias tmem @builtin = current_temp
```

Call this to destroy any memory used by the temp allocators. This will invalidate all temp memory.
```c3
fn void destroy_temp_allocators()
```
```c3
fn void*? LazyTempAllocator.acquire(&self, usz bytes, AllocInitType init_type, usz alignment) @dynamic
```
```c3
fn void*? LazyTempAllocator.resize(&self, void* old_ptr, usz new_bytes, usz alignment) @dynamic
```
```c3
fn void LazyTempAllocator.release(&self, void* old_ptr, bool aligned) @dynamic
```
```c3
const NullAllocator NULL_ALLOCATOR
```
```c3
typedef NullAllocator (Allocator) = uptr
```
```c3
fn void*? NullAllocator.acquire(&self, usz bytes, AllocInitType init_type, usz alignment) @dynamic
```
```c3
fn void*? NullAllocator.resize(&self, void* old_ptr, usz new_bytes, usz alignment) @dynamic
```
```c3
fn void NullAllocator.release(&self, void* old_ptr, bool aligned) @dynamic
```
```c3
const usz WASM_BLOCK_SIZE
```
```c3
struct WasmMemory
```
```c3
fn char[]? WasmMemory.allocate_block(&self, usz bytes)
```
### `std::core::mem::allocator @if(!(env::POSIX || env::WIN32) || !$feature(VMEM_TEMP))`
```c3
struct TempAllocator (Allocator)
```
```c3
struct TempAllocatorPage
```
```c3
macro usz TempAllocatorPage.pagesize(&self)
```
```c3
macro bool TempAllocatorPage.is_aligned(&self)
```

```c3
<*
 @require size >= 64
 @require realloc_size >= 64
 @require allocator.type != TempAllocator.typeid : "You may not create a temp allocator with a TempAllocator as the backing allocator."
 @require min_size > TempAllocator.sizeof + 64 : "Min size must meaningfully hold the data + some bytes"
*>
```
```c3
fn TempAllocator*? new_temp_allocator(Allocator allocator, usz size, usz reserve = temp_allocator_reserve_size, usz min_size = temp_allocator_min_size, usz realloc_size = temp_allocator_realloc_size)
```

```c3
<*
 @require !self.derived
*>
```
```c3
fn TempAllocator*? TempAllocator.derive_allocator(&self, usz reserve = 0)
```

Reset the entire temp allocator, which will merge all the children into it.
```c3
fn void TempAllocator.reset(&self)
```

```c3
<*
 @require self.allocated : "Only a top level allocator should be freed."
*>
```
```c3
fn void TempAllocator.free(&self)
```
```c3
fn void TempAllocator.release(&self, void* old_pointer, bool) @dynamic
```
```c3
fn void*? TempAllocator.resize(&self, void* pointer, usz size, usz alignment) @dynamic
```

```c3
<*
 @require size > 0
 @require !alignment || math::is_power_of_2(alignment)
 @require alignment <= mem::MAX_MEMORY_ALIGNMENT : `alignment too big`
*>
```
```c3
fn void*? TempAllocator.acquire(&self, usz size, AllocInitType init_type, usz alignment) @dynamic
```
### `std::core::mem::allocator @if(!env::WIN32 && !env::POSIX && env::LIBC)`
```c3
fn void*? LibcAllocator.acquire(&self, usz bytes, AllocInitType init_type, usz alignment) @dynamic
```
```c3
fn void*? LibcAllocator.resize(&self, void* old_ptr, usz new_bytes, usz alignment) @dynamic
```
```c3
fn void LibcAllocator.release(&self, void* old_ptr, bool aligned) @dynamic
```
### `std::core::mem::allocator @if((env::POSIX || env::WIN32) && $feature(VMEM_TEMP))`
```c3
fn TempAllocator*? new_temp_allocator(Allocator allocator, usz size, usz reserve = temp_allocator_reserve_size, usz min_size = temp_allocator_min_size, usz realloc_size = temp_allocator_realloc_size)
```
```c3
struct TempAllocator (Allocator)
```

```c3
<*
 @require size > 0
 @require !alignment || math::is_power_of_2(alignment)
 @require alignment <= mem::MAX_MEMORY_ALIGNMENT : `alignment too big`
*>
```
```c3
fn void*? TempAllocator.acquire(&self, usz size, AllocInitType init_type, usz alignment) @dynamic
```
```c3
fn TempAllocator*? TempAllocator.derive_allocator(&self, usz reserve = 0)
```

Reset the entire temp allocator, destroying all children
```c3
fn void TempAllocator.reset(&self)
```
```c3
fn void TempAllocator.free(&self)
```
```c3
fn void*? TempAllocator.resize(&self, void* pointer, usz size, usz alignment) @dynamic
```
```c3
fn void TempAllocator.release(&self, void* old_pointer, bool b) @dynamic
```
### `std::core::mem::allocator @if(env::LIBC)`

The LibcAllocator is a wrapper around malloc to conform to the Allocator interface.
```c3
typedef LibcAllocator (Allocator) = uptr
```
```c3
const LibcAllocator LIBC_ALLOCATOR
```
### `std::core::mem::allocator @if(env::POSIX || env::WIN32)`
```c3
faultdef VMEM_RESERVE_FAILED
```
```c3
struct Vmem (Allocator)
```
```c3
bitstruct VmemOptions : int
```

Implements the Allocator interface method.
```c3
<*
 @require !reserve_page_size || math::is_power_of_2(reserve_page_size)
 @require reserve_page_size <= preferred_size : "The min reserve_page_size size must be less or equal to the preferred size"
 @require preferred_size >= 1 * mem::KB : "The preferred size must exceed 1 KB"
 @return? mem::INVALID_ALLOC_SIZE, mem::OUT_OF_MEMORY, VMEM_RESERVE_FAILED
*>
```
```c3
fn void? Vmem.init(&self, usz preferred_size, usz reserve_page_size = 0, VmemOptions options = { true, true, env::COMPILER_SAFE_MODE }, usz min_size = 0)
```

Implements the Allocator interface method.
```c3
<*
 @require !alignment || math::is_power_of_2(alignment)
 @require alignment <= mem::MAX_MEMORY_ALIGNMENT : `alignment too big`
 @require size > 0
 @return? mem::INVALID_ALLOC_SIZE, mem::OUT_OF_MEMORY
*>
```
```c3
fn void*? Vmem.acquire(&self, usz size, AllocInitType init_type, usz alignment) @dynamic
```
```c3
fn bool Vmem.owns_pointer(&self, void* ptr) @inline
```

Implements the Allocator interface method.
```c3
<*
 @require !alignment || math::is_power_of_2(alignment)
 @require alignment <= mem::MAX_MEMORY_ALIGNMENT : `alignment too big`
 @require old_pointer != null
 @require size > 0
 @return? mem::INVALID_ALLOC_SIZE, mem::OUT_OF_MEMORY
*>
```
```c3
fn void*? Vmem.resize(&self, void *old_pointer, usz size, usz alignment) @dynamic
```

Implements the Allocator interface method.
```c3
<*
 @require ptr != null
*>
```
```c3
fn void Vmem.release(&self, void* ptr, bool) @dynamic
```
```c3
fn usz Vmem.mark(&self)
```

```c3
<*
 @require mark <= self.allocated : "Invalid mark"
*>
```
```c3
fn void Vmem.reset(&self, usz mark)
```
```c3
fn void Vmem.free(&self)
```
### `std::core::mem::allocator @if(env::POSIX)`
```c3
fn void*? LibcAllocator.acquire(&self, usz bytes, AllocInitType init_type, usz alignment) @dynamic
```
```c3
fn void*? LibcAllocator.resize(&self, void* old_ptr, usz new_bytes, usz alignment) @dynamic
```
```c3
fn void LibcAllocator.release(&self, void* old_ptr, bool aligned) @dynamic
```
### `std::core::mem::allocator @if(env::WIN32)`
```c3
fn void*? LibcAllocator.acquire(&self, usz bytes, AllocInitType init_type, usz alignment) @dynamic
```
```c3
fn void*? LibcAllocator.resize(&self, void* old_ptr, usz new_bytes, usz alignment) @dynamic
```
```c3
fn void LibcAllocator.release(&self, void* old_ptr, bool aligned) @dynamic
```
### `std::core::mem::mempool`
```c3
const INITIAL_CAPACITY
```
```c3
struct FixedBlockPoolNode
```
```c3
struct FixedBlockPoolEntry
```

Fixed blocks pool pre-allocating blocks backed by an Allocator which are then reserved for the user,
blocks deallocated by the user are later re-used by future blocks allocations

`grow_capacity` can be changed in order to affect how many blocks will be allocated by next pool allocation,
it has to be greater than 0
`allocated` number of allocated blocks
`used` number of used blocks by the user
```c3
struct FixedBlockPool
```

Initialize an block pool
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
*>
```
```c3
macro FixedBlockPool* FixedBlockPool.init(&self, Allocator allocator, usz block_size, usz capacity = INITIAL_CAPACITY, usz alignment = 0)
```

Initialize an block pool
```c3
<*
 @param [in] allocator : "The allocator to use"
 @param $Type : "The type used for setting the block size"
 @param capacity : "The amount of blocks to be pre-allocated"
 @require !self.initialized : "The block pool must not be initialized"
*>
```
```c3
macro FixedBlockPool* FixedBlockPool.init_for_type(&self, Allocator allocator, $Type, usz capacity = INITIAL_CAPACITY)
```

Initialize an block pool using Temporary allocator
```c3
<*
 @param $Type : "The type used for setting the block size"
 @param capacity : "The amount of blocks to be pre-allocated"
 @require !self.initialized : "The block pool must not be initialized"
*>
```
```c3
macro FixedBlockPool* FixedBlockPool.tinit_for_type(&self, $Type, usz capacity = INITIAL_CAPACITY)
```

Initialize an block pool using Temporary allocator
```c3
<*
 @param block_size : "The block size to use"
 @param capacity : "The amount of blocks to be pre-allocated"
 @require !self.initialized : "The block pool must not be initialized"
*>
```
```c3
macro FixedBlockPool* FixedBlockPool.tinit(&self, usz block_size, usz capacity = INITIAL_CAPACITY)
```

Free up the entire block pool
```c3
<*
 @require self.initialized : "The block pool must be initialized"
*>
```
```c3
fn void FixedBlockPool.free(&self)
```

Allocate an block on the block pool, re-uses previously deallocated blocks
```c3
<*
 @require self.initialized : "The block pool must be initialized"
*>
```
```c3
fn void* FixedBlockPool.alloc(&self)
```

Deallocate a block from the block pool
```c3
<*
 @require self.initialized : "The block pool must be initialized"
 @require self.check_ptr(ptr) : "The pointer should be part of the pool"
*>
```
```c3
fn void FixedBlockPool.dealloc(&self, void* ptr)
```
### `std::core::mem::rc`

A RefCounted struct should be an inline base of a struct.
If a `dealloc` is defined, then it will be called rather than `free`

For convenience, a ref count of 0 is still valid, and the struct is
only freed when when ref count drops to -1.

The macros rc::retain and rc::release must be used on the full pointer,
not on the RefCounted substruct.

So `Foo* f = ...; RefCounted* rc = f; rc::release(rc);` will not do the right thing.
```c3
struct RefCounted
```

```c3
<*
 @require @assignable_to(refcounted, RefCounted*) : "Expected a ref counted value"
*>
```
```c3
macro retain(refcounted)
```

```c3
<*
 @require @assignable_to(refcounted, RefCounted*) : "Expected a ref counted value"
 @require !$defined(refcounted.dealloc()) ||| @typeis(refcounted.dealloc(), void)
*>
```
```c3
macro void release(refcounted)
```
### `std::core::mem::ref { Type }`
```c3
alias DeallocFn = fn void(void*)
```
```c3
fn Ref wrap(Type* ptr, Allocator allocator = mem)
```

```c3
<*
 @require $vacount < 2 : "Too many arguments."
 @require $vacount == 0 ||| @assignable_to($vaexpr[0], Type) : "The first argument must be an initializer for the type"
*>
```
```c3
macro Ref new(..., Allocator allocator = mem)
```
```c3
struct Ref
```
```c3
fn Ref* Ref.retain(&self)
```
```c3
fn void Ref.release(&self)
```
### `std::core::mem::vm`

VirtualMemory is an abstraction for working with an allocated virtual memory area. It will invoke vm:: functions
but will perform more checks and track its size (required to unmap the memory on Posix)
```c3
struct VirtualMemory
```
```c3
faultdef RANGE_OVERFLOW, UNKNOWN_ERROR, ACCESS_DENIED, UNMAPPED_ACCESS, UNALIGNED_ADDRESS, RELEASE_FAILED, UPDATE_FAILED, INVALID_ARGS
```
```c3
enum VirtualMemoryAccess
```
```c3
fn usz aligned_alloc_size(usz size)
```

Allocate virtual memory, size is rounded up to platform granularity (Win32) / page size (Posix).
```c3
<*
 @param size : "The size of the memory to allocate, will be rounded up"
 @param access : "The initial access permissions."
 @return? mem::OUT_OF_MEMORY, RANGE_OVERFLOW, UNKNOWN_ERROR, ACCESS_DENIED, INVALID_ARGS
 @return "Pointer to the allocated memory, page aligned"
*>
```
```c3
fn void*? alloc(usz size, VirtualMemoryAccess access)
```

Release memory allocated with "alloc".
```c3
<*
 @param [&inout] ptr : "Pointer to page to release, should be allocated using vm::alloc"
 @param size : "The size of the allocated pointer"
 @require mem::ptr_is_page_aligned(ptr) : "The pointer should be page aligned"
*>
```
```c3
fn void? release(void* ptr, usz size)
```

Change the access protection of a region in memory. The region must be page aligned.
```c3
<*
 @param [&inout] ptr : "Pointer to page to update, must be page aligned"
 @param len : "To what len to update, must be page aligned"
 @param access : "The new access"
 @require mem::ptr_is_page_aligned(ptr) : "The pointer should be page aligned"
 @require mem::ptr_is_page_aligned(ptr + len) : "The length must be page aligned"
 @return? ACCESS_DENIED, UNALIGNED_ADDRESS, RANGE_OVERFLOW, UPDATE_FAILED, UNMAPPED_ACCESS, INVALID_ARGS
*>
```
```c3
fn void? protect(void* ptr, usz len, VirtualMemoryAccess access)
```

Makes a region of memory available that was previously retrieved using 'alloc'. This is necessary on Win32,
but optional on Posix.
```c3
<*
 @param [&inout] ptr : "Pointer to page to update, must be page aligned"
 @param len : "To what len to commit, must be page aligned"
 @require mem::ptr_is_page_aligned(ptr) : "The pointer should be page aligned"
 @require mem::ptr_is_page_aligned(ptr + len) : "The length must be page aligned"
 @return? UNKNOWN_ERROR, mem::OUT_OF_MEMORY, ACCESS_DENIED, UNALIGNED_ADDRESS, RANGE_OVERFLOW, UPDATE_FAILED, UNMAPPED_ACCESS, INVALID_ARGS
*>
```
```c3
fn void? commit(void* ptr, usz len, VirtualMemoryAccess access = READWRITE)
```

Notifies that the memory in the region can be released back to the OS. On Win32 this decommits the region,
whereas on Posix it tells the system that it may be reused using madvise. The "block" parameter is only
respected on Posix, and protects the region from read/write/exec. On Win32 this always happens.
```c3
<*
 @param [&inout] ptr : "Pointer to page to update, must be page aligned"
 @param len : "To what len to commit, must be page aligned"
 @param block : "Set the released memory to protected"
 @require mem::ptr_is_page_aligned(ptr) : "The pointer should be page aligned"
 @require mem::ptr_is_page_aligned(ptr + len) : "The length must be page aligned"
 @return? ACCESS_DENIED, UNALIGNED_ADDRESS, RANGE_OVERFLOW, UPDATE_FAILED, UNMAPPED_ACCESS, INVALID_ARGS
*>
```
```c3
fn void? decommit(void* ptr, usz len, bool block = true)
```

Map a portion of an already-opened file into memory.
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
```
```c3
fn void*? mmap_file(Fd fd, usz size, usz offset = 0, VirtualMemoryAccess access = READ, bool shared = false) @if
```

Create a VirtualMemory using
```c3
<*
 @param size : "The size of the memory to allocate."
 @require size > 0 : "The size must be non-zero"
 @return? mem::OUT_OF_MEMORY, RANGE_OVERFLOW, UNKNOWN_ERROR, ACCESS_DENIED, INVALID_ARGS
*>
```
```c3
fn VirtualMemory? virtual_alloc(usz size, VirtualMemoryAccess access = PROTECTED)
```

Commits memory, using vm::commit
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
```
```c3
macro void? VirtualMemory.commit(self, usz offset, usz len)
```

Changes protection of a part of memory using vm::protect
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
```
```c3
macro void? VirtualMemory.protect(self, usz offset, usz len, VirtualMemoryAccess access)
```

Decommits a part of memory using vm::decommit
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
```
```c3
fn void? VirtualMemory.decommit(self, usz offset, usz len, bool block = true)
```

Releases the memory region
```c3
<*
 @require self.ptr != null : "Virtual memory must be initialized to call destroy"
*>
```
```c3
fn void? VirtualMemory.destroy(&self)
```
### `std::core::mem::volatile { Type }`
```c3
typedef Volatile @structlike = Type
```
```c3
macro Type Volatile.get(&self)
```
```c3
macro Type Volatile.set(&self, Type val)
```
### `std::core::runtime`
```c3
struct ReflectedParam (Printable) @if(!$defined(ReflectedParam))
```
```c3
struct AnyRaw
```
```c3
struct SliceRaw
```
```c3
macro @enum_lookup($Type, #value, value)
```
```c3
macro @enum_lookup_new($Type, $name, value)
```
```c3
alias BenchmarkFn = fn void ()
```
```c3
const DEFAULT_BENCHMARK_WARMUP_ITERATIONS
```
```c3
const DEFAULT_BENCHMARK_MAX_ITERATIONS
```
```c3
fn void set_benchmark_warmup_iterations(uint value) @builtin
```
```c3
fn void set_benchmark_max_iterations(uint value) @builtin
```
```c3
fn void set_benchmark_func_iterations(String func, uint value) @builtin
```
```c3
macro @start_benchmark()
```
```c3
macro @end_benchmark()
```
```c3
macro @log_benchmark(msg, args...)
```
```c3
fn bool run_benchmarks(BenchmarkUnit[] benchmarks)
```
```c3
fn bool default_benchmark_runner(String[] args)
```
```c3
alias TestFn = fn void()
```
```c3
struct TestContext
```
```c3
struct TestUnit
```
```c3
fn TestUnit[] test_collection_create(Allocator allocator)
```
```c3
fn int cmp_test_unit(TestUnit a, TestUnit b)
```
```c3
fn bool default_test_runner(String[] args)
```
### `std::core::runtime @if(WASM_NOLIBC)`
```c3
extern fn void __wasm_call_ctors()
```
### `std::core::sanitizer`
```c3
macro void annotate_contiguous_container(void* beg, void* end, void* old_mid, void* new_mid)
```
```c3
macro void annotate_double_ended_contiguous_container(void* storage_beg, void* storage_end, void* old_container_beg, void* old_container_end, void* new_container_beg, void* new_container_end)
```
```c3
macro void print_stack_trace()
```
```c3
fn void set_death_callback(VoidFn callback)
```
### `std::core::sanitizer @if (env::ANY_SANITIZER)`
```c3
struct __Sanitizer_sandbox_arguments
```
```c3
extern fn void __sanitizer_set_report_path(ZString path)
```
### `std::core::sanitizer::asan`
```c3
alias ErrorCallback = fn void (ZString)
```

Marks a memory region ([addr, addr+size)) as unaddressable.

This memory must be previously allocated by your program. Instrumented
code is forbidden from accessing addresses in this region until it is
unpoisoned. This function is not guaranteed to poison the entire region -
it could poison only a subregion of [addr, addr+size) due to ASan
alignment restrictions.

NOTE This function is not thread-safe because no two threads can poison or
unpoison memory in the same memory region simultaneously.
```c3
<*
 @param addr : "Start of memory region."
 @param size : "Size of memory region."
*>
```
```c3
macro poison_memory_region(void* addr, usz size)
```

Marks a memory region ([addr, addr+size)) as addressable.

This memory must be previously allocated by your program. Accessing
addresses in this region is allowed until this region is poisoned again.
This function could unpoison a super-region of [addr, addr+size) due
to ASan alignment restrictions.

NOTE This function is not thread-safe because no two threads can
poison or unpoison memory in the same memory region simultaneously.
```c3
<*
 @param addr : "Start of memory region."
 @param size : "Size of memory region."
*>
```
```c3
macro unpoison_memory_region(void* addr, usz size)
```

Checks if an address is poisoned.
```c3
<*
 @return "True if 'addr' is poisoned (that is, 1-byte read/write access to this address would result in an error report from ASan). Otherwise returns false."
 @param addr : "Address to check."
*>
```
```c3
macro bool address_is_poisoned(void* addr)
```

Checks if a region is poisoned.

If at least one byte in [beg, beg+size) is poisoned, returns the
address of the first such byte. Otherwise returns 0.
```c3
<*
 @param beg : "Start of memory region."
 @param size : "Start of memory region."
 @return "Address of first poisoned byte."
*>
```
```c3
macro void* region_is_poisoned(void* beg, usz size)
```

Sets the callback function to be called during ASan error reporting.
```c3
fn void set_error_report_callback(ErrorCallback callback)
```
### `std::core::sanitizer::asan @if(env::ADDRESS_SANITIZER)`
```c3
extern fn void __asan_poison_memory_region(void* addr, usz size)
```
### `std::core::sanitizer::tsan`
```c3
typedef MutexFlags = inline CUInt
```
```c3
const MutexFlags MUTEX_LINKER_INIT
```
```c3
const MutexFlags MUTEX_WRITE_REENTRANT
```
```c3
const MutexFlags MUTEX_READ_REENTRANT
```
```c3
const MutexFlags MUTEX_NOT_STATIC
```
```c3
const MutexFlags MUTEX_READ_LOCK
```
```c3
const MutexFlags MUTEX_TRY_LOCK
```
```c3
const MutexFlags MUTEX_TRY_LOCK_FAILED
```
```c3
const MutexFlags MUTEX_RECURSIVE_LOCK
```
```c3
const MutexFlags MUTEX_RECURSIVE_UNLOCK
```
```c3
const MutexFlags MUTEX_TRY_READ_LOCK
```
```c3
const MutexFlags MUTEX_TRY_READ_LOCK_FAILED
```
```c3
macro void mutex_create(void* addr, MutexFlags flags)
```
```c3
macro void mutex_destroy(void* addr, MutexFlags flags)
```
```c3
macro void mutex_pre_lock(void* addr, MutexFlags flags)
```
```c3
macro void mutex_post_lock(void* addr, MutexFlags flags, CInt recursion)
```
```c3
macro CInt mutex_pre_unlock(void* addr, MutexFlags flags)
```
```c3
macro void mutex_post_unlock(void* addr, MutexFlags flags)
```
```c3
macro void mutex_pre_signal(void* addr, MutexFlags flags)
```
```c3
macro void mutex_post_signal(void* addr, MutexFlags flags)
```
```c3
macro void mutex_pre_divert(void* addr, MutexFlags flags)
```
```c3
macro void mutex_post_divert(void* addr, MutexFlags flags)
```
### `std::core::string`
```c3
typedef String @if(!$defined(String)) = inline char[]
```

ZString is a pointer to a zero terminated array of chars.

Use ZString when you need to interop with C zero terminated strings.
```c3
typedef ZString = inline char*
```

WString is a pointer to a zero terminated array of Char16.

Depending on the platform, this may or may not correspond to wchar_t.
For Windows, wchar_t is generally 16 bits, on MacOS it is 32 bits.
However, for both MacOS and Linux, regular C strings (ZString)
will be UTF-8 encoded, so there is no need to use the wchar_t versions
of functions outside of encoding functions.
```c3
typedef WString = inline Char16*
```

Char32 is a UTF32 codepoint
```c3
alias Char32 = uint
```

Char16 is a UTF16 "character"
```c3
alias Char16 = ushort
```

Common faults used with strings
```c3
faultdef INVALID_UTF8, INVALID_UTF16, CONVERSION_FAILED,
         EMPTY_STRING, NEGATIVE_VALUE, MALFORMED_INTEGER,
         INTEGER_OVERFLOW, MALFORMED_FLOAT, FLOAT_OUT_OF_RANGE
```

Create a pointer to an UTF32 encoded string at compile time.
```c3
<*
 @param $string : "The string to encode"
*>
```
```c3
macro Char32* @wstring32(String $string) @builtin
```

Create a slice of an UTF32 encoded string at compile time.
```c3
<*
 @param $string : "The string to encode"
*>
```
```c3
macro Char32[] @char32(String $string) @builtin
```

Create a WString (an UTF16 encoded string) at compile time.
```c3
<*
 @param $string : "The string to encode"
*>
```
```c3
macro WString @wstring(String $string) @builtin
```

Create a slice of an UTF32 encoded string at compile time.
```c3
<*
 @param $string : "The string to encode"
*>
```
```c3
macro Char16[] @char16(String $string) @builtin
```
```c3
macro String @sprintf(String $format, ...) @builtin @const
```

Return a temporary ZString created using the formatting function.
```c3
<*
 @param [in] fmt : `The formatting string`
*>
```
```c3
fn ZString tformat_zstr(String fmt, args...) @format(0)
```

Return a new String created using the formatting function.
```c3
<*
 @param [inout] allocator : `The allocator to use`
 @param [in] fmt : `The formatting string`
*>
```
```c3
fn String format(Allocator allocator, String fmt, args...) @format(1)
```

Return a new String created using the formatting function.
```c3
<*
 @param [inout] buffer : `The buffer to use`
 @param [in] fmt : `The formatting string`
*>
```
```c3
fn String bformat(char[] buffer, String fmt, args...) @format(1)
```

Return a temporary String created using the formatting function.
```c3
<*
 @param [in] fmt : `The formatting string`
*>
```
```c3
fn String tformat(String fmt, args...) @format(0)
```

Check if a character is in a set.
```c3
<*
 @param c : `the character to check`
 @param [in] set : `The formatting string`
 @pure
 @return `True if a character is in the set`
*>
```
```c3
macro bool char_in_set(char c, String set)
```
```c3
fn String join(Allocator allocator, String[] s, String joiner)
```

Replace all instances of one substring with a different string.
```c3
<*
 @param [in] self
 @param [in] needle : `The string to be replaced`
 @param [in] new_str : `The replacement string`
 @param [&inout] allocator : `The allocator to use for the String`
 @return "The new string with the elements replaced"
*>
```
```c3
fn String String.replace(self, Allocator allocator, String needle, String new_str) @nodiscard
```

Replace all instances of one substring with a different string, allocating the new string on the temp allocator.
```c3
<*
 @param [in] self
 @param [in] needle : `The string to be replaced`
 @param [in] new_str : `The replacement string`
 @return "The new string with the elements replaced"
*>
```
```c3
fn String String.treplace(self, String needle, String new_str)
```

Remove characters from the front and end of a string.
```c3
<*
 @param [in] self : `The string to trim`
 @param [in] to_trim : `The set of characters to trim, defaults to whitespace`
 @pure
 @return `a substring of the string passed in`
*>
```
```c3
fn String String.trim(self, String to_trim = "\t\n\r ")
```

Remove characters from the front of a string.
```c3
<*
 @param [in] self : `The string to trim`
 @param [in] to_trim : `The set of characters to trim, defaults to whitespace`
 @pure
 @return `a substring of the string passed in`
*>
```
```c3
fn String String.trim_left(self, String to_trim = "\t\n\r ")
```

Remove characters from the end of a string.
```c3
<*
 @param [in] self : `The string to trim`
 @param [in] to_trim : `The set of characters to trim, defaults to whitespace`
 @pure
 @return `a substring of the string passed in`
*>
```
```c3
fn String String.trim_right(self, String to_trim = "\t\n\r ")
```

Check if the String starts with the prefix.
```c3
<*
 @param [in] self
 @param [in] prefix
 @pure
 @return `'true' if the string starts with the prefix`
*>
```
```c3
fn bool String.starts_with(self, String prefix)
```

Check if the String ends with the suffix.
```c3
<*
 @param [in] self
 @param [in] suffix
 @pure
 @return `'true' if the string ends with the suffix`
*>
```
```c3
fn bool String.ends_with(self, String suffix)
```

Strip the front of the string if the prefix exists.
```c3
<*
 @param [in] self
 @param [in] prefix
 @pure
 @return `the substring with the prefix removed`
*>
```
```c3
fn String String.strip(self, String prefix)
```

Strip the end of the string if the suffix exists.
```c3
<*
 @param [in] self
 @param [in] suffix
 @pure
 @return `the substring with the suffix removed`
*>
```
```c3
fn String String.strip_end(self, String suffix)
```

Split a string into parts, e.g "a|b|c" split with "|" yields { "a", "b", "c" }
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
```
```c3
fn String[] String.split(self, Allocator allocator, String delimiter, usz max = 0, bool skip_empty = false)
```

This function is identical to String.split, but implicitly uses the
temporary allocator.
```c3
<*
 @param [in] s
 @param [in] delimiter
 @param max : "Max number of elements, 0 means no limit, defaults to 0"
 @param skip_empty : "True to skip empty elements"
*>
```
```c3
fn String[] String.tsplit(s, String delimiter, usz max = 0, bool skip_empty = false)
```
```c3
faultdef BUFFER_EXCEEDED
```

Split a string into parts, e.g "a|b|c" split with "|" yields { "a", "b", "c" }
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
```
```c3
fn String[]? String.split_to_buffer(s, String delimiter, String[] buffer, usz max = 0, bool skip_empty = false)
```

Check if a substring is found in the string.
```c3
<*
 @param [in] s
 @param [in] substr : "The string to look for."
 @pure
 @return "true if the string contains the substring, false otherwise"
*>
```
```c3
fn bool String.contains(s, String substr)
```

Check how many non-overlapping instances of a substring there is.

If the substring has zero length, the number of matches is zero.
```c3
<*
 @param [in] self : "The string to search"
 @param [in] substr : "The string to look for."
 @pure
 @return "The number of times matched"
*>
```
```c3
fn usz String.count(self, String substr)
```

Find the index of the first incidence of a string.
```c3
<*
 @param [in] self
 @param character : "The character to look for"
 @pure
 @ensure return < self.len
 @return "the index of the character"
 @return? NOT_FOUND : "if the character cannot be found"
*>
```
```c3
fn usz? String.index_of_char(self, char character)
```

Find the index of the first incidence of a one of the chars.
```c3
<*
 @param [in] self
 @param [in] characters : "The characters to look for"
 @pure
 @ensure return < self.len
 @return "the index of the character"
 @return? NOT_FOUND : "if the character cannot be found"
*>
```
```c3
fn usz? String.index_of_chars(String self, char[] characters)
```

Find the index of the first incidence of a character.
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
```
```c3
fn usz? String.index_of_char_from(self, char character, usz start_index)
```

Find the index of the first incidence of a character starting from the end.
```c3
<*
 @param [in] self
 @param character : "the character to find"
 @pure
 @ensure return < self.len
 @return "the index of the character"
 @return? NOT_FOUND : "if the character cannot be found"
*>
```
```c3
fn usz? String.rindex_of_char(self, char character)
```

Find the index of the first incidence of a string.
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
```
```c3
fn usz? String.index_of(self, String substr)
```

Find the index of the last incidence of a string.
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
```
```c3
fn usz? String.rindex_of(self, String substr)
```
```c3
fn bool ZString.eq(self, ZString other) @operator(==)
```
```c3
fn String ZString.str_view(self)
```
```c3
fn usz ZString.char_len(str)
```
```c3
fn usz ZString.len(self)
```
```c3
fn usz WString.len(self)
```
```c3
fn ZString String.zstr_copy(self, Allocator allocator)
```
```c3
fn String String.concat(self, Allocator allocator, String s2)
```
```c3
fn String String.tconcat(self, String s2)
```
```c3
fn ZString String.zstr_tcopy(self)
```

Copy this string, by duplicating the string, always adding a zero byte
sentinel, so that it safely can be converted to a ZString by a
cast.
```c3
fn String String.copy(self, Allocator allocator)
```
```c3
fn void String.free(&self, Allocator allocator)
```
```c3
fn String String.tcopy(self)
```
```c3
fn String ZString.copy(self, Allocator allocator)
```
```c3
fn String ZString.tcopy(self)
```

Convert an UTF-8 string to UTF-16
```c3
<*
 @return "The UTF-16 string as a slice, allocated using the given allocator"
 @return? INVALID_UTF8 : "If the string contained an invalid UTF-8 sequence"
*>
```
```c3
fn Char16[]? String.to_utf16(self, Allocator allocator)
```
```c3
fn Char16[]? String.to_temp_utf16(self)
```
```c3
fn WString? String.to_wstring(self, Allocator allocator)
```
```c3
fn WString? String.to_temp_wstring(self)
```
```c3
fn Char32[]? String.to_utf32(self, Allocator allocator)
```
```c3
fn Char32[]? String.to_temp_utf32(self)
```

Convert a string to ASCII lower case in place.
```c3
<*
 @param [inout] self
 @pure
*>
```
```c3
fn void String.convert_to_lower(self)
```
```c3
fn String String.to_lower_copy(self, Allocator allocator)
```
```c3
fn String String.to_lower_tcopy(self)
```

Convert a string to ASCII upper case.
```c3
<*
 @param [inout] self
 @pure
*>
```
```c3
fn void String.convert_to_upper(self)
```

Returns a string converted to ASCII upper case.
```c3
<*
 @param [in] self
 @param [inout] allocator
 @return `a new String converted to ASCII upper case.`
*>
```
```c3
fn String String.to_upper_copy(self, Allocator allocator)
```
```c3
fn String String.capitalize_copy(self, Allocator allocator)
```

Convert a string from `snake_case` to PascalCase.
```c3
<*
 @param [in] self
 @return `"FooBar" from "foo_bar" the resulting pointer may safely be cast to ZString.`
*>
```
```c3
fn String String.snake_to_pascal_copy(self, Allocator allocator)
```

Movifies the current string from `snake_case` to PascalCase.
```c3
<*
 @param [inout] self
*>
```
```c3
fn void String.convert_snake_to_pascal(&self)
```

Convert a string from `PascalCase` to `snake_case`.
```c3
<*
 @param [in] self
 @return `"foo_bar" from "FooBar" the resulting pointer may safely be cast to ZString.`
*>
```
```c3
fn String String.pascal_to_snake_copy(self, Allocator allocator)
```
```c3
fn StringIterator String.iterator(self)
```

```c3
<*
 @param [in] self
 @return `a temporary String converted to ASCII upper case.`
*>
```
```c3
fn String String.to_upper_tcopy(self)
```
```c3
fn String? from_utf32(Allocator allocator, Char32[] utf32)
```
```c3
fn String? from_utf16(Allocator allocator, Char16[] utf16)
```
```c3
fn String? from_wstring(Allocator allocator, WString wstring)
```
```c3
fn String? tfrom_wstring(WString wstring)
```
```c3
fn String? tfrom_utf16(Char16[] utf16)
```
```c3
fn usz String.utf8_codepoints(s)
```

Determine whether the current string actually points to a ZString-like string.

This is done by looking at the byte one step after the end of the string. If this
is zero, it is considered zero terminated.

This function can safely be used with data pointing to null. However, it will not
work correctly if the pointer is invalid, for example it is already freed.
```c3
fn bool String.is_zstr(self) @deprecated("Unsafe, use copy instead")
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
```c3
<*
 @ensure return[self.len] == 0
*>
```
```c3
fn ZString String.quick_zstr(self) @deprecated("Unsafe, use zstr_tcopy instead")
```

Convert a number to a given base. If the base is not given, then
it will be inferred from the number if the string starts with 0x 0o or 0b and the
base is given as 10.

Furthermore it will skip any spaces before and after the number.
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
```
```c3
macro String.to_integer(self, $Type, int base = 10)
```
```c3
fn int128? String.to_int128(self, int base = 10)
```
```c3
fn long? String.to_long(self, int base = 10)
```
```c3
fn int? String.to_int(self, int base = 10)
```
```c3
fn short? String.to_short(self, int base = 10)
```
```c3
fn ichar? String.to_ichar(self, int base = 10)
```
```c3
fn uint128? String.to_uint128(self, int base = 10)
```
```c3
fn ulong? String.to_ulong(self, int base = 10)
```
```c3
fn uint? String.to_uint(self, int base = 10)
```
```c3
fn ushort? String.to_ushort(self, int base = 10)
```
```c3
fn char? String.to_uchar(self, int base = 10)
```
```c3
fn double? String.to_double(self)
```
```c3
fn float? String.to_float(self)
```

Create a Splitter to track tokenizing of a string. Tokenize will turn "foo:bar::baz" into
"foo", "bar" and "baz", if you want the empty string to be present, use `tokenize_all`
instead.
```c3
<*
 @param [in] split : "The string to use for splitting"
 @return "A Splitter to track the state"
*>
```
```c3
fn Splitter String.tokenize(self, String split)
```

Create a Splitter to track tokenizing of a string. Tokenize will turn "foo:bar::baz" into
"foo", "bar" and "baz", if you want the empty string to be present, use `tokenize_all`
instead.
```c3
<*
 @param [in] split : "The string to use for splitting"
 @param skip_last : "Set to true to not include the last empty token if present (default: false)"
 @return "A Splitter to track the state"
*>
```
```c3
fn Splitter String.tokenize_all(self, String split, bool skip_last = false)
```
```c3
fn Splitter String.splitter(self, String split) @deprecated("Use tokenize_all instead")
```

This macro will create a string description of a struct.
```c3
<*
 @param [&inout] allocator : "The allocator to use"
 @param x : "The struct to create a description of"
*>
```
```c3
macro String from_struct(Allocator allocator, x)
```

This macro will create a temporary string description of a struct.
```c3
<*
 @param x : "The struct to create a description of"
*>
```
```c3
macro String tfrom_struct(x)
```
```c3
enum SplitterType
```

Splitter is handles tokenizing strings.
```c3
struct Splitter
```
```c3
fn void Splitter.reset(&self)
```
```c3
fn String? Splitter.next(&self)
```
```c3
faultdef INVALID_ESCAPE_SEQUENCE, UNTERMINATED_STRING, INVALID_HEX_ESCAPE, INVALID_UNICODE_ESCAPE
```

Escape a string by adding quotes and converting special characters to escape sequences.
```c3
<*
 @param allocator : "The allocator to use for the result"
 @param s : "The string to escape"
 @param strip_quotes : "Do not include beginning and end quotes, defaults to false"
 @return "The escaped string with surrounding quotes, can safely be cast to ZString"
*>
```
```c3
fn String String.escape(String s, Allocator allocator, bool strip_quotes = true)
```

Escape a string using the temp allocator.
```c3
<*
 @param s : "The string to escape"
 @param strip_quotes : "Do not include beginning and end quotes, defaults to false"
 @return "The escaped string with surrounding quotes"
*>
```
```c3
fn String String.tescape(String s, bool strip_quotes = false)
```

Calculate the length needed for an escaped string (including quotes).
```c3
<*
 @param s : "The string to check"
 @return "The length needed for the escaped version"
*>
```
```c3
fn usz escape_len(String s)
```

Unescape a quoted string by parsing escape sequences.
```c3
<*
 @param allocator : "The allocator to use for the result"
 @param s : "The quoted string to unescape"
 @param allow_unquoted : "Set to true to unescape strings not surrounded by quotes, defaults to false"
 @return "The unescaped string without quotes, safe to convert to ZString"
 @return? UNTERMINATED_STRING, INVALID_ESCAPE_SEQUENCE, INVALID_HEX_ESCAPE, INVALID_UNICODE_ESCAPE
*>
```
```c3
fn String? String.unescape(String s, Allocator allocator, bool allow_unquoted = false)
```

Unescape a quoted string using the temp allocator.
```c3
<*
 @param s : "The quoted string to unescape"
 @param allow_unquoted : "Set to true to unescape strings not surrounded by quotes, defaults to false"
 @return "The unescaped string without quotes"
 @return? UNTERMINATED_STRING, INVALID_ESCAPE_SEQUENCE, INVALID_HEX_ESCAPE, INVALID_UNICODE_ESCAPE
*>
```
```c3
fn String? String.tunescape(String s, bool allow_unquoted = false)
```

Check if a character needs to be escaped in a string literal.
```c3
<*
 @param c : "The character to check"
 @return "True if the character needs escaping"
*>
```
```c3
fn bool needs_escape(char c)
```
```c3
const KMAX
```
```c3
const MASK
```
```c3
const B1B_DIG
```
```c3
const uint[2] B1B_MAX
```

```c3
<*
 @require chars.len > 0
*>
```
```c3
macro double? decfloat(char[] chars, int $bits, int $emin, int sign)
```
```c3
macro double? hexfloat(char[] chars, int $bits, int $emin, int sign)
```
### `std::core::string::ansi`
```c3
enum Ansi : const inline String
```

8-bit color code
```c3
<*
 @return `the formatting char for the given background color`
*>
```
```c3
macro String color_8bit(char $index, bool $bg = false) @const
```

24-bit color code
```c3
<*
 @return `the string for the given foreground color`
*>
```
```c3
macro String color_rgb(char $r, char $g, char $b, bool $bg = false) @const
```

24-bit color code rgb
```c3
<*
 @require $rgb <= 0xFF_FF_FF : `Expected a 24 bit RGB value`
 @return `the string char for the given foreground color`
*>
```
```c3
macro String color(uint $rgb, bool $bg = false) @const
```

24-bit color code rgb
```c3
<*
 @require rgb <= 0xFF_FF_FF : `Expected a 24 bit RGB value`
 @return `the string char for the given foreground color`
*>
```
```c3
fn String make_color(Allocator mem, uint rgb, bool bg = false)
```

24-bit color code rgb
```c3
<*
 @require rgb <= 0xFF_FF_FF : `Expected a 24 bit RGB value`
 @return `the string char for the given foreground color`
*>
```
```c3
fn String make_tcolor(uint rgb, bool bg = false)
```

24-bit color code rgb
```c3
<*
 @return `the string char for the given foreground color`
*>
```
```c3
fn String make_color_rgb(Allocator mem, char r, char g, char b, bool bg = false)
```

24-bit color code rgb
```c3
<*
 @return `the string char for the given foreground color`
*>
```
```c3
fn String make_tcolor_rgb(char r, char g, char b, bool bg = false)
```
### `std::core::string::conv`

```c3
<*
 @param c : `The utf32 codepoint to convert`
 @param [out] output : `the resulting buffer`
 @return? string::CONVERSION_FAILED
*>
```
```c3
fn usz? char32_to_utf8(Char32 c, char[] output)
```

Convert a code pointer into 1-2 UTF16 characters.
```c3
<*
 @param c : `The character to convert.`
 @param [inout] output : `the resulting UTF16 buffer to write to.`
*>
```
```c3
fn void char32_to_utf16_unsafe(Char32 c, Char16** output)
```

Convert 1-2 UTF16 data points into UTF8.
```c3
<*
 @param [in] ptr : `The UTF16 data to convert.`
 @param [inout] available : `amount of UTF16 data available.`
 @param [inout] output : `the resulting utf8 buffer to write to.`
*>
```
```c3
fn void? char16_to_utf8_unsafe(Char16 *ptr, usz *available, char** output)
```

```c3
<*
 @param c : `The utf32 codepoint to convert`
 @param [inout] output : `the resulting buffer`
*>
```
```c3
fn usz char32_to_utf8_unsafe(Char32 c, char** output)
```

```c3
<*
 @param [in] ptr : `pointer to the first character to parse`
 @param [inout] size : `Set to max characters to read, set to characters read`
 @return `the parsed 32 bit codepoint`
*>
```
```c3
fn Char32? utf8_to_char32(char* ptr, usz* size)
```

```c3
<*
 @param utf8 : `An UTF-8 encoded slice of bytes`
 @return `the number of encoded code points`
*>
```
```c3
fn usz utf8_codepoints(String utf8)
```

Calculate the UTF8 length required to encode an UTF32 array.
```c3
<*
 @param [in] utf32 : `the utf32 data to calculate from`
 @return `the length of the resulting UTF8 array`
*>
```
```c3
fn usz utf8len_for_utf32(Char32[] utf32)
```

Calculate the UTF8 length required to encode an UTF16 array.
```c3
<*
 @param [in] utf16 : `the utf16 data to calculate from`
 @return `the length of the resulting UTF8 array`
*>
```
```c3
fn usz utf8len_for_utf16(Char16[] utf16)
```

Calculate the UTF16 length required to encode a UTF8 array.
```c3
<*
 @param utf8 : `the utf8 data to calculate from`
 @return `the length of the resulting UTF16 array`
*>
```
```c3
fn usz utf16len_for_utf8(String utf8)
```

```c3
<*
 @param [in] utf32 : `the UTF32 array to check the length for`
 @return `the required length of an UTF16 array to hold the UTF32 data.`
*>
```
```c3
fn usz utf16len_for_utf32(Char32[] utf32)
```

Convert an UTF32 array to an UTF8 array.
```c3
<*
 @param [in] utf32
 @param [out] utf8_buffer
 @return `the number of bytes written.`
*>
```
```c3
fn usz? utf32to8(Char32[] utf32, char[] utf8_buffer)
```

Convert an UTF8 array to an UTF32 array.
```c3
<*
 @param [in] utf8
 @param [out] utf32_buffer
 @return `the number of Char32s written.`
*>
```
```c3
fn usz? utf8to32(String utf8, Char32[] utf32_buffer)
```

Copy an array of UTF16 data into an UTF8 buffer without bounds
checking. This will assume the buffer is sufficiently large to hold
the converted data.
```c3
<*
 @param [in] utf16 : `The UTF16 array containing the data to convert.`
 @param [out] utf8_buffer : `the (sufficiently large) buffer to hold the UTF16 data.`
*>
```
```c3
fn void? utf16to8_unsafe(Char16[] utf16, char* utf8_buffer)
```

Copy an array of UTF8 data into an UTF32 buffer without bounds
checking. This will assume the buffer is sufficiently large to hold
the converted data.
```c3
<*
 @param [in] utf8 : `The UTF8 buffer containing the data to convert.`
 @param [out] utf32_buffer : `the (sufficiently large) buffer to hold the UTF8 data.`
*>
```
```c3
fn void? utf8to32_unsafe(String utf8, Char32* utf32_buffer)
```

Copy an array of UTF8 data into an UTF16 buffer without bounds
checking. This will assume the buffer is sufficiently large to hold
the converted data.
```c3
<*
 @param [in] utf8 : `The UTF8 buffer containing the data to convert.`
 @param [out] utf16_buffer : `the (sufficiently large) buffer to hold the UTF8 data.`
*>
```
```c3
fn void? utf8to16_unsafe(String utf8, Char16* utf16_buffer)
```

Copy an array of UTF32 code points into an UTF8 buffer without bounds
checking. This will assume the buffer is sufficiently large to hold
the converted data.
```c3
<*
 @param [in] utf32 : `The UTF32 buffer containing the data to convert.`
 @param [out] utf8_buffer : `the (sufficiently large) buffer to hold the UTF8 data.`
*>
```
```c3
fn void utf32to8_unsafe(Char32[] utf32, char* utf8_buffer)
```
### `std::core::string::iterator`
```c3
struct StringIterator
```
```c3
fn void StringIterator.reset(&self)
```
```c3
fn Char32? StringIterator.next(&self)
```
```c3
fn Char32? StringIterator.peek(&self)
```
```c3
fn bool StringIterator.has_next(&self)
```
```c3
fn Char32? StringIterator.get(&self)
```
### `std::core::test`

Initializes test case context.
```c3
<*
 @param setup_fn : `initializer function for test case`
 @param teardown_fn : `cleanup function for test context (may be null)`
 @require runtime::test_context != null : "Only allowed in @test functions"
 @require setup_fn != null : "setup_fn must always be set"
*>
```
```c3
macro @setup(TestFn setup_fn, TestFn teardown_fn = null)
```

Checks condition and fails assertion if not true
```c3
<*
 @param #condition : `any boolean condition, will be expanded by text`
 @param format : `printf compatible format`
 @param args : `vargs for format`
 @require runtime::test_context != null : "Only allowed in @test functions"
*>
```
```c3
macro @check(#condition, String format = "", args...)
```

Check if function returns specific error
```c3
<*
 @param #funcresult : `result of function execution`
 @param error_expected : `expected error of function execution`
 @require runtime::test_context != null : "Only allowed in @test functions"
*>
```
```c3
macro @error(#funcresult, fault error_expected)
```

Check if left == right
```c3
<*
 @param left : `left argument of any comparable type`
 @param right : `right argument of any comparable type`
 @require runtime::test_context != null : "Only allowed in @test functions"
*>
```
```c3
macro eq(left, right)
```

Check left floating point value is approximately equals to right value
```c3
<*
 @param places : `number of decimal places to compare (default: 7)`
 @param delta : `minimal allowed difference (overrides places parameter)`
 @param equal_nan : `allows comparing nan values, if left and right both nans result is ok`
 @require places > 0, places <= 20 : "too many decimal places"
 @require delta >= 0, delta <= 1 : "delta must be a small number"
 @require runtime::test_context != null : "Only allowed in @test functions"
*>
```
```c3
macro void eq_approx(double left, double right, uint places = 7, double delta = 0, bool equal_nan = true)
```

Check if left != right
```c3
<*
 @param left : `left argument of any comparable type`
 @param right : `right argument of any comparable type`
 @require runtime::test_context != null : "Only allowed in @test functions"
*>
```
```c3
macro void ne(left, right)
```

Check if left > right
```c3
<*
 @param left : `left argument of any comparable type`
 @param right : `right argument of any comparable type`
 @require runtime::test_context != null : "Only allowed in @test functions"
*>
```
```c3
macro gt(left, right)
```

Check if left >= right
```c3
<*
 @param left : `left argument of any comparable type`
 @param right : `right argument of any comparable type`
 @require runtime::test_context != null : "Only allowed in @test functions"
*>
```
```c3
macro ge(left, right)
```

Check if left < right
```c3
<*
 @param left : `left argument of any comparable type`
 @param right : `right argument of any comparable type`
 @require runtime::test_context != null : "Only allowed in @test functions"
*>
```
```c3
macro lt(left, right)
```

Check if left <= right
```c3
<*
 @param left : `left argument of any comparable type`
 @param right : `right argument of any comparable type`
 @require runtime::test_context != null : "Only allowed in @test functions"
*>
```
```c3
macro le(left, right)
```
### `std::core::types`
```c3
faultdef VALUE_OUT_OF_RANGE, VALUE_OUT_OF_UNSIGNED_RANGE
```

```c3
<*
 @require $Type.kindof.is_int() : "Type was not an integer"
 @require v.type.kindof == ENUM : "Value was not an enum"
*>
```
```c3
macro any_to_enum_ordinal(any v, $Type)
```

```c3
<*
 @require $Type.kindof.is_int() : "Type was not an integer"
 @require v.type.kindof.is_int() : "Value was not an integer"
*>
```
```c3
macro any_to_int(any v, $Type)
```
```c3
fn bool typeid.is_subtype_of(self, typeid other)
```
```c3
macro bool is_subtype_of($Type, $OtherType)
```
```c3
macro bool is_numerical($Type)
```
```c3
fn bool TypeKind.is_int(kind) @inline
```
```c3
macro bool is_slice_convertable($Type)
```
```c3
macro bool is_bool($Type) @const
```
```c3
macro bool is_int($Type) @const
```

```c3
<*
 @require is_numerical($Type) : "Expected a numerical type"
*>
```
```c3
macro bool is_signed($Type) @const
```

```c3
<*
 @require is_numerical($Type) : "Expected a numerical type"
*>
```
```c3
macro bool is_unsigned($Type) @const
```
```c3
macro typeid flat_type($Type) @const
```
```c3
macro TypeKind flat_kind($Type) @const
```
```c3
macro bool is_indexable($Type) @const
```
```c3
macro bool is_ref_indexable($Type) @const
```
```c3
macro bool is_flat_intlike($Type) @const
```
```c3
macro bool is_intlike($Type) @const
```
```c3
macro bool is_underlying_int($Type) @const
```
```c3
macro bool is_float($Type) @const
```
```c3
macro bool is_floatlike($Type) @const
```
```c3
macro bool is_vector($Type) @const
```
```c3
macro typeid inner_type($Type) @const
```
```c3
macro TypeKind inner_kind($Type) @const
```
```c3
macro bool is_same($TypeA, $TypeB) @const
```
```c3
macro bool @has_same(#a, #b, ...) @const
```
```c3
macro bool may_load_atomic($Type) @const
```
```c3
macro lower_to_atomic_compatible_type($Type) @const
```
```c3
macro bool is_promotable_to_floatlike($Type) @const
```
```c3
macro bool is_promotable_to_float($Type) @const
```
```c3
macro bool is_same_vector_type($Type1, $Type2) @const
```
```c3
macro bool has_equals($Type) @const
```
```c3
macro bool is_equatable_type($Type) @const
```

Checks if a type implements the copy protocol.
```c3
macro bool implements_copy($Type) @const
```
```c3
macro bool @equatable_value(#value) @const
```
```c3
macro bool @comparable_value(#value) @const
```
```c3
enum TypeKind : char
```
```c3
struct TypeEnum
```
### `std::core::values`

Return true if two values have the same type before any conversions.
```c3
macro bool @is_same_type(#value1, #value2) @const
```
```c3
macro bool @is_bool(#value) @const
```
```c3
macro bool @is_int(#value) @const
```
```c3
macro bool @is_flat_intlike(#value) @const
```
```c3
macro bool @is_floatlike(#value) @const
```
```c3
macro bool @is_float(#value) @const
```
```c3
macro bool @is_promotable_to_floatlike(#value) @const
```
```c3
macro bool @is_promotable_to_float(#value) @const
```
```c3
macro bool @is_vector(#value) @const
```
```c3
macro bool @is_same_vector_type(#value1, #value2) @const
```
```c3
macro bool @assign_to(#value1, #value2) @const
```
```c3
macro bool @is_lvalue(#value)
```
```c3
macro bool @is_const(#foo) @const @builtin
```
```c3
macro promote_int(x)
```

Select between two values at compile time,
the values do not have to be of the same type.

This acts like `$bool ? #value_1 : #value_2` but at compile time.
```c3
<*
 @param $bool : `true for picking the first value, false for the other`
 @param #value_1
 @param #value_2
 @returns `The selected value.`
*>
```
```c3
macro @select(bool $bool, #value_1, #value_2) @builtin
```
```c3
macro promote_int_same(x, y)
```
```c3
macro TypeKind @inner_kind(#value) @const
```
### `std::crypto`
```c3
fn bool safe_compare(void* data1, void* data2, usz len)
```
### `std::crypto::dh`
```c3
fn BigInt generate_secret(BigInt p, BigInt x, BigInt y)
```
```c3
fn BigInt public_key(BigInt p, BigInt g, BigInt x)
```
### `std::crypto::ed25519`
```c3
alias Ed25519PrivateKey = char[32]
```
```c3
alias Ed25519PublicKey = char[Ed25519PrivateKey.len]
```
```c3
alias Ed25519Signature = char[2 * Ed25519PublicKey.len]
```

Generate a public key from a private key.
```c3
<*
 @param [in] private_key : "32 bytes of cryptographically secure random data"
 @require private_key.len == Ed25519PrivateKey.len
*>
```
```c3
fn Ed25519PublicKey public_keygen(char[] private_key)
```

Sign a message.
```c3
<*
 @param [in] message
 @param [in] private_key
 @param [in] public_key
 @require private_key.len == Ed25519PrivateKey.len
 @require public_key.len == Ed25519PublicKey.len
*>
```
```c3
fn Ed25519Signature sign(char[] message, char[] private_key, char[] public_key)
```

Verify the signature of a message.
```c3
<*
 @param [in] message
 @param [in] signature
 @param [in] public_key
 @require signature.len == Ed25519Signature.len
 @require public_key.len == Ed25519PublicKey.len
*>
```
```c3
fn bool verify(char[] message, char[] signature, char[] public_key)
```
### `std::crypto::rc4`
```c3
struct Rc4
```

Initialize the RC4 state.
```c3
<*
 @param [in] key : "The key to use"
 @require key.len > 0 : "The key must be at least 1 byte long"
*>
```
```c3
fn void Rc4.init(&self, char[] key)
```

Run a single pass of en/decryption using a particular key.
```c3
<*
 @param [in] key
 @param [inout] data
*>
```
```c3
fn void crypt(char[] key, char[] data)
```

Encrypt or decrypt a sequence of bytes.
```c3
<*
 @param [in] in : "The input"
 @param [out] out : "The output"
 @require in.len <= out.len : "Output would overflow"
*>
```
```c3
fn void Rc4.crypt(&self, char[] in, char[] out)
```

Clear the rc4 state.
```c3
<*
 @param [&out] self : "The RC4 State"
*>
```
```c3
fn void Rc4.destroy(&self)
```
### `std::encoding`
```c3
faultdef INVALID_CHARACTER, INVALID_PADDING
```
### `std::encoding::base32`
```c3
struct Base32Alphabet
```
```c3
const char NO_PAD
```
```c3
const char DEFAULT_PAD
```

Encode the content of src into a newly allocated string
```c3
<*
 @param [in] src : "The input to be encoded."
 @param padding : "The padding character or 0 if none"
 @param alphabet : "The alphabet to use"
 @require padding < 0xFF : "Invalid padding character"
 @return "The encoded string."
*>
```
```c3
fn String? encode(Allocator allocator, char[] src, char padding = DEFAULT_PAD, Base32Alphabet* alphabet = &STANDARD)
```

Decode the content of src into a newly allocated char array.
```c3
<*
 @param [in] src : "The input to be encoded."
 @param padding : "The padding character or 0 if none"
 @param alphabet : "The alphabet to use"
 @require padding < 0xFF : "Invalid padding character"
 @return "The decoded data."
*>
```
```c3
fn char[]? decode(Allocator allocator, char[] src, char padding = DEFAULT_PAD, Base32Alphabet* alphabet = &STANDARD)
```
```c3
fn String? tencode(char[] code, char padding = DEFAULT_PAD, Base32Alphabet* alphabet = &STANDARD) @inline
```
```c3
fn char[]? tdecode(char[] code, char padding = DEFAULT_PAD, Base32Alphabet* alphabet = &STANDARD) @inline
```

Calculate the length in bytes of the decoded data.
```c3
<*
 @param n : "Length in bytes of input."
 @param padding : "The padding character or 0 if none"
 @require padding < 0xFF : "Invalid padding character"
 @return "Length in bytes of the decoded data."
*>
```
```c3
fn usz decode_len(usz n, char padding)
```

Calculate the length in bytes of the encoded data.
```c3
<*
 @param n : "Length in bytes on input."
 @param padding : "The padding character or 0 if none"
 @require padding < 0xFF : "Invalid padding character"
 @return "Length in bytes of the encoded data."
*>
```
```c3
fn usz encode_len(usz n, char padding)
```

Decode the content of src into dst, which must be properly sized.
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
```
```c3
fn char[]? decode_buffer(char[] src, char[] dst, char padding = DEFAULT_PAD, Base32Alphabet* alphabet = &STANDARD)
```

Encode the content of src into dst, which must be properly sized.
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
```
```c3
fn String encode_buffer(char[] src, char[] dst, char padding = DEFAULT_PAD, Base32Alphabet* alphabet = &STANDARD)
```
```c3
const int STD_PADDING
```
```c3
const int NO_PADDING
```
```c3
typedef Alphabet = char[32]
```
```c3
const Alphabet STD_ALPHABET
```
```c3
const Alphabet HEX_ALPHABET
```
```c3
const Base32Alphabet STANDARD
```
```c3
const Base32Alphabet HEX
```
### `std::encoding::base64`
```c3
const char NO_PAD
```
```c3
const char DEFAULT_PAD
```
```c3
struct Base64Alphabet
```
```c3
const Base64Alphabet STANDARD
```
```c3
const Base64Alphabet URL
```
```c3
const STD_ALPHABET
```
```c3
const URL_ALPHABET
```
```c3
fn String encode(Allocator allocator, char[] src, char padding = DEFAULT_PAD, Base64Alphabet* alphabet = &STANDARD)
```
```c3
fn char[]? decode(Allocator allocator, char[] src, char padding = DEFAULT_PAD, Base64Alphabet* alphabet = &STANDARD)
```
```c3
fn String tencode(char[] code, char padding = DEFAULT_PAD, Base64Alphabet* alphabet = &STANDARD) @inline
```
```c3
fn char[]? tdecode(char[] code, char padding = DEFAULT_PAD, Base64Alphabet* alphabet = &STANDARD) @inline
```

Calculate the size of the encoded data.
```c3
<*
 @param n : "Size of the input to be encoded."
 @param padding : "The padding character or 0 if none"
 @require padding < 0xFF : "Invalid padding character"
 @return "The size of the input once encoded."
*>
```
```c3
fn usz encode_len(usz n, char padding)
```

Calculate the size of the decoded data.
```c3
<*
 @param n : "Size of the input to be decoded."
 @param padding : "The padding character or 0 if none"
 @require padding < 0xFF : "Invalid padding character"
 @return "The size of the input once decoded."
 @return? encoding::INVALID_PADDING
*>
```
```c3
fn usz? decode_len(usz n, char padding)
```

Encode the content of src into dst, which must be properly sized.
```c3
<*
 @param src : "The input to be encoded."
 @param dst : "The encoded input."
 @param padding : "The padding character or 0 if none"
 @param alphabet : "The alphabet to use"
 @require padding < 0xFF : "Invalid padding character"
 @return "The encoded size."
*>
```
```c3
fn String encode_buffer(char[] src, char[] dst, char padding = DEFAULT_PAD, Base64Alphabet* alphabet = &STANDARD)
```

Decode the content of src into dst, which must be properly sized.
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
```
```c3
fn char[]? decode_buffer(char[] src, char[] dst, char padding = DEFAULT_PAD, Base64Alphabet* alphabet = &STANDARD)
```
### `std::encoding::csv`
```c3
struct CsvReader
```
```c3
struct CsvRow (Printable)
```
```c3
fn usz? CsvRow.to_format(&self, Formatter* f) @dynamic
```
```c3
fn usz CsvRow.len(&self) @operator(len)
```

```c3
<*
 @require col < self.list.len
*>
```
```c3
fn String CsvRow.get_col(&self, usz col) @operator([])
```
```c3
fn void CsvReader.init(&self, InStream stream, String separator = ",")
```

```c3
<*
 @param [&inout] allocator
*>
```
```c3
fn CsvRow? CsvReader.read_row(self, Allocator allocator)
```
```c3
fn CsvRow? CsvReader.tread_row(self)
```

```c3
<*
 @require self.allocator != null  : `Row already freed`
*>
```
```c3
fn void CsvRow.free(&self)
```
```c3
fn void? CsvReader.skip_row(self) @maydiscard
```
```c3
macro void? @each_row(InStream stream, String separator = ",", int max_rows = int.max; @body(String[] row)) @maydiscard
```
```c3
macro void? CsvReader.@each_row(self, int rows = int.max; @body(String[] row)) @maydiscard
```
### `std::encoding::hex`
```c3
fn String encode_buffer(char[] code, char[] buffer)
```
```c3
fn char[]? decode_buffer(char[] code, char[] buffer)
```
```c3
fn String encode(Allocator allocator, char[] code)
```
```c3
fn char[]? decode(Allocator allocator, char[] code)
```
```c3
fn String tencode(char[] code) @inline
```
```c3
fn char[]? tdecode(char[] code) @inline
```

Calculate the size of the encoded data.
```c3
<*
 @param n : "Size of the input to be encoded."
 @return "The size of the input once encoded."
*>
```
```c3
fn usz encode_len(usz n)
```

Encode the content of src into dst, which must be properly sized.
```c3
<*
 @param src : "The input to be encoded."
 @param dst : "The encoded input."
 @return "The encoded size."
 @require dst.len >= encode_len(src.len) : "Destination array is not large enough"
*>
```
```c3
fn usz encode_bytes(char[] src, char[] dst)
```

Calculate the size of the decoded data.
```c3
<*
 @param n : "Size of the input to be decoded."
 @return "The size of the input once decoded."
*>
```
```c3
macro usz decode_len(usz n)
```

Decodes src into bytes. Returns the actual number of bytes written to dst.

Expects that src only contains hexadecimal characters and that src has even
length.
```c3
<*
 @param src : "The input to be decoded."
 @param dst : "The decoded input."
 @require src.len % 2 == 0 : "src is not of even length"
 @require dst.len >= decode_len(src.len) : "Destination array is not large enough"
 @return? encoding::INVALID_CHARACTER
*>
```
```c3
fn usz? decode_bytes(char[] src, char[] dst)
```
### `std::encoding::json`
```c3
faultdef UNEXPECTED_CHARACTER, INVALID_ESCAPE_SEQUENCE, INVALID_NUMBER, MAX_DEPTH_REACHED
```
```c3
fn Object*? parse_string(Allocator allocator, String s)
```
```c3
fn Object*? tparse_string(String s)
```
```c3
fn Object*? parse(Allocator allocator, InStream s)
```
```c3
fn Object*? tparse(InStream s)
```
```c3
fn JsonTokenType? lex_string(JsonContext* context)
```
### `std::experimental::scheduler{Event}`
```c3
struct FrameScheduler
```
```c3
fn void FrameScheduler.init(&self)
```
```c3
macro void FrameScheduler.@destroy(&self; @destruct(Event e))
```
```c3
fn void FrameScheduler.queue_delayed_event(&self, Event event, Duration delay)
```
```c3
fn bool FrameScheduler.has_delayed(&self)
```
```c3
fn void FrameScheduler.queue_event(&self, Event event)
```
```c3
fn Event? FrameScheduler.pop_event(&self)
```
### `std::hash::a5hash`
```c3
fn ulong hash(char[] data, ulong seed = 0)
```
### `std::hash::adler32`
```c3
struct Adler32
```
```c3
fn void Adler32.init(&self)
```
```c3
fn void Adler32.updatec(&self, char c)
```
```c3
fn void Adler32.update(&self, char[] data)
```
```c3
fn uint Adler32.final(&self)
```
```c3
fn uint hash(char[] data)
```
### `std::hash::crc32`
```c3
struct Crc32
```
```c3
fn void Crc32.init(&self, uint seed = 0)
```
```c3
fn void Crc32.updatec(&self, char c)
```
```c3
fn void Crc32.update(&self, char[] data)
```
```c3
fn uint Crc32.final(&self)
```
```c3
fn uint hash(char[] data)
```
### `std::hash::crc64`
```c3
struct Crc64
```
```c3
fn void Crc64.init(&self, uint seed = 0)
```
```c3
fn void Crc64.updatec(&self, char c)
```
```c3
fn void Crc64.update(&self, char[] data)
```
```c3
fn ulong Crc64.final(&self)
```
```c3
fn ulong hash(char[] data)
```
### `std::hash::fnv32a`
```c3
typedef Fnv32a = uint
```
```c3
fn void Fnv32a.init(&self)
```
```c3
fn void Fnv32a.update(&self, char[] data)
```
```c3
macro void Fnv32a.update_char(&self, char c)
```
```c3
fn uint hash(char[] data)
```
### `std::hash::fnv64a`
```c3
typedef Fnv64a = ulong
```
```c3
fn void Fnv64a.init(&self)
```
```c3
fn void Fnv64a.update(&self, char[] data)
```
```c3
macro void Fnv64a.update_char(&self, char c)
```
```c3
fn ulong hash(char[] data)
```
### `std::hash::hmac{HashAlg, HASH_BYTES, BLOCK_BYTES}`
```c3
struct Hmac
```
```c3
fn char[HASH_BYTES] hash(char[] key, char[] message)
```

```c3
<*
 @require output.len > 0 : "Output must be greater than zero"
 @require output.len < int.max / HASH_BYTES : "Output is too large"
*>
```
```c3
fn void pbkdf2(char[] pw, char[] salt, uint iterations, char[] output)
```
```c3
fn void Hmac.init(&self, char[] key)
```
```c3
fn void Hmac.update(&self, char[] data)
```
```c3
fn char[HASH_BYTES] Hmac.final(&self)
```
```c3
macro @derive(Hmac *hmac_start, char[] salt, uint iterations, usz index, char[] out)
```
### `std::hash::komi`
```c3
fn ulong hash(char[] data, ulong seed = 0)
```
### `std::hash::md5`
```c3
const BLOCK_BYTES
```
```c3
const HASH_BYTES
```
```c3
struct Md5
```
```c3
alias HmacMd5 = Hmac{Md5, HASH_BYTES, BLOCK_BYTES}
```
```c3
alias hmac = hmac::hash{Md5, HASH_BYTES, BLOCK_BYTES}
```
```c3
alias pbkdf2 = hmac::pbkdf2{Md5, HASH_BYTES, BLOCK_BYTES}
```
```c3
fn char[HASH_BYTES] hash(char[] data)
```
```c3
fn void Md5.init(&self)
```
```c3
fn void Md5.update(&ctx, char[] data)
```
```c3
fn char[HASH_BYTES] Md5.final(&ctx)
```
### `std::hash::metro128`
```c3
struct MetroHash128
```
```c3
fn uint128 hash(char[] data, ulong seed = 0)
```
```c3
fn void MetroHash128.init(&self, ulong seed = 0)
```
```c3
fn void MetroHash128.update(&self, char[] data)
```
```c3
fn uint128 MetroHash128.final(&self)
```
### `std::hash::metro64`
```c3
struct MetroHash64
```
```c3
fn ulong hash(char[] data, ulong seed = 0)
```
```c3
fn void MetroHash64.init(&self, ulong seed = 0)
```
```c3
fn void MetroHash64.update(&self, char[] data)
```
```c3
fn ulong MetroHash64.final(&self)
```
### `std::hash::sha1`
```c3
const BLOCK_BYTES
```
```c3
const HASH_BYTES
```
```c3
struct Sha1
```
```c3
alias HmacSha1 = Hmac{Sha1, HASH_BYTES, BLOCK_BYTES}
```
```c3
alias hmac = hmac::hash{Sha1, HASH_BYTES, BLOCK_BYTES}
```
```c3
alias pbkdf2 = hmac::pbkdf2{Sha1, HASH_BYTES, BLOCK_BYTES}
```
```c3
fn char[HASH_BYTES] hash(char[] data)
```
```c3
fn void Sha1.init(&self)
```

```c3
<*
 @param [in] data
 @require data.len <= uint.max
*>
```
```c3
fn void Sha1.update(&self, char[] data)
```
```c3
fn char[HASH_BYTES] Sha1.final(&self)
```
### `std::hash::sha256`
```c3
const BLOCK_SIZE
```
```c3
const HASH_SIZE
```
```c3
struct Sha256
```
```c3
alias HmacSha256 = Hmac{Sha256, HASH_SIZE, BLOCK_SIZE}
```
```c3
alias hmac = hmac::hash{Sha256, HASH_SIZE, BLOCK_SIZE}
```
```c3
alias pbkdf2 = hmac::pbkdf2{Sha256, HASH_SIZE, BLOCK_SIZE}
```
```c3
fn char[HASH_SIZE] hash(char[] data)
```
```c3
fn void Sha256.init(&self)
```

```c3
<*
 @param [in] data
 @require data.len <= uint.max
*>
```
```c3
fn void Sha256.update(&self, char[] data)
```
```c3
fn char[HASH_SIZE] Sha256.final(&self)
```
### `std::hash::sha512`
```c3
const BLOCK_SIZE
```
```c3
const HASH_SIZE
```
```c3
struct Sha512
```
```c3
alias HmacSha512    = Hmac{Sha512, HASH_SIZE, BLOCK_SIZE}
```
```c3
alias hmac          = hmac::hash{Sha512, HASH_SIZE, BLOCK_SIZE}
```
```c3
alias pbkdf2        = hmac::pbkdf2{Sha512, HASH_SIZE, BLOCK_SIZE}
```
```c3
enum HashTruncationType : uint (uint truncation_width, ulong[8] initial_state)
```

```c3
<*
 @param [in] data
*>
```
```c3
fn char[HASH_SIZE] hash(char[] data)
```
```c3
fn void Sha512.init(&self)
```

```c3
<*
 @param [in] data
 @require data.len <= ulong.max
*>
```
```c3
fn void Sha512.update(&self, char[] data)
```
```c3
fn char[HASH_SIZE] Sha512.final(&self)
```
### `std::hash::siphash { OutType, BLOCK_ROUNDS, FINALIZE_ROUNDS }`
```c3
struct SipHash
```
```c3
fn OutType hash(char[] data, uint128 key)
```
```c3
fn void SipHash.init(&self, uint128 key)
```

```c3
<*
 @param [in] data : "Bytes to hash"
*>
```
```c3
fn void SipHash.update(&self, char[] data)
```
```c3
fn OutType SipHash.final(&self)
```
### `std::hash::siphash24`
```c3
alias SipHash24 = SipHash { ulong, 2, 4 }
```
```c3
alias hash = siphash::hash { ulong, 2, 4 }
```
### `std::hash::siphash24_128`
```c3
alias SipHash24_128 = SipHash { uint128, 2, 4 }
```
```c3
alias hash = siphash::hash { uint128, 2, 4 }
```
### `std::hash::siphash48`
```c3
alias SipHash48 = SipHash { ulong, 4, 8 }
```
```c3
alias hash = siphash::hash { ulong, 4, 8 }
```
### `std::hash::siphash48_128`
```c3
alias SipHash48_128 = SipHash { uint128, 4, 8 }
```
```c3
alias hash = siphash::hash { uint128, 4, 8 }
```
### `std::hash::whirlpool`
```c3
const BLOCK_SIZE
```
```c3
const HASH_SIZE
```
```c3
const BLOCK_128
```
```c3
struct Whirlpool
```
```c3
alias HmacWhirlpool = Hmac { Whirlpool, HASH_SIZE, BLOCK_SIZE }
```
```c3
alias hmac = hmac::hash { Whirlpool, HASH_SIZE, BLOCK_SIZE }
```
```c3
alias pbkdf2 = hmac::pbkdf2 { Whirlpool, HASH_SIZE, BLOCK_SIZE }
```
```c3
fn char[HASH_SIZE] hash(char[] data)
```
```c3
macro void Whirlpool.init(&self)
```

```c3
<*
 @require data.len <= isz.max : "Update with smaller slices"
*>
```
```c3
fn void Whirlpool.update(&self, char[] data)
```
```c3
fn char[HASH_SIZE] Whirlpool.final(&self)
```
```c3
const ROUNDS
```
### `std::hash::wyhash2`
```c3
fn ulong wyr3(char* in, usz len) @inline
```

```c3
<*
 @require input.len <= 16 : `wyhash2 is not useable for inputs over 16 bytes in length.`
*>
```
```c3
fn ulong hash(char[] input, ulong seed = 0)
```
### `std::io`
```c3
struct BitReader
```
```c3
fn void BitReader.init(&self, InStream byte_reader)
```
```c3
fn void BitReader.clear(&self) @inline
```

```c3
<*
 @require nbits <= 8
 @require self.len + nbits <= uint.sizeof * 8
*>
```
```c3
fn char? BitReader.read_bits(&self, uint nbits)
```
```c3
struct BitWriter
```
```c3
const int WRITER_BITS
```
```c3
fn void BitWriter.init(&self, OutStream byte_writer)
```
```c3
fn void? BitWriter.flush(&self)
```

```c3
<*
 @require nbits <= 32
*>
```
```c3
fn void? BitWriter.write_bits(&self, uint bits, uint nbits)
```
```c3
struct File (InStream, OutStream)
```
```c3
const int PRINTF_NTOA_BUFFER_SIZE
```
```c3
faultdef BUFFER_EXCEEDED, INTERNAL_BUFFER_EXCEEDED, INVALID_FORMAT,
         NOT_ENOUGH_ARGUMENTS, INVALID_ARGUMENT
```
```c3
alias OutputFn = fn void?(void* buffer, char c)
```
```c3
alias FloatType = double
```
```c3
macro bool is_struct_with_default_print($Type)
```

Introspect a struct and print it to a formatter
```c3
<*
 @require @typekind(value) == STRUCT || @typekind(value) == BITSTRUCT : `This macro is only valid on macros`
*>
```
```c3
macro usz? struct_to_format(value, Formatter* f, bool $force_dump)
```
```c3
fn usz? ReflectedParam.to_format(&self, Formatter* f) @dynamic
```
```c3
fn usz? Formatter.printf(&self, String format, args...)
```
```c3
struct Formatter
```
```c3
bitstruct PrintFlags : uint
```
```c3
fn void Formatter.init(&self, OutputFn out_fn, void* data = null)
```
```c3
fn usz? Formatter.print_with_function(&self, Printable arg)
```
```c3
macro usz? @report_fault(Formatter* f, $fault)
```
```c3
macro usz? @wrap_bad(Formatter* f, #action)
```
```c3
fn usz? Formatter.vprintf(&self, String format, any[] anys)
```
```c3
fn usz? Formatter.print(&self, String str)
```
```c3
const char[16] XDIGITS_H
```
```c3
const char[16] XDIGITS_L
```
```c3
faultdef BAD_FORMAT
```
```c3
fn usz? print_hex_chars(Formatter* f, char[] out, bool uppercase) @inline
```
```c3
macro Formatter.first_err(&self, fault f)
```
```c3
fn usz? Formatter.pad(&self, char c, isz width, isz len) @inline
```
```c3
fn char* fmt_u(uint128 x, char* s)
```
```c3
fn usz? Formatter.out_chars(&self, char[] s)
```
```c3
enum FloatFormatting
```
```c3
fn usz? Formatter.etoa(&self, double y)
```
```c3
fn usz? Formatter.ftoa(&self, double y)
```
```c3
fn usz? Formatter.gtoa(&self, double y)
```
```c3
fn usz? Formatter.atoa(&self, double y)
```
```c3
enum Seek
```
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

Read from a stream (default is stdin) to the next "\n"
or to the end of the stream, whatever comes first.
"\r" will be filtered from the String.
```c3
<*
 @param stream : `The stream to read from.`
 @require !($defined(&stream) &&& @is_instream(&stream)) : "The value for 'stream' should have been passed as a pointer and not as a value, please add '&'."
 @require @is_instream(stream) : `Make sure that the stream is actually an InStream.`
 @param [inout] allocator : `the allocator to use.`
 @return `The string containing the data read.`
*>
```
```c3
macro String? readline(Allocator allocator, stream = io::stdin())
```

Reads a string, see `readline`, except the it is allocated
on the temporary allocator and does not need to be freed.
```c3
<*
 @param stream : `The stream to read from.`
 @require !($defined(&stream) &&& @is_instream(&stream)) : "The value for 'stream' should have been passed as a pointer and not as a value, please add '&'."
 @require @is_instream(stream) : `The stream must implement InStream.`
 @return `The temporary string containing the data read.`
*>
```
```c3
macro String? treadline(stream = io::stdin())
```

Reads a string, see `readline`, the data is passed to an outstream
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
```
```c3
macro usz? readline_to_stream(out_stream, in_stream = io::stdin())
```

Print a value to a stream.
```c3
<*
 @param out : `the stream to print to`
 @param x : `the value to print`
 @require @is_outstream(out) : `The output must implement OutStream.`
 @return `the number of bytes printed.`
*>
```
```c3
macro usz? fprint(out, x)
```

Prints using a 'printf'-style formatting string.
See `printf` for details on formatting.
```c3
<*
 @param [inout] out : `The OutStream to print to`
 @param [in] format : `The printf-style format string`
 @return `the number of characters printed`
*>
```
```c3
fn usz? fprintf(OutStream out, String format, args...) @format(1)
```

Prints using a 'printf'-style formatting string,
appending '\n' at the end. See `printf`.
```c3
<*
 @param [inout] out : `The OutStream to print to`
 @param [in] format : `The printf-style format string`
 @return `the number of characters printed`
*>
```
```c3
fn usz? fprintfn(OutStream out, String format, args...) @format(1) @maydiscard
```

```c3
<*
 @require @is_outstream(out) : "The output must implement OutStream"
*>
```
```c3
macro usz? fprintn(out, x = "")
```

Print any value to stdout.
```c3
macro void print(x)
```

Print any value to stdout, appending an '\n’ after.
```c3
<*
 @param x : "The value to print"
*>
```
```c3
macro void printn(x = "")
```

Print any value to stderr.
```c3
macro void eprint(x)
```

Print any value to stderr, appending an '\n’ after.
```c3
<*
 @param x : "The value to print"
*>
```
```c3
macro void eprintn(x = "")
```

Prints using a 'printf'-style formatting string.
To print integer numbers, use "%d" or "%x"/"%X,
the latter gives the hexadecimal representation.

All types can be printed using "%s" which gives
the default representation of the value.

To create a custom output for a type, implement
the Printable interface.
```c3
<*
 @param [in] format : `The printf-style format string`
 @return `the number of characters printed`
*>
```
```c3
fn usz? printf(String format, args...) @format(0) @maydiscard
```

Prints using a 'printf'-style formatting string,
appending '\n' at the end. See `printf`.
```c3
<*
 @param [in] format : `The printf-style format string`
 @return `the number of characters printed`
*>
```
```c3
fn usz? printfn(String format, args...) @format(0) @maydiscard
```

Prints using a 'printf'-style formatting string
to stderr.
```c3
<*
 @param [in] format : `The printf-style format string`
 @return `the number of characters printed`
*>
```
```c3
fn usz? eprintf(String format, args...) @maydiscard
```

Prints using a 'printf'-style formatting string,
to stderr appending '\n' at the end. See `printf`.
```c3
<*
 @param [in] format : `The printf-style format string`
 @return `the number of characters printed`
*>
```
```c3
fn usz? eprintfn(String format, args...) @maydiscard
```

Prints using a 'printf'-style formatting string,
to a string buffer. See `printf`.
```c3
<*
 @param [inout] buffer : `The buffer to print to`
 @param [in] format : `The printf-style format string`
 @return `a slice formed from the "buffer" with the resulting length.`
*>
```
```c3
fn char[]? bprintf(char[] buffer, String format, args...) @maydiscard
```
```c3
fn usz? available(InStream s)
```
```c3
macro bool @is_instream(#expr)
```
```c3
macro bool @is_outstream(#expr)
```

```c3
<*
 @param [&out] ref
 @require @is_instream(stream) : "Expected a stream"
*>
```
```c3
macro usz? read_any(stream, any ref)
```

```c3
<*
 @param [&in] ref : "the object to write."
 @require @is_outstream(stream)
 @ensure return == ref.type.sizeof
*>
```
```c3
macro usz? write_any(stream, any ref)
```

```c3
<*
 @require @is_instream(stream)
*>
```
```c3
macro usz? read_all(stream, char[] buffer)
```

```c3
<*
 @require @is_instream(stream)
*>
```
```c3
macro char[]? read_fully(Allocator allocator, stream)
```

```c3
<*
 @require @is_outstream(stream)
*>
```
```c3
macro usz? write_all(stream, char[] buffer)
```
```c3
macro usz? read_using_read_byte(s, char[] buffer)
```
```c3
macro void? write_byte_using_write(s, char c)
```
```c3
macro char? read_byte_using_read(s)
```
```c3
alias ReadByteFn = fn char?()
```
```c3
macro usz? write_using_write_byte(s, char[] bytes)
```
```c3
macro void? pushback_using_seek(s)
```
```c3
fn usz? copy_to(InStream in, OutStream dst, char[] buffer = {})
```

```c3
<*
 @require @is_instream(stream)
 @require @typekind(x_ptr) == POINTER && $typeof(x_ptr).inner.kindof.is_int()
*>
```
```c3
macro usz? read_varint(stream, x_ptr)
```

```c3
<*
 @require @is_outstream(stream)
 @require @typekind(x).is_int()
*>
```
```c3
macro usz? write_varint(stream, x)
```

```c3
<*
 @require @is_instream(stream)
*>
```
```c3
macro ushort? read_be_ushort(stream)
```

```c3
<*
 @require @is_instream(stream)
*>
```
```c3
macro short? read_be_short(stream)
```

```c3
<*
 @require @is_outstream(stream)
*>
```
```c3
macro void? write_be_short(stream, ushort s)
```

```c3
<*
 @require @is_instream(stream)
*>
```
```c3
macro uint? read_be_uint(stream)
```

```c3
<*
 @require @is_instream(stream)
*>
```
```c3
macro int? read_be_int(stream)
```

```c3
<*
 @require @is_outstream(stream)
*>
```
```c3
macro void? write_be_int(stream, uint s)
```

```c3
<*
 @require @is_instream(stream)
*>
```
```c3
macro ulong? read_be_ulong(stream)
```

```c3
<*
 @require @is_instream(stream)
*>
```
```c3
macro long? read_be_long(stream)
```

```c3
<*
 @require @is_outstream(stream)
*>
```
```c3
macro void? write_be_long(stream, ulong s)
```

```c3
<*
 @require @is_instream(stream)
*>
```
```c3
macro uint128? read_be_uint128(stream)
```

```c3
<*
 @require @is_instream(stream)
*>
```
```c3
macro int128? read_be_int128(stream)
```

```c3
<*
 @require @is_outstream(stream)
*>
```
```c3
macro void? write_be_int128(stream, uint128 s)
```

```c3
<*
 @require @is_outstream(stream)
 @require data.len < 256 : "Data exceeded 255"
*>
```
```c3
macro usz? write_tiny_bytearray(stream, char[] data)
```

```c3
<*
 @require @is_instream(stream)
*>
```
```c3
macro char[]? read_tiny_bytearray(stream, Allocator allocator)
```

```c3
<*
 @require @is_outstream(stream)
 @require data.len < 0x1000 : "Data exceeded 65535"
*>
```
```c3
macro usz? write_short_bytearray(stream, char[] data)
```

```c3
<*
 @require @is_instream(stream)
*>
```
```c3
macro char[]? read_short_bytearray(stream, Allocator allocator)
```

Wrap bytes for reading using io functions.
```c3
fn ByteReader wrap_bytes(char[] bytes)
```
```c3
struct ReadBuffer (InStream)
```

Buffer reads from a stream.
```c3
<*
 @param [inout] self
 @require bytes.len > 0
 @require self.bytes.len == 0 : "Init may not run on already initialized data"
*>
```
```c3
fn ReadBuffer* ReadBuffer.init(&self, InStream wrapped_stream, char[] bytes)
```
```c3
fn String ReadBuffer.str_view(&self) @inline
```
```c3
fn void? ReadBuffer.close(&self) @dynamic
```
```c3
fn usz? ReadBuffer.read(&self, char[] bytes) @dynamic
```
```c3
fn char? ReadBuffer.read_byte(&self) @dynamic
```
```c3
struct WriteBuffer (OutStream)
```

Buffer writes to a stream. Call `flush` when done writing to the buffer.
```c3
<*
 @param [inout] self
 @require bytes.len > 0 : "Non-empty buffer required"
 @require self.bytes.len == 0 : "Init may not run on already initialized data"
*>
```
```c3
fn WriteBuffer* WriteBuffer.init(&self, OutStream wrapped_stream, char[] bytes)
```
```c3
fn String WriteBuffer.str_view(&self) @inline
```
```c3
fn void? WriteBuffer.close(&self) @dynamic
```
```c3
fn void? WriteBuffer.flush(&self) @dynamic
```
```c3
fn usz? WriteBuffer.write(&self, char[] bytes) @dynamic
```
```c3
fn void? WriteBuffer.write_byte(&self, char c) @dynamic
```
```c3
struct ByteBuffer (InStream, OutStream)
```

ByteBuffer provides a streamable read/write buffer.
max_read defines how many bytes might be kept before its internal buffer is shrinked.
```c3
<*
 @require self.bytes.len == 0 : "Buffer already initialized."
*>
```
```c3
fn ByteBuffer* ByteBuffer.init(&self, Allocator allocator, usz max_read, usz initial_capacity = 16)
```
```c3
fn ByteBuffer* ByteBuffer.tinit(&self, usz max_read, usz initial_capacity = 16)
```

```c3
<*
 @require buf.len > 0
 @require self.bytes.len == 0 : "Buffer already initialized."
*>
```
```c3
fn ByteBuffer* ByteBuffer.init_with_buffer(&self, char[] buf)
```
```c3
fn void ByteBuffer.free(&self)
```
```c3
fn usz? ByteBuffer.write(&self, char[] bytes) @dynamic
```
```c3
fn void? ByteBuffer.write_byte(&self, char c) @dynamic
```
```c3
fn usz? ByteBuffer.read(&self, char[] bytes) @dynamic
```
```c3
fn char? ByteBuffer.read_byte(&self) @dynamic
```

Only the last byte of a successful read can be pushed back.
```c3
fn void? ByteBuffer.pushback_byte(&self) @dynamic
```
```c3
fn usz? ByteBuffer.seek(&self, isz offset, Seek seek) @dynamic
```
```c3
fn usz? ByteBuffer.available(&self) @inline @dynamic
```
```c3
fn void ByteBuffer.grow(&self, usz n)
```
```c3
macro ByteBuffer.shrink(&self)
```
```c3
struct ByteReader (InStream)
```
```c3
fn usz ByteReader.len(&self) @dynamic
```
```c3
fn ByteReader* ByteReader.init(&self, char[] bytes)
```
```c3
fn usz? ByteReader.read(&self, char[] bytes) @dynamic
```
```c3
fn char? ByteReader.read_byte(&self) @dynamic
```
```c3
fn void? ByteReader.pushback_byte(&self) @dynamic
```
```c3
fn usz? ByteReader.seek(&self, isz offset, Seek seek) @dynamic
```
```c3
fn usz? ByteReader.write_to(&self, OutStream writer) @dynamic
```
```c3
fn usz? ByteReader.available(&self) @inline @dynamic
```
```c3
struct ByteWriter (OutStream)
```

```c3
<*
 @param [&inout] self
 @param [&inout] allocator
 @require self.bytes.len == 0 : "Init may not run on already initialized data"
 @ensure (bool)allocator, self.index == 0
*>
```
```c3
fn ByteWriter* ByteWriter.init(&self, Allocator allocator)
```

```c3
<*
 @param [&inout] self
 @require self.bytes.len == 0 : "Init may not run on already initialized data"
 @ensure self.index == 0
*>
```
```c3
fn ByteWriter* ByteWriter.tinit(&self)
```
```c3
fn ByteWriter* ByteWriter.init_with_buffer(&self, char[] data)
```
```c3
fn void? ByteWriter.destroy(&self) @dynamic
```
```c3
fn String ByteWriter.str_view(&self) @inline
```
```c3
fn void? ByteWriter.ensure_capacity(&self, usz len) @inline
```
```c3
fn usz? ByteWriter.write(&self, char[] bytes) @dynamic
```
```c3
fn void? ByteWriter.write_byte(&self, char c) @dynamic
```

```c3
<*
 @param [&inout] self
 @param reader
*>
```
```c3
fn usz? ByteWriter.read_from(&self, InStream reader) @dynamic
```
```c3
struct LimitReader (InStream)
```

```c3
<*
 @param [&inout] wrapped_stream : "The stream to read from"
 @param limit : "The max limit to read"
*>
```
```c3
fn LimitReader* LimitReader.init(&self, InStream wrapped_stream, usz limit)
```
```c3
fn void? LimitReader.close(&self) @dynamic
```
```c3
fn usz? LimitReader.read(&self, char[] bytes) @dynamic
```
```c3
fn char? LimitReader.read_byte(&self) @dynamic
```
```c3
fn usz? LimitReader.available(&self) @inline @dynamic
```
```c3
struct MultiReader (InStream)
```

```c3
<*
 @param [&inout] self
 @param [&inout] allocator
 @require self.readers.len == 0 : "Init may not run on already initialized data"
 @ensure self.index == 0
*>
```
```c3
fn MultiReader* MultiReader.init(&self, Allocator allocator, InStream... readers)
```

```c3
<*
 @param [&inout] self
 @require self.readers.len == 0 : "Init may not run on already initialized data"
 @ensure self.index == 0
*>
```
```c3
fn MultiReader* MultiReader.tinit(&self, InStream... readers)
```
```c3
fn void MultiReader.free(&self)
```
```c3
fn usz? MultiReader.read(&self, char[] bytes) @dynamic
```
```c3
fn char? MultiReader.read_byte(&self) @dynamic
```
```c3
struct MultiWriter (OutStream)
```

```c3
<*
 @param [&inout] self
 @param [&inout] allocator
 @require writers.len > 0
 @require self.writers.len == 0 : "Init may not run on already initialized data"
*>
```
```c3
fn MultiWriter* MultiWriter.init(&self, Allocator allocator, OutStream... writers)
```

```c3
<*
 @param [&inout] self
 @require writers.len > 0
 @require self.writers.len == 0 : "Init may not run on already initialized data"
*>
```
```c3
fn MultiWriter* MultiWriter.tinit(&self, OutStream... writers)
```
```c3
fn void MultiWriter.free(&self)
```
```c3
fn usz? MultiWriter.write(&self, char[] bytes) @dynamic
```
```c3
fn void? MultiWriter.write_byte(&self, char c) @dynamic
```
```c3
struct Scanner (InStream)
```

Scanner provides a way to read delimited data (with newlines as the default).
The supplied buffer must be at least as large as the expected data length
including its pattern.
```c3
<*
 @param [&in] stream : "The stream to read data from."
 @require buffer.len > 0 : "Non-empty buffer required."
*>
```
```c3
fn void Scanner.init(&self, InStream stream, char[] buffer)
```

Return and clear any remaining unscanned data.
```c3
fn char[] Scanner.flush(&self) @dynamic
```
```c3
fn void? Scanner.close(&self) @dynamic
```

Scan the stream for the next split character and return data up to the match.
```c3
<*
 @require pattern.len > 0 : "Non-empty pattern required."
 @require self.buf.len > pattern.len : "Pattern too large."
*>
```
```c3
fn char[]? Scanner.scan(&self, String pattern = "\n")
```
```c3
fn usz? Scanner.read(&self, char[] bytes) @dynamic
```
```c3
fn char? Scanner.read_byte(&self) @dynamic
```
```c3
struct TeeReader (InStream)
```

Returns a reader that implements InStream and that will write any data read
from the wrapped reader r to the writer w. There is no internal buffering.
```c3
<*
 @param [&inout] r : "Stream r to read from."
 @param [&inout] w : "Stream w to write to what it reads from r."
*>
```
```c3
macro TeeReader tee_reader(InStream r, OutStream w)
```

```c3
<*
 @param [&inout] self
 @param [&inout] r : "Stream r to read from."
 @param [&inout] w : "Stream w to write to what it reads from r."
*>
```
```c3
fn TeeReader* TeeReader.init(&self, InStream r, OutStream w)
```
```c3
fn usz? TeeReader.read(&self, char[] bytes) @dynamic
```
```c3
fn char? TeeReader.read_byte(&self) @dynamic
```
### `std::io @if (env::LIBC)`

Libc `putchar`, prints a single character to stdout.
```c3
fn void putchar(char c) @inline
```

Get standard out.
```c3
<*
 @return `stdout as a File`
*>
```
```c3
fn File* stdout()
```

Get standard err.
```c3
<*
 @return `stderr as a File`
*>
```
```c3
fn File* stderr()
```

Get standard in.
```c3
<*
 @return `stdin as a File`
*>
```
```c3
fn File* stdin()
```
### `std::io @if(!env::LIBC)`
```c3
fn void putchar(char c) @inline
```
```c3
fn File* stdout()
```
```c3
fn File* stderr()
```
```c3
fn File* stdin()
```
### `std::io::file`
```c3
fn File? open(String filename, String mode)
```
```c3
fn File? open_path(Path path, String mode)
```
```c3
fn bool exists(String file)
```
```c3
fn File from_handle(CFile file)
```
```c3
fn bool is_file(String path)
```
```c3
fn bool is_dir(String path)
```
```c3
fn usz? get_size(String path)
```
```c3
fn void? delete(String filename)
```

```c3
<*
 @require self.file != null
*>
```
```c3
fn void? File.reopen(&self, String filename, String mode)
```

```c3
<*
 @require self.file != null
*>
```
```c3
fn usz? File.seek(&self, isz offset, Seek seek_mode = Seek.SET) @dynamic
```

```c3
<*
 @require self.file != null
*>
```
```c3
fn void? File.write_byte(&self, char c) @dynamic
```

```c3
<*
 @param [&inout] self
*>
```
```c3
fn void? File.close(&self) @inline @dynamic
```

```c3
<*
 @require self.file != null
*>
```
```c3
fn bool File.eof(&self) @inline
```

```c3
<*
 @param [in] buffer
*>
```
```c3
fn usz? File.read(&self, char[] buffer) @dynamic
```

```c3
<*
 @param [out] buffer
 @require self.file != null : `File must be initialized`
*>
```
```c3
fn usz? File.write(&self, char[] buffer) @dynamic
```
```c3
fn Fd File.fd(self) @if(env::LIBC)
```
```c3
fn bool File.isatty(self) @if(env::LIBC)
```
```c3
fn char? File.read_byte(&self) @dynamic
```

Load up to buffer.len characters. Returns io::OVERFLOW if the file is longer
than the buffer.
```c3
<*
 @param filename : "The path to the file to read"
 @param [in] buffer : "The buffer to read to"
*>
```
```c3
fn char[]? load_buffer(String filename, char[] buffer)
```
```c3
fn char[]? load(Allocator allocator, String filename)
```
```c3
fn char[]? load_path(Allocator allocator, Path path)
```
```c3
fn char[]? load_temp(String filename)
```
```c3
fn char[]? load_path_temp(Path path)
```
```c3
fn void? save(String filename, char[] data)
```

```c3
<*
 @require self.file != null : `File must be initialized`
*>
```
```c3
fn void? File.flush(&self) @dynamic
```
### `std::io::file @if(env::LIBC &&& env::POSIX)`

Maps a region of an already-opened file into memory
```c3
<*
 @param file : "Already opened file created on the caller scope"
 @param offset : "Byte offset in file, will be rounded down to page size"
 @param len : "Size in bytes to map starting from offset, will be rounded up to page size"
 @return? mem::OUT_OF_MEMORY, vm::ACCESS_DENIED, vm::RANGE_OVERFLOW, vm::INVALID_ARGS, vm::UNKNOWN_ERROR, io::NO_PERMISSION, io::FILE_NOT_VALID, io::WOULD_BLOCK, io::FILE_NOT_FOUND
 @return "Memory mapped region. Must be released with FileMmap.destroy(). Provided File will not be closed"
*>
```
```c3
fn mmap::FileMmap? mmap_file(File file, usz offset = 0, usz len = 0, vm::VirtualMemoryAccess access = READ, bool shared = false)
```

Maps a region of the given file into memory
```c3
<*
 @param filename : "File path"
 @param mode : "File opening mode"
 @param offset : "Byte offset in file, will be rounded down to page size"
 @param len : "Size in bytes to map starting from offset, will be rounded up to page size"
 @return? mem::OUT_OF_MEMORY, vm::ACCESS_DENIED, vm::RANGE_OVERFLOW, vm::INVALID_ARGS, vm::UNKNOWN_ERROR, io::NO_PERMISSION, io::FILE_NOT_VALID, io::WOULD_BLOCK, io::FILE_NOT_FOUND
 @return "Memory mapped region. Must be released with FileMmap.destroy()"
*>
```
```c3
fn mmap::FileMmap? mmap_open(String filename, String mode, usz offset = 0, usz len = 0, vm::VirtualMemoryAccess access = READ, bool shared = false)
```
### `std::io::file::mmap @if(env::LIBC &&& env::POSIX)`
```c3
struct FileMmap
```

Provides a slice of bytes to the expected mapped range discarding the extra bytes due to misaligment of offset and/or size.
```c3
<*
 @return "Slice of the mapped range where the first byte matches the file's byte at the offset specified to File::file_mmap()"
*>
```
```c3
fn char[] FileMmap.bytes(&self)
```

Destroys the underlyng VirtualMemory object ie. calls munmap()"
```c3
fn void? FileMmap.destroy(&self) @maydiscard
```
### `std::io::os`
```c3
macro void? native_chdir(Path path)
```
```c3
fn void? native_stat(Stat* stat, String path) @if(env::DARWIN || env::LINUX || env::ANDROID || env::BSD_FAMILY)
```
```c3
fn usz? native_file_size(String path) @if(env::WIN32)
```
```c3
fn usz? native_file_size(String path) @if(!env::WIN32 && !env::DARWIN)
```
```c3
fn usz? native_file_size(String path) @if(env::DARWIN)
```
```c3
fn bool native_file_or_dir_exists(String path)
```
```c3
fn bool native_is_file(String path)
```
```c3
fn bool native_is_dir(String path)
```
```c3
macro String? getcwd(Allocator allocator)
```
```c3
macro bool? native_mkdir(Path path, MkdirPermissions permissions)
```
```c3
macro bool? native_rmdir(Path path)
```
### `std::io::os @if(env::LIBC)`

```c3
<*
 @require mode.len > 0
 @require filename.len > 0
*>
```
```c3
fn void*? native_fopen(String filename, String mode) @inline
```
```c3
fn void? native_remove(String filename)
```

```c3
<*
 @require mode.len > 0
 @require filename.len > 0
*>
```
```c3
fn void*? native_freopen(void* file, String filename, String mode) @inline
```
```c3
fn void? native_fseek(void* file, isz offset, Seek seek_mode) @inline
```
```c3
fn usz? native_ftell(CFile file) @inline
```
```c3
fn usz? native_fwrite(CFile file, char[] buffer) @inline
```
```c3
fn void? native_fputc(CInt c, CFile stream) @inline
```
```c3
fn usz? native_fread(CFile file, char[] buffer) @inline
```
```c3
fn Path? native_temp_directory(Allocator allocator) @if(!env::WIN32)
```
```c3
fn Path? native_temp_directory(Allocator allocator) @if(env::WIN32)
```
### `std::io::os @if(env::NO_LIBC)`
```c3
alias FopenFn = fn void*?(String, String)
```
```c3
alias FreopenFn = fn void*?(void*, String, String)
```
```c3
alias FcloseFn = fn void?(void*)
```
```c3
alias FseekFn = fn void?(void*, isz, Seek)
```
```c3
alias FtellFn = fn usz?(void*)
```
```c3
alias FwriteFn = fn usz?(void*, char[] buffer)
```
```c3
alias FreadFn = fn usz?(void*, char[] buffer)
```
```c3
alias RemoveFn = fn void?(String)
```
```c3
alias FputcFn = fn void?(int, void*)
```
```c3
fn @weak @if(!$defined(native_fopen_fn))
```

Delete a file.
```c3
<*
 @require filename.len > 0
*>
```
```c3
fn void? native_remove(String filename) @inline
```

```c3
<*
 @require mode.len > 0
 @require filename.len > 0
*>
```
```c3
fn void*? native_freopen(void* file, String filename, String mode) @inline
```
```c3
fn void? native_fseek(void* file, isz offset, Seek seek_mode) @inline
```
```c3
fn usz? native_ftell(CFile file) @inline
```
```c3
fn usz? native_fwrite(CFile file, char[] buffer) @inline
```
```c3
fn usz? native_fread(CFile file, char[] buffer) @inline
```
```c3
fn void? native_fputc(CInt c, CFile stream) @inline
```
```c3
macro Path? native_temp_directory(Allocator allocator)
```
### `std::io::os @if(env::POSIX)`
```c3
fn PathList? native_ls(Path dir, bool no_dirs, bool no_symlinks, String mask, Allocator allocator)
```

```c3
<*
 @require dir.str_view().len > 0
*>
```
```c3
fn void? native_rmtree(Path dir)
```
### `std::io::os @if(env::WIN32)`
```c3
fn PathList? native_ls(Path dir, bool no_dirs, bool no_symlinks, String mask, Allocator allocator)
```
```c3
fn void? native_rmtree(Path path)
```
### `std::io::path`
```c3
const PathEnv DEFAULT_ENV
```
```c3
const char PREFERRED_SEPARATOR_WIN32
```
```c3
const char PREFERRED_SEPARATOR_POSIX
```
```c3
const char PREFERRED_SEPARATOR
```
```c3
alias PathList = List { Path }
```
```c3
faultdef INVALID_PATH, NO_PARENT
```
```c3
alias Path = PathImp
```
```c3
struct PathImp (Printable)
```
```c3
enum PathEnv
```
```c3
fn Path? cwd(Allocator allocator)
```
```c3
fn bool is_dir(Path path)
```
```c3
fn bool is_file(Path path)
```
```c3
fn usz? file_size(Path path)
```
```c3
fn bool exists(Path path)
```
```c3
fn Path? tcwd()
```

```c3
<*
 @require @is_pathlike(path) : "Expected a Path or String to chdir"
*>
```
```c3
macro void? chdir(path)
```
```c3
fn Path? temp_directory(Allocator allocator)
```
```c3
fn void? delete(Path path)
```
```c3
macro bool @is_pathlike(#path)
```
```c3
macro bool is_separator(char c, PathEnv path_env = DEFAULT_ENV)
```
```c3
macro bool is_posix_separator(char c)
```
```c3
macro bool is_win32_separator(char c)
```
```c3
fn PathList? ls(Allocator allocator, Path dir, bool no_dirs = false, bool no_symlinks = false, String mask = "")
```
```c3
enum MkdirPermissions
```

Create a directory on a given path, optionally recursive.
```c3
<*
 @param path : `The path to create`
 @require @is_pathlike(path) : "Expected a Path or String to chdir"
 @param recursive : `If directories in between should be created if they're missing, defaults to false`
 @param permissions : `The permissions to set on the directory`
*>
```
```c3
macro bool? mkdir(path, bool recursive = false, MkdirPermissions permissions = NORMAL)
```

Tries to delete directory, which must be empty.
```c3
<*
 @param path : `The path to delete`
 @require @is_pathlike(path) : "Expected a Path or String to chdir"
 @return `true if there was a directory to delete, false otherwise`
 @return? INVALID_PATH : `if the path was invalid`
*>
```
```c3
macro bool? rmdir(path)
```

Like [rmdir] but deletes a directory even if it contains items.
```c3
fn void? rmtree(Path path)
```

Creates a new path.
```c3
<*
 @return? INVALID_PATH : `if the path was invalid`
*>
```
```c3
fn Path? new(Allocator allocator, String path, PathEnv path_env = DEFAULT_ENV)
```

Creates a new path using the temp allocator.
```c3
<*
 @return? INVALID_PATH : `if the path was invalid`
*>
```
```c3
fn Path? temp(String path, PathEnv path_env = DEFAULT_ENV)
```
```c3
fn Path? from_wstring(Allocator allocator, WString path)
```
```c3
fn Path? from_win32_wstring(Allocator allocator, WString path) @deprecated("Use 'from_wstring' instead")
```
```c3
fn Path? for_windows(Allocator allocator, String path)
```
```c3
fn Path? for_posix(Allocator allocator, String path)
```
```c3
fn bool Path.equals(self, Path p2) @operator(==)
```

Append the string to the current path.
```c3
<*
 @param [in] filename
*>
```
```c3
fn Path? Path.append(self, Allocator allocator, String filename)
```
```c3
fn Path? Path.tappend(self, String filename)
```
```c3
fn bool? String.is_absolute_path(self)
```
```c3
fn bool? Path.is_absolute(self)
```
```c3
fn Path? String.to_absolute_path(self, Allocator allocator)
```

```c3
<*
 @require self.env == DEFAULT_ENV : "This method is only available on native paths"
*>
```
```c3
fn Path? Path.absolute(self, Allocator allocator)
```
```c3
fn String? String.file_basename(self, Allocator allocator)
```
```c3
fn String? String.file_tbasename(self)
```
```c3
fn String Path.basename(self)
```
```c3
fn String? String.path_tdirname(self)
```
```c3
fn String? String.path_dirname(self, Allocator allocator)
```
```c3
fn String Path.dirname(self)
```

Test if the path has the given extension, so given the path /foo/bar.c3
this would be true matching the extension "c3"
```c3
<*
 @param [in] extension : `The extension name (not including the leading '.')`
 @require extension.len > 0 : `The extension cannot be empty`
 @return `true if the extension matches`
*>
```
```c3
fn bool Path.has_extension(self, String extension)
```
```c3
fn String? Path.extension(self)
```
```c3
fn String Path.volume_name(self)
```
```c3
fn Path? String.to_path(self, Allocator allocator)
```
```c3
fn Path? String.to_tpath(self)
```

Get the path of the parent. This does not allocate, but returns a slice
of the path itself.
```c3
<*
 @return `The parent of the path as a non-allocated path`
 @return? NO_PARENT : `if this path does not have a parent`
*>
```
```c3
fn Path? Path.parent(self)
```
```c3
fn String? normalize(String path_str, PathEnv path_env = DEFAULT_ENV)
```
```c3
fn ZString Path.as_zstr(self) @deprecated
```
```c3
fn String Path.root_directory(self)
```
```c3
alias PathWalker = fn bool? (Path, bool is_dir, void*)
```

Walk the path recursively. PathWalker is run on every file and
directory found. Return true to abort the walk.
```c3
<*
 @require self.env == DEFAULT_ENV : "This method is only available on native paths"
*>
```
```c3
fn bool? Path.walk(self, PathWalker w, void* data)
```
```c3
alias TraverseCallback = fn bool? (Path, bool is_dir, any data)
```

Walk the path recursively. TraverseCallback is run for every file and
directory found. Return true to abort the walk.
```c3
<*
 @require path.env == DEFAULT_ENV : "This method is only available on native paths"
*>
```
```c3
fn bool? traverse(Path path, TraverseCallback callback, any data)
```
```c3
fn String Path.str_view(self) @inline
```
```c3
fn bool Path.has_suffix(self, String str)
```

```c3
<*
 @require self.allocator != null : "This Path should never be freed"
*>
```
```c3
fn void Path.free(self)
```
```c3
fn usz? Path.to_format(&self, Formatter* formatter) @dynamic
```
```c3
const bool[256] RESERVED_PATH_CHAR_POSIX
```
```c3
const bool[256] RESERVED_PATH_CHAR_WIN32
```
```c3
macro bool is_reserved_win32_path_char(char c)
```
```c3
macro bool is_reserved_path_char(char c, PathEnv path_env = DEFAULT_ENV)
```
### `std::math`
```c3
alias Complexf = Complex {float}
```
```c3
alias Complex = Complex {double}
```
```c3
alias COMPLEX_IDENTITY  @builtin = complex::IDENTITY {double}
```
```c3
alias COMPLEXF_IDENTITY @builtin = complex::IDENTITY {float}
```
```c3
alias IMAGINARY @builtin @deprecated("Use I") = complex::IMAGINARY { double }
```
```c3
alias IMAGINARYF @builtin @deprecated("Use I_F") = complex::IMAGINARY { float }
```
```c3
alias I @builtin = complex::IMAGINARY { double }
```
```c3
alias I_F @builtin = complex::IMAGINARY { float }
```
```c3
const E
```
```c3
const LOG2E
```
```c3
const LOG10E
```
```c3
const LN2
```
```c3
const LN10
```
```c3
const PI
```
```c3
const PI_2
```
```c3
const PI_4
```
```c3
const DIV_PI
```
```c3
const DIV_2_PI
```
```c3
const DIV_2_SQRTPI
```
```c3
const SQRT2
```
```c3
const double DIV_1_SQRT2
```
```c3
const HALF_MAX
```
```c3
const HALF_MIN
```
```c3
const HALF_DENORM_MIN
```
```c3
const HALF_DIG
```
```c3
const HALF_DEC_DIGITS
```
```c3
const HALF_MANT_DIG
```
```c3
const HALF_MAX_10_EXP
```
```c3
const HALF_MIN_10_EXP
```
```c3
const HALF_MAX_EXP
```
```c3
const HALF_MIN_EXP
```
```c3
const HALF_EPSILON
```
```c3
const FLOAT_MAX
```
```c3
const FLOAT_MIN
```
```c3
const FLOAT_DENORM_MIN
```
```c3
const FLOAT_DIG
```
```c3
const FLOAT_DEC_DIGITS
```
```c3
const FLOAT_MANT_DIG
```
```c3
const FLOAT_MAX_10_EXP
```
```c3
const FLOAT_MIN_10_EXP
```
```c3
const FLOAT_MAX_EXP
```
```c3
const FLOAT_MIN_EXP
```
```c3
const FLOAT_EPSILON
```
```c3
const DOUBLE_MAX
```
```c3
const DOUBLE_MIN
```
```c3
const DOUBLE_DENORM_MIN
```
```c3
const DOUBLE_DIG
```
```c3
const DOUBLE_DEC_DIGITS
```
```c3
const DOUBLE_MANT_DIG
```
```c3
const DOUBLE_MAX_10_EXP
```
```c3
const DOUBLE_MIN_10_EXP
```
```c3
const DOUBLE_MAX_EXP
```
```c3
const DOUBLE_MIN_EXP
```
```c3
const DOUBLE_EPSILON
```
```c3
enum RoundingMode : int
```
```c3
faultdef OVERFLOW, MATRIX_INVERSE_DOESNT_EXIST
```

```c3
<*
 @require types::is_numerical($typeof(x)) : `The input must be a numerical value or numerical vector`
*>
```
```c3
macro deg_to_rad(x)
```

```c3
<*
 @require types::is_numerical($typeof(x)) : `The input must be a numerical value or numerical vector`
*>
```
```c3
macro abs(x)
```

```c3
<*
 @require values::@is_int(x) || values::@is_float(x) : "Expected an integer or floating point value"
 @require values::@is_int(y) || values::@is_float(y) : "Expected an integer or floating point value"
*>
```
```c3
macro is_approx(x, y, eps)
```

```c3
<*
 @require values::@is_int(x) || values::@is_float(x) : "Expected an integer or floating point value"
 @require values::@is_int(y) || values::@is_float(y) : "Expected an integer or floating point value"
*>
```
```c3
macro is_approx_rel(x, y, eps)
```

```c3
<*
 @require values::@is_int(x) : `The input must be an integer`
*>
```
```c3
macro sign(x)
```

```c3
<*
 @require values::@is_int(x) || values::@is_float(x) : "Expected an integer or floating point value"
 @require values::@is_int(y) || values::@is_float(y) : "Expected an integer or floating point value"
*>
```
```c3
macro atan2(x, y)
```

```c3
<*
 @require values::@is_int(x) || values::@is_float(x) : "Expected an integer or floating point value"
 @require @typekind(sinp) == POINTER : "Expected sinp to be a pointer"
 @require values::@is_same_type(sinp, cosp) : "Expected sinp and cosp to have the same type"
 @require @assignable_to(x, $typeof(*sinp)) : "Expected x and sinp/cosp to have the same type"
*>
```
```c3
macro sincos_ref(x, sinp, cosp)
```

Return a vector with sin / cos of the given angle.
```c3
<*
 @param x : `the angle in radians`
 @require values::@is_int(x) || values::@is_float(x) : "Expected an integer or floating point value"
*>
```
```c3
macro sincos(x)
```

```c3
<*
 @require values::@is_int(x) || values::@is_float(x) : "Expected an integer or floating point value"
*>
```
```c3
macro atan(x)
```

```c3
<*
 @require values::@is_int(x) || values::@is_float(x) : "Expected an integer or floating point value"
*>
```
```c3
macro atanh(x)
```

```c3
<*
 @require values::@is_int(x) || values::@is_float(x) : "Expected an integer or floating point value"
*>
```
```c3
macro acos(x)
```

```c3
<*
 @require values::@is_int(x) || values::@is_float(x) : "Expected an integer or floating point value"
*>
```
```c3
macro acosh(x)
```

```c3
<*
 @require values::@is_int(x) || values::@is_float(x) : "Expected an integer or floating point value"
*>
```
```c3
macro asin(x)
```

```c3
<*
 @require values::@is_int(x) || values::@is_float(x) : "Expected an integer or floating point value"
*>
```
```c3
macro asinh(x)
```

```c3
<*
 @require values::@is_floatlike(x) : `The input must be a floating point value or float vector`
*>
```
```c3
macro ceil(x)
```

Ceil for compile time evaluation.
```c3
<*
 @require @typeis($input, double) || @typeis($input, float) : "Only float and double may be used"
*>
```
```c3
macro @ceil($input) @const
```

Constrain the value to lie within the given interval.
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
```
```c3
macro clamp(x, lower, upper)
```

```c3
<*
 @require values::@is_promotable_to_floatlike(mag) : `The input must be a number value or float vector`
 @require $defined(($typeof(values::promote_int(mag)))mag) : `It's not possible to cast the sign to the type of the magnitude`
*>
```
```c3
macro copysign(mag, sgn)
```

```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number value or float vector`
*>
```
```c3
macro cos(x)
```

```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number value or float vector`
*>
```
```c3
macro cosec(x)
```

```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number value or float vector`
*>
```
```c3
macro cosech(x)
```

```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number value or float vector`
*>
```
```c3
macro cosh(x)
```

```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number value or float vector`
*>
```
```c3
macro cotan(x)
```

```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number value or float vector`
*>
```
```c3
macro cotanh(x)
```

```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number value or float vector`
*>
```
```c3
macro exp(x)
```

```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number value or float vector`
*>
```
```c3
macro exp2(x)
```

```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number value or float vector`
*>
```
```c3
macro floor(x)
```

```c3
<*
 @require values::@is_promotable_to_floatlike(a) : `The input must be a number or float vector`
 @require values::@is_promotable_to_floatlike(b) : `The input must be a number or float vector`
 @require values::@is_promotable_to_floatlike(c) : `The input must be a number or float vector`
 @require values::@is_same_vector_type(a, b) : `The input types must be equal`
 @require values::@is_same_vector_type(a, c) : `The input types must match`
*>
```
```c3
macro fma(a, b, c)
```

```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number or a float vector`
 @require values::@is_promotable_to_floatlike(y) : `The input must be a number or a float vector`
 @require values::@is_same_vector_type(x, y) : `The input types must match`
*>
```
```c3
macro hypot(x, y)
```

```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number or a float vector`
*>
```
```c3
macro ln(x)
```

```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number or a float vector`
 @require values::@is_promotable_to_floatlike(base) : `The base must be a number or a float vector`
*>
```
```c3
macro log(x, base)
```

```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number or a float vector`
*>
```
```c3
macro log2(x)
```

```c3
<*
 @require values::@is_int($x) : `The input value must be an integer.`
 @require $x >= 0 : `The input value must be a positive integer.`
 @return `A floored base-2 log of an input integer value.`
*>
```
```c3
macro @intlog2($x)
```

```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number or a float vector`
*>
```
```c3
macro log10(x)
```

```c3
<*
 @require types::is_numerical($typeof(x)) : `The input must be a floating point value or float vector`
 @require types::is_same($typeof(x), $typeof(y)) : `The input types must be equal`
*>
```
```c3
macro max(x, y, ...)
```

```c3
<*
 @require types::is_numerical($typeof(x)) : `The input must be a numerical value or numerical vector`
 @require types::is_same($typeof(x), $typeof(y)) : `The input types must be equal`
*>
```
```c3
macro min(x, y, ...)
```

```c3
<*
 @require types::@is_float(a) : `The input must be a floating point value`
 @require types::@has_same(a, b, c) : `The input types must be equal`
*>
```
```c3
macro muladd(a, b, c)
```

```c3
<*
 @require values::@is_floatlike(x) : `The input must be a floating point value or float vector`
*>
```
```c3
macro nearbyint(x)
```

```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number or a float vector`
 @require @assignable_to(exp, $typeof(values::promote_int(x))) || values::@is_int(exp) : `The input must be an integer, castable to the type of x`
*>
```
```c3
macro pow(x, exp)
```

```c3
<*
 @require values::@is_promotable_to_float(x) : `The input must be integer or floating type`
*>
```
```c3
macro frexp(x, int* e)
```

```c3
<*
 @require values::@is_promotable_to_float(x) : `The input must be integer or floating type`
*>
```
```c3
macro int signbit(x)
```

```c3
<*
 @require values::@is_floatlike(x) : `The input must be a number or a float vector`
*>
```
```c3
macro rint(x)
```

```c3
<*
 @require values::@is_floatlike(x) : `The input must be a floating point value or float vector`
*>
```
```c3
macro round(x)
```

```c3
<*
 @require values::@is_floatlike(x) : `The input must be a floating point value or float vector`
*>
```
```c3
macro round_to_decimals(x, int decimal_places)
```

```c3
<*
 @require values::@is_floatlike(x) : `The input must be a floating point value or float vector`
*>
```
```c3
macro roundeven(x)
```

```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number or a float vector`
*>
```
```c3
macro sec(x)
```

```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number or a float vector`
*>
```
```c3
macro sech(x)
```

```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number or a float vector`
*>
```
```c3
macro sin(x)
```

```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number or a float vector`
*>
```
```c3
macro sinh(x)
```

```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number or a float vector`
*>
```
```c3
macro sqr(x)
```

```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number or a float vector`
*>
```
```c3
macro sqrt(x)
```

```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number or a float vector`
*>
```
```c3
macro tan(x)
```

```c3
<*
 @require values::@is_promotable_to_float(x) : `The input must be a float`
*>
```
```c3
macro bool is_finite(x)
```

```c3
<*
 @require values::@is_promotable_to_float(x) : `The input must be a float`
*>
```
```c3
macro is_nan(x)
```

```c3
<*
 @require values::@is_promotable_to_float(x) : `The input must be a float`
*>
```
```c3
macro is_inf(x)
```

```c3
<*
 @require values::@is_promotable_to_floatlike(x) : `The input must be a number or a float vector`
*>
```
```c3
macro tanh(x)
```

```c3
<*
 @require values::@is_floatlike(x) : `The input must be a floating point value or float vector`
*>
```
```c3
macro trunc(x)
```

Use a mask to select values from either "then" or "else" vectors.
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
```
```c3
macro select(bool[<*>] mask, then_value, else_value)
```
```c3
macro float float.ceil(float x)
```
```c3
macro float float.clamp(float x, float lower, float upper)
```
```c3
macro float float.copysign(float mag, float sgn)
```
```c3
macro float float.floor(float x)
```
```c3
macro float float.fma(float a, float b, float c)
```
```c3
macro float float.muladd(float a, float b, float c)
```
```c3
macro float float.nearbyint(float x)
```
```c3
macro float float.pow(float x, exp)
```
```c3
macro float float.rint(float x)
```
```c3
macro float float.round(float x)
```
```c3
macro float float.roundeven(float x)
```
```c3
macro float float.trunc(float x)
```
```c3
macro float float[<*>].sum(float[<*>] x, float start = 0.0)
```
```c3
macro float float[<*>].product(float[<*>] x, float start = 1.0)
```
```c3
macro float float[<*>].max(float[<*>] x)
```
```c3
macro float float[<*>].min(float[<*>] x)
```
```c3
macro float[<*>] float[<*>].ceil(float[<*>] x)
```
```c3
macro float[<*>] float[<*>].clamp(float[<*>] x, float[<*>] lower, float[<*>] upper)
```
```c3
macro float[<*>] float[<*>].copysign(float[<*>] mag, float[<*>] sgn)
```
```c3
macro float[<*>] float[<*>].fma(float[<*>] a, float[<*>] b, float[<*>] c)
```
```c3
macro float[<*>] float[<*>].floor(float[<*>] x)
```
```c3
macro float[<*>] float[<*>].nearbyint(float[<*>] x)
```
```c3
macro float[<*>] float[<*>].pow(float[<*>] x, exp)
```
```c3
macro float[<*>] float[<*>].rint(float[<*>] x)
```
```c3
macro float[<*>] float[<*>].round(float[<*>] x)
```
```c3
macro float[<*>] float[<*>].roundeven(float[<*>] x)
```
```c3
macro float[<*>] float[<*>].trunc(float[<*>] x)
```
```c3
macro float float[<*>].dot(float[<*>] x, float[<*>] y)
```
```c3
macro float float[<*>].length(float[<*>] x)
```
```c3
macro float float[<*>].distance(float[<*>] x, float[<*>] y)
```
```c3
macro float[<*>] float[<*>].normalize(float[<*>] x)
```
```c3
macro float[<*>] float[<*>].lerp(float[<*>] x, float[<*>] y, float amount)
```
```c3
macro float[<*>] float[<*>].reflect(float[<*>] x, float[<*>] y)
```
```c3
macro bool float[<*>].equals(float[<*>] x, float[<*>] y)
```
```c3
macro bool[<*>] float[<*>].comp_lt(float[<*>] x, float[<*>] y)
```
```c3
macro bool[<*>] float[<*>].comp_le(float[<*>] x, float[<*>] y)
```
```c3
macro bool[<*>] float[<*>].comp_eq(float[<*>] x, float[<*>] y)
```
```c3
macro bool[<*>] float[<*>].comp_gt(float[<*>] x, float[<*>] y)
```
```c3
macro bool[<*>] float[<*>].comp_ge(float[<*>] x, float[<*>] y)
```
```c3
macro bool[<*>] float[<*>].comp_ne(float[<*>] x, float[<*>] y)
```
```c3
macro double double.ceil(double x)
```
```c3
macro double double.clamp(double x, double lower, double upper)
```
```c3
macro double double.copysign(double mag, double sgn)
```
```c3
macro double double.floor(double x)
```
```c3
macro double double.fma(double a, double b, double c)
```
```c3
macro double double.muladd(double a, double b, double c)
```
```c3
macro double double.nearbyint(double x)
```
```c3
macro double double.pow(double x, exp)
```
```c3
macro double double.rint(double x)
```
```c3
macro double double.round(double x)
```
```c3
macro double double.roundeven(double x)
```
```c3
macro double double.trunc(double x)
```
```c3
macro double double[<*>].sum(double[<*>] x, double start = 0.0)
```
```c3
macro double double[<*>].product(double[<*>] x, double start = 1.0)
```
```c3
macro double double[<*>].max(double[<*>] x)
```
```c3
macro double double[<*>].min(double[<*>] x)
```
```c3
macro double[<*>] double[<*>].ceil(double[<*>] x)
```
```c3
macro double[<*>] double[<*>].clamp(double[<*>] x, double[<*>] lower, double[<*>] upper)
```
```c3
macro double[<*>] double[<*>].copysign(double[<*>] mag, double[<*>] sgn)
```
```c3
macro double[<*>] double[<*>].floor(double[<*>] x)
```
```c3
macro double[<*>] double[<*>].fma(double[<*>] a, double[<*>] b, double[<*>] c)
```
```c3
macro double[<*>] double[<*>].nearbyint(double[<*>] x)
```
```c3
macro double[<*>] double[<*>].pow(double[<*>] x, exp)
```
```c3
macro double[<*>] double[<*>].rint(double[<*>] x)
```
```c3
macro double[<*>] double[<*>].round(double[<*>] x)
```
```c3
macro double[<*>] double[<*>].roundeven(double[<*>] x)
```
```c3
macro double[<*>] double[<*>].trunc(double[<*>] x)
```
```c3
macro double double[<*>].dot(double[<*>] x, double[<*>] y)
```
```c3
macro double double[<*>].length(double[<*>] x)
```
```c3
macro double double[<*>].distance(double[<*>] x, double[<*>] y)
```
```c3
macro double[<*>] double[<*>].normalize(double[<*>] x)
```
```c3
macro double[<*>] double[<*>].reflect(double[<*>] x, double[<*>] y)
```
```c3
macro double[<*>] double[<*>].lerp(double[<*>] x, double[<*>] y, double amount)
```
```c3
macro bool double[<*>].equals(double[<*>] x, double[<*>] y)
```
```c3
macro bool[<*>] double[<*>].comp_lt(double[<*>] x, double[<*>] y)
```
```c3
macro bool[<*>] double[<*>].comp_le(double[<*>] x, double[<*>] y)
```
```c3
macro bool[<*>] double[<*>].comp_eq(double[<*>] x, double[<*>] y)
```
```c3
macro bool[<*>] double[<*>].comp_gt(double[<*>] x, double[<*>] y)
```
```c3
macro bool[<*>] double[<*>].comp_ge(double[<*>] x, double[<*>] y)
```
```c3
macro bool[<*>] double[<*>].comp_ne(double[<*>] x, double[<*>] y)
```
```c3
macro bool[<*>] ichar[<*>].comp_lt(ichar[<*>] x, ichar[<*>] y)
```
```c3
macro bool[<*>] ichar[<*>].comp_le(ichar[<*>] x, ichar[<*>] y)
```
```c3
macro bool[<*>] ichar[<*>].comp_eq(ichar[<*>] x, ichar[<*>] y)
```
```c3
macro bool[<*>] ichar[<*>].comp_gt(ichar[<*>] x, ichar[<*>] y)
```
```c3
macro bool[<*>] ichar[<*>].comp_ge(ichar[<*>] x, ichar[<*>] y)
```
```c3
macro bool[<*>] ichar[<*>].comp_ne(ichar[<*>] x, ichar[<*>] y)
```
```c3
macro ichar ichar[<*>].sum(ichar[<*>] x)
```
```c3
macro ichar ichar[<*>].product(ichar[<*>] x)
```
```c3
macro ichar ichar[<*>].and(ichar[<*>] x)
```
```c3
macro ichar ichar[<*>].or(ichar[<*>] x)
```
```c3
macro ichar ichar[<*>].xor(ichar[<*>] x)
```
```c3
macro ichar ichar[<*>].max(ichar[<*>] x)
```
```c3
macro ichar ichar[<*>].min(ichar[<*>] x)
```
```c3
macro ichar ichar[<*>].dot(ichar[<*>] x, ichar[<*>] y)
```
```c3
macro bool[<*>] short[<*>].comp_lt(short[<*>] x, short[<*>] y)
```
```c3
macro bool[<*>] short[<*>].comp_le(short[<*>] x, short[<*>] y)
```
```c3
macro bool[<*>] short[<*>].comp_eq(short[<*>] x, short[<*>] y)
```
```c3
macro bool[<*>] short[<*>].comp_gt(short[<*>] x, short[<*>] y)
```
```c3
macro bool[<*>] short[<*>].comp_ge(short[<*>] x, short[<*>] y)
```
```c3
macro bool[<*>] short[<*>].comp_ne(short[<*>] x, short[<*>] y)
```
```c3
macro short short[<*>].sum(short[<*>] x)
```
```c3
macro short short[<*>].product(short[<*>] x)
```
```c3
macro short short[<*>].and(short[<*>] x)
```
```c3
macro short short[<*>].or(short[<*>] x)
```
```c3
macro short short[<*>].xor(short[<*>] x)
```
```c3
macro short short[<*>].max(short[<*>] x)
```
```c3
macro short short[<*>].min(short[<*>] x)
```
```c3
macro short short[<*>].dot(short[<*>] x, short[<*>] y)
```
```c3
macro bool[<*>] int[<*>].comp_lt(int[<*>] x, int[<*>] y)
```
```c3
macro bool[<*>] int[<*>].comp_le(int[<*>] x, int[<*>] y)
```
```c3
macro bool[<*>] int[<*>].comp_eq(int[<*>] x, int[<*>] y)
```
```c3
macro bool[<*>] int[<*>].comp_gt(int[<*>] x, int[<*>] y)
```
```c3
macro bool[<*>] int[<*>].comp_ge(int[<*>] x, int[<*>] y)
```
```c3
macro bool[<*>] int[<*>].comp_ne(int[<*>] x, int[<*>] y)
```
```c3
macro int int[<*>].sum(int[<*>] x)
```
```c3
macro int int[<*>].product(int[<*>] x)
```
```c3
macro int int[<*>].and(int[<*>] x)
```
```c3
macro int int[<*>].or(int[<*>] x)
```
```c3
macro int int[<*>].xor(int[<*>] x)
```
```c3
macro int int[<*>].max(int[<*>] x)
```
```c3
macro int int[<*>].min(int[<*>] x)
```
```c3
macro int int[<*>].dot(int[<*>] x, int[<*>] y)
```
```c3
macro bool[<*>] long[<*>].comp_lt(long[<*>] x, long[<*>] y)
```
```c3
macro bool[<*>] long[<*>].comp_le(long[<*>] x, long[<*>] y)
```
```c3
macro bool[<*>] long[<*>].comp_eq(long[<*>] x, long[<*>] y)
```
```c3
macro bool[<*>] long[<*>].comp_gt(long[<*>] x, long[<*>] y)
```
```c3
macro bool[<*>] long[<*>].comp_ge(long[<*>] x, long[<*>] y)
```
```c3
macro bool[<*>] long[<*>].comp_ne(long[<*>] x, long[<*>] y)
```
```c3
macro long long[<*>].sum(long[<*>] x)
```
```c3
macro long long[<*>].product(long[<*>] x)
```
```c3
macro long long[<*>].and(long[<*>] x)
```
```c3
macro long long[<*>].or(long[<*>] x)
```
```c3
macro long long[<*>].xor(long[<*>] x)
```
```c3
macro long long[<*>].max(long[<*>] x)
```
```c3
macro long long[<*>].min(long[<*>] x)
```
```c3
macro long long[<*>].dot(long[<*>] x, long[<*>] y)
```
```c3
macro bool[<*>] int128[<*>].comp_lt(int128[<*>] x, int128[<*>] y)
```
```c3
macro bool[<*>] int128[<*>].comp_le(int128[<*>] x, int128[<*>] y)
```
```c3
macro bool[<*>] int128[<*>].comp_eq(int128[<*>] x, int128[<*>] y)
```
```c3
macro bool[<*>] int128[<*>].comp_gt(int128[<*>] x, int128[<*>] y)
```
```c3
macro bool[<*>] int128[<*>].comp_ge(int128[<*>] x, int128[<*>] y)
```
```c3
macro bool[<*>] int128[<*>].comp_ne(int128[<*>] x, int128[<*>] y)
```
```c3
macro int128 int128[<*>].sum(int128[<*>] x)
```
```c3
macro int128 int128[<*>].product(int128[<*>] x)
```
```c3
macro int128 int128[<*>].and(int128[<*>] x)
```
```c3
macro int128 int128[<*>].or(int128[<*>] x)
```
```c3
macro int128 int128[<*>].xor(int128[<*>] x)
```
```c3
macro int128 int128[<*>].max(int128[<*>] x)
```
```c3
macro int128 int128[<*>].min(int128[<*>] x)
```
```c3
macro int128 int128[<*>].dot(int128[<*>] x, int128[<*>] y)
```
```c3
macro bool[<*>] bool[<*>].comp_lt(bool[<*>] x, bool[<*>] y)
```
```c3
macro bool[<*>] bool[<*>].comp_le(bool[<*>] x, bool[<*>] y)
```
```c3
macro bool[<*>] bool[<*>].comp_eq(bool[<*>] x, bool[<*>] y)
```
```c3
macro bool[<*>] bool[<*>].comp_gt(bool[<*>] x, bool[<*>] y)
```
```c3
macro bool[<*>] bool[<*>].comp_ge(bool[<*>] x, bool[<*>] y)
```
```c3
macro bool[<*>] bool[<*>].comp_ne(bool[<*>] x, bool[<*>] y)
```
```c3
macro bool bool[<*>].sum(bool[<*>] x)
```
```c3
macro bool bool[<*>].product(bool[<*>] x)
```
```c3
macro bool bool[<*>].and(bool[<*>] x)
```
```c3
macro bool bool[<*>].or(bool[<*>] x)
```
```c3
macro bool bool[<*>].xor(bool[<*>] x)
```
```c3
macro bool bool[<*>].max(bool[<*>] x)
```
```c3
macro bool bool[<*>].min(bool[<*>] x)
```
```c3
macro bool[<*>] char[<*>].comp_lt(char[<*>] x, char[<*>] y)
```
```c3
macro bool[<*>] char[<*>].comp_le(char[<*>] x, char[<*>] y)
```
```c3
macro bool[<*>] char[<*>].comp_eq(char[<*>] x, char[<*>] y)
```
```c3
macro bool[<*>] char[<*>].comp_gt(char[<*>] x, char[<*>] y)
```
```c3
macro bool[<*>] char[<*>].comp_ge(char[<*>] x, char[<*>] y)
```
```c3
macro bool[<*>] char[<*>].comp_ne(char[<*>] x, char[<*>] y)
```
```c3
macro char char[<*>].sum(char[<*>] x)
```
```c3
macro char char[<*>].product(char[<*>] x)
```
```c3
macro char char[<*>].and(char[<*>] x)
```
```c3
macro char char[<*>].or(char[<*>] x)
```
```c3
macro char char[<*>].xor(char[<*>] x)
```
```c3
macro char char[<*>].max(char[<*>] x)
```
```c3
macro char char[<*>].min(char[<*>] x)
```
```c3
macro char char[<*>].dot(char[<*>] x, char[<*>] y)
```
```c3
macro bool[<*>] ushort[<*>].comp_lt(ushort[<*>] x, ushort[<*>] y)
```
```c3
macro bool[<*>] ushort[<*>].comp_le(ushort[<*>] x, ushort[<*>] y)
```
```c3
macro bool[<*>] ushort[<*>].comp_eq(ushort[<*>] x, ushort[<*>] y)
```
```c3
macro bool[<*>] ushort[<*>].comp_gt(ushort[<*>] x, ushort[<*>] y)
```
```c3
macro bool[<*>] ushort[<*>].comp_ge(ushort[<*>] x, ushort[<*>] y)
```
```c3
macro bool[<*>] ushort[<*>].comp_ne(ushort[<*>] x, ushort[<*>] y)
```
```c3
macro ushort ushort[<*>].sum(ushort[<*>] x)
```
```c3
macro ushort ushort[<*>].product(ushort[<*>] x)
```
```c3
macro ushort ushort[<*>].and(ushort[<*>] x)
```
```c3
macro ushort ushort[<*>].or(ushort[<*>] x)
```
```c3
macro ushort ushort[<*>].xor(ushort[<*>] x)
```
```c3
macro ushort ushort[<*>].max(ushort[<*>] x)
```
```c3
macro ushort ushort[<*>].min(ushort[<*>] x)
```
```c3
macro ushort ushort[<*>].dot(ushort[<*>] x, ushort[<*>] y)
```
```c3
macro bool[<*>] uint[<*>].comp_lt(uint[<*>] x, uint[<*>] y)
```
```c3
macro bool[<*>] uint[<*>].comp_le(uint[<*>] x, uint[<*>] y)
```
```c3
macro bool[<*>] uint[<*>].comp_eq(uint[<*>] x, uint[<*>] y)
```
```c3
macro bool[<*>] uint[<*>].comp_gt(uint[<*>] x, uint[<*>] y)
```
```c3
macro bool[<*>] uint[<*>].comp_ge(uint[<*>] x, uint[<*>] y)
```
```c3
macro bool[<*>] uint[<*>].comp_ne(uint[<*>] x, uint[<*>] y)
```
```c3
macro uint uint[<*>].sum(uint[<*>] x)
```
```c3
macro uint uint[<*>].product(uint[<*>] x)
```
```c3
macro uint uint[<*>].and(uint[<*>] x)
```
```c3
macro uint uint[<*>].or(uint[<*>] x)
```
```c3
macro uint uint[<*>].xor(uint[<*>] x)
```
```c3
macro uint uint[<*>].max(uint[<*>] x)
```
```c3
macro uint uint[<*>].min(uint[<*>] x)
```
```c3
macro uint uint[<*>].dot(uint[<*>] x, uint[<*>] y)
```
```c3
macro bool[<*>] ulong[<*>].comp_lt(ulong[<*>] x, ulong[<*>] y)
```
```c3
macro bool[<*>] ulong[<*>].comp_le(ulong[<*>] x, ulong[<*>] y)
```
```c3
macro bool[<*>] ulong[<*>].comp_eq(ulong[<*>] x, ulong[<*>] y)
```
```c3
macro bool[<*>] ulong[<*>].comp_gt(ulong[<*>] x, ulong[<*>] y)
```
```c3
macro bool[<*>] ulong[<*>].comp_ge(ulong[<*>] x, ulong[<*>] y)
```
```c3
macro bool[<*>] ulong[<*>].comp_ne(ulong[<*>] x, ulong[<*>] y)
```
```c3
macro ulong ulong[<*>].sum(ulong[<*>] x)
```
```c3
macro ulong ulong[<*>].product(ulong[<*>] x)
```
```c3
macro ulong ulong[<*>].and(ulong[<*>] x)
```
```c3
macro ulong ulong[<*>].or(ulong[<*>] x)
```
```c3
macro ulong ulong[<*>].xor(ulong[<*>] x)
```
```c3
macro ulong ulong[<*>].max(ulong[<*>] x)
```
```c3
macro ulong ulong[<*>].min(ulong[<*>] x)
```
```c3
macro ulong ulong[<*>].dot(ulong[<*>] x, ulong[<*>] y)
```
```c3
macro bool[<*>] uint128[<*>].comp_lt(uint128[<*>] x, uint128[<*>] y)
```
```c3
macro bool[<*>] uint128[<*>].comp_le(uint128[<*>] x, uint128[<*>] y)
```
```c3
macro bool[<*>] uint128[<*>].comp_eq(uint128[<*>] x, uint128[<*>] y)
```
```c3
macro bool[<*>] uint128[<*>].comp_gt(uint128[<*>] x, uint128[<*>] y)
```
```c3
macro bool[<*>] uint128[<*>].comp_ge(uint128[<*>] x, uint128[<*>] y)
```
```c3
macro bool[<*>] uint128[<*>].comp_ne(uint128[<*>] x, uint128[<*>] y)
```
```c3
macro uint128 uint128[<*>].sum(uint128[<*>] x)
```
```c3
macro uint128 uint128[<*>].product(uint128[<*>] x)
```
```c3
macro uint128 uint128[<*>].and(uint128[<*>] x)
```
```c3
macro uint128 uint128[<*>].or(uint128[<*>] x)
```
```c3
macro uint128 uint128[<*>].xor(uint128[<*>] x)
```
```c3
macro uint128 uint128[<*>].max(uint128[<*>] x)
```
```c3
macro uint128 uint128[<*>].min(uint128[<*>] x)
```
```c3
macro uint128 uint128[<*>].dot(uint128[<*>] x, uint128[<*>] y)
```
```c3
macro char char.sat_add(char x, char y)
```
```c3
macro char char.sat_sub(char x, char y)
```
```c3
macro char char.sat_mul(char x, char y)
```
```c3
macro char char.sat_shl(char x, char y)
```
```c3
macro char? char.overflow_add(char x, char y)
```
```c3
macro char? char.overflow_sub(char x, char y)
```
```c3
macro char? char.overflow_mul(char x, char y)
```
```c3
macro ichar ichar.sat_add(ichar x, ichar y)
```
```c3
macro ichar ichar.sat_sub(ichar x, ichar y)
```
```c3
macro ichar ichar.sat_mul(ichar x, ichar y)
```
```c3
macro ichar ichar.sat_shl(ichar x, ichar y)
```
```c3
macro ichar? ichar.overflow_add(ichar x, ichar y)
```
```c3
macro ichar? ichar.overflow_sub(ichar x, ichar y)
```
```c3
macro ichar? ichar.overflow_mul(ichar x, ichar y)
```
```c3
macro ushort ushort.sat_add(ushort x, ushort y)
```
```c3
macro ushort ushort.sat_sub(ushort x, ushort y)
```
```c3
macro ushort ushort.sat_mul(ushort x, ushort y)
```
```c3
macro ushort ushort.sat_shl(ushort x, ushort y)
```
```c3
macro ushort? ushort.overflow_add(ushort x, ushort y)
```
```c3
macro ushort? ushort.overflow_sub(ushort x, ushort y)
```
```c3
macro ushort? ushort.overflow_mul(ushort x, ushort y)
```
```c3
macro short short.sat_add(short x, short y)
```
```c3
macro short short.sat_sub(short x, short y)
```
```c3
macro short short.sat_mul(short x, short y)
```
```c3
macro short short.sat_shl(short x, short y)
```
```c3
macro short? short.overflow_add(short x, short y)
```
```c3
macro short? short.overflow_sub(short x, short y)
```
```c3
macro short? short.overflow_mul(short x, short y)
```
```c3
macro uint uint.sat_add(uint x, uint y)
```
```c3
macro uint uint.sat_sub(uint x, uint y)
```
```c3
macro uint uint.sat_mul(uint x, uint y)
```
```c3
macro uint uint.sat_shl(uint x, uint y)
```
```c3
macro uint? uint.overflow_add(uint x, uint y)
```
```c3
macro uint? uint.overflow_sub(uint x, uint y)
```
```c3
macro uint? uint.overflow_mul(uint x, uint y)
```
```c3
macro int int.sat_add(int x, int y)
```
```c3
macro int int.sat_sub(int x, int y)
```
```c3
macro int int.sat_mul(int x, int y)
```
```c3
macro int int.sat_shl(int x, int y)
```
```c3
macro int? int.overflow_add(int x, int y)
```
```c3
macro int? int.overflow_sub(int x, int y)
```
```c3
macro int? int.overflow_mul(int x, int y)
```
```c3
macro ulong ulong.sat_add(ulong x, ulong y)
```
```c3
macro ulong ulong.sat_sub(ulong x, ulong y)
```
```c3
macro ulong ulong.sat_mul(ulong x, ulong y)
```
```c3
macro ulong ulong.sat_shl(ulong x, ulong y)
```
```c3
macro ulong? ulong.overflow_add(ulong x, ulong y)
```
```c3
macro ulong? ulong.overflow_sub(ulong x, ulong y)
```
```c3
macro ulong? ulong.overflow_mul(ulong x, ulong y)
```
```c3
macro long long.sat_add(long x, long y)
```
```c3
macro long long.sat_sub(long x, long y)
```
```c3
macro long long.sat_mul(long x, long y)
```
```c3
macro long long.sat_shl(long x, long y)
```
```c3
macro long? long.overflow_add(long x, long y)
```
```c3
macro long? long.overflow_sub(long x, long y)
```
```c3
macro long? long.overflow_mul(long x, long y)
```
```c3
macro uint128 uint128.sat_add(uint128 x, uint128 y)
```
```c3
macro uint128 uint128.sat_sub(uint128 x, uint128 y)
```
```c3
macro uint128 uint128.sat_mul(uint128 x, uint128 y)
```
```c3
macro uint128 uint128.sat_shl(uint128 x, uint128 y)
```
```c3
macro uint128? uint128.overflow_add(uint128 x, uint128 y)
```
```c3
macro uint128? uint128.overflow_sub(uint128 x, uint128 y)
```
```c3
macro uint128? uint128.overflow_mul(uint128 x, uint128 y)
```
```c3
macro int128 int128.sat_add(int128 x, int128 y)
```
```c3
macro int128 int128.sat_sub(int128 x, int128 y)
```
```c3
macro int128 int128.sat_mul(int128 x, int128 y)
```
```c3
macro int128 int128.sat_shl(int128 x, int128 y)
```
```c3
macro int128? int128.overflow_add(int128 x, int128 y)
```
```c3
macro int128? int128.overflow_sub(int128 x, int128 y)
```
```c3
macro int128? int128.overflow_mul(int128 x, int128 y)
```

```c3
<*
 @require values::@is_int(x) : `The input must be an integer`
*>
```
```c3
macro bool is_odd(x)
```

```c3
<*
 @require values::@is_int(x) : `The input must be an integer`
*>
```
```c3
macro bool is_even(x)
```
```c3
macro bool char.is_even(char x)
```
```c3
macro bool char.is_odd(char x)
```
```c3
macro bool ichar.is_even(ichar x)
```
```c3
macro bool ichar.is_odd(ichar x)
```
```c3
macro bool ushort.is_even(ushort x)
```
```c3
macro bool ushort.is_odd(ushort x)
```
```c3
macro bool short.is_even(short x)
```
```c3
macro bool short.is_odd(short x)
```
```c3
macro bool uint.is_even(uint x)
```
```c3
macro bool uint.is_odd(uint x)
```
```c3
macro bool int.is_even(int x)
```
```c3
macro bool int.is_odd(int x)
```
```c3
macro bool ulong.is_even(ulong x)
```
```c3
macro bool ulong.is_odd(ulong x)
```
```c3
macro bool long.is_even(long x)
```
```c3
macro bool long.is_odd(long x)
```
```c3
macro bool uint128.is_even(uint128 x)
```
```c3
macro bool uint128.is_odd(uint128 x)
```
```c3
macro bool int128.is_even(int128 x)
```
```c3
macro bool int128.is_odd(int128 x)
```

```c3
<*
 @require types::is_underlying_int($typeof(x)) : `is_power_of_2 may only be used on integer types`
*>
```
```c3
macro bool is_power_of_2(x)
```
```c3
macro next_power_of_2(x)
```
```c3
macro uint double.high_word(double d)
```
```c3
macro uint double.low_word(double d)
```
```c3
macro uint float.word(float d)
```
```c3
macro void double.set_high_word(double* d, uint u)
```
```c3
macro void double.set_low_word(double* d, uint u)
```
```c3
macro void float.set_word(float* f, uint u)
```
```c3
macro double scalbn(double x, int n)
```
```c3
extern fn double _atan(double x) @MathLibc("atan")
```
```c3
fn void _sincosf(float a, float* s, float* c) @extern("sincosf") @if(env::WIN32)
```
```c3
extern fn double _tan(double x) @MathLibc("tan")
```
```c3
fn float _frexpf(float x, int* e)
```

```c3
<*
 @param [&out] out : "Where the result of the addition is stored"
 @return "Whether the addition resulted in an integer overflow"
 @require values::@is_same_type(a, b) : "a and b must be the same type"
 @require values::@is_flat_intlike(a) &&& values::@is_flat_intlike(b) : "a and b must both be integer or integer vector based"
 @require $defined(*out) &&& values::@is_same_type(*out, a) : "out must be a pointer of the same type as a and b"
*>
```
```c3
macro bool overflow_add(a, b, out)
```

```c3
<*
 @param [&out] out : "Where the result of the subtraction is stored"
 @return "Whether the subtraction resulted in an integer overflow"
 @require values::@is_same_type(a, b) : "a and b must be the same type"
 @require values::@is_flat_intlike(a) &&& values::@is_flat_intlike(b) : "a and b must both be integer or integer vector based"
 @require $defined(*out) &&& values::@is_same_type(*out, a) : "out must be a pointer of the same type as a and b"
*>
```
```c3
macro bool overflow_sub(a, b, out)
```

```c3
<*
 @param [&out] out : "Where the result of the multiplication is stored"
 @return "Whether the multiplication resulted in an integer overflow"
 @require values::@is_same_type(a, b) : "a and b must be the same type"
 @require values::@is_flat_intlike(a) &&& values::@is_flat_intlike(b) : "a and b must both be integer or integer vector based"
 @require $defined(*out) &&& values::@is_same_type(*out, a) : "out must be a pointer of the same type as a and b"
*>
```
```c3
macro bool overflow_mul(a, b, out)
```

```c3
<*
 @require types::is_vector($Type) || ($Type.kindof == ARRAY &&& types::is_numerical($typefrom($Type.inner)))
*>
```
```c3
macro iota($Type)
```
```c3
macro char char.muldiv(self, char mul, char div)
```
```c3
macro ichar ichar.muldiv(self, ichar mul, ichar div)
```
```c3
macro short short.muldiv(self, short mul, short div)
```
```c3
macro ushort ushort.muldiv(self, ushort mul, ushort div)
```
```c3
macro int int.muldiv(self, int mul, int div)
```
```c3
macro uint uint.muldiv(self, uint mul, uint div)
```
```c3
macro long long.muldiv(self, long mul, long div)
```
```c3
macro ulong ulong.muldiv(self, ulong mul, ulong div)
```

```c3
<*
 @require @is_same_vector_or_scalar(self, mul) : `mul must be a vector of the same type as self, or be an integer scalar`
 @require @is_same_vector_or_scalar(self, div) : `div must be a vector of the same type as self, or be an integer scalar`
*>
```
```c3
macro char[<*>] char[<*>].muldiv(self, mul, div)
```

```c3
<*
 @require @is_same_vector_or_scalar(self, mul) : `mul must be a vector of the same type as self, or be an integer scalar`
 @require @is_same_vector_or_scalar(self, div) : `div must be a vector of the same type as self, or be an integer scalar`
*>
```
```c3
macro ichar[<*>] ichar[<*>].muldiv(self, mul, div)
```

```c3
<*
 @require @is_same_vector_or_scalar(self, mul) : `mul must be a vector of the same type as self, or be an integer scalar`
 @require @is_same_vector_or_scalar(self, div) : `div must be a vector of the same type as self, or be an integer scalar`
*>
```
```c3
macro short[<*>] short[<*>].muldiv(self, mul, div)
```

```c3
<*
 @require @is_same_vector_or_scalar(self, mul) : `mul must be a vector of the same type as self, or be an integer scalar`
 @require @is_same_vector_or_scalar(self, div) : `div must be a vector of the same type as self, or be an integer scalar`
*>
```
```c3
macro ushort[<*>] ushort[<*>].muldiv(self, mul, div)
```

```c3
<*
 @require @is_same_vector_or_scalar(self, mul) : `mul must be a vector of the same type as self, or be an integer scalar`
 @require @is_same_vector_or_scalar(self, div) : `div must be a vector of the same type as self, or be an integer scalar`
*>
```
```c3
macro int[<*>] int[<*>].muldiv(self, mul, div)
```

```c3
<*
 @require @is_same_vector_or_scalar(self, mul) : `mul must be a vector of the same type as self, or be an integer scalar`
 @require @is_same_vector_or_scalar(self, div) : `div must be a vector of the same type as self, or be an integer scalar`
*>
```
```c3
macro uint[<*>] uint[<*>].muldiv(self, mul, div)
```

```c3
<*
 @require @is_same_vector_or_scalar(self, mul) : `mul must be a vector of the same type as self, or be an integer scalar`
 @require @is_same_vector_or_scalar(self, div) : `div must be a vector of the same type as self, or be an integer scalar`
*>
```
```c3
macro long[<*>] long[<*>].muldiv(self, mul, div)
```

```c3
<*
 @require @is_same_vector_or_scalar(self, mul) : `mul must be a vector of the same type as self, or be an integer scalar`
 @require @is_same_vector_or_scalar(self, div) : `div must be a vector of the same type as self, or be an integer scalar`
*>
```
```c3
macro ulong[<*>] ulong[<*>].muldiv(self, mul, div)
```

Calculate the least common multiple for the provided arguments.
```c3
<*
 @require $vacount >= 2 : "At least two arguments are required."
*>
```
```c3
macro lcm(...)
```

Calculate the greatest common divisor for the provided arguments.
```c3
<*
 @require $vacount >= 2 : "At least two arguments are required."
*>
```
```c3
macro gcd(...)
```
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
```c3
alias Quaternionf = Quaternion {float}
```
```c3
alias Quaternion = Quaternion {double}
```
```c3
alias QUATERNION_IDENTITY  @builtin = quaternion::IDENTITY {double}
```
```c3
alias QUATERNIONF_IDENTITY @builtin = quaternion::IDENTITY {float}
```
### `std::math::bigint`
```c3
const MAX_LEN
```
```c3
const BigInt ZERO
```
```c3
const BigInt ONE
```
```c3
struct BigInt (Printable)
```
```c3
fn BigInt from_int(int128 val)
```
```c3
fn BigInt* BigInt.init(&self, int128 value)
```
```c3
fn BigInt* BigInt.init_with_u128(&self, uint128 value)
```

```c3
<*
 @require values.len <= MAX_LEN
*>
```
```c3
fn BigInt* BigInt.init_with_array(&self, uint[] values)
```
```c3
fn BigInt*? BigInt.init_string_radix(&self, String value, int radix)
```
```c3
fn bool BigInt.is_negative(&self)
```
```c3
fn BigInt BigInt.add(self, BigInt other) @operator(+)
```
```c3
fn void BigInt.add_this(&self, BigInt other) @operator(+=)
```
```c3
macro uint find_length(uint* data, uint length)
```
```c3
fn BigInt BigInt.mult(self, BigInt bi2) @operator(*)
```
```c3
fn void BigInt.mult_this(&self, BigInt bi2) @operator(*=)
```
```c3
fn void BigInt.negate(&self)
```
```c3
macro bool BigInt.is_zero(&self)
```
```c3
fn BigInt BigInt.sub(self, BigInt other) @operator(-)
```
```c3
fn BigInt* BigInt.sub_this(&self, BigInt other) @operator(-=)
```
```c3
fn int BigInt.bitcount(&self)
```
```c3
fn BigInt BigInt.unary_minus(&self) @operator(-)
```
```c3
macro BigInt BigInt.div(self, BigInt other) @operator(/)
```
```c3
fn void BigInt.div_this(&self, BigInt other) @operator(/=)
```
```c3
fn BigInt BigInt.mod(self, BigInt bi2) @operator(%)
```
```c3
fn void BigInt.mod_this(&self, BigInt bi2) @operator(%=)
```
```c3
fn void BigInt.bit_negate_this(&self)
```
```c3
fn BigInt BigInt.bit_negate(self) @operator(~)
```
```c3
fn BigInt BigInt.shr(self, int shift) @operator(>>)
```
```c3
fn void BigInt.shr_this(self, int shift) @operator(>>=)
```
```c3
fn BigInt BigInt.shl(self, int shift) @operator(<<)
```
```c3
macro bool BigInt.equals(&self, BigInt other) @operator(==)
```
```c3
macro bool BigInt.greater_than(&self, BigInt other)
```
```c3
macro bool BigInt.less_than(&self, BigInt other)
```
```c3
fn bool BigInt.is_odd(&self)
```
```c3
fn bool BigInt.is_one(&self)
```
```c3
macro bool BigInt.greater_or_equal(&self, BigInt other)
```
```c3
macro bool BigInt.less_or_equal(&self, BigInt)
```
```c3
fn BigInt BigInt.abs(&self)
```
```c3
fn usz? BigInt.to_format(&self, Formatter* format) @dynamic
```
```c3
fn String BigInt.to_string(&self, Allocator allocator) @dynamic
```

```c3
<*
 @require radix > 1 && radix <= 36 : "Radix must be 2-36"
*>
```
```c3
fn String BigInt.to_string_with_radix(&self, int radix, Allocator allocator)
```

```c3
<*
 @require !exp.is_negative() : "Positive exponents only"
*>
```
```c3
fn BigInt BigInt.mod_pow(&self, BigInt exp, BigInt mod)
```

Fast calculation of modular reduction using Barrett's reduction.
Requires x < b^(2k), where b is the base.  In this case, base is
2^32 (uint).
```c3
fn BigInt barrett_reduction(BigInt x, BigInt n, BigInt constant)
```
```c3
fn BigInt BigInt.sqrt(&self)
```
```c3
fn BigInt BigInt.bit_and(self, BigInt bi2) @operator(&)
```
```c3
fn void BigInt.bit_and_this(&self, BigInt bi2)
```
```c3
fn BigInt BigInt.bit_or(self, BigInt bi2) @operator(|)
```
```c3
fn void BigInt.bit_or_this(&self, BigInt bi2)
```
```c3
fn BigInt BigInt.bit_xor(self, BigInt bi2) @operator(^)
```
```c3
fn void BigInt.bit_xor_this(&self, BigInt bi2)
```
```c3
fn void BigInt.shl_this(&self, int shift) @operator(<<=)
```
```c3
fn BigInt BigInt.gcd(&self, BigInt other)
```
```c3
fn BigInt BigInt.lcm(&self, BigInt other)
```

```c3
<*
 @require bits >> 5 < MAX_LEN : "Required bits > maxlength"
*>
```
```c3
fn void BigInt.randomize_bits(&self, Random random, int bits)
```
### `std::math::complex {Real}`
```c3
const Complex IDENTITY
```
```c3
const Complex IMAGINARY
```
```c3
macro Complex Complex.add(self, Complex b) @operator(+)
```
```c3
macro Complex Complex.add_this(&self, Complex b) @operator(+=)
```
```c3
macro Complex Complex.add_real(self, Real r) @operator_s(+)
```
```c3
macro Complex Complex.add_each(self, Real b)
```
```c3
macro Complex Complex.sub(self, Complex b) @operator(-)
```
```c3
macro Complex Complex.sub_this(&self, Complex b) @operator(-=)
```
```c3
macro Complex Complex.sub_real(self, Real r) @operator(-)
```
```c3
macro Complex Complex.sub_real_inverse(self, Real r) @operator_r(-)
```
```c3
macro Complex Complex.sub_each(self, Real b)
```
```c3
macro Complex Complex.scale(self, Real r) @operator_s(*)
```
```c3
macro Complex Complex.mul(self, Complex b)@operator(*)
```
```c3
macro Complex Complex.div_real(self, Real r) @operator(/)
```
```c3
macro Complex Complex.div_real_inverse(Complex c, Real r) @operator_r(/)
```
```c3
macro Complex Complex.div(self, Complex b) @operator(/)
```
```c3
macro Complex Complex.inverse(self)
```
```c3
macro Complex Complex.conjugate(self)
```
```c3
macro Complex Complex.negate(self) @operator(-)
```
```c3
macro bool Complex.equals(self, Complex b) @operator(==)
```
```c3
macro bool Complex.equals_real(self, Real r) @operator_s(==)
```
```c3
macro bool Complex.not_equals(self, Complex b) @operator(!=)
```
```c3
fn usz? Complex.to_format(&self, Formatter* f) @dynamic
```
### `std::math::easing`
```c3
fn float linear_none(float t, float b, float c, float d) @inline
```
```c3
fn float linear_in(float t, float b, float c, float d) @inline
```
```c3
fn float linear_out(float t, float b, float c, float d) @inline
```
```c3
fn float linear_inout(float t, float b, float c, float d) @inline
```
```c3
fn float sine_in(float t, float b, float c, float d) @inline
```
```c3
fn float sine_out(float t, float b, float c, float d) @inline
```
```c3
fn float sine_inout(float t, float b, float c, float d) @inline
```
```c3
fn float circ_in(float t, float b, float c, float d) @inline
```
```c3
fn float circ_out(float t, float b, float c, float d) @inline
```
```c3
fn float circ_inout(float t, float b, float c, float d) @inline
```
```c3
fn float cubic_in(float t, float b, float c, float d) @inline
```
```c3
fn float cubic_out(float t, float b, float c, float d) @inline
```
```c3
fn float cubic_inout(float t, float b, float c, float d) @inline
```
```c3
fn float quad_in(float t, float b, float c, float d) @inline
```
```c3
fn float quad_out(float t, float b, float c, float d) @inline
```
```c3
fn float quad_inout(float t, float b, float c, float d) @inline
```
```c3
fn float expo_in(float t, float b, float c, float d) @inline
```
```c3
fn float expo_out(float t, float b, float c, float d) @inline
```
```c3
fn float expo_inout(float t, float b, float c, float d) @inline
```
```c3
fn float back_in(float t, float b, float c, float d, float s = 1.70158f) @inline
```
```c3
fn float back_out(float t, float b, float c, float d, float s = 1.70158f) @inline
```
```c3
fn float back_inout(float t, float b, float c, float d, float s = 1.70158f) @inline
```
```c3
fn float bounce_out(float t, float b, float c, float d) @inline
```
```c3
fn float bounce_in(float t, float b, float c, float d) @inline
```
```c3
fn float bounce_inout(float t, float b, float c, float d) @inline
```
```c3
fn float elastic_in(float t, float b, float c, float d) @inline
```
```c3
fn float elastic_out(float t, float b, float c, float d) @inline
```
```c3
fn float elastic_inout(float t, float b, float c, float d) @inline
```
### `std::math::math_rt`
```c3
fn int128 __divti3(int128 a, int128 b) @extern("__divti3") @weak @nostrip
```
```c3
macro uint128 @__udivmodti4(uint128 a, uint128 b, bool $return_rem)
```
```c3
fn uint128 __umodti3(uint128 n, uint128 d) @extern("__umodti3") @weak @nostrip
```
```c3
fn uint128 __udivti3(uint128 n, uint128 d) @extern("__udivti3") @weak @nostrip
```
```c3
fn int128 __modti3(int128 a, int128 b) @extern("__modti3") @weak @nostrip
```
```c3
fn uint128 __lshrti3(uint128 a, uint b) @extern("__lshrti3") @weak @nostrip
```
```c3
fn int128 __ashrti3(int128 a, uint b) @extern("__ashrti3") @weak @nostrip
```
```c3
fn int128 __ashlti3(int128 a, uint b) @extern("__ashlti3") @weak @nostrip
```
```c3
fn int128 __multi3(int128 a, int128 b) @extern("__multi3") @weak @nostrip
```
```c3
fn float __floattisf(int128 a) @extern("__floattisf") @weak @nostrip
```
```c3
fn double __floattidf(int128 a) @extern("__floattidf") @weak @nostrip
```
```c3
fn float __floatuntisf(uint128 a) @extern("__floatuntisf") @weak @nostrip
```
```c3
fn double __floatuntidf(uint128 a) @extern("__floatuntidf") @weak @nostrip
```
```c3
fn uint128 __fixunsdfti(double a) @weak @extern("__fixunsdfti") @nostrip
```
```c3
fn uint128 __fixunssfti(float a) @weak @extern("__fixunssfti") @nostrip
```
```c3
fn int128 __fixdfti(double a) @weak @extern("__fixdfti") @nostrip
```
```c3
fn int128 __fixsfti(float a) @weak @extern("__fixsfti") @nostrip
```
```c3
fn float __roundevenf(float f) @extern("roundevenf") @weak @nostrip
```
```c3
fn double __roundeven(double d) @extern("roundeven") @weak @nostrip
```
```c3
fn double __powidf2(double a, int b) @extern("__powidf2") @weak @nostrip
```
### `std::math::matrix {Real}`
```c3
struct Matrix2x2
```
```c3
struct Matrix3x3
```
```c3
struct Matrix4x4
```
```c3
fn Real[<2>] Matrix2x2.apply(&self, Real[<2>] vec) @operator(*)
```
```c3
fn Real[<3>] Matrix3x3.apply(&self, Real[<3>] vec) @operator(*)
```
```c3
fn Real[<4>] Matrix4x4.apply(&self, Real[<4>] vec) @operator(*)
```
```c3
fn Matrix2x2 Matrix2x2.mul(&self, Matrix2x2 b) @operator(*)
```
```c3
fn Matrix3x3 Matrix3x3.mul(&self, Matrix3x3 b) @operator(*)
```
```c3
fn Matrix4x4 Matrix4x4.mul(Matrix4x4* self, Matrix4x4 b) @operator(*)
```
```c3
fn Matrix2x2 Matrix2x2.component_mul(&self, Real s)
```
```c3
fn Matrix3x3 Matrix3x3.component_mul(&self, Real s)
```
```c3
fn Matrix4x4 Matrix4x4.component_mul(&self, Real s)
```
```c3
fn Matrix2x2 Matrix2x2.add(&self, Matrix2x2 mat2) @operator(+)
```
```c3
fn Matrix3x3 Matrix3x3.add(&self, Matrix3x3 mat2) @operator(+)
```
```c3
fn Matrix4x4 Matrix4x4.add(&self, Matrix4x4 mat2) @operator(+)
```
```c3
fn Matrix2x2 Matrix2x2.sub(&self, Matrix2x2 mat2) @operator(-)
```
```c3
fn Matrix3x3 Matrix3x3.sub(&self, Matrix3x3 mat2) @operator(-)
```
```c3
fn Matrix4x4 Matrix4x4.sub(&self, Matrix4x4 mat2) @operator(-)
```
```c3
fn Matrix2x2 Matrix2x2.negate(&self) @operator(-)
```
```c3
fn Matrix3x3 Matrix3x3.negate(&self) @operator(-)
```
```c3
fn Matrix4x4 Matrix4x4.negate(&self) @operator(-)
```
```c3
fn bool Matrix2x2.eq(&self, Matrix2x2 mat2) @operator(==)
```
```c3
fn bool Matrix3x3.eq(&self, Matrix3x3 mat2) @operator(==)
```
```c3
fn bool Matrix4x4.eq(&self, Matrix4x4 mat2) @operator(==)
```
```c3
fn bool Matrix2x2.neq(&self, Matrix2x2 mat2) @operator(!=)
```
```c3
fn bool Matrix3x3.neq(&self, Matrix3x3 mat2) @operator(!=)
```
```c3
fn bool Matrix4x4.neq(&self, Matrix4x4 mat2) @operator(!=)
```
```c3
fn Matrix4x4 look_at(Real[<3>] eye, Real[<3>] target, Real[<3>] up)
```
```c3
fn Matrix2x2 Matrix2x2.transpose(&self)
```
```c3
fn Matrix3x3 Matrix3x3.transpose(&self)
```
```c3
fn Matrix4x4 Matrix4x4.transpose(&self)
```
```c3
fn Real Matrix2x2.determinant(&self)
```
```c3
fn Real Matrix3x3.determinant(&self)
```
```c3
fn Real Matrix4x4.determinant(&self)
```
```c3
fn Matrix2x2 Matrix2x2.adjoint(&self)
```
```c3
fn Matrix3x3 Matrix3x3.adjoint(&self)
```
```c3
fn Matrix4x4 Matrix4x4.adjoint(&self)
```
```c3
fn Matrix2x2? Matrix2x2.inverse(&self)
```
```c3
fn Matrix3x3? Matrix3x3.inverse(&self)
```
```c3
fn Matrix4x4? Matrix4x4.inverse(&self)
```
```c3
fn Matrix3x3 Matrix3x3.translate(&self, Real[<2>] v)
```
```c3
fn Matrix4x4 Matrix4x4.translate(&self, Real[<3>] v)
```
```c3
fn Matrix3x3 Matrix3x3.rotate(&self, Real r)
```
```c3
fn Matrix4x4 Matrix4x4.rotate_z(&self, Real r)
```
```c3
fn Matrix4x4 Matrix4x4.rotate_y(&self, Real r)
```
```c3
fn Matrix4x4 Matrix4x4.rotate_x(&self, Real r)
```
```c3
fn Matrix3x3 Matrix3x3.scale(&self, Real[<2>] v)
```
```c3
fn Real Matrix2x2.trace(&self)
```
```c3
fn Real Matrix3x3.trace(&self)
```
```c3
fn Real Matrix4x4.trace(&self)
```
```c3
fn Matrix4x4 Matrix4x4.scale(&self, Real[<3>] v)
```
```c3
fn Matrix4x4 ortho(Real left, Real right, Real top, Real bottom, Real near, Real far)
```
```c3
fn Matrix4x4 perspective(Real fov, Real aspect_ratio, Real near, Real far)
```
```c3
const Matrix2x2 IDENTITY2
```
```c3
const Matrix3x3 IDENTITY3
```
```c3
const Matrix4x4 IDENTITY4
```
### `std::math::nolibc @if(env::NO_LIBC || $feature(C3_MATH))`
```c3
fn double __cos(double x, double y) @extern("__cos") @weak @nostrip
```
```c3
fn float __cosdf(double x) @extern("__cosdf") @weak @nostrip
```
```c3
fn double fmod(double x, double y) @extern("fmod") @weak @nostrip
```
```c3
fn float fmodf(float x, float y) @extern("fmodf") @weak @nostrip
```
```c3
fn double __sin(double x, double y, int iy) @extern("__sin") @weak @nostrip
```
```c3
fn float __sindf(double x) @extern("__sindf") @weak @nostrip
```
```c3
const double[*] TAN_T
```
```c3
fn double __tan(double x, double y, int odd) @extern("__tan") @weak @nostrip
```
```c3
const double[*] TANDF
```
```c3
fn float __tandf(double x, int odd) @extern("__tandf") @weak @nostrip
```
```c3
fn double _acos(double x) @weak @extern("acos") @nostrip
```
```c3
fn float _acosf(float x) @weak @extern("acosf") @nostrip
```
```c3
fn double _asin(double x) @weak @extern("asin") @nostrip
```
```c3
fn float _asinf(float x) @weak @extern("asinf") @nostrip
```
```c3
fn double _atan(double x) @weak @extern("atan") @nostrip
```
```c3
fn float _atanf(float x) @weak @extern("atanf") @nostrip
```
```c3
fn double _atan2(double y, double x) @weak @extern("atan2") @nostrip
```
```c3
fn float _atan2f(float y, float x) @weak @extern("atan2f") @nostrip
```
```c3
fn double _atanh(double x) @weak @extern("atanh") @nostrip
```
```c3
fn float _atanhf(float x) @weak @extern("atanhf") @nostrip
```
```c3
fn double _ceil(double x) @weak @extern("ceil") @nostrip
```
```c3
fn float _ceilf(float x) @weak @extern("ceilf") @nostrip
```
```c3
fn float _cosf(float x) @extern("cosf") @weak @nostrip
```
```c3
fn double _cos(double x) @extern("cos")  @weak @nostrip
```
```c3
const double EXP_LN2_HI
```
```c3
const double EXP_LN2_LO
```
```c3
const double EXP_INV_LN2
```
```c3
const double EXP_P1
```
```c3
const double EXP_P2
```
```c3
const double EXP_P3
```
```c3
const double EXP_P4
```
```c3
const double EXP_P5
```
```c3
const float EXPF_LN2_HI
```
```c3
const float EXPF_LN2_LO
```
```c3
const float EXPF_INV_LN2
```
```c3
const float EXPF_P1
```
```c3
const float EXPF_P2
```
```c3
const float EXPF_P3
```
```c3
const float EXPF_P4
```
```c3
fn double exp(double x) @extern("exp")
```
```c3
fn float expf(float x) @extern("expf")
```
```c3
fn float _exp2f(float x) @extern("exp2f") @weak @nostrip
```
```c3
fn double _exp2(double x) @extern("exp2") @weak @nostrip
```
```c3
fn double _fabs(double x) @weak @extern("fabs") @nostrip
```
```c3
fn float _fabsf(float x) @weak @extern("fabsf") @nostrip
```
```c3
fn double _floor(double x) @weak @extern("floor") @nostrip
```
```c3
fn float _floorf(float x) @weak @extern("floorf") @nostrip
```
```c3
fn double frexp(double x, int* exp) @extern("frexp")
```
```c3
fn float frexpf(float x, int* exp) @extern("frexpf")
```
```c3
fn double ldexp(double x, int exp) @extern("ldexp")
```
```c3
fn float ldexpf(float x, int exp) @extern("ldexpf")
```
```c3
const double LOG_LN2_HI
```
```c3
const double LOG_LN2_LO
```
```c3
const double LOG_L1
```
```c3
const double LOG_L2
```
```c3
const double LOG_L3
```
```c3
const double LOG_L4
```
```c3
const double LOG_L5
```
```c3
const double LOG_L6
```
```c3
const float LOGF_LN2_HI
```
```c3
const float LOGF_LN2_LO
```
```c3
const float LOGF_L1
```
```c3
const float LOGF_L2
```
```c3
const float LOGF_L3
```
```c3
const float LOGF_L4
```
```c3
const double SQRT2
```
```c3
const float SQRT2F
```
```c3
fn double log(double x) @extern("log")
```
```c3
fn float logf(float x) @extern("logf")
```
```c3
fn double _log1p(double x) @weak @extern("log1p") @nostrip
```
```c3
fn float _log1pf(float x) @weak @extern("log1pf") @nostrip
```
```c3
const double TOINT
```
```c3
const double TOINT15
```
```c3
const float TOINTF
```
```c3
const EXP_TABLE_BITS
```
```c3
const EXP_POLY_ORDER
```
```c3
const EXP2_POLY_ORDER
```
```c3
const EXP_DATA_WIDTH
```
```c3
const Exp2Data __EXP2_DATA
```
```c3
const bool WANT_ROUNDING
```
```c3
macro float __math_uflowf(uint sign)
```
```c3
macro double __math_uflow(ulong sign)
```
```c3
macro float __math_oflowf(uint sign)
```
```c3
macro double __math_oflow(ulong sign)
```
```c3
macro __math_xflow(sign, v)
```
```c3
macro force_eval_add(x, v)
```
```c3
fn double pow(double x, double y) @extern("pow")
```
```c3
fn float powf(float x, float y) @extern("powf")
```
```c3
fn int __rem_pio2f(float x, double *y)
```
```c3
const int[*] INIT_JK
```
```c3
const int[*] IPIO2
```
```c3
fn int __rem_pio2_large(double* x, double* y, int e0, int nx, int prec)
```

caller must handle the case when reduction is not needed: |x| ~<= pi/4
```c3
fn int __rem_pio2(double x, double *y)
```
```c3
fn double _round(double x) @extern("round") @weak @nostrip
```
```c3
fn float _roundf(float x) @extern("roundf") @weak @nostrip
```
```c3
fn double _scalbn(double x, int n) @weak @extern("scalbn") @nostrip
```
```c3
fn float _sinf(float x) @weak @extern("sinf") @nostrip
```
```c3
fn double sin(double x) @extern("sin") @weak @nostrip
```
```c3
fn void sincosf(float x, float *sin, float *cos) @extern("__sincosf") @weak @nostrip
```
```c3
fn void sincos(double x, double *sin, double *cos) @extern("__sincos") @weak @nostrip
```
```c3
fn double tan(double x) @extern("tan") @weak @nostrip
```
```c3
fn float tanf(float x) @extern("tanf") @weak @nostrip
```
```c3
fn double sincos_broken(double x) @extern("sincos") @weak @nostrip
```
```c3
fn double _trunc(double x) @weak @extern("trunc") @nostrip
```
```c3
fn float _truncf(float x) @weak @extern("truncf") @nostrip
```
### `std::math::quaternion {Real}`
```c3
const Quaternion IDENTITY
```
```c3
macro Quaternion Quaternion.add(self, Quaternion b) @operator(+)
```
```c3
macro Quaternion Quaternion.add_each(self, Real b)
```
```c3
macro Quaternion Quaternion.sub(self, Quaternion b) @operator(-)
```
```c3
macro Quaternion Quaternion.negate(self) @operator(-)
```
```c3
macro Quaternion Quaternion.sub_each(self, Real b)
```
```c3
macro Quaternion Quaternion.scale(self, Real s) @operator_s(*)
```
```c3
macro Quaternion Quaternion.normalize(self)
```
```c3
macro Real Quaternion.length(self)
```
```c3
macro Quaternion Quaternion.lerp(self, Quaternion q2, Real amount)
```
```c3
macro Matrix4f Quaternion.to_matrixf(&self)
```
```c3
macro Matrix4 Quaternion.to_matrix(&self)
```
```c3
fn Quaternion Quaternion.nlerp(self, Quaternion q2, Real amount)
```
```c3
fn Quaternion Quaternion.invert(self)
```
```c3
fn Quaternion Quaternion.slerp(self, Quaternion q2, Real amount)
```
```c3
fn Quaternion Quaternion.mul(self, Quaternion b) @operator(*)
```
### `std::math::random`

```c3
<*
 @require is_random(random)
*>
```
```c3
macro void seed(random, seed)
```

Seed the random with some best effort entropy.
```c3
<*
 @require is_random(random)
*>
```
```c3
macro void seed_entropy(random)
```

Get the next value between 0 and range (not including range).
```c3
<*
 @require is_random(random)
 @require range > 0
*>
```
```c3
macro int next(random, uint range)
```

Get a random in the range [min, max], both included.
```c3
<*
 @require is_random(random)
 @require max >= min
*>
```
```c3
macro int next_in_range(random, int min, int max)
```
```c3
alias DefaultRandom = Sfc64Random
```

Seed the default random function.
```c3
fn void srand(ulong seed) @builtin
```

Get a default random value between 0 and range (not including range)
```c3
fn int rand(int range) @builtin
```

Get a random in the range, both included.
```c3
<*
 @require max >= min
*>
```
```c3
fn int rand_in_range(int min, int max) @builtin
```
```c3
fn double rnd() @builtin
```

Get 'true' or 'false'
```c3
<*
 @require is_random(random)
*>
```
```c3
macro bool next_bool(random)
```

Get a float between 0 and 1.0, not including 1.0.
```c3
<*
 @require is_random(random)
*>
```
```c3
macro float next_float(random)
```

Get a double between 0 and 1.0, not including 1.0.
```c3
<*
 @require is_random(random)
*>
```
```c3
macro double next_double(random)
```
```c3
macro bool is_random(random)
```
```c3
macro uint128 @long_to_int128(#function)
```
```c3
macro ulong @int_to_long(#function)
```
```c3
macro uint @short_to_int(#function)
```
```c3
macro ushort @char_to_short(#function)
```
```c3
macro @random_value_to_bytes(#function, char[] bytes)
```
```c3
typedef Lcg128Random (Random) = uint128
```
```c3
fn void Lcg128Random.set_seed(&self, char[] input) @dynamic
```
```c3
fn ulong Lcg128Random.next_long(&self) @dynamic
```

```c3
<*
 @require bytes.len > 0
*>
```
```c3
fn void Lcg128Random.next_bytes(&self, char[] bytes) @dynamic
```
```c3
fn uint128 Lcg128Random.next_int128(&self) @dynamic
```
```c3
fn uint Lcg128Random.next_int(&self) @dynamic
```
```c3
fn ushort Lcg128Random.next_short(&self) @dynamic
```
```c3
fn char Lcg128Random.next_byte(&self) @dynamic
```
```c3
typedef Lcg64Random (Random) = ulong
```
```c3
fn void Lcg64Random.set_seed(&self, char[] seed) @dynamic
```
```c3
fn uint Lcg64Random.next_int(&self) @dynamic
```

```c3
<*
 @require bytes.len > 0
*>
```
```c3
fn void Lcg64Random.next_bytes(&self, char[] bytes) @dynamic
```
```c3
fn uint128 Lcg64Random.next_int128(&self) @dynamic
```
```c3
fn ulong Lcg64Random.next_long(&self) @dynamic
```
```c3
fn ushort Lcg64Random.next_short(&self) @dynamic
```
```c3
fn char Lcg64Random.next_byte(&self) @dynamic
```
```c3
typedef Lcg32Random (Random) = uint
```
```c3
fn void Lcg32Random.set_seed(&self, char[] seed) @dynamic
```
```c3
fn ushort Lcg32Random.next_short(&self) @dynamic
```
```c3
fn void Lcg32Random.next_bytes(&self, char[] bytes) @dynamic
```
```c3
fn uint128 Lcg32Random.next_int128(&self) @dynamic
```
```c3
fn ulong Lcg32Random.next_long(&self) @dynamic
```
```c3
fn uint Lcg32Random.next_int(&self) @dynamic
```
```c3
fn char Lcg32Random.next_byte(&self) @dynamic
```
```c3
typedef Lcg16Random (Random) = ushort
```
```c3
fn void Lcg16Random.set_seed(&self, char[] seed) @dynamic
```
```c3
fn char Lcg16Random.next_byte(&self) @dynamic
```
```c3
fn void Lcg16Random.next_bytes(&self, char[] bytes) @dynamic
```
```c3
fn uint128 Lcg16Random.next_int128(&self) @dynamic
```
```c3
fn ulong Lcg16Random.next_long(&self) @dynamic
```
```c3
fn uint Lcg16Random.next_int(&self) @dynamic
```
```c3
fn ushort Lcg16Random.next_short(&self) @dynamic
```
```c3
typedef Mcg128Random (Random) = uint128
```
```c3
fn void Mcg128Random.set_seed(&self, char[] seed) @dynamic
```

```c3
<*
 @require bytes.len > 0
*>
```
```c3
fn void Mcg128Random.next_bytes(&self, char[] bytes) @dynamic
```
```c3
fn ulong Mcg128Random.next_long(&self) @dynamic
```
```c3
fn uint128 Mcg128Random.next_int128(&self) @dynamic
```
```c3
fn uint Mcg128Random.next_int(&self) @dynamic
```
```c3
fn ushort Mcg128Random.next_short(&self) @dynamic
```
```c3
fn char Mcg128Random.next_byte(&self) @dynamic
```
```c3
typedef Mcg64Random (Random) = ulong
```
```c3
fn void Mcg64Random.set_seed(&self, char[] seed) @dynamic
```

```c3
<*
 @require bytes.len > 0
*>
```
```c3
fn void Mcg64Random.next_bytes(&self, char[] bytes) @dynamic
```
```c3
fn uint Mcg64Random.next_int(&self) @dynamic
```
```c3
fn uint128 Mcg64Random.next_int128(&self) @dynamic
```
```c3
fn ulong Mcg64Random.next_long(&self) @dynamic
```
```c3
fn ushort Mcg64Random.next_short(&self) @dynamic
```
```c3
fn char Mcg64Random.next_byte(&self) @dynamic
```
```c3
typedef Mcg32Random (Random) = uint
```
```c3
fn void Mcg32Random.set_seed(&self, char[] seed) @dynamic
```
```c3
fn ushort Mcg32Random.next_short(&self) @dynamic
```

```c3
<*
 @require bytes.len > 0
*>
```
```c3
fn void Mcg32Random.next_bytes(&self, char[] bytes) @dynamic
```
```c3
fn uint128 Mcg32Random.next_int128(&self) @dynamic
```
```c3
fn ulong Mcg32Random.next_long(&self) @dynamic
```
```c3
fn uint Mcg32Random.next_int(&self) @dynamic
```
```c3
fn char Mcg32Random.next_byte(&self) @dynamic
```
```c3
typedef Mcg16Random (Random) = ushort
```
```c3
fn void Mcg16Random.set_seed(&self, char[] seed) @dynamic
```
```c3
fn char Mcg16Random.next_byte(&self) @dynamic
```
```c3
fn void Mcg16Random.next_bytes(&self, char[] bytes) @dynamic
```
```c3
fn uint128 Mcg16Random.next_int128(&self) @dynamic
```
```c3
fn ulong Mcg16Random.next_long(&self) @dynamic
```
```c3
fn uint Mcg16Random.next_int(&self) @dynamic
```
```c3
fn ushort Mcg16Random.next_short(&self) @dynamic
```
```c3
struct Msws128Random (Random)
```
```c3
fn void Msws128Random.set_seed(&self, char[] input) @dynamic
```
```c3
fn uint128 Msws128Random.next_int128(&self) @dynamic
```

```c3
<*
 @require bytes.len > 0
*>
```
```c3
fn void Msws128Random.next_bytes(&self, char[] bytes) @dynamic
```
```c3
fn ulong Msws128Random.next_long(&self) @dynamic
```
```c3
fn uint Msws128Random.next_int(&self) @dynamic
```
```c3
fn ushort Msws128Random.next_short(&self) @dynamic
```
```c3
fn char Msws128Random.next_byte(&self) @dynamic
```
```c3
struct Msws64Random (Random)
```
```c3
fn void  Msws64Random.set_seed(&self, char[] input) @dynamic
```
```c3
fn ulong Msws64Random.next_long(&self) @dynamic
```

```c3
<*
 @require bytes.len > 0
*>
```
```c3
fn void Msws64Random.next_bytes(&self, char[] bytes) @dynamic
```
```c3
fn uint128 Msws64Random.next_int128(&self) @dynamic
```
```c3
fn uint Msws64Random.next_int(&self) @dynamic
```
```c3
fn ushort Msws64Random.next_short(&self) @dynamic
```
```c3
fn char Msws64Random.next_byte(&self) @dynamic
```
```c3
struct Msws32Random (Random)
```
```c3
fn void  Msws32Random.set_seed(&self, char[] input) @dynamic
```
```c3
fn uint Msws32Random.next_int(&self) @dynamic
```

```c3
<*
 @require bytes.len > 0
*>
```
```c3
fn void Msws32Random.next_bytes(&self, char[] bytes) @dynamic
```
```c3
fn uint128 Msws32Random.next_int128(&self) @dynamic
```
```c3
fn ulong Msws32Random.next_long(&self) @dynamic
```
```c3
fn ushort Msws32Random.next_short(&self) @dynamic
```
```c3
fn char Msws32Random.next_byte(&self) @dynamic
```
```c3
struct Msws16Random (Random)
```
```c3
fn void  Msws16Random.set_seed(&self, char[] input) @dynamic
```
```c3
fn ushort Msws16Random.next_short(&self) @dynamic
```

```c3
<*
 @require bytes.len > 0
*>
```
```c3
fn void Msws16Random.next_bytes(&self, char[] bytes) @dynamic
```
```c3
fn uint128 Msws16Random.next_int128(&self) @dynamic
```
```c3
fn ulong Msws16Random.next_long(&self) @dynamic
```
```c3
fn uint Msws16Random.next_int(&self) @dynamic
```
```c3
fn char Msws16Random.next_byte(&self) @dynamic
```
```c3
struct Msws8Random (Random)
```
```c3
fn void  Msws8Random.set_seed(&self, char[] input) @dynamic
```
```c3
fn char Msws8Random.next_byte(&self) @dynamic
```
```c3
fn void Msws8Random.next_bytes(&self, char[] bytes) @dynamic
```
```c3
fn uint128 Msws8Random.next_int128(&self) @dynamic
```
```c3
fn ulong Msws8Random.next_long(&self) @dynamic
```
```c3
fn uint Msws8Random.next_int(&self) @dynamic
```
```c3
fn ushort Msws8Random.next_short(&self) @dynamic
```
```c3
typedef Pcg128Random (Random) = uint128
```
```c3
fn void  Pcg128Random.set_seed(&self, char[] input) @dynamic
```
```c3
fn ulong Pcg128Random.next_long(&self) @dynamic
```

```c3
<*
 @require bytes.len > 0
*>
```
```c3
fn void Pcg128Random.next_bytes(&self, char[] bytes) @dynamic
```
```c3
fn uint128 Pcg128Random.next_int128(&self) @dynamic
```
```c3
fn uint Pcg128Random.next_int(&self) @dynamic
```
```c3
fn ushort Pcg128Random.next_short(&self) @dynamic
```
```c3
fn char Pcg128Random.next_byte(&self) @dynamic
```
```c3
typedef Pcg64Random (Random) = ulong
```
```c3
fn void Pcg64Random.set_seed(&self, char[] input) @dynamic
```
```c3
fn uint Pcg64Random.next_int(&self) @dynamic
```

```c3
<*
 @require bytes.len > 0
*>
```
```c3
fn void Pcg64Random.next_bytes(&self, char[] bytes) @dynamic
```
```c3
fn uint128 Pcg64Random.next_int128(&self) @dynamic
```
```c3
fn ulong Pcg64Random.next_long(&self) @dynamic
```
```c3
fn ushort Pcg64Random.next_short(&self) @dynamic
```
```c3
fn char Pcg64Random.next_byte(&self) @dynamic
```
```c3
typedef Pcg32Random (Random) = uint
```
```c3
fn void Pcg32Random.set_seed(&self, char[] input) @dynamic
```
```c3
fn ushort Pcg32Random.next_short(&self) @dynamic
```

```c3
<*
 @require bytes.len > 0
*>
```
```c3
fn void Pcg32Random.next_bytes(&self, char[] bytes) @dynamic
```
```c3
fn uint128 Pcg32Random.next_int128(&self) @dynamic
```
```c3
fn ulong Pcg32Random.next_long(&self) @dynamic
```
```c3
fn uint Pcg32Random.next_int(&self) @dynamic
```
```c3
fn char Pcg32Random.next_byte(&self) @dynamic
```
```c3
typedef Pcg16Random (Random) = ushort
```
```c3
fn void Pcg16Random.set_seed(&self, char[] input) @dynamic
```
```c3
fn char Pcg16Random.next_byte(&self) @dynamic
```
```c3
fn void Pcg16Random.next_bytes(&self, char[] bytes) @dynamic
```
```c3
fn uint128 Pcg16Random.next_int128(&self) @dynamic
```
```c3
fn ulong Pcg16Random.next_long(&self) @dynamic
```
```c3
fn uint Pcg16Random.next_int(&self) @dynamic
```
```c3
fn ushort Pcg16Random.next_short(&self) @dynamic
```
```c3
macro make_seed($Type, char[] input)
```

```c3
<*
 @param [in] input
 @param [inout] out_buffer
*>
```
```c3
fn void seeder(char[] input, char[] out_buffer)
```
```c3
fn char[8 * 4] entropy() @if(!env::WASM_NOLIBC)
```
```c3
fn char[8 * 4] entropy() @if(env::WASM_NOLIBC)
```
```c3
typedef Sfc128Random (Random) = uint128[4]
```
```c3
fn void Sfc128Random.set_seed(&self, char[] input) @dynamic
```
```c3
fn uint128 Sfc128Random.next_int128(&self) @dynamic
```

```c3
<*
 @require bytes.len > 0
*>
```
```c3
fn void Sfc128Random.next_bytes(&self, char[] bytes) @dynamic
```
```c3
fn ulong Sfc128Random.next_long(&self) @dynamic
```
```c3
fn uint Sfc128Random.next_int(&self) @dynamic
```
```c3
fn ushort Sfc128Random.next_short(&self) @dynamic
```
```c3
fn char Sfc128Random.next_byte(&self) @dynamic
```
```c3
typedef Sfc64Random (Random) = ulong[4]
```
```c3
fn void  Sfc64Random.set_seed(&self, char[] input) @dynamic
```
```c3
fn ulong Sfc64Random.next_long(&self) @dynamic
```

```c3
<*
 @require bytes.len > 0
*>
```
```c3
fn void Sfc64Random.next_bytes(&self, char[] bytes) @dynamic
```
```c3
fn uint128 Sfc64Random.next_int128(&self) @dynamic
```
```c3
fn uint Sfc64Random.next_int(&self) @dynamic
```
```c3
fn ushort Sfc64Random.next_short(&self) @dynamic
```
```c3
fn char Sfc64Random.next_byte(&self) @dynamic
```
```c3
typedef Sfc32Random (Random) = uint[4]
```
```c3
fn void  Sfc32Random.set_seed(&self, char[] input) @dynamic
```
```c3
fn uint Sfc32Random.next_int(&sfc) @dynamic
```

```c3
<*
 @require bytes.len > 0
*>
```
```c3
fn void Sfc32Random.next_bytes(&self, char[] bytes) @dynamic
```
```c3
fn uint128 Sfc32Random.next_int128(&self) @dynamic
```
```c3
fn ulong Sfc32Random.next_long(&self) @dynamic
```
```c3
fn ushort Sfc32Random.next_short(&self) @dynamic
```
```c3
fn char Sfc32Random.next_byte(&self) @dynamic
```
```c3
typedef Sfc16Random (Random) = ushort[4]
```
```c3
fn void  Sfc16Random.set_seed(&self, char[] input) @dynamic
```
```c3
fn ushort Sfc16Random.next_short(&seed) @dynamic
```

```c3
<*
 @require bytes.len > 0
*>
```
```c3
fn void Sfc16Random.next_bytes(&self, char[] bytes) @dynamic
```
```c3
fn uint128 Sfc16Random.next_int128(&self) @dynamic
```
```c3
fn ulong Sfc16Random.next_long(&self) @dynamic
```
```c3
fn uint Sfc16Random.next_int(&self) @dynamic
```
```c3
fn char Sfc16Random.next_byte(&self) @dynamic
```
```c3
typedef Sfc8Random (Random) = char[4]
```
```c3
fn void  Sfc8Random.set_seed(&self, char[] input) @dynamic
```
```c3
fn char Sfc8Random.next_byte(&self) @dynamic
```
```c3
fn void Sfc8Random.next_bytes(&self, char[] bytes) @dynamic
```
```c3
fn uint128 Sfc8Random.next_int128(&self) @dynamic
```
```c3
fn ulong Sfc8Random.next_long(&self) @dynamic
```
```c3
fn uint Sfc8Random.next_int(&self) @dynamic
```
```c3
fn ushort Sfc8Random.next_short(&self) @dynamic
```
```c3
typedef SimpleRandom (Random) = ulong
```
```c3
fn void SimpleRandom.set_seed(&self, char[] seed) @dynamic
```
```c3
fn uint SimpleRandom.next_int(&self) @dynamic
```

```c3
<*
 @require bytes.len > 0
*>
```
```c3
fn void SimpleRandom.next_bytes(&self, char[] bytes) @dynamic
```
```c3
fn uint128 SimpleRandom.next_int128(&self) @dynamic
```
```c3
fn ulong SimpleRandom.next_long(&self) @dynamic
```
```c3
fn ushort SimpleRandom.next_short(&self) @dynamic
```
```c3
fn char SimpleRandom.next_byte(&self) @dynamic
```
### `std::math::uuid`
```c3
typedef Uuid (Printable) = char[16]
```

Generate a version 4 UUID from the default random.
```c3
fn Uuid generate()
```

Generate a version 4 UUID from the given random.
```c3
fn Uuid generate_from_random(Random random)
```
```c3
fn usz? Uuid.to_format(&self, Formatter* formatter) @dynamic
```
```c3
fn String Uuid.to_string(&self, Allocator allocator)
```
### `std::math::vector`
```c3
macro double[<*>].sq_magnitude(self)
```
```c3
macro float[<*>].sq_magnitude(self)
```
```c3
macro double[<*>].distance_sq(self, double[<*>] v2)
```
```c3
macro float[<*>].distance_sq(self, float[<*>] v2)
```
```c3
macro float[<2>].transform(self, Matrix4f mat)
```
```c3
macro float[<2>].rotate(self, float angle)
```
```c3
macro float[<2>].angle(self, float[<2>] v2)
```
```c3
macro double[<2>].transform(self, Matrix4 mat)
```
```c3
macro double[<2>].rotate(self, double angle)
```
```c3
macro double[<2>].angle(self, double[<2>] v2)
```
```c3
macro float[<*>].clamp_mag(self, float min, float max)
```
```c3
macro double[<*>].clamp_mag(self, double min, double max)
```
```c3
macro float[<*>].towards(self, float[<*>] target, float max_distance)
```
```c3
macro double[<*>].towards(self, double[<*>] target, double max_distance)
```
```c3
fn float[<3>] float[<3>].cross(self, float[<3>] v2)
```
```c3
fn double[<3>] double[<3>].cross(self, double[<3>] v2)
```
```c3
fn float[<3>] float[<3>].perpendicular(self)
```
```c3
fn double[<3>] double[<3>].perpendicular(self)
```
```c3
fn float[<3>] float[<3>].barycenter(self, float[<3>] a, float[<3>] b, float[<3>] c)
```
```c3
fn double[<3>] double[<3>].barycenter(self, double[<3>] a, double[<3>] b, double[<3>] c)
```
```c3
fn float[<3>] float[<3>].transform(self, Matrix4f mat)
```
```c3
fn double[<3>] double[<3>].transform(self, Matrix4 mat)
```
```c3
fn float float[<3>].angle(self, float[<3>] v2)
```
```c3
fn double double[<3>].angle(self, double[<3>] v2)
```
```c3
fn float[<3>] float[<3>].refract(self, float[<3>] n, float r)
```
```c3
fn double[<3>] double[<3>].refract(self, double[<3>] n, double r)
```
```c3
fn float[<3>] float[<3>].rotate_quat(self, Quaternionf q)
```
```c3
fn double[<3>] double[<3>].rotate_quat(self, Quaternion q)
```
```c3
fn float[<3>] float[<3>].rotate_axis(self, float[<3>] axis, float angle)
```
```c3
fn double[<3>] double[<3>].rotate_axis(self, double[<3>] axis, double angle)
```
```c3
fn float[<3>] float[<3>].unproject(self, Matrix4f projection, Matrix4f view)
```
```c3
fn double[<3>] double[<3>].unproject(self, Matrix4 projection, Matrix4 view)
```
```c3
fn void ortho_normalize(float[<3>]* v1, float[<3>]* v2)
```
```c3
fn void ortho_normalized(double[<3>]* v1, double[<3>]* v2)
```
### `std::net`
```c3
enum IpProtocol : char (AIFamily ai_family)
```
```c3
struct InetAddress (Printable)
```
```c3
fn usz? InetAddress.to_format(InetAddress* addr, Formatter* formatter) @dynamic
```
```c3
fn String InetAddress.to_string(&self, Allocator allocator)
```
```c3
fn String InetAddress.to_tstring(&self)
```
```c3
fn InetAddress? ipv6_from_str(String s)
```
```c3
fn InetAddress? ipv4_from_str(String s)
```
```c3
fn bool InetAddress.is_loopback(InetAddress* addr)
```
```c3
fn bool InetAddress.is_any_local(InetAddress* addr)
```
```c3
fn bool InetAddress.is_link_local(InetAddress* addr)
```
```c3
fn bool InetAddress.is_site_local(InetAddress* addr)
```
```c3
fn bool InetAddress.is_multicast(InetAddress* addr)
```
```c3
fn bool InetAddress.is_multicast_global(InetAddress* addr)
```
```c3
fn bool InetAddress.is_multicast_node_local(InetAddress* addr)
```
```c3
fn bool InetAddress.is_multicast_site_local(InetAddress* addr)
```
```c3
fn bool InetAddress.is_multicast_org_local(InetAddress* addr)
```
```c3
fn bool InetAddress.is_multicast_link_local(InetAddress* addr)
```
```c3
fn AddrInfo*? addrinfo(String host, uint port, AIFamily ai_family, AISockType ai_socktype) @if(os::SUPPORTS_INET)
```
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
```c3
fn uint? ipv4toint(String s)
```
```c3
fn String? int_to_ipv4(uint val, Allocator allocator)
```
### `std::net @if(os::SUPPORTS_INET)`
```c3
struct Socket (InStream, OutStream)
```
```c3
macro void @loop_over_ai(AddrInfo* ai; @body(NativeSocket fd, AddrInfo* ai))
```
```c3
const Duration POLL_FOREVER
```
```c3
typedef PollSubscribes = ushort
```
```c3
typedef PollEvents = ushort
```
```c3
const PollSubscribes SUBSCRIBE_ANY_READ
```
```c3
const PollSubscribes SUBSCRIBE_PRIO_READ
```
```c3
const PollSubscribes SUBSCRIBE_OOB_READ
```
```c3
const PollSubscribes SUBSCRIBE_READ
```
```c3
const PollSubscribes SUBSCRIBE_ANY_WRITE
```
```c3
const PollSubscribes SUBSCRIBE_OOB_WRITE
```
```c3
const PollSubscribes SUBSCRIBE_WRITE
```
```c3
const PollEvents POLL_EVENT_READ_PRIO
```
```c3
const PollEvents POLL_EVENT_READ_OOB
```
```c3
const PollEvents POLL_EVENT_READ
```
```c3
const PollEvents POLL_EVENT_WRITE_OOB
```
```c3
const PollEvents POLL_EVENT_WRITE
```
```c3
const PollEvents POLL_EVENT_DISCONNECT
```
```c3
const PollEvents POLL_EVENT_ERROR
```
```c3
const PollEvents POLL_EVENT_INVALID
```
```c3
struct Poll
```

```c3
<*
 @param [inout] polls
 @param timeout : "duration to poll (clamped to CInt.max ms), or POLL_FOREVER."
*>
```
```c3
fn ulong? poll(Poll[] polls, Duration timeout)
```

```c3
<*
 @param [inout] polls
 @param timeout_ms : "duration to poll in ms or -1. Clamped to CInt.max"
*>
```
```c3
fn ulong? poll_ms(Poll[] polls, long timeout_ms)
```
```c3
macro Socket new_socket(fd, ai)
```
```c3
enum SocketOption : char (CInt value)
```
```c3
fn bool? Socket.get_broadcast(&self)
```
```c3
fn bool? Socket.get_keepalive(&self)
```
```c3
fn bool? Socket.get_reuseaddr(&self)
```
```c3
fn bool? Socket.get_dontroute(&self)
```
```c3
fn bool? Socket.get_oobinline(&self)
```
```c3
fn void? Socket.set_broadcast(&self, bool value)
```
```c3
fn void? Socket.set_keepalive(&self, bool value)
```
```c3
fn void? Socket.set_reuseaddr(&self, bool value)
```
```c3
fn void? Socket.set_dontroute(&self, bool value)
```
```c3
fn void? Socket.set_oobinline(&self, bool value)
```
```c3
fn void? Socket.set_option(&self, SocketOption option, bool value)
```
```c3
fn bool? Socket.get_option(&self, SocketOption option)
```
```c3
fn usz? Socket.read(&self, char[] bytes) @dynamic
```
```c3
fn char? Socket.read_byte(&self) @dynamic
```
```c3
fn usz? Socket.write(&self, char[] bytes) @dynamic
```
```c3
fn void? Socket.write_byte(&self, char byte) @dynamic
```
```c3
fn void? Socket.destroy(&self) @dynamic
```
```c3
fn void? Socket.close(&self) @inline @dynamic
```
```c3
fn usz? Socket.peek(&self, char[] bytes) @dynamic
```
```c3
enum SocketShutdownHow : (CInt native_value)
```
```c3
fn void? Socket.shutdown(&self, SocketShutdownHow how)
```
```c3
fn bool last_error_is_delayed_connect()
```
### `std::net::os`
```c3
const bool SUPPORTS_INET
```
```c3
typedef AIFamily = CInt
```
```c3
typedef AIProtocol = CInt
```
```c3
typedef AISockType = CInt
```
```c3
typedef AIFlags = CInt
```
```c3
alias Socklen_t @if(!env::WIN32) = CUInt
```
```c3
alias Socklen_t @if(env::WIN32)  = usz
```
```c3
typedef SockAddrPtr = void*
```
```c3
struct AddrInfo
```
```c3
const PLATFORM_O_NONBLOCK @if(!$defined(PLATFORM_O_NONBLOCK))
```
```c3
const AISockType SOCK_STREAM
```
```c3
const AISockType SOCK_DGRAM
```
```c3
const AISockType SOCK_RAW
```
```c3
const AISockType SOCK_RDM
```
```c3
const AISockType SOCK_SEQPACKET
```
```c3
const AIFlags AI_PASSIVE
```
```c3
const AIFlags AI_CANONNAME
```
```c3
const AIFlags AI_NUMERICHOST
```
```c3
const AIFamily AF_UNSPEC
```
```c3
const AIFamily AF_UNIX
```
```c3
const AIFamily AF_INET
```
```c3
const AIFamily AF_INET6
```
```c3
const AIFamily AF_IPX
```
```c3
const AIFamily AF_APPLETALK
```
```c3
const O_NONBLOCK
```
```c3
extern fn CInt getaddrinfo(ZString nodename, ZString servname, AddrInfo* hints, AddrInfo** res) @if(SUPPORTS_INET)
```
### `std::net::os @if(env::ANDROID)`
```c3
const AIFamily PLATFORM_AF_AX25
```
```c3
const AIFamily PLATFORM_AF_IPX
```
```c3
const AIFamily PLATFORM_AF_APPLETALK
```
```c3
const AIFamily PLATFORM_AF_NETROM
```
```c3
const AIFamily PLATFORM_AF_BRIDGE
```
```c3
const AIFamily PLATFORM_AF_AAL5
```
```c3
const AIFamily PLATFORM_AF_X25
```
```c3
const AIFamily PLATFORM_AF_INET6
```
```c3
const PLATFORM_O_NONBLOCK
```
```c3
const int SOL_SOCKET
```
```c3
const int SO_DEBUG
```
```c3
const int SO_REUSEADDR
```
```c3
const int SO_TYPE
```
```c3
const int SO_ERROR
```
```c3
const int SO_DONTROUTE
```
```c3
const int SO_BROADCAST
```
```c3
const int SO_SNDBUF
```
```c3
const int SO_RCVBUF
```
```c3
const int SO_KEEPALIVE
```
```c3
const int SO_OOBINLINE
```
```c3
const int SO_NO_CHECK
```
```c3
const int SO_PRIORITY
```
```c3
const int SO_LINGER
```
```c3
const int SO_BSDCOMPAT
```
```c3
const int SO_REUSEPORT
```
```c3
const int SO_RCVLOWAT
```
```c3
const int SO_SNDLOWAT
```
```c3
const int SO_RCVTIMEO
```
```c3
const int SO_SNDTIMEO
```
```c3
const int SO_BINDTODEVICE
```
```c3
const int SO_ATTACH_FILTER
```
```c3
const int SO_DETACH_FILTER
```
```c3
const int SO_PEERNAME
```
```c3
const int SO_TIMESTAMP
```
```c3
const int SO_ACCEPTCONN
```
```c3
const int SO_PEERSEC
```
```c3
const int SO_SNDBUFFORCE
```
```c3
const int SO_RCVBUFFORCE
```
```c3
const int SO_PASSSEC
```
```c3
const int SO_MARK
```
```c3
const int SO_PROTOCOL
```
```c3
const int SO_DOMAIN
```
```c3
const int SO_RXQ_OVFL
```
```c3
const int SO_WIFI_STATUS
```
```c3
const int SO_PEEK_OFF
```
```c3
const int SO_NOFCS
```
```c3
const int SO_LOCK_FILTER
```
```c3
const int SO_SELECT_ERR_QUEUE
```
```c3
const int SO_BUSY_POLL
```
```c3
const int SO_MAX_PACING_RATE
```
```c3
const int SO_BPF_EXTENSIONS
```
```c3
const int SO_INCOMING_CPU
```
```c3
const int SO_ATTACH_BPF
```
```c3
const int SO_ATTACH_REUSEPORT_CBPF
```
```c3
const int SO_ATTACH_REUSEPORT_EBPF
```
```c3
const int SO_CNX_ADVICE
```
```c3
const int SO_MEMINFO
```
```c3
const int SO_INCOMING_NAPI_ID
```
```c3
const int SO_COOKIE
```
```c3
const int SO_PEERGROUPS
```
```c3
const int SO_ZEROCOPY
```
```c3
const int SO_TXTIME
```
```c3
const int SO_BINDTOIFINDEX
```
```c3
const int SO_DETACH_REUSEPORT_BPF
```
```c3
const int SO_PREFER_BUSY_POLL
```
```c3
const int SO_BUSY_POLL_BUDGET
```
```c3
const int SO_NETNS_COOKIE
```
```c3
const int SO_BUF_LOCK
```
```c3
const int SO_RESERVE_MEM
```
```c3
const int SO_TXREHASH
```
```c3
const int SO_RCVMARK
```
```c3
const int SO_PASSPIDFD
```
```c3
const int SO_PEERPIDFD
```
```c3
const CUShort POLLRDNORM
```
```c3
const CUShort POLLRDBAND
```
```c3
const CUShort POLLWRNORM
```
```c3
const CUShort POLLWRBAND
```
```c3
const CUShort POLLMSG
```
```c3
const CUShort POLLREMOVE
```
```c3
const CUShort POLLRDHUP
```
```c3
const CUShort POLLFREE
```
```c3
const CUShort POLL_BUSY_LOOP
```
```c3
const CInt MSG_PEEK
```
### `std::net::os @if(env::DARWIN)`
```c3
const AIFlags AI_NUMERICSERV
```
```c3
const AIFlags AI_ALL
```
```c3
const AIFlags AI_V4MAPPED_CFG
```
```c3
const AIFlags AI_ADDRCONFIG
```
```c3
const AIFlags AI_V4MAPPED
```
```c3
const AIFlags AI_UNUSABLE
```
```c3
const AIFlags AI_DEFAULT
```
```c3
const AIFamily PLATFORM_AF_IMPLINK
```
```c3
const AIFamily PLATFORM_AF_PUP
```
```c3
const AIFamily PLATFORM_AF_CHAOS
```
```c3
const AIFamily PLATFORM_AF_NS
```
```c3
const AIFamily PLATFORM_AF_ISO
```
```c3
const AIFamily PLATFORM_AF_ECMA
```
```c3
const AIFamily PLATFORM_AF_DATAKIT
```
```c3
const AIFamily PLATFORM_AF_CCITT
```
```c3
const AIFamily PLATFORM_AF_SNA
```
```c3
const AIFamily PLATFORM_AF_DECNET
```
```c3
const AIFamily PLATFORM_AF_DLI
```
```c3
const AIFamily PLATFORM_AF_LAT
```
```c3
const AIFamily PLATFORM_AF_HYLINK
```
```c3
const AIFamily PLATFORM_AF_APPLETALK
```
```c3
const AIFamily PLATFORM_AF_ROUTE
```
```c3
const AIFamily PLATFORM_AF_LINK
```
```c3
const AIFamily PLATFORM_PSEUDO_AF_XTP
```
```c3
const AIFamily PLATFORM_AF_COIP
```
```c3
const AIFamily PLATFORM_AF_CNT
```
```c3
const AIFamily PLATFORM_PSEUDO_AF_RTIP
```
```c3
const AIFamily PLATFORM_AF_IPX
```
```c3
const AIFamily PLATFORM_AF_SIP
```
```c3
const AIFamily PLATFORM_PSEUDO_AF_PIP
```
```c3
const AIFamily PLATFORM_AF_NDRV
```
```c3
const AIFamily PLATFORM_AF_ISDN
```
```c3
const AIFamily PLATFORM_PSEUDO_AF_KEY
```
```c3
const AIFamily PLATFORM_AF_INET6
```
```c3
const AIFamily PLATFORM_AF_NATM
```
```c3
const AIFamily PLATFORM_AF_SYSTEM
```
```c3
const AIFamily PLATFORM_AF_NETBIOS
```
```c3
const AIFamily PLATFORM_AF_PPP
```
```c3
const AIFamily PLATFORM_PSEUDO_AF_HDRCMPLT
```
```c3
const AIFamily PLATFORM_AF_IEEE80211
```
```c3
const AIFamily PLATFORM_AF_UTUN
```
```c3
const AIFamily PLATFORM_AF_VSOCK
```
```c3
const AIFamily PLATFORM_AF_MAX
```
```c3
const int PLATFORM_O_NONBLOCK
```
```c3
const int SOL_SOCKET
```
```c3
const int SO_DEBUG
```
```c3
const int SO_ACCEPTCONN
```
```c3
const int SO_REUSEADDR
```
```c3
const int SO_KEEPALIVE
```
```c3
const int SO_DONTROUTE
```
```c3
const int SO_BROADCAST
```
```c3
const int SO_USELOOPBACK
```
```c3
const int SO_LINGER
```
```c3
const int SO_OOBINLINE
```
```c3
const int SO_REUSEPORT
```
```c3
const int SO_TIMESTAMP
```
```c3
const int SO_TIMESTAMP_MONOTONIC
```
```c3
const int SO_DONTTRUNC
```
```c3
const int SO_WANTMORE
```
```c3
const int SO_WANTOOBFLAG
```
```c3
const int SO_SNDBUF
```
```c3
const int SO_RCVBUF
```
```c3
const int SO_SNDLOWAT
```
```c3
const int SO_RCVLOWAT
```
```c3
const int SO_SNDTIMEO
```
```c3
const int SO_RCVTIMEO
```
```c3
const int SO_ERROR
```
```c3
const int SO_TYPE
```
```c3
const int SO_LABEL
```
```c3
const int SO_PEERLABEL
```
```c3
const int SO_NREAD
```
```c3
const int SO_NKE
```
```c3
const int SO_NOSIGPIPE
```
```c3
const int SO_NOADDRERR
```
```c3
const int SO_NWRITE
```
```c3
const int SO_REUSESHAREUID
```
```c3
const int SO_LINGER_SEC
```
```c3
const CShort POLLRDNORM
```
```c3
const CShort POLLRDBAND
```
```c3
const CShort POLLWRNORM
```
```c3
const CShort POLLWRBAND
```
```c3
const CShort POLLEXTEND
```
```c3
const CShort POLLATTRIB
```
```c3
const CShort POLLNLINK
```
```c3
const CShort POLLWRITE
```
```c3
const CInt MSG_PEEK
```
### `std::net::os @if(env::LINUX)`
```c3
const AIFamily PLATFORM_AF_AX25
```
```c3
const AIFamily PLATFORM_AF_IPX
```
```c3
const AIFamily PLATFORM_AF_APPLETALK
```
```c3
const AIFamily PLATFORM_AF_NETROM
```
```c3
const AIFamily PLATFORM_AF_BRIDGE
```
```c3
const AIFamily PLATFORM_AF_AAL5
```
```c3
const AIFamily PLATFORM_AF_X25
```
```c3
const AIFamily PLATFORM_AF_INET6
```
```c3
const PLATFORM_O_NONBLOCK
```
```c3
const int SOL_SOCKET
```
```c3
const int SO_DEBUG
```
```c3
const int SO_REUSEADDR
```
```c3
const int SO_TYPE
```
```c3
const int SO_ERROR
```
```c3
const int SO_DONTROUTE
```
```c3
const int SO_BROADCAST
```
```c3
const int SO_SNDBUF
```
```c3
const int SO_RCVBUF
```
```c3
const int SO_KEEPALIVE
```
```c3
const int SO_OOBINLINE
```
```c3
const int SO_NO_CHECK
```
```c3
const int SO_PRIORITY
```
```c3
const int SO_LINGER
```
```c3
const int SO_BSDCOMPAT
```
```c3
const int SO_REUSEPORT
```
```c3
const int SO_RCVLOWAT
```
```c3
const int SO_SNDLOWAT
```
```c3
const int SO_RCVTIMEO
```
```c3
const int SO_SNDTIMEO
```
```c3
const int SO_BINDTODEVICE
```
```c3
const int SO_ATTACH_FILTER
```
```c3
const int SO_DETACH_FILTER
```
```c3
const int SO_PEERNAME
```
```c3
const int SO_TIMESTAMP
```
```c3
const int SO_ACCEPTCONN
```
```c3
const int SO_PEERSEC
```
```c3
const int SO_SNDBUFFORCE
```
```c3
const int SO_RCVBUFFORCE
```
```c3
const int SO_PASSSEC
```
```c3
const int SO_MARK
```
```c3
const int SO_PROTOCOL
```
```c3
const int SO_DOMAIN
```
```c3
const int SO_RXQ_OVFL
```
```c3
const int SO_WIFI_STATUS
```
```c3
const int SO_PEEK_OFF
```
```c3
const int SO_NOFCS
```
```c3
const int SO_LOCK_FILTER
```
```c3
const int SO_SELECT_ERR_QUEUE
```
```c3
const int SO_BUSY_POLL
```
```c3
const int SO_MAX_PACING_RATE
```
```c3
const int SO_BPF_EXTENSIONS
```
```c3
const int SO_INCOMING_CPU
```
```c3
const int SO_ATTACH_BPF
```
```c3
const int SO_ATTACH_REUSEPORT_CBPF
```
```c3
const int SO_ATTACH_REUSEPORT_EBPF
```
```c3
const int SO_CNX_ADVICE
```
```c3
const int SO_MEMINFO
```
```c3
const int SO_INCOMING_NAPI_ID
```
```c3
const int SO_COOKIE
```
```c3
const int SO_PEERGROUPS
```
```c3
const int SO_ZEROCOPY
```
```c3
const int SO_TXTIME
```
```c3
const int SO_BINDTOIFINDEX
```
```c3
const int SO_DETACH_REUSEPORT_BPF
```
```c3
const int SO_PREFER_BUSY_POLL
```
```c3
const int SO_BUSY_POLL_BUDGET
```
```c3
const int SO_NETNS_COOKIE
```
```c3
const int SO_BUF_LOCK
```
```c3
const int SO_RESERVE_MEM
```
```c3
const int SO_TXREHASH
```
```c3
const int SO_RCVMARK
```
```c3
const int SO_PASSPIDFD
```
```c3
const int SO_PEERPIDFD
```
```c3
const CUShort POLLRDNORM
```
```c3
const CUShort POLLRDBAND
```
```c3
const CUShort POLLWRNORM
```
```c3
const CUShort POLLWRBAND
```
```c3
const CUShort POLLMSG
```
```c3
const CUShort POLLREMOVE
```
```c3
const CUShort POLLRDHUP
```
```c3
const CUShort POLLFREE
```
```c3
const CUShort POLL_BUSY_LOOP
```
```c3
const CInt MSG_PEEK
```
### `std::net::os @if(env::OPENBSD)`
```c3
const AIFlags AI_EXT
```
```c3
const AIFlags AI_NUMERICSERV
```
```c3
const AIFlags AI_FQDN
```
```c3
const AIFlags AI_ADDRCONFIG
```
```c3
const AIFamily PLATFORM_AF_LOCAL
```
```c3
const AIFamily PLATFORM_AF_IMPLINK
```
```c3
const AIFamily PLATFORM_AF_PUP
```
```c3
const AIFamily PLATFORM_AF_CHAOS
```
```c3
const AIFamily PLATFORM_AF_NS
```
```c3
const AIFamily PLATFORM_AF_ISO
```
```c3
const AIFamily PLATFORM_AF_OSI
```
```c3
const AIFamily PLATFORM_AF_ECMA
```
```c3
const AIFamily PLATFORM_AF_DATAKIT
```
```c3
const AIFamily PLATFORM_AF_CCITT
```
```c3
const AIFamily PLATFORM_AF_SNA
```
```c3
const AIFamily PLATFORM_AF_DECNET
```
```c3
const AIFamily PLATFORM_AF_DLI
```
```c3
const AIFamily PLATFORM_AF_LAT
```
```c3
const AIFamily PLATFORM_AF_HYLINK
```
```c3
const AIFamily PLATFORM_AF_APPLETALK
```
```c3
const AIFamily PLATFORM_AF_ROUTE
```
```c3
const AIFamily PLATFORM_AF_LINK
```
```c3
const AIFamily PLATFORM_PSEUDO_AF_XTP
```
```c3
const AIFamily PLATFORM_AF_COIP
```
```c3
const AIFamily PLATFORM_AF_CNT
```
```c3
const AIFamily PLATFORM_PSEUDO_AF_RTIP
```
```c3
const AIFamily PLATFORM_AF_IPX
```
```c3
const AIFamily PLATFORM_AF_INET6
```
```c3
const AIFamily PLATFORM_PSEUDO_AF_PIP
```
```c3
const AIFamily PLATFORM_AF_ISDN
```
```c3
const AIFamily PLATFORM_AF_E164
```
```c3
const AIFamily PLATFORM_AF_NATM
```
```c3
const AIFamily PLATFORM_AF_ENCAP
```
```c3
const AIFamily PLATFORM_AF_SIP
```
```c3
const AIFamily PLATFORM_AF_KEY
```
```c3
const AIFamily PLATFORM_PSEUDO_AF_HDRCMPLT
```
```c3
const AIFamily PLATFORM_AF_BLUETOOTH
```
```c3
const AIFamily PLATFORM_AF_MPLS
```
```c3
const AIFamily PLATFORM_PSEUDO_AF_PFLOW
```
```c3
const AIFamily PLATFORM_PSEUDO_AF_PIPEX
```
```c3
const AIFamily PLATFORM_AF_FRAME
```
```c3
const AIFamily PLATFORM_AF_MAX
```
```c3
const int SOL_SOCKET
```
```c3
const int SO_DEBUG
```
```c3
const int SO_ACCEPTCONN
```
```c3
const int SO_REUSEADDR
```
```c3
const int SO_KEEPALIVE
```
```c3
const int SO_DONTROUTE
```
```c3
const int SO_BROADCAST
```
```c3
const int SO_USELOOPBACK
```
```c3
const int SO_LINGER
```
```c3
const int SO_OOBINLINE
```
```c3
const int SO_REUSEPORT
```
```c3
const int SO_TIMESTAMP
```
```c3
const int SO_BINDANY
```
```c3
const int SO_ZEROIZE
```
```c3
const int SO_SNDBUF
```
```c3
const int SO_RCVBUF
```
```c3
const int SO_SNDLOWAT
```
```c3
const int SO_RCVLOWAT
```
```c3
const int SO_SNDTIMEO
```
```c3
const int SO_RCVTIMEO
```
```c3
const int SO_ERROR
```
```c3
const int SO_TYPE
```
```c3
const int SO_NETPROC
```
```c3
const int SO_RTABLE
```
```c3
const int SO_PEERCRED
```
```c3
const int SO_SPLICE
```
```c3
const int SO_DOMAIN
```
```c3
const int SO_PROTOCOL
```
```c3
const CUShort POLLRDNORM
```
```c3
const CUShort POLLNORM
```
```c3
const CUShort POLLWRNORM
```
```c3
const CUShort POLLRDBAND
```
```c3
const CUShort POLLWRBAND
```
```c3
const CInt MSG_OOB
```
```c3
const CInt MSG_PEEK
```
```c3
const CInt MSG_DONTROUTE
```
```c3
const CInt MSG_EOR
```
```c3
const CInt MSG_TRUNC
```
```c3
const CInt MSG_CTRUNC
```
```c3
const CInt MSG_WAITALL
```
```c3
const CInt MSG_DONTWAIT
```
```c3
const CInt MSG_BCAST
```
```c3
const CInt MSG_MCAST
```
```c3
const CInt MSG_NOSIGNAL
```
```c3
const CInt MSG_CMSG_CLOEXEC
```
```c3
const CInt MSG_WAITFORONE
```
```c3
const SOCK_CLOEXEC
```
```c3
const SOCK_NONBLOCK
```
```c3
const SOCK_NONBLOCK_INHERIT
```
```c3
const SOCK_DNS
```
```c3
const PLATFORM_O_NONBLOCK
```
### `std::net::os @if(env::POSIX && SUPPORTS_INET)`
```c3
const int F_GETFL
```
```c3
const int F_SETFL
```
```c3
typedef NativeSocket = inline Fd
```
```c3
struct Posix_pollfd
```
```c3
alias Posix_nfds_t = CUInt
```
```c3
extern fn CInt connect(NativeSocket socket, SockAddrPtr address, Socklen_t address_len)
```
```c3
fn fault socket_error()
```
```c3
macro bool NativeSocket.is_valid(self)
```
```c3
macro void? NativeSocket.close(self)
```
```c3
macro void? NativeSocket.set_non_blocking(self, bool non_blocking)
```
```c3
macro bool NativeSocket.is_non_blocking(self)
```
### `std::net::os @if(env::WIN32)`
```c3
const AIFamily PLATFORM_AF_IPX
```
```c3
const AIFamily PLATFORM_AF_APPLETALK
```
```c3
const AIFamily PLATFORM_AF_NETBIOS
```
```c3
const AIFamily PLATFORM_AF_INET6
```
```c3
const AIFamily PLATFORM_AF_IRDA
```
```c3
const AIFamily PLATFORM_AF_BTH
```
```c3
const int FIONREAD
```
```c3
const int FIONBIO
```
```c3
const int FIOASYNC
```
```c3
typedef NativeSocket = inline Win32_SOCKET
```
```c3
extern fn CInt ioctlsocket(NativeSocket, CLong cmd, CULong *argp)
```
```c3
fn void? NativeSocket.set_non_blocking(self, bool non_blocking)
```
```c3
macro void? NativeSocket.close(self)
```
```c3
const int SOL_SOCKET
```
```c3
const int SO_DEBUG
```
```c3
const int SO_ACCEPTCONN
```
```c3
const int SO_REUSEADDR
```
```c3
const int SO_KEEPALIVE
```
```c3
const int SO_DONTROUTE
```
```c3
const int SO_BROADCAST
```
```c3
const int SO_USELOOPBACK
```
```c3
const int SO_LINGER
```
```c3
const int SO_OOBINLINE
```
```c3
const int SO_SNDBUF
```
```c3
const int SO_RCVBUF
```
```c3
const int SO_SNDLOWAT
```
```c3
const int SO_RCVLOWAT
```
```c3
const int SO_SNDTIMEO
```
```c3
const int SO_RCVTIMEO
```
```c3
const int SO_ERROR
```
```c3
const int SO_TYPE
```
```c3
fn fault convert_error(WSAError error)
```
```c3
fn fault socket_error()
```
```c3
const CUShort POLLIN
```
```c3
const CUShort POLLPRI
```
```c3
const CUShort POLLOUT
```
```c3
const CUShort POLLERR
```
```c3
const CUShort POLLHUP
```
```c3
const CUShort POLLNVAL
```
```c3
const CUShort POLLRDNORM
```
```c3
const CUShort POLLRDBAND
```
```c3
const CUShort POLLWRNORM
```
```c3
const CUShort POLLWRBAND
```
```c3
const int MSG_PEEK
```
### `std::net::tcp @if(os::SUPPORTS_INET)`
```c3
typedef TcpSocket = inline Socket
```
```c3
typedef TcpServerSocket = inline Socket
```
```c3
fn TcpSocket? connect(String host, uint port, Duration timeout = time::DURATION_ZERO, SocketOption... options, IpProtocol ip_protocol = UNSPECIFIED)
```
```c3
fn TcpSocket? connect_async(String host, uint port, SocketOption... options, IpProtocol ip_protocol = UNSPECIFIED)
```
```c3
fn TcpSocket? connect_to(AddrInfo* ai, SocketOption... options)
```
```c3
fn TcpSocket? connect_async_to(AddrInfo* ai, SocketOption... options)
```
```c3
fn TcpServerSocket? listen(String host, uint port, uint backlog, SocketOption... options, IpProtocol ip_protocol = UNSPECIFIED)
```
```c3
fn TcpSocket? accept(TcpServerSocket* server_socket)
```
```c3
fn TcpServerSocket? listen_to(AddrInfo* ai, uint backlog, SocketOption... options)
```
### `std::net::udp @if(os::SUPPORTS_INET)`
```c3
typedef UdpSocket = inline Socket
```
```c3
fn UdpSocket? connect(String host, uint port, SocketOption... options, IpProtocol ip_protocol = UNSPECIFIED)
```
```c3
fn UdpSocket? connect_to(AddrInfo* ai, SocketOption... options)
```
```c3
fn UdpSocket? connect_async(String host, uint port, SocketOption... options, IpProtocol ip_protocol = UNSPECIFIED)
```
```c3
fn UdpSocket? connect_async_to(AddrInfo* ai, SocketOption... options)
```
### `std::net::url`
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
```c3
struct Url(Printable)
```

Parse a URL string into a Url struct.
```c3
<*
 @param [in] url_string
 @require url_string.len > 0 : "the url_string must be len 1 or more"
 @return "the parsed Url"
*>
```
```c3
fn Url? tparse(String url_string)
```

Parse a URL string into a Url struct.
```c3
<*
 @param [in] url_string
 @require url_string.len > 0 : "the url_string must be len 1 or more"
 @return "the parsed Url"
*>
```
```c3
fn Url? parse(Allocator allocator, String url_string)
```
```c3
fn usz? Url.to_format(&self, Formatter* f) @dynamic
```
```c3
fn String Url.to_string(&self, Allocator allocator)
```
```c3
alias UrlQueryValueList = List{String}
```
```c3
struct UrlQueryValues
```

Parse the query parameters of the Url into a UrlQueryValues map.
```c3
<*
 @param [in] query
 @return "a UrlQueryValues HashMap"
*>
```
```c3
fn UrlQueryValues parse_query_to_temp(String query)
```

Parse the query parameters of the Url into a UrlQueryValues map.
```c3
<*
 @param [in] query
 @param [inout] allocator
 @return "a UrlQueryValues HashMap"
*>
```
```c3
fn UrlQueryValues parse_query(Allocator allocator, String query)
```

Add copies of the key and value strings to the UrlQueryValues map. These
copies are freed when the UrlQueryValues map is freed.
```c3
<*
 @param [in] self
 @param key
 @param value
 @return "a UrlQueryValues map"
*>
```
```c3
fn UrlQueryValues* UrlQueryValues.add(&self, String key, String value)
```
```c3
fn usz? UrlQueryValues.to_format(&self, Formatter* f) @dynamic
```
```c3
fn void UrlQueryValues.free(&self)
```

Free an Url struct.
```c3
<*
 @param [in] self
*>
```
```c3
fn void Url.free(&self)
```
```c3
enum UrlEncodingMode : char (String allowed)
```
```c3
faultdef INVALID_HEX
```

Calculate the length of the percent-encoded string.
```c3
fn usz encode_len(String s, UrlEncodingMode mode) @inline
```

Encode the string s for a given encoding mode.
Returned string must be freed.
```c3
<*
 @param s : "String to encode"
 @param mode : "Url encoding mode"
 @param [inout] allocator
 @return "Percent-encoded String"
*>
```
```c3
fn String encode(Allocator allocator, String s, UrlEncodingMode mode)
```

Encode string s for a given encoding mode, stored on the temp allocator.
```c3
<*
 @param s : "String to encode"
 @param mode : "Url encoding mode"
 @return "Percent-encoded String"
*>
```
```c3
fn String tencode(String s, UrlEncodingMode mode)
```

Calculate the length of the percent-decoded string.
```c3
<*
 @return? INVALID_HEX
*>
```
```c3
fn usz? decode_len(String s, UrlEncodingMode mode) @inline
```

Decode string s for a given encoding mode.
Returned string must be freed.
```c3
<*
 @param s : "String to decode"
 @param mode : "Url encoding mode"
 @param [inout] allocator
 @return "Percent-decoded String"
*>
```
```c3
fn String? decode(Allocator allocator, String s, UrlEncodingMode  mode)
```

Decode string s for a given encoding mode, stored on the temp allocator.
```c3
<*
 @param s : "String to decode"
 @param mode : "Url encoding mode"
 @return "Percent-decoded String"
*>
```
```c3
fn String? tdecode(String s, UrlEncodingMode  mode)
```
### `std::os`

Exit the process with a given exit code. This will typically call 'exit' in LibC
```c3
fn void exit(int result) @weak @noreturn
```

Exit the process with a given exit code. This will typically call '_Exit' in LibC
usually bypassing '@finalizer' functions.
```c3
fn void fastexit(int result) @weak @noreturn
```
### `std::os @if(env::DARWIN)`
```c3
fn uint num_cpu()
```
### `std::os @if(env::LINUX)`
```c3
fn uint num_cpu()
```
### `std::os @if(env::WIN32)`
```c3
fn uint num_cpu()
```
### `std::os::android @if(env::ANDROID)`
```c3
enum LogPriority : (CInt val)
```
```c3
enum LogId : (CInt val)
```
```c3
struct LogMessage @packed
```
```c3
extern fn CInt log_write(LogPriority prio, ZString tag, ZString text) @extern("__android_log_write")
```
```c3
extern fn CInt log_buf_write(CInt bufID, CInt prio, ZString tag, ZString text) @extern("__android_log_buf_write")
```
### `std::os::backtrace`
```c3
faultdef SEGMENT_NOT_FOUND, EXECUTABLE_PATH_NOT_FOUND, IMAGE_NOT_FOUND, NO_BACKTRACE_SYMBOLS,
         RESOLUTION_FAILED
```
```c3
const Backtrace BACKTRACE_UNKNOWN
```
```c3
struct Backtrace (Printable)
```
```c3
fn bool Backtrace.has_file(&self)
```
```c3
fn bool Backtrace.is_unknown(&self)
```
```c3
fn usz? Backtrace.to_format(&self, Formatter* formatter) @dynamic
```
```c3
fn void Backtrace.free(&self)
```
```c3
fn Backtrace* Backtrace.init(&self, Allocator allocator, uptr offset, String function, String object_file, String file = "", uint line = 0)
```
```c3
fn void*[] capture_current(void*[] buffer)
```
```c3
alias BacktraceList = List{Backtrace}
```
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
```c3
const CTL_UNSPEC
```
```c3
const CTL_KERN
```
```c3
const CTL_VM
```
```c3
const CTL_VFS
```
```c3
const CTL_NET
```
```c3
const CTL_DEBUG
```
```c3
const CTL_HW
```
```c3
const CTL_MACHDEP
```
```c3
const CTL_USER
```
```c3
const CTL_MAXID
```
```c3
const HW_MACHINE
```
```c3
const HW_MODEL
```
```c3
const HW_NCPU
```
```c3
const HW_BYTEORDER
```
```c3
const HW_PHYSMEM
```
```c3
const HW_USERMEM
```
```c3
const HW_PAGESIZE
```
```c3
const HW_DISKNAMES
```
```c3
const HW_DISKSTATS
```
```c3
const HW_EPOCH
```
```c3
const HW_FLOATINGPT
```
```c3
const HW_MACHINE_ARCH
```
```c3
const HW_VECTORUNIT
```
```c3
const HW_BUS_FREQ
```
```c3
const HW_CPU_FREQ
```
```c3
const HW_CACHELINE
```
```c3
const HW_L1ICACHESIZE
```
```c3
const HW_L1DCACHESIZE
```
```c3
const HW_L2SETTINGS
```
```c3
const HW_L2CACHESIZE
```
```c3
const HW_L3SETTINGS
```
```c3
const HW_L3CACHESIZE
```
```c3
const HW_MAXID
```
```c3
extern fn CInt sysctl(CInt *name, CUInt namelen, void *oldp, usz *oldlenp, void *newp, usz newlen)
```
```c3
struct Darwin_segment_command_64
```
```c3
struct Darwin_mach_timebase_info
```
```c3
alias Darwin_mach_timebase_info_t = Darwin_mach_timebase_info
```
```c3
alias Darwin_mach_timebase_info_data_t = Darwin_mach_timebase_info
```
```c3
extern fn void mach_timebase_info(Darwin_mach_timebase_info_data_t* timebase)
```
```c3
fn BacktraceList? symbolize_backtrace(Allocator allocator, void*[] backtrace)
```
```c3
extern fn usz malloc_size(void* ptr)
```
### `std::os::darwin::cocoa @if(env::OS_TYPE == MACOS) @link("Cocoa.framework")`
```c3
extern fn int nsApplicationMain(int argc, char **argv) @extern("NSApplicationMain")
```
### `std::os::env`

```c3
<*
 @param [in] name
 @require name.len > 0
 @return? NOT_FOUND
*>
```
```c3
fn String? get_var(Allocator allocator, String name)
```
```c3
fn String? tget_var(String name)
```

```c3
<*
 @param [in] name
 @param [in] value
 @require name.len > 0
*>
```
```c3
fn bool set_var(String name, String value, bool overwrite = true)
```

Returns the current user's home directory.
```c3
fn String? get_home_dir(Allocator allocator)
```

Returns the current user's config directory.
```c3
fn Path? get_config_dir(Allocator allocator)
```

```c3
<*
 @param [in] name
 @require name.len > 0
*>
```
```c3
fn bool clear_var(String name)
```
```c3
fn String? executable_path()
```
### `std::os::freebsd @if(env::FREEBSD)`
### `std::os::linux @if(env::LINUX)`
```c3
extern fn usz malloc_usable_size(void* ptr)
```
```c3
extern fn isz readlink(ZString path, char* buf, usz bufsize)
```
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
```c3
extern fn CInt dladdr(void* addr, Linux_Dl_info* info)
```
```c3
alias Dl_iterate_phdr_callback64 = fn CInt(Linux_dl_phdr_info_64*, usz, void*)
```
```c3
alias Dl_iterate_phdr_callback32 = fn CInt(Linux_dl_phdr_info_32*, usz, void*)
```
```c3
extern fn CInt dl_iterate_phdr64(Dl_iterate_phdr_callback64 callback, void* data)
```
```c3
struct Linux_dl_phdr_info_32
```
```c3
fn Backtrace? backtrace_line_parse(Allocator allocator, String string, String obj_name, String func_name, bool is_inlined)
```
```c3
fn BacktraceList? symbolize_backtrace(Allocator allocator, void*[] backtrace)
```
### `std::os::macos::cf @if(env::DARWIN) @link(env::DARWIN, "CoreFoundation.framework")`
```c3
typedef CFAllocatorRef = void*
```
```c3
typedef CFAllocatorContextRef = void*
```
```c3
alias CFOptionFlags = usz
```
```c3
macro CFAllocatorRef default_allocator()
```
```c3
macro void CFAllocatorRef.dealloc(CFAllocatorRef allocator, void* ptr)
```
```c3
macro void* CFAllocatorRef.alloc(CFAllocatorRef allocator, usz size)
```
```c3
macro usz CFAllocatorRef.get_preferred_size(CFAllocatorRef allocator, usz req_size)
```
```c3
macro void CFAllocatorRef.set_default(CFAllocatorRef allocator)
```
```c3
extern fn CFAllocatorRef macos_CFAllocatorCreate(CFAllocatorRef allocator, CFAllocatorContextRef context) @extern("CFAllocatorCreate") @builtin
```
```c3
typedef CFArrayRef = void*
```
```c3
typedef CFArrayCallBacksRef = void*
```
```c3
typedef CFMutableArrayRef = void*
```
```c3
extern fn CFArrayRef macos_CFArrayCreate(CFAllocatorRef allocator, void** values, CFIndex num_values, CFArrayCallBacksRef callBacks) @extern("CFArrayCreate") @builtin
```
```c3
typedef CFTypeRef = void*
```
```c3
alias CFIndex = isz
```
```c3
struct CFRange
```
```c3
extern fn CFTypeRef macos_CFRetain(CFTypeRef cf) @extern("CFRetain") @builtin
```
### `std::os::macos::objc @if(env::DARWIN) @link(env::DARWIN, "CoreFoundation.framework")`
```c3
typedef ObjcClass = void*
```
```c3
typedef ObjcMethod = void*
```
```c3
typedef ObjcIvar = void*
```
```c3
typedef ObjcSelector = void*
```
```c3
alias ObjcId = void*
```
```c3
alias SendVoid = fn void*(void*, ObjcSelector)
```
```c3
faultdef CLASS_NOT_FOUND, UNKNOWN_EVENT
```
```c3
macro ZString ObjcClass.name(ObjcClass cls)
```
```c3
macro ObjcClass ObjcClass.superclass(ObjcClass cls)
```
```c3
macro bool ObjcClass.responds_to(ObjcClass cls, ObjcSelector sel)
```
```c3
macro ObjcMethod ObjcClass.method(ObjcClass cls, ObjcSelector name)
```
```c3
macro bool ObjcSelector.equals(ObjcSelector a, ObjcSelector b)
```
```c3
macro bool ObjcClass.equals(ObjcClass a, ObjcClass b)
```
```c3
fn ObjcId alloc(ObjcClass cls)
```
```c3
fn void release(ObjcId id)
```
```c3
macro ObjcClass? class_by_name(ZString c)
```
```c3
macro ObjcClass[] class_get_list(Allocator allocator)
```
```c3
extern fn void msgSend(...) @extern("objc_msgSend") @builtin
```
```c3
extern fn ObjcClass getClass(ZString name) @extern("objc_getClass")
```
```c3
enum ApplicationActivationPolicy : (int val)
```
```c3
enum WindowStyleMask : (int val)
```
```c3
enum BackingStore : (int val)
```
```c3
enum EventType : (long val)
```
```c3
fn EventType? event_type_from(int val)
```
```c3
enum EventMask : (long val)
```
```c3
enum EventModifierFlag : (int val)
```
### `std::os::netbsd @if(env::NETBSD)`
### `std::os::openbsd @if(env::OPENBSD)`
```c3
extern fn ZString* backtrace_symbols_fmt(void **addrlist, usz len, ZString fmt)
```
```c3
fn BacktraceList? symbolize_backtrace(Allocator allocator, void*[] backtrace)
```
### `std::os::posix @if(env::POSIX)`
```c3
extern fn CInt clock_gettime(int type, TimeSpec *time)
```
```c3
alias Mode_t = uint
```
```c3
typedef DIRPtr = void*
```
```c3
struct Posix_dirent
```
```c3
extern fn int rmdir(ZString)
```
```c3
extern fn CLong sysconf(CInt name)
```
```c3
extern fn CInt posix_memalign(void **memptr, usz alignment, usz size)
```
```c3
const PROT_NONE
```
```c3
const PROT_READ
```
```c3
const PROT_WRITE
```
```c3
const PROT_EXEC
```
```c3
const MAP_SHARED
```
```c3
const MAP_PRIVATE
```
```c3
const MAP_FILE
```
```c3
const MAP_ANONYMOUS
```
```c3
const void* MAP_FAILED
```
```c3
const MADV_NORMAL
```
```c3
const MADV_RANDOM
```
```c3
const MADV_SEQUENTIAL
```
```c3
const MADV_WILLNEED
```
```c3
const MADV_DONTNEED
```
```c3
extern fn void* mmap(void*, usz, CInt, CInt, CInt, Off_t)
```
```c3
struct Posix_spawn_file_actions_t
```
```c3
struct Posix_spawnattr_t
```
```c3
extern fn CInt posix_spawn_file_actions_init(Posix_spawn_file_actions_t *file_actions)
```
```c3
const PTHREAD_MUTEX_NORMAL
```
```c3
const PTHREAD_MUTEX_ERRORCHECK
```
```c3
const PTHREAD_MUTEX_RECURSIVE
```
```c3
alias PosixThreadFn = fn void*(void*)
```
```c3
typedef Pthread_t = void*
```
```c3
extern fn CInt pthread_create(Pthread_t*, Pthread_attr_t*, PosixThreadFn, void*)
```
### `std::os::process @if(env::WIN32 || env::POSIX)`
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
```c3
struct SubProcess
```
```c3
bitstruct SubProcessOptions : int
```

```c3
<*
 @require !environment || !options.inherit_environment
*>
```
```c3
fn SubProcess? create(String[] command_line, SubProcessOptions options = {}, String[] environment = {}) @if(env::WIN32)
```
```c3
const ZString[1] EMPTY_ENVIRONMENT @if(env::POSIX)
```
```c3
fn String? execute_stdout_to_buffer(char[] buffer, String[] command_line, SubProcessOptions options = {}, String[] environment = {})
```

```c3
<*
 @require !environment || !options.inherit_environment
*>
```
```c3
fn SubProcess? create(String[] command_line, SubProcessOptions options = {}, String[] environment = {}) @if(env::POSIX)
```
```c3
fn CInt? SubProcess.join(&self) @if(env::POSIX)
```
```c3
fn File SubProcess.stdout(&self)
```
```c3
fn File SubProcess.stderr(&self)
```
```c3
fn CInt? SubProcess.join(&self) @if(env::WIN32)
```
```c3
fn bool SubProcess.destroy(&self)
```
```c3
fn void? SubProcess.terminate(&self)
```
```c3
fn usz? SubProcess.read_stdout(&self, char* buffer, usz size)
```
```c3
fn usz? SubProcess.read_stderr(&self, char* buffer, usz size)
```
```c3
fn bool? SubProcess.is_running(&self)
```
### `std::os::win32`
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
const INVALID_HANDLE_VALUE
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
const ARM64_MAX_BREAKPOINTS
```
```c3
const ARM64_MAX_WATCHPOINTS
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
const CONTEXT_AMD64
```
```c3
const CONTEXT_AMD64_CONTROL
```
```c3
const CONTEXT_AMD64_INTEGER
```
```c3
const CONTEXT_AMD64_SEGMENTS
```
```c3
const CONTEXT_AMD64_FLOATING_POINT
```
```c3
const CONTEXT_AMD64_DEBUG_REGISTERS
```
```c3
const CONTEXT_AMD64_FULL
```
```c3
const CONTEXT_AMD64_ALL
```
```c3
alias CONTEXT_CONTROL = CONTEXT_AMD64_CONTROL
```
```c3
alias CONTEXT_FULL = CONTEXT_AMD64_FULL
```
```c3
alias CONTEXT_ALL = CONTEXT_AMD64_ALL
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
### `std::os::win32 @if(env::WIN32)`
```c3
extern fn void getSystemTimeAsFileTime(Win32_FILETIME* time) @extern("GetSystemTimeAsFileTime")
```
```c3
enum Win32_GET_FILEEX_INFO_LEVELS
```
```c3
struct Win32_FILE_ATTRIBUTE_DATA
```
```c3
const MAX_PATH
```
```c3
struct Win32_WIN32_FIND_DATAW
```
```c3
alias Win32_LPWIN32_FIND_DATAW = Win32_WIN32_FIND_DATAW*
```
```c3
extern fn Win32_BOOL closeHandle(Win32_HANDLE) @extern("CloseHandle")
```
```c3
extern fn Win32_HBRUSH createSolidBrush(Win32_COLORREF) @extern("CreateSolidBrush")
```
```c3
extern fn Win32_DWORD getLastError() @extern("GetLastError")
```
```c3
extern fn void* _aligned_malloc(usz size, usz alignment)
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
extern fn Win32_LPVOID virtualAlloc(Win32_LPVOID lpAddres, Win32_SIZE_T dwSize, Win32_AllocationType flAllocationType, Win32_Protect flProtect) @extern("VirtualAlloc")
```
```c3
const Win32_DWORD STARTF_USESTDHANDLES
```
```c3
const Win32_DWORD CREATE_NO_WINDOW
```
```c3
const Win32_DWORD CREATE_PROTECTED_PROCESS
```
```c3
const Win32_DWORD CREATE_UNICODE_ENVIRONMENT
```
```c3
const uint WAIT_OBJECT_0
```
```c3
const uint WAIT_ABANDONED
```
```c3
const uint WAIT_IO_COMPLETION
```
```c3
const uint WAIT_FAILED
```
```c3
const Win32_DWORD HANDLE_FLAG_INHERIT
```
```c3
const Win32_DWORD HANDLE_FLAG_PROTECT_FROM_CLOSE
```
```c3
const uint INFINITE
```
```c3
const Win32_DWORD PIPE_ACCESS_DUPLEX
```
```c3
const Win32_DWORD PIPE_ACCESS_INBOUND
```
```c3
const Win32_DWORD PIPE_ACCESS_OUTBOUND
```
```c3
const Win32_DWORD FILE_FLAG_FIRST_PIPE_INSTANCE
```
```c3
const Win32_DWORD FILE_FLAG_WRITE_THROUGH
```
```c3
const Win32_DWORD FILE_FLAG_OVERLAPPED
```
```c3
const Win32_DWORD WRITE_DAC
```
```c3
const Win32_DWORD WRITE_OWNER
```
```c3
const Win32_DWORD ACCESS_SYSTEM_SECURITY
```
```c3
const Win32_DWORD PIPE_TYPE_BYTE
```
```c3
const Win32_DWORD PIPE_TYPE_MESSAGE
```
```c3
const Win32_DWORD PIPE_READMODE_BYTE
```
```c3
const Win32_DWORD PIPE_READMODE_MESSAGE
```
```c3
const Win32_DWORD PIPE_WAIT
```
```c3
const Win32_DWORD PIPE_NOWAIT
```
```c3
const Win32_DWORD PIPE_ACCEPT_REMOTE_CLIENTS
```
```c3
const Win32_DWORD PIPE_REJECT_REMOTE_CLIENTS
```
```c3
const SYMOPT_CASE_INSENSITIVE
```
```c3
const SYMOPT_UNDNAME
```
```c3
const SYMOPT_DEFERRED_LOADS
```
```c3
const SYMOPT_NO_CPP
```
```c3
const SYMOPT_LOAD_LINES
```
```c3
const SYMOPT_OMAP_FIND_NEAREST
```
```c3
const SYMOPT_LOAD_ANYTHING
```
```c3
const SYMOPT_IGNORE_CVREC
```
```c3
const IMAGE_FILE_MACHINE_UNKNOWN
```
```c3
const IMAGE_FILE_MACHINE_TARGET_HOST
```
```c3
const IMAGE_FILE_MACHINE_I386
```
```c3
const IMAGE_FILE_MACHINE_IA64
```
```c3
const IMAGE_FILE_MACHINE_ARM64
```
```c3
const IMAGE_FILE_MACHINE_AMD64
```
```c3
const UNDNAME_COMPLETE
```
```c3
alias Win32_INIT_ONCE_FN = fn Win32_BOOL(Win32_INIT_ONCE* initOnce, void* parameter, void** context)
```
```c3
extern fn void initializeCriticalSection(Win32_CRITICAL_SECTION* section) @extern("InitializeCriticalSection")
```
```c3
struct Symbol
```
```c3
fn BacktraceList? symbolize_backtrace(Allocator allocator, void*[] backtrace)
```
```c3
fn Backtrace? resolve_backtrace(Allocator allocator, void* addr, Win32_HANDLE process)
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
const Win32_DWORD WS_BORDER
```
```c3
const Win32_DWORD WS_CAPTION
```
```c3
const Win32_DWORD WS_CHILD
```
```c3
const Win32_DWORD WS_CHILDWINDOW
```
```c3
const Win32_DWORD WS_CLIPCHILDREN
```
```c3
const Win32_DWORD WS_CLIPSIBLINGS
```
```c3
const Win32_DWORD WS_DISABLED
```
```c3
const Win32_DWORD WS_DLGFRAME
```
```c3
const Win32_DWORD WS_GROUP
```
```c3
const Win32_DWORD WS_HSCROLL
```
```c3
const Win32_DWORD WS_ICONIC
```
```c3
const Win32_DWORD WS_MAXIMIZE
```
```c3
const Win32_DWORD WS_MAXIMIZEBOX
```
```c3
const Win32_DWORD WS_MINIMIZE
```
```c3
const Win32_DWORD WS_MINIMIZEBOX
```
```c3
const Win32_DWORD WS_OVERLAPPED
```
```c3
const Win32_DWORD WS_OVERLAPPEDWINDOW
```
```c3
const Win32_DWORD WS_POPUP
```
```c3
const Win32_DWORD WS_POPUPWINDOW
```
```c3
const Win32_DWORD WS_SIZEBOX
```
```c3
const Win32_DWORD WS_SYSMENU
```
```c3
const Win32_DWORD WS_TABSTOP
```
```c3
const Win32_DWORD WS_THICKFRAME
```
```c3
const Win32_DWORD WS_TILED
```
```c3
const Win32_DWORD WS_TILEDWINDOW
```
```c3
const Win32_DWORD WS_VISIBLE
```
```c3
const Win32_DWORD WS_VSCROLL
```
```c3
const Win32_UINT MB_OK
```
```c3
const Win32_UINT MB_OKCANCEL
```
```c3
const Win32_UINT MB_ABORTRETRYIGNORE
```
```c3
const Win32_UINT MB_YESNOCANCEL
```
```c3
const Win32_UINT MB_YESNO
```
```c3
const Win32_UINT MB_RETRYCANCEL
```
```c3
const Win32_UINT MB_CANCELTRYCONTINUE
```
```c3
const Win32_UINT MB_ICONHAND
```
```c3
const Win32_UINT MB_ICONQUESTION
```
```c3
const Win32_UINT MB_ICONEXCLAMATION
```
```c3
const Win32_UINT MB_ICONASTERISK
```
```c3
const Win32_UINT MB_USERICON
```
```c3
const Win32_UINT MB_ICONWARNING
```
```c3
const Win32_UINT MB_ICONERROR
```
```c3
const Win32_UINT MB_ICONINFORMATION
```
```c3
const Win32_UINT MB_ICONSTOP
```
```c3
const GWL_WNDPROC @if(env::ARCH_32_BIT)
```
```c3
const GWL_HINSTANCE @if(env::ARCH_32_BIT)
```
```c3
const GWL_HWNDPARENT @if(env::ARCH_32_BIT)
```
```c3
const GWL_STYLE
```
```c3
const GWL_EXSTYLE
```
```c3
const GWL_USERDATA @if(env::ARCH_32_BIT)
```
```c3
const GWL_ID
```
```c3
const GWLP_WNDPROC
```
```c3
const GWLP_HINSTANCE
```
```c3
const GWLP_HWNDPARENT
```
```c3
const GWLP_USERDATA
```
```c3
const GWLP_ID
```
```c3
extern fn Win32_HDC beginPaint(Win32_HWND, Win32_LPPAINTSTRUCT) @extern("BeginPaint")
```
```c3
macro setWindowLongPtr(Win32_HWND hWnd, CInt nIndex, dwNewLong)
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
typedef WSAError = int
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
const usz _SS_PAD1SIZE
```
```c3
const usz _SS_PAD2SIZE
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
```c3
const Win32_SHORT POLLERR
```
```c3
const Win32_SHORT POLLHUP
```
```c3
const Win32_SHORT POLLNVAL
```
```c3
const Win32_SHORT POLLWRNORM
```
```c3
const Win32_SHORT POLLWRBAND
```
```c3
const Win32_SHORT POLLRDNORM
```
```c3
const Win32_SHORT POLLRDBAND
```
```c3
const Win32_SHORT POLLPRI
```
```c3
const Win32_SHORT POLLIN
```
```c3
const Win32_SHORT POLLOUT
```
```c3
const SD_RECEIVE
```
```c3
const SD_SEND
```
```c3
const SD_BOTH
```
```c3
extern fn CInt wsaPoll(Win32_LPWSAPOLLFD fdArray, Win32_ULONG fds, Win32_INT timeout) @extern("WSAPoll")
```
### `std::sort`

Perform a binary search over the sorted array and return the index
in [0, array.len) where x would be inserted or cmp(i) is true and cmp(j) is true for j in [i, array.len).
```c3
<*
 @require @is_sortable(list) : "The list must be sortable"
 @require @is_valid_cmp_fn(cmp, list, context) : "Expected a comparison function which compares values"
 @require @is_valid_context(cmp, context) : "Expected a valid context"
*>
```
```c3
macro usz binarysearch(list, x, cmp = EMPTY_MACRO_SLOT, context = EMPTY_MACRO_SLOT) @builtin
```

Sort list using the counting sort algorithm.
```c3
<*
 @require @is_sortable(list) : "The list must be indexable and support .len or .len()"
 @require @is_cmp_key_fn(key_fn, list) : "Expected a transformation function which returns an unsigned integer."
*>
```
```c3
macro countingsort(list, key_fn = EMPTY_MACRO_SLOT) @builtin
```
```c3
macro insertionsort_indexed(list, start, end, cmp = EMPTY_MACRO_SLOT, context = EMPTY_MACRO_SLOT) @builtin
```
```c3
macro quicksort_indexed(list, start, end, cmp = EMPTY_MACRO_SLOT, context = EMPTY_MACRO_SLOT) @builtin
```

Sort list using the quick sort algorithm.
```c3
<*
 @require @is_sortable(list) : "The list must be indexable and support .len or .len()"
 @require @is_valid_cmp_fn(cmp, list, context) : "Expected a comparison function which compares values"
*>
```
```c3
macro insertionsort(list, cmp = EMPTY_MACRO_SLOT, context = EMPTY_MACRO_SLOT) @builtin @safemacro
```

Sort list using the quick sort algorithm.
```c3
<*
 @require @is_sortable(list) : "The list must be indexable and support .len or .len()"
 @require @is_valid_cmp_fn(cmp, list, context) : "Expected a comparison function which compares values"
 @require @is_valid_context(cmp, context) : "Expected a valid context"
*>
```
```c3
macro quicksort(list, cmp = EMPTY_MACRO_SLOT, context = EMPTY_MACRO_SLOT) @builtin
```

Select the (k+1)th smallest element in an unordered list using Hoare's
selection algorithm (Quickselect). k should be between 0 and len-1. The data
list will be partially sorted.
```c3
<*
 @require @is_sortable(list) : "The list must be indexable and support .len or .len()"
 @require @is_valid_cmp_fn(cmp, list, context) : "expected a comparison function which compares values"
 @require @is_valid_context(cmp, context) : "Expected a valid context"
*>
```
```c3
macro quickselect(list, isz k, cmp = EMPTY_MACRO_SLOT, context = EMPTY_MACRO_SLOT) @builtin
```
```c3
macro usz len_from_list(list)
```
```c3
macro bool @is_sortable(#list)
```
```c3
macro bool @is_valid_context(#cmp, #context)
```
```c3
macro bool @is_valid_cmp_fn(#cmp, #list, #context)
```
```c3
macro bool @is_cmp_key_fn(#key_fn, #list)
```

Returns true if list is sorted in either ascending or descending order.
```c3
<*
 @require @is_sortable(list) : "The list must be indexable and support .len or .len()"
 @require @is_valid_cmp_fn(cmp, list, ctx) : "Expected a comparison function which compares values"
 @require @is_valid_context(cmp, ctx) : "Expected a valid context"
*>
```
```c3
macro bool is_sorted(list, cmp = EMPTY_MACRO_SLOT, ctx = EMPTY_MACRO_SLOT) @builtin
```
### `std::sort::cs{Type, KeyFn}`
```c3
alias ElementType = $typeof((Type){}[0])
```
```c3
alias KeyFnReturnType @if(!NO_KEY_FN) = $typefrom(KeyFn.returns)
```
```c3
alias KeyFnReturnType @if(NO_KEY_FN) = ElementType
```
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
```c3
fn void csort(Type list, usz low, usz high, KeyFn key_fn, uint byte_idx)
```
### `std::sort::is{Type, CmpFn, Context}`
```c3
alias ElementType = $typeof(((Type){})[0])
```
```c3
fn void isort(Type list, usz low, usz high, CmpFn comp, Context context)
```
### `std::sort::qs{Type, CmpFn, Context}`
```c3
alias ElementType = $typeof(((Type){})[0])
```
```c3
fn void qsort(Type list, isz low, isz high, CmpFn cmp, Context context)
```

```c3
<*
 @require low <= k : "kth smalles element is smaller than lower bounds"
 @require k <= high : "kth smalles element is larger than upper bounds"
*>
```
```c3
fn ElementType? qselect(Type list, isz low, isz high, isz k, CmpFn cmp, Context context)
```
```c3
macro @partition(Type list, isz l, isz h, CmpFn cmp, Context context)
```
### `std::thread`
```c3
faultdef THREAD_QUEUE_FULL
```
```c3
bitstruct MutexType : int
```
```c3
typedef Mutex = NativeMutex
```
```c3
typedef RecursiveMutex = inline Mutex
```
```c3
typedef TimedMutex = NativeTimedMutex
```
```c3
typedef TimedRecursiveMutex = inline TimedMutex
```
```c3
typedef ConditionVariable = NativeConditionVariable
```
```c3
typedef Thread = inline NativeThread
```
```c3
typedef OnceFlag = NativeOnceFlag
```
```c3
alias OnceFn = fn void()
```
```c3
alias ThreadFn = fn int(void* arg)
```
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
```c3
macro void? Mutex.init(&mutex)
```
```c3
macro bool Mutex.is_initialized(mutex)
```
```c3
macro void? RecursiveMutex.init(&mutex)
```
```c3
macro void? Mutex.destroy(&mutex)
```
```c3
macro void? Mutex.lock(&mutex)
```
```c3
macro bool  Mutex.try_lock(&mutex)
```
```c3
macro void? Mutex.unlock(&mutex)
```
```c3
macro void? TimedMutex.init(&mutex)
```
```c3
macro void? TimedRecursiveMutex.init(&mutex)
```
```c3
macro void? TimedMutex.destroy(&mutex)
```
```c3
macro void? TimedMutex.lock(&mutex)
```
```c3
macro void? TimedMutex.lock_timeout(&mutex, ulong ms)
```
```c3
macro bool  TimedMutex.try_lock(&mutex)
```
```c3
macro void? TimedMutex.unlock(&mutex)
```
```c3
macro void fence(AtomicOrdering $ordering) @safemacro
```
```c3
macro void Mutex.@in_lock(&mutex; @body)
```
```c3
macro void? ConditionVariable.init(&cond)
```
```c3
macro void? ConditionVariable.destroy(&cond)
```
```c3
macro void? ConditionVariable.signal(&cond)
```
```c3
macro void? ConditionVariable.broadcast(&cond)
```
```c3
macro void? ConditionVariable.wait(&cond, Mutex* mutex)
```

```c3
<*
 @require @assignable_to(#ms_or_duration, Duration) || @assignable_to(#ms_or_duration, ulong)
 @return? thread::WAIT_TIMEOUT, thread::WAIT_FAILED
*>
```
```c3
macro void? ConditionVariable.wait_timeout(&cond, Mutex* mutex, #ms_or_duration) @safemacro
```

```c3
<*
 @return? thread::WAIT_TIMEOUT, thread::WAIT_FAILED
*>
```
```c3
macro void? ConditionVariable.wait_until(&cond, Mutex* mutex, Time time)
```

Create and start a thread.
```c3
<*
 @require thread_fn != null : "A non null thread function is required"
*>
```
```c3
macro void? Thread.create(&thread, ThreadFn thread_fn, void* arg)
```
```c3
macro void? Thread.detach(thread)
```
```c3
macro int? Thread.join(thread)
```
```c3
macro bool Thread.equals(thread, Thread other)
```
```c3
macro void OnceFlag.call(&flag, OnceFn func)
```
```c3
macro void yield()
```
```c3
macro Thread current()
```
```c3
macro void exit(int result)
```
```c3
macro void? sleep(Duration d) @maydiscard
```
```c3
macro void? sleep_ms(ulong ms) @maydiscard
```
```c3
macro void? sleep_ns(NanoDuration ns) @maydiscard
```
### `std::thread::channel {Type}`
```c3
typedef UnbufferedChannel = void*
```
```c3
fn void? UnbufferedChannel.init(&self, Allocator allocator)
```
```c3
fn void? UnbufferedChannel.destroy(&self)
```
```c3
fn void? UnbufferedChannel.push(self, Type val)
```
```c3
fn Type? UnbufferedChannel.pop(self)
```
```c3
fn void? UnbufferedChannel.close(self)
```
### `std::thread::channel{Type}`
```c3
typedef BufferedChannel = void*
```
```c3
fn void? BufferedChannel.init(&self, Allocator allocator, usz size = 1)
```
```c3
fn void? BufferedChannel.destroy(&self)
```
```c3
fn void? BufferedChannel.push(self, Type val)
```
```c3
fn Type? BufferedChannel.pop(self)
```
```c3
fn void? BufferedChannel.close(self)
```
### `std::thread::cpu @if(env::DARWIN)`
```c3
const CTL_UNSPEC
```
```c3
const CTL_KERN
```
```c3
const CTL_VM
```
```c3
const CTL_VFS
```
```c3
const CTL_NET
```
```c3
const CTL_DEBUG
```
```c3
const CTL_HW
```
```c3
const CTL_MACHDEP
```
```c3
const CTL_USER
```
```c3
const CTL_MAXID
```
```c3
const HW_MACHINE
```
```c3
const HW_MODEL
```
```c3
const HW_NCPU
```
```c3
const HW_BYTEORDER
```
```c3
const HW_PHYSMEM
```
```c3
const HW_USERMEM
```
```c3
const HW_PAGESIZE
```
```c3
const HW_DISKNAMES
```
```c3
const HW_DISKSTATS
```
```c3
const HW_EPOCH
```
```c3
const HW_FLOATINGPT
```
```c3
const HW_MACHINE_ARCH
```
```c3
const HW_VECTORUNIT
```
```c3
const HW_BUS_FREQ
```
```c3
const HW_CPU_FREQ
```
```c3
const HW_CACHELINE
```
```c3
const HW_L1ICACHESIZE
```
```c3
const HW_L1DCACHESIZE
```
```c3
const HW_L2SETTINGS
```
```c3
const HW_L2CACHESIZE
```
```c3
const HW_L3SETTINGS
```
```c3
const HW_L3CACHESIZE
```
```c3
const HW_MAXID
```
```c3
fn uint native_cpu()
```
### `std::thread::cpu @if(env::LINUX)`
```c3
fn uint native_cpu()
```
### `std::thread::cpu @if(env::WIN32)`
```c3
fn uint native_cpu()
```
### `std::thread::event`
### `std::thread::os @if (!env::POSIX && !env::WIN32)`
```c3
typedef NativeMutex = int
```
```c3
typedef NativeTimedMutex = int
```
```c3
typedef NativeConditionVariable = int
```
```c3
typedef NativeOnceFlag = int
```
```c3
typedef NativeThread = int
```
```c3
fn void NativeOnceFlag.call_once(&flag, OnceFn func)
```
```c3
fn void? NativeMutex.init(&mtx, MutexType type)
```
```c3
fn bool NativeMutex.is_initialized(&self)
```
```c3
macro void? NativeMutex.lock(&mutex)
```
```c3
macro bool NativeMutex.try_lock(&mutex)
```
```c3
macro void? NativeMutex.unlock(&mutex)
```
### `std::thread::os @if(env::POSIX)`
```c3
struct NativeMutex
```
```c3
alias NativeTimedMutex = NativeMutex
```
```c3
alias NativeConditionVariable = Pthread_cond_t
```
```c3
struct NativeThread
```
```c3
alias NativeOnceFlag = Pthread_once_t
```

```c3
<*
 @require !self.is_initialized() : "Mutex is already initialized"
 @ensure self.is_initialized()
*>
```
```c3
fn void? NativeMutex.init(&self, MutexType type)
```
```c3
fn bool NativeMutex.is_initialized(&self)
```

```c3
<*
 @require self.is_initialized() : "Mutex was not initialized"
 @ensure !self.is_initialized()
*>
```
```c3
fn void? NativeMutex.destroy(&self)
```

```c3
<*
 @require self.is_initialized() : "Mutex was not initialized"
*>
```
```c3
fn void? NativeMutex.lock(&self)
```

```c3
<*
 @require self.is_initialized() : "Mutex was not initialized"
*>
```
```c3
fn void? NativeMutex.lock_timeout(&self, ulong ms)
```

```c3
<*
 @require self.is_initialized() : "Mutex was not initialized"
*>
```
```c3
fn bool NativeMutex.try_lock(&self)
```

```c3
<*
 @require self.is_initialized() : "Mutex was not initialized"
*>
```
```c3
fn void? NativeMutex.unlock(&self)
```
```c3
fn void? NativeConditionVariable.init(&cond)
```
```c3
fn void? NativeConditionVariable.destroy(&cond)
```
```c3
fn void? NativeConditionVariable.signal(&cond)
```
```c3
fn void? NativeConditionVariable.broadcast(&cond)
```

```c3
<*
 @require mtx.is_initialized()
*>
```
```c3
fn void? NativeConditionVariable.wait(&cond, NativeMutex* mtx)
```

```c3
<*
 @require mtx.is_initialized()
 @return? thread::WAIT_TIMEOUT, thread::WAIT_FAILED
*>
```
```c3
fn void? NativeConditionVariable.wait_timeout(&cond, NativeMutex* mtx, ulong ms)
```

```c3
<*
 @require mtx.is_initialized()
 @return? thread::WAIT_TIMEOUT, thread::WAIT_FAILED
*>
```
```c3
fn void? NativeConditionVariable.wait_timeout_duration(&cond, NativeMutex* mtx, Duration duration)
```

```c3
<*
 @require mtx.is_initialized()
 @return? thread::WAIT_TIMEOUT, thread::WAIT_FAILED
*>
```
```c3
fn void? NativeConditionVariable.wait_until(&cond, NativeMutex* mtx, Time time)
```
```c3
fn void? NativeThread.create(&thread, ThreadFn thread_fn, void* arg)
```
```c3
fn void? NativeThread.detach(thread)
```
```c3
fn void native_thread_exit(int result)
```
```c3
fn NativeThread native_thread_current()
```
```c3
fn bool NativeThread.equals(thread, NativeThread other)
```
```c3
fn int? NativeThread.join(thread)
```
```c3
fn void NativeOnceFlag.call_once(&flag, OnceFn func)
```
```c3
fn void native_thread_yield()
```
```c3
fn void? native_sleep_nano(NanoDuration nano)
```
### `std::thread::os @if(env::WIN32)`
```c3
typedef NativeThread = inline Win32_HANDLE
```
```c3
struct NativeMutex
```
```c3
fn bool NativeMutex.is_initialized(&self)
```
```c3
struct NativeTimedMutex
```
```c3
struct NativeConditionVariable
```
```c3
struct NativeOnceFlag
```

```c3
<*
 @require !mtx.initialized : "Mutex is already initialized"
 @require !type.timed
 @ensure mtx.initialized
*>
```
```c3
fn void? NativeMutex.init(&mtx, MutexType type)
```

```c3
<*
 @require mtx.initialized : "Mutex was not initialized"
 @require mtx.owner_thread != win32::getCurrentThreadId() : "Mutex was not unlocked before destroying it"
 @ensure !mtx.initialized
*>
```
```c3
fn void? NativeMutex.destroy(&mtx)
```

```c3
<*
 @require mtx.initialized : "Mutex was not initialized"
*>
```
```c3
fn void? NativeMutex.lock(&mtx)
```

```c3
<*
 @require mtx.initialized : "Mutex was not initialized"
*>
```
```c3
fn bool NativeMutex.try_lock(&mtx)
```

```c3
<*
 @require mtx.initialized : "Mutex was not initialized"
*>
```
```c3
fn void? NativeMutex.unlock(&mtx)
```

```c3
<*
 @require type.timed
 @require !mtx.initialized : "Mutex is already initialized"
 @ensure mtx.initialized
*>
```
```c3
fn void? NativeTimedMutex.init(&mtx, MutexType type)
```

```c3
<*
 @require mtx.initialized : "Mutex was not initialized"
 @require mtx.owner_thread != win32::getCurrentThreadId() : "Mutex was not unlocked before destroying it"
 @ensure !mtx.initialized
*>
```
```c3
fn void? NativeTimedMutex.destroy(&mtx)
```

```c3
<*
 @require mtx.initialized : "Mutex was not initialized"
*>
```
```c3
fn void? NativeTimedMutex.lock(&mtx)
```

```c3
<*
 @require mtx.initialized : "Mutex was not initialized"
*>
```
```c3
fn void? NativeTimedMutex.lock_timeout(&mtx, ulong ms)
```

```c3
<*
 @require mtx.initialized : "Mutex was not initialized"
*>
```
```c3
fn bool NativeTimedMutex.try_lock(&mtx)
```

```c3
<*
 @require mtx.initialized : "Mutex was not initialized"
*>
```
```c3
fn void? NativeTimedMutex.unlock(&mtx)
```
```c3
fn void? NativeConditionVariable.init(&cond)
```
```c3
fn void? NativeConditionVariable.destroy(&cond) @maydiscard
```
```c3
fn void? NativeConditionVariable.signal(&cond)
```
```c3
fn void? NativeConditionVariable.broadcast(&cond)
```

```c3
<*
 @require mtx.initialized : "Mutex was not initialized"
*>
```
```c3
fn void? NativeConditionVariable.wait(&cond, NativeMutex* mtx) @inline
```

```c3
<*
 @require mtx.initialized : "Mutex was not initialized"
 @return? thread::WAIT_TIMEOUT, thread::WAIT_FAILED
*>
```
```c3
fn void? NativeConditionVariable.wait_timeout(&cond, NativeMutex* mtx, ulong ms) @inline
```

```c3
<*
 @require mtx.initialized : "Mutex was not initialized"
 @return? thread::WAIT_TIMEOUT, thread::WAIT_FAILED
*>
```
```c3
fn void? NativeConditionVariable.wait_timeout_duration(&cond, NativeMutex* mtx, Duration duration) @inline
```

```c3
<*
 @require mtx.initialized : "Mutex was not initialized"
 @return? thread::WAIT_TIMEOUT, thread::WAIT_FAILED
*>
```
```c3
fn void? NativeConditionVariable.wait_until(&cond, NativeMutex* mtx, Time time) @inline
```
```c3
fn void? NativeThread.create(&thread, ThreadFn func, void* args)
```
```c3
fn void? NativeThread.detach(thread) @inline
```
```c3
fn void native_thread_exit(int result) @inline
```
```c3
fn void native_thread_yield()
```
```c3
fn void NativeOnceFlag.call_once(&flag, OnceFn func)
```
```c3
fn int? NativeThread.join(thread)
```
```c3
fn NativeThread native_thread_current()
```
```c3
fn bool NativeThread.equals(thread, NativeThread other)
```
```c3
fn void? native_sleep_nano(NanoDuration ns)
```
### `std::thread::pool{SIZE}`
```c3
struct ThreadPool
```

```c3
<*
 @require !self.initialized : "ThreadPool must not be already initialized"
*>
```
```c3
fn void? ThreadPool.init(&self)
```

Stop all the threads and cleanup the pool.
Any pending work will be dropped.
```c3
fn void? ThreadPool.destroy(&self)
```

Stop all the threads and cleanup the pool.
Any pending work will be processed.
```c3
fn void? ThreadPool.stop_and_destroy(&self)
```

Push a new job to the pool.
Returns whether the queue is full, in which case the job is ignored.
```c3
fn void? ThreadPool.push(&self, ThreadFn func, void* arg)
```
### `std::thread::threadpool @if (env::POSIX || env::WIN32)`
```c3
alias ThreadPoolFn = fn void(any[] args)
```
```c3
struct FixedThreadPool
```

```c3
<*
 @require !self.initialized : "ThreadPool must not be already initialized"
 @require threads > 0 && threads < 0x1000 : `Threads should be greater than 0 and less than 0x1000`
 @require queue_size < 0x10000 : `Queue size must be less than 65536`
*>
```
```c3
fn void? FixedThreadPool.init(&self, usz threads, usz queue_size = 0)
```

Stop all the threads and cleanup the pool.
Any pending work will be dropped.
```c3
fn void? FixedThreadPool.destroy(&self)
```

Stop all the threads and cleanup the pool.
Any pending work will be processed.
```c3
fn void? FixedThreadPool.stop_and_destroy(&self)
```

Push a new job to the pool.
return Excuse if the queue is full, in which case the job is ignored.
```c3
fn void? FixedThreadPool.push(&self, ThreadPoolFn func, args...)
```
### `std::time`
```c3
typedef Time @structlike = long
```
```c3
typedef Duration @structlike = long
```
```c3
typedef Clock @structlike = ulong
```
```c3
typedef NanoDuration (Printable) @structlike = long
```
```c3
const Time FAR_FUTURE
```
```c3
const Time FAR_PAST
```
```c3
const NanoDuration NANO_DURATION_ZERO
```
```c3
const Duration US
```
```c3
const Duration MS
```
```c3
const Duration SEC
```
```c3
const Duration MIN
```
```c3
const Duration HOUR
```
```c3
const Duration DAY
```
```c3
const Duration WEEK
```
```c3
const Duration MONTH
```
```c3
const Duration YEAR
```
```c3
const Duration FOREVER
```
```c3
const Duration DURATION_ZERO
```
```c3
fn Duration us(long l) @inline
```
```c3
fn Duration ms(long l) @inline
```
```c3
fn Duration sec(long l) @inline
```
```c3
fn Duration min(long l) @inline
```
```c3
fn Duration hour(long l) @inline
```
```c3
fn Duration from_float(double s) @inline
```
```c3
struct DateTime
```
```c3
struct TzDateTime
```
```c3
enum Weekday : char (String name, String abbrev)
```
```c3
enum Month : char (String name, String abbrev, int days, bool leap)
```
```c3
fn Time now()
```
```c3
fn Time Time.add_seconds(time, long seconds)
```
```c3
fn Time Time.add_minutes(time, long minutes)
```
```c3
fn Time Time.add_hours(time, long hours)
```
```c3
fn Time Time.add_days(time, long days)
```
```c3
fn Time Time.add_weeks(time, long weeks)
```
```c3
fn Time Time.add_duration(time, Duration duration) @operator_s(+) @inline
```
```c3
fn Time Time.sub_duration(time, Duration duration) @operator(-) @inline
```
```c3
fn int Time.compare_to(time, Time other)
```
```c3
fn double Time.to_seconds(time)
```
```c3
fn Duration Time.diff_us(time, Time other) @operator(-)
```
```c3
fn double Time.diff_sec(time, Time other)
```
```c3
fn double Time.diff_min(time, Time other)
```
```c3
fn double Time.diff_hour(time, Time other)
```
```c3
fn double Time.diff_days(time, Time other)
```
```c3
fn double Time.diff_weeks(time, Time other)
```
```c3
fn double NanoDuration.to_sec(nd)
```
```c3
fn long NanoDuration.to_ms(nd)
```
```c3
fn Duration NanoDuration.to_duration(nd)
```
```c3
fn NanoDuration Duration.to_nano(td)
```
```c3
fn long Duration.to_ms(td)
```
```c3
macro Duration Duration.mult(#td, long #val) @operator_s(*) @safemacro
```
```c3
fn usz? NanoDuration.to_format(&self, Formatter* formatter) @dynamic
```
### `std::time::clock`
```c3
fn Clock now()
```
```c3
fn NanoDuration Clock.mark(&self)
```
```c3
fn Clock Clock.add_nano_duration(self, NanoDuration nano) @operator_s(+) @inline
```
```c3
fn Clock Clock.sub_nano_duration(self, NanoDuration nano) @operator(-) @inline
```
```c3
fn Clock Clock.add_duration(self, Duration duration) @operator_s(+) @inline
```
```c3
fn Clock Clock.sub_duration(self, Duration duration) @operator(-) @inline
```
```c3
fn NanoDuration Clock.nano_diff(self, Clock other) @operator(-) @inline
```
```c3
fn NanoDuration Clock.to_now(self) @inline
```
### `std::time::datetime @if(env::LIBC)`
```c3
fn DateTime now()
```

```c3
<*
 @require day >= 1 && day < 32
 @require hour >= 0 && hour < 24
 @require min >= 0 && min < 60
 @require sec >= 0 && sec < 60
 @require us >= 0 && us <= 999_999
*>
```
```c3
fn DateTime from_date(int year, Month month = JANUARY, int day = 1, int hour = 0, int min = 0, int sec = 0, int us = 0)
```

```c3
<*
 @require day >= 1 && day < 32
 @require hour >= 0 && hour < 24
 @require min >= 0 && min < 60
 @require sec >= 0 && sec < 60
 @require us >= 0 && us <= 999_999
 @require gmt_offset >= -12 * 3600 && gmt_offset <= 14 * 3600
*>
```
```c3
fn TzDateTime from_date_tz(int year, Month month = JANUARY, int day = 1, int hour = 0, int min = 0, int sec = 0, int us = 0, int gmt_offset = 0)
```
```c3
fn TzDateTime DateTime.to_local(&self)
```

Update timestamp to gmt_offset while keeping the date and time
values unchanged.
```c3
<*
 @require gmt_offset >= -12 * 3600 && gmt_offset <= 14 * 3600
*>
```
```c3
fn TzDateTime DateTime.with_gmt_offset(self, int gmt_offset)
```

Update timestamp to gmt_offset while keeping the date and time
values unchanged.
```c3
<*
 @require gmt_offset >= -12 * 3600 && gmt_offset <= 14 * 3600
*>
```
```c3
fn TzDateTime TzDateTime.with_gmt_offset(self, int gmt_offset)
```

Update the date and time values to gmt_offset while keeping the
timestamp unchanged.
```c3
<*
 @require gmt_offset >= -12 * 3600 && gmt_offset <= 14 * 3600
 @ensure self.time == return.time
*>
```
```c3
fn TzDateTime DateTime.to_gmt_offset(self, int gmt_offset)
```

Update the date and time values to gmt_offset while keeping the
timestamp unchanged.
```c3
<*
 @require gmt_offset >= -12 * 3600 && gmt_offset <= 14 * 3600
 @ensure self.time == return.time
*>
```
```c3
fn TzDateTime TzDateTime.to_gmt_offset(self, int gmt_offset)
```
```c3
fn bool TzDateTime.eq(self, TzDateTime other) @operator(==) @inline
```

```c3
<*
 @require day >= 1 && day < 32
 @require hour >= 0 && hour < 24
 @require min >= 0 && min <= 60
 @require sec >= 0 && sec < 60
 @require us >= 0 && us <= 999_999
*>
```
```c3
fn void DateTime.set_date(&self, int year, Month month = JANUARY, int day = 1, int hour = 0, int min = 0, int sec = 0, int us = 0)
```
```c3
fn void DateTime.set_time(&self, Time time)
```
```c3
fn DateTime DateTime.add_us(&self, Duration d) @operator_s(+)
```
```c3
fn DateTime DateTime.sub_us(&self, Duration d) @operator(-)
```
```c3
fn DateTime DateTime.add_seconds(&self, int seconds)
```
```c3
fn DateTime DateTime.add_minutes(&self, int minutes)
```
```c3
fn DateTime DateTime.add_hours(&self, int hours)
```
```c3
fn DateTime DateTime.add_days(&self, int days)
```
```c3
fn DateTime DateTime.add_weeks(&self, int weeks)
```
```c3
fn DateTime DateTime.add_years(&self, int years)
```
```c3
fn DateTime DateTime.add_months(&self, int months)
```
```c3
fn TzDateTime TzDateTime.add_us(&self, Duration d) @operator_s(+)
```
```c3
fn TzDateTime TzDateTime.sub_us(&self, Duration d) @operator(-)
```
```c3
fn TzDateTime TzDateTime.add_seconds(&self, int seconds)
```
```c3
fn TzDateTime TzDateTime.add_minutes(&self, int minutes)
```
```c3
fn TzDateTime TzDateTime.add_hours(&self, int hours)
```
```c3
fn TzDateTime TzDateTime.add_days(&self, int days)
```
```c3
fn TzDateTime TzDateTime.add_weeks(&self, int weeks)
```
```c3
fn TzDateTime TzDateTime.add_years(&self, int years)
```
```c3
fn TzDateTime TzDateTime.add_months(&self, int months)
```
```c3
fn DateTime from_time(Time time)
```

```c3
<*
 @require gmt_offset >= -12 * 3600 && gmt_offset <= 14 * 3600
 @ensure time == return.time
*>
```
```c3
fn TzDateTime from_time_tz(Time time, int gmt_offset)
```
```c3
fn Time DateTime.to_time(&self) @inline
```
```c3
fn bool DateTime.after(&self, DateTime compare) @inline
```
```c3
fn bool DateTime.before(&self, DateTime compare) @inline
```
```c3
fn int DateTime.compare_to(&self, DateTime compare)
```
```c3
fn int DateTime.diff_years(&self, DateTime from)
```
```c3
fn double DateTime.diff_sec(self, DateTime from)
```
```c3
fn Duration DateTime.diff_us(self, DateTime from) @operator(-)
```
```c3
fn bool DateTime.eq(self, DateTime other) @operator(==) @inline
```
```c3
enum DateTimeFormat
```
```c3
fn String format(Allocator allocator, DateTimeFormat type, TzDateTime dt)
```
```c3
fn String tformat(DateTimeFormat dt_format, TzDateTime dt)
```
```c3
fn String TzDateTime.format(self, Allocator allocator, DateTimeFormat dt_format)
```
```c3
fn String DateTime.format(self, Allocator allocator, DateTimeFormat dt_format)
```
### `std::time::os @if(env::DARWIN)`
```c3
fn Clock native_clock()
```
### `std::time::os @if(env::POSIX)`
```c3
fn Time native_timestamp()
```
```c3
fn Clock native_clock() @if(!env::DARWIN)
```
### `std::time::os @if(env::WIN32)`
```c3
fn Clock native_clock()
```
```c3
fn Time native_timestamp()
```
