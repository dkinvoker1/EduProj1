class Result {
  Result({required this.userUid, required this.isHeven});

  final String userUid;
  final bool isHeven;

  Result.fromJson(Map<String, Object?> json)
      : this(
          userUid: json['userUid']! as String,
          isHeven: json['isHeven']! as bool,
        );

  Map<String, Object?> toJson() {
    return {
      'userUid': userUid,
      'isHeven': isHeven,
    };
  }
}
