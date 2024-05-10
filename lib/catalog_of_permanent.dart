import 'package:flutter/material.dart';
import 'generated/l10n.dart';

class Catalog_of_permanent extends StatelessWidget{
  const Catalog_of_permanent({Key ? key}) : super (key: key);
  @override
  Widget build(BuildContext context){
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          title: Text(S.of(context).catalogOfPermanent),
          centerTitle: true,
          foregroundColor: Colors.white,
          backgroundColor: Colors.red,
          titleTextStyle: TextStyle(fontSize: 30),

        ),

        floatingActionButton:
        Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(
                  onPressed: () => {
                    Navigator.pushNamed(context, '/homepi')
                  },
                  child: Text(
                    'Pi',
                  ),
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(fontSize: 70),
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.blueGrey,
                  )
              ),
              SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () => {
                    Navigator.pushNamed(context, '/homee')
                  },
                  child: Text(
                    'e',
                  ),
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(fontSize: 70),
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.blueGrey,
                  )
             ),
              SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () => {
                    Navigator.pushNamed(context, '/homesqrt')
                  },
              child: Text(
              'Sqrt',
               ),
               style: ElevatedButton.styleFrom(
               textStyle: TextStyle(fontSize: 70),
                 foregroundColor: Colors.black,
                  backgroundColor: Colors.blueGrey,
                  ),
              )
            ]
        ),

        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
         SizedBox(height: 10),
         ElevatedButton(
          onPressed: () => {
            Navigator.pushNamed(context, '/')
          },
          child: new Text(S.of(context).backToMenu),
          style: ElevatedButton.styleFrom(
            textStyle: TextStyle(fontSize: 20),
            backgroundColor: Colors.black26,
            foregroundColor: Colors.white,
            )
           ),
          SizedBox(height: 10),
          ]
         )
    );
  }

}