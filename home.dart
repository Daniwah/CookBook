// ignore_for_file: use_build_context_synchronously

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cookbook/screen/view/detail_masakan.dart';
import 'package:cookbook/screen/view/widget/search.dart';
import 'package:cookbook/screen/viewmodel/view_model_daftar_masakan.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late DaftarMasakanViewModel modelview;
  @override
  void initState() {
    modelview = Provider.of<DaftarMasakanViewModel>(context, listen: false);
    super.initState();
  }

  String titleCase(String text) {
    final List<String> words = text.split('-');
    final List<String> capitalizedWords = words
        .map((word) =>
            word.isEmpty ? '' : '${word[0].toUpperCase()}${word.substring(1)}')
        .toList();

    return capitalizedWords.join(' ');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const CustomSearchBar(),
            Consumer<DaftarMasakanViewModel>(
              builder: (context, modelview, child) {
                if (modelview.makananList == null) {
                  return const Center(
                    child: Text(
                      'Belum Ada Data',
                      style: TextStyle(
                        fontSize: 11,
                      ),
                    ),
                    //CircularProgressIndicator(),
                  );
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: modelview.makananList!.results.length,
                    itemBuilder: (context, index) {
                      final dataMakanan = modelview.makananList?.results[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            title: Row(
                              children: [
                                SizedBox(
                                  height: 80,
                                  width: 100,
                                  child: CachedNetworkImage(
                                    imageUrl: dataMakanan!.img,
                                    placeholder: (context, url) =>
                                        const CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        titleCase(dataMakanan.key),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        dataMakanan.title,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    await modelview
                                        .detailDipilih(dataMakanan.key);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const Detail(
                                            // data: dataMakanan
                                            ),
                                      ),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.arrow_forward_ios,
                                    size: 24.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(
                            thickness: 1,
                          ),
                        ],
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
