import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery/design/colors.dart';
import 'package:gallery/gen/assets.gen.dart';
import 'package:gallery/src/commons/presenter/components/circular_loading.dart';
import 'package:gallery/src/modules/details/domain/entities/pet_details.dart';
import 'package:gap/gap.dart';

import '../formaters/birth_date.dart';

var l = [
  "https://i.imgur.com/ajzXLgu.jpeg",
  "https://i.imgur.com/4nusSJC.jpeg",
  "https://i.imgur.com/jIFeQdT.jpeg"
];

var breed = 'Labrador';
var gender = PetGender.male;
// Adicionar a primeira imagem para carregamento mais rápido.
var firstImg = "https://i.imgur.com/ajzXLgu.jpeg";

@RoutePage()
class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key, this.petId = 0});

  final int petId;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  getGenderIcon(PetGender gen) => gen == PetGender.male
      ? Icon(Icons.male, color: Colors.blue.shade300)
      : Icon(Icons.female, color: Colors.pink.shade300);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return CupertinoPageScaffold(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height / 2.3,
                child: PageView(
                  children: List<Widget>.generate(
                    3,
                    (index) => ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                      child: CachedNetworkImage(
                        placeholderFadeInDuration: Duration.zero,
                        fadeOutDuration: Duration.zero,
                        fadeInDuration: Duration.zero,
                        placeholder: index == 0
                            ? (c, _) => Hero(
                                  tag: firstImg,
                                  child: CachedNetworkImage(
                                    imageUrl: firstImg,
                                    fit: BoxFit.cover,
                                    placeholder: (_, __) =>
                                        const ImageLoadingPlaceholder(),
                                  ),
                                )
                            : (_, __) =>
                                const ImageLoadingPlaceholder(), // OU um loading com um fundo bonito e intuitivo
                        imageUrl: l[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              const Gap(8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                        text: const TextSpan(
                            text: '',
                            style: TextStyle(
                              fontSize: 28,
                              color: Colors.black,
                              fontWeight: FontWeight.w200,
                              fontStyle: FontStyle.italic,
                            ),
                            children: [
                          TextSpan(
                            text: 'R\$ ',
                            style: TextStyle(
                                fontSize: 28,
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                letterSpacing: -3),
                          ),
                          TextSpan(
                            text: '3900',
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                              fontSize: 32,
                            ),
                          ),
                          TextSpan(
                            text: ',00',
                            style: TextStyle(
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ])),
                    CupertinoButton.filled(
                      onPressed: () {},
                      
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: const Text(
                        'Falar com Canil',
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(18),
              InfoWithIconWidget(
                icon: Tooltip(
                  preferBelow: false,
                  message: 'Raça do filhote',
                  child: Icon(
                    Icons.pets,
                    color: Colors.brown.shade100,
                  ),
                ),
                child: Text(
                  'Raça: $breed',
                ),
              ),
              const Gap(4),
              InfoWithIconWidget(
                icon: Tooltip(
                  preferBelow: false,
                  message: 'Gênero do filhote',
                  child: getGenderIcon(gender),
                ),
                child: Text(
                  'Gênero: ${gender.text}',
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
                child: Text(
                  BirthDateFormatter().call(DateTime(2023, 11, 12)),
                ),
              ),
              const Gap(4),
              InfoWithIconWidget(
                                icon: Tooltip(
                                  preferBelow: false,
                                  message: 'Genética | Linhagem',
                                  child: SizedBox(
                                      height: 24,
                                      child: 
                                      Assets.icons.cpu.image()
                                      
                                      ),
                                ),
                                child: Text(
                                  Placeholder().runtimeType.toString(),
                                ),
                              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageLoadingPlaceholder extends StatelessWidget {
  const ImageLoadingPlaceholder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: hexGreyBackgroundColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: const Center(
        child: CircularLoadingWidget(),
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
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Flexible(flex: 1, child: icon),
        Flexible(
          flex: 4,
          child: Row(
            children: [
              const VerticalDivider(),
              const SizedBox(
                width: 12,
              ),
              child
            ],
          ),
        ),
      ],
    );
  }
}
