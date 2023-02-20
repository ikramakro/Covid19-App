import 'package:api_boilerplate/utils/components/info_card_for_detail.dart';
import 'package:api_boilerplate/utils/constant/color.dart';
import 'package:api_boilerplate/utils/constant/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class DetailScreen extends StatelessWidget {
  String value;
  String title;
  Color color;
  DetailScreen(
      {super.key,
      required this.value,
      required this.title,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: MediaQuery.of(context).size.height * .8,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(.05),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Total Cases',
                      style: extraLargeText,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .01,
                    ),
                    InfoCardForDetail(
                      value: value,
                      title: title,
                      iconColor: kContainerbgColor.withOpacity(.12),
                      path: 'Assets/Images/icons/running.svg',
                      txtcolor: color,
                      ontap: () {},
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .05,
                    ),
                    const Text(
                      'Globel Map',
                      style: largeText,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.transparent,
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 25),
                                color: Color.fromARGB(255, 223, 221, 221),
                                blurRadius: 25)
                          ]),
                      child: SvgPicture.asset(
                        'Assets/Images/icons/map.svg',
                        height: MediaQuery.of(context).size.height * .3,
                      ),
                    )
                  ],
                )),
          ],
        ));
  }
}

AppBar appBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: kPrimaryColor.withOpacity(.03),
    leading: IconButton(
      icon: const Icon(
        Icons.arrow_back_ios_new,
        color: Colors.black,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
  );
}
