import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workout_planner_app/data/equipment_data.dart';
import 'package:workout_planner_app/data/exercise_data.dart';
import 'package:workout_planner_app/data/user_data.dart';
import 'package:workout_planner_app/models/equipment_model.dart';
import 'package:workout_planner_app/models/exercise_model.dart';
import 'package:workout_planner_app/utils/colors.dart';
import 'package:workout_planner_app/utils/responsive.dart';
import 'package:workout_planner_app/widgets/add_equipment_card.dart';
import 'package:workout_planner_app/widgets/add_exercise_card.dart';

class AddNewPage extends StatefulWidget {
  const AddNewPage({super.key});

  @override
  State<AddNewPage> createState() => _AddNewPageState();
}

class _AddNewPageState extends State<AddNewPage> {
  //Date
  final DateFormat dateFormetter = DateFormat('EEEE, MMMM');
  final DateFormat dayFormetter = DateFormat('dd');

  //user
  final userData = user;

  //ExerciseList
  final exerciseList = ExerciseData().exerciseList;

  //EquipmentList
  final equipmentList = EquipmentData().equipmentList;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String dateNow = dateFormetter.format(now);
    String dayNow = dayFormetter.format(now);

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
                  "$dateNow $dayNow",
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
                  "Let's Add Some Workouts & Equipment for Today",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: kDoneButtonColor,
                  ),
                ),
                Text(
                  "All Exercises",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: kMainBlackColor,
                  ),
                ),
                SizedBox(
                  height: sizedBoxValue,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: exerciseList.length,
                      itemBuilder: (context, index) {
                        Exercise exercise = exerciseList[index];
                        return AddExerciseCard(
                          exercisesTitle: exercise.exerciseName,
                          exercisesImgUrl: exercise.exerciseImgUrl,
                          noOfMinutes: exercise.noOfMinutes,
                          isAdded: userData.exerciseList.contains(exercise),
                          toggleAddExercise: () {
                            setState(() {
                              if (userData.exerciseList.contains(exercise)) {
                                userData.removeExercise(exercise);
                              } else {
                                userData.addExercise(exercise);
                              }
                            });
                          },
                          isFavAdded:
                              userData.favoriteExerciseList.contains(exercise),
                          addfavoriteExercise: () {
                            setState(() {
                              if (userData.favoriteExerciseList.contains(exercise)){
                                userData.removeFavList(exercise);
                              } else {
                                userData.addFavList(exercise);
                              }
                            });
                          },
                        );
                      }),
                ),
                SizedBox(
                  height: sizedBoxValue,
                ),
                Text(
                  "All Equipments",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: kMainBlackColor,
                  ),
                ),
                SizedBox(
                  height: sizedBoxValue,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.6,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: equipmentList.length,
                    itemBuilder: (context, index) {
                      Equipment equipment = equipmentList[index];
                      return AddEquipmentCard(
                        equipmentTitle: equipment.equipmentName,
                        equipmentImgUrl: equipment.equipmentImgUrl,
                        equipmentDescription: equipment.equipmentDescription,
                        noOfMinutes: equipment.noOfMinutes,
                        noOfCalories: equipment.noOfCalories,
                        isAdded: userData.equipmentList.contains(equipment),
                        toggleAddEquipment: () {
                          setState((){
                            if(userData.equipmentList.contains(equipment)){
                              userData.removeEquipment(equipment);
                            }else{
                              userData.addEquipment(equipment);
                            }
                          });
                        },
                        isFavAdded: userData.favoriteEquipmentList.contains(equipment),
                        addFavoriteEquipment: () {
                          setState((){
                            if(userData.favoriteEquipmentList.contains(equipment)){
                              userData.removeEquipmentFavList(equipment);
                            }else{
                              userData.addEquipmentFavList(equipment);
                            }
                          });
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
