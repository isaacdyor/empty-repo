import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:provider/provider.dart';
import 'state.dart';

class MyRightBar extends StatelessWidget {
  const MyRightBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (context, state, child) {
      return Container(
          constraints: const BoxConstraints(minWidth: 300, maxWidth: 300),
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(blurRadius: 4, color: Colors.black),
            BoxShadow(blurRadius: 0, color: Colors.white),
            BoxShadow(blurRadius: 0, color: Colors.white),
            BoxShadow(blurRadius: 0, color: Colors.white),
          ]),
          padding: const EdgeInsets.all(20),
          child: Container(
              color: Colors.white,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: MarkdownBody(
                      data: state.accountHeader,
                      softLineBreak: true,
                      fitContent: true,
                    ))
                  ])));
    });
  }
}
