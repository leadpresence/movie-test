import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:movie_app/network/data.dart';
import 'package:movie_app/network/errorHandler.dart';
import 'package:movie_app/network/requestManager.dart';
import 'package:movie_app/utils/helpers.dart';

/// Returns trending movies of the day.
Future<Map<String, dynamic>> getTrending () async {
  closeKeyboard();
  HttpRequests httpRequests =
      HttpRequests(url: NetworkData.baseUrl + "3/trending/movie/day?api_key=${NetworkData.apiKey}", headers: networkData.setHeader(userBearer: true, token: NetworkData.tempToken, userJson: true));
  Response response = await httpRequests.get();
  ErrorHandler errorHandler = new ErrorHandler(response: response);
  if (!errorHandler.hasError) {
    return Map<String, dynamic>.from(json.decode(response.body));
  } else {
    print(errorHandler.errorMessage);
    return {};
  }
}
/// Returns movies based on a search [term].
Future<Map<String, dynamic>> searchMovies () async {
  closeKeyboard();
  HttpRequests httpRequests =
      HttpRequests(url: NetworkData.baseUrl + "3/search/movie/day?api_key=${NetworkData.apiKey}", headers: networkData.setHeader(userBearer: true, token: NetworkData.tempToken, userJson: true));
  Response response = await httpRequests.get();
  ErrorHandler errorHandler = new ErrorHandler(response: response);
  if (!errorHandler.hasError) {
    return Map<String, dynamic>.from(json.decode(response.body));
  } else {
    print(errorHandler.errorMessage);
    return {};
  }
}
/// Returns movies based on id [id].
Future<Map<String, dynamic>> getMovieDetails (int id) async {
  closeKeyboard();
  HttpRequests httpRequests =
      HttpRequests(url: NetworkData.baseUrl + "3/movie/$id?api_key=${NetworkData.apiKey}&language=en-US", headers: networkData.setHeader(userBearer: true, token: NetworkData.tempToken, userJson: true));
  Response response = await httpRequests.get();
  ErrorHandler errorHandler = new ErrorHandler(response: response);
  if (!errorHandler.hasError) {
    return Map<String, dynamic>.from(json.decode(response.body));
  } else {
    print(errorHandler.errorMessage);
    return {};
  }
}
/// Returns the cast and crew for a movie with [id].
Future<Map<String, dynamic>> getCredits (int id) async {
  closeKeyboard();
  HttpRequests httpRequests =
      HttpRequests(url: NetworkData.baseUrl + "3/movie/$id/credit/credits?api_key=${NetworkData.apiKey}", headers: networkData.setHeader(userBearer: true, token: NetworkData.tempToken, userJson: true));
  Response response = await httpRequests.get();
  ErrorHandler errorHandler = ErrorHandler(response: response);
  if (!errorHandler.hasError) {
    return Map<String, dynamic>.from(json.decode(response.body));
  } else {
    print(errorHandler.errorMessage);
    return {};
  }
}
/// Returns the upcoming movies.
Future<Map<String, dynamic>> getUpcoming () async {
  closeKeyboard();
  HttpRequests httpRequests =
      HttpRequests(url: NetworkData.baseUrl + "3/movie/upcoming?api_key=${NetworkData.apiKey}", headers: networkData.setHeader(userBearer: true, token: NetworkData.tempToken, userJson: true));
  Response response = await httpRequests.get();
  ErrorHandler errorHandler = ErrorHandler(response: response);
  if (!errorHandler.hasError) {
    return Map<String, dynamic>.from(json.decode(response.body));
  } else {
    print(errorHandler.errorMessage);
    return {};
  }
}

