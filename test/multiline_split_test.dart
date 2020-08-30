/// ignore_for_file: avoid_print

import 'package:test/test.dart';

import 'package:multiline/multiline.dart';

final List<String> _template = '''

hello world
 with space
|
 |

2 + 2 = 4
${'  '}'''.split('\n');

void main() {
  test('shouldRun', () {
    expect(() => ''.multilineSplit().toList(), returnsNormally);
  });

  test('identical', () {
    final values = '''
    |
    |hello world
    | with space
    ||
    | |
    |
    |2 + 2 = 4
    |${'  '}
    '''.multilineSplit().toList();
    expect(values.length, _template.length);
    expect(values, _template);
  });

  test('withParam', () {
    final values = '''
    |
    |hello world
    | with space
    ||
    | |
    |
    |2 + 2 = ${2 + 2}
    |${'  '}
    '''.multilineSplit().toList();
    expect(values.length, _template.length);
    expect(values, _template);
  });

  test('empty', () {
    final values = ''.multilineSplit().toList();
    expect(values.isEmpty, isTrue);
    expect(values, <String>[]);
  });

  test('String contain n symbols', () {
    final values = '''
    |1\n|2
    |3\n|4
    '''.multilineSplit().toList();
    expect(values, ['1', '2', '3', '4']);
  });

  test('String contain r and n symbols', () {
    final values = '''
    |1\r\n|2
    |3\r\n|4
    '''.multilineSplit().toList();
    expect(values, ['1', '2', '3', '4']);
  });

  test('String contain r symbols', () {
    final values = '''
    |1\r|2
    |3\r|4
    '''.multilineSplit().toList();
    expect(values, ['1', '2', '3', '4']);
  });

  test('Try parse last', () {
    final values = '''
    |1
    |2
    |3
    line without pipe
    '''.multilineSplit();
    expect(int.parse(values.last), 3);
  });

  test('notEmpty', () {
    final values = '''
    |
    |
    '''.multilineSplit().toList();
    expect(values.isNotEmpty, isTrue);
    expect(values, <String>['', '']);
  });

  test('rn then value', () {
    final value = '\r\n|1'.multilineSplit();
    expect(value, ['1']);
  });

  test('print', () {
    final values = '''
    |hello world
    '''.multilineSplit().toList();
    print('Print for multiline split:\n$values');
  });
}
