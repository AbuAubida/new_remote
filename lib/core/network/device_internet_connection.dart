import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class DeviceInternetConnection {
  Future<bool> getConnection();
}

class DeviceInternetConnectionImp extends DeviceInternetConnection {
  final InternetConnectionChecker internet;

  DeviceInternetConnectionImp({required this.internet});
  @override
  Future<bool> getConnection() async {
    if (await internet.connectionStatus == InternetConnectionStatus.connected) {
      return true;
    } else {
      return false;
    }
  }
}
