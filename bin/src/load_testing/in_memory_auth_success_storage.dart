import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart';

class InMemoryAuthSuccessStorage implements ClientAuthSuccessStorage {
  AuthSuccess? _authSuccess;

  @override
  Future<AuthSuccess?> get() async {
    return _authSuccess;
  }

  @override
  Future<void> set(AuthSuccess? data) async {
    _authSuccess = data;
  }
}
