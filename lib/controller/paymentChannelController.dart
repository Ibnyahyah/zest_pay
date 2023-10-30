import '../utils/api_handler.dart';

class PaymentChannelController {
  static Future<dynamic> initializePayment({
    required String publicKey,
    required String email,
    required int amount,
    required String currency,
  }) async {
    try {
      var response = await Fetcher.fetch(
          method: Method.post,
          path:
              '/payment-engine/api/v1/web-engine/process/transaction-initialization',
          publicKey: publicKey,
          payloads: {"email": email, "amount": amount, "currency": currency});
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<dynamic> cardRequest({
    required String publicKey,
    required String email,
    required String authData,
    required String currency,
  }) async {
    try {
      final dateNow = DateTime.now();
      final tnxRef = dateNow.millisecondsSinceEpoch;
      var response = await Fetcher.fetch(
          method: Method.post,
          path: '/payment-engine/api/v1/web-engine/process/card-request',
          publicKey: publicKey,
          payloads: {
            "cardRequestType": "INITIATE_CARD_PAYMENT",
            "email": email,
            "transactionRef": "${tnxRef}QLCUP",
            "currency": currency,
            "authData": authData,
            "tokenizeCard": "true"
          });
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<dynamic> recurringPaymentWithCard({
    required String publicKey,
    required String email,
    required String cardId,
    required String currency,
  }) async {
    try {
      final dateNow = DateTime.now();
      final tnxRef = dateNow.millisecondsSinceEpoch;
      var response = await Fetcher.fetch(
          method: Method.post,
          path: '/payment-engine/api/v1/web-engine/process/card-request',
          publicKey: publicKey,
          payloads: {
            "cardRequestType": "TOKEN_PAYMENT",
            "email": email,
            "transactionRef": "${tnxRef}QLCUP",
            "currency": currency,
            "cardId": cardId
          });
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<dynamic> payWithUSSD({
    required String publicKey,
    required String tnxRef,
  }) async {
    try {
      var response = await Fetcher.fetch(
        method: Method.post,
        path: '/payment-engine/api/v1/web-engine/process/ussd-request',
        publicKey: publicKey,
        payloads: {
          "ussdRequestType": "USSD_CODE_GENERATION",
          "reference": tnxRef,
        },
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<dynamic> getUSSDPaymentStatus({
    required String publicKey,
    required String tnxRef,
  }) async {
    try {
      var response = await Fetcher.fetch(
        method: Method.post,
        path: '/payment-engine/api/v1/web-engine/process/ussd-request',
        publicKey: publicKey,
        payloads: {
          "ussdRequestType": "USSD_CODE_GENERATION",
          "reference": tnxRef
        },
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<dynamic> initializeQRCodePayment({
    required String publicKey,
    required String merchantRef,
  }) async {
    try {
      var response = await Fetcher.fetch(
        method: Method.post,
        path: '/payment-engine/api/v1/web-engine/process/qr-request',
        publicKey: publicKey,
        payloads: {
          "qrRequestType": "GENERATE_QR",
          "merchantTransactionReference": merchantRef
        },
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<dynamic> getQRCodePaymentStatus({
    required String publicKey,
    required String tnxRef,
  }) async {
    try {
      var response = await Fetcher.fetch(
        method: Method.post,
        path: '/payment-engine/api/v1/web-engine/process/qr-request',
        publicKey: publicKey,
        payloads: {
          "qrRequestType": "CONFIRM_QR_PAYMENT",
          "transactionReference": tnxRef,
        },
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
