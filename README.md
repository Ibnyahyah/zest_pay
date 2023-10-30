## 🚀 zest_pay Flutter SDK Documentation

### 🌟 Introduction

`zest_pay` is an SDK designed base on the api of (zestpayment.com) developers looking to integrate with the Zest payment gateway into there flutter application. It's easy to implement and you can start receieving money in few minute with `zest_pay`.

---

### 🔌 Installation

```zsh
flutter pub add zest_pay
```
##Or
Add ```zest_pay: 1.0.0``` to your `pubspec.yaml` file.

---

### 💻 Getting Started

After installation import and initialize the SDK into your ```main.dart``` file.

```dart

import 'package:zest_pay/zest_pay.dart';

void main() {
    // zest_pay initialization
  ZestPay.initialize(publicKey: PUBLIC_KEY);
  runApp(const MyApp());
}
```

---

### 🛠️ Methods and Example

Below is a quick overview of all the methods available in the `zest_pay` SDK:

#### 2. ✅ `initializeTransaction`
```dart
    // declare a global variable
    final zestPay = ZestPay();

  _initializeTransaction() {
    zestPay
        .initializeTransaction(
          email: "example@gmail.com",
          amount: 3000,
          currency: "NGN",
        )
        .then((value) => print(value))
        .catchError((err) => print(err));
  }
```

- Payloads:
  - `amount`: Transaction amount.
  - `currency`: Currency type (e.g., "NGN").
  - `email`: Customer's email address.

#### 2. ✅ `verifyTransaction`
```dart
  _verifyTransaction() {
    zestPay
        .verifyTransaction(tnxRef: "")
        .then((value) => print(value))
        .catchError((err) => print(err));
  }
```

- Parameters:
  - `tnxRef`: Transaction reference.

... [And so on for the other methods]

---

### ⚠️ Error Handling

Ensure to always wrap your functions in try-catch or use .then method, as each method is asynchronous and could throw errors.

---

### 💡 Conclusion

`zest_pay` offers an efficient interface for the Zest payment gateway, facilitating developers in their application integrations. This documentation should guide you in leveraging the SDK effectively.

---

### 🚧 Current Version

**Version**: 1.0.0

---

### 💼 License

MIT

---

💖 Happy Coding!</> 💖, Don't forget to give a thumb up 👍 and a follow me [@whitecoode at github](https://github.com/ibnyahyah) and [on twitter](https://twitter.com/whitecoode)