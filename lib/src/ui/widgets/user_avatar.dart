import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final String name;
  final String photoUrl;

  const UserAvatar({super.key, required this.photoUrl, required this.name});

  @override
  Widget build(BuildContext context) {
    if (photoUrl.isEmpty) {
      return SizedBox();
    }
    return CircleAvatar(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18.0),
        child: CachedNetworkImage(
          imageUrl: photoUrl,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) =>
              Text(name.substring(0, 1).toUpperCase()),
        ),
      ),
    );
  }
}
