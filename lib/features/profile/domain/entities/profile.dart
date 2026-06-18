import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  final String userId;
  final String displayName;
  final String? bio;
  final String? avatarUrl;
  final List<String> tags;
  final int plansCount;
  final int friendsCount;

  const Profile({
    required this.userId,
    required this.displayName,
    this.bio,
    this.avatarUrl,
    required this.tags,
    required this.plansCount,
    required this.friendsCount,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        userId: json['user_id'] as String,
        displayName: json['display_name'] as String,
        bio: json['bio'] as String?,
        avatarUrl: json['avatar_url'] as String?,
        tags: List<String>.from(json['tags'] as List? ?? []),
        plansCount: json['plans_count'] as int? ?? 0,
        friendsCount: json['friends_count'] as int? ?? 0,
      );

  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'display_name': displayName,
        'bio': bio,
        'avatar_url': avatarUrl,
        'tags': tags,
      };

  @override
  List<Object?> get props => [userId, displayName, bio, avatarUrl, tags];
}
