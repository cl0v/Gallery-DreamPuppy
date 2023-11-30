import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/src/modules/puppy/domain/entities/pet_details.dart';
import 'package:gallery/src/modules/puppy/presenter/blocs/puppy_details_bloc.dart';
import 'package:gallery/src/modules/puppy/presenter/components/price_n_button_bar.dart';
import 'package:gallery/src/modules/puppy/puppy_module.dart';
import 'package:gap/gap.dart';
import '../../data/datasource.dart';
import '../components/imgs_carousel.dart';
import '../components/info_icons.dart';

var description =
    "Um verdadeiro ladrão de chinelos, não pode dar bobeira que você sempre vai achar seu chinelo em cima do sofá.";

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key, required this.petId});

  final int petId;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final bloc = PuppyDetailsBloc(
    FetchPuppyLoadingState(),
    datasource: puppyIoC.get<PuppyDetailsDatasource>(),
  );

  @override
  void initState() {
    bloc.add(FetchPuppyEvent(id: widget.petId));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        previousPageTitle: 'Galeria',
        automaticallyImplyLeading: true,
        middle: Text('Detalhes'),
      ),
      child: SafeArea(
        child: BlocBuilder<PuppyDetailsBloc, PuppyDetailsState>(
            bloc: bloc,
            builder: (context, snapshot) {
              switch (snapshot.runtimeType) {
                case FetchPuppyLoadingState:
                  return Container();
                case FetchPuppySuccessState:
                  var puppy = (snapshot as FetchPuppySuccessState).entity;
                  return _SuccessBody(puppy);
                default:
                  return Container();
              }
            }),
      ),
    );
  }
}

class _SuccessBody extends StatelessWidget {
  const _SuccessBody(this.puppy);
  final PuppyDetailsEntity puppy;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImgsCarouselComponent(
            height: size.height / 2.3,
            pictures: puppy.images,
          ),
          const Gap(8),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: PriceAndButtonBarComponent(puppy: puppy)),
          const Gap(12),
          description.isEmpty
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    description,
                    style: DefaultTextStyle.of(context)
                        .style
                        .copyWith(fontSize: 16),
                  ),
                )
              : const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Divider(),
                ),
          const Gap(12),
          InfoIconsComponent(puppyDetails: puppy),
        ],
      ),
    );
  }
}
