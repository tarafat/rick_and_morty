import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/core/app_core.dart';
import 'package:rick_and_morty/gen/assets.gen.dart';
import 'package:rick_and_morty/gen/colors.gen.dart';
import 'package:rick_and_morty/layers/domain/entities/character.dart';
import 'package:rick_and_morty/layers/presenation/cast_detail/view/widget/cartoon_detail.dart';
import 'package:rick_and_morty/layers/presenation/common_widgets/backgroud_image.dart';
import 'package:rick_and_morty/layers/presenation/common_widgets/custom_appbar.dart';

final class CartoonDetailsScreen extends StatelessWidget {
  const CartoonDetailsScreen({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        BackgroudImage(),
        Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.black.withOpacity(0.7),
          appBar: CustomAppBar(),
          body: ListView(
            padding: EdgeInsets.all(10.r),
            children: [
              UIUtil.verticalSpace(.18.sh),
              Column(
                children: [
                  // Cartoon Name Section
                  Text(character.name ?? "",
                      style: TextFontStyle.title20SFPro25W600),
                  UIUtil.verticalSpaceMedium,

                  // Cartoon Image Section
                  buildImageSection(character.image ?? ""),
                  UIUtil.verticalSpaceMedium,

                  // Cartoon Information Section
                  buildCartoonInformationSection(character),
                ],
              ),
              UIUtil.verticalSpaceMedium,

              // Cartoon Origin Section
              CartonDetails(
                icon: Assets.images.origin,
                title: Strings.titleOrigin,
                subTitle: character.origin?.name ?? "",
                subIcon: Assets.images.route,
              ),
              UIUtil.verticalSpaceMedium,

              // // Cartoon Location Section
              CartonDetails(
                icon: Assets.images.location,
                title: Strings.titleLocation,
                subTitle: character.location?.name ?? "",
                subIcon: Assets.images.route,
              ),
              UIUtil.verticalSpaceMedium,
            ],
          ),
        ),
      ],
    );
  }

  Widget buildCartoonInformationSection(Character character) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // status
        CartonDetails(
            icon: Assets.images.status,
            title: Strings.titleStatus,
            subTitle: character.isAlive
                ? Strings.titleStatusAlvie
                : Strings.titleStatusDead),
        // species
        CartonDetails(
            icon: Assets.images.species,
            title: Strings.titleSpecies,
            subTitle: character.species),
        // Gender
        CartonDetails(
            icon: Assets.images.gender,
            title: Strings.titleGender,
            subTitle: character.gender),
      ],
    );
  }

  Container buildImageSection(String imageUrl) {
    return Container(
      padding: EdgeInsets.all(20.r),
      height: ScreenUtil().orientation == Orientation.portrait ? 210.h : .4.sh,
      width: ScreenUtil().orientation == Orientation.portrait ? 200.w : .25.sw,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          border: Border.all(width: 1.0, color: AppColors.secondaryColor)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(.3.r),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          placeholder: (context, url) => Utils.imageSimmerCached(.2.sw),
          errorWidget: (context, url, error) => Utils.imageNotFound(.2.sw),
        ),
      ),
    );
  }
}
