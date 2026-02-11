class UserEntity {
  final String uid;
  final String? email;
  final String? displayName;
  final String? photoUrl;

  const UserEntity({
    required this.uid,
    this.email,
    this.displayName,
    this.photoUrl,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserEntity &&
          runtimeType == other.runtimeType &&
          uid == other.uid;

  @override
  int get hashCode => uid.hashCode;

  @override
  String toString() =>
      'UserEntity(uid: $uid, email: $email, displayName: $displayName)';
}
