import 'package:flutter/material.dart';
import 'package:untitled1/login.dart';
import 'package:untitled1/welcomepage.dart';
import 'settings.dart';
import 'settings_sound.dart';
import 'language.dart';
import 'graphics.dart';
import 'my_catalog.dart';
import 'save_rezults.dart';
import 'catalog_of_permanent.dart';
import 'brightness.dart';
import 'size.dart';
import 'leibniz_formula.dart';
import 'homepi.dart';
import 'nilakantha_series.dart';
import 'mach_pi.dart';
import 'homee.dart';
import 'homesqrt.dart';
import 'horizontal_asymptote.dart';
import 'factorials.dart';
import 'the_babylonian_method.dart';
import 'newton_method.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
import 'comparison_of_results.dart';
import 'mach_e.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      //locale: Locale('en'),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      supportedLocales: [
        Locale('en'),
        Locale('ru')
      ],
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomePage(email: 'email', password: 'password'),
        '/settings': (context) => const Settings(),
        '/settings_sound': (context) => const Settings_Sound(),
        '/language': (context) => const Language(),
        '/graphics': (context) => const Graphics(),
        '/my_catalog': (context) =>  SetStateDemoMyCatalog(result: '0'),
        '/favourites': (context) =>  SetStateDemoSaveResult(result: '0', constant: '0', iter_time: '0',),
        '/catalog_of_permanent': (context) => const Catalog_of_permanent(),
        '/brightness': (context) => const Brightness(),
        '/size': (context) => const Size(),
        '/homepi': (context) => const HomePi(),
        '/leibniz_formula': (context) => const SetStateDemoLeibniz_Formula (),
        '/nilakantha_series': (context) => const SetStateDemoNilakantha_Series(),
        '/mach_pi': (context) => const SetStateDemoMach_Pi(),
        '/homee': (context) => const HomeE(),
        '/homesqrt': (context) => const HomeSqrt(),
        '/horizontal_asymptote': (context) => const SetStateDemoHorizontal_Asymptote(),
        '/factorials': (context) => const SetStateDemoFactorials(),
        '/the_babylonian_method': (context) => const SetStateDemoThe_Babylonian_method(),
        '/mache': (context) => const SetStateDemoMach_E(),
        '/newton_method': (context) => const SetStateDemoNewton_method(),
        '/navigation': (context) => const Register(),
        '/login': (context) => const Login(),
        '/comparison': (context) => SetStateComparison
          (result1: '0', result2: '0', constant1: '0', constant2: '0', iter_time1: '0', iter_time2: '0',)
      },
      );
  }
}

class Register extends StatefulWidget{
  const Register({Key ? key}) : super (key: key);
  @override
  _Main createState() => _Main();
}

class _Main extends State<Register>{
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  @override
  Widget build(BuildContext context){
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          title: Text(S.of(context).register),
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
                      labelText: S.of(context).enterEmail
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
                 Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                     WelcomePage(email:_email.text, password:_password.text)));
              },
                  child: Text(S.of(context).goToWelcomePage)),
        )
            ]
        )
    );
  }
}

