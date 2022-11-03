import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'topbar.dart';
import 'rightbar.dart';
import 'leftbar.dart';
import 'content.dart';
import 'state.dart';

class MyScaffold extends StatelessWidget {
  const MyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    print("building the scaffolding...");
    return Consumer<AppState>(builder: (context, state, child) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MyTopBar(),
            Expanded(child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Visibility(
                      visible: state.showLeftBar && constraints.maxWidth > 700,
                      child: const MyLeftBar(),
                    ),
                    Expanded(child: MyContent()),
                    // Spacer(),
                    Visibility(
                      visible:
                          state.showRightBar && constraints.maxWidth > 1000,
                      child: MyRightBar(),
                    ),
                  ]);
            })),
          ],
        ),
        drawer: const Drawer(
          child: MyLeftBar(),
        ),
        endDrawer: const Drawer(
          child: MyRightBar(),
        ),
      );
    });
  }
}
