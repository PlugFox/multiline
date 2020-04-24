/// ignore_for_file: avoid_print

import 'package:test/test.dart';

import 'package:multiline/multiline.dart';

const String _template = '''

hello world
 with space
|
 |

2 + 2 = 4
${'  '}
''';

void main() {
  test('shouldRun', () {
    r'''
    |hello world
    '''
        .multiline();
    expect(true, true);
  });

  test('identical', () {
    final String value = '''
    |
    |hello world
    | with space
    ||
    | |
    |
    |2 + 2 = 4
    |${'  '}
    '''
        .multiline();
    expect(value.length, _template.length);
    expect(value, _template);
  });

  test('withParam', () {
    final String value = '''
    |
    |hello world
    | with space
    ||
    | |
    |
    |2 + 2 = ${2 + 2}
    |${'  '}
    '''
        .multiline();
    expect(value.length, _template.length);
    expect(value, _template);
  });

  test('print', () {
    final String value = '''
    |hello world
    '''
        .multiline();
    print('Print for multiline:\n$value');
  });
}
