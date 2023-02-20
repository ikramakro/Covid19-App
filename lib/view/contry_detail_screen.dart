import 'package:api_boilerplate/utils/components/info_card.dart';
import 'package:api_boilerplate/utils/constant/color.dart';
import 'package:api_boilerplate/utils/constant/textstyle.dart';
import 'package:api_boilerplate/view/detail_screen.dart';
import 'package:api_boilerplate/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountryDetailScreen extends StatefulWidget {
  String name;
  String active;
  String death;
  String recover;
  String critical;
  CountryDetailScreen(
      {super.key,
      required this.name,
      required this.active,
      required this.death,
      required this.recover,
      required this.critical});

  @override
  State<CountryDetailScreen> createState() => _CountryDetailScreenState();
}

class _CountryDetailScreenState extends State<CountryDetailScreen> {
  HomeviewModel homeviewModel = HomeviewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(widget.name),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Total Cases',
              style: extraLargeText,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 270,
              child: GridView(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                children: [
                  InfoCard(
                    value: widget.active,
                    title: 'Active Cases',
                    iconColor: kContainerbgColor.withOpacity(.12),
                    path: 'Assets/Images/icons/running.svg',
                    txtcolor: Colors.red,
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                    value: widget.active,
                                    title: 'Active Case',
                                    color: Colors.red,
                                  )));
                    },
                  ),
                  InfoCard(
                    value: widget.death,
                    title: 'Total Deaths',
                    iconColor: kContainerbgColor.withOpacity(.12),
                    path: 'Assets/Images/icons/running.svg',
                    txtcolor: Colors.black,
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                    value: widget.death,
                                    title: 'Total Deaths',
                                    color: Colors.black,
                                  )));
                    },
                  ),
                  InfoCard(
                    value: widget.recover,
                    title: 'Total Recoverd',
                    iconColor: kContainerbgColor.withOpacity(.12),
                    path: 'Assets/Images/icons/running.svg',
                    txtcolor: Colors.green,
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                    value: widget.recover,
                                    title: 'Total Recoverd',
                                    color: Colors.green,
                                  )));
                    },
                  ),
                  InfoCard(
                    value: widget.critical,
                    title: 'Critical',
                    iconColor: kContainerbgColor.withOpacity(.12),
                    path: 'Assets/Images/icons/running.svg',
                    txtcolor: Colors.amber,
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  AppBar appBar(String name) {
    return AppBar(
      centerTitle: true,
      title: Text(
        name,
        style: blackcolorSmallText,
      ),
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
}
