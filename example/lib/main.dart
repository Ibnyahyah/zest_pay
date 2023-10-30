import 'package:flutter/material.dart';
import 'package:zest_pay/zest_pay.dart';

const PUBLIC_KEY = "";

void main() {
  ZestPay.initialize(publicKey: PUBLIC_KEY);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zest pay example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({
    super.key,
  });

  final zestPay = ZestPay();

  _initialTransaction() {
    zestPay
        .initializeTransaction(
            email: "example@gmail.com", currency: "NGN", amount: "3000")
        .then((value) => print(value))
        .catchError((err) => print(err));
  }

  _verifyTransaction() {
    zestPay
        .verifyTransaction(tnxRef: "")
        .then((value) => print(value))
        .catchError((err) => print(err));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Zest pay example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Test everything with clicks',
            ),
            Text(
              'Zest pay your number one payment gateway.',
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            Container(
              child: ElevatedButton(
                onPressed: _initialTransaction,
                child: const Text("Initial transaction"),
              ),
            ),
            Container(
              child: ElevatedButton(
                onPressed: _verifyTransaction,
                child: const Text("Verify transaction"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
