//test

#include <iostream>
#include "testCtoM.h"
using namespace std;

int main() {
  cout << "Hello World" << endl;
  MyLink firstLink;
  cout << firstLink.feet << endl;
  firstLink.feet = 10;
  cout << firstLink.feet << endl;
  cout << "End of File" << endl;
  return 0;
}
