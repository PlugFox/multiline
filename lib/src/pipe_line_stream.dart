import 'pipe_line_splitter.dart';

/// Split lines into individual lines as stream
Stream<String> pipeLineStream(String lines, {String pipeline = '|'}) =>
    Stream<String>.fromIterable(pipeLineSplitter(lines, pipeline: pipeline));
