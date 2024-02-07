import 'package:flutter/material.dart';
import 'package:fulltime_force/src/pages/commit_info.page.dart';
import 'package:fulltime_force/src/pages/home.page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() => {
      HomePage.id: (BuildContext context) => const HomePage(),
      CommitInfoPage.id: (BuildContext context) => CommitInfoPage()
    };
