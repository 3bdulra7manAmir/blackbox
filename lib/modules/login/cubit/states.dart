abstract class LoginStates{}

class Initial_Login_State extends LoginStates{}
class Show_Alert_Dialog_Empty_Username_Or_Password extends LoginStates{}
class Show_Alert_Dialog_Wrng_Username_Or_Password extends LoginStates{}
class Correct_Username_And_Password extends LoginStates{}
class Password_Visibility_Toggled extends LoginStates{}