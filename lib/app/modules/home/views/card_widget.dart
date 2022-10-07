import 'package:faceinfinicstask/app/data/prodectmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cardwidget extends StatelessWidget {
  Cardwidget({Key? key, required this.data}) : super(key: key);

  ProdectModel data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Container(
        height: 95,
        width: MediaQuery.of(context).size.width,
        child: Card(
          elevation: 6,
          child: ListTile(
            leading: Image.network(
              data.image!,
              fit: BoxFit.cover,
            ),
            title: Text(
              data.title!,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            subtitle: Text(data.category!),
          ),
        ),
      ),
    );
  }
}
