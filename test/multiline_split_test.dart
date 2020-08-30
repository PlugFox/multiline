/// ignore_for_file: avoid_print

import 'package:test/test.dart';

import 'package:multiline/multiline.dart';

final List<String> _template = '''

hello world
 with space
|
 |

2 + 2 = 4
${'  '}'''
    .split('\n');

void main() {
  test('shouldRun', () {
    '''
    |hello world
    '''
        .multilineSplit()
        .toList();
    expect(true, true);
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
        .multilineSplit()
        .toList();
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
        .multilineSplit()
        .toList();
    expect(value.length, _template.length);
    expect(value, _template);
  });

  test('empty', () {
    final value = ''.multilineSplit().toList();
    expect(value.isEmpty, true);
    expect(value, <String>[]);
  });

  test('notEmpty', () {
    final value = '''
    |
    |
    '''
        .multilineSplit()
        .toList();
    expect(value.isNotEmpty, true);
    expect(value, <String>['', '']);
  });

  test('print', () {
    final value = '''
    |hello world
    '''
        .multilineSplit()
        .toList();
    print('Print for multiline split:\n$value');
  });
}
