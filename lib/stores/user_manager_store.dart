import 'package:flutter_app/models/user_model.dart';
import 'package:flutter_app/repositories/user_repository.dart';
import 'package:mobx/mobx.dart';
part 'user_manager_store.g.dart';

class UserManagerStore = _UserManagerStore with _$UserManagerStore;

abstract class _UserManagerStore with Store{

  _UserManagerStore(){
    _getCurrentUser();
  }

  @observable
  User user;

  @action
  void setUserManager(User value) => user = value;

  @computed
  bool get IsLoggedIn => user != null;

  @computed
  String get userNameOrGeneric => user != null ? 'Olá, ${user.name}' : 'Acesse sua conta agora!';

  @computed
  String get userEmailOrGeneric => user != null ? '${user.email}' : 'Clique aqui';

  Future<void> _getCurrentUser() async{
    final user = await UserRepository().currentUser();
    setUserManager(user);
  }
}