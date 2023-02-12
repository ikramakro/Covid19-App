import 'package:api_boilerplate/data/response/status.dart';
import 'package:api_boilerplate/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                return const Center(child: Text('jfg'));
              default:
            }
            return Container();
          },
        ),
      ),
    );
  }
}
