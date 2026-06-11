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

  @override
  List<Object?> get props => [id, title, status, spotsFilled, spotsNeeded];
}
