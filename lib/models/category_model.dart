import 'package:flutter_app/repositories/table_keys.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class Category {
  String id;
  String description;

  Category({this.id, this.description});
  Category.fromParse(ParseObject parseObject){
    id = parseObject.objectId;
    description = parseObject.get(KeyCategoryDescription);
  }
}