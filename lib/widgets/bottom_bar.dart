import 'package:flutter/material.dart';
import 'package:search_page/search_page.dart';
import 'package:test_shopping_shoe/pages/product_detail_page.dart';
import 'dart:async';
import '../constant/product_data.dart';
import '../pages/home_page.dart';
import '../pages/cart_page.dart';

class BottomNav extends StatefulWidget {
  BottomNav({super.key, this.productDetail: false});
  bool productDetail;
  StreamController<int> countController = StreamController<int>();
  final items = Product.getProducts();

  void updateCart() {
    countController.sink.add(tabBarCount);
  }

  void increment(String id) {
    // debugPrint(tabBarCount.toString());
    tabBarCount = tabBarCount + 1;
    countController.sink.add(tabBarCount);
    if (cart.containsKey(id)) {
      cart[id] = (cart[id] ?? 1) + 1;
    } else {
      cart[id] = 1;
    }
    // debugPrint(cart.toString());
  }

  @override
  _BottomNav createState() => _BottomNav();
}

class _BottomNav extends State<BottomNav> {
  int numProd = 0;

  @override
  void initState() {
    //TODO: implement initState
    if (cart.isNotEmpty) {
      Iterable<int> values = cart.values;
      numProd = values.reduce((sum, value) => sum + value);
    }

    tabBarCount = numProd;
  }

  void callHomePage(BuildContext context) {
    // debugPrint(clickedFavBottom.toString());
    if (widget.productDetail) {
      clickedFavBottom = false;
      Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
    } else if (clickedFavBottom) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => HomePage(
                    favClicked: true,
                  )));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
    }
  }

  Widget bottomNav() {
    return BottomAppBar(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        IconButton(
            onPressed: () {
              showSearch(
                  context: context,
                  delegate: SearchPage(
                    onQueryUpdate: print,
                    items: widget.items,
                    searchLabel: 'Search item',
                    suggestion: const Center(
                      child: Text('Filter item by name'),
                    ),
                    failure: const Center(
                      child: Text('No item found :('),
                    ),
                    filter: (item) => [
                      item.name,
                    ],
                    sort: (a, b) => a.compareTo(b),
                    builder: (item) {
                      return GestureDetector(
                        child: productBox(
                            context, int.parse(item.id.toString()) - 1, () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => HomePage()));
                        }, products),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => productBox(
                                  context, int.parse(item.id.toString()) - 1,
                                  () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => HomePage()));
                              }, products),
                            ),
                          );
                        },
                      );
                    },
                    // ),
                    // (person) => ListTile(
                    //   title: Text(person.name),
                  ));
              //   ),
              // ),
            },
            icon: Icon(
              Icons.search,
              color: Colors.blue,
            )),
        IconButton(
            onPressed: () {
              debugPrint(clickedFavBottom.toString());

              clickedFavBottom = !clickedFavBottom;
              debugPrint(clickedFavBottom.toString());
              callHomePage(context);
            },
            icon: Stack(
              children: [
                Icon(
                  Icons.favorite_rounded,
                  color: clickedFavBottom ? Colors.blue : Colors.white,
                  size: 24,
                ),
                Icon(
                  Icons.favorite_border_rounded,
                  color: Colors.blue,
                )
              ],
            )),
        IconButton(
            onPressed: () {
              Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CartPage()))
                  .then((value) => setState(
                        () {
                          if (cart.isNotEmpty) {
                            Iterable<int> values = cart.values;
                            numProd =
                                values.reduce((sum, value) => sum + value);
                          } else {
                            numProd = 0;
                          }
                          tabBarCount = numProd;
                          widget.countController.sink.add(tabBarCount);
                          debugPrint(cart.toString());
                          debugPrint(tabBarCount.toString());
                        },
                      ));
            },
            icon: StreamBuilder(
              initialData: tabBarCount,
              stream: widget.countController.stream,
              builder: (_, snapshot) => BadgeIcon(
                icon: Icon(Icons.shopping_bag_outlined,
                    size: 25, color: Colors.blue),
                badgeCount: snapshot.data ?? 0,
              ),
            )),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return bottomNav();
  }
}

class BadgeIcon extends StatelessWidget {
  BadgeIcon(
      {this.icon,
      this.badgeCount = 0,
      this.showIfZero = false,
      this.badgeColor = Colors.red,
      TextStyle? badgeTextStyle})
      : this.badgeTextStyle = badgeTextStyle ??
            TextStyle(
              color: Colors.white,
              fontSize: 8,
            );
  final Widget? icon;
  int badgeCount = 0;
  final bool showIfZero;
  final Color badgeColor;
  final TextStyle? badgeTextStyle;

  @override
  Widget build(BuildContext context) {
    return new Stack(children: <Widget>[
      icon ?? IconButton(onPressed: (() {}), icon: Icon(Icons.abc)),
      if (badgeCount > 0 || showIfZero) badge(badgeCount),
    ]);
  }

  Widget badge(int count) => Positioned(
        right: 0,
        top: 0,
        child: new Container(
          padding: EdgeInsets.all(1),
          decoration: new BoxDecoration(
            color: badgeColor,
            borderRadius: BorderRadius.circular(8.5),
          ),
          constraints: BoxConstraints(
            minWidth: 15,
            minHeight: 15,
          ),
          child: Text(
            count.toString(),
            style: new TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
}
