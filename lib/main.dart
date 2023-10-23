import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temperature Converter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Temperature Converter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double inTemp = 0.0, outTemp = 0.0;
  bool isFah = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Temperature Converter"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter Temperature',
              labelText: isFah
                  ? "You Entered $inTemp in Fahrenheit"
                  : "You Entered $inTemp in Celcius",
            ),
            keyboardType: TextInputType.number,
            onChanged: (newValue) {
              setState(() {
                try {
                  inTemp = double.parse(newValue);
                } catch (e) {
                  //
                }
              });
            },
          ),
          RadioListTile(
            value: true,
            groupValue: isFah,
            onChanged: (newValue) {
              setState(() {
                isFah = newValue!;
              });
            },
            title: Text("Fahrenheit"),
          ),
          RadioListTile(
            value: false,
            groupValue: isFah,
            onChanged: (newValue) {
              setState(() {
                isFah = newValue!;
              });
            },
            title: Text("Celcius"),
          ),
          ElevatedButton(
            
            onPressed: () {}, child: Text("Convert"))
        ],
      ),
    );
  }
}
