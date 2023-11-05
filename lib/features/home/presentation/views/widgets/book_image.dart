import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookImage extends StatelessWidget {
  const BookImage({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.19,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            blurStyle: BlurStyle.outer,
          )
        ],
      ),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        placeholder: (context, url) => Container(
          color: Colors.grey,
          width: MediaQuery.sizeOf(context).width * .16,
          height: MediaQuery.sizeOf(context).height * .16,
        ),
        errorWidget: (context, url, error) => Container(
          color: Colors.grey,
          width: MediaQuery.sizeOf(context).width * .16,
          height: MediaQuery.sizeOf(context).height * .16,
          child: const Center(
            child: Text('No Image'),
          ),
        ),
        fit: BoxFit.fill,
      ),
    );
  }
}
