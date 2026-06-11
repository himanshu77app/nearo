import 'package:equatable/equatable.dart';

// ─────────────────────────────────────────────
// Core Plan entity — pure domain, no Flutter deps
// ─────────────────────────────────────────────
enum PlanStatus { draft, seeking, ready, started, completed, expired }
enum PlanCategory { running, cycling, trek, boardGames, quiz, travel, food, workshop, sports, other }

class Plan extends Equatable {
  final String      id;
  final String      title;
  final PlanCategory category;
  final String?     description;
  final String      organizerId;
  final String      areaName;
  final DateTime    datetime;
  final int         spotsNeeded;
  final int         spotsFilled;
  final PlanStatus  status;
  final DateTime?   expiresAt;
  final DateTime    createdAt;

  // Derived
  int  get spotsLeft      => spotsNeeded - spotsFilled;
  bool get isFull         => spotsFilled >= spotsNeeded;
  bool get isExpired      => status == PlanStatus.expired;
  bool get isSeeking      => status == PlanStatus.seeking;
  bool get isReady        => status == PlanStatus.ready;
  double get fillPercent  => spotsNeeded > 0 ? spotsFilled / spotsNeeded : 0;

  const Plan({
    required this.id,
    required this.title,
    required this.category,
    this.description,
    required this.organizerId,
    required this.areaName,
    required this.datetime,
    required this.spotsNeeded,
    required this.spotsFilled,
    required this.status,
    this.expiresAt,
    required this.createdAt,
  });

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
        id: json['id'] as String,
        title: json['title'] as String,
        category: PlanCategory.values.firstWhere(
          (e) => e.name == json['category'],
          orElse: () => PlanCategory.other,
        ),
        description: json['description'] as String?,
        organizerId: json['organizer_id'] as String,
        areaName: json['area_name'] as String,
        datetime: DateTime.parse(json['datetime'] as String),
        spotsNeeded: json['spots_needed'] as int,
        spotsFilled: json['spots_filled'] as int? ?? 0,
        status: PlanStatus.values.firstWhere(
          (e) => e.name == json['status'],
          orElse: () => PlanStatus.draft,
        ),
        expiresAt: json['expires_at'] != null ? DateTime.parse(json['expires_at'] as String) : null,
        createdAt: DateTime.parse(json['created_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'category': category.name,
        'description': description,
        'organizer_id': organizerId,
        'area_name': areaName,
        'datetime': datetime.toIso8601String(),
        'spots_needed': spotsNeeded,
        'spots_filled': spotsFilled,
        'status': status.name,
        'expires_at': expiresAt?.toIso8601String(),
        'created_at': createdAt.toIso8601String(),
      };

  @override
  List<Object?> get props => [id, title, status, spotsFilled, spotsNeeded];
}
