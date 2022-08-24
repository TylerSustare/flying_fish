import 'package:flying_fish/src/enums/project_mode.dart';

class AliasMapper {
  static final Map<String, ProjectMode> _aliases = {
    'full': ProjectMode.fullStack,
    'server': ProjectMode.serverOnly,
    's': ProjectMode.serverOnly,
    'flutter': ProjectMode.flutterOnly,
    'f': ProjectMode.flutterOnly,
    ProjectMode.flutterOnly.name: ProjectMode.flutterOnly,
    ProjectMode.serverOnly.name: ProjectMode.serverOnly,
    ProjectMode.fullStack.name: ProjectMode.fullStack,
  };

  static ProjectMode getProjectMode(String alias) {
    return _aliases[alias]!;
  }
}
