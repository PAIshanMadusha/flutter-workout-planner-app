import 'package:flutter/material.dart';
import 'package:workout_planner_app/utils/colors.dart';
import 'package:workout_planner_app/utils/responsive.dart';

class ProfileEquipmentExerciseCard extends StatefulWidget {
  final String title;
  final String imgUrl;
  final void Function() markAsDone;

  const ProfileEquipmentExerciseCard({
    super.key,
    required this.title,
    required this.imgUrl,
    required this.markAsDone,
  });

  @override
  State<ProfileEquipmentExerciseCard> createState() =>
      _ProfileEquipmentExerciseCardState();
}

class _ProfileEquipmentExerciseCardState
    extends State<ProfileEquipmentExerciseCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      width: MediaQuery.of(context).size.width * double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [kCardColor2, kCardColor],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              widget.imgUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w900,
                color: kMainWhiteColor,
              ),
            ),
            SizedBox(
              width: 40,
            ),
            IconButton(
              onPressed: () {
                widget.markAsDone();
              },
              icon: Icon(
                Icons.check,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
