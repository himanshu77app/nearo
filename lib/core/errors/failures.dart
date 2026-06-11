import 'package:equatable/equatable.dart';

// ─────────────────────────────────────────────
// Base failure — every error in the app maps to one of these
// ─────────────────────────────────────────────
abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);
  @override
  List<Object> get props => [message];
}

class NetworkFailure     extends Failure { const NetworkFailure([super.message = 'No internet connection']); }
class ServerFailure      extends Failure { const ServerFailure([super.message = 'Server error. Try again.']); }
class AuthFailure        extends Failure { const AuthFailure([super.message = 'Authentication failed']); }
class NotFoundFailure    extends Failure { const NotFoundFailure([super.message = 'Not found']); }
class PermissionFailure  extends Failure { const PermissionFailure([super.message = 'Permission denied']); }
class CacheFailure       extends Failure { const CacheFailure([super.message = 'Local data error']); }
class ValidationFailure  extends Failure { const ValidationFailure([super.message = 'Invalid input']); }
class UnknownFailure     extends Failure { const UnknownFailure([super.message = 'Something went wrong']); }
