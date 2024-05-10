import 'package:flutter/material.dart';
import 'generated/l10n.dart';


class Login extends StatefulWidget{
  const Login({Key ? key}) : super (key: key);
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login>{
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  @override
  Widget build(BuildContext context){
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          title: Text(S.of(context).login),
          centerTitle: true,
          foregroundColor: Colors.white,
          backgroundColor: Colors.red,
          titleTextStyle: TextStyle(fontSize: 30),

        ),
        floatingActionButton:
        Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 300),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom:10, left:10, right:10),
                child: TextField(
                  controller: _email,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: S.of(context).enterName
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom:10, left:10, right:10),
                child: TextField(
                  controller: _password,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: S.of(context).enterpassword
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom:10, left:10, right:10),
                child: ElevatedButton(onPressed: (){
                  Navigator.pushNamed(context, '/');
                },
                    child: Text(S.of(context).goToWelcomePage)),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom:10, left:10, right:10),
                child: ElevatedButton(
                    onPressed: () => {
                      Navigator.pushNamed(context, '/navigation')
                    },
                    child: Text(S.of(context).logout),
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(fontSize: 30),
                      backgroundColor: Colors.black26,
                      foregroundColor: Colors.white,
                      elevation: 5.0,
                    )
                ),)
            ]
        )
    );
  }
}
