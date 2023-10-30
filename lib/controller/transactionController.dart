import '../utils/api_handler.dart';

class TransactionController {
  static Future<void> initializeTransaction({
    required String publicKey,
    required String email,
    required String currency,
    required String amount,
  }) async {
    try {
      var response = await Fetcher.fetch(
        method: Method.post,
        path:
            '/payment-engine/api/v1/web-engine/process/transaction-initialization',
        publicKey: publicKey,
        payloads: {
          "email": email,
          "currency": currency,
          "amount": amount,
        },
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<dynamic> verifyTransaction({
    required String publicKey,
    required String tnxRef,
  }) async {
    try {
      var response = await Fetcher.fetch(
        method: Method.get,
        path: '/payment-engine/transaction-verification?ref=$tnxRef',
        publicKey: publicKey,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
