import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'state.dart';

class MyTopBar extends StatelessWidget {
  const MyTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (context, state, child) {
      return LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
            color: Colors.black,
            width: 300,
            padding: const EdgeInsets.all(0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        if (constraints.maxWidth > 700) {
                          state.toggleLeftBar();
                        } else {
                          Scaffold.of(context).openDrawer();
                        }
                      },
                      tooltip: 'Menu',
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 24.0,
                      )),
                  SelectableText(
                    state.title,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        if (constraints.maxWidth > 1000) {
                          state.toggleRightBar();
                        } else {
                          Scaffold.of(context).openEndDrawer();
                        }
                      },
                      tooltip: 'Account',
                      icon: const Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 24.0,
                      )),
                ]));
      });
    });
  }
}
