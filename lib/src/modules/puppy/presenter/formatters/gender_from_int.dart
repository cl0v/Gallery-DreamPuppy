import 'package:flutter/material.dart';

class GenderFromIntFormatter {
  ({Icon icon, String text}) call(int gen) {
    var gender = getGenderFromInt(gen);
    var icon = getGenderIcon(gender);

    return (
      icon: icon,
      text: gender.text,
    );
  }
}

@visibleForTesting
Icon getGenderIcon(PetGender gen) => gen == PetGender.male
    ? Icon(
        Icons.male,
        color: Colors.blue.shade300,
      )
    : Icon(
        Icons.female,
        color: Colors.pink.shade300,
      );

@visibleForTesting
PetGender getGenderFromInt(int gen) {
  switch (gen) {
    case -1:
      return PetGender.female;
    case 1:
      return PetGender.male;
    default:
      return PetGender.female;
  }
}

enum PetGender {
  female('Fêmea'),
  male('Macho');

  const PetGender(this.text);

  final String text;
}
