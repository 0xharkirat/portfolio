import 'package:flutter/material.dart';
import 'package:portfolio/constants/fonts.dart';
import 'package:portfolio/constants/urls.dart';
import 'package:portfolio/model/contact_model.dart';
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

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < initialMessages.length; i++) {
      chatHistory.add(ChatMessage(text: initialMessages[i], isBot: true));
    }
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
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...chatHistory.map((message) => Container(
                          color: Colors.transparent,
                          alignment: message.isBot? Alignment.centerLeft:Alignment.centerRight ,
                          child: ChatBubble(
                                message: message.text,
                                isBot: message.isBot,
                              ),
                        )),
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
                                    chatHistory.add(ChatMessage(
                                        text: options[i + 1].responses[j],
                                        isBot: true));
                                  }
                                });
                              },
                            ),
                        ],
                        // Display chat bubbles based on selected option
                        if (option == 2) ...[
                          OptionButton(
                            text: options[2].actions[0],
                            onPressed: () {
                              js.context.callMethod(
                                  'open', ['mailto:0xharkirat@gmail.com']);
                            },
                          ),
                          OptionButton(
                            text: options[2].actions[1],
                            onPressed: () {
                              setState(() {
                                option = 0;
                              });
                            },
                          )
                          // Add more chat bubbles for Option 1 if needed
                        ],

                        if (option == 4) ...[
                          OptionButton(
                            text: options[4].actions[0],
                            onPressed: () {
                              js.context.callMethod('open',
                                  ['https://flutter.dev/multi-platform/web']);
                            },
                          ),
                          OptionButton(
                            text: options[4].actions[1],
                            onPressed: () {
                              js.context.callMethod('open', [aboutUrl]);
                            },
                          ),
                          OptionButton(
                            text: options[4].actions[2],
                            onPressed: () {
                              setState(() {
                                option = 0;
                              });
                            },
                          )
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
                                    chatHistory.add(ChatMessage(
                                        text: options[i + 1].responses[j],
                                        isBot: true));
                                  }
                                });
                              },
                            ),
                        ]
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isBot;

  const ChatBubble({Key? key, required this.message, required this.isBot})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
     
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isBot ? Colors.white38: Colors.white60,
      ),
      child: Text(
        message,
        
        style: bodyTextStyle.copyWith(
          fontSize: 16,
          
        ),
      ),
    );
  }
}

class OptionButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const OptionButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white
        )
      ),
      
     
      child: InkWell(
        
        onTap: onPressed,
        child: Text(text, style: bodyTextStyle.copyWith(
          fontSize: 16,
        ),),
      ),
    );
  }
}
