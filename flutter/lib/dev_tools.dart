// ignore_for_file: avoid_print

library dev_tools;

import 'dart:io';

export 'dev_tools.dart';

class DevTools {
  DevTools() {
    print(
        '''\x1B[33mRun "flutter pub run dev_tools:flutter" to install DevTools.
📁 dev_tools will be installed at \x1B[37m${Directory.current.path}\\dev_tools\\\x1B[0m
''');
  }
}
