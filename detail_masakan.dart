import 'package:cookbook/screen/viewmodel/view_model_daftar_masakan.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Detail extends StatelessWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final modelView =
        Provider.of<DaftarMasakanViewModel>(context, listen: false);
    final detail = modelView.detailList!.results;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(detail.image),
              Text(
                detail.title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(detail.description),
              const Text(
                'Alat',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              for (var ingredient in detail.ingredient) Text(ingredient),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Step-step',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              for (var step in detail.step) Text(step),
            ],
          ),
        ),
      ),
    );
  }
}
