import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class MyButtonWidgets extends StatelessWidget {
  final String text;
  final Color color;
  final Function onPress;
  const MyButtonWidgets({required this.color,required this.text,required this.onPress,super.key});

  // const MyButtonWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      width: double.infinity,
      child: MaterialButton(
        color: color,
        height: 45,
        elevation: 0,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none),
        onPressed: onPress() ,
        child: const Text(
          "Click",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
