import 'package:flutter/material.dart';
import 'package:goskomekologii/screens/checkout_page.dart';
import 'package:goskomekologii/services/contants.dart';

class CheckoutEdit extends StatelessWidget {
  const CheckoutEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Оформление разрешения',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text('Выберите тип разрешения'),
                  const SizedBox(height: 10),
                  Row(
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
                  ),
                  const SizedBox(height: 10),
                  const Text('Регион добычи'),
                  const SizedBox(height: 10),
                  const CheckoutDropdown(),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const CheckoutPage()),
                  )),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(18, 158, 83, 1),
              ),
              child: const Text('Сохранить'),
            ),
          ),
        ),
      ],
    );
  }
}

class CheckoutDropdown extends StatefulWidget {
  const CheckoutDropdown({
    Key? key,
  }) : super(key: key);

  @override
  State<CheckoutDropdown> createState() => _CheckoutDropdownState();
}

class _CheckoutDropdownState extends State<CheckoutDropdown> {
  late String _selectedRegion;
  List<String> _regions = [
    "Ташкентская область",
    "Ташкентская область1",
    "Ташкентская область2"
  ];

  @override
  void initState() {
    _selectedRegion = _regions.first;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: _regions.map((region) {
        return DropdownMenuItem(
          value: region,
          child: Text(region),
        );
      }).toList(),
      onChanged: (region) {
        setState(() {
          _selectedRegion = region!;
        });
      },
      value: _selectedRegion,
    );
  }
}
