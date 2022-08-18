import 'dart:io';

import 'package:flying_fish/flying_fish.dart';

class Readme {
  String projectPath;
  FlyingFish project;
  Readme({
    required this.projectPath,
    required this.project,
  });

  Future<void> create() async {
    var readme = File('$projectPath/README.md');
    readme.createSync();
    await readme.writeAsString(readmeContent);
  }

  String get readmeContent => '''
# ${project.projectName}

A new FlyingFish project.

''';
}
