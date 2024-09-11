import 'package:blockfrost_flutter_project/core/constants/secret_key.dart';
import 'package:blockfrost_flutter_project/src/walletDetails/model/services/account_service.dart';
import 'package:flutter/material.dart';

class AccountDetails extends StatefulWidget {
  const AccountDetails({super.key});

  @override
  State<AccountDetails> createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  Map<String, dynamic>? accountData;
  AccountService accountService = AccountService();


  @override
  void initState() {
    super.initState();
    _fetchingAccountsData();
  }

  void _fetchingAccountsData()async{
    final data = await  accountService.extractedAccountDetails();
    setState(() {
      accountData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
           padding: const EdgeInsets.all(20),
            child: accountData != null ? Container(
              width: double.infinity,
                height: 270,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1
                  )
                ),
              child: Column(
                children: [
                  Align(alignment:Alignment.center,child: Text('User Account Details', style: Theme.of(context).textTheme.bodyLarge,)),
                  Divider(color: Colors.grey,height: 0.8,),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Account Balance', style: Theme.of(context).textTheme.bodyLarge,),
                        SizedBox(width: 5,),
                        Text('TADA ${accountData!['controlled_amount'] ?? '0.00'}',style: TextStyle(color: Colors.green, fontSize: 16))
                      ],
                    ),
                  ),
                  Divider(color: Colors.grey,height: 0.8,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Reserved Sum', style: Theme.of(context).textTheme.bodyLarge),
                        SizedBox(width: 5,),
                        Text(' ${accountData!['reserves_sum']}', style: Theme.of(context).textTheme.bodyLarge)
                      ],
                    ),
                  ),
                  Divider(color: Colors.grey,height: 0.8,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Withdrawal  Sum', style: Theme.of(context).textTheme.bodyLarge),
                        SizedBox(width: 5,),
                        Text(' ${accountData!['withdrawals_sum']}', style: Theme.of(context).textTheme.bodyLarge)
                      ],
                    ),
                  ),
                  Divider(color: Colors.grey,height: 0.8,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Active', style: Theme.of(context).textTheme.bodyLarge),
                        SizedBox(width: 5,),
                        Text(' ${accountData!['active']}', style: Theme.of(context).textTheme.bodyLarge)
                      ],
                    ),
                  ),

                ],
              ),
            ) : Align(alignment:Alignment.center,child: CircularProgressIndicator()),
        );
  }
}
