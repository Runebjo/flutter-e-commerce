import 'package:e_commerce/constants.dart';
import 'package:e_commerce/models/Product.dart';
import 'package:flutter/material.dart';

import 'color_and_size.dart';
import 'description.dart';
import 'product_title_with_image.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            child: Stack(
              children: [
                Container(
                    margin: EdgeInsets.only(top: size.height * 0.35),
                    padding: EdgeInsets.only(
                      top: size.height * 0.12,
                      left: kDefaultPaddin,
                      right: kDefaultPaddin,
                    ),
                    height: 500,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                      children: [
                        ColorAndSize(product: product),
                        Description(product: product),
                        CartCounter()
                      ],
                    )),
                ProductTitleWithImage(product: product)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CartCounter extends StatefulWidget {
  @override
  _CartCounterState createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numOfItems = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildOutlineButton(),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: kDefaultPaddin / 2,
          ),
          child: Text(
            "01",
            style: Theme.of(context).textTheme.headline6,
          ),
        )
      ],
    );
  }

  SizedBox buildOutlineButton() {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlineButton(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
        onPressed: () {},
        child: Icon(Icons.remove),
      ),
    );
  }
}
