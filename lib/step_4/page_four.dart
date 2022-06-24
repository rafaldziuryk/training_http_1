import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_1/step_4/cat_fact.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class PageFour extends StatefulWidget {
  const PageFour({Key? key}) : super(key: key);

  @override
  State<PageFour> createState() => _PageFourState();
}

class _PageFourState extends State<PageFour> {
  List<CatFact> facts = [];
  Future<List<CatFact>> fact = Future.value([]);

  late final Dio dio;

  @override
  void initState() {
    super.initState();
    dio = Dio(BaseOptions(
      baseUrl: 'https://catfact.ninja',
      connectTimeout: 10000,
      receiveTimeout: 10000,
      sendTimeout: 10000,
    ));

    dio.interceptors.add(PrettyDioLogger(
      requestBody: true,
      request: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            fact = Future.microtask(() async {
              final response = await dio.get('/fact');
              final fact = CatFact.fromMap(response.data);
              facts.add(fact);
              return facts;
            });
          });
        },
        child: const Icon(
          Icons.play_arrow,
        ),
      ),
      body: Center(
        child: FutureBuilder<List<CatFact>>(
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
                  return ListView.builder(
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      final item = snapshot.data?[index];
                      return Text(item?.fact ?? '');
                    },
                  );
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
