import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'state.dart';

class MyContentBar extends StatelessWidget {
  const MyContentBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (context, state, child) {
      return Text("content bottom");
    });
  }
}
