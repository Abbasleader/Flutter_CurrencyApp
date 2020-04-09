import 'package:flutter/material.dart';

class ExchangePage extends StatelessWidget {
  static const routeName = "exchange-page";

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
          elevation: 5,
          title: const Text('مبدل ارز'),
          leading: const BackButton(color: Colors.amber)),
      body: Container(
        color: Colors.black87,
        child: Column(children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: deviceSize * 0.04,
              vertical: deviceSize * 0.01,
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
//                TextField(),
                  Text(
                    'من هستم یک textfield',
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: deviceSize * 0.08 / 1.5,
                    ),
                  ),
                  SizedBox(width: deviceSize * 0.3),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Colors.amber,
                    size: deviceSize * 0.08 / 1.5,
                  ),
                  Text(
                    'افغانی',
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: deviceSize * 0.08 / 1.5,
                    ),
                  ),
                ]),
          ),
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
