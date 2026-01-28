import 'package:praxis_server/src/app_services.dart';
import 'package:serverpod/serverpod.dart';

final _servicesByServer = Expando<AppServices>(
  'AppServices',
);

extension ServerServices on Server {
  AppServices get services {
    final services = _servicesByServer[this];
    if (services == null) {
      throw StateError(
        'AppServices are not attached to this Serverpod instance.',
      );
    }
    return services;
  }

  set services(AppServices services) {
    _servicesByServer[this] = services;
  }
}
