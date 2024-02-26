import 'package:flutter/material.dart';

class Contain extends StatelessWidget {
  String title;
  String content;
  Function() onPressed;

  Contain(
      {required this.title, required this.content, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.grey[300]),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${title}",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Text(
                    "${content}",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
              IconButton(
                  onPressed: onPressed,
                  icon: const Icon(
                    Icons.not_started,
                    size: 35,
                    color: Colors.blue,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
