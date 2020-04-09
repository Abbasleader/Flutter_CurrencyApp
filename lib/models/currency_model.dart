import 'package:flutter/foundation.dart';

class CurrencyModel {
  final String mImageResources;
  final String mNameOfCountry;
  final double mFullNameCurrency;
  final String mAbbrevateCurrency;
  final String mCurrencyOfTheCountry;

  CurrencyModel({
    @required this.mImageResources,
    @required this.mNameOfCountry,
    @required this.mFullNameCurrency,
    @required this.mAbbrevateCurrency,
    @required this.mCurrencyOfTheCountry,
  });
}
