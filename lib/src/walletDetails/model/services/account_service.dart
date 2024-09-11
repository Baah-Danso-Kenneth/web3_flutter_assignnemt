import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../../../../core/constants/api_url.dart';
import '../../../../core/constants/secret_key.dart';
import '../../../../core/services/http_service.dart';

class AccountService extends HttpService {
  Future<Map<String, dynamic>> getAccountDetails() async {
    Map<String, String> headers = {
      "project_id": SecretKey.blockFrostProjectId,
    };

    var url = '${ApiUrl.apiUrl}/accounts/${SecretKey.stakeAddress}';

    try {
      var response = await getMethod(url, headers);

      if (response.statusCode == 200) {

        var data = jsonDecode(response.body);
        return data;
      } else {
        return {};
      }
    } catch (e) {
      return {};
    }
  }
  Future<Map<String, dynamic>> extractedAccountDetails() async {
    var accountData = await getAccountDetails();

    Map<String, dynamic> accountDetailsMap = {
      "stake_address": accountData["stake_address"],
      "active": accountData["active"],
      "active_epoch": accountData["active_epoch"],
      "controlled_amount": accountData["controlled_amount"],
      "withdrawals_sum": accountData["withdrawals_sum"],
      "reserves_sum": accountData["reserves_sum"],
      "drep_id": accountData["drep_id"],
      "withdrawable_amount": accountData["withdrawable_amount"],
    };

    return accountDetailsMap;
  }
}
