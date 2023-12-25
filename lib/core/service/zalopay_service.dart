import 'package:flutter_zalopay_sdk/flutter_zalopay_sdk.dart';

class ZalopayService {
  Future<FlutterZaloPayStatus> pay(String zpToken) async {
    final FlutterZaloPayStatus status =
        await FlutterZaloPaySdk.payOrder(zpToken: zpToken);
    return status;
  }
}
