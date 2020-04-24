// ignore_for_file: unused_local_variable

import 'package:multiline/multiline.dart'; // <= import package

void main() {
  // for multiline string (don't be afraid to use, it's fast enough)
  final String string = '''
   |Hello
   |  multiline!
   '''
      .multiline();

  // to get a listing of strings
  final Iterable<String> stringIterable = '''
   |Hello
   |  multiline!
   '''
      .multilineSplit();

  // for asynchronously getting a multiline string
  final Future<String> stringAsync = '''
   |Hello
   |  multiline!
   '''
      .multilineAsync();

  // for asynchronously getting a stream with lines
  final Stream<String> stringStream = '''
   |Hello
   |  multiline!
   '''
      .multilineSplitAsync();
}
