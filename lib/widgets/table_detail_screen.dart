import 'package:flutter/material.dart';

import '../models/permission_model.dart';

class TableDetailScreen extends StatelessWidget {
  TableDetailScreen({
    Key? key,
    required this.permession,
  }) : super(key: key);

  final PermissionModel permession;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Птицы',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: permession.animals
                  .map(
                    (animal) => Container(
                      width: MediaQuery.of(context).size.width / 2.3,
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.symmetric(vertical: 3),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 228, 228, 228),
                        border: Border.all(
                          color: const Color.fromARGB(255, 172, 172, 172),
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(animal.name),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Куплено',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: permession.animals
                  .map(
                    (animal) => Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width / 6,
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.symmetric(vertical: 3),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 228, 228, 228),
                        border: Border.all(
                          color: const Color.fromARGB(255, 172, 172, 172),
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(animal.purchased.toString()),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Добыто',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 10),
            permession.dontSend || permession.status == 'active'
                ? Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: permession.animals
                          .map(
                            (animal) => Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(3),
                                  width: MediaQuery.of(context).size.width / 6,
                                  child: TextFormField(
                                    initialValue: animal.mined.toString(),
                                    textAlign: TextAlign.center,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(),
                                      ),
                                    ),
                                    keyboardType: TextInputType.number,
                                    maxLines: 1,
                                  ),
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: permession.animals
                        .map(
                          (animal) => Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width / 6,
                            padding: const EdgeInsets.all(20),
                            margin: const EdgeInsets.symmetric(vertical: 3),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 228, 228, 228),
                              border: Border.all(
                                color: const Color.fromARGB(255, 172, 172, 172),
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(animal.mined.toString()),
                          ),
                        )
                        .toList(),
                  ),
          ],
        ),
      ],
    );
  }
}
