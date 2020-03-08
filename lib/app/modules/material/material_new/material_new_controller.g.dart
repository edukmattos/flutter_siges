// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_new_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MaterialNewController on _MaterialNewBase, Store {
  Computed<bool> _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid)).value;

  final _$codeAtom = Atom(name: '_MaterialNewBase.code');

  @override
  String get code {
    _$codeAtom.context.enforceReadPolicy(_$codeAtom);
    _$codeAtom.reportObserved();
    return super.code;
  }

  @override
  set code(String value) {
    _$codeAtom.context.conditionallyRunInAction(() {
      super.code = value;
      _$codeAtom.reportChanged();
    }, _$codeAtom, name: '${_$codeAtom.name}_set');
  }

  final _$descriptionAtom = Atom(name: '_MaterialNewBase.description');

  @override
  String get description {
    _$descriptionAtom.context.enforceReadPolicy(_$descriptionAtom);
    _$descriptionAtom.reportObserved();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.context.conditionallyRunInAction(() {
      super.description = value;
      _$descriptionAtom.reportChanged();
    }, _$descriptionAtom, name: '${_$descriptionAtom.name}_set');
  }

  final _$materialUnitIdAtom = Atom(name: '_MaterialNewBase.materialUnitId');

  @override
  String get materialUnitId {
    _$materialUnitIdAtom.context.enforceReadPolicy(_$materialUnitIdAtom);
    _$materialUnitIdAtom.reportObserved();
    return super.materialUnitId;
  }

  @override
  set materialUnitId(String value) {
    _$materialUnitIdAtom.context.conditionallyRunInAction(() {
      super.materialUnitId = value;
      _$materialUnitIdAtom.reportChanged();
    }, _$materialUnitIdAtom, name: '${_$materialUnitIdAtom.name}_set');
  }

  final _$_MaterialNewBaseActionController =
      ActionController(name: '_MaterialNewBase');

  @override
  dynamic changeCode(String value) {
    final _$actionInfo = _$_MaterialNewBaseActionController.startAction();
    try {
      return super.changeCode(value);
    } finally {
      _$_MaterialNewBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeDescription(String value) {
    final _$actionInfo = _$_MaterialNewBaseActionController.startAction();
    try {
      return super.changeDescription(value);
    } finally {
      _$_MaterialNewBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeMaterialUnitId(String value) {
    final _$actionInfo = _$_MaterialNewBaseActionController.startAction();
    try {
      return super.changeMaterialUnitId(value);
    } finally {
      _$_MaterialNewBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'code: ${code.toString()},description: ${description.toString()},materialUnitId: ${materialUnitId.toString()},isFormValid: ${isFormValid.toString()}';
    return '{$string}';
  }
}
