import '../utils/api_handler.dart';

class VirtualAccountController {
  static Future<dynamic> createVirtualAccount({
    required String publicKey,
    required String tnxRef,
  }) async {
    try {
      var response = await Fetcher.fetch(
          method: Method.post,
          path:
              '/payment-engine/api/v1/web-engine/process/virtual-account-request',
          publicKey: publicKey,
          payloads: {
            "vasRequestType": "GENERATE_TEMPORARY_VIRTUAL_ACCOUNT",
            "transactionRef": tnxRef,
          });
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<dynamic> getVirtualAccountPaymentStatus({
    required String publicKey,
    required String tnxRef,
  }) async {
    try {
      var response = await Fetcher.fetch(
          method: Method.post,
          path:
              '/payment-engine/api/v1/web-engine/process/virtual-account-request',
          publicKey: publicKey,
          payloads: {
            "vasRequestType": "GENERATE_TEMPORARY_VIRTUAL_ACCOUNT",
            "transactionRef": tnxRef
          });
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
