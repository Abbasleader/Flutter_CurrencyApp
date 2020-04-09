import 'package:flutter/material.dart';

import '../screens/exchange_page.dart';

class DrawerCode extends StatelessWidget {
  listMember(String text, IconData icons) {
    return ListTile(
      leading: Icon(icons, color: Colors.amber),
      title: Text(
        text,
        style: const TextStyle(color: Colors.amber),
      ),
    );
  }

  sizedBoxPercentage(BuildContext context) {
    return MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: sizedBoxPercentage(context) * 0.37,
            width: sizedBoxPercentage(context) * 1,
            color: Colors.black,
            child: DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  const CircleAvatar(
                    radius: 35.0,
                    backgroundImage:
                        AssetImage('assets/images/icon.png'),
                  ),
                  SizedBox(height: sizedBoxPercentage(context) * 0.01),
                  const Text(
                    'Herat Developer',
                    style: TextStyle(color: Colors.amber),
                  ),
                  SizedBox(height: sizedBoxPercentage(context) * 0.009),
                  const Text(
                    'abbasjaffary33@gmail.com',
                    style: TextStyle(color: Colors.amber),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/striped_background.PNG"),
                  fit: BoxFit.cover,
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushNamed(ExchangePage.routeName);
                },
                child: Column(children: <Widget>[
                  listMember('ویرایش نمایش نرخ ها', Icons.settings),
                  listMember('پشتیبانی', Icons.send),
                  listMember('ارسال برنامه به دوستان', Icons.share),
                  listMember('سایر محصولات', Icons.android),
                  listMember('ارسال نظر', Icons.star),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
