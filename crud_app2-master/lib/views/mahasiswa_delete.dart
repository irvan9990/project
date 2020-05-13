import 'package:flutter/material.dart';

class MahasiswaDelete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Warning'),
      content: Text('Anda yakin ingin mengapus data ini?'),
      actions: <Widget>[
        FlatButton(
          child: Text('ya'),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
        FlatButton(
          child: Text('Tidak'),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
      ],
    );
  }
}
