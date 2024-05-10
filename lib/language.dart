import 'package:flutter/material.dart';
import 'generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class Language extends StatelessWidget{
  const Language({Key ? key}) : super (key: key);
  @override
  Widget build(BuildContext context){
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          title: Text(S.of(context).languageSettings),
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
                   // localeOverride: const Locale('en'),
                  },
                  child: new Text(S.of(context).russian),
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
                  child: new Text(S.of(context).english),
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