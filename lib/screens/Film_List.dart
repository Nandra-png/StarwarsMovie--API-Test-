import 'package:api_project/models/FilmModel.dart';
import 'package:api_project/services/api_service.dart';
import 'package:api_project/widgets/film_card.dart';
import 'package:flutter/material.dart';

class FilmListScreen extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        elevation: 0,
        title: Text(
          'Star Wars Films',
          style: TextStyle(
            color: Colors.yellow,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black87,
      body: FutureBuilder<List<Film>>(
        future: apiService.fetchFilms(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.yellow,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 60,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Error: ${snapshot.error}',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            );
          } else {
            List<Film> films = snapshot.data!;
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListView.builder(
                itemCount: (films.length / 2).ceil(),
                itemBuilder: (context, rowIndex) {
                  return Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: FilmCard(film: films[rowIndex * 2]),
                        ),
                      ),
                      if (rowIndex * 2 + 1 < films.length)
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: FilmCard(film: films[rowIndex * 2 + 1]),
                          ),
                        ),
                    ],
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
