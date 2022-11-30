import 'package:flutter/material.dart';
import 'package:goskomekologii/services/contants.dart';

class CheckoutCheckboxes extends StatelessWidget {
  const CheckoutCheckboxes({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CheckboxListTile(
            value: true,
            title: const Text('Отстрел'),
            tileColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
              side: const BorderSide(color: Colors.grey),
            ),
            activeColor: APPBARCOLOR,
            onChanged: (value) {},
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: CheckboxListTile(
            value: false,
            title: const Text('Отлов'),
            tileColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
              side: const BorderSide(color: Colors.grey),
            ),
            activeColor: APPBARCOLOR,
            onChanged: (value) {},
          ),
        )
      ],
    );
  }
}
