import 'package:flutter/material.dart';
import 'package:flutter_app/components/error_box/error_box.dart';
import 'package:flutter_app/models/category_model.dart';
import 'package:flutter_app/stores/category_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class CategoryScreen extends StatelessWidget {
  final Category selected;
  final bool showAll;

  CategoryScreen({this.selected, this.showAll = true});

  final CategoryStore categoryStore = GetIt.I<CategoryStore>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorias'),
        centerTitle: true
      ),
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)
          ),
          elevation: 8,
          margin: const EdgeInsets.fromLTRB(32, 12, 32, 32),
          child: Observer(
            builder: (_){
              if(categoryStore.error != null){
                return ErrorBox(message: categoryStore.error,);
              }else if(categoryStore.categoryList.isEmpty){
                return Center(
                  child: CircularProgressIndicator(),
                );
              }else {
                final categories = showAll ? categoryStore.allCategoryList : categoryStore.categoryList;

                return ListView.separated(
                  itemCount: categories.length,
                  separatorBuilder: (_, __) {
                    return Divider(height: 0.1, color: Colors.grey,);
                  },
                  itemBuilder: (_, int index){
                    final category = categories[index];
                    return InkWell(
                      onTap: (){
                        Navigator.of(context).pop(category);
                      },
                      child: Container(
                        height: 50,
                        color: category.id == selected?.id ? Colors.purple.withAlpha(50) : null,
                        alignment: Alignment.center,
                        child: Text(
                          category.description,
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontWeight: category.id == selected?.id ? FontWeight.bold : null,
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }

}
