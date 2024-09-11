import 'dart:convert';

import 'package:blockfrost_flutter_project/core/constants/api_url.dart';
import 'package:blockfrost_flutter_project/core/constants/secret_key.dart';
import 'package:blockfrost_flutter_project/core/services/http_service.dart';
import 'package:flutter/cupertino.dart';

class TransactionService extends HttpService{

  Future<Map<String, dynamic>> getTransactionData()async{
    Map<String, String> headers={
      "project_id": SecretKey.blockFrostProjectId
    };

    var url = "${ApiUrl.apiUrl}/txs/${SecretKey.hashKey}/";

    try{
      var response = await getMethod(url, headers );
      if(response.statusCode == 200){
        var data = jsonDecode(response.body);
        return data;
      }else{
        return {};
      }

    }catch(e){
      debugPrint('Error $e');
      return {};
    }
  }

  Future <Map<String, dynamic>> extractedTransactionData() async{
    var transactionData = await getTransactionData();

    Map<String, dynamic> transactionMap={
      "output_amount": transactionData["output_amount"],
      "fees": transactionData["fees"],
      "deposit": transactionData["deposit"],
      "utxo_count": transactionData["utxo_count"],
      "valid_contract": transactionData["valid_contract"],
      "size": transactionData["size"],
      "stake_cert_count": transactionData["stake_cert_count"],
      "invalid_before": transactionData["invalid_before"],
    };

    return transactionMap;
  }

}