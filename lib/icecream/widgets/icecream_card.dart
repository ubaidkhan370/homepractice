import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/icecream_model.dart';

class IceCreamCard extends StatelessWidget {
  const IceCreamCard({
    super.key,
    required this.iceCream,
  });

  final Icecream iceCream;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Card(
        clipBehavior: Clip.hardEdge,
        color: Colors.orange.shade100,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Hero(
              tag: iceCream.image,
              child: CachedNetworkImage(
                imageUrl:  iceCream.image,
                fit: BoxFit.cover,
                color: Colors.orange.withOpacity(0.4),
                colorBlendMode: BlendMode.color,
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      iceCream.flavor,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    Text(
                      "\$${iceCream.price.toString()}",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
