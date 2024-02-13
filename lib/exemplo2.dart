import 'package:flutter/material.dart';

Widget exemplo2() {
  //* A organização e tamanho dos widgets segue o seguinte princípio: *O pai impõe restrições de tamanho. O filho escolhe um tamanho. O pai define a posição do filho.* Além disso, **o widget raiz sempre ocupa a tela toda**.
  //*
  //* No exemplo, `Center` é o widget raiz, e ocupa a tela toda. Ele diz ao seu filho (o `Text`) que ele pode escolher qualquer tamanho que não ultrapasse o tamanho do próprio `Center`. O `Text` responde que quer o tamanho 74x16, suficiente para exibir o texto. Com base nesse tamanho, o `Center` define a posição exata onde o `Text` deve ficar para que ele fique centralizado.
  return Center(
    child: Text('Alo, Mundo!'),
  );
}
