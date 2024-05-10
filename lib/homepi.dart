import 'package:flutter/material.dart';
import 'generated/l10n.dart';

class HomePi extends StatelessWidget{
  const HomePi({Key ? key}) : super (key: key);
  @override
  Widget build(BuildContext context){
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          title: Text(S.of(context).methodsForCalculatingPi),
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
                    Navigator.pushNamed(context, '/leibniz_formula')
                  },
                  child: new Text(S.of(context).leibnizsFormula),
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(fontSize: 20),
                    backgroundColor: Colors.black26,
                    foregroundColor: Colors.white,
                  )
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () => {
                    Navigator.pushNamed(context, '/nilakantha_series')
                  },
                  child: new Text(S.of(context).nilakanthaSeries),
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(fontSize: 20),
                    backgroundColor: Colors.black26,
                    foregroundColor: Colors.white,
                  )
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () => {
                    Navigator.pushNamed(context, '/mach_pi')
                  },
                  child: new Text('MachPi'),
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(fontSize: 20),
                    backgroundColor: Colors.black26,
                    foregroundColor: Colors.white,
                  )
              ),

              SizedBox(height: 100),
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