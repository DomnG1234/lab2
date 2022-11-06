import "package:flutter/material.dart";

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String day = "";
  String month = "";
  String year = "";
  String result = "";
  int age = 0;
  int tmp = 0;

  final now = DateTime.now();

  void onClicked() {
    try {
      age = now.year - int.tryParse(year)!;
      tmp = age;

      if (int.tryParse(month)! >= now.month) {
        if (int.tryParse(day)! > now.day) {
          age--;
        }
      }
      if (int.tryParse(month)! > now.month && int.tryParse(day)! < now.day) {
        age--;
      }
      age = age;
      setState(() {
        result = "Aveti  $age ani";
      });
    } catch (e) {
      setState(() {
        result = " Wrong data! ";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            child: const Padding(
              padding: EdgeInsets.fromLTRB(0, 155, 0, 10),
              child: Text(
                'Age Calculator',
                textScaleFactor: 2,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(155, 0, 155, 10),
              child: TextField(
                onChanged: (value) => day = value,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Day',

                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(155, 0, 155, 10),
              child: TextField(
                onChanged: (value) => month = value,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Month',
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(155, 0, 155, 10),
              child: TextField(
                onChanged: (value) => year = value,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Year',
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.fromLTRB(155, 0, 155, 10),
            child: Text('$result'),
          ),
          Container(
            alignment: Alignment.center,
            child: ElevatedButton(

              child: Text('Calculate age'),
              onPressed: onClicked,
            ),
          ),
        ],
      ),
    );
  }

}
