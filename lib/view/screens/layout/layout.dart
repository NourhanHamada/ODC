import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_offline/view/components/core/custom_bottom_navbar.dart';
import 'package:odc_offline/view/components/core/scaffold_custom/scaffold_custom.dart';
import 'package:odc_offline/view_model/cubit/theme/theme_cubit.dart';
import '../../../view_model/cubit/layout/layout_cubit.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  @override
  Widget build(BuildContext context) {
    LayoutCubit layoutCubit =
        BlocProvider.of<LayoutCubit>(context, listen: true);
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return ScaffoldCustom(
          body: SafeArea(
            child: layoutCubit.screens[layoutCubit.currentIndex],
          ),
          bottomNavigationBar: const CustomBottomNavbar(),
        );
      },
    );
  }
}
