/// ignore_for_file: avoid_print

import 'package:test/test.dart';

import 'package:multiline/multiline.dart';

const String _template = '''

hello world
 with space
|
 |

2 + 2 = 4
${'  '}''';

void main() {
  test('shouldRun', () {
    expect(() => ''.multiline(), returnsNormally);
  });

  test('identical', () {
    final value = '''
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
    final value = '''
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

  test('empty', () {
    final value = ''.multiline();
    expect(value.isEmpty, true);
    expect(value, '');
  });

  test('notEmpty', () {
    final value = '''
    |
    |
    '''
        .multiline();
    expect(value.isNotEmpty, true);
    expect(value, '\n');
  });

  test('print', () {
    final value = '''
    |hello world
    '''
        .multiline();
    print('Print for multiline:\n$value');
  });
}
