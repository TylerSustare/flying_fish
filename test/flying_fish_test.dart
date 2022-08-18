import 'dart:io';

import 'package:flying_fish/flying_fish.dart';
import 'package:flying_fish/src/enums/project_mode.dart';
import 'package:test/test.dart';
import 'package:path/path.dart' as path;

const String kProjectName = 'test_project';
const String kDefaultProjectName = 'flying_fish';
const String kNewProjectName = 'new_project';

void main() {
  var testProjectPath = path.relative(kProjectName);

  void _deleteTestProject() {
    // remove existing test project
    if (Directory(testProjectPath).existsSync()) {
      Directory(testProjectPath).deleteSync(recursive: true);
    }
  }

  group('create command - server only', () {
    setUp(_deleteTestProject);
    tearDown(_deleteTestProject);

    test('FlyingFish defaults', () {
      var project = FlyingFish();
      expect(project.projectName, kDefaultProjectName);
      expect(project.projectMode, ProjectMode.fullStack);
    });

    test('FlyingFish with custom name', () {
      var project = FlyingFish(projectName: kNewProjectName);
      expect(project.projectName, kNewProjectName);
      expect(project.projectMode, ProjectMode.fullStack);
    });

    test('create project files', () async {
      var project = FlyingFish(
        projectName: kProjectName,
        projectMode: ProjectMode.serverOnly,
      );
      await project.create();
      var config = File('$testProjectPath/flying_fish.yaml');
      var readme = File('$testProjectPath/README.md');
      expect(Directory(testProjectPath).existsSync(), true);
      expect(readme.existsSync(), true);
      expect(config.existsSync(), true);
      expect(
        config.readAsStringSync().contains(kProjectName),
        true,
      );
      expect(
        config.readAsStringSync().contains(ProjectMode.serverOnly.name),
        true,
      );
    });
  });
}
