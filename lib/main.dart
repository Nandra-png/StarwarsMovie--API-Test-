import 'package:api_project/screens/Film_List.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  await initializeDateFormatting('id_ID', null);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Star Wars Films',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FilmListScreen(),
    );
  }
}
