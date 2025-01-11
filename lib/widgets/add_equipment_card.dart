import 'package:flutter/material.dart';
import 'package:workout_planner_app/utils/colors.dart';
import 'package:workout_planner_app/utils/responsive.dart';

class AddEquipmentCard extends StatefulWidget {
  final String equipmentTitle;
  final String equipmentImgUrl;
  final String equipmentDescription;
  final int noOfMinutes;
  final double noOfCalories;
  final void Function() toggleAddEquipment;
  final bool isAdded;
  final void Function() addFavoriteEquipment;
  final bool isFavAdded;

  const AddEquipmentCard({
    super.key,
    required this.equipmentTitle,
    required this.equipmentImgUrl,
    required this.equipmentDescription,
    required this.noOfMinutes,
    required this.noOfCalories,
    required this.toggleAddEquipment,
    required this.isAdded,
    required this.addFavoriteEquipment,
    required this.isFavAdded,
  });

  @override
  State<AddEquipmentCard> createState() => _AddEquipmentCardState();
}

class _AddEquipmentCardState extends State<AddEquipmentCard> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          // ignore: deprecated_member_use
          colors: [kCardColor, kDoneButongColor2.withOpacity(0.6)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: kCardColor2.withOpacity(0.4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding,
          vertical: kDefaultPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.equipmentTitle,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: kMainBlackColor,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  widget.equipmentImgUrl,
                  width: 110,
                  height: 110,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: 220,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.equipmentDescription,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                          color: kDateColor,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Time: ${widget.noOfMinutes.toString()} min and ${widget.noOfCalories.toString()} burned",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          color: kHandOverdButtonColor,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: kExerciseCardColor,
                  ),
                  child: IconButton(
                    onPressed: () {
                      widget.toggleAddEquipment();
                    },
                    icon: Icon(
                      widget.isAdded ? Icons.remove : Icons.add,
                      size: 35,
                      color: kCardColor2,
                    ),
                  ),
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: kExerciseCardColor,
                  ),
                  child: IconButton(
                    onPressed: () {
                      widget.addFavoriteEquipment();
                    },
                    icon: Icon(
                      widget.isFavAdded ? Icons.favorite : Icons.favorite_border,
                      size: 35,
                      color: kDoneButongColor2,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
