import 'package:flutter/material.dart';

class CheckoutPickDate extends StatefulWidget {
  const CheckoutPickDate({
    Key? key,
  }) : super(key: key);

  @override
  State<CheckoutPickDate> createState() => _CheckoutPickDateState();
}

class _CheckoutPickDateState extends State<CheckoutPickDate> {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  void _firstPickDate(BuildContext context) {
    showDatePicker(
            context: context,
            helpText: "Дата начала",
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime(2023),
            locale: const Locale('ru'))
        .then((pickedStartDate) {
      if (pickedStartDate != null) {
        startDate = pickedStartDate;
        showDatePicker(
                context: context,
                helpText: "Дата окончания",
                initialDate: DateTime.now(),
                firstDate: DateTime(2022),
                lastDate: DateTime(2023),
                locale: const Locale('ru'))
            .then((pickedEndDate) {
          if (pickedEndDate != null) {
            endDate = pickedEndDate;
            setState(() {});
          }
        });
      }
    });
  }

  void _secondPickDate(BuildContext context) {
    showDatePicker(
            context: context,
            helpText: "Дата окончания",
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime(2023),
            locale: const Locale('ru'))
        .then((pickedEndDate) {
      if (pickedEndDate != null) {
        endDate = pickedEndDate;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
