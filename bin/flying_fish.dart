import 'dart:io';
import 'package:args/command_runner.dart';

import 'commands/create_command.dart';

void main(List<String> arguments) {
  exitCode = 0; // assume success
  CommandRunner(
    'flying_fish',
    'A command line tool for creating FlyingFish projects.',
  )
    ..addCommand(CreateCommand())
    ..run(arguments);
}
