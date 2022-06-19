import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_1/step_0/page_zero.dart';
import 'package:http_1/step_1/page_one.dart';
import 'package:http_1/step_2/page_two.dart';
import 'package:http_1/step_3/page_three.dart';

void main() {
  runApp(const MyApp());
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
              onPressed: () => Navigaintor.of(context).push(MaterialPageRoute(
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
          ],
        ),
      ),
    );
  }
}
