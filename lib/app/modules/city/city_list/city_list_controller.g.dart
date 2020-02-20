// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CityListController on _CityListBase, Store {
  final _$citiesAtom = Atom(name: '_CityListBase.cities');

  @override
  ObservableStream<List<CityModel>> get cities {
    _$citiesAtom.context.enforceReadPolicy(_$citiesAtom);
    _$citiesAtom.reportObserved();
    return super.cities;
  }

  @override
  set cities(ObservableStream<List<CityModel>> value) {
    _$citiesAtom.context.conditionallyRunInAction(() {
      super.cities = value;
      _$citiesAtom.reportChanged();
    }, _$citiesAtom, name: '${_$citiesAtom.name}_set');
  }

  @override
  String toString() {
    final string = 'cities: ${cities.toString()}';
    return '{$string}';
  }
}
