import 'package:flutter_app/models/category_model.dart';
import 'package:flutter_app/repositories/parse_errors.dart';
import 'package:flutter_app/repositories/table_keys.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class CategoryRepository {
  Future<List<Category>> getList() async{
    final query = QueryBuilder(ParseObject(KeyCategoryTable))
      ..orderByAscending(KeyCategoryDescription);

    final response = await query.query();

    if(response.success){
      return response.results.map((e) => Category.fromParse(e)).toList();
    }else{
      throw ParseErrors.getDescription(response.error.code);
    }
  }
}