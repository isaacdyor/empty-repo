import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AppState extends ChangeNotifier {
  bool _showLeftBar = true;
  bool _showRightBar = true;
  bool _loggedIn = false;
  int? _phone;
  String? _alias;
  String _title = "";
  String _content = "";
  String _acccountHeader = "";

  bool get showLeftBar => _showLeftBar;
  bool get showRightBar => _showRightBar;
  bool get loggedIn => _loggedIn;
  int? get phone => _phone;
  String? get alias => _alias;
  String get title => _title;
  String get content => _content;
  String get accountHeader => _acccountHeader;

  set showLeftBar(bool value) {
    _showLeftBar = value;
    notifyListeners();
  }

  set showRightBar(bool value) {
    _showRightBar = value;
    notifyListeners();
  }

  toggleRightBar() {
    showRightBar = !_showRightBar;
  }

  toggleLeftBar() {
    showLeftBar = !_showLeftBar;
  }

  AppState();

  Future<bool> init(Uri url) {
    print("initializing state for ${url.toString()}");

    return Future<bool>(() async {
      final url = Uri.http(Uri.base.authority, 'data/index.json');
      // print("fetching ${url.toString()}");
      var jsonString = await http.read(url);
      print(jsonString);
      Map<String, dynamic> data = jsonDecode(jsonString);
      _title = data["title"];
      _content = data["content"];
      _acccountHeader = data["account_header"];
      notifyListeners();
      return true;
    });
  }

  Future<bool> logIn(int phone) {
    return Future<bool>(() async {
      _phone = phone;
      _loggedIn = true;
      notifyListeners();
      return _loggedIn;
    });
  }

  Future<bool> logOut() {
    return Future<bool>(() async {
      _loggedIn = false;
      _phone = null;
      notifyListeners();
      return _loggedIn;
    });
  }
}
