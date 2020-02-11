import 'package:flutter_siges/app/models/city_model.dart';
import 'package:flutter_siges/app/repositories/city_repository.dart';
import 'package:mobx/mobx.dart';

part 'city_controller.g.dart';

class CityController = _CityBase with _$CityController;

abstract class _CityBase with Store {

  final CityRepository _cityRepository;

  _CityBase(this._cityRepository) {
    _cityRepository.getCities().then((data) => cities = data);
  }

  @observable
  List<CityModel> cities = [];  
}
