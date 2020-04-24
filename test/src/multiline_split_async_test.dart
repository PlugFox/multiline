/// ignore_for_file: avoid_print, await_only_futures

import 'package:test/test.dart';

import 'package:multiline/multiline.dart';

final List<String> _template = '''

hello world
 with space
|
 |

2 + 2 = 4
${'  '}
'''
    .split('\n');

void main() {
  test('shouldRun', () async {
    await r'''
    |hello world
    '''
        .multilineSplitAsync()
        .toList();
    expect(true, true);
  });

  test('identical', () async {
    final List<String> value = await '''
    |
    |hello world
    | with space
    ||
    | |
    |
    |2 + 2 = 4
    |${'  '}
    '''
        .multilineSplitAsync()
        .toList();
    expect(value.length, _template.length);
    expect(value, _template);
  });

  test('withParam', () async {
    final List<String> value = await '''
    |
    |hello world
    | with space
    ||
    | |
    |
    |2 + 2 = ${2 + 2}
    |${'  '}
    '''
        .multilineSplitAsync()
        .toList();
    expect(value.length, _template.length);
    expect(value, _template);
  });

  test('print', () async {
    final List<String> value = await '''
    |hello world
    '''
        .multilineSplitAsync()
        .toList();
    print('Print for multiline split async:\n$value');
  });
}
