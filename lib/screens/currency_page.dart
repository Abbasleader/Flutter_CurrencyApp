import 'package:currency_app/models/currency_model.dart';
import 'package:flutter/material.dart';

class CurrencyPage extends StatelessWidget {
  static const routeName = "currency-page";

  List<CurrencyModel> currencies = [
    CurrencyModel(
      mImageResources: null,
      mNameOfCountry: "Afghanistan",
      mFullNameCurrency: 99,
      mAbbrevateCurrency: "AFG",
      mCurrencyOfTheCountry: "افغانی",
    ),
    CurrencyModel(
      mImageResources: null,
      mNameOfCountry: "Afghanistan",
      mFullNameCurrency: 99,
      mAbbrevateCurrency: "AFG",
      mCurrencyOfTheCountry: "افغانی",
    ),
    CurrencyModel(
      mImageResources: null,
      mNameOfCountry: "Afghanistan",
      mFullNameCurrency: 99,
      mAbbrevateCurrency: "AFG",
      mCurrencyOfTheCountry: "افغانی",
    )
  ];

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text('ارز'),
      leading: const BackButton(color: Colors.amber),
      actions: <Widget>[
        const Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Icon(Icons.search, color: Colors.amber),
        )
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/striped_background.PNG'),
            fit: BoxFit.cover,
          ),
        ),
        height: (MediaQuery.of(context).size.height -
                appBar.preferredSize.height -
                MediaQuery.of(context).padding.top) *
            1,
        child: ListView.builder(
          itemCount: currencies.length,
          itemBuilder: (BuildContext ctx, int index) {
            return Card(
              color: Colors.grey,
              child: ListTile(
                trailing: const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/icon.png'),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textDirection: TextDirection.rtl,
                  children: <Widget>[
                    Text(
                      currencies[index].mCurrencyOfTheCountry,
                      style: const TextStyle(color: Colors.white),
                    ),
                    const Text(
                      'تغیرات اخیر: بدون تغیر',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                leading: Text(
                  currencies[index].mFullNameCurrency.toString(),
                  style: const TextStyle(color: Colors.amber),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
