import 'package:zest_pay/controller/paymentChannelController.dart';
import 'package:zest_pay/controller/paymentLinkController.dart';
import 'package:zest_pay/controller/transactionController.dart';
import 'package:zest_pay/controller/virtualAccountController.dart';

part 'controllerCaller.dart';

String _publicKey = "";

class ZestPay extends ControllerCaller {
  static bool _sdkInitialized = false;
  // Initializing the budpay object with the appID and the apiKey that are required for API
  static initialize({
    required String publicKey,
  }) async {
    assert(() {
      if (publicKey.isEmpty) {
        throw Exception('public cannot be null or empty');
      }
      return true;
    }());
    if (_sdkInitialized) return;
    try {
      _sdkInitialized = true;
      _publicKey = publicKey;
      print(publicKey);
    } catch (e) {
      rethrow;
    }
  }

  // getting sdkInitializer value
  bool get sdkInitialized => _sdkInitialized;

  String get public_id {
    // validating sdkInitializer is initialized
    _validateSdkInitialized();
    return _publicKey;
  }

  _print() {
    if (sdkInitialized) {
      print({sdkInitialized, public_id});
    }
  }

  // checking performance
  void _performance() {
    _print();
    // Validate SDK that have been initialize
    _validateSdkInitialized();

    // checking for null and empty value
    if (_publicKey.isEmpty) {
      throw Exception("zest_pay not initialized, required your public-key.");
    }
    if (_publicKey.length < 20 || !_publicKey.contains('_')) {
      throw Exception("zest_pay public key is too short and Invalid.");
    }
  }

  // initialize validator
  _validateSdkInitialized() {
    if (!sdkInitialized) {
      throw Exception('zest_pay SDK has not been initialized. The SDK has'
          ' to be initialized before use');
    }
  }
}
