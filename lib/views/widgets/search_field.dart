import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/product/product.dart';

class SearchField extends StatelessWidget {
  const SearchField(
      {super.key, required this.allProducts, required this.callBack});
  final List<Product> allProducts;
  final void Function(List<Product>) callBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextField(
        onChanged: (v) {
          callBack(allProducts.where((product) {
            if (product.description == null && product.name == null) {
              return true;
            }
            return product.description!
                    .toLowerCase()
                    .contains(v.toLowerCase()) ||
                product.name!.toLowerCase().contains(v.toLowerCase());
          }).toList());
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
            filled: true,
            hintText: 'Search products',
            fillColor: Theme.of(context).primaryColor.withOpacity(0.06),
            prefixIcon: const Icon(CupertinoIcons.search),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(12)),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(12))),
      ),
    );
  }
}
