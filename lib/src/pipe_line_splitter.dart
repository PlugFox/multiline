// Character constants.
const int _lf = 10;
const int _cr = 13;
const int _vt = 124;

/// Split lines into individual lines.
Iterable<String> pipeLineSplitter(String lines) sync* {
  final length = lines.length;
  var sliceStart = 0;
  var char = 0;
  for (var i = 0; i < length; i++) {
    final previousChar = char;
    char = lines.codeUnitAt(i);
    if (char != _cr) {
      if (char != _lf) continue;
      if (previousChar == _cr) {
        sliceStart = i + 1;
        continue;
      }
    }
    for (var j = sliceStart; j < i; j++) {
      char = lines.codeUnitAt(j);
      if (char != _vt) continue;
      yield lines.substring(j + 1, i);
      break;
    }
    sliceStart = i + 1;
  }
  if (sliceStart < length) {
    for (var j = sliceStart; j < length; j++) {
      char = lines.codeUnitAt(j);
      if (char != _vt) continue;
      yield lines.substring(j + 1, length);
      break;
    }
  }
}
