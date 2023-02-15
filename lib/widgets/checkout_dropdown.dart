import 'package:flutter/material.dart';
import 'package:goskomekologii/models/checkout_model.dart';
import 'package:goskomekologii/providers/checkout_provider.dart';
import 'package:provider/provider.dart';

class CheckoutDropdown extends StatefulWidget {
  final bool isRegions;
  const CheckoutDropdown({
    required this.isRegions,
    Key? key,
  }) : super(key: key);

  @override
  State<CheckoutDropdown> createState() => _CheckoutDropdownState();
}

class _CheckoutDropdownState extends State<CheckoutDropdown> {
  late String _selectedItem;
  bool _initVisit = true;
  late CheckoutModel? checkoutModel;

  @override
  Widget build(BuildContext context) {
    final checkoutProvider = Provider.of<CheckoutProvider>(context);
    final list = widget.isRegions
        ? checkoutProvider.regions
        : checkoutProvider.districts;
    if (_initVisit) {
      _selectedItem = list.first;
      checkoutModel = checkoutProvider.currentCheckout;

      _initVisit = false;
    }

    void updateCheckoutModel(int value) {
      Provider.of<CheckoutProvider>(context, listen: false)
          .updateCheckout(CheckoutModel(
        regionId: widget.isRegions ? value : checkoutModel!.regionId,
        districtId: widget.isRegions ? checkoutModel!.districtId : value,
        startDate: checkoutModel!.startDate,
        endDate: checkoutModel!.endDate,
        type: checkoutModel!.type,
        status: checkoutModel!.status,
        price: checkoutModel!.price,
        animals: checkoutModel!.animals,
      ));
    }

    return DropdownButtonFormField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
      ),
      isExpanded: true,
      items: list.map((item) {
        return DropdownMenuItem(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: (item) {
        setState(() {
          _selectedItem = item!;
        });
        final index = list.indexWhere((element) => element == item);
        updateCheckoutModel(index);
      },
      value: _selectedItem,
    );
  }
}
