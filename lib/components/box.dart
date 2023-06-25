import 'package:flutter/material.dart';

class Box extends StatefulWidget {
  const Box({
    super.key,
    required this.player,
    required this.onTap,
    required this.row,
    required this.col,
  });

  final String player;
  final Function(int row, int col) onTap;
  final int row;
  final int col;

  @override
  State<Box> createState() => _BoxState();
}

class _BoxState extends State<Box> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double boxWidth = (screenWidth / 3) - 2;
    return GestureDetector(
      onTap: () {
        widget.onTap(widget.row, widget.col);
        setState(() {});
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 3),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            border: Border.all(
              color: const Color(0xff793DF7),
            ),
          ),
          width: boxWidth,
          height: 130,
          child: Center(
            child: Text(
              widget.player,
              style: const TextStyle(
                color: Color(0xff6e44ff),
                fontSize: 60,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
