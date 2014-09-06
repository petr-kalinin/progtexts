#include <iostream>
#include <vector>
using namespace std;

vector<int>* foo(int n) {
  vector<int> a;
  a.resize(4);
  a[0] = n;
  for (int i=1; i<=n; i++)
     a[i] = a[i-1] + i;
  return &a;
}

int main() {
  int n;
  cin >> n;
  vector<int> *b = foo(n);
  cout << (*b)[n] << endl;
  return 0;
}