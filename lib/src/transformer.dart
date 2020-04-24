import 'dart:async';
import 'dart:convert' show LineSplitter;

/// SynchronousMultilineTransformer
class SynchronousMultilineTransformer {
  /// SynchronousMultilineTransformer constructor
  const SynchronousMultilineTransformer();

  /// transform to multiline string
  String transform(String sourceString) => split(sourceString).join('\n');

  /// split and process
  Iterable<String> split(String sourceString) sync* {
    final List<String> _list = sourceString.split('\n');
    for (final String _s in _list) {
      yield replace(_s);
    }
  }

  /// Trim left and '|' symbol
  String replace(String sourceString) {
    sourceString = sourceString.trimLeft();
    if (sourceString.isNotEmpty && sourceString[0] == r'|') {
      return sourceString.substring(1);
    }
    return sourceString;
  }

  /*
  String transformWithRegExp(String sourceString) =>
    sourceString.replaceAll(RegExp(r'^\s*\|', multiLine: true), '');
  */
}

/// MultilineTransformer
class MultilineTransformer implements StreamTransformer<String, String> {
  final bool _cancelOnError;

  /// MultilineTransformer constructor
  const MultilineTransformer({bool cancelOnError = false})
      : _cancelOnError = cancelOnError ?? false;

  @override
  Stream<String> bind(Stream<String> sourceStream) {
    const SynchronousMultilineTransformer _syncTransformer =
        SynchronousMultilineTransformer();
    StreamSubscription<String> subscription;
    final SynchronousStreamController<String> controller =
        StreamController<String>(
      onPause: () => subscription.pause(),
      onResume: () => subscription.resume(),
      onCancel: () => subscription.cancel(),
      sync: true,
    ) as SynchronousStreamController<String>;
    subscription = sourceStream.transform(const LineSplitter()).listen(
        (String v) => controller.add(_syncTransformer.replace(v)),
        cancelOnError: _cancelOnError,
        onDone: controller.close,
        onError: controller.addError);
    return sourceStream.isBroadcast
        ? controller.stream.asBroadcastStream()
        : controller.stream;
  }

  @override
  StreamTransformer<RS, RT> cast<RS, RT>() =>
      StreamTransformer.castFrom<String, String, RS, RT>(this);
}