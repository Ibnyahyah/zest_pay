import 'package:flutter_test/flutter_test.dart';

import 'package:zest_pay/zest_pay.dart';

void main() {
  test('Initialize payment on zest_pay', () async {
    ZestPlugin.initialize(publicKey: "publicKey", secretKey: "secretKey");
    final zestPay = ZestPlugin();
    _get() async {
      zestPay
          .initializePayment(
            amount: "2000",
            email: 'yahyahridwan665@gmai.com',
            currency: "NGN",
          )
          .then((value) => print(value));
    }

    expect(await _get(), 3);
  });
}
