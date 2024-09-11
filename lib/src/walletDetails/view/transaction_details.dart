import 'package:blockfrost_flutter_project/src/walletDetails/model/services/transaction_service.dart';
import 'package:flutter/material.dart';

class TransactionDetails extends StatefulWidget {
  const TransactionDetails({super.key});

  @override
  State<TransactionDetails> createState() => _TransactionDetailsState();
}

class _TransactionDetailsState extends State<TransactionDetails> {
  Map<String, dynamic>? transactionData;
  TransactionService transactionService = TransactionService();

  @override
  void initState() {
    super.initState();
    _fetchTransactionData();
  }

  void _fetchTransactionData() async {
    var data = await transactionService.extractedTransactionData();
    setState(() {
      transactionData = data as Map<String, dynamic>?;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey,
            width: 0.8,
          )

        ),
        child: Column(
          children: [
            Align(alignment: Alignment.center, child: Text('Transaction Details',style: Theme.of(context).textTheme.bodyLarge)),
            Divider(color: Colors.grey,height: 0.3,),
            if (transactionData == null || transactionData!['output_amount'] == null)
              const CircularProgressIndicator(),
            if (transactionData != null && transactionData!['output_amount'] != null)
              ...List.generate(
                transactionData!['output_amount'].length,
                    (index) {
                  var output = transactionData!['output_amount'][index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Column(
                      children: [
                        Column(
                          children: [
                             Text('Unit',style: Theme.of(context).textTheme.bodyLarge),
                            const SizedBox(width: 20),
                            Text('${output['unit']}', style: Theme.of(context).textTheme.bodyLarge),
                          ],
                        ),
                        Column(
                          children: [
                             Text('Quantity: ',style: Theme.of(context).textTheme.bodyLarge),
                            const SizedBox(width: 20),
                            Text('${output['quantity']}',style: Theme.of(context).textTheme.bodyLarge),
                          ],
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  );
                },
              ),
            SizedBox(height: 10,),

            if (transactionData != null)
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Deposit', style: Theme.of(context).textTheme.bodyLarge),
                        SizedBox(width: 10),
                        Text('${transactionData!['deposit']}', style: Theme.of(context).textTheme.bodyLarge),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('UTXO Count', style: Theme.of(context).textTheme.bodyLarge),
                        SizedBox(width: 10),
                        Text('${transactionData!['utxo_count']}', style: Theme.of(context).textTheme.bodyLarge),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Invalid Hereafter', style: Theme.of(context).textTheme.bodyLarge),
                        SizedBox(width: 10),
                        Text('${transactionData!['invalid_hereafter']}', style: Theme.of(context).textTheme.bodyLarge),
                      ],
                    ),
                  ],
                ),
              )

          ],
        ),
      ),
    );
  }
}
