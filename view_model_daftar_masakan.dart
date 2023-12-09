import 'package:cookbook/model/model_daftar_masakan.dart';
import 'package:cookbook/model/model_detail_masakan.dart';
import 'package:cookbook/services/service.dart';
import 'package:flutter/material.dart';

class DaftarMasakanViewModel with ChangeNotifier {
  ModelSearchMasakan? makananList;
  ModelDetailMasakan? detailList;
  final TextEditingController inputSearch = TextEditingController();
  final service = Services();

  Future<void> getData(String search) async {
    try {
      final data = await service.fetchSearch(search);
      makananList = data;
      notifyListeners();
    } catch (error) {
      throw Exception('Gagal mengambil data dari API: $error');
    }
  }

  Future<void> search() async {
    final searchFromUser = inputSearch.text;
    final data = await service.fetchSearch(searchFromUser);
    makananList = data;
    notifyListeners();
  }

  Future<void> detailDipilih(String keyValue) async {
    final data = await service.fetchDetailMasakan(keyValue);
    detailList = data;
    notifyListeners();
  }
}
