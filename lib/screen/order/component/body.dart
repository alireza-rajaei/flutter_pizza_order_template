import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pizza/data/model/cart.dart';
import 'package:pizza/data/model/product.dart';
import 'package:pizza/screen/product_details/product_details_page.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late PageController _pageController;
  late PageController _page1Controller;
  late PageController _titlePageController;
  final ScrollController _scrollController = ScrollController();

  final List<Product> _products = Product.getList();
  final List<Product> _soda = Product.getSodaList();
  final List<Cart> _carts = [];

  int _currentPage = 0;
  double _lastposition = 0.0;

  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(initialPage: 0, viewportFraction: .7, keepPage: true);
    _page1Controller =
        PageController(initialPage: 0, viewportFraction: .3, keepPage: true);
    _titlePageController =
        PageController(initialPage: 0, viewportFraction: 1, keepPage: true);
    _pageController.addListener(() {
      if (_pageController.page! > _currentPage) {
        if (_lastposition < _pageController.page!) {
          setState(() {
            _currentPage = _currentPage + 1;
          });
        }
      } else if (_pageController.page! < _currentPage) {
        if (_lastposition > _pageController.page!) {
          setState(() {
            _currentPage = _currentPage - 1;
          });
        }
      }
      _lastposition = _pageController.page!;
    });
  }

  double toolbarHeight = 90;
  double paddingTop = 40;
  bool _isShowCart = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fast Food',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              fontFamily: 'gilroy',
              color: Colors.black),
        ),
        elevation: 1,
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: const Color(0xff10131E),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20))),
                height: MediaQuery.of(context).size.height - 210,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      height: 50,
                      child: PageView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: _titlePageController,
                        itemCount: _products.length,
                        itemBuilder: (context, position) {
                          return Center(
                            child: Text(
                              _products[position].name,
                              style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'gilroy'),
                            ),
                          );
                        },
                        onPageChanged: (page) {},
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 50),
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: Text(
                          '\$${_products[_currentPage].price}',
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'gilroy'),
                          key: Key('index_$_currentPage'),
                        ),
                      ),
                    ),
                    _pizzaSection(context),
                    _sodaSection()
                  ],
                ),
              ),
            ),
            expandableCart(context)
          ],
        ),
      ),
    );
  }

  Widget expandableCart(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 500),
      child: GestureDetector(
        onVerticalDragUpdate: (details) {
          if (!_isShowCart && details.primaryDelta! < -7) {
            setState(() {
              _isShowCart = true;
            });
          } else if (_isShowCart && details.primaryDelta! > 15) {
            setState(() {
              _isShowCart = false;
            });
          }
        },
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16)),
            color: Color(0xff181617),
          ),
          height: MediaQuery.of(context).size.height - 150,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    Visibility(
                      child: AnimatedOpacity(
                        opacity: _isShowCart ? 0 : 1,
                        duration: const Duration(milliseconds: 500),
                        child: SizedBox(
                          height: 100 - 20,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Iconsax.shopping_cart,
                                color: Colors.white,
                              ),
                              Container(
                                height: 25,
                                width: 1,
                                color: Colors.white.withOpacity(.2),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                              ),
                              Expanded(
                                child: ListView.builder(
                                    controller: _scrollController,
                                    itemCount: _carts.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, position) {
                                      Cart cart = _carts[position];
                                      print(
                                          'tag _product${cart.product.id}details');
                                      return Stack(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                                right: 15, top: 25, bottom: 25),
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(150),
                                                color: Colors.white
                                                    .withOpacity(.1)),
                                            child: Hero(
                                              tag:
                                                  '_product${cart.product.id}details',
                                              child: Image.asset(
                                                  _carts[position]
                                                      .product
                                                      .imagePath),
                                            ),
                                          ),
                                          Positioned(
                                            right: 5,
                                            top: 15,
                                            child: Container(
                                              height: 20,
                                              width: 20,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: const Color(0xfffec80c),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black
                                                        .withOpacity(.6),
                                                    blurRadius: 5,
                                                    spreadRadius: 2,
                                                    offset: const Offset(0, 3),
                                                  ),
                                                ],
                                              ),
                                              child: Center(
                                                child: Text(
                                                  _carts[position]
                                                      .quantity
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontFamily: 'gilroy',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.white,
                                                      fontSize: 12),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      );
                                    }),
                              ),
                              Container(
                                height: 25,
                                width: 1,
                                color: Colors.white.withOpacity(.2),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                              ),
                              Container(
                                width: 80,
                                padding: const EdgeInsets.all(7),
                                margin:
                                    const EdgeInsets.symmetric(vertical: 25),
                                decoration: BoxDecoration(
                                    color: const Color(0xff006aff),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Row(
                                  children: [
                                    const Text(
                                      'Total :',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'gilroy',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          _totalCartQuantity().toString(),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'gilroy',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      visible: !_isShowCart,
                    ),
                    Visibility(
                      visible: _isShowCart,
                      child: AnimatedOpacity(
                        opacity: _isShowCart ? 1 : 0,
                        duration: const Duration(milliseconds: 500),
                        child: SizedBox(
                          height: 80,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Iconsax.shopping_cart,
                                color: Colors.white,
                                size: 30,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: Text(
                                  'shoping Cart',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: _carts.length,
                        itemBuilder: (context, position) {
                          return AnimatedOpacity(
                            duration: const Duration(milliseconds: 300),
                            opacity: _isShowCart ? 1 : 0,
                            child: Container(
                              height: 60,
                              margin: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    decoration: const BoxDecoration(),
                                    child: Center(
                                      child: Image.asset(
                                          _carts[position].product.imagePath),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 15.0),
                                      child: Text(
                                        '${_carts[position].quantity} x ${_carts[position].product.name}',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'gilroy',
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '\$${_carts[position].quantity * double.parse(_carts[position].product.price)}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        })),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Total',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(.5),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Text(
                              '\$${_totalCartPrice().toString()}',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: MaterialButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Next',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'gilroy',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              )
                            ],
                          ),
                          color: const Color(0xff006aff),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      top: _isShowCart ? 0 : MediaQuery.of(context).size.height - 210,
    );
  }

  Widget _pizzaSection(BuildContext context) {
    return SizedBox(
      height: 300,
      width: MediaQuery.of(context).size.width,
      child: PageView.builder(
        controller: _pageController,
        itemCount: _products.length,
        itemBuilder: (context, position) {
          return productItem(
            position,
            () {
              Navigator.of(context).push(
                PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 500),
                    reverseTransitionDuration:
                        const Duration(milliseconds: 500),
                    pageBuilder: (context, animation, __) {
                      return FadeTransition(
                        opacity: animation,
                        child: ProductDetailPage(
                          product: _products[position],
                          onAddItem: () {
                            _addProductToCart(_products[position]);
                          },
                        ),
                      );
                    }),
              );
            },
          );
        },
        onPageChanged: (page) {
          _titlePageController.animateToPage(_currentPage,
              duration: const Duration(milliseconds: 200),
              curve: Curves.bounceInOut);
        },
      ),
    );
  }

  Widget _sodaSection() {
    return Expanded(
      child: PageView.builder(
        controller: _page1Controller,
        itemCount: _soda.length,
        itemBuilder: (context, position) {
          return sodaItem(
            position,
            () {
              Navigator.of(context).push(
                PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 500),
                    reverseTransitionDuration:
                        const Duration(milliseconds: 500),
                    pageBuilder: (context, animation, __) {
                      return FadeTransition(
                        opacity: animation,
                        child: ProductDetailPage(
                          product: _soda[position],
                          onAddItem: () {
                            _addProductToCart(_soda[position]);
                          },
                        ),
                      );
                    }),
              );
            },
          );
        },
        onPageChanged: (page) {
          _titlePageController.animateToPage(_currentPage,
              duration: const Duration(milliseconds: 200),
              curve: Curves.bounceInOut);
        },
      ),
    );
  }

  void _addProductToCart(Product product) async {
    if (_carts.length > 2) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent + 60);
    }

    int index = _carts.indexWhere((element) => element.product == product);
    if (index == -1) {
      setState(() {
        _carts.add(Cart(product, 1));
      });
    } else {
      setState(() {
        _carts[index].quantity++;
      });
    }

    _pageController.jumpTo(_pageController.offset - 1);
  }

  int _totalCartQuantity() => _carts.fold(
      0, (previousValue, element) => previousValue + element.quantity);

  double _totalCartPrice() => _carts.fold(
      0,
      (previousValue, element) => (previousValue +
          (double.parse(element.product.price) * element.quantity)));

  productItem(int index, VoidCallback onItemClick) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page! - index;
          value = 1 - (value.abs() * 0.4).clamp(0.0, 0.4);
        }
        return GestureDetector(
          onTap: onItemClick,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Transform(
                transform: Matrix4.translationValues(value, value, value)
                  ..scale(value),
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.only(top: 200 - (value * 200)),
                  child: FractionallySizedBox(
                    widthFactor: 1 / _pageController.viewportFraction - .2,
                    child: Hero(
                      tag: '_product${_products[index].id}',
                      child: Image.asset(
                        _products[index].imagePath,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  sodaItem(int index, VoidCallback onItemClick) {
    return AnimatedBuilder(
      animation: _page1Controller,
      builder: (context, widget) {
        double value = 1;
        if (_page1Controller.position.haveDimensions) {
          value = _page1Controller.page! - index;
          value = 1 - (value.abs() * 0.4).clamp(0.0, 0.4);
        }
        return GestureDetector(
          onTap: onItemClick,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Transform(
                transform: Matrix4.translationValues(value, value, value)
                  ..scale(value),
                alignment: Alignment.center,
                child: Container(
                  // padding: EdgeInsets.only(top: 200 - (value * 200)),
                  child: FractionallySizedBox(
                    widthFactor: 1 / _pageController.viewportFraction - .2,
                    child: Hero(
                      tag: '_product${_soda[index].id}',
                      child: Image.asset(
                        _soda[index].imagePath,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
