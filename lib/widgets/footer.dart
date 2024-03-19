
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/urls.dart';
import 'package:portfolio/provider/font_provider.dart';
import 'package:portfolio/provider/weather.dart';
import 'package:portfolio/widgets/footer_link.dart';

class Footer extends ConsumerStatefulWidget {
  const Footer({super.key});

  @override
  ConsumerState<Footer> createState() => _FooterState();
}

class _FooterState extends ConsumerState<Footer> {
  bool isResourceHover = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    AsyncValue<double> weather = ref.watch(weatherProvider);
    final currentFontGroup = ref.watch(fontProvider);
    final isMono = currentFontGroup['body'] == 'Monobook';
    
    final fontResources = isMono
        ? "PP Neue Montreal Mono for text."
        : "Acorn for headlines, Gt for body.";

    return Container(
      height: size.height - 58,
      width: double.infinity,
      padding: EdgeInsets.only(
        left: size.width * 0.2,
        top: 100,
        right: size.width * 0.2,
      ),
      child: Center(
        child: Column(
          children: [
            StaggeredGrid.count(
              crossAxisCount: size.width > 767 ? 2 : 1,
              crossAxisSpacing: 200,
              mainAxisSpacing: 50,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(30),
                      decoration: const BoxDecoration(
                        color: kNewBackgroundcolor,
                      ),
                      child: Text(
                        "🇦🇺 Working Remotely from ${weather.value ?? 21}°C Sydney, Australia.",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: size.width > 600
                                  ? 16
                                  : (size.width / 600) * 20 * 0.7,
                              fontFamily: currentFontGroup['body'],
                            ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Visibility(
                      visible: size.width > 767,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              "© 2024 Harkirat Singh • ",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontSize: size.width > 600
                                          ? 16
                                          : (size.width / 600) * 20 * 0.7,
                                      fontFamily: currentFontGroup['body']),
                              softWrap: true,
                            ),
                          ),
                          InkWell(
                            mouseCursor: SystemMouseCursors.click,
                            onTap: () => showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: Colors.transparent,
                                  content: Container(
                                    padding: const EdgeInsets.all(20),
                                    width: isMono? 450: 400,
                                    height: isMono? 330: 300,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: Colors.white38),
                                      color: Colors.black87,
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // First child: Column with 4 ListTiles
                                        Expanded(
                                          child: Column(
                                            children: [
                                              ListTile(
                                                contentPadding: EdgeInsets.zero,
                                                iconColor: kTextColor,
                                                leading: const Icon(
                                                    Icons.flutter_dash),
                                                title: Text(
                                                  'Flutter for UI',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge!
                                                      .copyWith(
                                                          fontSize: 14,
                                                          fontFamily:
                                                              currentFontGroup[
                                                                  'body']),
                                                ),
                                              ),
                                              
                                              ListTile(
                                                contentPadding: EdgeInsets.zero,
                                                iconColor: kTextColor,
                                                leading: const Icon(
                                                    FontAwesomeIcons.fire),
                                                title: Text(
                                                  "Firebase for hosting.",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge!
                                                      .copyWith(
                                                          fontSize: 14,
                                                          fontFamily:
                                                              currentFontGroup[
                                                                  'body']),
                                                ),
                                              ),
                                              ListTile(
                                                contentPadding: EdgeInsets.zero,
                                                iconColor: kTextColor,
                                                leading: const Icon(
                                                    FontAwesomeIcons.github),
                                                title: Text(
                                                  'Github for versions',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge!
                                                      .copyWith(
                                                          fontSize: 14,
                                                          fontFamily:
                                                              currentFontGroup[
                                                                  'body']),
                                                ),
                                              ),
                                              ListTile(
                                                contentPadding: EdgeInsets.zero,
                                                iconColor: kTextColor,
                                                leading: const Icon(
                                                    FontAwesomeIcons.youtube),
                                                title: Text(
                                                  'Last Train to Mars from YouTube Audio Library.',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge!
                                                      .copyWith(
                                                          fontSize: 14,
                                                          fontFamily:
                                                              currentFontGroup[
                                                                  'body']),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        // Second child: Text widget
                                        Visibility(
                                          visible: isMono,
                                          child: const SizedBox(width: 5,)),
                                        Expanded(
                                          child: Text(
                                            "$fontResources Design inspired from Seán Halpin's (seanhalpin.xyz).",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .copyWith(
                                                    fontSize: 16,
                                                    height: isMono? 1.25: 1.5,
                                                    fontFamily:
                                                        currentFontGroup[
                                                            'body']),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            child: MouseRegion(
                              onEnter: (event) {
                                setState(() {
                                  isResourceHover = true;
                                });
                              },
                              onExit: (event) {
                                setState(() {
                                  isResourceHover = false;
                                });
                              },
                              child: Text(
                                "Resources",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontSize: 16,
                                      decoration: TextDecoration.underline,
                                      fontFamily: currentFontGroup['body'],
                                      color: isResourceHover
                                          ? const Color.fromARGB(
                                              255, 179, 179, 179)
                                          : kTextColor,
                                    ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "External",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(
                              color: Colors.white60,
                              fontFamily: currentFontGroup['body']),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const FooterLink(
                      linkText: "Github",
                      url: "https://github.com/0xharkirat",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const FooterLink(
                      linkText: "LinkedIn",
                      url: "https://linkedin.com/in/0xharkirat",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const FooterLink(
                      linkText: "Instagram",
                      url: "https://instagram.com/0xharkirat",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const FooterLink(
                      linkText: "My Story",
                      url: aboutUrl,
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 48,
            ),
            Text("A 0xharkirat (Harkirat Singh) production.", style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontSize: 16, fontFamily: currentFontGroup['body']),)
            
            
          ],
        ),
      ),
    );
  }
}

//