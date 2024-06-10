import 'dart:ui';

import 'package:equatable/equatable.dart';

class ShadeState extends Equatable {
  final Color currentColor;
  final List<Color> customList;

  const ShadeState({
    this.currentColor = const Color(0xffff0000),
    this.customList = const [],
  });

  ShadeState copyWith({Color? color, List<Color>? list}) {
    return ShadeState(
      currentColor: color ?? currentColor,
      customList: list ?? customList,
    );
  }

  @override
  List<Object> get props => [currentColor, customList];
}
