import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MoneyBox extends StatelessWidget {

  // Create constructor
  MoneyBox(this.title, this.amoung, this.color, this.size, {super.key});

  // Variable init
  String title;
  double amoung;
  Color color;
  double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(10)),
      height: size,
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
            child: Text(
              NumberFormat("#,###.##").format(amoung),
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white70,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
