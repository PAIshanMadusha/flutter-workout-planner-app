import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workout_planner_app/data/user_data.dart';
import 'package:workout_planner_app/models/equipment_model.dart';
import 'package:workout_planner_app/models/exercise_model.dart';
import 'package:workout_planner_app/utils/colors.dart';
import 'package:workout_planner_app/utils/responsive.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final DateFormat formetter = DateFormat('EEEE, MMMM');
  final DateFormat dayFormetter = DateFormat('dd');

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = formetter.format(now);
    String formattedDay = dayFormetter.format(now);

    final userData = user;

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
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    color: kMainBlackColor,
                  ),
                ),
                SizedBox(
                  height: sizedBoxValue,
                ),
                Text(
                  "Here are all your favorited workouts",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: kDoneButtonColor,
                  ),
                ),
                SizedBox(
                  height: sizedBoxValue,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: kDefaultPadding,
                    mainAxisSpacing: kDefaultPadding,
                  ),
                  itemCount: userData.favoriteExerciseList.length,
                  itemBuilder: (context, index) {
                    Exercise favExercise = userData.favoriteExerciseList[index];
                    return Card(
                      color: kExerciseCardColor,
                      child: Column(
                        children: [
                          Text(
                            favExercise.exerciseName,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                              color: kMainBlackColor,
                            ),
                          ),
                          Image.asset(
                            favExercise.exerciseImgUrl,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${favExercise.noOfMinutes.toString()} minutes",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              color: kHandOverdButtonColor2,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: sizedBoxValue,
                ),
                Text(
                  "Here are all your favorited equipments",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: kDoneButtonColor,
                  ),
                ),
                SizedBox(
                  height: sizedBoxValue,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: kDefaultPadding,
                    mainAxisSpacing: kDefaultPadding,
                    childAspectRatio: 16 / 25,
                  ),
                  itemCount: userData.favoriteEquipmentList.length,
                  itemBuilder: (context, index) {
                    Equipment favEquipment =
                        userData.favoriteEquipmentList[index];
                    return Card(
                      color: kExerciseCardColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            favEquipment.equipmentName,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                              color: kMainBlackColor,
                            ),
                          ),
                          Image.asset(
                            favEquipment.equipmentImgUrl,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            favEquipment.equipmentDescription,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: kCardColor2,
                            ),
                          ),
                          Text(
                            "${favEquipment.noOfMinutes.toString()} minutes",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              color: kHandOverdButtonColor2,
                            ),
                          ),
                        ],
                      ),
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
