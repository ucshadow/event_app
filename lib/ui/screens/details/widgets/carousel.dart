import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../models/remote/ticket_master_event/sub_models/event_image.dart';

class Carousel extends StatelessWidget {
  const Carousel({
    super.key,
    required this.images,
  });

  final List<EventImage> images;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 300.0,
        viewportFraction: 1,
        enlargeCenterPage: false,
        autoPlay: true,
      ),
      items: images.map((EventImage i) {
        return Builder(
          builder: (BuildContext context) {
            return CachedNetworkImage(imageUrl: i.url);
          },
        );
      }).toList(),
    );
  }
}
