import 'package:app_for_trood/models/userModel.dart';
import 'package:app_for_trood/services/networking.dart';
import 'package:flutter/material.dart';

class WidgetModel extends ChangeNotifier {
  final _apiHelper = ApiHelper();
  var _users = <User>[];
  List<User> get users => _users;

  Future<void> loadUsers() async {
    final usersResponse = await _apiHelper.getUsers();
    _users += usersResponse;
    print(_users);
    notifyListeners();
  }

  // void createAlbums() {}
  // void createPost() {}
}

class ProviderModel<Model extends ChangeNotifier> extends InheritedNotifier {
  final Model model;

  const ProviderModel({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(
          key: key,
          notifier: model,
          child: child,
        );

  static Model? watch<Model extends ChangeNotifier>(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ProviderModel<Model>>()
        ?.model;
  }

  static Model? read<Model extends ChangeNotifier>(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<ProviderModel<Model>>()
        ?.widget;
    return widget is ProviderModel<Model> ? widget.model : null;
  }
}
