import 'package:flutter/material.dart';
import 'data_card.dart';
import 'constants.dart';

class Wynik extends StatelessWidget {
  Wynik({this.data, this.rodzajT, this.odleglosc, this.dlugoscT});

  final String data;
  final String rodzajT;
  final String odleglosc;
  final String dlugoscT;

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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$data - 9:14",
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
                      main: "442",
                      second: "Calories",
                    ),
                    DataCard(
                      main: "23 m",
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
                      main: "159",
                      second: "Heart rate",
                    ),
                    DataCard(
                      main: "10.7",
                      second: "Top speed",
                    ),
                    DataCard(
                      main: "94",
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
    );
  }
}
