import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/create/components/image_dialog.dart';
import 'dart:io' show Platform, File;

import 'package:flutter_app/screens/create/components/image_source_dialog.dart';
import 'package:flutter_app/stores/create_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ImagesField extends StatelessWidget {

  final CreateStore createStore;

  ImagesField(this.createStore);

  @override
  Widget build(BuildContext context) {
    void onImageSelected(File f){
      Navigator.of(context).pop();
      createStore.imgaes.add(f);
    }

    return Container(
      color: Colors.grey[200],
      height: 120,
      child: Observer(builder: (_){
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: createStore.imgaes.length < 5 ? createStore.imgaes.length + 1 : 5,
          itemBuilder: (_, int index){
            if (index == createStore.imgaes.length)
              return Padding(
                padding: const EdgeInsets.fromLTRB(8,8,0,8),
                child: GestureDetector(
                  onTap: (){
                    if(Platform.isAndroid){
                      showModalBottomSheet(context: context, builder: (_) => ImageSourceDialog(onImageSelected));
                    }else{
                      showCupertinoModalPopup(context: context, builder: (_) => ImageSourceDialog(onImageSelected));
                    }
                  },
                  child: CircleAvatar(
                    radius: 44,
                    backgroundColor: Colors.grey[300],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.camera_alt,
                          size: 40,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            else
              return Padding(
                padding: const EdgeInsets.fromLTRB(8,16,0,16),
                child: GestureDetector(
                  onTap: (){
                    showDialog(context: context, builder: (_) => ImageDialog(
                      image: createStore.imgaes[index],
                      onDelete: () => createStore.imgaes.removeAt(index)
                    ));
                  },
                  child: CircleAvatar(
                    backgroundImage: FileImage(createStore.imgaes[index]),
                    radius: 44,
                    backgroundColor: Colors.grey[300],
                  ),
                ),
              );
          },
        );
      }),
    );
  }
}
