class Result {
  Result({required this.isHeven});

  Result.fromJson(Map<String, Object?> json)
    : this(
        isHeven: json['isHeven']! as bool,
      );

  final bool isHeven;

  Map<String, Object?> toJson() {
    return {
      'isHeven': isHeven,
    };
  }
}