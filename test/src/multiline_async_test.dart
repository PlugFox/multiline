/// ignore_for_file: avoid_print, await_only_futures

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
  test('shouldRun', () async {
    await r'''
    |hello world
    '''
        .multilineAsync();
    expect(true, true);
  });

  test('identical', () async {
    final String value = await '''
    |
    |hello world
    | with space
    ||
    | |
    |
    |2 + 2 = 4
    |${'  '}
    '''
        .multilineAsync();
    expect(value.length, _template.length);
    expect(value, _template);
  });

  test('withParam', () async {
    final String value = await '''
    |
    |hello world
    | with space
    ||
    | |
    |
    |2 + 2 = ${2 + 2}
    |${'  '}
    '''
        .multilineAsync();
    expect(value.length, _template.length);
    expect(value, _template);
  });

  test('print', () async {
    final String value = await '''
    |hello world
    '''
        .multilineAsync();
    print('Print for multiline async:\n$value');
  });
}
