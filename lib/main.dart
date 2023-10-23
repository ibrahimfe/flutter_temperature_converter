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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Convert from $_fromUnit to $_toUnit'),
              TextFormField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _inputValue = double.tryParse(value) ?? 0;
                    _convertTemperature();
                  });
                },
              ),
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
              Text('Convert to:'),
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
              Text('Result: $_result $_toUnit'),
            ],
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
