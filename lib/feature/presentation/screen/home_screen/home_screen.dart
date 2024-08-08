import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/feature/commons/utility/locale_util.dart';
import 'package:spotify/feature/presentation/blocs/home/home_event.dart';
import 'package:spotify/feature/presentation/blocs/main/main_bloc_cubit.dart';
import 'package:spotify/main.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if(state is CountHomeState){
                  return Text("${state.count}");
                }
                return Text(context.locale.know);
              },
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: LocaleHelper.getLocales().map((locale) {
                return ElevatedButton(
                    onPressed: (){
                      context.read<MainBloc>().changeLocale(locale.languageCode);
                    },
                    child: Text(locale.languageCode)
                );
              }).toList(),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: (){
                      context.read<MainBloc>().changeTheme(false);
                    },
                    child: const Text("Light")
                ),
                ElevatedButton(
                    onPressed: (){
                      context.read<MainBloc>().changeTheme(true);
                    },
                    child: const Text("Dark")
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
