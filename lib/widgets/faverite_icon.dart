import 'package:flutter/material.dart';
import '../constant/product_data.dart';

class FaveriteIcon extends StatefulWidget {
  FaveriteIcon(this.index, {super.key});
  int index;

  @override
  _FaveriteIcon createState() => _FaveriteIcon();
}

class _FaveriteIcon extends State<FaveriteIcon> {
  void _clickFaverite(int index) {
    setState(() {
      if (fav_list[index]) {
        fav_list[index] = false;
      } else {
        fav_list[index] = true;
      }
    });
  }

  Widget createIcon(int index) {
    return IconButton(
        icon: Stack(
          children: [
            Icon(Icons.favorite,
                color: (fav_list[index] ? Colors.blue : Colors.white)),
            Icon(Icons.favorite_border, color: Colors.blue),
          ],
        ),
        onPressed: () => _clickFaverite(index));
  }

  @override
  Widget build(BuildContext context) {
    return createIcon(widget.index);
  }
}
