import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:kawika_project/model/hive_datamodel.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel() {
    getData();
  }

  List<HiveData> data = [];
  final box = Hive.box<HiveData>('dataBox');

  Future<void> loadData() async {
    if (box.isNotEmpty) {
      data = box.values.toList();
      notifyListeners();
    }
    getData();
  }

  Future<void> getData() async {
    print(data);
    try {
      var response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);

        final fetchedData = jsonData
            .map((e) => HiveData.fromJson(e as Map<String, dynamic>))
            .toList();

        await saveToHive(fetchedData);
        data = fetchedData;
        notifyListeners();
      } else {
        throw Exception('failed to load data');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> saveToHive(var data) async {
    await box.clear();
    await box.addAll(data);
  }


}
