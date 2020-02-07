// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterController on _RegisterBase, Store {
  Computed<bool> _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid)).value;

  final _$nameAtom = Atom(name: '_RegisterBase.name');

  @override
  String get name {
    _$nameAtom.context.enforceReadPolicy(_$nameAtom);
    _$nameAtom.reportObserved();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.context.conditionallyRunInAction(() {
      super.name = value;
      _$nameAtom.reportChanged();
    }, _$nameAtom, name: '${_$nameAtom.name}_set');
  }

  final _$emailAtom = Atom(name: '_RegisterBase.email');

  @override
  String get email {
    _$emailAtom.context.enforceReadPolicy(_$emailAtom);
    _$emailAtom.reportObserved();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.context.conditionallyRunInAction(() {
      super.email = value;
      _$emailAtom.reportChanged();
    }, _$emailAtom, name: '${_$emailAtom.name}_set');
  }

  final _$passwordAtom = Atom(name: '_RegisterBase.password');

  @override
  String get password {
    _$passwordAtom.context.enforceReadPolicy(_$passwordAtom);
    _$passwordAtom.reportObserved();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.context.conditionallyRunInAction(() {
      super.password = value;
      _$passwordAtom.reportChanged();
    }, _$passwordAtom, name: '${_$passwordAtom.name}_set');
  }

  final _$passwordConfirmAtom = Atom(name: '_RegisterBase.passwordConfirm');

  @override
  String get passwordConfirm {
    _$passwordConfirmAtom.context.enforceReadPolicy(_$passwordConfirmAtom);
    _$passwordConfirmAtom.reportObserved();
    return super.passwordConfirm;
  }

  @override
  set passwordConfirm(String value) {
    _$passwordConfirmAtom.context.conditionallyRunInAction(() {
      super.passwordConfirm = value;
      _$passwordConfirmAtom.reportChanged();
    }, _$passwordConfirmAtom, name: '${_$passwordConfirmAtom.name}_set');
  }

  final _$registerAsyncAction = AsyncAction('register');

  @override
  Future<bool> register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  final _$_RegisterBaseActionController =
      ActionController(name: '_RegisterBase');

  @override
  dynamic changeName(String value) {
    final _$actionInfo = _$_RegisterBaseActionController.startAction();
    try {
      return super.changeName(value);
    } finally {
      _$_RegisterBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeEmail(String value) {
    final _$actionInfo = _$_RegisterBaseActionController.startAction();
    try {
      return super.changeEmail(value);
    } finally {
      _$_RegisterBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePassword(String value) {
    final _$actionInfo = _$_RegisterBaseActionController.startAction();
    try {
      return super.changePassword(value);
    } finally {
      _$_RegisterBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePasswordConfirm(String value) {
    final _$actionInfo = _$_RegisterBaseActionController.startAction();
    try {
      return super.changePasswordConfirm(value);
    } finally {
      _$_RegisterBaseActionController.endAction(_$actionInfo);
    }
  }
}
