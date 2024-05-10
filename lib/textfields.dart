import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

class Leibniz_Formula1 extends StatelessWidget {
  const Leibniz_Formula1({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorSchemeSeed: const Color(0xff6750a4), useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(title: Text(S.of(context).leibnizsFormula)),
        body: const Column(
          children: <Widget>[
            Spacer(),
            FilledTextFieldExample(),
            OutlinedTextFieldExample(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

class FilledTextFieldExample extends StatelessWidget {
  const FilledTextFieldExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        suffixIcon: Icon(Icons.clear),
        labelText: 'Enter the number of iterations',
        hintText: 'the input field',
        helperText: '',
        filled: true,
      ),
    );
  }
}


class OutlinedTextFieldExample extends StatelessWidget {
  const OutlinedTextFieldExample({super.key});
  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        suffixIcon: Icon(Icons.clear),
        labelText: '',
        hintText: '',
        helperText: '',
        border: OutlineInputBorder(),
      ),
    );
  }
}
