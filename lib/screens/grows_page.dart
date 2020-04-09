import 'package:flutter/material.dart';

class GrowsPage extends StatelessWidget {
  static const routeName = "grows-page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: const Text('نمودار ارز'),
        leading: const BackButton(color: Colors.amber),
      ),
      body: Container(
        color: Colors.black87,
        child: Column(children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.sync, color: Colors.amber),
                ),
                Text(
                  'نرخ دلار آمریکا در چند روز اخیر',
                  style: TextStyle(
                      color: Colors.amber,
                      fontSize: MediaQuery.of(context).size.width * 0.05),
                ),
                const CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/images/icon.png'),
                ),
              ]),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/striped_background.PNG'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
