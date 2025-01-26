

abstract class Failure {}
class OfflineFailure extends Failure{}
class RegisteredEmailFailure extends Failure {}
class InValidEmailFailure extends Failure {}
class WeekPasswordFailure extends Failure{}
class UserDisabledFailure extends Failure {}
class EmailPasswordDisbledFailure extends Failure {}
class SerrverFailure extends Failure{}
           
 class WrongPasswordFailure extends Failure{}
 class UnRegisteredUserFailure extends Failure{}
 class UnHandledFailure extends Failure{}
 class InValidCredentialFailure extends Failure{}