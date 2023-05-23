// import 'package:dart_openai/openai.dart';
// import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

// Future<void> _handleSendPressed(types.PartialText message) async {
//   final textMessage = types.TextMessage(
//     author: _user,
//     createdAt: DateTime.now().millisecondsSinceEpoch,
//     id: randomString(),
//     text: message.text,
//   );

//   _addMessage(textMessage);
//   var chatbotResponse = await sendToGPT(message.text); // THE LINE TO ADD

//   _addMessage(types.TextMessage(
//     author: _bot,
//     createdAt: DateTime.now().millisecondsSinceEpoch,
//     id: randomString(), // TODO: Replace with UID
//     text: chatbotResponse,
//   ));
// }

// Future<String> sendToGPT(String message) async {
//   // create a queue of chat choices and add the last 15 messages in _messages into it. if there were less than 15 messages, add all of them.
//   List<OpenAIChatCompletionChoiceMessageModel> previousMessages = [];
//   for (int i = min(15, _messages.length - 1); i >= 0; i--) {
//     previousMessages.add(OpenAIChatCompletionChoiceMessageModel(
//       content: _messages[i].text,
//       role: _messages[i].author.id == _user.id
//           ? OpenAIChatMessageRole.user
//           : OpenAIChatMessageRole.assistant,
//     ));
//   }

//   OpenAIChatCompletionModel chatCompletion = await OpenAI.instance.chat.create(
//     model: "gpt-3.5-turbo",
//     messages: [
//       const OpenAIChatCompletionChoiceMessageModel(
//         content:
//             "You are an AI Programming Assistant. Follow the user's requirements carefully & to the letter. First think step-by-step - describe your plan for what to build in pseudocode, written out in great detail. Then, write the code to implement your plan.",
//         //"You are a secretary robot that can help people schedule meetings. Your goal is to produce a list of times that work.", // TODO: Prompt engineer this!
//         role: OpenAIChatMessageRole.system,
//       ),
//       ...previousMessages,
//     ],
//   );

//   return chatCompletion.choices.first.message.content;
// }
