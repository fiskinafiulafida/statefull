import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double celcius = 0, kelvin = 0, reamur = 0;

  TextEditingController a = TextEditingController();

  void converter() {
    setState(() {
      double celcius = double.parse(a.text);
      reamur = 0.8 * celcius;
      kelvin = celcius + 273;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Konverter Suhu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Konverter Suhu"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFormField(
                decoration:
                    InputDecoration(hintText: "Masukan Suhu Dalam Celcius"),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: a,
                keyboardType: TextInputType.number,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70.0),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Suhu Dalam Kelvin ",
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(
                      width: 200,
                      height: 150,
                    ),
                    Text(
                      "Suhu Dalam Reamur ",
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "$kelvin",
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(
                      width: 200.0,
                      height: 100.0,
                    ),
                    Text(
                      "$reamur",
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 200,
                height: 130,
              ),
              Container(
                alignment: Alignment.bottomCenter,
                width: double.infinity,
                height: 50,
                child: RaisedButton(
                  onPressed: converter,
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("Konversi Suhu"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
