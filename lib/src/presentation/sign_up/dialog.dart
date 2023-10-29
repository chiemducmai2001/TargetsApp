import 'package:flutter/material.dart';

//

class DialogExample extends StatelessWidget {
  const DialogExample({super.key, this.msg});
  final String? msg;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Thông báo'),
      content: Text(msg ?? ''),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK'),
        ),
      ],
    );
  }
}
