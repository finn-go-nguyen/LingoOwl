class TextHelpers {
  static String toDisplayName({required String firstName, String? lastName}) {
    lastName ??= '';
    return ('$firstName $lastName').trim();
  }

  static String toProgress(double progress) {
    assert(progress >= 0.0 && progress <= 1.0);
    return '${(progress * 100).toStringAsFixed(1)} %';
  }
}
