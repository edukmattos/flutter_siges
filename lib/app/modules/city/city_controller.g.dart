// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CityController on _CityBase, Store {
  final _$cityListAtom = Atom(name: '_CityBase.cityList');

  @override
  List<CityModel> get cityList {
    _$cityListAtom.context.enforceReadPolicy(_$cityListAtom);
    _$cityListAtom.reportObserved();
    return super.cityList;
  }

  @override
  set cityList(List<CityModel> value) {
    _$cityListAtom.context.conditionallyRunInAction(() {
      super.cityList = value;
      _$cityListAtom.reportChanged();
    }, _$cityListAtom, name: '${_$cityListAtom.name}_set');
  }
}
