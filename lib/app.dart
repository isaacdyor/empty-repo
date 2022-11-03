import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'scaffold.dart';
import 'state.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AppState(),
        child: Consumer<AppState>(builder: (context, state, child) {
          print("building material app...");
          return MaterialApp(
            title: "App",
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            initialRoute: "/",
            onGenerateRoute: (settings) {
              final url = (settings.name !=
                      null) // tdb: what are anonymous routes; when can the happen and why?
                  ? Uri.parse(settings.name!)
                  : Uri.parse("/");
              print("Generating route for ${url.toString()}");
              state.init(url);
              switch (url.path) {
                case "/":
                  return MaterialPageRoute(builder: (context) => MyScaffold());
                default:
                  return MaterialPageRoute(builder: (context) => MyScaffold());
              }
            },
          );
        }));
  }
}
