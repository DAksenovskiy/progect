import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
import 'package:untitled1/Navigation.dart';
import 'save_rezults.dart';
import 'my_catalog.dart';

class SetStateDemoThe_Babylonian_method extends StatefulWidget {
  const SetStateDemoThe_Babylonian_method({Key? key}) : super(key: key);
  @override
  State<SetStateDemoThe_Babylonian_method> createState() => The_Babylonian_method();

}

class The_Babylonian_method extends State<SetStateDemoThe_Babylonian_method> {

  String _resultMessage = "";
  String _textEntered = "0";

  void _calculate() {
    _textEntered = _textController.text;
    double a = double.parse(_textEntered);
    double a1 = double.parse(_textEntered);
    double d = 1;
    double sum = 0;

    sum = a/2;
    double retval = 1;
    for (var j = 0; j < 7; j++) {
      retval *= d/10;
    }
    d = retval;

    while (sum - a/sum > d) {
      sum = (sum + a / sum) * 0.5;
    }
    print(sum);
    _resultMessage = '$sum';
  }
  TextEditingController _textController = new TextEditingController();
  The_Babylonian_method({dynamic key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorSchemeSeed: const Color(0xff6750a4), useMaterial3: true),
      home: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          title: Text(S.of(context).thebabylonianmethod),
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
                      hintText: S.of(context).enterthenumber
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
                _resultMessage!=null?'$_resultMessage': '',
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
                      Navigator.pushNamed(context, '/homesqrt')
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
                          SetStateDemoSaveResult(result: _resultMessage, constant: _textEntered, iter_time: '10^-7',)))
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
                          SetStateDemoMyCatalog(result: '/the_babylonian_method')))
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