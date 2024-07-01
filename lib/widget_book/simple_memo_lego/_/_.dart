import 'package:flutter/material.dart';

import '../../../../../../../../../../../main.dart';

class NewView extends StatefulWidget {
  const NewView({super.key});

  @override
  State<NewView> createState() => _NewViewState();
}

class _NewViewState extends State<NewView> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(_onTextChanged);
    _controller.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    // 여기에 텍스트가 변경될 때마다 호출될 로직을 추가합니다.
    print('Text field updated: ${_controller.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade700,
      appBar: AppBar(
        title: Text(
          "Simple Memo",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        backgroundColor: Colors.yellow.shade700,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              _controller.clear();
            },
          ),
          Gap(10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: TextField(
          controller: _controller,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          expands: true,
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.top,
          decoration: InputDecoration(
            hintText: 'Enter any text here...',
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}

main() async {
  return buildApp(home: NewView());
}
