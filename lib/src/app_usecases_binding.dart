import 'package:praxis_server/src/app_usecases.dart';
import 'package:serverpod/serverpod.dart';

final Expando<AppUseCases> _useCasesByServer = Expando<AppUseCases>(
  'AppUseCases',
);

extension ServerUseCases on Server {
  AppUseCases get useCases {
    final useCases = _useCasesByServer[this];
    if (useCases == null) {
      throw StateError('AppUseCases are not attached to this Server instance.');
    }
    return useCases;
  }

  set useCases(AppUseCases useCases) {
    _useCasesByServer[this] = useCases;
  }
}
