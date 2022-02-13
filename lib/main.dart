import 'dart:math';
import 'package:flutter/material.dart';
import 'custom_text_form_field.dart';
import 'results_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Run Generator papiez',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(title: "Input"),
    );
  }
}

class MainScreen extends StatefulWidget {
  MainScreen({this.title});

  final String title;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final controllerData = TextEditingController();
  final controllerGodzina = TextEditingController();
  final controllerRodzajT = TextEditingController();
  final controllerOdleglosc = TextEditingController();
  final controllerDlugoscT = TextEditingController();
  Random random = Random();

  @override
  void dispose() {
    super.dispose();

    controllerData.dispose();
    controllerGodzina.dispose();
    controllerRodzajT.dispose();
    controllerOdleglosc.dispose();
    controllerDlugoscT.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextFormField(
                  text: "Data [DD.MM]",
                  controller: controllerData,
                ),
                CustomTextFormField(
                  text: "Godzina [HH:MM]",
                  controller: controllerGodzina,
                ),
                CustomTextFormField(
                  text: "Rodzaj treningu [cokolwiek]",
                  controller: controllerRodzajT,
                ),
                CustomTextFormField(
                  text: "Odległość [KM]",
                  controller: controllerOdleglosc,
                ),
                CustomTextFormField(
                  text: "Długość treningu [HH:MM:SS]",
                  controller: controllerDlugoscT,
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text("Go"),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Wynik(
                  data: controllerData.text,
                  godzina: controllerGodzina.text,
                  rodzajT: controllerRodzajT.text,
                  odleglosc: controllerOdleglosc.text,
                  dlugoscT: controllerDlugoscT.text,
                  v: calculateRandomV(),
                  calories: (random.nextInt(600) + 200).toString(),
                  elevation: random.nextInt(100).toString(),
                  hr: (random.nextInt(140) + 60).toString(),
                  score: (random.nextInt(80) + 20).toString(),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

String calculateRandomV() {
  Random random = Random();
  double v = (random.nextInt(20) + 3) / (random.nextDouble() + 1);
  return v.toStringAsPrecision(2);
}
