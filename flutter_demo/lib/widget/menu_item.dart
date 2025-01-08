import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/screen/detail_screen.dart';

class MenuItem extends StatelessWidget {
  const MenuItem(
      {super.key,
      required this.image,
      required this.title,
      required this.page});

  final String image;
  final String title;
  final dynamic page;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          // Navigate to the details page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => page,
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: const Color.fromRGBO(255, 255, 255, 1),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.25), // rgba(0, 0, 0, 0.25)
                spreadRadius: 0,
                blurRadius: 4,
                offset: Offset(0, 0), // X: 0, Y: 0
              ),
            ],
          ),
          width: 200,
          height: 200,
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset(image),
              const SizedBox(height: 4),
              Text(
                title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
