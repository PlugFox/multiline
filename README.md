# multiline  

![](https://github.com/PlugFox/multiline/raw/master/.img/logo.png)  
  
[![Actions Status](https://github.com/PlugFox/multiline/workflows/multiline/badge.svg)](https://github.com/PlugFox/multiline/actions)
[![Coverage](https://codecov.io/gh/PlugFox/multiline/branch/master/graph/badge.svg)](https://codecov.io/gh/PlugFox/multiline)
[![Pub](https://img.shields.io/pub/v/multiline.svg)](https://pub.dev/packages/platform_info)
[![License: WTFPL](https://img.shields.io/badge/License-WTFPL-brightgreen.svg)](https://en.wikipedia.org/wiki/WTFPL)
[![effective_dart](https://img.shields.io/badge/style-effective_dart-40c4ff.svg)](https://github.com/tenhobi/effective_dart)
  
  
## About  
  
Provides convenient access to multiline String records with method extensions.  
Useful for templates, mockups and SQL queries.  
  
Just use the symbol "`|`" to indicate the beginning of a line.  
Beautiful code formatting using some useful extensions to the String methods.  
  
Available method extensions:  
  
  + `multiline()`      - return formatted with pipeline symbol "`|`" `String`. 
  
  + `multilineSplit()` - splits the string and returns a `Iterable<String>` of substrings.
  
    
## For example  
  
```dart
import 'package:multiline/multiline.dart'; // <= import package

void main() {
  /// Return formatted with pipeline symbol "`|`" [String].
  final string =
    '''
    |/*
    | * List of books and the number of
    | * authors associated with each book
    | */
    |SELECT
    |      `books`.`title` AS `Title`,
    |       count(*)       AS `Authors`
    |FROM  `books`
    |JOIN  `authors`
    |  ON  `books`.`isbn` = `authors`.`isbn`
    |GROUP BY
    |      `books`.`title`
    |ORDER BY
    |      `books`.`title` ASC
    |;
    '''.multiline();
  print(string);

  /// Splits the string and returns a [Iterable] of substrings.
  final iterable =
    '''
    | * One
    | * Two
    | * Three
    '''.multilineSplit();
  iterable.forEach(print);
}
```
  
  
## Coverage  
  
[![](https://codecov.io/gh/PlugFox/multiline/branch/dev/graphs/sunburst.svg)](https://codecov.io/gh/PlugFox/multiline/branch/master)  
  
  
## Changelog  
  
Refer to the [Changelog](https://github.com/plugfox/multiline/blob/master/CHANGELOG.md) to get all release notes.  
  
  
## Maintainers  
  
[Plague Fox](https://plugfox.dev)  
  
  
## License  
  
[WTFPL](https://github.com/plugfox/multiline/blob/master/LICENSE)  
  
  