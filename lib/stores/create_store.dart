import 'package:flutter_app/models/category_model.dart';
import 'package:mobx/mobx.dart';
import 'dart:io' show File;
part 'create_store.g.dart';

class CreateStore = _CreateStore with _$CreateStore;

abstract class _CreateStore with Store{

  ObservableList imgaes = ObservableList();

  @observable
  Category category;

  @action
  void setCategory(Category value) => category = value;
}