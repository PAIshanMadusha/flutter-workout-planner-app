import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workout_planner_app/data/user_data.dart';
import 'package:workout_planner_app/models/equipment_model.dart';
import 'package:workout_planner_app/models/exercise_model.dart';
import 'package:workout_planner_app/utils/colors.dart';
import 'package:workout_planner_app/utils/responsive.dart';
import 'package:workout_planner_app/widgets/profile_equipment_exercise_card.dart';
import 'package:workout_planner_app/widgets/progress_card.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final DateFormat dateFormat = DateFormat('EEEE, MMMM');
  final DateFormat dayFormat = DateFormat('dd');

  final userData = user;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = dateFormat.format(now);
    String formattedDay = dayFormat.format(now);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding,
              vertical: kDefaultPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$formattedDate $formattedDay",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: kDateColor,
                  ),
                ),
                Text(
                  "Hello, ${userData.fullName}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: sizedBoxValue,
                ),
                Text(
                  "Your Progress",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: kMainBlackColor,
                  ),
                ),
                ProgressCard(
                  progressValue: userData.calculateTotalCaloriesBurned(),
                  total: 10,
                ),
                SizedBox(
                  height: sizedBoxValue,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: kExerciseCardColor2,
                    boxShadow: [
                      BoxShadow(
                          color: kCardColor,
                          blurRadius: 2,
                          offset: Offset(1, 1)),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(kDefaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Minutes Spent: ${userData.calculateTotalMinutesSpent().toString()}",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: kMainBlackColor,
                          ),
                        ),
                        SizedBox(
                          height: sizedBoxValue,
                        ),
                        Text(
                          "Total Exercises Completed: ${userData.totalExercisesCompleted.toString()}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            color: kCardColor,
                          ),
                        ),
                        Text(
                          "Total Equipment Handovered: ${userData.totalEquipmentsHandOvered.toString()}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            color: kCardColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: sizedBoxValue,
                ),
                Text(
                  "Your Exercises",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: kMainBlackColor,
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: userData.exerciseList.length,
                  itemBuilder: (context, index) {
                    Exercise userExercise = userData.exerciseList[index];
                    return ProfileEquipmentExerciseCard(
                        title: userExercise.exerciseName,
                        imgUrl: userExercise.exerciseImgUrl,
                        markAsDone: () {
                          setState(() {
                            userData.markExerciseAsCompleted(userExercise.id);
                          });
                        });
                  },
                ),
                SizedBox(
                  height: sizedBoxValue,
                ),
                Text(
                  "Your Equipments",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: kMainBlackColor,
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: userData.equipmentList.length,
                  itemBuilder: (context, index) {
                    Equipment userEquipment = userData.equipmentList[index];
                    return ProfileEquipmentExerciseCard(
                      title: userEquipment.equipmentName,
                      imgUrl: userEquipment.equipmentImgUrl,
                      markAsDone: () {
                        setState(() {
                          userData.markEquipmentAsHandovered(userEquipment.id);
                        });
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
