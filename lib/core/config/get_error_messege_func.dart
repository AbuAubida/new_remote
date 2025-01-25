import 'package:chat_app/core/errors/auth/failure.dart';

String getErrorMessageFunc(Failure fail) {
  switch (fail) {
    case RegisteredEmailFailure():
      return "email-already-in-use";

    case InValidEmailFailure():
      return "invalid-email";

    case WeekPasswordFailure():
      return "weak-password";

    case UserDisabledFailure():
      return "user-disabled";

    case EmailPasswordDisbledFailure():
      return "operation-not-allowed";

    case SerrverFailure():
      return "too-many-requests";
    case OfflineFailure():
      return "Oops, You are offline now please check your enternet connection and try later !! ,";
    default:
    return "Unexpected error, please try again";
  }
}
