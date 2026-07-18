import 'package:bloc/bloc.dart';
import 'package:news_app/view_model/cubit/base_state.dart';
import 'package:news_app/view_model/logic/fetch_data.dart';

import 'package:news_app/repos/models/articles_model.dart';

class NewsCubit extends Cubit<BaseState<List<Articles>>> {
  NewsCubit() : super(InitialState<List<Articles>>());
  void fetchNews() async {
    emit(LoadingState<List<Articles>>());
    FetchData fetchData = FetchDataFromApi();
    List<Articles> articles = await fetchData.getData();
    if (articles.isEmpty) {
      emit(ErrorState<List<Articles>>(error: 'No data found'));
    } else {
      emit(SuccessState<List<Articles>>(data: articles));
    }
  }
}
