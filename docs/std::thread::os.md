### `module std::thread::os[] [@if(env::POSIX && !env::LINUX)]`
### `module std::thread::os[] [@if(env::LINUX)]`
### `module std::thread::os[] [@if (!env::POSIX && !env::WIN32)]`
### `module std::thread::os[] [@if(env::POSIX)]`
### `module std::thread::os[] [@if(env::WIN32)]`
