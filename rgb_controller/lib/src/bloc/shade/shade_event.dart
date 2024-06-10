import 'dart:ui';

import 'package:equatable/equatable.dart';

abstract class ShadeEvent extends Equatable {
  const ShadeEvent();

  @override
  List<Object> get props => [];
}

class AddCustomColor extends ShadeEvent {
  final Color color;

  const AddCustomColor(this.color);
}

class ChangeCurrentColor extends ShadeEvent {
  final Color color;

  const ChangeCurrentColor(this.color);
}
