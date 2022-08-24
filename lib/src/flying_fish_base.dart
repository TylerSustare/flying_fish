import 'dart:io';

import 'package:flying_fish/src/enums/project_mode.dart';
import 'package:flying_fish/src/files/flying_fish_config.dart';
import 'package:flying_fish/src/files/readme.dart';
import 'package:path/path.dart' as path;

/// Base class for the flying fish library
/// Responsible for managing the project structure, files, options, and actions.
class FlyingFish {
  String projectName;
  ProjectMode projectMode;

  FlyingFish({
    this.projectName = 'flying_fish',
    this.projectMode = ProjectMode.fullStack,
  });

  /// The project path relative to the current working directory.
  String get projectPath => path.relative('./$projectName');

  /// Create the project structure and files.
  Future<void> create() async {
    print('Creating a new FlyingFish project called $projectName');
    Directory(projectPath).createSync(recursive: true);
    await Readme(project: this, projectPath: projectPath).create();
    await FlyingFishConfig(project: this, projectPath: projectPath).create();
  }
}
