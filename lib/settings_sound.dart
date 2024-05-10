import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

class Settings_Sound extends StatelessWidget{
  const Settings_Sound({Key ? key}) : super (key: key);
  @override
  Widget build(BuildContext context){
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          title: Text(S.of(context).soundSettings),
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
                  child: new Text(S.of(context).totalVolume),
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
                  child: new Text(S.of(context).theSoundOfClicks),
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