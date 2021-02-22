import 'package:flutter_app/models/category_model.dart';
import 'package:flutter_app/repositories/category_repository.dart';
import 'package:mobx/mobx.dart';
part 'category_store.g.dart';

class CategoryStore = _CategoryStore with _$CategoryStore;

abstract class _CategoryStore with Store{
  _CategoryStore(){
    _loadCategories();
  }

  ObservableList<Category> categoryList = ObservableList<Category>();

  @action
  void setCategories(List<Category> categories) {
    categoryList.clear();
    categoryList.addAll(categoryList);
  }

  @observable
  String error;

  @action
  void setError(String value) => error = value;

  Future<void> _loadCategories() async {
    try{
      final categories = await CategoryRepository().getList();
      setCategories(categories);
    } catch (e) {
      setError(e);
    }
  }

  @computed
  List<Category> get allCategoryList => List.from(categoryList)
    ..insert(0, Category(id: '*', description: 'Todas'));
}