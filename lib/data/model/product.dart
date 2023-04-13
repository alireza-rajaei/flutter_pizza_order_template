class Product {
  int id;
  String name;
  String price;
  int quantity;
  String imagePath;
  String description;

  Product(this.id, this.name, this.price, this.quantity, this.imagePath,
      this.description);

  static List<Product> getList() {
    List<Product> products = [];
    Product p = Product(
        1,
        'Neapolitan Pizza',
        '10',
        0,
        'assets/images/img1.png',
        '(Italian: pizza napoletana) also known as Naples-style pizza, is a style of pizza made with tomatoes and mozzarella cheese. It must be made with either San Marzano tomatoes or Pomodorino del Piennolo del Vesuvio, which grow on the volcanic plains to the south of Mount Vesuvius, and Mozzarella di Bufala Campana,');
    products.add(p);
    p = Product(2, 'Chicago Pizza', '11', 0, 'assets/images/img1.png',
        'prepared according to several different styles developed in Chicago, widely referred to simply as deep dish pizza due to its cooking style. The pan in which it is baked gives the pizza its characteristically high edge which provides ample space for large amounts of cheese and a chunky tomato sauce.');
    products.add(p);
    p = Product(3, ' New York-Style Pizza', '12', 0, 'assets/images/img1.png',
        ' made with a characteristically large hand-tossed thin crust, often sold in wide slices to go. The crust is thick and crisp only along its edge, yet soft, thin, and pliable enough beneath its toppings to be folded in half to eat.[1] Traditional toppings are simply tomato sauce and shredded mozzarella cheese');
    products.add(p);
    p = Product(4, 'Sicilian Pizza', '13', 0, 'assets/images/img1.png',
        'prepared in a manner that originated in Sicily, Italy. Sicilian pizza is also known as sfincione (Italian: [sfinˈtʃoːne]; Sicilian: sfinciuni [sfɪnˈtʃuːnɪ]) or focaccia with toppings.[1][2] This type of pizza became a popular dish in western Sicily by the mid-19th century and was the type of pizza usually consumed in Sicily until the 1860s.');
    products.add(p);
    p = Product(5, 'Greek Pizza', '14', 0, 'assets/images/img1.png',
        ' the cuisine of the United States, Greek pizza is a style of pizza crust and preparation where the pizza is proofed and cooked in a metal pan rather than stretched to order and baked on the floor of the pizza oven.[1] A shallow pan is used, unlike the deep pans used in Sicilian, Chicago, or Detroit-styled pizzas.');
    products.add(p);
    p = Product(6, 'California Pizza', '16', 0, 'assets/images/img1.png',
        '(also known as California pizza) is a style of single-serving pizza that combines New York and Italian thin crust with toppings from the California cuisine cooking style. Its invention is generally attributed to chef Ed LaDou, and Chez Panisse, in Berkeley, California. Wolfgang Puck,');
    products.add(p);
    p = Product(7, 'Types of Pizza Crust', '17', 0, 'assets/images/img1.png',
        '(Italian: [ˈpittsa], Neapolitan: [ˈpittsə]) is a dish of Italian origin consisting of a usually round, flat base of leavened wheat-based dough topped with tomatoes, cheese, and often various other ingredients (such as anchovies, mushrooms, onions, olives, pineapple, meat, etc.)');
    products.add(p);
    p = Product(8, 'Detroit Pizza', '18', 0, 'assets/images/img1.png',
        'Detroit-style pizza is a rectangular pizza with a thick crust that is crispy and chewy. It is traditionally topped with tomato sauce and Wisconsin brick cheese that goes all the way to the edges. This style of pizza is often baked in rectangular steel trays designed for use as automotive drip pans or to hold small industrial parts in factories.');
    products.add(p);
    return products;
  }

  static List<Product> getSodaList() {
    List<Product> products = [];
    Product p = Product(9, 'coca cola', '10', 0, 'assets/images/soda1.png',
        '(Italian: pizza napoletana) also known as Naples-style pizza, is a style of pizza made with tomatoes and mozzarella cheese. It must be made with either San Marzano tomatoes or Pomodorino del Piennolo del Vesuvio, which grow on the volcanic plains to the south of Mount Vesuvius, and Mozzarella di Bufala Campana,');
    products.add(p);
    p = Product(10, 'Chicago Pizza', '11', 0, 'assets/images/soda2.png',
        'prepared according to several different styles developed in Chicago, widely referred to simply as deep dish pizza due to its cooking style. The pan in which it is baked gives the pizza its characteristically high edge which provides ample space for large amounts of cheese and a chunky tomato sauce.');
    products.add(p);
    p = Product(11, ' New York-Style Pizza', '12', 0, 'assets/images/soda3.png',
        ' made with a characteristically large hand-tossed thin crust, often sold in wide slices to go. The crust is thick and crisp only along its edge, yet soft, thin, and pliable enough beneath its toppings to be folded in half to eat.[1] Traditional toppings are simply tomato sauce and shredded mozzarella cheese');
    products.add(p);
    p = Product(12, 'Sicilian Pizza', '13', 0, 'assets/images/soda4.png',
        'prepared in a manner that originated in Sicily, Italy. Sicilian pizza is also known as sfincione (Italian: [sfinˈtʃoːne]; Sicilian: sfinciuni [sfɪnˈtʃuːnɪ]) or focaccia with toppings.[1][2] This type of pizza became a popular dish in western Sicily by the mid-19th century and was the type of pizza usually consumed in Sicily until the 1860s.');
    products.add(p);

    return products;
  }
}
