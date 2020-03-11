// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_dashboard_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClientDashboardController on _ClientDashboardControllerBase, Store {
  final _$clientsAtom = Atom(name: '_ClientDashboardControllerBase.clients');

  @override
  ObservableStream<List<ClientModel>> get clients {
    _$clientsAtom.context.enforceReadPolicy(_$clientsAtom);
    _$clientsAtom.reportObserved();
    return super.clients;
  }

  @override
  set clients(ObservableStream<List<ClientModel>> value) {
    _$clientsAtom.context.conditionallyRunInAction(() {
      super.clients = value;
      _$clientsAtom.reportChanged();
    }, _$clientsAtom, name: '${_$clientsAtom.name}_set');
  }

  final _$_ClientDashboardControllerBaseActionController =
      ActionController(name: '_ClientDashboardControllerBase');

  @override
  dynamic allClients() {
    final _$actionInfo =
        _$_ClientDashboardControllerBaseActionController.startAction();
    try {
      return super.allClients();
    } finally {
      _$_ClientDashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'clients: ${clients.toString()}';
    return '{$string}';
  }
}
