class AuthScopes {
  static const String learnerAccess = 'learner.access';
  static const String cmsAccess = 'cms.access';
  static const String contentManage = 'content.manage';
  static const String adminAccess = 'admin.access';
  static const String usersManage = 'users.manage';

  static const Set<String> learner = {learnerAccess};
  static const Set<String> author = {
    learnerAccess,
    cmsAccess,
    contentManage,
  };
  static const Set<String> admin = {
    learnerAccess,
    cmsAccess,
    contentManage,
    adminAccess,
    usersManage,
  };

  static const Set<String> managed = {
    learnerAccess,
    cmsAccess,
    contentManage,
    adminAccess,
    usersManage,
  };

  const AuthScopes._();
}
