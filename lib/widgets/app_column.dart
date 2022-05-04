import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/widgets/small_text.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';
import 'icon_and_text_widget.dart';

class AppColumn extends StatelessWidget {
  final String text;

  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: Dimensions.ratio * 26,
        ),
        SizedBox(
          height: Dimensions.ratio * 10,
        ),
        Row(
          children: [
            Wrap(
                children: List.generate(
                    5,
                    (index) => Icon(Icons.star,
                        color: AppColors.mainColor,
                        size: Dimensions.ratio * 15))),
            SizedBox(width: Dimensions.ratio * 10),
            SmallText(
              text: "4.5",
              size: Dimensions.ratio * 12,
            ),
            SizedBox(width: Dimensions.ratio * 10),
            SmallText(
              text: "1267",
              size: Dimensions.ratio * 12,
            ),
            SizedBox(width: Dimensions.ratio * 10),
            SmallText(text: "comments", size: Dimensions.ratio * 12),
          ],
        ),
        SizedBox(height: Dimensions.ratio * 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndTextWidget(
                icon: Icons.circle_sharp,
                text: "Normal",
                size: Dimensions.ratio * 25,
                iconColor: AppColors.iconColor),
            IconAndTextWidget(
                icon: Icons.location_on,
                text: "1.7km",
                size: Dimensions.ratio * 25,
                iconColor: AppColors.iconColor2),
            IconAndTextWidget(
                icon: Icons.access_time_rounded,
                text: "32min",
                size: Dimensions.ratio * 25,
                iconColor: AppColors.iconColor3)
          ],
        )
      ],
    );
  }
}
