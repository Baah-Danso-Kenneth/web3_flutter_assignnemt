import 'package:blockfrost_flutter_project/src/walletInput/view/wallet_input_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Web3 mobile Assignment',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 15, color: Colors.grey),
          bodyMedium: TextStyle(fontSize:12,color: Colors.grey),
          bodySmall: TextStyle(fontSize:10,color: Colors.grey),
        )
      ),
      home: const WalletInputScreen(),
    );
  }
}


