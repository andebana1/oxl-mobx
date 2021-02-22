// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_manager_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserManagerStore on _UserManagerStore, Store {
  Computed<bool> _$IsLoggedInComputed;

  @override
  bool get IsLoggedIn =>
      (_$IsLoggedInComputed ??= Computed<bool>(() => super.IsLoggedIn,
              name: '_UserManagerStore.IsLoggedIn'))
          .value;
  Computed<String> _$userNameOrGenericComputed;

  @override
  String get userNameOrGeneric => (_$userNameOrGenericComputed ??=
          Computed<String>(() => super.userNameOrGeneric,
              name: '_UserManagerStore.userNameOrGeneric'))
      .value;
  Computed<String> _$userEmailOrGenericComputed;

  @override
  String get userEmailOrGeneric => (_$userEmailOrGenericComputed ??=
          Computed<String>(() => super.userEmailOrGeneric,
              name: '_UserManagerStore.userEmailOrGeneric'))
      .value;

  final _$userAtom = Atom(name: '_UserManagerStore.user');

  @override
  User get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$_UserManagerStoreActionController =
      ActionController(name: '_UserManagerStore');

  @override
  void setUserManager(User value) {
    final _$actionInfo = _$_UserManagerStoreActionController.startAction(
        name: '_UserManagerStore.setUserManager');
    try {
      return super.setUserManager(value);
    } finally {
      _$_UserManagerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
IsLoggedIn: ${IsLoggedIn},
userNameOrGeneric: ${userNameOrGeneric},
userEmailOrGeneric: ${userEmailOrGeneric}
    ''';
  }
}
