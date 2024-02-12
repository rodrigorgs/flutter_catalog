import 'package:flutter/material.dart';

Widget widget_raiz() {
  //* A organização e tamanho dos widgets segue o seguinte princípio: *Descem restrições. Sobem tamanhos. O pai define a posição.*
  //*
  //* - Cada widget diz aos seus filhos que tamanhos eles podem ter (restrições), em termos de largura mínima e máxima, altura mínima e máxima.
  //* - O filho escolhe um tamanho de acordo com as restrições e comunica a seu pai.
  //* - Conforme o tamanho escolhido, o pai define a posição do filho.
  //*
  //* No exemplo, a tela impõe restrições rígidas ao widget raiz (no exemplo, o `Container`): ele deve necessariamente ocupar todo o espaço disponível.
  //* Isso significa que o widget raiz vai ocupar todo o espaço da tela, mesmo que o widget escolha um tamanho diferente.
  return Container(
    color: Colors.red,
    width: 100,
    height: 100,
  );
}
