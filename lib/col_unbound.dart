import 'package:flutter/material.dart';

Widget col_unbound() {
  //* O Column não restringe a altura de seus filhos.
  return Column(
    children: [
      Container(
        color: Colors.red,
        height: 999,
      ),
    ],
  );
}
