import 'package:flutter/material.dart';
import 'package:workout_planner_app/utils/colors.dart';
import 'package:workout_planner_app/utils/responsive.dart';

class AddExerciseCard extends StatefulWidget {
  final String exercisesTitle;
  final String exercisesImgUrl;
  final int noOfMinutes;
  final void Function() toggleAddExercise;
  final bool isAdded;
  final void Function() addfavoriteExercise;
  final bool isFavAdded;


  const AddExerciseCard({
    super.key,
    required this.exercisesTitle,
    required this.exercisesImgUrl,
    required this.noOfMinutes, 
    required this.toggleAddExercise, 
    required this.isAdded, 
    required this.addfavoriteExercise,
    required this.isFavAdded,
  });

  @override
  State<AddExerciseCard> createState() => _AddExerciseCardState();
}

class _AddExerciseCardState extends State<AddExerciseCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 5),
      width: 240,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [kCardColor2, kExerciseCardColor2],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        boxShadow: [
          BoxShadow(
            color: kExerciseCardColor2,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: [
            Text(
              widget.exercisesTitle,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: kMainBlackColor,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Image.asset(
              widget.exercisesImgUrl,
              width: 130,
              height: 120,
              fit: BoxFit.cover,
            ),
            Text(
              "${widget.noOfMinutes.toString()} Minutes",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: kDateColor,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    // ignore: deprecated_member_use
                    color: kExerciseCardColor.withOpacity(0.90),
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        widget.toggleAddExercise();
                      },
                      icon: Icon(
                        widget.isAdded ?Icons.remove : Icons.add,
                        color: kDoneButtonColor,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    // ignore: deprecated_member_use
                    color: kExerciseCardColor.withOpacity(0.90),
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        widget.addfavoriteExercise();
                      },
                      icon: Icon(
                        widget.isFavAdded ? Icons.favorite : Icons.favorite_border,
                        color: kDoneButongColor2,
                        size: 30,
                      ),
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
