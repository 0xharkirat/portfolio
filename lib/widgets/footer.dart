import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/constants/fonts.dart';
import 'package:portfolio/constants/urls.dart';
import 'package:portfolio/provider/contact_provider.dart';
import 'package:portfolio/provider/weather.dart';
import 'package:portfolio/widgets/footer_link.dart';
import 'package:http/http.dart' as http;

class Footer extends ConsumerWidget {
  const Footer({super.key});

 

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    AsyncValue<double> weather = ref.watch(weatherProvider);

    return Container(
      height: size.width > 780 ? 380 : 550,
      width: double.infinity,
      padding: EdgeInsets.only(
        left: size.width * 0.2,
        top: 100,
        right: size.width * 0.2,
      ),
      child: Column(
        children: [
          StaggeredGrid.count(
            crossAxisCount: size.width > 767 ? 2 : 1,
            crossAxisSpacing: 100,
            mainAxisSpacing: 50,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.black45,
                    ),
                    child: Text(
                      "🇦🇺 Working Remotely from ${weather.value ?? 21}°C Sydney, Australia.",
                      style: bodyTextStyle.copyWith(
                          fontSize: size.width > 600
                              ? 16
                              : (size.width / 600) * 20 * 0.7),
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
                            "© 2023 Harkirat Singh • ",
                            style: bodyTextStyle.copyWith(
                                fontSize: size.width > 600
                                    ? 16
                                    : (size.width / 600) * 20 * 0.7),
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
                                  width: 350,
                                  height: 250,
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
                                              iconColor: Colors.white,
                                              leading: const Icon(
                                                  Icons.flutter_dash),
                                              title: Text(
                                                'Flutter for UI',
                                                style: bodyTextStyle.copyWith(
                                                    fontSize: 14),
                                              ),
                                            ),
                                            ListTile(
                                              contentPadding: EdgeInsets.zero,
                                              iconColor: Colors.white,
                                              leading: const Icon(
                                                  FontAwesomeIcons.js),
                                              title: Text(
                                                "Three.js for background animation.",
                                                style: bodyTextStyle.copyWith(
                                                    fontSize: 14),
                                              ),
                                            ),
                                            ListTile(
                                              contentPadding: EdgeInsets.zero,
                                              iconColor: Colors.white,
                                              leading: const Icon(
                                                  FontAwesomeIcons.fire),
                                              title: Text(
                                                "Firebase for hosting.",
                                                style: bodyTextStyle.copyWith(
                                                    fontSize: 14),
                                              ),
                                            ),
                                            ListTile(
                                              contentPadding: EdgeInsets.zero,
                                              iconColor: Colors.white,
                                              leading: const Icon(
                                                  FontAwesomeIcons.github),
                                              title: Text(
                                                'Github for versions',
                                                style: bodyTextStyle.copyWith(
                                                    fontSize: 14),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      // Second child: Text widget
                                      Expanded(
                                        child: Text(
                                          "Acorn for headlines, Gt for body. Design inspired from Seán Halpin's (seanhalpin.xyz) & Keita Yamada's  (p5aholic.me) portfolio websites.",
                                          style: bodyTextStyle.copyWith(
                                              fontSize: 16, height: 1.5),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          child: Text(
                            "Resources",
                            style: bodyTextStyle.copyWith(fontSize: 16),
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "External",
                            style:
                                bodyTextStyle.copyWith(color: Colors.white60),
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
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Contact",
                            style: bodyTextStyle.copyWith(
                              color: Colors.white60,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Consumer(
                            builder: (BuildContext context, WidgetRef ref,
                                Widget? child) {
                              return InkWell(
                                mouseCursor: SystemMouseCursors.click,
                                onTap: () {
                                  ref
                                      .read(contactProvider.notifier)
                                      .toggleContact(context);
                                },
                                child: Text(
                                  "Message",
                                  style: bodyTextStyle,
                                ),
                              );
                            },
                          )
                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 48,
          ),
          Text(
            "A 0xharkirat (Harkirat Singh) production.",
            style: bodyTextStyle.copyWith(fontSize: 16),
          )
        ],
      ),
    );
  }
}

//