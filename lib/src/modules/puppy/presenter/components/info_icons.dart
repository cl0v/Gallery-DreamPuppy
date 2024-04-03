import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gallery/gen/assets.gen.dart';
import 'package:gallery/src/modules/puppy/domain/entities/puppy_details_entity.dart';
import 'package:gallery/src/modules/puppy/presenter/formatters/gender_from_int.dart';
import 'package:gallery/src/modules/puppy/presenter/formatters/weight.dart';
import 'package:gap/gap.dart';

import '../formatters/birth_date.dart';
import '../formatters/microchip.dart';
import '../formatters/vaccines.dart';
import '../formatters/vermifuges.dart';

const fontSize = 17.0;

class InfoIconsComponent extends StatelessWidget {
  const InfoIconsComponent({
    super.key,
    required this.puppy,
  });

  final PuppyDetailsEntity? puppy;

  @override
  Widget build(
    BuildContext context,
  ) {
    var gender = GenderFromIntFormatter.call(puppy?.gender);
    var birth = BirthDateFormatter.call(puppy?.birth);
    var microchip = MicrochipFormatter.call(puppy?.microchip);
    var weight = WeightFormatter.call(puppy?.weight, puppy == null);
    // var vaccines = VaccinesFormatter().call(puppyDetails.vaccines);
    // var vermifuges = VermifugesFormatter().call(puppyDetails.vermifuges);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        children: [
          plotBreedWidget(context, puppy),
          const Gap(4),
          plotGenderWidget(context, gender),
          const Gap(4),
          plotWeightWidget(context, weight),
          const Gap(4),
          plotBirthWidget(context, birth),
          const Gap(4),
          plotVaccinesWidget(context, puppy),
          const Gap(4),
          plotVermifugesWidget(context, puppy),
          const Gap(4),
          plotMicrochipWidget(context, microchip),
        ],
      ),
    );
  }

  InfoWithIconWidget plotVaccinesWidget(
      BuildContext context, PuppyDetailsEntity? puppy) {
    String docsTxt =
        'Vacinas tomadas até o dia da entrega, próximas vacinas a consultar';
    String vacinnes = puppy == null ? docsTxt : 'Em breve';
    return InfoWithIconWidget(
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
        overflow: puppy != null ? TextOverflow.ellipsis : TextOverflow.visible,
        text: TextSpan(
          text: 'Vacinas: ',
          style: DefaultTextStyle.of(
            context,
          ).style.copyWith(fontSize: fontSize),
          children: [
            TextSpan(
              text: vacinnes,
              style: DefaultTextStyle.of(
                context,
              ).style.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            /*
                TextSpan(
                  text: '${vaccines.amount}x ',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: vaccines.brand,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                */
            const TextSpan(text: '.'),
          ],
        ),
        // child: Text(formatVaccinationRecordUsecase(
        //     pet.vaccineRecord)),
      ),
    );
  }

  InfoWithIconWidget plotBirthWidget(BuildContext context, String birth) {
    return InfoWithIconWidget(
      icon: Tooltip(
        preferBelow: false,
        message: 'Data de nascimento',
        child: Icon(
          Icons.cake_rounded,
          color: Colors.pink.shade100,
        ),
      ),
      child: RichText(
        overflow: puppy != null ? TextOverflow.ellipsis : TextOverflow.visible,
        text: TextSpan(
          text: 'Nascimento: ',
          style: DefaultTextStyle.of(
            context,
          ).style.copyWith(
                fontSize: fontSize,
              ),
          children: [
            TextSpan(
              text: birth,
              style: DefaultTextStyle.of(
                context,
              ).style.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const TextSpan(text: '.'),
          ],
        ),
      ),
    );
  }

  InfoWithIconWidget plotGenderWidget(
    BuildContext context,
    ({Icon icon, String text}) gender,
  ) {
    return InfoWithIconWidget(
      icon: Tooltip(
        preferBelow: false,
        message: 'Gênero do filhote',
        child: gender.icon,
      ),
      child: RichText(
        overflow: puppy != null ? TextOverflow.ellipsis : TextOverflow.visible,
        text: TextSpan(
            text: 'Gênero: ',
            style: DefaultTextStyle.of(
              context,
            ).style.copyWith(
                  fontSize: fontSize,
                ),
            children: [
              TextSpan(
                text: gender.text,
                style: DefaultTextStyle.of(
                  context,
                ).style.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const TextSpan(text: '.'),
            ]),
      ),
    );
  }

  InfoWithIconWidget plotBreedWidget(
    BuildContext context,
    PuppyDetailsEntity? puppy,
  ) {
    String breed =
        puppy == null ? 'Identificador da Raça do filhote' : puppy.breed;

    return InfoWithIconWidget(
      icon: Tooltip(
        preferBelow: false,
        message: 'Raça do filhote',
        child: Icon(
          Icons.pets,
          color: Colors.brown.shade400,
        ),
      ),
      child: RichText(
        overflow: puppy != null ? TextOverflow.ellipsis : TextOverflow.visible,
        text: TextSpan(
            text: 'Raça: ',
            style: DefaultTextStyle.of(
              context,
            ).style.copyWith(
                  fontSize: fontSize,
                ),
            children: [
              TextSpan(
                text: breed,
                style: DefaultTextStyle.of(
                  context,
                ).style.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const TextSpan(text: '.'),
            ]),
      ),
    );
  }

  InfoWithIconWidget plotVermifugesWidget(
    BuildContext context,
    PuppyDetailsEntity? puppy,
  ) {
    String docsTxt =
        'Vermífugos tomadas até o dia da entrega. Próximos a consultar';
    String vermifuges = puppy == null ? docsTxt : 'Em breve';
    return InfoWithIconWidget(
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
        overflow: puppy != null ? TextOverflow.ellipsis : TextOverflow.visible,
        text: TextSpan(
          text: 'Vermífugos: ',
          style: DefaultTextStyle.of(
            context,
          ).style.copyWith(fontSize: fontSize),
          children: [
            TextSpan(
              text: vermifuges,
              style: DefaultTextStyle.of(
                context,
              ).style.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            /*
                TextSpan(
                  text: '${vermifuges.amount}x ',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: vermifuges.brand,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                */
            const TextSpan(text: '.'),
          ],
        ),
        // child: Text(formatVaccinationRecordUsecase(
        //     pet.vaccineRecord)),
      ),
    );
  }

  InfoWithIconWidget plotMicrochipWidget(
      BuildContext context, String microchip) {
    return InfoWithIconWidget(
      icon: Tooltip(
        preferBelow: false,
        message: 'Microchip',
        child: SizedBox(
          height: 24,
          child:
              Assets.icons.cpu.image(height: 24, color: Colors.amber.shade300),
        ),
      ),
      child: RichText(
        overflow: puppy != null ? TextOverflow.ellipsis : TextOverflow.visible,
        text: TextSpan(
          text: 'Microchip: ',
          style: DefaultTextStyle.of(
            context,
          ).style.copyWith(
                fontSize: fontSize,
              ),
          children: [
            TextSpan(
              text: microchip,
              style: DefaultTextStyle.of(
                context,
              ).style.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const TextSpan(text: '.'),
          ],
        ),
      ),
    );
  }

  InfoWithIconWidget plotWeightWidget(BuildContext context, String weight) {
    return InfoWithIconWidget(
      icon: Tooltip(
        preferBelow: false,
        message: 'Última pesagem',
        child: SizedBox(
          height: 24,
          child: SvgPicture.asset(
            Assets.icons.weightIcon.toString(),
            colorFilter: const ColorFilter.mode(
              Colors.blueGrey,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
      child: RichText(
        overflow: puppy != null ? TextOverflow.ellipsis : TextOverflow.visible,
        text: TextSpan(
          text: 'Peso: ',
          style: DefaultTextStyle.of(
            context,
          ).style.copyWith(
                fontSize: fontSize,
              ),
          children: [
            TextSpan(
              text: weight,
              style: DefaultTextStyle.of(
                context,
              ).style.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const TextSpan(text: '.'),
          ],
        ),
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
  Widget build(
    BuildContext context,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(flex: 1, child: icon),
        const Gap(18),
        Flexible(flex: 4, child: child),
      ],
    );
  }
}
