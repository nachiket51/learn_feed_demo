
///
/// Log Level Enum ---
///
enum LogLevel { Verbose, Debug, Error, Info, Warning }

///                     1) push : only go forward, 2) replace : go forward without back,
/// Page Navigation --- 3) pushAndRemove : go forward until found destination and remove all previous route,
///                     4) : only back
enum PageNav { push, replace, pushAndRemove, pop }
