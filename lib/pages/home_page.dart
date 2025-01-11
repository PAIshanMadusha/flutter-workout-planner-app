import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workout_planner_app/data/equipment_data.dart';
import 'package:workout_planner_app/data/exercise_data.dart';

import 'package:workout_planner_app/data/user_data.dart';
import 'package:workout_planner_app/pages/equipments_page.dart';
import 'package:workout_planner_app/pages/exercise_details_page.dart';
import 'package:workout_planner_app/utils/colors.dart';
import 'package:workout_planner_app/utils/responsive.dart';
import 'package:workout_planner_app/widgets/exercise_card.dart';
import 'package:workout_planner_app/widgets/progress_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Date and Time
  final DateFormat formetter = DateFormat('EEEE, MMMM');
  final DateFormat dayFormat = DateFormat('dd');

  //User Data
  final userData = user;

  //List Data
  final exerciseData = ExerciseData().exerciseList;
  final equipmentData = EquipmentData().equipmentList;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = formetter.format(now);
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
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    color: kMainBlackColor,
                  ),
                ),
                SizedBox(
                  height: sizedBoxValue,
                ),
                ProgressCard(progressValue: userData.calculateTotalCaloriesBurned(), total: 10),
                SizedBox(
                  height: sizedBoxValue,
                ),
                Text(
                  "Today’s Activity",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: kMainBlackColor,
                  ),
                ),
                SizedBox(
                  height: sizedBoxValue,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExerciseDetailsPage(
                              exerciseTitle: "Exercises",
                              exerciseDescription:
                                  "Exercise is any bodily activity that enhances or maintains physical fitness and overall health and wellness. It is performed for various reasons, including weight loss or maintenance, to aid growth and improve strength, develop muscles and the cardiovascular system, prevent injuries, hone athletic skills, improve health, or simply for enjoyment.",
                              exerciseList: exerciseData,
                            ),
                          ),
                        );
                      },
                      child: ExerciseCard(
                        title: "Exercises",
                        imageUrl: "assest/exercises/exercise2.png",
                        description: "See More...",
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EquipmentsPage(
                              title: "Equipment",
                              description:
                                  "Gym equipment is any apparatus or device used during physical activity to enhance the strength or conditioning effects of that exercise by providing either fixed or adjustable amounts of resistance, or to otherwise enhance the experience or outcome of an exercise routine.",
                              equipmentList: equipmentData,
                            ),
                          ),
                        );
                      },
                      child: ExerciseCard(
                        title: "Equipments",
                        imageUrl: "assest/equipments/gym.png",
                        description: "See More...",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: sizedBoxValue,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExerciseDetailsPage(
                              exerciseTitle: "Yoga",
                              exerciseDescription:
                                  "Yoga is a mind and body practice with origins in ancient India. It involves a variety of physical postures, breathing techniques, and meditation or relaxation practices.",
                              exerciseList: exerciseData,
                            ),
                          ),
                        );
                      },
                      child: ExerciseCard(
                        title: "Yoga",
                        imageUrl: "assest/exercises/yoga.png",
                        description: "See More...",
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExerciseDetailsPage(
                              exerciseTitle: "Stretching",
                              exerciseDescription:
                                  "Stretching is a form of exercise where you gently push a muscle to its fullest extension and hold it for a short period. Stretching can help improve your flexibility, range of motion, and muscle recovery.",
                              exerciseList: exerciseData,
                            ),
                          ),
                        );
                      },
                      child: ExerciseCard(
                        title: "Stretching",
                        imageUrl: "assest/exercises/stretching.png",
                        description: "See More...",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
