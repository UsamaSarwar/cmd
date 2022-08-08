// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

void main() async {
  String repoData;
  HttpClient client = HttpClient();
  try {
    HttpClientRequest request = await client.getUrl(Uri.parse(
        'https://raw.githubusercontent.com/UsamaSarwar/dev_tools/flutter/master/bin/bin/flutter.dart'));
    
    HttpClientResponse response = await request.close();
    // Process the response
    repoData = await response.transform(utf8.decoder).join();
    print(repoData);
    File('dev_tools/doctor.sh').createSync(recursive: true);
    File('dev_tools/doctor.sh').writeAsStringSync(
      repoData,
      // '#!/bin/sh\nflutter doctor -v',
      // mode: FileMode.writeOnlyAppend,
      flush: true,
    );
    print('''✅ \x1B[32mDevTools installed successfully!\x1B[0m
📁 \x1B[33mdev_tools has been generated at \x1B[37m${Directory.current.path}\\dev_tools\\\x1B[0m
''');
  } catch (e) {
    print('⚠️  \x1B[31m${e.toString()}\x1B[0m');
  } finally {
    client.close();
  }
}
