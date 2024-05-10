import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'Navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() {
  final Store<int> store = Store(reducer, initialState: 0);
  runApp(StoreProvider(store: store, child: MyApp())

  );

}
class AddAction{

}
class DelAction{

}
int reducer(int state, dynamic action){
  if (action is AddAction){
   return state = state + 1;
  }
  else if (action is DelAction)
    {
      return state = state - 1;
    }
  else {
    return state;
  }
}