#include <RInside.h>
#include <unistd.h>

int main(int argc, char *argv[]){
  
  RInside R(argc, argv);
  
  std::string cmd = "tmpf <- tempfile('curve');"
  "png(tmpf);"
  "curve(x^2, -10, 10, 200);"
  "dev.off();"
  "tmpf";
  
  std::string tmpfile = R.parseEval(cmd);
  
  std::cout << "Could now use plot in " << tmpfile << std::endl;

  

  exit(0);
}