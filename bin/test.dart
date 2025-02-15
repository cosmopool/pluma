import 'dart:io';

import 'package:pluma/src/parser.dart';

void main() {
  final a = File('bin/sample.rtf');
  parse(a.openRead());
}
