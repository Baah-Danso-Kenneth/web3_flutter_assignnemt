import 'dart:convert';

import 'package:blockfrost_flutter_project/core/constants/api_url.dart';
import 'package:blockfrost_flutter_project/core/constants/secret_key.dart';
import 'package:blockfrost_flutter_project/core/services/http_service.dart';
import 'package:flutter/cupertino.dart';

class AddressService extends HttpService{

  Future<Map<String, dynamic>>getAddressData()async{
    Map<String, String> headers={
      "project_id": SecretKey.blockFrostProjectId
    };
    var url = "${ApiUrl.apiUrl}/addresses/${SecretKey.walletAddress}/";
    print(url);

    try{
      var response = await getMethod(url, headers);
      if(response.statusCode == 200){
        var data = jsonDecode(response.body);
        print(data);
        return data;
      }
      else{
        return {};
      }
    }catch(e){
      debugPrint('Error $e');
      return{};
    }
  }

  Future<Map<String, dynamic>> extractedAddressData() async {
    var addressData = await getAddressData();


    var amountData = addressData['amount'] as List<dynamic>;
    String unit = amountData[0]['unit'];
    int quantity = int.tryParse(amountData[0]['quantity']) ?? 0;

    Map<String, dynamic> addressDetailsMap = {
      "address": addressData['address'],
      "stake_address": addressData['stake_address'],
      "amount": {
        "unit": unit,
        "quantity": quantity,
      },
      "type": addressData['type'],
      'script': addressData['script']
    };

    return addressDetailsMap;
  }

}