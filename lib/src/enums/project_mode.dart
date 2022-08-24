/// The possible project modes for a flying fish project.
/// The project mode determines which files are generated.
/// The full stack mode generates Server and Flutter files.
/// The server mode generates Server files only.
/// The flutter mode generates Flutter files only.
enum ProjectMode {
  serverOnly,
  flutterOnly,
  fullStack,
}
