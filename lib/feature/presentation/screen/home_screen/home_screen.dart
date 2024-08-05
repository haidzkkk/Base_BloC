import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/feature/presentation/blocs/home/home_event.dart';

import '../../blocs/home/home_bloc.dart';
import '../../blocs/home/home_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late final homeBloc = context.read<HomeBloc>();

  @override
  void initState() {
    homeBloc.add(InitHomeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          homeBloc.add(CountHomeEvent());
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if(state is CountHomeState){
              return Text("${state.count}");
            }
            return const Text("Không biết nha");
          },
        ),
      ),
    );
  }
}
