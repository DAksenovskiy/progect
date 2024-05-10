import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'generated/l10n.dart';
import 'save_rezults.dart';
import 'my_catalog.dart';

class SetStateDemoNilakantha_Series extends StatefulWidget {
  const SetStateDemoNilakantha_Series({Key? key}) : super(key: key);
  @override
  State<SetStateDemoNilakantha_Series> createState() => Nilakantha_Series();
}

class Nilakantha_Series extends State<SetStateDemoNilakantha_Series> {

  String _resultMessage = "";
  String _textEntered = "0";

  void _calculate() {
    _textEntered = _textController.text;
    double a = double.parse(_textEntered);
    int n = 2;
    double sum = 3;
    double sign = 1;

    for (var i = 0; i < a; i++) {
      sum=sum+(sign*(4/((n)*(n+1)*(n+2))));
      sign = sign * (-1);
      n += 2;
    }
    print(sum);
    _resultMessage = '$sum';
  }
  TextEditingController _textController = new TextEditingController();
  Nilakantha_Series({dynamic key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorSchemeSeed: const Color(0xff6750a4), useMaterial3: true),
      home: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          title: Text(S.of(context).nilakanthaSeries),
          centerTitle: true,
          foregroundColor: Colors.white,
          backgroundColor: Colors.red,
          titleTextStyle: TextStyle(fontSize: 30),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller:  _textController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: S.of(context).enterTheNumberOfIterations
                  ),

                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                  ],
                  textAlign: TextAlign.center,
                )
            ),
            TextButton(
              onPressed:(){
                setState((){
                  _calculate();
                }
                );
              },
              child: Text(S.of(context).calculate),
            ),
            Text(
                '$_resultMessage',
                style: TextStyle(  // зеленый цвет текста
                  fontSize: 15,                       // высота шрифта 26
                )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () => {
                      Navigator.pushNamed(context, '/homepi')
                    },
                    child: new Text(S.of(context).back),
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(fontSize: 15),
                      backgroundColor: Colors.black26,
                      foregroundColor: Colors.white,
                    )
                ),
                SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () => {
                      Navigator.pushNamed(context, '/catalog_of_permanent')
                    },
                    child: new Text(S.of(context).backToCatalog),
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(fontSize: 15),
                      backgroundColor: Colors.black26,
                      foregroundColor: Colors.white,
                    )
                ),
              ],),
            SizedBox(height: 10),
            Row (
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () => {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                          SetStateDemoSaveResult(result: _resultMessage, constant: 'Pi', iter_time: _textEntered,)))
                    },
                    child: new Text(S.of(context).saveResult),
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(fontSize: 15),
                      backgroundColor: Colors.black26,
                      foregroundColor: Colors.white,
                    )
                ),
                SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () => {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                          SetStateDemoMyCatalog(result: '/nilakantha_series')))
                    },
                    child: new Text(S.of(context).addToCatalog),
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(fontSize: 15),
                      backgroundColor: Colors.black26,
                      foregroundColor: Colors.white,
                    )
                ),
              ],),
          ],
        ),
      ),
    );
  }
}

