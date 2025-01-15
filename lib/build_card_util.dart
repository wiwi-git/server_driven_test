import 'package:flutter/material.dart';
import 'package:server_app_test/card_datum.dart';
import 'package:server_app_test/cards/image_banner_card.dart';
import 'package:server_app_test/cards/profile_card.dart';
import 'package:server_app_test/cards/square_image_car.dart';
import 'package:server_app_test/cards/title_subtitle_card.dart';

class BuildCardUtil {
  Widget build(CardType type, dynamic data) {
    Map<String, dynamic> map = data as Map<String, dynamic>;

    switch (type) {
      case CardType.banner:
        String imageUrl = map["imageUrl"] as String;
        String link = map["link"] as String;
        return ImageBannerCard(imageUrl: imageUrl, link: link);

      case CardType.profile:
        String name = map["name"] as String;
        String bio = map["bio"] as String;
        String imageUrl = map["imageUrl"] as String;
        return ProfileCard(name: name, bio: bio, imageUrl: imageUrl);

      case CardType.squareImage:
        String imageUrl = map["imageUrl"] as String;
        return SquareImageCard(imageUrl: imageUrl);

      case CardType.titleAndSub:
        String title = map["title"] as String;
        String subtitle = map["subtitle"] as String;
        return TitleSubtitleCard(title: title, subtitle: subtitle);

      default:
        return Container();
    }
  }
}
