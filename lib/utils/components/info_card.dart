import 'package:api_boilerplate/utils/components/line_chart.dart';
import 'package:api_boilerplate/utils/constant/color.dart';
import 'package:api_boilerplate/utils/constant/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class InfoCard extends StatelessWidget {
  String value;
  final String title;
  final Color iconColor;
  final String path;
  final Color txtcolor;
  VoidCallback? ontap;
  InfoCard(
      {super.key,
      required this.value,
      required this.title,
      required this.iconColor,
      required this.path,
      required this.txtcolor,
      this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 120,
        width: 180,
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(08),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 30,
                    width: 30,
                    decoration:
                        BoxDecoration(color: iconColor, shape: BoxShape.circle),
                    child: SvgPicture.asset(
                      path,
                      height: 12,
                      width: 12,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: txtcolor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: RichText(
                        text: TextSpan(
                            style: const TextStyle(color: kTextColor),
                            children: [
                          TextSpan(
                            text: value,
                            style: largeText,
                          ),
                          const TextSpan(
                            text: '\nPeople',
                            style: smallText,
                          ),
                        ])),
                  ),
                  Expanded(
                      child: LineReportChart(
                    isdetail: false,
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
