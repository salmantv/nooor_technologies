import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:faceinfinicstask/app/data/prodectmodel.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<ProdectModel> data = [];
  List<ProdectModel> catgorydata = [];
  int length = 0;

  Future<List<ProdectModel>> getallProdectmodel() async {
    try {
      final dio = Dio();
      final apiurl = "https://fakestoreapi.com/products/";
      var response = await dio.get(apiurl);
      if (response.statusCode == 200) {
        Iterable list = await response.data;
        return list.map((element) => ProdectModel.fromJson(element)).toList();
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }

    return <ProdectModel>[];
  }

  void globaldata() async {
    data = await getallProdectmodel();
  }

  Future<List<ProdectModel>> category(String category) async {
    List<ProdectModel> categorylist = [];
    catgorydata.clear();
    for (var element in data) {
      if (element.category == category) {
        categorylist = [];
        catgorydata.add(element);
      }
    }
    return catgorydata;
  }
}
