import 'package:flutter/material.dart';
import 'package:flutter_app/repositories/user_repository.dart';
import 'package:flutter_app/stores/user_manager_store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_app/helpers/extensions.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store{
  @observable
  String email;

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get emailValid => email != null && email.isEmailValid();
  String get emailError => email == null || emailValid ? null : 'E-amil inválido';

  @observable
  String password;

  @action
  void setPassword(String value) => password = value;

  @computed
  bool get passwordValid => password != null && password.length >= 6;
  String get passwordError => password == null || passwordValid ? null : 'Senha inválida';

  @computed
  Function get loginPressed => emailValid && passwordValid && !loading ? _login : null;

  @observable
  bool loading = false;

  @observable
  String error;

  @action
  Future<void> _login() async{
    loading = true;
    try{
      final resultUser = await UserRepository().loginWithEmail(email, password);
      GetIt.I<UserManagerStore>().setUserManager(resultUser);
    }catch(e){
      error = e;
    }
    loading = false;
  }

  @computed
  Widget get isLoading => loading ? CircularProgressIndicator() : Text('Entrar');
}