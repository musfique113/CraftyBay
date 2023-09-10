import 'package:CraftyBay/home.dart';
import 'package:flutter/material.dart';
void main(){
  runApp(const CraftyBay());
}

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Crafty Bay',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          useMaterial3: true,
          fontFamily: "Poppins",
        ),
        home: OrientationBuilder(
          builder: (context, orientation) {
            return const HomeScreen();
          },
        ));
  }
}

