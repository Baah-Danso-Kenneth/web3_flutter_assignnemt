import 'package:blockfrost_flutter_project/src/walletDetails/model/services/address_service.dart';
import 'package:flutter/material.dart';

class AddressDetails extends StatefulWidget {
  const AddressDetails({super.key});

  @override
  State<AddressDetails> createState() => _AddressDetailsState();
}

class _AddressDetailsState extends State<AddressDetails> {
  Map<String, dynamic>? addressData;
  AddressService addressService = AddressService();

  @override
  void initState() {
    super.initState();
    _fetchAddressData();
  }

  void _fetchAddressData() async {
    var data = await addressService.extractedAddressData();
    setState(() {
      addressData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: addressData != null ? Container(
        width: double.infinity,
        height: 300,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: Colors.grey,
                width: 1
            )
        ),
        child: Column(
          children: [
            Align(alignment: Alignment.center,
                child: Text('User Address Details', style: Theme
                    .of(context)
                    .textTheme
                    .bodyLarge,)),
            Divider(color: Colors.grey, height: 0.8,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Wallet Address', style: Theme
                      .of(context)
                      .textTheme
                      .bodyMedium,),
                  SizedBox(width: 5,),
                  Text('${addressData!['address']}', style: Theme
                      .of(context)
                      .textTheme
                      .bodyMedium, softWrap: true,)
                ],
              ),
            ),
            Divider(color: Colors.grey, height: 0.8,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Stake Adress', style: Theme
                      .of(context)
                      .textTheme
                      .bodyLarge,),
                  SizedBox(width: 5,),
                  Text('${addressData!['stake_address']}',
                      style: TextStyle(color: Colors.green, fontSize: 16),softWrap: true,)
                ],
              ),
            ),
            Divider(color: Colors.grey, height: 0.8,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Type', style: Theme
                      .of(context)
                      .textTheme
                      .bodyLarge),
                  SizedBox(width: 5,),
                  Text(' ${addressData!['type']}', style: Theme
                      .of(context)
                      .textTheme
                      .bodyLarge)
                ],
              ),
            ),
            Divider(color: Colors.grey, height: 0.8,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Amount', style: Theme
                      .of(context)
                      .textTheme
                      .bodyLarge),
                  SizedBox(width: 5,),
                  Text(' ${addressData!['amount']['unit']}', style: Theme
                      .of(context)
                      .textTheme
                      .bodyLarge)
                ],
              ),
            ),
            Divider(color: Colors.grey, height: 0.8,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Quantity', style: Theme
                      .of(context)
                      .textTheme
                      .bodyLarge),
                  SizedBox(width: 5,),
                  Text(' ${addressData!['amount']['quantity']}', style: Theme
                      .of(context)
                      .textTheme
                      .bodyLarge)
                ],
              ),
            ),

          ],
        ),
      ) : Align(
          alignment: Alignment.center, child: CircularProgressIndicator()),
    );
  }
}