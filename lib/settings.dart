import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

class Settings extends StatelessWidget{
  const Settings({Key ? key}) : super (key: key);
  @override
  Widget build(BuildContext context){
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          title: Text(S.of(context).settings),
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
                    Navigator.pushNamed(context, '/language')
                  },
                  child: new Text(S.of(context).language),
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
                    Navigator.pushNamed(context, '/settings_sound')
                  },
                  child: new Text(S.of(context).sound),
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
                    Navigator.pushNamed(context, '/graphics')
                  },
                  child: new Text(S.of(context).graphics),
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