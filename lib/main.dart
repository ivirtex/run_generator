import 'dart:math';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'custom_text_form_field.dart';
import 'results_screen.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: kIsWeb,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      title: 'Run Generator papiez',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(title: "Input"),
    );
  }
}

class MainScreen extends StatefulWidget {
  MainScreen({required this.title});

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
                  isPicker: true,
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2030),
                    ).then((date) {
                      if (date != null) {
                        controllerData.text =
                            "${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}";
                      }
                    });
                  },
                ),
                CustomTextFormField(
                  text: "Godzina [HH:MM]",
                  controller: controllerGodzina,
                  isPicker: true,
                  onPressed: () {
                    showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    ).then((time) {
                      if (time != null) {
                        controllerGodzina.text =
                            "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}";
                      }
                    });
                  },
                ),
                CustomTextFormField(
                  text: "Rodzaj treningu [cokolwiek]",
                  controller: controllerRodzajT,
                  isPicker: true,
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                              height: 400,
                              child: ListView(children: [
                                ListTile(
                                  title: Text("Run"),
                                  onTap: () {
                                    Navigator.pop(context);
                                    controllerRodzajT.text = "Run";
                                  },
                                ),
                                ListTile(
                                  title: Text("Running"),
                                  onTap: () {
                                    Navigator.pop(context);
                                    controllerRodzajT.text = "Running";
                                  },
                                ),
                                ListTile(
                                  title: Text("Bike"),
                                  onTap: () {
                                    Navigator.pop(context);
                                    controllerRodzajT.text = "Bike";
                                  },
                                ),
                                ListTile(
                                  title: Text("Swimming"),
                                  onTap: () {
                                    Navigator.pop(context);
                                    controllerRodzajT.text = "Swimming";
                                  },
                                ),
                                ListTile(
                                  title: Text("Other"),
                                  onTap: () {
                                    Navigator.pop(context);
                                    controllerRodzajT.text = "Other";
                                  },
                                ),
                                ListTile(
                                  title: Text("Horse riding"),
                                  onTap: () {
                                    Navigator.pop(context);
                                    controllerRodzajT.text = "Horse riding";
                                  },
                                ),
                                ListTile(
                                  title: Text("Walking"),
                                  onTap: () {
                                    Navigator.pop(context);
                                    controllerRodzajT.text = "Walking";
                                  },
                                ),
                                ListTile(
                                  title: Text("Cat riding"),
                                  onTap: () {
                                    Navigator.pop(context);
                                    controllerRodzajT.text = "Cat riding";
                                  },
                                ),
                              ]));
                        });
                  },
                ),
                CustomTextFormField(
                  text: "Odległość [KM]",
                  controller: controllerOdleglosc,
                  onPressed: () {
                    controllerOdleglosc.text =
                        (random.nextDouble() + random.nextInt(10))
                            .toStringAsFixed(2);
                  },
                ),
                CustomTextFormField(
                  text: "Długość treningu [HH:MM:SS]",
                  controller: controllerDlugoscT,
                  // i didnt write this code
                  onPressed: () {
                    controllerDlugoscT.text =
                        "${random.nextInt(3).toString().padLeft(2, '0')}:${random.nextInt(60).toString().padLeft(2, '0')}:${random.nextInt(60).toString().padLeft(2, '0')}";
                  },
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
          if (_formKey.currentState!.validate()) {
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
