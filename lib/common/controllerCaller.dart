part of './zest_plugin.dart';

class ControllerCaller {
  // Payment channel
  Future<dynamic> initializePayment({
    required String email,
    required int amount,
    required String currency,
  }) async {
    return await PaymentChannelController.initializePayment(
      publicKey: _publicKey,
      email: email,
      amount: amount,
      currency: currency,
    );
  }

  Future<dynamic> cardRequest({
    required String email,
    required String amount,
    required String currency,
    required String authData,
  }) async {
    return await PaymentChannelController.cardRequest(
      publicKey: _publicKey,
      email: email,
      authData: authData,
      currency: currency,
    );
  }

  Future<dynamic> recurringPaymentWithCard({
    required String email,
    required String amount,
    required String currency,
    required String cardId,
  }) async {
    return await PaymentChannelController.recurringPaymentWithCard(
      publicKey: _publicKey,
      email: email,
      cardId: cardId,
      currency: currency,
    );
  }

  Future<dynamic> payWithUSSD({required String tnxRef}) async {
    return await PaymentChannelController.payWithUSSD(
      publicKey: _publicKey,
      tnxRef: tnxRef,
    );
  }

  Future<dynamic> getUSSDPaymentStatus({required String tnxRef}) async {
    return await PaymentChannelController.getUSSDPaymentStatus(
      publicKey: _publicKey,
      tnxRef: tnxRef,
    );
  }

  Future<dynamic> initializeQRCodePayment({required String merchantRef}) async {
    return await PaymentChannelController.initializeQRCodePayment(
      publicKey: _publicKey,
      merchantRef: merchantRef,
    );
  }

  Future<dynamic> getQRCodePaymentStatus({required String tnxRef}) async {
    return await PaymentChannelController.getQRCodePaymentStatus(
      publicKey: _publicKey,
      tnxRef: tnxRef,
    );
  }

  // Payment Link
  Future<dynamic> createPaymentLink({
    required String token,
    required String amount,
    required String customerEmail,
    required String narration,
  }) async {
    return await PaymentLinkController.createPaymentLink(
      token: token,
      amount: amount,
      customerEmail: customerEmail,
      narration: narration,
    );
  }

  Future<dynamic> getPaymentLinks({
    required String token,
  }) async {
    return await PaymentLinkController.getPaymentLinks(
      token: token,
    );
  }

  Future<dynamic> getPaymentInfo({
    required String token,
    required String paymentCode,
  }) async {
    return await PaymentLinkController.getPaymentInfo(
      token: token,
      paymentCode: paymentCode,
    );
  }

  // Transaction
  Future<dynamic> initializeTransaction({
    required String email,
    required String currency,
    required String amount,
  }) async {
    return await TransactionController.initializeTransaction(
      publicKey: _publicKey,
      email: email,
      currency: currency,
      amount: amount,
    );
  }

  Future<dynamic> verifyTransaction({
    required String tnxRef,
  }) async {
    return await TransactionController.verifyTransaction(
        publicKey: _publicKey, tnxRef: tnxRef);
  }

  // Virtual Account
  Future<dynamic> virtualAccount({required String tnxRef}) async {
    return await VirtualAccountController.createVirtualAccount(
      publicKey: _publicKey,
      tnxRef: tnxRef,
    );
  }

  Future<dynamic> getVirtualAccountPaymentStatus({
    required String tnxRef,
  }) async {
    return await VirtualAccountController.getVirtualAccountPaymentStatus(
      publicKey: _publicKey,
      tnxRef: tnxRef,
    );
  }
}
