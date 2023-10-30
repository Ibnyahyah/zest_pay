import '../utils/api_handler.dart';

class PaymentLinkController {
  static Future<dynamic> createPaymentLink({
    required String token,
    required String amount,
    required String customerEmail,
    required String narration,
  }) async {
    try {
      var response = await Fetcher.fetch(
        method: Method.post,
        path: '/root/api/v1/merchant-invoice/process/generate-payment-link',
        publicKey: token,
        payloads: {
          "amountInMinor": amount,
          "customerEmail": customerEmail,
          "details": narration,
        },
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<dynamic> getPaymentLinks({
    required String token,
  }) async {
    try {
      var response = await Fetcher.fetch(
        method: Method.get,
        path: '/root/api/v1/merchant-invoice/process/fetch-all-payment-link',
        publicKey: token,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<dynamic> getPaymentInfo({
    required String token,
    required String paymentCode,
  }) async {
    try {
      var response = await Fetcher.fetch(
        method: Method.get,
        path:
            '/root/api/v1/merchant-invoice/process/retrieve-payment-info?paymentCode=$paymentCode',
        publicKey: token,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
