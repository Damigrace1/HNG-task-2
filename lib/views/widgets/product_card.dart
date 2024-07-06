import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hngt2/models/product/photo.dart';
import 'package:hngt2/models/product/product.dart';
import 'package:hngt2/utils/extensions.dart';

class ProductCard extends StatelessWidget {

  const ProductCard({super.key, required this.product});

  final Product product;
  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: CupertinoColors.white,
              borderRadius: BorderRadius.circular(8),
             boxShadow: [
               BoxShadow(
                 color: Colors.black.withOpacity(0.2),
                 blurRadius: 4
               )
             ]

          ),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: SizedBox(
                  child: CachedNetworkImage(
                    imageUrl: product.photos?.firstOrNull?.link ?? '',
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(
                      child: SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator()),
                    ),
                    errorWidget: (context, url, error) =>
                        const Center(child: Icon(Icons.error)),
                  ),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8)
                      ),
                      color: Theme.of(context).primaryColor.withOpacity(0.05),
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Flexible(
                          child: Text(
                            product.name ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style:
                                const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                        ),
                        Flexible(
                            child: Text(
                          product.description ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        )),
                        Text(
                          '₦${product.current_price?.firstOrNull?.NGN?.firstOrNull
                          .toString().split('.').first.thousandsFormatter?? ''}',
                          style: const TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )),

            ],
          ),
        ),
        const Positioned(
            top: 12,
            left: 12,
            child: CircleAvatar(
              radius: 12,
                backgroundColor: Colors.pink,
                child: Icon(Icons.favorite_border,
                color: CupertinoColors.white,
                size: 16,)))
      ],
    );
  }
}
