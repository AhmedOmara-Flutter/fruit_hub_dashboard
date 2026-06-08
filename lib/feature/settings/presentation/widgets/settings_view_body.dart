import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:fruit_hub_dashboard/core/utils/style_manager.dart';

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
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const SizedBox(height: 20),

          // LOGO (themed)
          Container(
            height: 110,
            width: 110,
            decoration: BoxDecoration(
              color: const Color(0xffF9FAFA), // من Theme input fill
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Icon(
              Icons.eco_rounded,
              size: 55,
              color: Color(0xff1B5E37),
            ),
          ),

          const SizedBox(height: 18),

          Text(
            "متجر الفواكه",
            style: StyleManager.font23Weight700,
          ),

          const SizedBox(height: 6),

          Text(
            "لوحة تحكم إدارة المتجر",
            style: StyleManager.font13Weight600,
          ),

          const SizedBox(height: 30),

          // ADMIN CARD
          _buildCard(
            title: "معلومات المدير",
            children: const [
              InfoTile(
                title: "الاسم",
                value: "أحمد هاني عمارة",
              ),
              Divider(),
              InfoTile(
                title: "البريد الإلكتروني",
                value: "ahmedomara@gmail.com",
              ),
              Divider(),
              InfoTile(
                title: "الدور",
                value: "مدير المتجر",
              ),
            ],
          ),

          const SizedBox(height: 20),

          // APP INFO
          _buildCard(
            title: "معلومات التطبيق",
            children: [
              InfoTile(
                title: "إصدار التطبيق",
                value: version,
              ),
              const Divider(),
              const InfoTile(
                title: "التقنية",
                value: "Flutter",
              ),
              const Divider(),
              const InfoTile(
                title: "الحالة",
                value: "نشط",
              ),
            ],
          ),

          const SizedBox(height: 30),

          Text(
            "© 2026 متجر الفواكه",
            style: StyleManager.font11Weight400,
          ),
        ],
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                title,
                style: StyleManager.font19Weight700,
              ),
            ],
          ),
          const SizedBox(height: 16),
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