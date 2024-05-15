import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'generated/l10n.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

class WelcomePage extends StatelessWidget{
  String email, password;
  WelcomePage({required this.email, required this.password});

  @override
  Widget build(BuildContext context){
    final Store<int> store = StoreProvider.of<int>(context);
    return Scaffold(

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: Text(S.of(context).main_page),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.red,
        titleTextStyle: const TextStyle(fontSize: 30),
      ),

    floatingActionButton:
    Container(
            child:
      Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              ElevatedButton(
                onPressed: () => {
                  Navigator.pushNamed(context, '/catalog_of_permanent')
                },

                child: Text(S.of(context).catalogOfPermanent),
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(fontSize: 30),
                    backgroundColor: Colors.black26,
                    foregroundColor: Colors.white,
                  )
              ),
            SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () => {
                    Navigator.pushNamed(context, '/my_catalog')
                  },
                  child: Text(S.of(context).myCatalog),
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(fontSize: 30),
                    backgroundColor: Colors.black26,
                    foregroundColor: Colors.white,
                  )
              ),
            SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () => {
                    Navigator.pushNamed(context, '/favourites')
                  },
                  child: Text(S.of(context).savedResults),
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(fontSize: 30),
                    backgroundColor: Colors.black26,
                    foregroundColor: Colors.white,
                  )
              ),
            SizedBox(height: 10),
            StoreConnector<int, int>(
              converter: (store) => store.state,
              builder: (context, state) => Text(state.toString()),
            ),
            SizedBox(height: 10),
            SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () => {
                    Navigator.pushNamed(context, '/settings')
                  },
                  child: Text(S.of(context).settings),
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(fontSize: 30),
                    backgroundColor: Colors.black26,
                    foregroundColor: Colors.white,
                  )
              ),
            SizedBox(height: 10),
             ElevatedButton(
                  onPressed: () => {
                    Navigator.pushNamed(context, '/navigation')
                  },
                  child: Text(S.of(context).register),
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(fontSize: 30),
                    backgroundColor: Colors.black26,
                    foregroundColor: Colors.white,
                  )
              ),
            SizedBox(height: 10),
            ElevatedButton(
                  onPressed: () => {
                    Navigator.pushNamed(context, '/login')
                  },
                  child: Text(S.of(context).login),
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(fontSize: 30),
                    backgroundColor: Colors.black26,
                    foregroundColor: Colors.white,
                  )
              ),
          ]
      ),),
        bottomNavigationBar:
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
              ElevatedButton(
                child: Text(S.of(context).feedback),
                style: ElevatedButton.styleFrom(
                 textStyle: TextStyle(fontSize: 20),
                 backgroundColor: Colors.white,
                 foregroundColor: Colors.black,
                 ),
                onPressed: () {
                  showDialog(
                      context: context, builder:
                      (context) => const FeedbackDialog());
                },
              ),
              ]
          )
        );
  }
}

class FeedbackDialog extends StatefulWidget {
  const FeedbackDialog({Key? key}) : super(key: key);

  @override
  State<FeedbackDialog> createState() => _FeedbackDialogState();
}

class _FeedbackDialogState extends State<FeedbackDialog> {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  sendemail() async {
    final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
    const serviceId = "service_0epirho";
    const templateId = "template_zjaskgc";
    const userId = "GWSOKNptxjJ0QFDsO";
    final response = await http.post(url,
    headers: {
      'origin': 'http://localhost',
      'Content-Type': 'application/json'},
      body: jsonEncode({
        "service_id": serviceId,
        "template_id": templateId,
        "user_id": userId,
        "template_params": {
          "name": 'CalculateApp',
          "subject": 'user',
          "message": _controller.text,
          "user_email": 'testemailsadsdf@mail.ru',
          "to_email": 'other.email@gmail.com'
        }
      })
    );
  return response.statusCode;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key: _formKey,
        child: TextFormField(
          controller: _controller,
          keyboardType: TextInputType.multiline,
          decoration: const InputDecoration(
            hintText: 'Enter your feedback here',
            filled: true,
          ),
          maxLines: 5,
          maxLength: 4096,
          textInputAction: TextInputAction.done,
          validator: (String? text) {
            if (text == null || text.isEmpty) {
              return 'Please enter a text';
            }
            return null;
          },
        ),
      ),
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: () => Navigator.pop(context),
        ),
        TextButton(
          child: const Text('Send'),
          onPressed: () async {
            sendemail();
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}