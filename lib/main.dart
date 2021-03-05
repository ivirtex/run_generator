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
      title: 'Flutter Demo',
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
  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
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
      floatingActionButton: FloatingActionButton(
        child: Text("Trenuj"),
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
                  v: calculateV(double.parse(controllerOdleglosc.text)),
                  calories: random.nextInt(600).toString(),
                  elevation: random.nextInt(100).toString(),
                  hr: (random.nextInt(140) + 60).toString(),
                  score: random.nextInt(100).toString(),
                ),
              ),
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    controllerData.dispose();
    controllerRodzajT.dispose();
    controllerOdleglosc.dispose();
    controllerDlugoscT.dispose();
    super.dispose();
  }
}

String calculateV(double km) {
  Random random = Random();
  double v = km / random.nextInt(3) + 1;
  return v.toString();
}
