import 'package:flutter/material.dart';
import 'generated/l10n.dart';

class HomeSqrt extends StatelessWidget{
  const HomeSqrt({Key ? key}) : super (key: key);
  @override
  Widget build(BuildContext context){
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          title: Text(S.of(context).methodsforcalculatingsqrt),
          centerTitle: true,
          foregroundColor: Colors.white,
          backgroundColor: Colors.red,
          titleTextStyle: TextStyle(fontSize: 30),

        ),
        floatingActionButton:
        Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 150),
              ElevatedButton(
                  onPressed: () => {
                    Navigator.pushNamed(context, '/the_babylonian_method')
                  },
                  child: new Text(S.of(context).thebabylonianmethod),
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(fontSize: 20),
                    backgroundColor: Colors.black26,
                    foregroundColor: Colors.white,
                  )
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () => {
                    Navigator.pushNamed(context, '/newton_method')
                  },
                  child: new Text(S.of(context).newtonmethod),
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(fontSize: 20),
                    backgroundColor: Colors.black26,
                    foregroundColor: Colors.white,
                  )
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () => {
                    Navigator.pushNamed(context, '/catalog_of_permanent')
                  },
                  child: new Text(S.of(context).backToCatalog),
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(fontSize: 20),
                    backgroundColor: Colors.black26,
                    foregroundColor: Colors.white,
                  )
              ),
            ]
        )
    );
  }

}