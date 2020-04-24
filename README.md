# multiline  

![](https://github.com/PlugFox/multiline/raw/master/.img/logo.png)  
  
[![chatroom icon](https://patrolavia.github.io/telegram-badge/chat.png)](https://t.me/PlugFox)
[![MIT License](https://img.shields.io/apm/l/atomic-design-ui.svg?)](https://github.com/plugfox/multiline/blob/master/LICENSE)
[![Pub](https://img.shields.io/pub/v/multiline.svg)](https://pub.dartlang.org/packages/multiline)
  
  
## About  
  
Provides convenient access to multiline String records with method extensions.  
Useful for templates, mockups and SQL queries.  
  
Just use the symbol "`|`" to indicate the beginning of a line.  
Beautiful code formatting using some useful extensions to the String methods.  
  
Available method extensions:  
  
  + `multiline()`           - for multiline string (don't be afraid to use, it's fast enough)  
  
  + `multilineSplit()`      - to get a listing of strings  
  
  + `multilineAsync()`      - for asynchronously getting a multiline string  
  
  + `multilineSplitAsync()` - for asynchronously getting a stream with lines  
  
    
### For example:  
  
```dart
import 'package:multiline/multiline.dart';  // <= import package

void main() {
   // for multiline string (don't be afraid to use, it's fast enough)
   final String string = '''
   |Hello
   |  multiline!
   '''.multiline();

   // to get a listing of strings
   final Iterable<String> stringIterable = '''
   |Hello
   |  multiline!
   '''.multilineSplit();

   // for asynchronously getting a multiline string
   final Future<String> stringAsync = '''
   |Hello
   |  multiline!
   '''.multilineAsync();

   // for asynchronously getting a stream with lines
   final Stream<String> stringStream = '''
   |Hello
   |  multiline!
   '''.multilineSplitAsync();
}

```
  
  
## Changelog  
  
Refer to the [Changelog](https://github.com/plugfox/platform_info/blob/master/CHANGELOG.md) to get all release notes.  
  
  