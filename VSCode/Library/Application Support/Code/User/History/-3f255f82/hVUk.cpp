// 本代码生成一个全是 0 的 10 位数组9 (默认初始化), 然后按顺序依次赋值, 最后用迭代器 (interator) 来依次输出

#include <iostream>
#include <vector>

using namespace std;

int main() {

    vector <int> v(10);

    for (auto p = v.begin(), int i = 0; p != v.end(); p++) {
        *p = i++;
        cout << *p << endl;
    }

    return 0;
}