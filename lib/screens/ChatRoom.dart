import 'package:flutter/material.dart';

class ChatRoom extends StatefulWidget {
  final String groupName;

  const ChatRoom({super.key, required this.groupName});

  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  final TextEditingController _messageController = TextEditingController();
  List<Map<String, String>> _messages = [];

  @override
  void initState() {
    super.initState();
    _initializeMessages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.groupName),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_messages[index]['message']!),
                  subtitle: Text(_messages[index]['sender']!),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      hintText: 'Type a message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    _sendMessage();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _initializeMessages() {
    setState(() {
      _messages = [
        {'message': 'Hello, how are you?', 'sender': 'Shashank Das'},
        {'message': 'I\'m doing well, thank you!', 'sender': 'Prof. A.R.Joshi'},
        {'message': 'What about the assignment?', 'sender': 'Merul Shah'},
        {'message': 'The assignment is due next week.', 'sender': 'Prof. A.R.Joshi'},
      ];
    });
  }

  void _sendMessage() {
    String message = _messageController.text.trim();
    if (message.isNotEmpty) {
      setState(() {
        _messages.add({'message': message, 'sender': 'Student'});
        _messageController.clear();
      });
    }
  }
}
