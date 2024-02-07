import 'package:flutter/material.dart';
import 'package:fulltime_force/src/models/commits.model.dart';
import 'package:fulltime_force/src/provider/data_provider.dart';
import 'package:fulltime_force/src/widgets/Commits_List.widget.dart';
import 'package:fulltime_force/src/widgets/loader_widget.dart';

class HomePage extends StatefulWidget {
  static String id = "HomePage";

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Commits> commits = [];
  bool isLoading = true;
  String? errorMessage;
  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('FullTime Force'),
          centerTitle: true,
        ),
        backgroundColor: Colors.grey,
        body: isLoading
            ? const LoaderWidget()
            : errorMessage == null
                ? CommitsListWidget(
                    commitsList: commits,
                  )
                : Center(
                    child: Text(
                      "$errorMessage",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ));
  }

  void initData() async {
    DataProvider dataProvider = DataProvider();

    var res = await dataProvider.getCommits();
    if (res != null) {
      commits = res;
    } else {
      errorMessage = dataProvider.errorMessage;
    }
    isLoading = false;
    setState(() {});
  }
}
