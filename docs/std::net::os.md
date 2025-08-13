### `module std::net::os[] [@if(env::ANDROID)]`
### `module std::net::os[] []`
### `module std::net::os[] [@if(!env::LIBC || !(env::WIN32 || env::DARWIN || env::LINUX || env::ANDROID || env::OPENBSD))]`
### `module std::net::os[] [@if(env::DARWIN)]`
### `module std::net::os[] [@if(env::LINUX)]`
### `module std::net::os[] [@if(env::OPENBSD)]`
### `module std::net::os[] [@if(env::POSIX && SUPPORTS_INET)]`
### `module std::net::os[] [@if(env::WIN32)]`
