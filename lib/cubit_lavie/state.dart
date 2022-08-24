abstract class LaVieStates {}

class LaVieInitialState extends LaVieStates {}

class LaVieBottomNavState extends LaVieStates {}

class LoginScreenChangeState extends LaVieStates {}

class LaVieGetPlantsLoadingState extends LaVieStates {}

class LaVieGetPlantsSuccessState extends LaVieStates {}

class LaVieGetPlantsErrorState extends LaVieStates {
  final String error;

  LaVieGetPlantsErrorState(this.error);
}

