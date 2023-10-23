import 'package:flutter/material.dart';

void main() {
  runApp(TemperatureConverterApp());
}

class TemperatureConverterApp extends StatefulWidget {
  @override
  _TemperatureConverterAppState createState() =>
      _TemperatureConverterAppState();
}

class _TemperatureConverterAppState extends State<TemperatureConverterApp> {
  double _inputValue = 0;
  String _fromUnit = 'Celsius';
  String _toUnit = 'Fahrenheit';
  double _result = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Temperature Converter'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Convert from $_fromUnit to $_toUnit',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Enter Temperature',
                  ),
                  onChanged: (value) {
                    setState(() {
                      _inputValue = double.tryParse(value) ?? 0;
                      _convertTemperature();
                    });
                  },
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    DropdownButton<String>(
                      value: _fromUnit,
                      onChanged: (value) {
                        setState(() {
                          _fromUnit = value!;
                          _convertTemperature();
                        });
                      },
                      items: <String>['Celsius', 'Fahrenheit', 'Kelvin']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    Icon(Icons.arrow_forward),
                    DropdownButton<String>(
                      value: _toUnit,
                      onChanged: (value) {
                        setState(() {
                          _toUnit = value!;
                          _convertTemperature();
                        });
                      },
                      items: <String>['Celsius', 'Fahrenheit', 'Kelvin']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'Result: $_result $_toUnit',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _convertTemperature() {
    if (_fromUnit == 'Celsius' && _toUnit == 'Fahrenheit') {
      _result = (_inputValue * 9 / 5) + 32;
    } else if (_fromUnit == 'Fahrenheit' && _toUnit == 'Celsius') {
      _result = (_inputValue - 32) * 5 / 9;
    } else if (_fromUnit == 'Celsius' && _toUnit == 'Kelvin') {
      _result = _inputValue + 273.15;
    } else if (_fromUnit == 'Kelvin' && _toUnit == 'Celsius') {
      _result = _inputValue - 273.15;
    } else if (_fromUnit == 'Fahrenheit' && _toUnit == 'Kelvin') {
      _result = (_inputValue - 32) * 5 / 9 + 273.15;
    } else if (_fromUnit == 'Kelvin' && _toUnit == 'Fahrenheit') {
      _result = (_inputValue - 273.15) * 9 / 5 + 32;
    } else {
      _result = _inputValue;
    }
  }
}
