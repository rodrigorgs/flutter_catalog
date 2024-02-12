import 'package:flutter/material.dart';

Widget center_folgado() {
  //* A tela obriga o Center a ocupar todo o espaço da tela.
  //* O Center flexibiliza essa restrição, permitindo que o widget filho (Container) escolha seu próprio tamanho, desde que não ultrapasse o tamanho do Center.
  //* O Container escolhe um tamanho de 100x100.
  //* O Center posiciona o Container no centro de seu espaço.
  return Center(
    child: Container(
      color: Colors.red,
      width: 100,
      height: 100,
    ),
  );
}
