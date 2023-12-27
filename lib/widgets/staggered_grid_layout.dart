import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:portfolio/model/project_model.dart';
import 'package:portfolio/widgets/larger_container.dart';
import 'package:portfolio/widgets/smaller_container.dart';

class StaggeredGridLayout extends StatelessWidget {
  const StaggeredGridLayout({super.key});
  

  @override
  Widget build(BuildContext context) {

    int index = 0;
    for (var i = 0; i < 9; i++) {
      if (i == 2 || i == 4 || i == 6) {
        print("for: $i");
      } else {
        print("index: $index");
        index++;
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: StaggeredGrid.count(
        crossAxisCount: 3,
        crossAxisSpacing: 25,
        mainAxisSpacing: 25,
        children: [
          SmallerContainer(
            title: projectData[0].title,
            subtitle: projectData[0].subtitle,
            imgPath: projectData[0].imgPath,
          ),
          SmallerContainer(
            title: projectData[1].title,
            subtitle: projectData[1].subtitle,
            imgPath: projectData[1].imgPath,
          ),
          LargerContainer(number: 3),
          SmallerContainer(
            title: projectData[2].title,
            subtitle: projectData[2].subtitle,
            imgPath: projectData[2].imgPath,
          ),
          LargerContainer(number: 5),
          SmallerContainer(
            title: projectData[3].title,
            subtitle: projectData[3].subtitle,
            imgPath: projectData[3].imgPath,
          ),
          LargerContainer(number: 7),
          SmallerContainer(
            title: projectData[4].title,
            subtitle: projectData[4].subtitle,
            imgPath: projectData[4].imgPath,
          ),
          SmallerContainer(
            title: projectData[5].title,
            subtitle: projectData[5].subtitle,
            imgPath: projectData[5].imgPath,
          ),
        ],
      ),
    );
  }
}


// for (var i = 0; i < 9; i++) {
//       if (i == 2 || i == 4 || i == 6) {
//         gridItems.add(LargerContainer(number: i));
//       } else {
//         gridItems.add(SmallerContainer(
//           title: projectData[projectDataIndex].title,
//           subtitle: projectData[projectDataIndex].subtitle,
//           imgPath: projectData[projectDataIndex].imgPath,
//         ));
//         projectDataIndex++;
//       }
//     }