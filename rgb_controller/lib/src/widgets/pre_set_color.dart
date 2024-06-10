import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rgb_controller/src/bloc/shade/shade_bloc.dart';
import 'package:rgb_controller/src/bloc/shade/shade_event.dart';

class PreSetColor extends StatelessWidget {
  const PreSetColor({super.key, required this.list, required this.title});

  final List<Color> list;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          if (list.isEmpty)
            Container(
              width: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add_circle_outline,
                  size: 30,
                ),
              ),
            ),
          SizedBox(
            height: 60, // Adjust height as needed
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              // Change the itemCount to the number of shades you want to display
              itemBuilder: (context, index) {
                // Here you can define how each shade is displayed
                return InkWell(
                  borderRadius: BorderRadius.circular(200),
                  onTap: (){
                    context.read<ShadeBloc>().add(ChangeCurrentColor(list[index]));
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: list[index],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade700.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(-2,2),
                        ),
                      ],
                    ),
                    width: 40,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
