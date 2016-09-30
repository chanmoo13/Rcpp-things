#include <RInside.h>

int main(int argc, char *argv[]){
  
  RInside R(argc, argv);
  
  R["x"] = 10;
  R["y"] = 20;
  
  R.parseEvalQ("z <- x + y");
  
  int sum = R["z"];
  std::cout << "10 + 20 = " << sum << std::endl;
  
  sum = R.parseEval("x + y") ; 
  std::cout << "10 + 20 = " << sum << std::endl;
  
  
  exit(0);
}