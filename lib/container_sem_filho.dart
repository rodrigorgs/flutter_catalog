import 'package:flutter/material.dart';

Widget container_sem_filho() {
  //* Um **container sem filho** sempre escolhe ocupar o **maior espaço possível** (dentro das restrições do pai).
  //*
  //* - O `Center` ocupa toda a tela, pois é o widget raiz.
  //* - O `Center` diz ao `Container` que ele pode escolher qualquer tamanho que não ultrapasse o tamanho da tela.
  //* - O `Container` escolhe ter o tamanho da tela.
  //*
  //* > Atenção: cada widget tem sua própria lógica para escolher o tamanho, que é explicada em sua documentação; portanto, leia a documentação do widget antes de usá-lo.
  return Center(
    child: Container(
      color: Colors.blue,
    ),
  );
}
