import 'dart:ffi';

enum Type { controlWord, controlSymbol, group, plainText }

enum ControlWord { clFitText }

enum Style { bold }

final class Node {
  Node({required this.index, required this.type, required this.text, required this.style});

  final int index;
  final Type type;
  final String? text;
  final Style? style;

  Node? get parent => throw 'Unimplemented';
}

abstract base class _Tree {
  /// TODO: write doc
  List<Type?> get types;

  /// TODO: write doc
  List<String?> get texts;

  /// TODO: write doc
  List<Style?> get styles;

  /// TODO: write doc
  List<int?> get parents;

  /// TODO: write doc
  List<int?> get children;

  /// TODO: write doc
  List<int?> get childrenRange;

  /// TODO: write doc
  List<int?> getChildren(int nodeIndex);

  /// TODO: write doc
  void _updateChildren();
}

final class TreeRTF implements _Tree {
  static const _initialListSize = 5000;
  static final _typesIndex = Type.values.map((value) => value.index);

  @override
  final List<int> types = List.filled(_initialListSize, null, growable: true);

  @override
  final List<String?> texts = List.filled(_initialListSize, null, growable: true);

  @override
  final List<Style?> styles = List.filled(_initialListSize, null, growable: true);

  @override
  final List<int?> parents = List.filled(_initialListSize, null, growable: true);

  @override
  final List<int?> children = List.filled(_initialListSize, null, growable: true);

  @override
  final List<int?> childrenRange = List.filled(_initialListSize, null, growable: true);

  Node? node(int index) {
    throw 'Unimplemented';
    return Node(index: index, type: type, text: text, style: style);
  }

  @override
  List<int?> getChildren(int nodeIndex) {
    assert(nodeIndex < childrenRange.length);

    _updateChildren();

    const vecSize = 2;
    for (var i = 0; i < childrenRange.length / vecSize; i++) {
      final index = i * vecSize;
      final start = childrenRange[index];
      final end = childrenRange[index + 1];

      assert(
        (start == null && end == null) || (start != null && end != null),
        'start and end must be null or not null at the same time',
      );
      if (start == null || end == null) return [];

      assert(start < childrenRange.length);
      assert(end < childrenRange.length);

      return childrenRange.sublist(start, end + 1);
    }

    throw 'Unimplemented';
  }

  @override
  void _updateChildren() {
    // TODO: when a children is removed or added we should update `children` and `childrenRange` arrays
    throw 'Unimplemented';
  }
}
