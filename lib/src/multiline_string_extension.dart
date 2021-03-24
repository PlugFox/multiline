import 'pipe_line_splitter.dart';
import 'pipe_line_stream.dart';

/// Provides convenient access to multiline String
/// records with method extensions.
/// Useful for templates, mockups and SQL queries.
///
/// Just use the pipeline symbol "`|`" to indicate the
/// beginning of a line.
/// Beautiful code formatting using some useful
/// extensions to the String methods.
extension MultilineStringX on String {
  /// Return formatted with pipeline symbol "`|`" [String].
  String multiline({String pipeline = '|', String join = '\n'}) =>
      pipeLineSplitter(this, pipeline: pipeline).join(join);

  /// Split lines into individual lines
  /// and returns a [Iterable] of substrings.
  Iterable<String> multilineSplit({String pipeline = '|'}) =>
      pipeLineSplitter(this, pipeline: pipeline);

  /// Split lines into individual lines
  /// and returns a [Stream] of substrings.
  Stream<String> multilineStream({String pipeline = '|'}) =>
      pipeLineStream(this, pipeline: pipeline);
}
