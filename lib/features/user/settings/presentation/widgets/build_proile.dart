import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review_shop_app/core/layout/cubit/shop_cubit.dart';
import 'package:review_shop_app/core/layout/cubit/shop_state.dart';
import 'package:review_shop_app/core/resources/color_manager.dart';
import 'package:review_shop_app/core/resources/strings_manager.dart';
import 'package:review_shop_app/core/resources/values_manager.dart';
import 'package:review_shop_app/core/widgets/my_button.dart';
import 'package:review_shop_app/core/widgets/my_form_field.dart';
import 'package:review_shop_app/features/user/settings/domain/entities/profile.dart';

class BuildProfile extends StatelessWidget {
  final Profile profile;

  const BuildProfile({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        cubit.nameController.text = profile.data!.name!;
        cubit.emailController.text = profile.data!.email!;
        cubit.phoneController.text = profile.data!.phone!;
        return Padding(
          padding: const EdgeInsets.all(
            AppPadding.p20,
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.profile,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: ColorManager.sBlack,
                        ),
                  ),
                  const SizedBox(
                    height: AppSize.s30,
                  ),
                  MyFormField(
                    controller: cubit.nameController,
                    type: TextInputType.text,
                    label: 'name',
                    prefix: Icons.person,
                    validator: (value) {},
                  ),
                  const SizedBox(
                    height: AppSize.s30,
                  ),
                  MyFormField(
                    controller: cubit.emailController,
                    type: TextInputType.emailAddress,
                    label: 'email',
                    prefix: Icons.email_outlined,
                    validator: (value) {},
                  ),
                  const SizedBox(
                    height: AppSize.s30,
                  ),
                  MyFormField(
                    controller: cubit.phoneController,
                    type: TextInputType.phone,
                    label: 'phone',
                    prefix: Icons.phone,
                    validator: (value) {},
                  ),
                  const SizedBox(
                    height: AppSize.s30,
                  ),
                  ConditionalBuilder(
                    condition: state is! ShopUpdateProfileLoadingState,
                    builder: (context) => MyButton(
                      onPressedTextButton: () {
                        cubit.getUpdateProfile(
                          name: cubit.nameController.text,
                          email: cubit.emailController.text,
                          phone: cubit.phoneController.text,
                          image: cubit.imageController.text,
                        );
                      },
                      text: AppStrings.updateProfile,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: ColorManager.sWhite,
                          ),
                    ),
                    fallback: (context) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s30,
                  ),
                  MyButton(
                    onPressedTextButton: () {
                      cubit.getLogOut(
                        fcmToken: cubit.fcmTokenController.text,
                      );
                    },
                    text: AppStrings.logOut,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: ColorManager.sWhite,
                        ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
