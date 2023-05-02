import 'package:hello_world/movie_model.dart';

class MovieDatabase {
  List<MovieModel> _movies = [
    MovieModel(id: 1, name: 'avatar', category: 'science', releaseYear: 2015),
    MovieModel(id: 2, name: 'Kin-Kong', category: 'Business', releaseYear: 2012),
    MovieModel(id: 3, name: 'DUM-2', category: 'ETC', releaseYear: 2032),
    MovieModel(id: 4, name: 'ABC', category: 'Others', releaseYear: 2015),
    MovieModel(id: 5, name: 'XYZ', category: 'science', releaseYear: 2015),
    MovieModel(id: 6, name: 'MNA', category: 'science', releaseYear: 2015),
    MovieModel(id: 7, name: 'oiiq', category: 'science', releaseYear: 2015),
  ];

  List<MovieModel> get movies => _movies;
}
