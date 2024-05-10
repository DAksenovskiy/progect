import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'generated/l10n.dart';
import 'save_rezults.dart';
import 'my_catalog.dart';

class SetStateDemoLeibniz_Formula extends StatefulWidget {
  const SetStateDemoLeibniz_Formula ({Key? key}) : super(key: key);
  @override
  State<SetStateDemoLeibniz_Formula > createState() => Leibniz_Formula();
}

class Leibniz_Formula extends State<SetStateDemoLeibniz_Formula > {

  String _resultMessage = "";
  String _resultMessage1 = '/leibniz_formula';
  String _textEntered = "0";
  String _constant = "Pi";
  void _calculate() {
    _textEntered = _textController.text;
    double a = double.parse(_textEntered);
    int d = 1;
    double sum = 0;
    for (var i = 0; i < a; i++) {
      if (i % 2 == 0)
        {
         sum += 4/d;
        }
      else
        {
         sum -= 4/d;
        }
      d += 2;
      }
    print(sum);
    _resultMessage = '$sum';
  }
  TextEditingController _textController = new TextEditingController();
  Leibniz_Formula({dynamic key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorSchemeSeed: const Color(0xff6750a4), useMaterial3: true),
      home: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar:
        AppBar(
          title: Text(S.of(context).leibnizsFormula),
          centerTitle: true,
          foregroundColor: Colors.white,
          backgroundColor: Colors.red,
          titleTextStyle: TextStyle(fontSize: 30),
          ),
        body:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
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
              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(fontSize: 15),
                backgroundColor: Colors.black26,
                foregroundColor: Colors.white,)
            ),
            Text(
              '$_resultMessage',
              style: TextStyle(
                  fontSize: 15,
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
                        SetStateDemoSaveResult(result: _resultMessage, constant: _constant, iter_time: _textEntered,)))
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
                        SetStateDemoMyCatalog(result: _resultMessage1))),
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





