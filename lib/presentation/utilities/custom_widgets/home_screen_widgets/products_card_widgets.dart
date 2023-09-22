import 'package:CraftyBay/presentation/utilities/app_colors.dart';
import 'package:CraftyBay/presentation/utilities/resources_path.dart';
import 'package:flutter/material.dart';

class ProductsCard extends StatelessWidget {
  const ProductsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7)),
      child: SizedBox(
        width: 150,
        child: Column(
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(7),
                      topRight: Radius.circular(7)),
                  color: AppColors.primaryColor.withOpacity(0.1),
                  image: const DecorationImage(
                      image: AssetImage(ImageAssets.nikeShoePNG))),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 2, 8, 0),
              child: Text(
                "Nike Shoe dsfdsGF ASDGFEW SDFWEgsasdS",
                maxLines: 1,
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    overflow: TextOverflow.ellipsis),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 8, 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$1000",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor,
                        overflow: TextOverflow.ellipsis),
                  ),
                  Wrap(crossAxisAlignment: WrapCrossAlignment.center, children: [
                    Icon(
                      Icons.star,
                      size: 21,
                      color: Colors.amber,
                    ),
                    Text(
                      "4.5",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          overflow: TextOverflow.ellipsis),
                    )
                  ]),
                  Card(
                      color: AppColors.primaryColor,
                      child: Padding(
                        padding: EdgeInsets.all(1.0),
                        child: Icon(
                          Icons.favorite_border,
                          size: 16,
                          color: Colors.white,
                        ),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
