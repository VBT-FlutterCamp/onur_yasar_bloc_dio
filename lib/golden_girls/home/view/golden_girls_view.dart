import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_golden_girls_api/golden_girls/home/service/golden_girls_service.dart';
import 'package:flutter_golden_girls_api/golden_girls/product/app_constants/app_strings.dart';
import 'package:flutter_golden_girls_api/golden_girls/product/widget/golden_card_widget.dart';
import 'package:flutter_golden_girls_api/golden_girls/product/widget/golden_container.dart';

import '../viewmodel/golden_girls_viewmodel.dart';
import 'package:kartal/kartal.dart';

class GoldenGirls extends StatelessWidget {
  const GoldenGirls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GoldenGirlsCubit(
        service: GoldenGirlsService(
          Dio(
            BaseOptions(),
          ),
        ),
      ),
      child: BlocConsumer<GoldenGirlsCubit, GoldenGirlsState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              appBar: _buildAppBar(),
              body: context.read<GoldenGirlsCubit>().isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Padding(
                      padding: context.verticalPaddingLow,
                      child: _buildBody(context, state),
                    ),
            );
          }),
    );
  }

  Widget _buildBody(BuildContext context, GoldenGirlsState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: _buildTextHeadline(context, AppString().categoriesText)),
        Expanded(
          flex: 4,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: context.read<GoldenGirlsCubit>().model?.length,
              itemBuilder: (context, index) {
                return GoldenGirlsCard(
                    model: context.read<GoldenGirlsCubit>().model?[index]);
              }),
        ),
        Expanded(child: _buildTextHeadline(context, AppString().getLinkText)),
        Expanded(
          flex: 4,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: context.read<GoldenGirlsCubit>().model?.length,
              itemBuilder: (context, index) {
                return GoldenContainer(
                  model: context.read<GoldenGirlsCubit>().model?[index],
                );
              }),
        ),
        const Spacer(),
      ],
    );
  }

  Padding _buildTextHeadline(BuildContext context, String name) {
    return Padding(
      padding: context.paddingNormal,
      child: Text(
        name,
        style: context.textTheme.headline5?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(AppString().appBarName),
      centerTitle: true,
    );
  }
}
