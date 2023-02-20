import 'package:api_boilerplate/utils/components/line_chart.dart';
import 'package:api_boilerplate/utils/constant/color.dart';
import 'package:api_boilerplate/utils/constant/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class InfoCardForDetail extends StatelessWidget {
  String value;
  String title;
  final Color iconColor;
  final String path;
  Color txtcolor;
  VoidCallback? ontap;
  InfoCardForDetail(
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
        height: 250,
        width: 350,
        decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(08),
            boxShadow: const [
              BoxShadow(
                  offset: Offset(0, 25), color: Colors.grey, blurRadius: 24)
            ]),
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
                    height: 50,
                    width: 50,
                    decoration:
                        BoxDecoration(color: iconColor, shape: BoxShape.circle),
                    child: SvgPicture.asset(
                      path,
                      height: 25,
                      width: 25,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 22,
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
              padding: const EdgeInsets.only(bottom: 10.0, top: 30),
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
                            style: extraLargeText,
                          ),
                          const TextSpan(
                            text: '\nPeople',
                            style: largeText,
                          ),
                        ])),
                  ),
                  Expanded(
                      child: LineReportChart(
                    isdetail: true,
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
