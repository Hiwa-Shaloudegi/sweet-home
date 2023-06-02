import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_sweet/controllers/charge_controller.dart';
import 'package:home_sweet/widgets/empty_state.dart';

import '../../widgets/fab.dart';
import 'widgets/charge_bottomsheet.dart';

class ChargePage extends StatelessWidget {
  ChargePage({super.key});

  var chargeController = Get.put(ChargeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: Fab(
        onPressed: () {
          sbowChargeFormBottomSheet(context);
          //TODO:resetForm()
          // .then(
          //   (value) => unitFormController.resetForm(),
          // );
        },
      ),
      body: GetBuilder<ChargeController>(builder: (chargeController) {
        if (chargeController.allCharges.isEmpty) {
          return EmptyState(message: 'هیچ رسید شارژی ثبت نشده است.');
        } else {
          return Center(
            child: Text('CHARGES...'),
          );
        }
      }),
    );
  }
}