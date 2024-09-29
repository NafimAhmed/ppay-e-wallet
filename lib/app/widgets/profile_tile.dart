




// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class ProfileTile extends StatelessWidget{

  final Widget image;
  final Callback onTap;
  final String title;

  const ProfileTile({super.key, required this.image, required this.onTap, required this.title});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      onTap: onTap,
      leading: image,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          const Icon(
            Icons.arrow_forward_ios,
            size: 15,
          )
        ],
      ),

    );
  }

}