import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:portfolio/model/project_model.dart';
import 'package:portfolio/widgets/larger_container.dart';
import 'package:portfolio/widgets/smaller_container.dart';

class StaggeredGridLayout extends StatelessWidget {
  const StaggeredGridLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: StaggeredGrid.count(
        crossAxisCount: 3,
        crossAxisSpacing: 25,
        mainAxisSpacing: 25,
        children: gridItems
          
      ),
    );
  }

  List<Widget> get gridItems {
    final List<Widget> gridItems = [];

    for (var i = 0; i < 9; i++) {
      if (i == 2 || i == 4 || i == 6) {
        gridItems.add(
          LargerContainer(
              title: projectData[i].title,
              subtitle: projectData[i].subtitle,
              imgPath: projectData[i].imgPath),
        );
      } else {
        gridItems.add(
          SmallerContainer(
              title: projectData[i].title,
              subtitle: projectData[i].subtitle,
              imgPath: projectData[i].imgPath),
        );
      }
    }

    return gridItems;
  }
}