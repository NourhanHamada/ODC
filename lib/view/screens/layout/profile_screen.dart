import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:odc_offline/view/components/core/component.dart';
import 'package:odc_offline/view/components/core/custom_text.dart';
import 'package:odc_offline/view/constant/assets.dart';
import 'package:odc_offline/view/constant/color_manager.dart';
import 'package:odc_offline/view/constant/data.dart';
import 'package:odc_offline/view/constant/extensions.dart';
import 'package:odc_offline/view_model/cubit/auth/logout/logout_cubit.dart';
import 'package:odc_offline/view_model/cubit/theme/theme_cubit.dart';
import '../../widgets/profile_screen_items.dart';
import '../../widgets/theme_mode_animation.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    ThemeCubit themeCubit = ThemeCubit.get(context);
    LogoutCubit logoutCubit = BlocProvider.of(context, listen: true);
    return SingleChildScrollView(
      child: BlocConsumer<ThemeCubit, ThemeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      context.pop();
                    },
                    child: Padding(
                      padding: EdgeInsets.all(10.0.h),
                      child: SvgPicture.asset(
                        arrowBack,
                      ),
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  CustomText(
                    text: 'Profile',
                    color: mainColor,
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                            color: mainColor,
                            child: Image.asset(
                              profilePicture,
                              width: 77,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 16.h,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                // text: 'Nourhan Hamada',
                                text: '$userFirstName $userLastName',
                                color:
                                    themeCubit.isDark ? white : darkBackground,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              CustomText(
                                text: 'ODC345678CC',
                                color: themeCubit.isDark ? grey600 : grey800,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 32.h,
                        ),
                        CustomText(
                          text: 'Personal Info',
                          color: grey600,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        ProfileScreenItems(
                          prefixIcon: SvgPicture.asset(
                            edit,
                            colorFilter: ColorFilter.mode(
                                themeCubit.isDark ? white : grey800,
                                BlendMode.srcIn),
                          ),
                          title: 'Edit',
                          onTap: () {},
                        ),
                        ProfileScreenItems(
                          prefixIcon: SvgPicture.asset(
                            nightMode,
                            colorFilter: ColorFilter.mode(
                                themeCubit.isDark ? white : grey800,
                                BlendMode.srcIn),
                          ),
                          suffixIcon: const ThemeModeAnimation(),
                          title: 'Night Mode',
                          onTap: () {
                            themeCubit.changeAppTheme();
                            themeCubit
                                .cashAppTheme(ThemeCubit.get(context).isDark);
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CustomText(
                          text: 'Support',
                          color: grey600,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        ProfileScreenItems(
                          prefixIcon: SvgPicture.asset(
                            help,
                            colorFilter: ColorFilter.mode(
                                themeCubit.isDark ? white : grey800,
                                BlendMode.srcIn),
                          ),
                          title: 'Orange Help Center',
                          onTap: () {},
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CustomText(
                          text: 'About',
                          color: grey600,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        ProfileScreenItems(
                          prefixIcon: SvgPicture.asset(
                            about,
                            colorFilter: ColorFilter.mode(
                                themeCubit.isDark ? white : grey800,
                                BlendMode.srcIn),
                          ),
                          title: 'About Orange Digital Center',
                          onTap: () {},
                        ),
                        BlocConsumer<LogoutCubit, LogoutState>(
                          listener: (context, state) {
                            if (state is LogoutLoadingState) {
                              debugPrint('Logout Loading!!');
                              showDialog(
                                context: context,
                                barrierColor: Colors.transparent,
                                builder: (BuildContext context) {
                                  return const Center(
                                    child: CircularProgressIndicator(
                                      color: mainColor,
                                      strokeWidth: 2,
                                    ),
                                  );
                                },
                              );
                            }
                            if (state is LogoutFailState) {
                              Future.delayed(const Duration(seconds: 2), () {
                                context.pop();
                                showToast(
                                  message: 'check your internet connection',
                                  color: toastColor,
                                );
                                debugPrint('Logout Fail!!');
                              });
                            }
                          },
                          builder: (context, state) {
                            return ProfileScreenItems(
                              prefixIcon: SvgPicture.asset(
                                logout,
                                colorFilter: ColorFilter.mode(
                                    themeCubit.isDark ? white : grey800,
                                    BlendMode.srcIn),
                              ),
                              title: 'LogOut',
                              onTap: () {
                                logoutCubit.performLogout(context);
                              },
                            );
                          },
                        ),
                        ProfileScreenItems(
                          prefixIcon: SvgPicture.asset(
                            deleteAccount,
                            colorFilter: const ColorFilter.mode(
                                redColor, BlendMode.srcIn),
                          ),
                          title: 'Delete Account',
                          onTap: () {},
                          isDelete: true,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
