import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/network/data.dart';
import 'package:movie_app/network/requestManager.dart';
import 'package:movie_app/utils/helpers.dart';


Future<Map<String, dynamic>> getMovies () async {
  closeKeyboard();
  HttpRequests httpRequests =
      HttpRequests(url: NetworkData.profileUrl + "questions/" + id /*  + "page=$page&limit=10" */, headers: networkData.setHeader(userBearer: true, token: userModel.token, userJson: true));
  Response response = await httpRequests.get();
  ErrorHandler errorHandler = new ErrorHandler(response: response);
  if (!errorHandler.hasError) {
    return Map<String, dynamic>.from(json.decode(response.body));
  } else {
    print(errorHandler.errorMessage);
    return {};
  }
}