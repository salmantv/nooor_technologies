import 'dart:developer';

import 'package:faceinfinicstask/app/data/prodectmodel.dart';
import 'package:faceinfinicstask/app/modules/home/controllers/home_controller.dart';
import 'package:faceinfinicstask/app/modules/home/views/card_widget.dart';
import 'package:faceinfinicstask/app/modules/home/views/show_prodects.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSearchDelegate extends SearchDelegate {
  final homecontroller = Get.put(HomeController());

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length < 3) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "Search term must be longer than two letters.",
            ),
          )
        ],
      );
    } else {
      int size = 0;
      for (var i = 0; i < homecontroller.data.length; i++) {
        if (homecontroller.data[i].title == query) {
          size++;
          log(homecontroller.data[i].title.toString());
          return ListView.builder(
            itemCount: size,
            itemBuilder: (context, index) {
              return Cardwidget(data: homecontroller.data[i]);
            },
          );
        }
      }
    }

    return Column(
      children: <Widget>[],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> catgory = [
      "electronics",
      "jewelery",
      "men's clothing",
      "women's clothing"
    ];
    log(homecontroller.catgorydata.toString());
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index) {
        final data = catgory[index];
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: InkWell(
            onTap: () async {
              var listdata = await homecontroller.category(catgory[index]);
              Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
                return Showprodects(
                  data: listdata,
                );
              })));
            },
            child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              child: Card(
                child: ListTile(
                  title: Text(data),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
