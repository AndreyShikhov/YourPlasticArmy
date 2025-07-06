import 'package:flutter/material.dart';

class MainButton extends FilledButton {
  //String  textButton = "";

  //MainButton.base(this.textButton) {
  // TODO: implement MainButton.base
  // throw UnimplementedError();
  //}


  MainButton({
    super.key,
    required super.onPressed, required super.child,
  });

@override
  // TODO: implement onPressed
  VoidCallback? get onPressed => openNewPage;

  void openNewPage()
  {
    print('click');
  }
}