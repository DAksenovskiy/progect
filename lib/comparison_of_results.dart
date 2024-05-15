import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/mach_piBlock.dart';
import 'generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "dart:math" show pi;
import "dart:math" show e;
import 'dart:math';
import 'PdfPreviewPage.dart';




class SetStateComparison extends StatefulWidget {
  String result1;
  String result2;
  String constant1;
  String constant2;
  String iter_time1;
  String iter_time2;

  SetStateComparison({required this.result1, required this.result2,
    required this.constant1, required this.constant2,
    required this.iter_time1, required this.iter_time2});
  @override
  State<SetStateComparison> createState() => Comparison(result1: result1, result2: result2,
      constant1: constant1, constant2: constant2,
      iter_time1: iter_time1, iter_time2: iter_time2);
}


class Helper {
  static String valueSharedPreferences = '';

// Write DATA
  static Future<bool> saveUserData(value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setStringList(valueSharedPreferences, value);
  }

// Read Data
  static Future getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getStringList(valueSharedPreferences);
  }
  // Del Data
  static Future delUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.remove(valueSharedPreferences);
  }
}

class Comparison extends State<SetStateComparison>{
  String result1= "0";
  String result2= "0";
  String constant1= "0";
  String constant2= "0";
  String iter_time1= "0";
  String iter_time2= "0";
  String accur1 = '0';
  String accur2 = '0';


  Comparison({required this.result1, required this.result2, required this.constant1, required this.constant2, required this.iter_time1, required this.iter_time2});

  Mach_piBlock _block = Mach_piBlock();

  void dispose() {
    // Закрытие потоков
    _block.dispoce();
    super.dispose();
  }
  
 void _accurconstant1(){
   if (constant1 == 'e')
   {
     double a = double.parse(result1);
     a = a - e;
     a = 1 - a;
     accur1 = '$a';
   }
   else if (constant1 == 'Pi')
   {
     double a = double.parse(result1);
     a = a - pi;
     a = 1 - a;
     accur1 = '$a';
   }
   else{
     double a = double.parse(result1);
     double b = double.parse(constant1);
     a = a - sqrt(b);
     a = 1 - a;
     accur1 = '$a';
   }
 }
  void _accurconstant2(){
    if (constant2 == 'e')
    {
      double a = double.parse(result2);
      a = a - e;
      a = 1 - a;
      accur2 = '$a';
    }
    else if (constant2 == 'Pi')
    {
      double a = double.parse(result2);
      a = a - pi;
      a = 1 - a;
      accur2 = '$a';
    }
    else{
      double a = double.parse(result2);
      double b = double.parse(constant2);
      a = a - sqrt(b);
      a = 1 - a;
      accur2 = '$a';
    }

  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: Text(S.of(context).comparison),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.red,
        titleTextStyle: TextStyle(fontSize: 30),

      ),
      floatingActionButton:
      Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                      children: <Widget>[
                        ElevatedButton(
                            onPressed: () => {
                              setState((){

                              })
                            },
                            child: new Text(' ${result1} '),
                            style: ElevatedButton.styleFrom(
                              textStyle: TextStyle(fontSize: 20),
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              //elevation: 5.0,
                              //padding: EdgeInsets.all(20),
                            )
                        ),
                      ]
                  ),
                  Row(
                      children: <Widget>[
                        ElevatedButton(
                            onPressed: () => {
                              setState((){

                              })
                            },
                            child: new Text('${1}: ${constant1} '),
                            style: ElevatedButton.styleFrom(
                              textStyle: TextStyle(fontSize: 20),
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              //elevation: 5.0,
                              //padding: EdgeInsets.all(20),
                            )
                        ),
                      ]
                  ),
                  Row(
                      children: <Widget>[
                        ElevatedButton(
                            onPressed: () => {
                              setState((){

                              })
                            },
                            child: new Text('${2}: ${iter_time1} '),
                            style: ElevatedButton.styleFrom(
                              textStyle: TextStyle(fontSize: 20),
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              //elevation: 5.0,
                              //padding: EdgeInsets.all(20),
                            )
                        ),
                      ]
                  ),
                  Row(
                      children: <Widget>[
                        ElevatedButton(
                            onPressed: () => {
                              setState((){
                                _accurconstant1();
                              })
                            },
                            child: new Text('Accuracy: =  ${accur1} '),
                            style: ElevatedButton.styleFrom(
                              textStyle: TextStyle(fontSize: 20),
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              //elevation: 5.0,
                              //padding: EdgeInsets.all(20),
                            )
                        ),
                      ]
                  ),
                  SizedBox(height: 20,),
                  Row(
                      children: <Widget>[
                        ElevatedButton(
                            onPressed: () => {
                              setState((){

                              })
                            },
                            child: new Text(' ${result2} '),
                            style: ElevatedButton.styleFrom(
                              textStyle: TextStyle(fontSize: 20),
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              //elevation: 5.0,
                              //padding: EdgeInsets.all(20),
                            )
                        ),
                      ]
                  ),

                  Row(
                      children: <Widget>[
                        ElevatedButton(
                            onPressed: () => {
                              setState((){

                              })
                            },
                            child: new Text('${3}: ${constant2} '),
                            style: ElevatedButton.styleFrom(
                              textStyle: TextStyle(fontSize: 20),
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              //elevation: 5.0,
                              //padding: EdgeInsets.all(20),
                            )
                        ),
                      ]
                  ),
                  Row(
                      children: <Widget>[
                        ElevatedButton(
                            onPressed: () => {
                              setState((){

                              })
                            },
                            child: new Text('${4}: ${iter_time2} '),
                            style: ElevatedButton.styleFrom(
                              textStyle: TextStyle(fontSize: 20),
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              //elevation: 5.0,
                              //padding: EdgeInsets.all(20),
                            )
                        ),
                      ]
                  ),
                  Row(
                      children: <Widget>[
                        ElevatedButton(
                            onPressed: () => {
                              setState((){
                                _accurconstant2();
                              })
                            },
                            child: new Text('Accuracy: =  ${accur2} '),
                            style: ElevatedButton.styleFrom(
                              textStyle: TextStyle(fontSize: 20),
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              //elevation: 5.0,
                              //padding: EdgeInsets.all(20),
                            )
                        ),
                      ]
                  ),
                  Row(
                   children: <Widget>[
                   FloatingActionButton(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return  PdfPreviewPage(result1, result2, constant1, constant2, iter_time1, iter_time2, accur1, accur2);
                      }));
                    },
                    child: const Icon(Icons.picture_as_pdf_sharp),
                  ),
                   ]
                  )
                ]
            ),

          ]
      ),

    );
  }

}