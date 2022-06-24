import 'dart:convert';

import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_1/step_0/page_zero.dart';
import 'package:http_1/step_1/page_one.dart';
import 'package:http_1/step_2/page_two.dart';
import 'package:http_1/step_3/page_three.dart';
import 'package:http_1/step_4/page_four.dart';
import 'package:http_1/step_5/page_five.dart';

void main() {
  Fimber.plantTree(DebugTree());
  runApp(const MyApp());
  Fimber.e('message');
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const PageZero(),
              )),
              child: const Text('Step 0'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const PageOne(),
              )),
              child: const Text('Step 1'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const PageTwo(),
              )),
              child: const Text('Step 2'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const PageThree(),
              )),
              child: const Text('Step 3'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const PageFour(),
              )),
              child: const Text('Step 4'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const PageFive(),
              )),
              child: const Text('Step 5'),
            ),
          ],
        ),
      ),
    );
  }
}
