import 'package:flutter/cupertino.dart';

class CounterProvider extends ChangeNotifier{
  int number = 0;

  void increaseNumber(){
    number += 1;
    notifyListeners();
  }

  void decreaseNumber(){
    if(number > 0){
      number -= 1;
      notifyListeners();
    }
  }

  void resetNumber(){
    number = 0;
    notifyListeners();
  }
}