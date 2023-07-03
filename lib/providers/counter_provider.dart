import 'package:flutter/cupertino.dart';

class CounterProvider with ChangeNotifier{
  int _number = 0;
  String get number => _number.toString();

  increaseNumber(){
   _number++;
   notifyListeners();
  }

  decreaseNumber(){
   _number--;
   notifyListeners();
  }

  resetNumber(){
   _number = 0;
   notifyListeners();
  }
}