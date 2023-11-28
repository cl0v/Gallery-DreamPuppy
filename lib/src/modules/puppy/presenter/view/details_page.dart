import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery/design/colors.dart';
import 'package:gallery/gen/assets.gen.dart';
import 'package:gallery/src/commons/presenter/components/circular_loading.dart';
import 'package:gallery/src/modules/puppy/domain/entities/pet_details.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../domain/usecases/on_contact_canil_pressed.dart';
import '../formaters/birth_date.dart';

var l = [
  "https://devapigallery.blob.core.windows.net/cc5c276fa4f14adfb6392c9e52dcc4b3/07c1e718fd2f4995a3d91e7478f9838d.jpeg",
  "https://devapigallery.blob.core.windows.net/ae4888a3465944b382b30fa444eff6aa/e8c039d278654a3fa59653dbcf80cb71.jpeg",
  "https://devapigallery.blob.core.windows.net/fc424cb08670490fa5d7c698a4aacef0/d457a9e840df4a0fb7a913a98bca52c8.jpeg",
  "https://devapigallery.blob.core.windows.net/da6f39e9103c4ceaacc04e25cd12d2fb/209a4b96eb0649c8a9c224035b99b659.jpeg",
];

var breed = 'Labrador';
var gender = PetGender.male;
var idCanil = 0;
var microchip = false;

var description =
    "Um verdadeiro ladrão de chinelos, não pode dar bobeira que você sempre vai achar seu chinelo em cima do sofá.";

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
                  allowImplicitScrolling: true,
                  children: List<Widget>.generate(
                    l.length,
                    (index) => ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: borderRadius,
                        bottomRight: borderRadius,
                      ),
                      child: CachedNetworkImage(
                        placeholderFadeInDuration: Duration.zero,
                        fadeOutDuration: Duration.zero,
                        fadeInDuration: Duration.zero,
                        errorWidget: (_, __, ___) => Center(
                          child: Icon(
                            CupertinoIcons.exclamationmark_triangle_fill,
                            color: Colors.red.shade300,
                          ),
                        ),
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
                                letterSpacing: -2.5),
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
                              // fontStyle: FontStyle.normal,
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
              const Gap(12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  description,
                  style:
                      DefaultTextStyle.of(context).style.copyWith(fontSize: 16),
                ),
              ),
              const Gap(12),
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
                  message: 'Histórico de vacinação',
                  child: SizedBox(
                    height: 24,
                    child: Assets.icons.drugMedecineSyringueIcon
                        .image(height: 24, color: Colors.red.shade300),
                  ),
                ),
                child: RichText(
                  overflow: TextOverflow.fade,
                  text: const TextSpan(
                    text: 'Vacinas: ',
                    style: TextStyle(color: Colors.black, fontSize: fontSize),
                    children: [
                      TextSpan(
                        text: '2x ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: 'Pfizer',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: '.'),
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
                  overflow: TextOverflow.fade,
                  text: const TextSpan(
                    text: 'Vermífugos: ',
                    style: TextStyle(color: Colors.black, fontSize: fontSize),
                    children: [
                      TextSpan(
                        text: '2x ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: 'Pfizer',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: '.'),
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
                  message: 'Genética | Linhagem',
                  child: SizedBox(
                    height: 24,
                    child: Assets.icons.cpu
                        .image(height: 24, color: Colors.amber.shade300),
                  ),
                ),
                child: RichText(
                  text: TextSpan(
                    text: 'Microchip: ',
                    style: const TextStyle(
                        color: Colors.black, fontSize: fontSize),
                    children: [
                      TextSpan(
                        text: microchip ? 'incluso' : 'NÃO incluso',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const TextSpan(text: '.'),
                    ],
                  ),

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
