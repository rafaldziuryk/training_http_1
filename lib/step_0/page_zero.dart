import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_1/step_2/page_two.dart';

class PageZero extends StatefulWidget {
  const PageZero({Key? key}) : super(key: key);

  @override
  State<PageZero> createState() => _PageZeroState();
}

class _PageZeroState extends State<PageZero> {
  String fact = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final url = Uri.parse('https://catfact.ninja/fact');
          final response = await http.get(url);
          final json = jsonDecode(response.body);
          setState(() {
            fact = json['fact'];
          });
        },
        child: const Icon(Icons.play_arrow),
      ),
      body: Center(
        child: Text(fact),
      ),
    );
  }
}
