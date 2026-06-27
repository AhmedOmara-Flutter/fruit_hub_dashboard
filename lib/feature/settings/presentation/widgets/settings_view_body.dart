import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:fruit_hub_dashboard/core/utils/style_manager.dart';

import '../../../../core/cubit/orders_cubit/orders_cubit.dart';
import '../../../../core/helper_function/custom_show_dialog.dart';

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
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 10),


          // ADMIN CARD
          _buildCard(
            title: "معلومات المدير",
            icon: Icons.person,
            children: const [
              InfoTile(title: "الاسم", value: "أحمد هاني عمارة"),
              Divider(),
              InfoTile(title: "البريد الإلكتروني", value: "ahmed@gmail.com"),
              Divider(),
              InfoTile(title: "رقم التليفون", value: "01204391511"),
              Divider(),
              InfoTile(title: "الدور", value: "مدير"),
            ],
          ),

          const SizedBox(height: 15),

          // APP INFO
          _buildCard(
            title: "معلومات التطبيق",
            icon: Icons.info_outline,
            children: [
              InfoTile(title: "الإصدار", value: version),
              const Divider(),
              const InfoTile(title: "التقنية", value: "Flutter"),
              const Divider(),
              const InfoTile(title: "الحالة", value: "نشط"),
            ],
          ),

          const SizedBox(height: 20),

          _buildDangerCard(context),

          const SizedBox(height: 25),

          Text(
            '© 2026 قطيف - جميع الحقوق محفوظة',
            style: TextStyle(color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }

  Widget _buildDangerCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.red.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.warning_amber_rounded, color: Colors.red),
              SizedBox(width: 8),
              Text(
                "منطقة خطيرة",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 10),

          const Text(
            "حذف كل الطلبات من قاعدة البيانات بشكل نهائي.",
            style: TextStyle(color: Colors.grey),
          ),

          const SizedBox(height: 15),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade500,
                padding: const EdgeInsets.all(14),
              ),
              onPressed: () {
                CustomShowDialog.show(
                  context,
                  title: 'تاكيد الحذف',
                  content: Text(
                    'هل أنت متأكد أنك تريد حذف كل الطلبات؟',
                    textAlign: TextAlign.center,
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.grey),
                  ),
                  cancel: () => Navigator.pop(context),
                  accept: () {
                    context
                        .read<OrdersCubit>()
                        .deleteOrderCollection();
                    Navigator.pop(context);
                  },
                  color: Colors.red,
                  flag:Icons.inventory_2,
                );
              },
              child:  Text("حذف كل الطلبات",style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Colors.white,
              ),),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
          )
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.green),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...children,
        ],
      ),
    );
  }
}

class InfoTile extends StatelessWidget {
  final String title;
  final String value;

  const InfoTile({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: StyleManager.font13Weight600),
        const Spacer(),
        Text(
          value,
          style: StyleManager.font16Weight600,
        ),
      ],
    );
  }
}