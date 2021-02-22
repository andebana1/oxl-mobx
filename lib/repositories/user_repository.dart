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

  Future<User> loginWithEmail(String email, String password) async{
    final ParseUser parseUser = ParseUser(email, password, null);

    final response = await parseUser.login();
    if(response.success){
      return mapParseToUser(response.result);
    }else{
      return Future.error(ParseErrors.getDescription(response.error.code));
    }

  }

  Future<User> currentUser() async {
    final parseUser = await ParseUser.currentUser();
    if(parseUser != null){
      final response = await ParseUser.getCurrentUserFromServer(parseUser.sessionToken);
      if(response.success){
        return mapParseToUser(parseUser);
      }else{
        await parseUser.logout();
      }
    }

    return null;
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