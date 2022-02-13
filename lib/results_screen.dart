import 'package:flutter/material.dart';
import 'data_card.dart';
import 'constants.dart';

class Wynik extends StatelessWidget {
  Wynik({
    required this.data,
    required this.godzina,
    required this.rodzajT,
    required this.odleglosc,
    required this.dlugoscT,
    required this.v,
    required this.hr,
    required this.calories,
    required this.elevation,
    required this.score,
  });

  final String data;
  final String godzina;
  final String rodzajT;
  final String odleglosc;
  final String dlugoscT;
  final String v;
  final String hr;
  final String calories;
  final String elevation;
  final String score;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Summary",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.lightGreenAccent,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$data - $godzina",
                style: Constants.data,
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    rodzajT,
                    style: Constants.rodzajT,
                  ),
                  Spacer(),
                  Icon(Icons.edit)
                ],
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text("$odleglosc KM", style: Constants.odleglosc),
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DataCard(
                        main: dlugoscT,
                        second: "Time",
                      ),
                      DataCard(
                        main: calories,
                        second: "Calories",
                      ),
                      DataCard(
                        main: "$elevation m",
                        second: "Elevation",
                      ),
                      SizedBox(width: 10)
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DataCard(
                        main: hr,
                        second: "Heart rate",
                      ),
                      DataCard(
                        main: "$v km/h",
                        second: "Top speed",
                      ),
                      DataCard(
                        main: score,
                        second: "Score",
                      ),
                      SizedBox(width: 10)
                    ],
                  ),
                  SizedBox(height: 20),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image(image: AssetImage("images/mapa.png")),
                  ),
                  SizedBox(height: 30),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.lightGreenAccent,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.play_arrow,
                        size: 40,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
