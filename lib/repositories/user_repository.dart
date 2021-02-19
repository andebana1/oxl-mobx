import 'package:flutter_app/models/user_model.dart';
import 'package:flutter_app/repositories/parse_errors.dart';
import 'package:flutter_app/repositories/table_keys.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class UserRepository {
  Future<User> signUp(User user) async{
    final parseUser = new ParseUser(user.email, user.password, user.email);

    parseUser.set<String>(KeyUserName, user.name);
    parseUser.set<String>(KeyUserPhone, user.phone);
    parseUser.set(KeyUserType, user.type.index);

    final response = await parseUser.signUp();
    if(response.success){
      return mapParseToUser(response.result);
    }else{
      return Future.error(ParseErrors.getDescription(response.error.code));
    }
  }

  User mapParseToUser(ParseUser parseUser) {
    return User(
      id: parseUser.objectId,
      name: parseUser.get(KeyUserName),
      email: parseUser.get(KeyUserEmail),
      phone: parseUser.get(KeyUserPhone),
      type: UsetType.values[parseUser.get(KeyUserType)],
      createdAt: parseUser.get(KeyUserCreatedAt),
    );
  }
}