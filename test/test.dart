library test.multiline;

import 'package:test/test.dart';

import 'src/multiline_async_test.dart' as multiline_async;
import 'src/multiline_split_async_test.dart' as multiline_split_async;
import 'src/multiline_split_test.dart' as multiline_split;
import 'src/multiline_test.dart' as multiline;

void main() {
  group('multilineAsync', multiline_async.main);
  group('multilineSplitAsync', multiline_split_async.main);
  group('multilineSplit', multiline_split.main);
  group('multiline', multiline.main);
}
