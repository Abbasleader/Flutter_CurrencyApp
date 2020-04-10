import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:jalali_date/jalali_date.dart';
import 'package:shamsi_date/shamsi_date.dart';

import '../screens/currency_page.dart';
import '../screens/exchange_page.dart';
import '../screens/grows_page.dart';

class ImageCarousel extends StatelessWidget {
  final List<String> daysOfWeek = ["شنبه", "یکشنبه", "دوشنبه", "سه شنبه", "چهارشنبه", "پنج شنبه", "جمعه"];
  final carousel = Carousel(
    boxFit: BoxFit.cover,
    images: [
      const AssetImage('assets/images/try.jpg'),
      const AssetImage('assets/images/imagesa.jpg'),
      const AssetImage('assets/images/images.jpg'),
    ],
    animationCurve: Curves.fastOutSlowIn,
    animationDuration: Duration(microseconds: 3000),
  );

  buttonIcons(String text, IconData icon, BuildContext ctx, String routeName) {
    final iconSize = MediaQuery.of(ctx).size.height;
    return Container(
      height: iconSize * 0.26,
      child: GestureDetector(
        onTap: () => Navigator.of(ctx).pushNamed(routeName),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, color: Colors.amberAccent, size: iconSize * 0.1),
            Text(
              text,
              style: TextStyle(
                fontSize: iconSize / 4 * 0.15,
                color: Colors.amberAccent,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    PersianDate date = new PersianDate.now();
    Jalali j = Jalali.now();

    deviceSize(BuildContext context) {
      return MediaQuery.of(context).size.height;
    }

    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              height: deviceSize(context) * 0.4,
              child: carousel,
            ),
            // CheckConnectionWidget()
          ],
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/striped_background.PNG'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                    left: deviceSize(context) * 0.05,
                    right: deviceSize(context) * 0.05,
                    top: deviceSize(context) * 0.04,
                  ),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.amberAccent,
                  ),
                  child: Text(
                    "$date : ${daysOfWeek[j.weekDay - 1]}",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.07,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    buttonIcons(
                      'مبدل ارز',
                      Icons.swap_horiz,
                      context,
                      ExchangePage.routeName,
                    ),
                    buttonIcons(
                      'نمودار ارز',
                      Icons.trending_up,
                      context,
                      GrowsPage.routeName,
                    ),
                    buttonIcons(
                      'ارز',
                      Icons.attach_money,
                      context,
                      CurrencyPage.routeName,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          height: deviceSize(context) * 0.07,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/striped_background.PNG'),
              fit: BoxFit.cover,
            ),
          ),
          child: Builder(
            builder: (BuildContext context) {
              return OfflineBuilder(
                connectivityBuilder: (
                  BuildContext context,
                  ConnectivityResult connectivity,
                  Widget child,
                ) {
                  final bool connected =
                      connectivity != ConnectivityResult.none;
                  return Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      child,
                      Positioned(
                        left: 0.0,
                        right: 0.0,
                        height: deviceSize(context) * 0.07,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          color: connected
                              ? Colors.transparent
                              : const Color(0xFFEE4400),
                          child: connected
                              ? null
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                      const SizedBox(
                                        width: 12.0,
                                        height: 12.0,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2.0,
                                          valueColor: AlwaysStoppedAnimation(
                                            Colors.white,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 8.0),
                                      Text(
                                        '!به اینترنت متصل نیستید',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.05,
                                        ),
                                      ),
                                    ]),
                        ),
                      )
                    ],
                  );
                },
                child: const Center(
                  child: null,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
