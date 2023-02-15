import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/permission_provider.dart';
import '../widgets/adress_block_detail_screen.dart';
import '../widgets/back_button_detail_screen.dart';
import '../widgets/button_detail_screen.dart';
import '../widgets/date_block_detail_screen.dart';
import '../widgets/name_qr_detail_screen.dart';
import '../widgets/status_block_detail_screen.dart';
import '../widgets/table_detail_screen.dart';
import 'home_page.dart';
import 'permission_detail_page.dart';

class PermissionDetail extends StatelessWidget {
  final int id;
  const PermissionDetail({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    print(id);
    final permession = Provider.of<PermissonProvider>(context).findById(id);
    print(permession.friendId);
    void goToBack() {
      PermissionDetailPageState().backButton();
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const HomePage()),
          (Route<dynamic> route) => false);
    }

    return WillPopScope(
      onWillPop: () async {
        goToBack();
        return false;
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButtonDetailScreen(permession: permession),
              if (permession.status != 'active' || permession.dontSend)
                StatusBlockDetailScreen(permession: permession),
              const SizedBox(height: 15),
              NameQrBlockDetailScreen(permession: permession),
              const SizedBox(height: 25),
              AdressBlockDetailScreen(permession: permession),
              const SizedBox(height: 15),
              TableDetailScreen(permession: permession),
              const SizedBox(height: 30),
              DateBlockDetailScreen(permession: permession),
              const SizedBox(height: 15),
              if (permession.status != 'canceled')
                ButtonsDetailsScreen(permession: permession),
              const SizedBox(height: 18),
            ],
          ),
        ),
      ),
    );
  }
}
