import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:provider/provider.dart';
import 'state.dart';

class MyLeftBar extends StatelessWidget {
  const MyLeftBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (context, state, child) {
      return Container(
        constraints: const BoxConstraints(minWidth: 300, maxWidth: 300),
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(blurRadius: 4, color: Colors.grey),
          BoxShadow(blurRadius: 0, color: Colors.white),
          BoxShadow(blurRadius: 0, color: Colors.white),
          BoxShadow(blurRadius: 0, color: Colors.white),
        ]),
        child: ListView(
          children: [
            MyLeftBarItem(title: "Home"),
            MyLeftBarItem(title: "About"),
            MyLeftBarItem(title: "FAQ"),
            MyLeftBarItem(title: "Credits"),
          ],
        ),
      );
    });
  }
}

class MyLeftBarItem extends StatelessWidget {
  const MyLeftBarItem({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        debugPrint("Clicked ${title}");
      },
      child: Text(title),
    );
  }
}
