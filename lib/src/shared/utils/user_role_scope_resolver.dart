import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/shared/constants/auth_scopes.dart';
import 'package:serverpod/serverpod.dart';

class UserRoleScopeResolver {
  const UserRoleScopeResolver._();

  static Set<UserRole> expandRoles(Iterable<UserRole> roles) {
    final expanded = <UserRole>{};

    for (final role in roles) {
      switch (role) {
        case UserRole.learner:
          expanded.add(UserRole.learner);
        case UserRole.author:
          expanded.addAll({UserRole.learner, UserRole.author});
        case UserRole.admin:
          expanded.addAll({
            UserRole.learner,
            UserRole.author,
            UserRole.admin,
          });
      }
    }

    return expanded;
  }

  static Set<String> scopesForRoles(Iterable<UserRole> roles) {
    final expandedRoles = expandRoles(roles);
    final scopes = <String>{};

    for (final role in expandedRoles) {
      switch (role) {
        case UserRole.learner:
          scopes.addAll(AuthScopes.learner);
        case UserRole.author:
          scopes.addAll(AuthScopes.author);
        case UserRole.admin:
          scopes.addAll(AuthScopes.admin);
      }
    }

    return scopes;
  }

  static List<UserRole> rolesFromScopes(Iterable<String> scopes) {
    final scopeSet = scopes.toSet();
    final roles = <UserRole>{};

    if (scopeSet.containsAll(AuthScopes.learner)) {
      roles.add(UserRole.learner);
    }
    if (scopeSet.containsAll(AuthScopes.author)) {
      roles.add(UserRole.author);
    }
    if (scopeSet.containsAll(AuthScopes.admin)) {
      roles.add(UserRole.admin);
    }

    return UserRole.values.where(roles.contains).toList(growable: false);
  }

  static Set<String> mergeManagedScopes({
    required Iterable<String> currentScopes,
    required Iterable<UserRole> roles,
  }) {
    final preservedScopes = currentScopes.toSet().difference(
      AuthScopes.managed,
    );
    return {
      ...preservedScopes,
      ...scopesForRoles(roles),
    };
  }

  static Set<Scope> toServerpodScopes(Iterable<String> scopes) {
    return scopes.map(Scope.new).toSet();
  }
}
