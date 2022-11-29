import 'package:flutter/material.dart';

import '../models/permission_model.dart';

class AdressBlockDetailScreen extends StatelessWidget {
  const AdressBlockDetailScreen({
    Key? key,
    required this.permession,
  }) : super(key: key);

  final PermissionModel permession;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Регион добычи',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 15),
        permession.dontSend || permession.status == 'active'
            ? Container(
                padding: const EdgeInsets.all(3),
                width: double.infinity,
                child: TextFormField(
                  initialValue: permession.address,
                  textAlign: TextAlign.left,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  maxLines: 1,
                ),
              )
            : Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(255, 224, 224, 224),
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(permession.address),
              ),
      ],
    );
  }
}
