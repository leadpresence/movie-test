class NetworkData {
  static final baseUrl = "https://api.themoviedb.org/";
  static final apiKey = "dbea3481f98c6d69c8b9faea8acf600e";

  Map<String, String> headers = {
    "Content-Type": "application/json",
  };

  Map<String, String> setHeader({bool userBearer = false, bool userJson = false, String? token, String? body}) {
    final Map<String, String> newHeaders = headers;
    if (userBearer) newHeaders["Authorization"] = "Bearer $token";
    if (userJson) newHeaders["Content-Type"] = "application/json";
    if (userJson) newHeaders["accept"] = "application/json";
    return newHeaders;
  }

  static final tempToken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkYmVhMzQ4MWY5OGM2ZDY5YzhiOWZhZWE4YWNmNjAwZSIsInN1YiI6IjYyMTZiNjZjMGI1ZmQ2MDA2OTEzYzM4NSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.QPKVgsw1Qy-xKy2DTYzCraZDkmPB_jYNDmb8hPCxjp8";
}

NetworkData networkData = NetworkData();
