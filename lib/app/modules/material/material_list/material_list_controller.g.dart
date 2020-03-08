// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MaterialListController on _MaterialListBase, Store {
  final _$materialsAtom = Atom(name: '_MaterialListBase.materials');

  @override
  ObservableStream<List<MaterialModel>> get materials {
    _$materialsAtom.context.enforceReadPolicy(_$materialsAtom);
    _$materialsAtom.reportObserved();
    return super.materials;
  }

  @override
  set materials(ObservableStream<List<MaterialModel>> value) {
    _$materialsAtom.context.conditionallyRunInAction(() {
      super.materials = value;
      _$materialsAtom.reportChanged();
    }, _$materialsAtom, name: '${_$materialsAtom.name}_set');
  }

  final _$_MaterialListBaseActionController =
      ActionController(name: '_MaterialListBase');

  @override
  dynamic allMaterials() {
    final _$actionInfo = _$_MaterialListBaseActionController.startAction();
    try {
      return super.allMaterials();
    } finally {
      _$_MaterialListBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'materials: ${materials.toString()}';
    return '{$string}';
  }
}
