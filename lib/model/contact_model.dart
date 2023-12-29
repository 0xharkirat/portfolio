final List<String> initialMessages = [
  "Hi!",
  "I'm Hark Bot. I'm here to help you with any questions you might have about Hark.",
  "How can I help you today?",
];

class MessageResponse {
  final String message;
  final List<String> responses;

  MessageResponse({required this.message, required this.responses});
}

class MessageResponseWithAction extends MessageResponse {
  MessageResponseWithAction(
      {required super.message,
      required super.responses,
      required this.actions});

  final List<String> actions;
}

class ChatMessage {
  final String text;
  final bool isBot;

  ChatMessage({required this.text, required this.isBot});
}

final Map<int,dynamic> options = {
  1: MessageResponse(
    message: "Just Saying Hello!",
    responses: [
      "Hello! 👋",
      "Thanks for saying hi 😁",
      "I hope you've enjoyed browsing my work",
      "Can I help you with anything else?",
    ],
  ),
  2: MessageResponseWithAction(
    message: "We'd like to collaborate with you",
    responses: [
      "Ok, great!",
      "Exciting times 🕺",
      "Send me a message and lets chat further!",
    ],
    actions: [
      "Send a message",
      "Other options?",
    ],
  ),
  3: MessageResponse(
    message: "Current Tech Stack",
    responses: [
      "Curious! 🕵️",
      "Current: Flutter/Dart, Firebase, Node.Js, Python",
      "Also worked with Java, SQL, HTML, CSS, JavaScript, React.js, Next.js, Solidity, MongoDB & Blockchain",
      "Can I help you with anything else?",
    ],
  ),
  4: MessageResponseWithAction(message: "Why Flutter for Web?", responses: [
    "Good question! 👍",
    "Now we're talking 😉",
    "Short Answer: It is fun & easy",
    "Detailed Expanation 👇",
  ], actions: [
    "flutter.dev/multi-platform/web",
    "My post",
    "Other options?"
  ])
};