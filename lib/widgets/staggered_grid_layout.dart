import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:portfolio/model/project_model.dart';
import 'package:portfolio/widgets/larger_container.dart';
import 'package:portfolio/widgets/smaller_container.dart';

class StaggeredGridLayout extends StatelessWidget {
  const StaggeredGridLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    int crossAxisCount;

    if (size.width < 767) {
      crossAxisCount = 1;
    } else if (size.width > 1390) {
      crossAxisCount = 3;
    } else {
      crossAxisCount = 2;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: StaggeredGrid.count(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 30,
          mainAxisSpacing: 30,
          children: gridItems(size.width)),
    );
  }

  List<Widget> gridItems(double width) {
    final List<Widget> gridItems = [];

    for (var i = 0; i < 9; i++) {
      if (width > 1390) {
        if (i == 2 || i == 4 || i == 6) {
          gridItems.add(
            LargerContainer(
              title: projectData[i].title,
              subtitle: projectData[i].subtitle,
              imgPath: projectData[i].imgPath,
              linkUrl: projectData[i].linkUrl,
            )
                .animate()
                .fadeIn(delay: (0.9 + (i * 0.2)).seconds, duration: .35.seconds)
                .moveY(),
          );
        } else {
          gridItems.add(
            SmallerContainer(
              title: projectData[i].title,
              subtitle: projectData[i].subtitle,
              imgPath: projectData[i].imgPath,
              linkUrl: projectData[i].linkUrl,
            )
                .animate()
                .fadeIn(delay: (0.9 + (i * 0.2)).seconds, duration: .35.seconds)
                .moveY(),
          );
        }
      } else {
        if (i == 2 || i == 4 || i == 5 || i == 6) {
          if (i == 5) {
            gridItems.add(
              LargerContainer(
                title: projectData[6].title,
                subtitle: projectData[6].subtitle,
                imgPath: projectData[6].imgPath,
                linkUrl: projectData[6].linkUrl,
              )
                  .animate()
                  .fadeIn(
                      delay: (0.9 + (i * 0.2)).seconds, duration: .35.seconds)
                  .moveY(),
            );
          } else if (i == 6) {
            gridItems.add(
              SmallerContainer(
                title: projectData[5].title,
                subtitle: projectData[5].subtitle,
                imgPath: projectData[5].imgPath, linkUrl: projectData[5].linkUrl,
              )
                  .animate()
                  .fadeIn(
                      delay: (0.9 + (i * 0.2)).seconds, duration: .35.seconds)
                  .moveY(),
            );
          } else {
            gridItems.add(
              LargerContainer(
                title: projectData[i].title,
                subtitle: projectData[i].subtitle,
                imgPath: projectData[i].imgPath, linkUrl: projectData[i].linkUrl,
              )
                  .animate()
                  .fadeIn(
                      delay: (0.9 + (i * 0.2)).seconds, duration: .35.seconds)
                  .moveY(),
            );
          }
        } else {
          gridItems.add(
            SmallerContainer(
              title: projectData[i].title,
              subtitle: projectData[i].subtitle,
              imgPath: projectData[i].imgPath,
              linkUrl: projectData[i].linkUrl
            )
                .animate()
                .fadeIn(delay: (0.9 + (i * 0.2)).seconds, duration: .35.seconds)
                .moveY(),
          );
        }
      }
    }

    return gridItems;
  }
}
