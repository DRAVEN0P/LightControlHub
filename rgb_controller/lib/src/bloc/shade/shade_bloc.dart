import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:rgb_controller/src/apis/api.dart';
import 'package:rgb_controller/src/bloc/shade/shade_event.dart';
import 'package:rgb_controller/src/bloc/shade/shade_state.dart';

class ShadeBloc extends Bloc<ShadeEvent,ShadeState>{
  ShadeBloc():super(const ShadeState()){
    on<ChangeCurrentColor>(_changeColor);
    on<AddCustomColor>(_addColor);
  }

  _changeColor(ChangeCurrentColor event, Emitter<ShadeState> emit){
    final Color color = event.color;
    Api.sendRGB(color);
    emit(state.copyWith(color: color));
  }

  _addColor(AddCustomColor event, Emitter<ShadeState> emit){
    List<Color> list = [];
    list = state.customList.toList();
    list.add(event.color);
    emit(state.copyWith(list: list));
  }
}