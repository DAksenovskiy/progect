import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled1/mach_piBlock.dart';
import 'generated/l10n.dart';
import "dart:math" show pi;
import 'save_rezults.dart';
import 'my_catalog.dart';


class SetStateDemoMach_E extends StatefulWidget {
  const SetStateDemoMach_E({Key? key}) : super(key: key);
  @override
  State<SetStateDemoMach_E> createState() => Mach_E();
}

class Mach_E extends State<SetStateDemoMach_E> {
  @override
  void dispose() { // Закрытие потоков
    _block.dispoce();
    super.dispose();
  }
  String _resultMessage = '0.1111';
//  String _textEntered = "0";
  Mach_piBlock _block = Mach_piBlock();
  // void _calculate() {
  //  _textEntered = _textController.text;
  //  double sum = 3;
  //  sum = pi;
  //  _resultMessage = '$sum';
  //}
  //TextEditingController _textController = new TextEditingController();
//  Mach_Pi({dynamic key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorSchemeSeed: const Color(0xff6750a4), useMaterial3: true),
      home: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          title: Text('MachE'),
          centerTitle: true,
          foregroundColor: Colors.white,
          backgroundColor: Colors.red,
          titleTextStyle: TextStyle(fontSize: 30),
        ),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          <Widget>[
            TextButton(
              onPressed:(){
                //  setState((){
                //_calculate();
                _block.inputEventSink.add(Mach_piEvent.calculatemache); //Обращение к списку ивентов и вызов ивента calculatemachpi (ввод ивента в начало потока)
                //  }
                //);
              },
              child: Text(S.of(context).calculate),
            ),
            StreamBuilder(                    //класс для связи с выходом из потока
                stream: _block.outputStateSink, // (выход константы из потока
                initialData: 0,
                builder: (context, snapshot){
                  _resultMessage = snapshot.data.toString();
                  return
                    Text(
                        '$_resultMessage',
                        style: TextStyle(
                          fontSize: 15,
                        )
                    );
                }
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
                          SetStateDemoSaveResult(result: _resultMessage, constant: 'e', iter_time: '1',)))
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
                          SetStateDemoMyCatalog(result: '/mache')))
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
