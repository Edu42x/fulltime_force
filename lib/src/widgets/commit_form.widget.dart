import 'package:flutter/material.dart';
import 'package:fulltime_force/src/models/commits.model.dart';
import 'package:intl/intl.dart';

class CommitFormWidget extends StatelessWidget {
  const CommitFormWidget({
    super.key,
    required this.commits,
  });

  final Commits? commits;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 64,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(64),
              child: commits?.author?.avatarUrl != null
                  ? Image.network(
                      "${commits?.author?.avatarUrl}",
                    )
                  : Image.asset("assets/user_image.png"),
            ),
          ),
          getTextfield("${commits?.commit?.author?.name}", "Nombre"),
          getTextfield("${commits?.commit?.author?.email}", "Email"),
          getTextfield(
              DateFormat.yMMMd()
                  .format(DateTime.parse("${commits?.commit?.author?.date}")),
              "Fecha"),
        ],
      ),
    );
  }

  Widget getTextfield(String value, String label) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: TextFormField(
          readOnly: true,
          initialValue: value,
          decoration: InputDecoration(
              labelText: label,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6)))),
        ),
      );
}
