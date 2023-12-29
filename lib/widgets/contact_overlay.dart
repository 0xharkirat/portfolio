import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/constants/fonts.dart';
import 'package:portfolio/constants/urls.dart';
import 'package:portfolio/model/contact_model.dart';
import 'package:portfolio/widgets/chat_bubble.dart';
import 'package:portfolio/widgets/option_button.dart';
import 'package:transparent_image/transparent_image.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

class ContactOverlay extends StatefulWidget {
  const ContactOverlay({Key? key, required this.onClose}) : super(key: key);
  final VoidCallback onClose;

  @override
  ContactOverlayState createState() => ContactOverlayState();
}

class ContactOverlayState extends State<ContactOverlay> {
  int option = 0;

  List<ChatMessage> chatHistory = [];
  List<ChatBubble> animationPending = [];

  bool firstAnimation = false;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    for (int i = 0; i < initialMessages.length; i++) {
      chatHistory.add(ChatMessage(
        text: initialMessages[i],
        isBot: true,
      ));
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return Positioned(
      bottom: 40,
      right: 40,
      child: Material(
        clipBehavior: Clip.antiAlias,
        color: Colors.transparent,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        child: Container(
          height: 600,
          width: 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.white70,
            ),
          ),
          child: Column(
            children: [
              ListTile(
                tileColor: Colors.white70,
                contentPadding: const EdgeInsets.all(10),
                leading: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(width: 2, color: Colors.black),
                  ),
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: "assets/images/hark-logo.png",
                  ),
                ),
                title: Text(
                  "Hark Bot",
                  style: subTitleStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontSize: 16,
                  ),
                ),
                subtitle: Text(
                  "Ask me a question",
                  style: subTitleStyle.copyWith(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: Colors.black,
                    size: 24,
                  ),
                  onPressed: widget.onClose,
                ),
              ),
              Expanded(
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    color: Colors.black87,
                    backgroundBlendMode: BlendMode.darken,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: RawScrollbar(
                    thumbColor: Colors.white54,
                    radius: const Radius.circular(20),
                    thickness: 5,
                    child: Scrollable(viewportBuilder:
                        (BuildContext context, ViewportOffset position) {
                      return SingleChildScrollView(
                        controller: _scrollController,
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            ...chatHistory.map((message) => Container(
                                  color: Colors.transparent,
                                  alignment: message.isBot
                                      ? Alignment.centerLeft
                                      : Alignment.centerRight,
                                  child: ChatBubble(
                                    message: message.text,
                                    isBot: message.isBot,
                                  ),
                                )),
                            for (int i = 0; i < animationPending.length; i++)
                              Container(
                                color: Colors.transparent,
                                alignment: animationPending[i].isBot
                                    ? Alignment.centerLeft
                                    : Alignment.centerRight,
                                child: animationPending[i]
                                    .animate(
                                      autoPlay: true,
                                      onComplete: (controller) {
                                        scrollEveryAnimate();
                                      },
                                    )
                                    .fadeIn(
                                        delay: (0.2 + (i * 1)).seconds,
                                        duration: .10.seconds)
                                    .moveY(begin: 5),
                              ),
                            if (option == 0) ...[
                              for (int i = 0; i < options.length; i++)
                                OptionButton(
                                  text: options[i + 1].message,
                                  onPressed: () {
                                    setState(() {
                                      option = i + 1;
                                      chatHistory.add(
                                        ChatMessage(
                                            text: options[i + 1].message,
                                            isBot: false),
                                      );
                                      for (int j = 0;
                                          j < options[i + 1].responses.length;
                                          j++) {
                                        animationPending.add(ChatBubble(
                                            message:
                                                options[i + 1].responses[j],
                                            isBot: true));
                                      }
                                    });
                                    transferAnimatedToHistoryDelayed();
                                  },
                                )
                            ],
                            // Display chat bubbles based on selected option
                            if (option == 2) ...[
                              OptionButton(
                                text: options[2].actions[0],
                                onPressed: () {
                                  js.context.callMethod(
                                      'open', ['mailto:0xharkirat@gmail.com']);
                                },
                              )
                                  .animate(autoPlay: true)
                                  .fadeIn(delay: 4.seconds),
                              OptionButton(
                                text: options[2].actions[1],
                                onPressed: () {
                                  setState(() {
                                    option = 0;
                                    scrollToBottom();
                                  });
                                },
                              )
                                  .animate(autoPlay: true)
                                  .fadeIn(delay: 4.seconds),
                              // Add more chat bubbles for Option 1 if needed
                            ],

                            if (option == 4) ...[
                              OptionButton(
                                text: options[4].actions[0],
                                onPressed: () {
                                  js.context.callMethod('open', [
                                    'https://flutter.dev/multi-platform/web'
                                  ]);
                                },
                              )
                                  .animate(autoPlay: true)
                                  .fadeIn(delay: 4.seconds),
                              OptionButton(
                                text: options[4].actions[1],
                                onPressed: () {
                                  js.context.callMethod('open', [aboutUrl]);
                                },
                              )
                                  .animate(autoPlay: true)
                                  .fadeIn(delay: 4.seconds),
                              OptionButton(
                                text: options[4].actions[2],
                                onPressed: () {
                                  setState(() {
                                    option = 0;
                                  });
                                  scrollToBottom();
                                },
                              )
                                  .animate(autoPlay: true)
                                  .fadeIn(delay: 4.seconds),
                            ],
                            if (option != 2 && option != 0 && option != 4) ...[
                              for (int i = 0; i < options.length; i++)
                                OptionButton(
                                  text: options[i + 1].message,
                                  onPressed: () {
                                    setState(() {
                                      option = i + 1;
                                      chatHistory.add(
                                        ChatMessage(
                                            text: options[i + 1].message,
                                            isBot: false),
                                      );
                                      for (int j = 0;
                                          j < options[i + 1].responses.length;
                                          j++) {
                                        animationPending.add(ChatBubble(
                                            message:
                                                options[i + 1].responses[j],
                                            isBot: true));
                                      }
                                    });
                                    transferAnimatedToHistoryDelayed();
                                  },
                                )
                                    .animate(autoPlay: true)
                                    .fadeIn(delay: 4.seconds),
                            ]
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void transferAnimatedToHistory() {
    for (int i = 0; i < animationPending.length; i++) {
      chatHistory.add(ChatMessage(
          text: animationPending[i].message, isBot: animationPending[i].isBot));
    }
    animationPending.clear();
  }

  void transferAnimatedToHistoryDelayed() {
    Future.delayed(const Duration(milliseconds: 4600), () {
      scrollToBottom();
      transferAnimatedToHistory();
    });
  }

  void scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void scrollEveryAnimate() {
    double currentPosition = _scrollController.position.pixels;
    _scrollController.animateTo(
      currentPosition + 20.0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
