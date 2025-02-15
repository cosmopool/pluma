import 'dart:async';
import 'dart:convert';

final _nodes = [];

Future<void> parse(Stream<List<int>> textContentInBytes) async {
  await for (final byte in textContentInBytes) {
    // print('\n$byte\n\n');
    print(_parse(byte));
    // byte.forEach((unit) => print(_parse(unit)));
  }
}

String _parse(List<int> unit) {
  return utf8.decode(unit);
}
