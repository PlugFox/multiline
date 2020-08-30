// ignore_for_file: unused_local_variable

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

  /// Splits the string and returns a [Iterable] of substrings.
  final iterable =
    '''
    |One
    |Two
    |Three
    '''.multilineSplit();
}
