import 'package:flutter/foundation.dart';


class UserProvider  extends ChangeNotifier
{
  String _name ="";

  UserProvider (){}

  String getUserName () { return _name;}
  void setName (String newName) {
    _name = newName;
    //notifyListeners();
  }

  // Для сохранения/загрузки
  Map<String, dynamic> toJson() {
    return {
      'name': _name,
    };
  }

  void fromJson(Map<String, dynamic> json) {
    _name = json['name'] ?? 'User name';
    notifyListeners();
  }
}