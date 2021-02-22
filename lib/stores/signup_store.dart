import 'package:flutter/material.dart';
import 'package:flutter_app/models/user_model.dart';
import 'package:flutter_app/repositories/user_repository.dart';
import 'package:flutter_app/stores/user_manager_store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_app/helpers/extensions.dart';
part 'signup_store.g.dart';

class SignUpStore = _SignUpStore with _$SignUpStore;

abstract class _SignUpStore with Store{
  @observable
  String name;

  @action
  void setName(String value) => name = value;

  @computed
  bool get nameValid => name != null && name.length > 6;
  String get nameError {
    if(name == null || nameValid)
      return null;
    else if (name.isEmpty)
      return 'Campo obrigatório';
    else
      return 'Nome muito curto.';
  }

  //  ####################################################

  @observable
  String email;

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get emailValid => email != null && email.isEmailValid();
  String get emailError {
    if (email == null || emailValid)
      return null;
    else if(email.isEmpty)
      return 'Campo obrigatório';
    else
      return 'E-amil inválido';
  }

  @observable
  String phone;

  @action
  void setPhone(String value) => phone = value;

  @computed
  bool get phoneValid => phone != null && phone.length >= 14;
  String get phoneError {
    if (phone == null || phoneValid)
      return null;
    else if(phone.isEmpty)
      return 'Campo obrigatório';
    else
      return 'Número inválido';
  }
  @observable
  String pass1;

  @action
  void setPass1(String value) => pass1 = value;

  @computed
  bool get pass1Valid => pass1 != null && pass1.length >= 6;
  String get pass1Error {
    if (pass1 == null || pass1Valid)
      return null;
    else if(pass1.isEmpty)
      return 'Campo obrigatório';
    else
      return 'Senha inválida';
  }
  @observable
  String pass2;

  @action
  void setPass2(String value) => pass2 = value;

  @computed
  bool get pass2Valid => pass2 != null && pass2 == pass1;
  String get pass2Error {
    if (pass2 == null || pass2Valid)
      return null;
    else
      return 'Senhas não coincidem.';
  }

  @computed
  bool get isFormValid => nameValid && emailValid && phoneValid && pass1Valid && pass2Valid;

  @computed
  Function get signUpPressed => isFormValid && !loading ? signUp : null;

  @observable
  bool loading = false;

  @observable
  String error;

  @action
  Future<void> signUp() async {
    loading = true;
    final user = new User(
      name: name,
      email: email,
      phone: phone,
      password: pass1
    );
    try{
      final resultUser = await UserRepository().signUp(user);
      GetIt.I<UserManagerStore>().setUserManager(resultUser);
    }catch(e){
      error = e;
    }
    loading = false;
  }

  @computed
  Widget get isLoading => loading ? CircularProgressIndicator() : Text('Cadastrar');

}
