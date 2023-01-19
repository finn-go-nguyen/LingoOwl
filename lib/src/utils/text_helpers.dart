class TextHelpers {
  static String toDisplayName({required String firstName, String? lastName}) {
    lastName ??= '';
    return ('$firstName $lastName').trim();
  }
}
