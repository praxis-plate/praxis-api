import 'package:serverpod/serverpod.dart';

class EmailIdpNotificationService {
  const EmailIdpNotificationService();

  void sendRegistrationCode(
    Session session, {
    required String email,
    required UuidValue accountRequestId,
    required String verificationCode,
    required Transaction? transaction,
  }) {
    // NOTE: Here you call your mail service to send the verification code to
    // the user. For testing, we will just log the verification code.
    session.log('[EmailIdp] Registration code ($email): $verificationCode');
  }

  void sendPasswordResetCode(
    Session session, {
    required String email,
    required UuidValue passwordResetRequestId,
    required String verificationCode,
    required Transaction? transaction,
  }) {
    // NOTE: Here you call your mail service to send the verification code to
    // the user. For testing, we will just log the verification code.
    session.log('[EmailIdp] Password reset code ($email): $verificationCode');
  }
}
