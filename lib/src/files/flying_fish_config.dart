import 'dart:io';

import 'package:flying_fish/flying_fish.dart';

class FlyingFishConfig {
  String projectPath;
  FlyingFish project;

  FlyingFishConfig({
    required this.projectPath,
    required this.project,
  });

  Future<void> create() async {
    var config = File('$projectPath/flying_fish.yaml');
    config.createSync();
    await config.writeAsString(defaultFlyingFishConfig);
  }

  String get defaultFlyingFishConfig => '''
version: 0.0.1

project:
  name: ${project.projectName}
  mode: ${project.projectMode.name}

''';
}
