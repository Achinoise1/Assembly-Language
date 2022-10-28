#include <iostream>
#include <cstring>
#include <cstdlib>
using namespace std;
int main(){
	char* str = "abcxxxxdefghijklmop";
	int len = strlen(str);
	int i=3;
	for(int j=0;j<(str+i)-(str+i-i);j++){
		cout<<str[j];
	}
	//cout<<(str+i)-(str+i-i)<<endl;
	//cout<<str+i<<endl;
	cout<<str+i+4<<endl;
	//strcpy(str+i,str+i+4);
	int num1 = 4,num2 = 4;
	for(int j=0;j<num1-1;j++)
		cout<<str[j];
	cout<<str+num1-1+num2<<endl;
} 
