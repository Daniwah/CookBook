import 'package:cookbook/screen/viewmodel/view_model_ai.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatWithAi extends StatelessWidget {
  const ChatWithAi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AiViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat Bot"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Consumer<AiViewModel>(
                builder: (context, viewModel, child) {
                  return Container(
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                          color: const Color.fromARGB(255, 116, 115, 113)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: viewModel.openAiList?.choices.map((data) {
                              final message = data.text;
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: SelectableText(
                                  message,
                                  style: const TextStyle(color: Colors.black),
                                ),
                              );
                            }).toList() ??
                            [],
                      ),
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: viewModel.inputAi,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "gizi makanan apa yang anda cari",
                    hintStyle: const TextStyle(
                      color: Color(0xFFB0B0B0),
                    ),
                    labelStyle: const TextStyle(
                      color: Colors.blueGrey,
                    ),
                    border: InputBorder.none,
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Consumer<AiViewModel>(
                builder: (context, contactModel, child) {
                  if (viewModel.isLoading) {
                    return const CircularProgressIndicator();
                  }
                  final ambilSemuaData = viewModel.keyAi['data'][0];
                  final key = ambilSemuaData['attributes']['key'] ?? "";
                  return ElevatedButton(
                    onPressed: () {
                      viewModel.sendDataAi(key);
                      viewModel.inputAi.clear();
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xFF21ABA5)),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
