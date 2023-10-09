import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../view_model/cubit/layout/layout_cubit.dart';
import '../../../view_model/cubit/theme/theme_cubit.dart';
import '../../constant/assets.dart';
import '../../constant/color_manager.dart';

class CustomBottomNavbar extends StatelessWidget {
  const CustomBottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    LayoutCubit layoutCubit =
        BlocProvider.of<LayoutCubit>(context, listen: true);
    ThemeCubit themeCubit = BlocProvider.of<ThemeCubit>(context, listen: true);

    return BottomNavigationBar(
      selectedLabelStyle: const TextStyle(height: 1.6),
      unselectedLabelStyle: const TextStyle(height: 1.6),
      selectedFontSize: 12,
      selectedIconTheme:
          IconThemeData(color: themeCubit.isDark ? white : grey300),
      unselectedIconTheme:
          IconThemeData(color: themeCubit.isDark ? grey300 : grey900),
      backgroundColor: themeCubit.isDark ? darkBackground : white,
      selectedItemColor: themeCubit.isDark ? white : grey900,
      unselectedItemColor: grey600,
      elevation: 50,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            explore,
          ),
          activeIcon: SvgPicture.asset(
            exploreActive,
            colorFilter: ColorFilter.mode(
                themeCubit.isDark ? white : grey900, BlendMode.srcIn),
          ),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            learning,
          ),
          activeIcon: SvgPicture.asset(
            learningActive,
            colorFilter: ColorFilter.mode(
                themeCubit.isDark ? white : grey900, BlendMode.srcIn),
          ),
          label: 'Learning',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            dashboard,
          ),
          activeIcon: SvgPicture.asset(
            dashboardActive,
            colorFilter: ColorFilter.mode(
                themeCubit.isDark ? white : grey900, BlendMode.srcIn),
          ),
          label: 'Dashboard',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            profile,
            colorFilter: ColorFilter.mode(
                themeCubit.isDark ? white : grey900, BlendMode.srcIn),
          ),
          activeIcon: SvgPicture.asset(
            profileActive,
            colorFilter: ColorFilter.mode(
                themeCubit.isDark ? white : grey900, BlendMode.srcIn),
          ),
          label: 'Profile',
        ),
      ],
      currentIndex: layoutCubit.currentIndex,
      onTap: (index) {
        layoutCubit.changeIndex(index);
      },
    );
  }
}
