import 'package:flutter/material.dart';
import 'package:gallery/gen/assets.gen.dart';
import 'package:gallery/src/modules/puppy/domain/entities/pet_details.dart';
import 'package:gallery/src/modules/puppy/presenter/formatters/gender_from_int.dart';
import 'package:gap/gap.dart';

import '../formatters/birth_date.dart';
import '../formatters/microchip.dart';
import '../formatters/vaccines.dart';
import '../formatters/vermifuges.dart';

const fontSize = 17.0;

class InfoIconsComponent extends StatelessWidget {
  const InfoIconsComponent({
    super.key,
    required this.puppyDetails,
  });

  final PuppyDetailsEntity puppyDetails;

  @override
  Widget build(BuildContext context) {
    var gender = GenderFromIntFormatter().call(puppyDetails.gender);
    // var vaccines = VaccinesFormatter().call(puppyDetails.vaccines);
    // var vermifuges = VermifugesFormatter().call(puppyDetails.vermifuges);
    var microchip = MicrochipFormatter().call(puppyDetails.microchip);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        children: [
          InfoWithIconWidget(
            icon: Tooltip(
              preferBelow: false,
              message: 'Raça do filhote',
              child: Icon(
                Icons.pets,
                color: Colors.brown.shade400,
              ),
            ),
            child: RichText(
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                  text: 'Raça: ',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: fontSize,
                  ),
                  children: [
                    TextSpan(
                      text: puppyDetails.breed,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const TextSpan(text: '.'),
                  ]),
            ),
          ),
          const Gap(4),
          InfoWithIconWidget(
            icon: Tooltip(
              preferBelow: false,
              message: 'Gênero do filhote',
              child: gender.icon,
            ),
            child: RichText(
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                  text: 'Gênero: ',
                  style:
                      const TextStyle(color: Colors.black, fontSize: fontSize),
                  children: [
                    TextSpan(
                        text: gender.text,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    const TextSpan(text: '.'),
                  ]),
            ),
          ),
          const Gap(4),
          InfoWithIconWidget(
            icon: Tooltip(
              preferBelow: false,
              message: 'Data de nascimento',
              child: Icon(
                Icons.cake_rounded,
                color: Colors.pink.shade100,
              ),
            ),
            child: RichText(
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                text: 'Nascimento: ',
                style: const TextStyle(color: Colors.black, fontSize: fontSize),
                children: [
                  TextSpan(
                    text: BirthDateFormatter().call(puppyDetails.birth),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const TextSpan(text: '.'),
                ],
              ),
            ),
          ),
          const Gap(4),
          /*InfoWithIconWidget(
            icon: Tooltip(
              preferBelow: false,
              message: 'Histórico de vacinação',
              child: SizedBox(
                height: 24,
                child: Assets.icons.drugMedecineSyringueIcon
                    .image(height: 24, color: Colors.red.shade300),
              ),
            ),
            child: RichText(
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                text: 'Vacinas: ',
                style: const TextStyle(color: Colors.black, fontSize: fontSize),
                children: [
                  TextSpan(
                    text: '${vaccines.amount}x ',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: vaccines.brand,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const TextSpan(text: '.'),
                ],
              ),
              // child: Text(formatVaccinationRecordUsecase(
              //     pet.vaccineRecord)),
            ),
          ),
          const Gap(4),
          InfoWithIconWidget(
            icon: Tooltip(
              preferBelow: false,
              message: 'Vermífugos aplicados',
              child: SizedBox(
                  height: 24,
                  child: Icon(
                    Icons.bug_report,
                    color: Colors.green.shade300,
                  )),
            ),
            child: RichText(
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                text: 'Vermífugos: ',
                style: const TextStyle(color: Colors.black, fontSize: fontSize),
                children: [
                  TextSpan(
                    text: '${vermifuges.amount}x ',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: vermifuges.brand,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const TextSpan(text: '.'),
                ],
              ),
              // child: Text(formatVaccinationRecordUsecase(
              //     pet.vaccineRecord)),
            ),
          ),*/
          const Gap(4),
          InfoWithIconWidget(
            icon: Tooltip(
              preferBelow: false,
              message: 'Genética | Linhagem',
              child: SizedBox(
                height: 24,
                child: Assets.icons.cpu
                    .image(height: 24, color: Colors.amber.shade300),
              ),
            ),
            child: RichText(
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                text: 'Microchip: ',
                style: const TextStyle(color: Colors.black, fontSize: fontSize),
                children: [
                  TextSpan(
                    text: microchip,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const TextSpan(text: '.'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InfoWithIconWidget extends StatelessWidget {
  const InfoWithIconWidget({
    super.key,
    required this.child,
    required this.icon,
  });

  final Widget child;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(flex: 1, child: icon),
        Gap(18),
        Flexible(flex: 4, child: child),
      ],
    );
  }
}
