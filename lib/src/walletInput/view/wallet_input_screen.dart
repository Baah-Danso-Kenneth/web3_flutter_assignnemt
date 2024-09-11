import 'package:blockfrost_flutter_project/core/constants/app_strings.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/secret_key.dart';
import '../../walletDetails/view/wallet_details_screen.dart';

class WalletInputScreen extends StatefulWidget {
  const WalletInputScreen({super.key, this.hintText = 'Enter wallet address'});
  final String hintText;

  @override
  State<WalletInputScreen> createState() => _WalletInputScreenState();
}

class _WalletInputScreenState extends State<WalletInputScreen> {
  final TextEditingController _controller = TextEditingController();
  final String correctWalletAddress = SecretKey.walletAddress;

  void _onPressed() {
    final enteredAddress = _controller.text.trim();

    if (enteredAddress.isEmpty) {
      _showError('Please enter a wallet address');
      return;
    }

    if (enteredAddress != correctWalletAddress) {
      _showError('Invalid wallet address');
      return;
    }

    _controller.clear();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const WalletDetailsScreen()),
    );
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(AppStrings.appName),
        elevation: 3,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: widget.hintText,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: _onPressed,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}


