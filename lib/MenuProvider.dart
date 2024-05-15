import 'package:flutter/cupertino.dart';

class MenuProvider extends ChangeNotifier {
  List<String> _dataList = [];

  List<String> get getDataList => _dataList;

  void setDataList(List<String> newDataList) {
    _dataList = newDataList;
    notifyListeners();
  }
}
