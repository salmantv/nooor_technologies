import 'package:faceinfinicstask/app/data/prodectmodel.dart';
import 'package:faceinfinicstask/app/modules/home/views/card_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../controllers/search.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    controller.getallProdectmodel();
    controller.globaldata();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 232, 243),
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: Text("Prodect List"),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: FutureBuilder<List<ProdectModel>>(
          future: controller.getallProdectmodel(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              return ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final data = snapshot.data![index];
                  return Cardwidget(
                    data: data,
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.hasError.toString()),
              );
            } else {
              return Center(
                child: Text("Error"),
              );
            }
          }),
    );
  }
}
