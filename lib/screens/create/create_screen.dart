import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/components/custom_drawer/custom_drawer.dart';
import 'package:flutter_app/models/category_model.dart';
import 'package:flutter_app/screens/create/components/category_field.dart';
import 'package:flutter_app/screens/create/components/image_field.dart';
import 'package:flutter_app/stores/create_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CreateScreen extends StatelessWidget {

  final CreateStore createStore = CreateStore();

  @override
  Widget build(BuildContext context) {

    final labelStyle = TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.grey,
        fontSize: 18
    );

    final contentPadding = const EdgeInsets.fromLTRB(16, 10, 12, 16);

    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Criar Anúncio'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Card(
            clipBehavior: Clip.antiAlias,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16)
            ),
            elevation: 8,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ImagesField(createStore),
                Observer(builder: (_){
                  return TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Título *',
                      labelStyle: labelStyle,
                      contentPadding: contentPadding,
                    ),
                  );
                }),
                Observer(builder: (_){
                  return TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Descrição*',
                      labelStyle: labelStyle,
                      contentPadding: contentPadding,
                    ),
                    maxLines: null,
                  );
                }),
                CategoryField(createStore),
                Observer(builder: (_){
                  return TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Preço*',
                      labelStyle: labelStyle,
                      contentPadding: contentPadding,
                      prefixText: 'R\$ ',
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      RealInputFormatter(centavos: true),
                    ],
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
