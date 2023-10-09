<h1 align="center">
  Flutter TimezoneDropdown
  <br>
</h1>

<h4 align="center">
  <a href="https://flutter.io" target="_blank">Flutter</a> simple and robust TimzeonDropdown with  search feature, Place it anywhere you need to list all timezones and pick one.
</h4>

<p align="center">
  <a href="#key-features">Key Features</a> •
  <a href="#license">License</a>
</p>

## Key Features

* Automatic detection of device Timezone and set seleted as default


## packages.yaml
```yaml
timezone_dropdown: <lastest version>
```

## Import
```dart
import 'package:timezone_dropdown/timezone_dropdown.dart';
```


## Simple implementation

```dart
import 'package:flutter/material.dart';
import 'package:timezone_dropdown/timezone_dropdown.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timezone Dropdown',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Timezone Drop Down Home Page'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        child: TimezoneDropdown(
          hintText: 'Select Timezone',
          onTimezoneSelected: (timeZone) => print(timeZone),
        ),
      ),
    );
  }
}

```

## License

MIT