import 'dart:convert';
import 'dart:math';

import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({super.key});

  // Navigator.pushReplacementNamed(context, '/sign-in');

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  final List<types.TextMessage> _messages = [];
  final _user = const types.User(id: 'user');
  final _bot = const types.User(id: 'bot');

  @override
  void initState() {
    super.initState();
    OpenAI.apiKey = const String.fromEnvironment("OPENAI");
    initialMessage();
  }

  Future<void> initialMessage() async {
    var message = """
You will continually ask me questions about my preferences and styles for learning, You will ask one question, then I will give you my answer. Cater your questions until you know my personalized learning style, which can help me tailor my learning approach for better effectiveness. Keep going indefinitely.

Begin with your first question.
""";
    var response = await sendToGPT(message);
    _addMessage(types.TextMessage(
      author: _bot,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: randomString(), // TODO: Replace with UID
      text: response,
    ));
  }

  String randomString() {
    final random = Random.secure();
    final values = List<int>.generate(16, (i) => random.nextInt(255));
    return base64UrlEncode(values);
  }

  void _addMessage(types.TextMessage message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  Future<String> sendToGPT(String message) async {
    // create a queue of chat choices and add the last 15 messages in _messages into it. if there were less than 15 messages, add all of them.
    List<OpenAIChatCompletionChoiceMessageModel> previousMessages = [];
    for (int i = min(15, _messages.length - 1); i >= 0; i--) {
      previousMessages.add(OpenAIChatCompletionChoiceMessageModel(
        content: _messages[i].text,
        role: _messages[i].author.id == _user.id
            ? OpenAIChatMessageRole.user
            : OpenAIChatMessageRole.assistant,
      ));
    }

    OpenAIChatCompletionModel chatCompletion =
        await OpenAI.instance.chat.create(
      model: "gpt-3.5-turbo",
      messages: [
        const OpenAIChatCompletionChoiceMessageModel(
          content: """
You will be in charge of asking me questions indefinitely to understand my learning style.
""",
          //"You are a secretary robot that can help people schedule meetings. Your goal is to produce a list of times that work.", // TODO: Prompt engineer this!
          role: OpenAIChatMessageRole.system,
        ),
        ...previousMessages,
      ],
    );

    return chatCompletion.choices.first.message.content;
  }

  Future<void> _handleSendPressed(types.PartialText message) async {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: randomString(),
      text: message.text,
    );

    _addMessage(textMessage);
    var chatbotResponse = await sendToGPT(message.text); // THE LINE TO ADD

    _addMessage(types.TextMessage(
      author: _bot,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: randomString(), // TODO: Replace with UID
      text: chatbotResponse,
    ));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Chat(
          messages: _messages,
          onSendPressed: _handleSendPressed,
          user: _user,
        ),
      );
}
