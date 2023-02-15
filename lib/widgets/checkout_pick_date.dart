import 'package:flutter/material.dart';
import 'package:goskomekologii/models/checkout_model.dart';
import 'package:goskomekologii/providers/checkout_provider.dart';
import 'package:provider/provider.dart';

class CheckoutPickDate extends StatefulWidget {
  const CheckoutPickDate({
    Key? key,
  }) : super(key: key);

  @override
  State<CheckoutPickDate> createState() => _CheckoutPickDateState();
}

class _CheckoutPickDateState extends State<CheckoutPickDate> {
  bool _initVisit = true;

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime(DateTime.now().year, DateTime.now().month + 2);

  void _firstPickDate(BuildContext context) {
    final provider = Provider.of<CheckoutProvider>(context, listen: false);
    final checkoutModel = provider.currentCheckout;
    showDatePicker(
            context: context,
            helpText: "Дата начала",
            initialDate: DateTime.now(),
            firstDate: DateTime(DateTime.now().year),
            lastDate: DateTime(DateTime.now().year, DateTime.now().month + 1),
            locale: const Locale('ru'))
        .then((pickedStartDate) {
      if (pickedStartDate != null) {
        startDate = pickedStartDate;
        provider.updateCheckout(CheckoutModel(
          regionId: checkoutModel.regionId,
          districtId: checkoutModel.districtId,
          startDate: startDate,
          endDate: endDate,
          type: checkoutModel.type,
          status: checkoutModel.status,
          price: checkoutModel.price,
          animals: checkoutModel.animals,
        ));
        showDatePicker(
                context: context,
                helpText: "Дата окончания",
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate:
                    DateTime(DateTime.now().year, DateTime.now().month + 2),
                locale: const Locale('ru'))
            .then((pickedEndDate) {
          if (pickedEndDate != null) {
            endDate = pickedEndDate;
            provider.updateCheckout(CheckoutModel(
              regionId: checkoutModel.regionId,
              districtId: checkoutModel.districtId,
              startDate: startDate,
              endDate: endDate,
              type: checkoutModel.type,
              status: checkoutModel.status,
              price: checkoutModel.price,
              animals: checkoutModel.animals,
            ));
            setState(() {});
          }
        });
      }
    });
  }

  void _secondPickDate(BuildContext context) {
    final provider = Provider.of<CheckoutProvider>(context, listen: false);
    final checkoutModel = provider.currentCheckout;
    showDatePicker(
            context: context,
            helpText: "Дата окончания",
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(DateTime.now().year, DateTime.now().month + 2),
            locale: const Locale('ru'))
        .then((pickedEndDate) {
      if (pickedEndDate != null) {
        endDate = pickedEndDate;
        provider.updateCheckout(CheckoutModel(
          regionId: checkoutModel.regionId,
          districtId: checkoutModel.districtId,
          startDate: startDate,
          endDate: endDate,
          type: checkoutModel.type,
          status: checkoutModel.status,
          price: checkoutModel.price,
          animals: checkoutModel.animals,
        ));
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final checkoutProvider =
        Provider.of<CheckoutProvider>(context, listen: false);
    CheckoutModel checkoutModel = checkoutProvider.currentCheckout;
    if (_initVisit) {
      startDate = checkoutModel.startDate;
      endDate = checkoutModel.endDate;
      _initVisit = false;
    }
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () => _firstPickDate(context),
            child: Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 224, 224, 224),
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Stack(
                children: [
                  const Icon(
                    Icons.calendar_month,
                    color: Colors.lightBlueAccent,
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                          '${startDate.day}.${startDate.month}.${startDate.year}'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: InkWell(
            onTap: () => _secondPickDate(context),
            child: Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 224, 224, 224),
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Stack(
                children: [
                  const Icon(
                    Icons.calendar_month,
                    color: Colors.lightBlueAccent,
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                          '${endDate.day}.${endDate.month}.${endDate.year}'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
