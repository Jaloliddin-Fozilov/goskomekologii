import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goskomekologii/screens/checkout_page.dart';
import 'package:provider/provider.dart';

import '../providers/permission_provider.dart';
import '../services/contants.dart';
import '../widgets/permission_item.dart';

enum _Tab { current, archive }

class PermessionsPage extends StatefulWidget {
  const PermessionsPage({super.key});

  @override
  State<PermessionsPage> createState() => _PermessionsPageState();
}

class _PermessionsPageState extends State<PermessionsPage> {
  _Tab _selectedTab = _Tab.current;

  @override
  Widget build(BuildContext context) {
    final permessionProvider = Provider.of<PermissonProvider>(context);

    return Column(
      children: [
        const SizedBox(height: 10),
        CupertinoSegmentedControl<_Tab>(
          selectedColor: APPBARCOLOR,
          borderColor: const Color.fromRGBO(234, 233, 238, 1),
          pressedColor: Colors.transparent,
          unselectedColor: Colors.white,
          children: {
            _Tab.current: Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: Text(
                'Текущие',
                style: TextStyle(
                  fontSize: 16,
                  color: _selectedTab == _Tab.current
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
            _Tab.archive: Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: Text(
                'Архивные',
                style: TextStyle(
                  fontSize: 16,
                  color: _selectedTab == _Tab.archive
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
          },
          onValueChanged: (value) {
            setState(() {
              _selectedTab = value;
            });
          },
          groupValue: _selectedTab,
        ),
        const SizedBox(height: 10),
        Builder(
          builder: (context) {
            switch (_selectedTab) {
              case _Tab.current:
                return Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: permessionProvider.currentList.length,
                          itemBuilder: (ctx, i) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: PermissionItem(
                              id: permessionProvider.currentList[i].id,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () => Navigator.of(context)
                                .pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const CheckoutPage()),
                                    (Route<dynamic> route) => false),
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(18, 158, 83, 1),
                            ),
                            child: const Text('Оформить разрешение'),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                );
              case _Tab.archive:
                return Expanded(
                  child: ListView.builder(
                    itemCount: permessionProvider.list.length,
                    itemBuilder: (ctx, i) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: PermissionItem(
                        id: permessionProvider.list[i].id,
                      ),
                    ),
                  ),
                );
            }
          },
        ),
      ],
    );
  }
}
