import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/utils/dimensions.dart';
import 'package:food_app/widgets/small_text.dart';

class ExpandableText extends StatefulWidget {
  final String text;

  const ExpandableText({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;
  double textHeight = Dimensions.ratio * 200;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(
              text: firstHalf,
              height: Dimensions.ratio * 1.5,
              color: AppColors.paraColor,
            )
          : Column(
              children: [
                SmallText(
                    height: Dimensions.ratio * 1.5,
                    color: AppColors.paraColor,
                    size: Dimensions.ratio * 16,
                    text: hiddenText
                        ? firstHalf + "..."
                        : (firstHalf + secondHalf)),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      SmallText(
                        size: Dimensions.ratio * 16,
                        text: hiddenText ? "show more" : "show less",
                        color: AppColors.mainColor,
                      ),
                      Icon(
                        hiddenText
                            ? Icons.arrow_drop_down
                            : Icons.arrow_drop_up,
                        color: AppColors.mainColor,
                        size: Dimensions.ratio * 16,
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
