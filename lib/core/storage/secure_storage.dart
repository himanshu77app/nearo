import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// ─────────────────────────────────────────────
// Secure key-value store for sensitive data
// e.g. phone number, session token backup
// ─────────────────────────────────────────────
class SecureStorageService {
  static const _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
    iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
  );

  static const _keyPhone       = 'user_phone';
  static const _keyPushToken   = 'push_token';
  static const _keyOnboarded   = 'onboarded';

  // Phone
  static Future<void> savePhone(String phone)      => _storage.write(key: _keyPhone, value: phone);
  static Future<String?> getPhone()                => _storage.read(key: _keyPhone);
  static Future<void> deletePhone()                => _storage.delete(key: _keyPhone);

  // Push token
  static Future<void> savePushToken(String token)  => _storage.write(key: _keyPushToken, value: token);
  static Future<String?> getPushToken()            => _storage.read(key: _keyPushToken);

  // Onboarding
  static Future<void> setOnboarded()               => _storage.write(key: _keyOnboarded, value: 'true');
  static Future<bool> isOnboarded()  async {
    final v = await _storage.read(key: _keyOnboarded);
    return v == 'true';
  }

  // Wipe all — on sign out
  static Future<void> clearAll()                   => _storage.deleteAll();
}
