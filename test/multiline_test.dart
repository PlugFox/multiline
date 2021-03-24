// ignore_for_file: avoid_print

import 'package:multiline/multiline.dart';
import 'package:test/test.dart';

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

  test('multilineStream', () async {
    final value = await '''
    |
    |hello world
    | with space
    ||
    | |
    |
    |2 + 2 = ${2 + 2}
    |${'  '}
    '''
        .multilineStream()
        .join('\n');
    expect(value.length, _template.length);
    expect(value, _template);
  });

  test('empty', () {
    final value = ''.multiline();
    expect(value.isEmpty, isTrue);
    expect(value, '');
  });

  test('notEmpty', () {
    final value = '''
    |
    |
    '''
        .multiline();
    expect(value.isNotEmpty, isTrue);
    expect(value, '\n');
  });

  test('String contain n symbols', () {
    final value = '''
    |1\n|2
    |3\n|4
    '''
        .multiline();
    expect(value, '1\n2\n3\n4');
  });

  test('String contain r and n symbols', () {
    final value = '''
    |1\r\n|2
    |3\r\n|4
    '''
        .multiline();
    expect(value, '1\n2\n3\n4');
  });

  test('String contain r symbols', () {
    final value = '''
    |1\r|2
    |3\r|4
    '''
        .multiline();
    expect(value, '1\n2\n3\n4');
  });

  test('Try parse last', () {
    final value = '''
    |1
    |2
    |3
    line without pipe
    '''
        .multiline();
    expect(int.parse(value.split('\n').last), 3);
  });

  test('Same multiline string', () {
    final value1 = '''1 '''.multiline();
    final value2 = '''
    |1 '''
        .multiline();
    // ignore: leading_newlines_in_multiline_strings
    final value3 = '''1
    | '''
        .multiline();
    final value4 = '''|1 '''.multiline();

    expect(value1, '');
    expect(value2, '1 ');
    expect(value3, ' ');
    expect(value4, '1 ');
  });

  test('rn then value', () {
    final value = '\r\n|1'.multiline();
    expect(value, '1');
  });

  test('pipeline and separator symbols', () {
    final value = '''
    /a
    /b
    /c
    '''
        .multiline(pipeline: '/', join: ',');
    expect(value, 'a,b,c');
  });

  test('print', () {
    final value = '''
    |hello world
    '''
        .multiline();
    expect(
      () => print('Print for multiline split:\n$value'),
      returnsNormally,
    );
  });
}
