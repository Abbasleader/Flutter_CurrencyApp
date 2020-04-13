import 'package:flutter/material.dart';

//class GrowsPage extends StatelessWidget {
//  static const routeName = "grows-page";
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        elevation: 5,
//        title: const Text('نمودار ارز'),
//        leading: const BackButton(color: Colors.amber),
//      ),
//      body: Container(
//        color: Colors.black87,
//        child: Column(children: <Widget>[
//          Row(
//              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//              children: <Widget>[
//                IconButton(
//                  onPressed: () {},
//                  icon: const Icon(Icons.sync, color: Colors.amber),
//                ),
//                Text(
//                  'نرخ دلار آمریکا در چند روز اخیر',
//                  textScaleFactor: 1.3,
//                  style: TextStyle(color: Colors.amber),
//                ),
//                const CircleAvatar(
//                  backgroundImage: AssetImage('assets/images/icon.png'),
//                ),
//              ]),
//          Expanded(
//            child: Container(
//              decoration: const BoxDecoration(
//                image: DecorationImage(
//                  image: AssetImage('assets/images/striped_background.PNG'),
//                  fit: BoxFit.cover,
//                ),
//              ),
//            ),
//          ),
//        ]),
//      ),
//    );
//  }
//}
class GrowsPage extends StatefulWidget {
  static const routeName = "grows-page";

  @override
  State<StatefulWidget> createState() => new GrowsPageState();
}

class GrowsPageState extends State<GrowsPage> {
  List<String> items = ["Apple", "Bananas", "Milk", "Water"];
  TextEditingController controller = new TextEditingController();
  String filter;

  @override
  initState() {
    items.add("Apple");
    items.add("Bananas");
    items.add("Milk");
    items.add("Water");
    controller.addListener(() {
      setState(() {
        filter = controller.text;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child: Column(children: <Widget>[
        Padding(padding: EdgeInsets.only(top: 20)),
        TextField(
          decoration: InputDecoration(labelText: "Search something"),
          controller: controller,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return filter == null || filter == ""
                  ? new Card(child: new Text(items[index]))
                  : items[index].toLowerCase().contains(filter.toLowerCase())
                      ? new Card(child: new Text(items[index]))
                      : new SizedBox.shrink();
            },
          ),
        )
      ]),
    );
  }
}
