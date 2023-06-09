import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sweet_home/routes/routes.dart';

// ignore: must_be_immutable
class ManagementItem extends StatelessWidget {
  final int index;

  static Map<String, String> managementItems = {
    'واحد ها': '🏢',
    'کارکنان': '👨🏻‍💻',
    'هزینه ها': '💰',
    'شارژ ماهیانه و قبوض': '📘',
  };

  var managementItemList = managementItems.entries.toList();

  ManagementItem({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () async {
        switch (index) {
          case 0:
            Get.toNamed(AppRoutes.unitPage);
            break;
          case 1:
            Get.toNamed(AppRoutes.staffPage);
            break;
          case 2:
            Get.toNamed(AppRoutes.costsPage);
            break;
          case 3:
            Get.toNamed(AppRoutes.chargePage);
            break;
          default:
            break;
        }
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xffF6F7F9),
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Color(0xffF6F7F9),
              offset: Offset(0, -1),
            ),
            BoxShadow(
              color: Color(0xffF6F7F9),
              offset: Offset(0, 1),
            ),
            BoxShadow(
              color: Color(0xffF6F7F9),
              offset: Offset(1, 0),
            ),
            BoxShadow(
              color: Color(0xffF6F7F9),
              offset: Offset(-1, 0),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              managementItemList[index].value,
              style: const TextStyle(fontSize: 50),
            ),
            const SizedBox(height: 12),
            Text(
              managementItemList[index].key,
              textAlign: TextAlign.center,
              style: textTheme.bodySmall!.copyWith(fontSize: 19),
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}
