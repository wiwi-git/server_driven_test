import 'package:flutter/material.dart';

/// 3. 정사각형 형태의 꽉 찬 사진
class SquareImageCard extends StatelessWidget {
  final String imageUrl;

  const SquareImageCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.network(
          imageUrl,
          height: 320,
          width: 320,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
