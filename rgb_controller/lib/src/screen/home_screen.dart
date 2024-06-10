import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rgb_controller/src/bloc/shade/shade_bloc.dart';
import 'package:rgb_controller/src/bloc/shade/shade_event.dart';
import 'package:rgb_controller/src/bloc/shade/shade_state.dart';
import 'package:rgb_controller/src/constant/shades.dart';
import 'package:rgb_controller/src/widgets/HueRingPicker.dart';
import 'package:rgb_controller/src/widgets/pre_set_color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color pickerColor = const Color(0xffff0000);
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ListView(children: [
            BlocBuilder<ShadeBloc, ShadeState>(
              builder: (context, state) {
                String color = state.currentColor.toString();
                return Text(
                  color,
                  style: TextStyle(
                      color: state.currentColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            HueRingPicker(
              pickerColor: pickerColor,
              onColorChanged: (color) {
                pickerColor = color;
                context.read<ShadeBloc>().add(ChangeCurrentColor(color));
              },
              enableAlpha: false,
              displayThumbColor: true,
              // colorPickerHeight: 150,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                      WidgetStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () {
                      context.read<ShadeBloc>().add(AddCustomColor(pickerColor));
                    },
                    child: const Text(
                      "Add",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            PreSetColor(
              list: Shades.redShades,
              title: "Red Shades",
            ),
            PreSetColor(
              list: Shades.greenShades,
              title: "Green Shades",
            ),
            PreSetColor(
              list: Shades.blueShades,
              title: "Blue Shades",
            ),
            BlocBuilder<ShadeBloc, ShadeState>(
              builder: (context, state) {
                return PreSetColor(
                  list: state.customList,
                  title: "Custom Shades",
                );
              },
            ),
          ]),
        ),
      ),
    );
  }
}
