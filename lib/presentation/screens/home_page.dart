import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/view_model/cubit/base_state.dart';
import 'package:news_app/view_model/cubit/news_cubit.dart';

import 'package:news_app/repos/models/articles_model.dart';
import 'package:news_app/presentation/widgets/news_view_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsCubit>(
      create: (context) => NewsCubit()..fetchNews(),
      child: Scaffold(
        appBar: AppBar(title: Text("News App")),
        body: BlocBuilder<NewsCubit, BaseState<List<Articles>>>(
          builder: (context, state) {
            if (state is LoadingState) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is SuccessState<List<Articles>>) {
              return ListView.builder(
                itemCount: state.data.length,
                itemBuilder: (context, index) {
                  return NewsViewWidget(
                    imagePath: state.data[index].urlToImage,

                    country: state.data[index].author ?? '',
                    title: state.data[index].title ?? '',
                    onTap: () {},
                  );
                },
              );
            }
            if (state is ErrorState<List<Articles>>) {
              return Center(
                child: Text(
                  state.error,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 22,
                    fontWeight: .bold,
                  ),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
