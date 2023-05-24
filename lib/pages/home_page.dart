import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../constant/product_data.dart';
import 'product_detail_page.dart';
import '../theme/colors.dart';
import '../widgets/app_bar.dart';
import '../widgets/faverite_icon.dart';
import '../widgets/bottom_bar.dart';

class HomePage extends StatefulWidget {
  HomePage({this.favClicked = false, super.key});
  bool favClicked;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BottomNav? bottomNav = BottomNav();
  List showProduct = [];
  List idx = [];
  int len = 1;

  @override
  initState() {
    super.initState();
    showProduct = products;
    if (widget.favClicked == false) {
      len = showProduct.length;
    } else {
      for (var i = 0; i < fav_list.length; i++) {
        if (fav_list[i]) {
          idx.add(i);
        }
      }
      len = idx.length;
    }
  }

  void updateCart() {
    debugPrint(tabBarCount.toString());

    setState(() {
      debugPrint(cart.toString());
      bottomNav?.updateCart();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getAppBar(context, "Product"),
      body: getBody(),
      bottomNavigationBar: bottomNav,
    );
  }

  Widget getBody() {
    return ListView(
      children: <Widget>[
        Padding(
            padding:
                const EdgeInsets.only(top: 40, left: 30, right: 30, bottom: 20),
            child: Text(
              "Shoes",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            )),
        Column(
            children: List.generate(len, (index) {
          debugPrint("click: ${fav_list.toString()}");

          // if (fav_list.every((element) => element ? false : true)) {
          if (widget.favClicked == false) {
            debugPrint("click: ${fav_list.toString()}");
            return productBox(context, index, updateCart, showProduct);
          } else {
            debugPrint("click: ${fav_list.toString()}");

            return productBox(context, idx[index], updateCart, showProduct);
          }
        }))
      ],
    );
  }
}

Widget productBox(context, int index, Function fn, List products) {
  return FadeInDown(
    duration: Duration(milliseconds: 350 * index),
    child: Padding(
      padding: const EdgeInsets.all(6.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => ProductDetailPage(
                        id: products[index]['id'].toString(),
                        name: products[index]['name'],
                        img: products[index]['img'],
                        price: products[index]['price'],
                        mulImg: products[index]['mul_img'],
                        sizes: products[index]['sizes'],
                      ))).then((value) => fn());
        },
        child: Container(
            child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: grey,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 1,
                        color: black.withOpacity(0.1),
                        blurRadius: 2)
                  ]),
              child: Column(
                children: <Widget>[
                  Center(
                    child: Container(
                      width: 280,
                      height: 180,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/" + products[index]['img']),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    products[index]['name'],
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "\$ " + products[index]['price'],
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 25,
                  )
                ],
              ),
            ),
            Positioned(right: 10, child: FaveriteIcon(index))
          ],
        )),
      ),
    ),
  );
}
