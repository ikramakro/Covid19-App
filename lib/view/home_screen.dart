// ignore_for_file: must_be_immutable

import 'package:api_boilerplate/data/response/status.dart';
import 'package:api_boilerplate/utils/components/info_card.dart';
import 'package:api_boilerplate/utils/constant/color.dart';
import 'package:api_boilerplate/utils/constant/textstyle.dart';
import 'package:api_boilerplate/utils/routes/routes_name.dart';
import 'package:api_boilerplate/view/detail_screen.dart';
import 'package:api_boilerplate/view_model/home_view_model.dart';
import 'package:api_boilerplate/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeviewModel homeviewModel = HomeviewModel();
  @override
  void initState() {
    homeviewModel.fetchpost();
    super.initState();
  }

  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      drawer: Drawer(
          child: ListView(
        children: [
          ListTile(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text(
                    'This Covid 19 Tricker App You Can Trick Every Detail of Covid 19 '),
                duration: Duration(seconds: 10),
                elevation: 0,
              ));
            },
            leading: const Icon(Icons.info),
            title: const Text('About App'),
          ),
          ListTile(
            onTap: () {
              UserViewModel userViewModel = UserViewModel();
              userViewModel.remove().then((value) {
                Navigator.pushNamed(context, RoutesName.login);
              });
            },
            leading: const Icon(Icons.logout),
            title: const Text('Log Out'),
          )
        ],
      )),
      appBar: appBar(),
      body: ChangeNotifierProvider<HomeviewModel>(
        create: (context) => homeviewModel,
        child: Consumer<HomeviewModel>(
          builder: (context, value, child) {
            switch (value.postlist.status) {
              case Status.LOADING:
                return const Center(child: CircularProgressIndicator());
              case Status.ERROR:
                return Center(child: Text(value.postlist.message.toString()));
              case Status.COMPLETED:
                return homeBody(context, value);
              default:
            }
            return Container();
          },
        ),
      ),
    );
  }

  Padding homeBody(BuildContext context, HomeviewModel value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: MediaQuery.of(context).size.height * .4,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(.05),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
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
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 3 / 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10),
                          children: [
                            InfoCard(
                              value: value.postlist.data!.active.toString(),
                              title: 'Active Cases',
                              iconColor: kContainerbgColor.withOpacity(.12),
                              path: 'Assets/Images/icons/running.svg',
                              txtcolor: Colors.red,
                              ontap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailScreen(
                                              value: value.postlist.data!.active
                                                  .toString(),
                                              title: 'Active Case',
                                              color: Colors.red,
                                            )));
                              },
                            ),
                            InfoCard(
                              value: value.postlist.data!.deaths.toString(),
                              title: 'Total Deaths',
                              iconColor: kContainerbgColor.withOpacity(.12),
                              path: 'Assets/Images/icons/running.svg',
                              txtcolor: Colors.black,
                              ontap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailScreen(
                                              value: value.postlist.data!.deaths
                                                  .toString(),
                                              title: 'Total Deaths',
                                              color: Colors.black,
                                            )));
                              },
                            ),
                            InfoCard(
                              value: value.postlist.data!.recovered.toString(),
                              title: 'Total Recoverd',
                              iconColor: kContainerbgColor.withOpacity(.12),
                              path: 'Assets/Images/icons/running.svg',
                              txtcolor: Colors.green,
                              ontap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailScreen(
                                              value: value
                                                  .postlist.data!.recovered
                                                  .toString(),
                                              title: 'Total Recoverd',
                                              color: Colors.green,
                                            )));
                              },
                            ),
                            InfoCard(
                              value: value.postlist.data!.critical.toString(),
                              title: 'Critical',
                              iconColor: kContainerbgColor.withOpacity(.12),
                              path: 'Assets/Images/icons/running.svg',
                              txtcolor: Colors.amber,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Prevention',
              style: extraLargeText,
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                PreventionCard(
                    svgPath: 'Assets/Images/icons/hand_wash.svg',
                    title: 'Wash hands'),
                PreventionCard(
                    svgPath: 'Assets/Images/icons/use_mask.svg',
                    title: 'Use Masks'),
                PreventionCard(
                    svgPath: 'Assets/Images/icons/Clean_Disinfect.svg',
                    title: 'Clean Disinfect')
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            const HelpCard(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 90),
              child: MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, RoutesName.countrylist);
                },
                color: kPrimaryColor,
                height: 50,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22.0)),
                textColor: kWhiteColor,
                child: const Text(
                  'See Country Wise Cases',
                  style: largeText,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: kPrimaryColor.withOpacity(.03),
      leading: IconButton(
        icon: SvgPicture.asset('Assets/Images/icons/menu.svg'),
        onPressed: () {
          scaffoldkey.currentState!.openDrawer();
        },
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('Assets/Images/icons/search.svg'))
      ],
    );
  }
}

class HelpCard extends StatelessWidget {
  const HelpCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * .5,
                top: MediaQuery.of(context).size.height * .03),
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient:
                    const LinearGradient(colors: [kPrimaryColor, kTextColor]),
                borderRadius: BorderRadius.circular(30)),
            child: RichText(
                text: const TextSpan(children: [
              TextSpan(
                  text: 'Dail 1166 for\nMedical Help!\n',
                  style: colorLargeText),
              TextSpan(text: 'If any symptom appear')
            ])),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SvgPicture.asset('Assets/Images/icons/nurse.svg'),
          ),
          Positioned(
              left: 320,
              top: 15,
              child: SvgPicture.asset('Assets/Images/icons/virus.svg'))
        ],
      ),
    );
  }
}

class PreventionCard extends StatelessWidget {
  String svgPath;
  String title;
  PreventionCard({super.key, required this.svgPath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(svgPath),
        Text(
          title,
          style: colorSmallText,
        ),
      ],
    );
  }
}
