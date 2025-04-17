import 'dart:convert';

import 'package:flut_fix/constants.dart';
import 'package:flut_fix/models/movie.dart';
import 'package:http/http.dart' as http;

class Api {
  static const _trendingMovies='https://api.themoviedb.org/3/movie/popular?api_key=${Constants.apiKey}';
  static const _toRatedUrl='https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}';
  static const _upcomingUrl='https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}';


   Future <List<MovieModel>> getTrendingMovies() async{
    final response =await http.get(Uri.parse(_trendingMovies));
    if (response.statusCode ==200) {

      final decodedData=json.decode(response.body)['results'] as List;
      return decodedData.map((movie)=> MovieModel.fromJson(movie)).toList();

    }else{
      throw Exception('Something went wrong');
    }
  }
  Future <List<MovieModel>> getTopRatedMovies() async{
    final response =await http.get(Uri.parse(_toRatedUrl));
    if (response.statusCode ==200) {

      final decodedData=json.decode(response.body)['results'] as List;
      return decodedData.map((movie)=> MovieModel.fromJson(movie)).toList();

    }else{
      throw Exception('Something went wrong');
    }
  }
  Future <List<MovieModel>> getUpcomingMovies() async{
    final response =await http.get(Uri.parse(_upcomingUrl));
    if (response.statusCode ==200) {

      final decodedData=json.decode(response.body)['results'] as List;
      return decodedData.map((movie)=> MovieModel.fromJson(movie)).toList();

    }else{
      throw Exception('Something went wrong');
    }
  }
}