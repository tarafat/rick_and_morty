import 'package:dropdown_search/dropdown_search.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/core/app_core.dart';

import 'package:rick_and_morty/gen/colors.gen.dart';

import 'package:rick_and_morty/layers/presenation/all_cast/bloc/cast_bloc.dart';
import 'package:rick_and_morty/layers/presenation/all_cast/view/widget/character_list.dart';
import 'package:rick_and_morty/layers/presenation/common_widgets/backgroud_image.dart';
import 'package:rick_and_morty/layers/presenation/common_widgets/custom_appbar.dart';

import '../../common_widgets/headers.dart';

final class AllCharacterPage extends StatelessWidget {
  const AllCharacterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CastBloc(),
      child: CastScreen(),
    );
  }
}

class CastScreen extends StatefulWidget {
  CastScreen({super.key});

  @override
  State<CastScreen> createState() => _CastScreenState();
}

class _CastScreenState extends State<CastScreen> {
  String filterString = searchKey.first;
  final ScrollController _scrollController = ScrollController();
  CastBloc get pageBloc => context.read<CastBloc>();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    pageBloc.add(const FetchNextEvent());
  }

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
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.r),
            child: ListView(
              controller: _scrollController,
              children: <Widget>[
                UIUtil.verticalSpace(.03.sh),
                const Headers(
                    headerName: Strings.headerAllCast,
                    headerColor: AppColors.secondaryColor,
                    headerFontSize: 22),
                UIUtil.verticalSpaceSmall,
                //this is search field
                SearchField(border),
                UIUtil.verticalSpaceMedium,
                // all character list
                const AllcharacterList(),
              ],
            ),
          ),
        ),
        //  ),
      ],
    );
  }

  SizedBox SearchField(OutlineInputBorder border) {
    return SizedBox(
      height: 48,
      child: TextFormField(
        onChanged: (value) {
          pageBloc.add(SearchEvent({filterString: "\"" + value + "\""}));
        },
        decoration: InputDecoration(
          prefixIcon: Container(
            width: 120,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24),
                bottomLeft: Radius.circular(24),
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24),
                bottomLeft: Radius.circular(24),
              ),
              child: DropdownSearch<String>(
                popupProps: PopupProps.menu(),
                items: searchKey,
                onChanged: (value) {
                  filterString = value ?? searchKey.first;
                },
                selectedItem: filterString,
              ),
            ),
          ),
          fillColor: AppColors.grayColor,
          filled: true,
          hintText: Strings.searchHint,
          suffixIcon: Icon(Icons.search),
          hintStyle:
              const TextStyle(color: AppColors.secondaryColor, height: .8),
          enabledBorder: border,
          focusedBorder: border,
          errorBorder: border,
          border: border,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      pageBloc.add(const FetchNextEvent());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  var border = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(24)),
      borderSide: BorderSide.none);
}
