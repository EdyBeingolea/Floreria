class UserEntity {
  final String id;
  final String fullName;
  final String email;
  final String phone;
  final String? profileImageUrl;
  final String address;
  final String city;
  final DateTime createdAt;
  final bool isVerified;

  UserEntity({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    this.profileImageUrl,
    required this.address,
    required this.city,
    required this.createdAt,
    this.isVerified = false,
  });

  UserEntity copyWith({
    String? id,
    String? fullName,
    String? email,
    String? phone,
    String? profileImageUrl,
    String? address,
    String? city,
    DateTime? createdAt,
    bool? isVerified,
  }) {
    return UserEntity(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      address: address ?? this.address,
      city: city ?? this.city,
      createdAt: createdAt ?? this.createdAt,
      isVerified: isVerified ?? this.isVerified,
    );
  }
}
