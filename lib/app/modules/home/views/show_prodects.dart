import 'package:faceinfinicstask/app/data/prodectmodel.dart';
import 'package:faceinfinicstask/app/modules/home/views/card_widget.dart';
import 'package:flutter/material.dart';

class Showprodects extends StatelessWidget {
  Showprodects({Key? key, required this.data}) : super(key: key);
  List<ProdectModel> data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final listofdata = data[index];
            return Cardwidget(data: listofdata);
          },
        ),
      ),
    );
  }
}
