import 'package:flutter/material.dart';
import 'package:goskomekologii/models/checkout_model.dart';
import 'package:goskomekologii/providers/checkout_provider.dart';
import 'package:goskomekologii/services/contants.dart';
import 'package:provider/provider.dart';

class CheckoutCheckboxes extends StatefulWidget {
  const CheckoutCheckboxes({
    Key? key,
  }) : super(key: key);

  @override
  State<CheckoutCheckboxes> createState() => _CheckoutCheckboxesState();
}

class _CheckoutCheckboxesState extends State<CheckoutCheckboxes> {
  bool _isChecked = false;
  bool _initVisit = true;
  late CheckoutModel checkoutModel;

  @override
  void didChangeDependencies() {
    if (_initVisit) {
      checkoutModel =
          Provider.of<CheckoutProvider>(context, listen: false).currentCheckout;
      checkoutModel.type == 0 ? _isChecked = true : _isChecked = false;
      _initVisit = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    void updateCheckoutModel(int type) {
      Provider.of<CheckoutProvider>(context, listen: false)
          .updateCheckout(CheckoutModel(
        regionId: checkoutModel.regionId,
        districtId: checkoutModel.districtId,
        startDate: checkoutModel.startDate,
        endDate: checkoutModel.endDate,
        type: type,
        status: checkoutModel.status,
        price: checkoutModel.price,
        animals: checkoutModel.animals,
      ));
    }

    return Row(
      children: [
        Expanded(
          child: CheckboxListTile(
            value: _isChecked,
            title: const Text('Отстрел'),
            tileColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
              side: const BorderSide(color: Colors.grey),
            ),
            activeColor: APPBARCOLOR,
            onChanged: (value) {
              setState(() {
                _isChecked = value!;
              });
              if (value!) {
                updateCheckoutModel(0);
              }
            },
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: CheckboxListTile(
            value: !_isChecked,
            title: const Text('Отлов'),
            tileColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
              side: const BorderSide(color: Colors.grey),
            ),
            activeColor: APPBARCOLOR,
            onChanged: (value) {
              setState(() {
                _isChecked = !value!;
              });
              if (value!) {
                updateCheckoutModel(1);
              }
            },
          ),
        )
      ],
    );
  }
}
