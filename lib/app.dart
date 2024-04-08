import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zinc_flutter_assignment/provider/store_provider.dart';
import 'package:zinc_flutter_assignment/view/screens/home.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<StoreProvider>(
            create: (context) => StoreProvider()),
      ],
      child: Builder(builder: (context) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Home(),
        );
      }),
    );
  }
}
