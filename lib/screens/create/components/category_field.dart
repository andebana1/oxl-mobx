import 'package:flutter/material.dart';
import 'package:flutter_app/screens/category/category_screen.dart';
import 'package:flutter_app/stores/create_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CategoryField extends StatelessWidget {
  final CreateStore createStore;

  CategoryField(this.createStore);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_){
        return ListTile(
          title: Text(
            'Categoria',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.grey,
              fontSize: 18
            ),
          ),
          trailing: Icon(Icons.keyboard_arrow_down),
          onTap: (){
            showDialog(
              context: context,
              builder: (_) => CategoryScreen(
                showAll: false,
                selected: createStore.category,
              )
            );
          },
        );
      },
    );
  }
}
