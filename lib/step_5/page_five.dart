import 'package:dio/dio.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:http_1/step_5/cat_fact.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class PageFive extends StatefulWidget {
  const PageFive({Key? key}) : super(key: key);

  @override
  State<PageFive> createState() => _PageFiveState();
}

class _PageFiveState extends State<PageFive> {
  Future<CatFact> fact = Future(() => const CatFact(fact: '', length: 0));

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
      logPrint: (text) => Fimber.w('BACKEND $text'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            fact = Future.microtask(() async {
              final response = await dio.get('/fact');
              return CatFact.fromJson(response.data);
            });
          });
        },
        child: const Icon(
          Icons.play_arrow,
        ),
      ),
      body: Center(
        child: FutureBuilder<CatFact>(
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
                  return Text(snapshot.data?.fact ?? '');
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
