import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:untitled1/main.dart';
import 'generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'comparison_of_results.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class SetStateDemoSaveResult extends StatefulWidget {
  String result;
  String constant;
  String iter_time;
  SetStateDemoSaveResult({required this.result, required this.constant, required this.iter_time,});
  @override
  State<SetStateDemoSaveResult> createState() => Favourites(result: result, constant: constant, iter_time: iter_time);

}

class Helper {
  static String valueSharedPreferences = '';

// Write DATA
  static Future<bool> saveUserData(value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setStringList(valueSharedPreferences, value);
  }

// Read Data
  static Future getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getStringList(valueSharedPreferences);
  }
  // Del Data
  static Future delUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.remove(valueSharedPreferences);
  }
}

class Favourites extends State<SetStateDemoSaveResult>{

  List<String> result1= ["0", "0", "0", "0", "0","0", "0", "0"];
  List<String> constant1= ["0", "0", "0", "0", "0","0", "0", "0"];
  List<String> iter_time1= ["0", "0", "0", "0", "0","0", "0", "0"];
  TextEditingController _textController1 = new TextEditingController();
  TextEditingController _textController2 = new TextEditingController();
  TextEditingController _textController11 = new TextEditingController();
  TextEditingController _textController21 = new TextEditingController();
  TextEditingController _textController12 = new TextEditingController();
  TextEditingController _textController22 = new TextEditingController();
  void initState() {
    super.initState();
    _loadCounter();
  }

