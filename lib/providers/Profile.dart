import 'package:flutter/material.dart';

class Profile with ChangeNotifier {
  bool _isAuthentificated = false;

  bool get isAuthentificated {
    return _isAuthentificated;
  }

  set isAuthentificated(bool newVal) {
    _isAuthentificated = newVal;
    notifyListeners();
  }
}