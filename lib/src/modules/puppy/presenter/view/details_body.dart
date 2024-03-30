import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery/src/commons/presenter/components/loaders_indicators.dart';
import 'package:gallery/src/modules/puppy/presenter/components/price_n_button_bar.dart';
import 'package:gap/gap.dart';
import '../../domain/entities/puppy_details_entity.dart';
import '../components/info_icons.dart';

var description = "Entre em contato com o Canil para mais informações.";

class PuppyDetailsBody extends StatelessWidget {
  final PuppyDetailsEntity? puppy;

  const PuppyDetailsBody({
    super.key,
    this.puppy,
  });

  // bool _zero = false;

  // factory PuppyDetailsBody.zero(this._zero = true)=>

  @override
  Widget build(BuildContext context) {
    if (puppy == null) {
    } else {}

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (puppy == null)
            const SizedBox(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OnlyGifPlaceholderLoadingWidget(),
                  Text('Fotos do filhote')
                ],
              ),
            )
          else
            PuppyCarroulsel(puppy: puppy!),
          // Image.network(entity.images.first, height: 400,),
          // ImgsCarouselComponent(
          //   height: 400,
          //   pictures: entity.images,
          // ),
          const Gap(8),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (puppy == null)
                    Text(
                      'Preço em BRL',
                      style: DefaultTextStyle.of(context).style.copyWith(
                            fontSize: 28,
                            fontWeight: FontWeight.w200,
                            fontStyle: FontStyle.italic,
                          ),
                    ),
                  if (puppy != null)
                    PriceWidgetDetailsPage(
                      puppy: puppy!,
                    ),
                  TalkToKennelWidgetDetailsPage(puppy: puppy),
                ],
              )),
          const Gap(16),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Divider(),
          ),
          puppy != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22.0),
                  child: Text(
                    description,
                    style: DefaultTextStyle.of(context)
                        .style
                        .copyWith(fontSize: 16),
                  ),
                )
              :  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    'Espaço aberto para descrição ou informações adicionais, assim como texto para aprimorar o marketing.',
                    style: DefaultTextStyle.of(context)
                        .style
                        .copyWith(fontSize: 16),
                  ),
                ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Divider(),
          ),
          const Gap(16),
          InfoIconsComponent(puppy: puppy),
        ],
      ),
    );
  }
}

class PuppyCarroulsel extends StatelessWidget {
  const PuppyCarroulsel({
    super.key,
    required this.puppy,
  });

  final PuppyDetailsEntity puppy;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: PageView(
        allowImplicitScrolling: true,
        children: puppy.images.map(
          (i) {
            return CachedNetworkImage(
              imageUrl: i,
              fit: BoxFit.cover,
              placeholderFadeInDuration: Duration.zero,
              fadeOutDuration: Duration.zero,
              fadeInDuration: Duration.zero,
              placeholder: (c, s) => Container(
                color: const Color.fromRGBO(205, 225, 234, 1),
                child: const ImagePlaceholderLoadingWidget(),
              ),
              errorWidget: (_, __, ___) => Center(
                child: Icon(
                  CupertinoIcons.exclamationmark_triangle_fill,
                  color: Colors.red.shade300,
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
