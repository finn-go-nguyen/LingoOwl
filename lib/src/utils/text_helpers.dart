import 'package:flutter_riverpod/flutter_riverpod.dart';

final textHelpersProvider = Provider<TextHelpers>((ref) {
  return TextHelpers();
});

class TextHelpers {
  String toDisplayName({required String firstName, String? lastName}) {
    lastName ??= '';
    return ('$firstName $lastName').trim();
  }

  String toProgress(double progress) {
    assert(progress >= 0.0 && progress <= 1.0);
    return '${(progress * 100).toStringAsFixed(1)} %';
  }

  String toTimeLabel(int seconds, {required bool showHour}) {
    assert(seconds >= 0);
    String result =
        (seconds % Duration.secondsPerMinute).toString().padLeft(2, '0');
    String minutes = (seconds / Duration.secondsPerMinute)
        .floor()
        .toString()
        .padLeft(2, '0');
    result = '$minutes:$result';

    if (showHour) {
      String hours = (seconds / Duration.secondsPerHour)
          .floor()
          .toString()
          .padLeft(2, '0');
      result = '$hours:$result';
    }
    return result;
  }
}
