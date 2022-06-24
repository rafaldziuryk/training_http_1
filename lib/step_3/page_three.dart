import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class PageThree extends StatefulWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  State<PageThree> createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  Future<String> fact = Future(() => '');

  late final Dio dio;

  @override
  void initState() {
    super.initState();
    dio = Dio(BaseOptions(
      baseUrl: 'https://catfact.ninja',
      connectTimeout: 10000,
      receiveTimeout: 10000,
      sendTimeout: 10000,
      validateStatus: (status) => status == 200, // options.dart:609
    ));

    if (kDebugMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestBody: true,
        request: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            fact = Future.microtask(() async {
              final response = await dio.get('/fact');
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