  void _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      result1 = (prefs.getStringList('counter') ?? result1);
      constant1 = (prefs.getStringList('constant') ?? constant1);
      iter_time1 = (prefs.getStringList('iter_time') ?? iter_time1);
    });
  }

  String result;
  String constant;
  String iter_time;
  Favourites({required this.result, required this.constant, required this.iter_time,});

  void _addResult(int i) async {
    final prefs = await SharedPreferences.getInstance();
    result1 = (prefs.getStringList('counter') ?? result1);
    constant1 = (prefs.getStringList('constant') ?? constant1);
    iter_time1 = (prefs.getStringList('iter_time') ?? iter_time1);
    result1[i] = result;
    constant1[i] = '$constant';
    iter_time1[i] = '$iter_time';
      setState(() {
        prefs.setStringList('counter', result1);
        prefs.setStringList('constant', constant1);
        prefs.setStringList('iter_time', iter_time1);
      });
    }


    void _delResult(int i) async {
       final prefs = await SharedPreferences.getInstance();
       result1 = (prefs.getStringList('counter') ?? result1);
       constant1 = (prefs.getStringList('constant') ?? constant1);
       iter_time1 = (prefs.getStringList('iter_time') ?? iter_time1);
       result1[i] = "0";
       constant1[i] = "0";
       iter_time1[i] = "0";
       setState(() {
         prefs.setStringList('counter', result1);
         prefs.setStringList('constant', constant1);
         prefs.setStringList('iter_time', iter_time1);
       });
      }

    void _addToFavor() async {
      final prefs = await SharedPreferences.getInstance();
      result1 = (prefs.getStringList('counter') ?? result1);
      constant1 = (prefs.getStringList('constant') ?? constant1);
      iter_time1 = (prefs.getStringList('iter_time') ?? iter_time1);
      int a1 = int.parse(_textController1.text);
      int a2 = int.parse(_textController2.text);
      _textController1.text = result1[a1];
      _textController11.text = constant1[a1];
      _textController12.text = iter_time1[a1];

      _textController2.text = result1[a2];
      _textController21.text = constant1[a2];
      _textController22.text = iter_time1[a2];

    }


  @override
  Widget build(BuildContext context){
    final Store<int> store = StoreProvider.of<int>(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          title: Text(S.of(context).savedResults),
          centerTitle: true,
          foregroundColor: Colors.white,
          backgroundColor: Colors.red,
          titleTextStyle: TextStyle(fontSize: 30),
        ),
        floatingActionButton:
        Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 10),
                    Row(
                        children: <Widget>[
                          ElevatedButton(
                              onPressed: () => {
                                setState((){
                                  _addResult(0);
                                }),
                                store.dispatch(AddAction())
                              },
                              child: new Text(''),
                              style: ElevatedButton.styleFrom(
                                textStyle: TextStyle(fontSize: 15),
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.black,

                              )
                          ),
                        ]
                    ),
                    SizedBox(height: 10),
                    Row(
                        children: <Widget>[
                          ElevatedButton(
                              onPressed: () => {
                                setState((){
                                  _addResult(1);
                                }),
                                store.dispatch(AddAction())
                              },
                              child: new Text(''),
                              style: ElevatedButton.styleFrom(
                                textStyle: TextStyle(fontSize: 15),
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.black,

                              )
                          ),
                        ]
                    ),
                    SizedBox(height: 10),
                    Row(
                        children: <Widget>[
                          ElevatedButton(
                              onPressed: () => {
                                setState((){
                                  _addResult(2);
                                }),
                                store.dispatch(AddAction())
                              },
                              child: new Text(''),
                              style: ElevatedButton.styleFrom(
                                textStyle: TextStyle(fontSize: 15),
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.black,

                              )
                          ),
                        ]
                    ),
                    SizedBox(height: 10),
                    Row(
                        children: <Widget>[
                          ElevatedButton(
                              onPressed: () => {
                                setState((){
                                  _addResult(3);
                                }),
                                store.dispatch(AddAction())
                              },
                              child: new Text(''),
                              style: ElevatedButton.styleFrom(
                                textStyle: TextStyle(fontSize: 15),
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.black,
                              )
                          ),
                        ]
                    ),

                  ]
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 10),
                    Row(
                        children: <Widget>[
                          ElevatedButton(
                              onPressed: () => {
                                setState((){
                                  _delResult(0);
                                }),
                                store.dispatch(DelAction())
                              },
                              child: new Text(''),
                              style: ElevatedButton.styleFrom(
                                textStyle: TextStyle(fontSize: 15),
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.black,
                              )
                          ),
                        ]
                    ),
                    SizedBox(height: 10),
                    Row(
                        children: <Widget>[
                          ElevatedButton(
                              onPressed: () => {
                                setState((){
                                  _delResult(1);
                                }),
                                store.dispatch(DelAction())
                              },
                              child: new Text(''),
                              style: ElevatedButton.styleFrom(
                                textStyle: TextStyle(fontSize: 15),
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.black,
                              )
                          ),
                        ]
                    ),
                    SizedBox(height: 10),
                    Row(
                        children: <Widget>[
                          ElevatedButton(
                              onPressed: () => {
                                setState((){
                                  _delResult(2);
                                }),
                                store.dispatch(DelAction())
                              },
                              child: new Text(''),
                              style: ElevatedButton.styleFrom(
                                textStyle: TextStyle(fontSize: 15),
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.black,
                              )
                          ),
                        ]
                    ),
                    SizedBox(height: 10),
                    Row(
                        children: <Widget>[
                          ElevatedButton(
                              onPressed: () => {
                                setState((){
                                  _delResult(3);
                                }),
                                store.dispatch(DelAction())
                              },
                              child: new Text(''),
                              style: ElevatedButton.styleFrom(
                                textStyle: TextStyle(fontSize: 15),
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.black,
                              )
                          ),
                        ]
                    ),
                  ]
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 10),
                    Container(
                      child:
                      Row(

                          children: <Widget>[
                            ElevatedButton(
                                onPressed: () => {
                                  setState((){

                                  })
                                },
                                child: new Text('${0}: ${result1[0]} ', maxLines: 1, overflow: TextOverflow.ellipsis,),
                                style: ElevatedButton.styleFrom(
                                  textStyle: TextStyle(fontSize: 15),
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,

                                )
                            ),
                          ]
                      ),),
                    SizedBox(height: 10),
                    Container(
                      child:
                      Row(
                          children: <Widget>[
                            ElevatedButton(
                                onPressed: () => {
                                  setState((){

                                  })
                                },
                                child: new Text('${1}: ${result1[1]} ', maxLines: 1, overflow: TextOverflow.ellipsis,),
                                style: ElevatedButton.styleFrom(
                                  textStyle: TextStyle(fontSize: 15),
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,

                                )
                            ),
                          ]
                      ),),
                    SizedBox(height: 10),
                    Container(
                      child:
                      Row(
                          children: <Widget>[
                            ElevatedButton(
                                onPressed: () => {
                                  setState((){

                                  })
                                },
                                child: new Text('${2}: ${result1[2]} ', maxLines: 1, overflow: TextOverflow.ellipsis,),
                                style: ElevatedButton.styleFrom(
                                  textStyle: TextStyle(fontSize: 15),
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,

                                )
                            ),
                          ]
                      ),),
                    SizedBox(height: 10),
                    Container(
                      child:
                      Row(
                          children: <Widget>[
                            ElevatedButton(
                                onPressed: () => {
                                  setState((){

                                  })
                                },
                                child: new Text('${3}: ${result1[3]} ', maxLines: 1, overflow: TextOverflow.ellipsis,),
                                style: ElevatedButton.styleFrom(
                                  textStyle: TextStyle(fontSize: 15),
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,

                                )
                            ),
                          ]
                      ),),
                  ]
              ),
            ]
        ),

         body: Column(
           mainAxisAlignment: MainAxisAlignment.start,
           children: [
           SizedBox(height: 10),
           ElevatedButton(
               onPressed: () => {
                 setState(() {
                        _addToFavor();
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                            SetStateComparison
                              (result1: _textController1.text, result2:_textController2.text,
                              constant1:  _textController11.text, constant2:  _textController21.text,
                              iter_time1:  _textController12.text, iter_time2:  _textController22.text,)));
                          }
                       )
               },
               child: new Text(S.of(context).addToFavourite),
               style: ElevatedButton.styleFrom(
                 textStyle: TextStyle(fontSize: 20),
                 backgroundColor: Colors.white,
                 foregroundColor: Colors.black,
                 //elevation: 5.0,
                 //padding: EdgeInsets.all(20),
               )
           ),
           Padding(padding: const EdgeInsets.all(1.0),
                 child: TextField(
                   controller:  _textController1,
                   decoration: InputDecoration(
                       border: InputBorder.none,
                       hintText: S.of(context).inputFirstNumber
                   ),

                   inputFormatters: [
                     FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                   ],
                   textAlign: TextAlign.center,
                 )
             ),
             Padding(padding: const EdgeInsets.all(1.0),
                 child: TextField(
                   controller:  _textController2,
                   decoration: InputDecoration(
                       border: InputBorder.none,
                       hintText: S.of(context).inputSecondNumber
                   ),

                   inputFormatters: [
                     FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                   ],
                   textAlign: TextAlign.center,
                 )
             ),
             StoreConnector<int, int>(
               converter: (store) => store.state,
               builder: (context, state) => Text(state.toString()),
             )
           ]
         ),
    );
  }

}