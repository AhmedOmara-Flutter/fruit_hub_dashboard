import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_model/main_cubit.dart';
import '../widgets/custom_drawer.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit,MainState>(
  builder: (context, state) {
    final cubit=context.read<MainCubit>();
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text(
          cubit.drawerItems[cubit.selectedIndex].title,
          style: TextStyle(color: Colors.white),
        ),
       centerTitle: true,
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          icon: Icon(Icons.menu,color: Colors.white,),
          color: Color(0xff4EB7F2),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff1B5E37),
        actions: [
          IconButton(onPressed: (){}, icon:Icon(Icons.search,color: Colors.white,))
        ],
      ),
      body: cubit.screens[cubit.selectedIndex],
    );
  },
);
  }
}
