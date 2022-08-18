import 'package:args/command_runner.dart' show Command;
import 'package:flying_fish/flying_fish.dart';
import 'package:flying_fish/src/constants.dart';

import 'alias_mapper.dart';

class CreateCommand extends Command {
  CreateCommand() {
    argParser.addOption(
      kMode,
      abbr: 'm',
      defaultsTo: kFullStack,
      allowed: [
        kFullStack,
        kFull,
        kServerOnly,
        kServer,
        's',
        kFlutterOnly,
        kFlutter,
        'f',
      ],
      help: '''
The project mode

fullStack - alias `full` - creates a full stack project
serverOnly - alias `server` & `s` - creates a server only project
flutterOnly - alias `flutter` & `f` - creates a flutter only project
      ''',
    );
    argParser.addOption(
      kProjectName,
      abbr: 'n',
      defaultsTo: 'flying_fish',
    );
  }

  @override
  String get description => 'Creates a new FlyingFish project.';

  @override
  String get name => 'create';

  @override
  Future<void> run() {
    return FlyingFish(
      projectMode: AliasMapper.getProjectMode(argResults![kMode]),
      projectName: argResults![kProjectName],
    ).create();
  }
}
