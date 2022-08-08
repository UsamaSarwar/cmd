// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

void main() async {
  /// List of all the scripts at online GitHub Repository
  List<String> scripts = [
    'doctor.sh',
    'run.sh',
    'build.sh',
  ];
  String repoData;
  HttpClient client = HttpClient();
  try {
    for (String script in scripts) {
      HttpClientRequest request = await client.getUrl(Uri.parse(
          'https://raw.githubusercontent.com/UsamaSarwar/cmd/main/flutter/cmd/$script'));
      HttpClientResponse response = await request.close();
      repoData = await response.transform(utf8.decoder).join();
      print(
          '🔹 \x1B[36m$script has been installed at \x1B[37m${Directory.current.path}\\\x1B[36mcmd\\$script\x1B[0m');
      File('cmd/$script').createSync(recursive: true);
      File('cmd/$script').writeAsStringSync(
        repoData,
        flush: true,
      );
    }
    print('''\n
📁 \x1B[33mcmd has been installed at \x1B[37m${Directory.current.path}\\\x1B[33mcmd\x1B[0m\n\n
✅ \x1B[32mcmd installed successfully!\x1B[0m
''');
  } catch (exception) {
    print('⚠️  \x1B[31m${exception.toString()}\x1B[0m');
  } finally {
    client.close();
  }
}
