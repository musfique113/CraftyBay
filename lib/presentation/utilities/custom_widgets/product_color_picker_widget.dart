import 'package:flutter/material.dart';

class ProductColorPicker extends StatefulWidget {
  const ProductColorPicker(
      {super.key,
      required this.colorsList,
      required this.onSelected,
      required this.initialSelected});

  final List<Color> colorsList;
  final Function(int selectCIndex) onSelected;
  final int initialSelected;

  @override
  State<ProductColorPicker> createState() => _ProductColorPickerState();
}

class _ProductColorPickerState extends State<ProductColorPicker> {
  int _selectedColorIndex = 0;

  @override
  void initState() {
    _selectedColorIndex = widget.initialSelected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: widget.colorsList.length,
      itemBuilder: (context, index) {
        return InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            _selectedColorIndex = index;
            if (mounted) {
              setState(() {});
            }
          },
          child: CircleAvatar(
            backgroundColor: widget.colorsList[index],
            child: _selectedColorIndex == index
                ? const Icon(
                    Icons.done,
                    color: Colors.white,
                  )
                : null,
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          width: 4,
        );
      },
    );
  }
}
