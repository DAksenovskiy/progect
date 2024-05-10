import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SetStateDemoMyCatalog extends StatefulWidget {
  String result;
  SetStateDemoMyCatalog({required this.result});
  @override
  State<SetStateDemoMyCatalog> createState() => My_catalog(result: result);

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

class My_catalog extends State<SetStateDemoMyCatalog>{

  List<String> result2= ["0", "0", "0", "0", "0","0", "0", "0"];

  void initState() {
    super.initState();
    _loadCounter();
  }

  void _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      result2 = (prefs.getStringList('catalog') ?? result2);
    });
  }

  String result;
  My_catalog({required this.result});

  void _addResult(int i) async {

    final prefs = await SharedPreferences.getInstance();
    result2 = (prefs.getStringList('catalog') ?? result2);

    result2[i] = result;

      setState(() {
        prefs.setStringList('catalog', result2);
      });
    }

  void _delResult(int i) async {
    final prefs = await SharedPreferences.getInstance();
    result2 = (prefs.getStringList('catalog') ?? result2);
    result2[i] = "0";
    setState(() {
      prefs.setStringList('catalog', result2);
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          title: Text(S.of(context).myCatalog),
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
          Row(
              children: <Widget>[
                ElevatedButton(
                    onPressed: () => {
                      setState((){
                        Navigator.pushNamed(context, '${result2[0]}');
                      })
                      //Navigator.pushNamed(context, '/leibniz_formula')
                    },
                    child: new Text('${0}: ${result2[0]} '),
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(fontSize: 20),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      //elevation: 5.0,
                      //padding: EdgeInsets.all(20),
                    )
                ),
              ]
          ),
          Row(
              children: <Widget>[
                ElevatedButton(
                    onPressed: () => {
                      setState((){
                        Navigator.pushNamed(context, '${result2[1]}');
                      })
                    },
                    child: new Text('${1}: ${result2[1]} '),
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(fontSize: 20),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      //elevation: 5.0,
                      //padding: EdgeInsets.all(20),
                    )
                ),
              ]
          ),
          Row(
              children: <Widget>[
                ElevatedButton(
                    onPressed: () => {
                      setState((){
                        Navigator.pushNamed(context, '${result2[2]}');
                      })
                    },
                    child: new Text('${2}: ${result2[2]} '),
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(fontSize: 20),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      //elevation: 5.0,
                      //padding: EdgeInsets.all(20),
                    )
                ),
              ]
          ),
          Row(
              children: <Widget>[
                ElevatedButton(
                    onPressed: () => {
                      setState((){
                        Navigator.pushNamed(context, '${result2[3]}');
                      })
                    },
                    child: new Text('${3}: ${result2[3]} '),
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(fontSize: 20),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      //elevation: 5.0,
                      //padding: EdgeInsets.all(20),
                    )
                ),
              ]
          ),
        ]
        ),
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                  children: <Widget>[
                    ElevatedButton(
                        onPressed: () => {
                          setState((){
                            _addResult(0);
                          })
                        },
                        child: new Text(''),
                        style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(fontSize: 20),
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.black,
                          //elevation: 5.0,
                          //padding: EdgeInsets.all(20),
                        )
                    ),
                  ]
              ),
              Row(
                  children: <Widget>[
                    ElevatedButton(
                        onPressed: () => {
                          setState((){
                            _addResult(1);
                          })
                        },
                        child: new Text(''),
                        style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(fontSize: 20),
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.black,
                          //elevation: 5.0,
                          //padding: EdgeInsets.all(20),
                        )
                    ),
                  ]
              ),
              Row(
                  children: <Widget>[
                    ElevatedButton(
                        onPressed: () => {
                          setState((){
                            _addResult(2);
                          })
                        },
                        child: new Text(''),
                        style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(fontSize: 20),
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.black,
                          //elevation: 5.0,
                          //padding: EdgeInsets.all(20),
                        )
                    ),
                  ]
              ),
              Row(
                  children: <Widget>[
                    ElevatedButton(
                        onPressed: () => {
                          setState((){
                            _addResult(3);
                          })
                        },
                        child: new Text(''),
                        style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(fontSize: 20),
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.black,
                          //elevation: 5.0,
                          //padding: EdgeInsets.all(20),
                        )
                    ),
                  ]
              ),
            ]
        ),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                    children: <Widget>[
                      ElevatedButton(
                          onPressed: () => {
                            setState((){
                              _delResult(0);
                            })
                          },
                          child: new Text(''),
                          style: ElevatedButton.styleFrom(
                            textStyle: TextStyle(fontSize: 20),
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.black,
                            //elevation: 5.0,
                            //padding: EdgeInsets.all(20),
                          )
                      ),
                    ]
                ),
                Row(
                    children: <Widget>[
                      ElevatedButton(
                          onPressed: () => {
                            setState((){
                              _delResult(1);
                            })
                          },
                          child: new Text(''),
                          style: ElevatedButton.styleFrom(
                            textStyle: TextStyle(fontSize: 20),
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.black,
                            //elevation: 5.0,
                            //padding: EdgeInsets.all(20),
                          )
                      ),
                    ]
                ),
                Row(
                    children: <Widget>[
                      ElevatedButton(
                          onPressed: () => {
                            setState((){
                              _delResult(2);
                            })
                          },
                          child: new Text(''),
                          style: ElevatedButton.styleFrom(
                            textStyle: TextStyle(fontSize: 20),
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.black,
                            //elevation: 5.0,
                            //padding: EdgeInsets.all(20),
                          )
                      ),
                    ]
                ),
                Row(
                    children: <Widget>[
                      ElevatedButton(
                          onPressed: () => {
                            setState((){
                              _delResult(3);
                            })
                          },
                          child: new Text(''),
                          style: ElevatedButton.styleFrom(
                            textStyle: TextStyle(fontSize: 20),
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.black,
                            //elevation: 5.0,
                            //padding: EdgeInsets.all(20),
                          )
                      ),
                    ]
                ),
              ]
          ),
             ]
        )
    );
  }

}