import 'package:flutter/material.dart';

import '../models/permission_model.dart';

class DateBlockDetailScreen extends StatefulWidget {
  const DateBlockDetailScreen({
    Key? key,
    required this.permession,
  }) : super(key: key);

  final PermissionModel permession;

  @override
  State<DateBlockDetailScreen> createState() => _DateBlockDetailScreenState();
}

class _DateBlockDetailScreenState extends State<DateBlockDetailScreen> {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  void pickDate(BuildContext context) {
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

  @override
  Widget build(BuildContext context) {
    DateTime startDate = widget.permession.startDate;
    DateTime endDate = widget.permession.endDate;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Срок проведения добычи животных',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 15),
        InkWell(
          onTap: widget.permession.status == 'active' &&
                  !widget.permession.dontSend
              ? () => pickDate(context)
              : null,
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
                        '${startDate.day}.${startDate.month}.${startDate.year} - ${endDate.day}.${endDate.month}.${endDate.year}'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
