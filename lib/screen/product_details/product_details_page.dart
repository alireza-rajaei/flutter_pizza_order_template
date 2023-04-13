import 'package:flutter/material.dart';
import 'package:pizza/data/model/product.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage(
      {Key? key, required this.product, required this.onAddItem})
      : super(key: key);
  final Product product;
  final VoidCallback onAddItem;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  String _heroTag = '';

  @override
  Widget build(BuildContext context) {
    print('_product${widget.product.id}$_heroTag');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        elevation: 1,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
                tag: '_product${widget.product.id}$_heroTag',
                child: Image.asset(widget.product.imagePath)),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      widget.product.name,
                      style: const TextStyle(
                          fontSize: 28,
                          fontFamily: 'gilroy',
                          fontWeight: FontWeight.w700),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        '\$${widget.product.price}',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'gilroy',
                            fontWeight: FontWeight.w700,
                            color: Colors.black.withOpacity(.5)),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 40.0),
                      child: Text(
                        'About This Food',
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'gilroy',
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text(
                          widget.product.description,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 5,
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'gilroy',
                              fontWeight: FontWeight.w500,
                              height: 1.5,
                              color: Colors.black.withOpacity(.5)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {
                        setState(() {
                          _heroTag = 'details';
                        });
                        widget.onAddItem();
                        Navigator.pop(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Add to cart',
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'gilroy',
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          )
                        ],
                      ),
                      color: const Color(0xff016afa),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    flex: 2,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
