import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// 2. 이미지 배너 (탭 시 외부 링크 연결)
class ImageBannerCard extends StatelessWidget {
  final String imageUrl;
  final String link;
  final double height;

  const ImageBannerCard({
    super.key,
    required this.imageUrl,
    required this.link,
    this.height = 150, // 기본 높이 설정
  });

  Future<void> _launchUrl(String str) async {
    Uri url = Uri.parse(str);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _launchUrl(link),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 4,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            imageUrl,
            height: height,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
