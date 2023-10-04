import 'package:CraftyBay/presentation/utilities/const_string.dart';
import 'package:flutter/material.dart';

class ProductReviewListTile extends StatefulWidget {
  const ProductReviewListTile({
    super.key,
  });

  @override
  State<ProductReviewListTile> createState() => _ProductReviewListTileState();
}

class _ProductReviewListTileState extends State<ProductReviewListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
                backgroundColor: Colors.grey[300],
                foregroundColor: Colors.grey[600],
                radius: 15,
                child: const Icon(
                  Icons.person_outlined,
                  size: 16,
                )),
            const SizedBox(
              width: 8,
            ),
            const Text('Mahfujur Musfique'),
          ],
        ),
        subtitle: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 8,
            ),
            Text(
              ConstString.dummyTextSmall,
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
