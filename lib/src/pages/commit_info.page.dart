import 'package:flutter/material.dart';
import 'package:fulltime_force/src/models/commits.model.dart';
import 'package:fulltime_force/src/widgets/commit_form.widget.dart';

class CommitInfoPage extends StatelessWidget {
  static String id = "commitInfoPage";

  Commits? commits;

  CommitInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    initArgs(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(commits?.commit?.message ?? " "),
        ),
        body: CommitFormWidget(commits: commits));
  }

  void initArgs(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Commits;
    commits = args;
  }
}
