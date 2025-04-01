import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final String photoUrl;
  const UserAvatar({super.key, required this.photoUrl});

  @override
  Widget build(BuildContext context) {
    if (photoUrl.isEmpty){
      return SizedBox();
    }
    return CircleAvatar(
      backgroundImage: NetworkImage(photoUrl),
    );
  }
}
