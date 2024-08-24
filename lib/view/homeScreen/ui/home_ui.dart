import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/contoller/cart_contoller/cart_contoller.dart';
import 'package:e_commerce/contoller/category_controller/category_controller.dart';
import 'package:e_commerce/view/cart_screen/cast_screen.dart';
import 'package:e_commerce/view/homeScreen/ui/cart_ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreenUi extends StatefulWidget {
  const HomeScreenUi({super.key});

  @override
  State<HomeScreenUi> createState() => _HomeScreenUiState();
}

class _HomeScreenUiState extends State<HomeScreenUi> {
  bool ontaped = false;
  int selectedIndex = 0;
  @override
  void initState() {
    Provider.of<ProductController>(context, listen: false).getProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductController>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "E_Commerce",
            style: GoogleFonts.alike(fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () {}, icon: Icon(Icons.favorite_border_outlined)),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartUi(),
                      ));
                },
                icon: Icon(Icons.shopping_cart)),
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        labelText: "Search",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 15,
                  ),
                ),
                SliverToBoxAdapter(
                  child: CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                    ),
                    items: List.generate(
                      productProvider.images.length,
                      (index) => Container(
                        decoration: BoxDecoration(
                            // color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image:
                                    NetworkImage(productProvider.images[index]),
                                fit: BoxFit.fill)),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 15,
                  ),
                ),
                SliverToBoxAdapter(
                    child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      productProvider.Categorys.length,
                      (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10),
                          elevation: 8,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              productProvider.Categorys[index]
                                  .toString()
                                  .toUpperCase(),
                              style: GoogleFonts.almarai(
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 15,
                  ),
                ),
                SliverToBoxAdapter(
                    child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      productProvider.categoryList.length,
                      (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10),
                          elevation: 10,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CartScreen(
                                        productId: productProvider
                                            .categoryList[index]),
                                  ));
                            },
                            child: Container(
                              height: 250,
                              width: 150,
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              decoration: BoxDecoration(
                                // color: Colors.green,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    // color: Colors.blue,
                                    child: CachedNetworkImage(
                                      filterQuality: FilterQuality.high,
                                      height: 100,
                                      width: 80,
                                      alignment: Alignment.bottomCenter,
                                      imageUrl: productProvider
                                              .categoryList[index].image ??
                                          "",
                                      scale: 10,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Center(
                                    child: Text(
                                      productProvider
                                              .categoryList[index].title ??
                                          "",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  // Center(
                                  //   child: Text(
                                  //     (productProvider
                                  //                 .categoryList[index].category ??
                                  //             "")
                                  //         .toUpperCase(),
                                  //     style:
                                  //         TextStyle(fontWeight: FontWeight.bold),
                                  //   ),
                                  // ),
                                  // SizedBox(height: 10),
                                  Center(
                                    child: Text(
                                      "\$${productProvider.categoryList[index].price ?? 0}",
                                      style: GoogleFonts.anekKannada(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Spacer(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        icon: Icon(Icons.favorite,
                                            color: selectedIndex == index
                                                ? Colors.red
                                                : Colors.black),
                                        onPressed: () {
                                          setState(() {
                                            selectedIndex = index;
                                          });
                                        },
                                      ),
                                      Consumer<CartContoller>(
                                        builder: (context, value, child) =>
                                            GestureDetector(
                                          onTap: () {
                                            value.addProduct(
                                                productProvider
                                                    .categoryList[index],
                                                context);
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      CartUi(),
                                                ));
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5, vertical: 5),
                                            child: Text(
                                              "Add to Cart",
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )),
              ],
            ))
        //  productScreen()
        );
  }
}
