import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workout_planner_app/models/equipment_model.dart';
import 'package:workout_planner_app/utils/colors.dart';
import 'package:workout_planner_app/utils/responsive.dart';
import 'package:workout_planner_app/widgets/equipment_card.dart';

class EquipmentsPage extends StatefulWidget {
  final String title;
  final String description;
  final List<Equipment> equipmentList;

  const EquipmentsPage({
    super.key,
    required this.title,
    required this.description,
    required this.equipmentList,
  });

  @override
  State<EquipmentsPage> createState() => _EquipmentsPageState();
}

class _EquipmentsPageState extends State<EquipmentsPage> {
  final DateFormat formetter = DateFormat('EEEE, MMMM');
  final DateFormat dayFormat = DateFormat('dd');
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = formetter.format(now);
    String formattedDay = dayFormat.format(now);

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$formattedDate, $formattedDay",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: kDateColor,
              ),
            ),
            Text(
              widget.title,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 24,
                color: kMainBlackColor,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding,
            vertical: kDefaultPadding,
          ),
          child: Column(
            children: [
              Text(
                widget.description,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: kMainBlackColor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: sizedBoxValue,
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: kDefaultPadding,
                  mainAxisSpacing: kDefaultPadding,
                  childAspectRatio: 16/12
                ),
                itemCount: widget.equipmentList.length,
                itemBuilder: (context, index){
                  Equipment equipment = widget.equipmentList[index];
                  return EquipmentCard(
                    equipmentName: equipment.equipmentName,
                    equipmentImgUrl: equipment.equipmentImgUrl,
                    noOfMinutes: equipment.noOfMinutes,
                    noOfCalories: equipment.noOfCalories,
                    equipmentDescription: equipment.equipmentDescription,
                  );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
