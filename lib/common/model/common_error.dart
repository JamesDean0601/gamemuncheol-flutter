class UnKnown implements Exception {
  final String message = "알 수 없는 오류가 발생했습니다. 잠시 후 다시 시도해 주세요.";

  UnKnown({
    String? message,
  });
}