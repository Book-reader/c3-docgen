### `module libc[] []`
### `module libc[] [@if(env::LIBC)]`
### `module libc[] [@if(env::LINUX || env::ANDROID)]`
### `module libc[] [@if(env::NETBSD || env::OPENBSD)]`
### `module libc[] [@if(env::DARWIN || env::FREEBSD)]`
### `module libc[] [@if(env::FREEBSD)]`
### `module libc[] [@if(env::WIN32)]`
### `module libc[] [@if(env::LIBC && !env::WIN32 && !env::LINUX && !env::ANDROID && !env::DARWIN && !env::BSD_FAMILY)]`
### `module libc[] [@if(!env::LIBC)]`
### `module libc[] []`
### `module libc[] []`
### `module libc[] [@if(env::ANDROID)]`
### `module libc[] [@if(env::DARWIN)]`
### `module libc[] [@if(env::FREEBSD)]`
### `module libc[] [@if(env::LINUX)]`
### `module libc[] [@if(env::OPENBSD)]`
### `module libc[] [@if(env::POSIX)]`
### `module libc[] [@if(env::WIN32)]`
