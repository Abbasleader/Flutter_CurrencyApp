import 'package:flutter/material.dart';

class ExchangePage extends StatelessWidget {
  static const routeName = "exchange-page";

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: const Text('مبدل ارز'),
        leading: const BackButton(color: Colors.amber),
      ),
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
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(2),
                      padding: EdgeInsets.only(right: 5),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                        color: Colors.white,
                      ),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: deviceSize * 0.03),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'مقدار ارز خودرا وارد کنید',
                            hintStyle: TextStyle()),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showAlertDialog(context, 'Hello ', 'Currency');
                    },
                    child: Row(children: <Widget>[
                      Icon(
                        Icons.arrow_drop_down,
                        size: deviceSize * 0.04,
                        color: Colors.amber,
                      ),
                      Text(
                        'افغانی',
                        textScaleFactor: 1.7,
                        style: TextStyle(
                          color: Colors.amber,
                        ),
                      ),
                    ]),
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

  showAlertDialog(BuildContext context, String title, String message) {
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
