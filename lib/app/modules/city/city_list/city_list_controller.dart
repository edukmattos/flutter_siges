import 'package:flutter_siges/app/models/city_model.dart';
import 'package:flutter_siges/app/repositories/city_repository.dart';
import 'package:mobx/mobx.dart';

part 'city_list_controller.g.dart';

class CityListController = _CityListBase with _$CityListController;

abstract class _CityListBase with Store {
  final CityRepository _cityRepository;

  String errorTitle;
  String errorMsg;

  _CityListBase(this._cityRepository) {
    cities = ObservableStream(_cityRepository.getCities());
  }

  @observable
  ObservableStream<List<CityModel>> cities;
}
