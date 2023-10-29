import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery/services/utils.dart';

class HeartBtn extends StatelessWidget {
  const HeartBtn({
    super.key,
    required this.onLike,
    this.value = false,
  });

  final bool value;
  final void Function() onLike;

  @override
  Widget build(context) {
    final Color color = Utils(context).color;
    return GestureDetector(
      onTap: onLike,
      child: Icon(
        value ? IconlyLight.heart : IconlyBold.heart,
        size: 22,
        color: value ? color : Colors.red,
      ),
    );
  }
}
