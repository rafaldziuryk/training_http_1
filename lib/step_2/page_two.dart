import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http_1/step_3/page_three.dart';

class PageTwo extends StatefulWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  Future<String> fact = Future(() => '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            fact = Future.microtask(() async {
              final response = await Dio().get(
                'https://catfact.ninja/fact',
              );
              return response.data['fact'];
            });
          });
        },
        child: const Icon(
          Icons.play_arrow,
        ),
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: fact,
          builder: (context, snapshot) {
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
