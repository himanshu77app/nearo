import '../../../../core/errors/failures.dart';
import '../entities/live_session.dart';

abstract class LiveRepository {
  Future<(List<LiveSession>?, Failure?)> fetchActiveSessions();
  Future<(LiveSession?, Failure?)> startSession(String title);
  Future<(void, Failure?)> endSession(String sessionId);
  Stream<List<LiveSession>> watchActiveSessions();
}
