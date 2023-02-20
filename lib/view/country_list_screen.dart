import 'package:api_boilerplate/utils/constant/color.dart';
import 'package:api_boilerplate/view/contry_detail_screen.dart';
import 'package:api_boilerplate/view_model/country_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class CountryListScreen extends StatefulWidget {
  const CountryListScreen({super.key});

  @override
  State<CountryListScreen> createState() => _CountryListScreenState();
}

class _CountryListScreenState extends State<CountryListScreen> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final countryList = Provider.of<CountryListViewModel>(context);
    return Scaffold(
        appBar: appBar(),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.height * .02,
                  vertical: MediaQuery.of(context).size.height * .03),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {});
                },
                controller: controller,
                decoration: InputDecoration(
                    hintText: 'Search by country name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: countryList.myrepo.getcountrylist(),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (!snapshot.hasData) {
                    return ListView.builder(
                      itemCount: 50,
                      itemBuilder: (context, index) {
                        return Shimmer.fromColors(
                            baseColor: Colors.grey.shade400,
                            highlightColor: Colors.grey.shade100,
                            child: ListTile(
                              leading: Container(
                                height: 50,
                                width: 80,
                                color: Colors.white,
                              ),
                              title: Container(
                                height: 20,
                                width: 80,
                                color: Colors.white,
                              ),
                              subtitle: Container(
                                height: 10,
                                width: 80,
                                color: Colors.white,
                              ),
                            ));
                      },
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        String name = snapshot.data![index]['country'];
                        if (controller.text.isEmpty) {
                          return ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CountryDetailScreen(
                                            name: snapshot.data![index]
                                                ['country'],
                                            active: snapshot.data![index]
                                                    ['cases']
                                                .toString(),
                                            death: snapshot.data![index]
                                                    ['deaths']
                                                .toString(),
                                            recover: snapshot.data![index]
                                                    ['recovered']
                                                .toString(),
                                            critical: snapshot.data![index]
                                                    ['critical']
                                                .toString(),
                                          )));
                            },
                            leading: Image.network(
                              snapshot.data![index]['countryInfo']['flag']
                                  .toString(),
                              height: 70,
                              width: 70,
                            ),
                            title: Text(snapshot.data![index]['country']),
                          );
                        } else if (name
                            .toLowerCase()
                            .contains(controller.text.toLowerCase())) {
                          return ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CountryDetailScreen(
                                            name: snapshot.data![index]
                                                ['country'],
                                            active: snapshot.data![index]
                                                    ['cases']
                                                .toString(),
                                            death: snapshot.data![index]
                                                    ['deaths']
                                                .toString(),
                                            recover: snapshot.data![index]
                                                    ['recovered']
                                                .toString(),
                                            critical: snapshot.data![index]
                                                    ['critical']
                                                .toString(),
                                          )));
                            },
                            leading: Image.network(
                              snapshot.data![index]['countryInfo']['flag']
                                  .toString(),
                              height: 70,
                              width: 70,
                            ),
                            title: Text(snapshot.data![index]['country']),
                          );
                        } else {
                          return Container();
                        }
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ));
  }

  AppBar appBar() {
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
}
