import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery/design/colors.dart';
import 'package:gallery/src/commons/presenter/components/circular_loading.dart';
import 'package:gallery/src/modules/details/domain/entities/pet_details.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../domain/usecases/on_contact_canil_pressed.dart';
import '../formaters/birth_date.dart';

var l = [
  "https://i.imgur.com/ajzXLgu.jpeg",
  "https://i.imgur.com/4nusSJC.jpeg",
  "https://i.imgur.com/jIFeQdT.jpeg"
];

var breed = 'Labrador';
var gender = PetGender.male;
var idCanil = 0;
var microchip = false;
// Adicionar a primeira imagem para carregamento mais rápido.
var firstImg = "https://i.imgur.com/ajzXLgu.jpeg";
var bornAt = DateTime(2023, 11, 12, 2);

const borderRadius = Radius.circular(10);
const fontSize = 17.0;

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key, required this.petId});

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
      navigationBar: const CupertinoNavigationBar(
        previousPageTitle: 'Galeria',
        automaticallyImplyLeading: true,
        middle: Text('Detalhes'),
      ),
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
                        bottomLeft: borderRadius,
                        bottomRight: borderRadius,
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
                            : (_, __) => const ImageLoadingPlaceholder(),
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
                    Semantics(
                      label: 'onGoToCanilPage',
                      child: CupertinoButton.filled(
                        onPressed: () async {
                          var usecase =
                              OnGetContactPressedUsecase().call(idCanil);
                          var shouldRedirect = false;
                          do {
                            shouldRedirect = await context.pushNamed<bool>(
                                  usecase.name,
                                  pathParameters: usecase.params,
                                  queryParameters: usecase.query,
                                ) ??
                                false;
                          } while (shouldRedirect);
                        },
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: const Text('Falar com Canil'),
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
                    color: Colors.brown.shade400,
                  ),
                ),
                child: RichText(
                  text: TextSpan(
                      text: 'Raça: ',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: fontSize,
                      ),
                      children: [
                        TextSpan(
                          text: breed,
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
                  child: getGenderIcon(gender),
                ),
                child: RichText(
                  text: TextSpan(
                      text: 'Gênero: ',
                      style: const TextStyle(
                          color: Colors.black, fontSize: fontSize),
                      children: [
                        TextSpan(
                            text: gender.text,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
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
                  text: TextSpan(
                      text: 'Nascimento: ',
                      style: const TextStyle(
                          color: Colors.black, fontSize: fontSize),
                      children: [
                        TextSpan(
                            text: BirthDateFormatter().call(bornAt),
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        const TextSpan(text: '.'),
                      ]),
                ),
              ),
              const Gap(4),
              InfoWithIconWidget(
                icon: Tooltip(
                  preferBelow: false,
                  message: 'Genética | Linhagem',
                  child: SizedBox(
                    height: 24,
                    child: Image.asset(
                      'assets/icons/cpu.png',
                      color: Colors.green.shade500,
                    ),
                  ),
                ),
                child: RichText(
                  text: TextSpan(
                      text: 'Microchip',
                      style: const TextStyle(
                          color: Colors.black, fontSize: fontSize),
                      children: [
                        microchip
                            ? const TextSpan(text: ' ')
                            : const TextSpan(
                                text: ' NÃO ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                        const TextSpan(text: 'incluso.'),
                      ]),

                  // const Placeholder().runtimeType.toString(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// load de imagem com um fundo bonito e intuitivo
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
          bottomLeft: borderRadius,
          bottomRight: borderRadius,
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
