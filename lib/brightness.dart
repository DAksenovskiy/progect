import 'package:flutter/material.dart';
import 'generated/l10n.dart';

class Brightness extends StatelessWidget{
  const Brightness({Key ? key}) : super (key: key);
  @override
  Widget build(BuildContext context){
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          title: Text(S.of(context).brightnessAdjustment),
          centerTitle: true,
          foregroundColor: Colors.white,
          backgroundColor: Colors.red,
          titleTextStyle: TextStyle(fontSize: 30),

        ),
        floatingActionButton:
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () => {

                  },
                  child: new Text('+'),
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(fontSize: 30),
                    backgroundColor: Colors.deepOrange,
                    foregroundColor: Colors.white,
                    elevation: 5.0,
                    padding: EdgeInsets.all(20),
                  )
              ),
              SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () => {

                  },
                  child: new Text('-'),
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(fontSize: 30),
                    backgroundColor: Colors.deepOrange,
                    foregroundColor: Colors.white,
                    elevation: 5.0,
                    padding: EdgeInsets.all(20),
                  )
              ),
            ]
        )
    );
  }

}