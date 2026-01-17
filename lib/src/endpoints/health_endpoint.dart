import 'package:serverpod/serverpod.dart';

class HealthEndpoint extends Endpoint {
  Future<String> ping(Session session) async {
    session.log('[Health] ping');
    return 'ok';
  }
}
