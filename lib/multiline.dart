library multiline;

import 'dart:async' show Future, Stream;
import 'src/transformer.dart';

const SynchronousMultilineTransformer _transformerSync =
    SynchronousMultilineTransformer();
const MultilineTransformer _transformer = MultilineTransformer();

/// Provides convenient access to multiline String records with method extensions.
/// Useful for templates, mockups and SQL queries.
///
/// Just use the symbol "`|`" to indicate the beginning of a line.
/// Beautiful code formatting using some useful extensions to the String methods.
extension Multiline on String {
  /// For asynchronously getting a multiline string
  Future<String> multilineAsync() =>
      Stream<String>.value(this).transform(_transformer).join('\n');

  /// For asynchronously getting a stream with lines
  Stream<String> multilineSplitAsync() =>
      Stream<String>.value(this).transform(_transformer);

  /// To get a listing of strings
  Iterable<String> multilineSplit() => _transformerSync.split(this);

  /// For multiline string (don't be afraid to use, it's fast enough)
  String multiline() => _transformerSync.transform(this);

  /*
  String multilineWithRegExp() =>
    _transformerSync.transformWithRegExp(this);
  */
}
