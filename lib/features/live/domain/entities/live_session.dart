import 'package:equatable/equatable.dart';

class LiveSession extends Equatable {
  final String id;
  final String hostId;
  final String hostName;
  final String? hostAvatarUrl;
  final String title;
  final int viewerCount;
  final DateTime startedAt;

  const LiveSession({
    required this.id,
    required this.hostId,
    required this.hostName,
    this.hostAvatarUrl,
    required this.title,
    required this.viewerCount,
    required this.startedAt,
  });

  factory LiveSession.fromJson(Map<String, dynamic> json) => LiveSession(
        id: json['id'] as String,
        hostId: json['host_id'] as String,
        hostName: json['host_name'] as String,
        hostAvatarUrl: json['host_avatar_url'] as String?,
        title: json['title'] as String,
        viewerCount: json['viewer_count'] as int? ?? 0,
        startedAt: DateTime.parse(json['started_at'] as String),
      );

  @override
  List<Object?> get props => [id, hostId, title, viewerCount];
}
