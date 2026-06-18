import 'package:equatable/equatable.dart';

class NearbyUser extends Equatable {
  final String id;
  final String displayName;
  final String? avatarUrl;
  final double distanceKm;
  final List<String> tags;

  const NearbyUser({
    required this.id,
    required this.displayName,
    this.avatarUrl,
    required this.distanceKm,
    required this.tags,
  });

  factory NearbyUser.fromJson(Map<String, dynamic> json) => NearbyUser(
        id: json['id'] as String,
        displayName: json['display_name'] as String,
        avatarUrl: json['avatar_url'] as String?,
        distanceKm: (json['distance_km'] as num).toDouble(),
        tags: List<String>.from(json['tags'] as List? ?? []),
      );

  @override
  List<Object?> get props => [id, displayName, distanceKm];
}
