import 'package:cookbook/screen/viewmodel/view_model_daftar_masakan.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel =
        Provider.of<DaftarMasakanViewModel>(context, listen: false);
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Consumer<DaftarMasakanViewModel>(
                builder: (context, textFieldValidationProvider, child) {
                  return TextFormField(
                    controller: viewModel.inputSearch,
                    decoration: const InputDecoration(
                      hintText: 'Hari ini masak apa ya...',
                    ),
                  );
                },
              ),
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                viewModel.search();
              },
            ),
          ],
        ),
      ),
    );
  }
}
