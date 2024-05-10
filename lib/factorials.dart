import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'generated/l10n.dart';
import 'save_rezults.dart';
import 'my_catalog.dart';

class SetStateDemoFactorials extends StatefulWidget {
  const SetStateDemoFactorials({Key? key}) : super(key: key);
  @override
  State<SetStateDemoFactorials> createState() => Factorials();

}

class Factorials extends State<SetStateDemoFactorials> {

  String _resultMessage = "";
  String _textEntered = "0";

  void _calculate() {
    _textEntered = _textController.text;
    double a = double.parse(_textEntered);
    double d = 1;
    double sum = 0;

    for (var i = 1; i <= a; i++) {
      d = 1;
      for (var j = 1; j < i; j++) {
        d = d * j;
      }
      sum = sum + 1/d;
    }
    print(sum);
    _resultMessage = '$sum';

  }
  TextEditingController _textController = new TextEditingController();
  Factorials({dynamic key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorSchemeSeed: const Color(0xff6750a4), useMaterial3: true),
      home: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          title: Text(S.of(context).factorials),
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
                      Navigator.pushNamed(context, '/homee')
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
                          SetStateDemoSaveResult(result: _resultMessage, constant: 'e', iter_time: _textEntered,)))
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
                          SetStateDemoMyCatalog(result: '/factorials')))
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