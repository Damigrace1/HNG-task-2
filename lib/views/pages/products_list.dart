import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hngt2/models/product/photo.dart';
import 'package:hngt2/models/product/product.dart';
import 'package:hngt2/repo/product.dart';
import 'package:hngt2/views/widgets/product_card.dart';

import '../widgets/search_field.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({Key? key}) : super(key: key);

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  bool fetching = true;
  late final List<Product> products;
  getProducts() async {
    products = await ProductRepo.getProducts();
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
  //  print(products[2]?.photos?.firstOrNull?.link);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Products',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: fetching
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Column(
                children: [
                  SearchField(),
                  Expanded(
                      child: products.isEmpty
                          ? Center(
                              child: Text('No products listed at this time.'),
                            )
                          : GridView.builder(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: 0.75,
                                      crossAxisSpacing: 12,
                                      mainAxisSpacing: 12,
                                      crossAxisCount: 2),
                              itemCount: products.length,
                              itemBuilder: (context, index) {
                                return ProductCard(product: products[index]);
                              }))
                ],
              ),
            ),
    );
  }
}
