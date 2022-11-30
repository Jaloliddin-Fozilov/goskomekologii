import 'package:flutter/material.dart';

class CheckoutDropdown extends StatefulWidget {
  final List<String> list;
  const CheckoutDropdown({
    Key? key,
    required this.list,
  }) : super(key: key);

  @override
  State<CheckoutDropdown> createState() => _CheckoutDropdownState();
}

class _CheckoutDropdownState extends State<CheckoutDropdown> {
  late String _selectedItem;

  @override
  void initState() {
    _selectedItem = widget.list.first;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
      ),
      isExpanded: true,
      items: widget.list.map((item) {
        return DropdownMenuItem(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: (item) {
        setState(() {
          _selectedItem = item!;
        });
      },
      value: _selectedItem,
    );
  }
}
