import 'package:flutter/material.dart';

class AskDialog extends StatelessWidget {
  final String? title;
  final String? content;

  const AskDialog({Key? key, required this.title, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title!),
      content: Text(content!),
      actions: [
        TextButton(
          child: Text('Não'),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
        TextButton(
          child: Text('Sim'),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
      ],
    );
  }
}
