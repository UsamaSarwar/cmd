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
          'https://raw.githubusercontent.com/UsamaSarwar/dev_tools/main/flutter/dev_tools/$script'));
      HttpClientResponse response = await request.close();
      repoData = await response.transform(utf8.decoder).join();
      print(
          '🔹 \x1B[36m$script has been installed at \x1B[37m${Directory.current.path}\\\x1B[36mdev_tools\\$script\x1B[0m');
      File('dev_tools/$script').createSync(recursive: true);
      File('dev_tools/$script').writeAsStringSync(
        repoData,
        flush: true,
      );
    }
    print('''\n
📁 \x1B[33mdev_tools has been installed at \x1B[37m${Directory.current.path}\\\x1B[33mdev_tools\x1B[0m\n\n
✅ \x1B[32mdev_tools installed successfully!\x1B[0m
''');
  } catch (exception) {
    print('⚠️  \x1B[31m${exception.toString()}\x1B[0m');
  } finally {
    client.close();
  }
}
