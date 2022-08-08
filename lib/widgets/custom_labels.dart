import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  final String ruta;
  final String title01;
  final String title02;

  const Labels({
    Key? key,
    required this.ruta,
    required this.title01,
    required this.title02,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        title01,
        style: const TextStyle(
            color: Colors.black54, fontSize: 15, fontWeight: FontWeight.w300),
      ),
      const SizedBox(height: 10),
      GestureDetector(
        child: Text(
          title02,
          style: TextStyle(
              color: Colors.blue[600],
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        onTap: () {
          Navigator.pushReplacementNamed(context, ruta);
        },
      ),
    ]);
  }
}
