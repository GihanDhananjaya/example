import 'package:flutter/material.dart';

class Context extends StatelessWidget {
  const Context({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  PopupMenuButton(
        offset: Offset(1, 300),
        child: Center(child: Text("Menu")),
        itemBuilder: (context) => [
          PopupMenuItem(
            child: Text("Option 1"),
            value: 1,
          ),
          PopupMenuItem(
            child: Text("Option 2"),
            value: 2,
          ),
        ],
        onSelected: (value) {
          if (value == 1) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Dialog title"),
                  content: Text("Dialog content"),
                  actions: [
                    TextButton(
                      child: Text("Close"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          } else {
            print("Selected value: $value");
          }
        },
      ),
    );
  }
}
