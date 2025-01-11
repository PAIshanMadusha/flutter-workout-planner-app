import 'package:flutter/material.dart';
import 'package:workout_planner_app/utils/colors.dart';
import 'package:workout_planner_app/utils/responsive.dart';

class EquipmentCard extends StatelessWidget {
  final String equipmentName;
  final String equipmentDescription;
  final String equipmentImgUrl;
  final int noOfMinutes;
  final double noOfCalories;
  const EquipmentCard({
    super.key,
    required this.equipmentName,
    required this.equipmentDescription,
    required this.equipmentImgUrl,
    required this.noOfMinutes,
    required this.noOfCalories,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          20,
        ),
        gradient: LinearGradient(
          colors: [kCardColor, kExerciseCardColor2],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding,
          vertical: kDefaultPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              equipmentName,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                  color: kMainBlackColor),
            ),
            SizedBox(
              height: sizedBoxValue,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  equipmentImgUrl,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${noOfMinutes.toString()} mins of Workout",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: kDoneButtonColor,
                      ),
                    ),
                    Text(
                      "${noOfCalories.toString()} Calories will Burn",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        color: kDoneButtonColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: sizedBoxValue,
            ),
            Text(
              equipmentDescription,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w100,
                color: kMainBlackColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
