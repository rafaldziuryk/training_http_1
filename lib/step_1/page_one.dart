import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_1/step_2/page_two.dart';

class PageOne extends StatefulWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  Future<String> fact = Future.value('Tap a play button to get a cat fact');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            fact = Future.delayed(Duration(seconds: 2), () async {
              final url = Uri.parse('https://catfact.ninja/fact');
              final response = await http.get(url);
              final json = jsonDecode(response.body);
              return json['fact'];
            });
          });
        },
        child: const Icon(Icons.play_arrow),
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: fact,
          builder: (context, snapshot) {
            print('hasData = ${snapshot.hasData} state: ${snapshot.connectionState}');

            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Text('Wait for loading');
              case ConnectionState.waiting:
                return CircularProgressIndicator();
              case ConnectionState.active:
              case ConnectionState.done:
                if (snapshot.hasData) {
                  return Text(snapshot.data ?? '');
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return SizedBox.shrink();
                }
            }
          },
        ),
      ),
    );
  }
}
