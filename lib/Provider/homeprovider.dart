import 'dart:convert';
import 'dart:developer';
import 'package:dailymed/Models/daily_model.dart';
import 'package:dailymed/Utils/api_urls.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeProvider with ChangeNotifier {
  late BuildContext context;

  init({required BuildContext context}) {
    this.context = context;
  }

  List<DataModel> dataList = [];
  List<DataModel> searchdataList = [];
  TextEditingController searchController = TextEditingController();

  fetchData() async {
    var response = await http.get(
      Uri.parse('${ApiUrl.baseURL}${ApiUrl.destinationUrl}'),
    );
    // String data = await DefaultAssetBundle.of(context)
    //     .loadString('assets/json_responses/rule6.json');

    var responseData = jsonDecode(response.body);
    DailymedModel dataRes = DailymedModel.fromJson(responseData);

    dataList = dataRes.datamodel!;
    log(dataList.length.toString());
    log(dataList[0].title.toString());
    notifyListeners();
  }

  serachFunction(String value) {
    searchdataList.clear();
    searchdataList = dataList.where((filt) {
      return filt.title
          .toString()
          .toUpperCase()
          .contains(value.toString().toUpperCase());
    }).toList();
    notifyListeners();
  }
}
