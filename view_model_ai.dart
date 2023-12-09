import 'package:cookbook/services/service.dart';
import 'package:cookbook/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../model/model_open_ai.dart';

class AiViewModel with ChangeNotifier {
  Map<String, dynamic> keyAi = {};
  final Dio _dio = Dio();
  final TextEditingController inputAi = TextEditingController();
  final service = Services();
  bool isLoading = true;
  ModelOpenAi? openAiList;
  AiViewModel() {
    tokenAi();
  }

  Future<void> sendDataAi(String key) async {
    final newDataAi = inputAi.text;
    final data = await service.fetchOpenAi(newDataAi, key);
    openAiList = data;
    notifyListeners();
  }

  Future<void> tokenAi() async {
    try {
      final response = await _dio.get(UrlAi.baseUrlToken);

      if (response.statusCode == 200) {
        final data = response.data;
        keyAi = data;
        isLoading = false;
      } else {
        debugPrint('Gagal mengambil data. Status Code: ${response.statusCode}');
      }
    } catch (error) {
      debugPrint('Terjadi kesalahan saat mengambil data: $error');
    }
    notifyListeners();
  }
}
