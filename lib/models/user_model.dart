import 'package:workout_planner_app/models/equipment_model.dart';
import 'package:workout_planner_app/models/exercise_model.dart';

class User {
  final String userId;
  final String fullName;
  final String gender;
  final String address;
  final int age;
  final String description;
  int totalExercisesCompleted = 0;
  int totalEquipmentsHandOvered = 0;

  final List<Exercise> exerciseList;
  final List<Equipment> equipmentList;

  final List<Exercise> favoriteExerciseList;
  final List<Equipment> favoriteEquipmentList;

  User({
    required this.userId,
    required this.fullName,
    required this.gender,
    required this.address,
    required this.age,
    required this.description,
    required this.exerciseList,
    required this.equipmentList,
    required this.favoriteExerciseList,
    required this.favoriteEquipmentList,
  });
  
  //Exercises
  //Add to List
  void addExercise(Exercise exercise){
    exerciseList.add(exercise);
  }
  //Remove from List
  void removeExercise(Exercise exercise){
    exerciseList.remove(exercise);
  }
  //Add to FavList
  void addFavList(Exercise exercise){
    favoriteExerciseList.add(exercise);
  }
  //Remove form favList
  void removeFavList(Exercise exercise){
    favoriteExerciseList.remove(exercise);
  }

  //Equipments
  //Add to List
  void addEquipment(Equipment equipment){
    equipmentList.add(equipment);
  }

  //Remove from List
  void removeEquipment(Equipment equipment){
    equipmentList.remove(equipment);
  }

  //Add to FavList
  void addEquipmentFavList(Equipment equipment){
    favoriteEquipmentList.add(equipment);
  }

  //Remove from FavList
  void removeEquipmentFavList(Equipment equipment){
    favoriteEquipmentList.remove(equipment);
  }

  //total Minutes
  int calculateTotalMinutesSpent(){

    int totalMinutes = 0;

    for(var exercise in exerciseList){
      totalMinutes += exercise.noOfMinutes;
    }
    
    for(var equipment in equipmentList){
      totalMinutes += equipment.noOfMinutes;
    }
    return totalMinutes;
  }

  //Mark an Exercise as Completed
  void markExerciseAsCompleted(int exerciseId){
    final exercise = exerciseList.firstWhere((exercise)=> exercise.id == exerciseId);
    exercise.completed = true;
    removeExercise(exercise);
    totalExercisesCompleted++;
  }

  //Mark an Equipment as Handovered
  void markEquipmentAsHandovered(int equipmentId){
    final equipment = equipmentList.firstWhere((equipment)=> equipment.id == equipmentId);
    equipment.handOvered = true;
    removeEquipment(equipment);
    totalEquipmentsHandOvered++;
  }

  //total calorios burned
  double calculateTotalCaloriesBurned(){

    double totalCaloriesBurned = 0;

    for(var equipment in equipmentList){
      totalCaloriesBurned += equipment.noOfCalories;
    }
    //Conver to value between 0 and 1
    if(totalCaloriesBurned > 0 && totalCaloriesBurned < 10){
      totalCaloriesBurned = totalCaloriesBurned / 10;
    }
    if(totalCaloriesBurned> 10 && totalCaloriesBurned < 100){
      totalCaloriesBurned = totalCaloriesBurned/ 100;
    }
    if(totalCaloriesBurned > 100 && totalCaloriesBurned < 1000){
      totalCaloriesBurned = totalCaloriesBurned/ 1000;
    }
    if(totalCaloriesBurned > 1000 && totalCaloriesBurned < 10000){
      totalCaloriesBurned = totalCaloriesBurned/ 10000;
    }
    return totalCaloriesBurned;
  }
}
