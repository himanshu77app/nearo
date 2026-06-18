import 'package:equatable/equatable.dart';

class AppUser extends Equatable {
  final String id;
  final String phone;
  final String? displayName;
  final String? avatarUrl;
  final bool isOnboarded;
  final DateTime createdAt;

  const AppUser({
    required this.id,
    required this.phone,
    this.displayName,
    this.avatarUrl,
    required this.isOnboarded,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, phone, displayName, avatarUrl, isOnboarded, createdAt];
}
