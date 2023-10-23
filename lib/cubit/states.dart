

abstract class NewsStates{}

class InitialState extends NewsStates{}

class NewsBottomNavigation extends NewsStates{}



class BusinessGetDatasSucces extends NewsStates{}


class BusinessGetDatasfaler   extends NewsStates{
  late final String error;
  BusinessGetDatasfaler(this.error);          //constructor to give error
}


class BusinessGetDatasloading extends NewsStates{}



class SportsGetDatasSucces extends NewsStates{}


class SportsGetDatasfaler   extends NewsStates{
  late final String error;
  SportsGetDatasfaler(this.error);          //constructor to give error
}


class SportsGetDatasloading extends NewsStates{}


class SCGetDatasSucces extends NewsStates{}


class SCGetDatasfaler   extends NewsStates{
  late final String error;
  SCGetDatasfaler(this.error);          //constructor to give error
}


class SCGetDatasloading extends NewsStates{}


class themechangel extends NewsStates{}




class searchloading extends NewsStates{}


class searchSucces extends NewsStates{}

class searchfail extends NewsStates{}