import 'package:flutter/material.dart';
import 'package:fulltime_force/src/models/commits.model.dart';
import 'package:fulltime_force/src/pages/commit_info.page.dart';

class CommitsListWidget extends StatelessWidget {
  List<Commits> commitsList;
  Future<void> Function() onRefresh;

  CommitsListWidget(
      {super.key, required this.commitsList, required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      child: RefreshIndicator(
        onRefresh: onRefresh,
        child: ListView.separated(
            itemBuilder: (context, index) => GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed(
                      CommitInfoPage.id,
                      arguments: commitsList[index]),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4)),
                    padding: const EdgeInsets.all(10),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${commitsList[index].commit?.message}"),
                            Text("${commitsList[index].commit?.author?.name}"),
                          ],
                        ),
                        const Positioned(
                            right: 0,
                            bottom: 0,
                            top: 0,
                            child: Icon(Icons.keyboard_arrow_right))
                      ],
                    ),
                  ),
                ),
            separatorBuilder: (context, index) => const SizedBox(
                  height: 4,
                ),
            itemCount: commitsList.length),
      ),
    );
  }
}
