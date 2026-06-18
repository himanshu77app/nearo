import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/live_session.dart';
import '../../domain/repositories/live_repository.dart';
import '../sources/supabase_live_source.dart';

class LiveRepositoryImpl implements LiveRepository {
  final LiveRemoteSource _remote;

  const LiveRepositoryImpl(this._remote);

  @override
  Future<(List<LiveSession>?, Failure?)> fetchActiveSessions() async {
    try {
      final data = await _remote.fetchActiveSessions();
      return (data.map(LiveSession.fromJson).toList(), null);
    } on NetworkException catch (e) {
      return (null, NetworkFailure(e.message ?? 'No internet'));
    } catch (_) {
      return (null, const UnknownFailure());
    }
  }

  @override
  Future<(LiveSession?, Failure?)> startSession(String title) async {
    try {
      final data = await _remote.startSession(title);
      return (LiveSession.fromJson(data), null);
    } on ServerException catch (e) {
      return (null, ServerFailure(e.message ?? 'Could not start session'));
    } catch (_) {
      return (null, const UnknownFailure());
    }
  }

  @override
  Future<(void, Failure?)> endSession(String sessionId) async {
    try {
      await _remote.endSession(sessionId);
      return (null, null);
    } catch (_) {
      return (null, const UnknownFailure());
    }
  }

  @override
  Stream<List<LiveSession>> watchActiveSessions() => _remote
      .watchActiveSessions()
      .map((list) => list.map(LiveSession.fromJson).toList());
}
