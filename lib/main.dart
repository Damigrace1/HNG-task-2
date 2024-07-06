import 'package:flutter/material.dart';
import 'package:hngt2/dio_provider.dart';
import 'package:hngt2/views/pages/products_list.dart';

import 'custom_interceptor.dart';

void main() {
  runApp(const MyApp());
  DioProvider().dio.interceptors.add(CustomInterceptor());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'HNG Task 2',
      home: ProductsList(),
    );
  }
}

