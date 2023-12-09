import 'package:cookbook/model/model_daftar_masakan.dart';
import 'package:cookbook/model/model_detail_masakan.dart';
import 'package:cookbook/model/model_open_ai.dart';
import 'package:cookbook/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/model_sign_in.dart';

class Services {
  final Dio _dio = Dio();
  late String authToken;

  Future<ModelSearchMasakan?> fetchSearch(String searchValue) async {
    try {
      final response = await _dio.get(
        Urls.baseUrl + Urls.search + searchValue,
      );
      debugPrint("=>${response.data}");
      final Map<String, dynamic> jsonData = response.data;
      final ModelSearchMasakan modelMasakan =
          modelSearchMasakanFromJson(jsonData);
      return modelMasakan;
    } catch (error) {
      debugPrint('Terjadi kesalahan saat melakukan permintaan: $error');
      return null;
    }
  }

  Future<ModelOpenAi?> fetchOpenAi(String newDataAi, String key) async {
    _dio.options = BaseOptions(
      baseUrl: UrlAi.baseUrlOpenAi,
      headers: {
        'Authorization': 'Bearer $key',
      },
    );
    try {
      final response = await _dio.post(
        'completions',
        data: {
          "model": "text-davinci-003",
          "prompt":
              "Kamu adalah seorang juru masak dan ahli gizi. kamu akan ditanyai hal seputar masakan dan gizi masakan. $newDataAi",
          "temperature": 0.4,
          "max_tokens": 900,
          "top_p": 1,
          "frequency_penalty": 0,
          "presence_penalty": 0,
        },
      );
      debugPrint("=>${response.data}");
      final Map<String, dynamic> jsonData = response.data;
      final ModelOpenAi modelOpenAi = modelOpenAiFromJson(jsonData);
      return modelOpenAi;
    } catch (error) {
      debugPrint('Terjadi kesalahan saat mengambil data: $error');
      return null;
    }
  }

  Future<ModelDetailMasakan?> fetchDetailMasakan(String keyValue) async {
    try {
      final response = await _dio.get(Urls.baseUrl + Urls.detail + keyValue);

      debugPrint("=>${response.data}");
      final Map<String, dynamic> jsonData = response.data;
      final ModelDetailMasakan modelDetailMasakan =
          modelDetailMasakanFromJson(jsonData);
      return modelDetailMasakan;
    } catch (error) {
      debugPrint('Terjadi kesalahan saat mengambil data: $error');
      return null;
    }
  }
    Future<ModelSignIn?> signInAccount(String email, String password) async {
    try {
      final response = await _dio.post(
        Urls.signIn,
        data: {
          'email': email,
          'password': password,
        },
      );
      debugPrint("=>${response.data}");
      final Map<String, dynamic> jsonData = response.data;
      final ModelSignIn modelSignIn = modelSignInFromJson(jsonData);
      return modelSignIn;
    } catch (error) {
      debugPrint('Terjadi kesalahan saat melakukan permintaan: $error');
      return null;
    }
  }
}
