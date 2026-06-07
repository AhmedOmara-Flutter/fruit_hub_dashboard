import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../clients/presentation/view_model/clients_cubit.dart';
import '../view_model/admin_cubit.dart';
import '../widgets/admin_view_body.dart';

class AdminView extends StatefulWidget {
  const AdminView({super.key});

  @override
  State<AdminView> createState() => _AdminViewState();
}

class _AdminViewState extends State<AdminView> {

  @override
  void initState() {
    super.initState();
    context.read<ClientsCubit>().loadData();
    context.read<AdminCubit>().loadDashboard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdminViewBody(),
    );
  }
}





