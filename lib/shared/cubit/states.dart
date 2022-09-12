 abstract class NewsStates{}

 class NewsInitialState extends NewsStates{}
 class NewsBottomNavBArState extends NewsStates{}
 class NewsGetBusinessDataSuccessState extends NewsStates{}
 class NewsGetBusinessDataErrorState extends NewsStates{
  final String error;
  NewsGetBusinessDataErrorState(this.error);
 }
 class NewsGetSportsDataSuccessState extends NewsStates{}
 class NewsGetSportsDataErrorState extends NewsStates{
  final String error;
  NewsGetSportsDataErrorState(this.error);
 }
 class NewsGetScienceDataSuccessState extends NewsStates{}
 class NewsGetScienceDataErrorState extends NewsStates{
  final String error;
  NewsGetScienceDataErrorState(this.error);
 }
 class NewsGetSearchDataSuccessState extends NewsStates{}
 class NewsGetSearchDataErrorState extends NewsStates{
  final String error;
  NewsGetSearchDataErrorState (this.error);
 }
 class NewsChangeModeState extends NewsStates{}
