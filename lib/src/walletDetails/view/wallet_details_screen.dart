import 'package:blockfrost_flutter_project/src/walletDetails/view/account_details.dart';
import 'package:blockfrost_flutter_project/src/walletDetails/view/address_details.dart';
import 'package:blockfrost_flutter_project/src/walletDetails/view/transaction_details.dart';
import 'package:flutter/material.dart';

class WalletDetailsScreen extends StatefulWidget {
  const WalletDetailsScreen({super.key});

  @override
  State<WalletDetailsScreen> createState() => _WalletDetailsScreenState();
}

class _WalletDetailsScreenState extends State<WalletDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ListView(
        children: const [
          AccountDetails(),
          TransactionDetails(),
          AddressDetails(),
        ],
      ),
    );
  }
}
