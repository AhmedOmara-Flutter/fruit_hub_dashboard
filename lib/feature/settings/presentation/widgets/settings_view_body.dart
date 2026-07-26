import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/cubit/products_cubit/products_cubit.dart';
import 'package:fruit_hub_dashboard/core/utils/style_manager.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../../../core/cubit/offers_cubit/offers_cubit.dart';
import '../../../../core/cubit/orders_cubit/orders_cubit.dart';
import '../../../../core/helper_function/custom_show_dialog.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../generated/assets.dart';
import 'info_tile.dart';

class SettingsViewBody extends StatefulWidget {
  const SettingsViewBody({super.key});

  @override
  State<SettingsViewBody> createState() => _SettingsViewBodyState();
}

class _SettingsViewBodyState extends State<SettingsViewBody> {
  String version = "0.0.0";

  @override
  void initState() {
    super.initState();
    _getVersion();
  }

  Future<void> _getVersion() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      version = info.version;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColor.card,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColor.mainColor.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: const Offset(0, 1),
                ),
              ],
              border: Border(
                bottom: BorderSide(color: AppColor.border),
              ),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image.asset(
              Assets.images.appLogo.path,
              height: 220,
              width: double.infinity,
            ),
          ),
          SizedBox(height: 50),
          Row(
            children: [
              Expanded(
                child: _buildCard(
                  context: context,
                  title: "معلومات المدير",
                  icon: Icons.person,
                  children: const [
                    InfoTile(title: "الاسم", value: "مصطفي ابراهيم"),
                    InfoTile(title: "رقم التليفون", value: "01113694883"),
                    InfoTile(title: "الدور", value: "مدير"),
                  ],
                ),
              ),

              SizedBox(width: 20),

              Expanded(
                child: _buildCard(
                  context: context,
                  title: "معلومات التطبيق",
                  icon: Icons.info_outline,
                  children: [
                    InfoTile(title: "الإصدار", value: version),
                    const InfoTile(title: "التقنية", value: "Flutter"),
                    const InfoTile(title: "الحالة", value: "نشط"),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            children: [
              Expanded(child: _buildOrdersDangerCard(context)),
              SizedBox(width: 20),
              Expanded(child: _buildCartDangerCard(context)),
              SizedBox(width: 20),
              Expanded(child: _buildOffersDangerCard(context)),
            ],
          ),

Spacer(),
          Text(
            '© 2026 حكايه - جميع الحقوق محفوظة',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: AppColor.textSecondary,
            ),
          ),
          SizedBox(height: 20,)
        ],
      ),
    );
  }

  Widget _buildOrdersDangerCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColor.card,
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        boxShadow: [
          BoxShadow(
            color: AppColor.mainColor.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 1),
          ),
        ],
        border: Border(
          bottom: BorderSide(color: AppColor.border),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: AppColor.red.withOpacity(.12),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.warning_amber_rounded,
                  color: AppColor.red,
                  size: 24,
                ),
              ),

              SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "حذف الطلبات",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppColor.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      "حذف جميع الطلبات نهائيًا.",
                      style:StyleManager.font12Weight500(context).copyWith(
                        color: AppColor.textSecondary
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 14),

          SizedBox(
            width: double.infinity,
            height: 42,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.red,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              icon: Icon(
                Icons.delete_outline,
                color: AppColor.white,
                size: 18,
              ),
              label: Text(
                "حذف كل الطلبات",
                style:StyleManager.font12Weight500(context).copyWith(
                    color: AppColor.white
                ),
              ),
              onPressed: () {
                CustomShowDialog.show(
                  context,
                  title: 'تأكيد حذف الطلبات',
                  content: Text(
                    'هل أنت متأكد أنك تريد حذف كل الطلبات؟',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppColor.textSecondary,
                    ),
                  ),
                  cancel: () => Navigator.pop(context),
                  accept: () {
                    context.read<OrdersCubit>().deleteOrderCollection();
                    Navigator.pop(context);
                  },
                  color: AppColor.red,
                  flag: Icons.warning_amber_rounded,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildCartDangerCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColor.card,
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        boxShadow: [
          BoxShadow(
            color: AppColor.mainColor.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 1),
          ),
        ],
        border: Border(
          bottom: BorderSide(color: AppColor.border),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: AppColor.accentColor.withOpacity(.12),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.shopping_cart_outlined,
                  color: AppColor.accentColor,
                  size: 24,
                ),
              ),

              SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "مسح السلة",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppColor.accentColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      "مسح جميع منتجات السلة نهائيًا.",
                      style: StyleManager.font12Weight500(context).copyWith(
                        color: AppColor.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 14),

          SizedBox(
            width: double.infinity,
            height: 42,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.accentColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              icon: Icon(
                Icons.delete_outline,
                color: AppColor.white,
                size: 18,
              ),
              label: Text(
                "مسح السلة",
                style: StyleManager.font12Weight500(context).copyWith(
                  color: AppColor.white,
                ),
              ),
              onPressed: () {
                CustomShowDialog.show(
                  context,
                  title: 'تأكيد مسح السلة',
                  content: Text(
                    'هل أنت متأكد أنك تريد حذف كل محتويات السلة؟',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppColor.textSecondary,
                    ),
                  ),
                  cancel: () => Navigator.pop(context),
                  accept: () {
                    context
                        .read<ProductsCubit>()
                        .deleteCartCollectionForUser();
                    Navigator.pop(context);
                  },
                  color: AppColor.accentColor,
                  flag: Icons.remove_shopping_cart,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildOffersDangerCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColor.card,
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        boxShadow: [
          BoxShadow(
            color: AppColor.mainColor.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 1),
          ),
        ],
        border: Border(
          bottom: BorderSide(color: AppColor.border),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: AppColor.green.withOpacity(.12),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.local_offer_outlined,
                  color: AppColor.green,
                  size: 24,
                ),
              ),

              SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "حذف العروض",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppColor.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      "حذف جميع العروض نهائيًا.",
                      style: StyleManager.font12Weight500(context).copyWith(
                        color: AppColor.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 14),

          SizedBox(
            width: double.infinity,
            height: 42,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.green,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              icon: Icon(
                Icons.delete_outline,
                color: AppColor.white,
                size: 18,
              ),
              label: Text(
                "حذف كل العروض",
                style: StyleManager.font12Weight500(context).copyWith(
                  color: AppColor.white,
                ),
              ),
              onPressed: () {
                CustomShowDialog.show(
                  context,
                  title: 'تأكيد حذف العروض',
                  content: Text(
                    'هل أنت متأكد أنك تريد حذف جميع العروض؟',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppColor.textSecondary,
                    ),
                  ),
                  cancel: () => Navigator.pop(context),
                  accept: () {
                    context.read<OffersCubit>().deleteAllOffers();
                    Navigator.pop(context);
                  },
                  color: AppColor.green,
                  flag: Icons.local_offer_outlined,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildCard({
    required BuildContext context,
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColor.card,
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        boxShadow: [
          BoxShadow(
            color: AppColor.mainColor.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 1),
          ),
        ],
        border: Border(
          bottom: BorderSide(color: AppColor.border),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColor.mainColor.withOpacity(.12),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: AppColor.mainColor,
                  size: 22,
                ),
              ),
              SizedBox(width: 12),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColor.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          SizedBox(height: 18),

          Theme(
            data: Theme.of(context).copyWith(
              dividerColor: AppColor.border,
            ),
            child: Column(
              children: children,
            ),
          ),
        ],
      ),
    );
  }
}