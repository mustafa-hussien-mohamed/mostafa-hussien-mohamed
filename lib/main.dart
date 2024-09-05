import 'package:flutter/material.dart';
import 'package:flutter_day13_form/widgets/custom_text_field.dart';
import 'views/register_screen.dart';

void main(List<String> args) {
  runApp(Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: Text("Form"),
        ),
        body:register_screen()
      )
    );
  }
}
