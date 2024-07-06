import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hngt2/models/product/product.dart';
import 'package:hngt2/repo/product.dart';
import 'package:hngt2/views/widgets/product_card.dart';

import '../widgets/search_field.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({super.key});

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  bool fetching = true;
  late List<Product> products;
  late List<Product> filteredProducts;
  getProducts() async {
    filteredProducts = products = await ProductRepo.getProducts();
    setState(() {
      fetching = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Icon(CupertinoIcons.shopping_cart,),
          SizedBox(width: 12,)
        ],
        title: const Text(
          'All Products',
          style: TextStyle(fontWeight: FontWeight.bold,
          fontSize: 28
          ),
        ),

      ),
      body: fetching
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : Padding(
              padding: const EdgeInsets.symmetric( vertical: 6),
              child: Column(
                children: [
                  SearchField(
                    allProducts: products,
                    callBack: (ps) {
                      setState(() {
                        filteredProducts = ps;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Expanded(
                      child: filteredProducts.isEmpty
                          ? const Center(
                              child: Text('No products listed at this time.'),
                            )
                          : GridView.builder(
                              padding: const EdgeInsets.symmetric(vertical: 12,
                              horizontal: 12),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: 0.75,
                                      crossAxisSpacing: 16,
                                      mainAxisSpacing: 16,
                                      crossAxisCount:2),
                              itemCount: filteredProducts.length,
                              itemBuilder: (context, index) {
                                return ProductCard(product: filteredProducts[index]);
                              }))
                ],
              ),
            ),
    );
  }
}
