import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'contentbar.dart';
import 'state.dart';

class MyContent extends StatelessWidget {
  const MyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (context, state, child) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Container(
                    padding: const EdgeInsets.all(20),
                    child: MarkdownBody(data: "## Content..."))),
            Container(padding: const EdgeInsets.all(20), child: MyContentBar()),
          ]);
    });
  }
}
