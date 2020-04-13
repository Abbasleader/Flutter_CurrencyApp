import 'dart:ui';

import 'package:flutter/material.dart';

class ReorderListItemScreen extends StatefulWidget {
  static const routeName = "reorder-list-item";

  ReorderListItemScreen({Key key}) : super(key: key);

  @override
  _ReorderListItemScreenState createState() => _ReorderListItemScreenState();
}

class _ReorderListItemScreenState extends State<ReorderListItemScreen> {
  var data = [
    "دالر آمریکایی",
    "تومان",
    "ریال سعودی",
    "درهم امارات",
    "روپیه پاکستان",
    "روپیه هند",
    "یورو",
    "پوند انگلیس",
    "دالر آمریکایی",
    "تومان",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تنظیمات'),
        leading: const BackButton(color: Colors.amber),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.amber),
            onPressed: () {
              showAlertDialog("Hello", "Refresh Button");
            },
          ),
          IconButton(
            icon: const Icon(Icons.help_outline, color: Colors.amber),
            onPressed: () {
              showAlertDialog("Hello", "Help Button");
            },
          )
        ],
      ),
      body: Container(
        color: Colors.black,
        child: ReorderableListView(
          onReorder: (oldIndex, newIndex) {
            setState(() {
              _updateItems(oldIndex, newIndex);
            });
          },
          children: [
            for (final item in data)
              Card(
                key: ValueKey(item),
                color: Colors.grey,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.09,
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    value: true,
                    onChanged: (bool value) {
                      setState(() {
                        value = !value;
                      });
                    },
                    title: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '$item',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _updateItems(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }

    final item = data.removeAt(oldIndex);
    data.insert(newIndex, item);
  }

  showAlertDialog(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(
      context: context,
      builder: (_) => alertDialog,
      barrierDismissible: false,
    );
  }
}
