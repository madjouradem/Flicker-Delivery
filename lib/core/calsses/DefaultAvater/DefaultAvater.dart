import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'DefaultAvaterCtr.dart';

class DefaultAvater extends GetView<DefaultAvaterCtr> {
  const DefaultAvater({
    super.key,
    required this.name,
    this.image,
    this.height = 50,
    this.width = 50,
    this.radius = 30,
    this.fontSize = 16,
  });

  final String name;
  final String? image;
  final double height;
  final double width;
  final double radius;
  final double fontSize;
  // final ConversationModel conversationModel;

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => DefaultAvaterCtr());
    return Stack(
      children: [
        Container(
          height: height.spMin,
          width: width.spMin,
          decoration: BoxDecoration(
            color: controller.getColor(
              name.toUpperCase(),
            ),
            image: image != null
                ? DecorationImage(
                    image: CachedNetworkImageProvider(image!),
                    fit: BoxFit.cover,
                  )
                : null,
            borderRadius: BorderRadius.circular(radius.r),
          ),
          child: image != null
              ? Container()
              : Center(
                  child: Text(
                    name.toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontSize: fontSize.spMin),
                  ),
                ),
        ),
      ],
    );
  }
}
