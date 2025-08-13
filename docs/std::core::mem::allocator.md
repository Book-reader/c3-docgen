### `module std::core::mem::allocator[] []`
### `module std::core::mem::allocator[] []`
### `module std::core::mem::allocator[] []`
### `module std::core::mem::allocator[] []`
### `module std::core::mem::allocator[] [@if(env::LIBC)]`
### `module std::core::mem::allocator[] [@if(env::POSIX)]`
### `module std::core::mem::allocator[] [@if(env::WIN32)]`
### `module std::core::mem::allocator[] [@if(!env::WIN32 && !env::POSIX && env::LIBC)]`
### `module std::core::mem::allocator[] []`
### `module std::core::mem::allocator[] [@if(!(env::POSIX || env::WIN32) || !$feature(VMEM_TEMP))]`
### `module std::core::mem::allocator[] [@if((env::POSIX || env::WIN32) && $feature(VMEM_TEMP))]`
### `module std::core::mem::allocator[] []`
### `module std::core::mem::allocator[] [@if(env::POSIX || env::WIN32)]`
### `module std::core::mem::allocator[] []`
### `module std::core::mem::allocator[] []`
