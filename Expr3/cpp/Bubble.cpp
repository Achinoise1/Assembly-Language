#include <iostream>
#include <algorithm>
#include <cstring>
using namespace std;
void Bubble(int* array){
	for(int i=0;i<10;i++){
		for(int j=0;j<i;j++){
			if(array[i]<array[j]){
				int temp = array[i];
				array[i] = array[j];
				array[j] = temp;
			}
		}
	}
	for(int i=0;i<10;i++)
		cout<<array[i]<<" ";
	cout<<endl;
}
int main(){
	int A[10] = {8,-4,7,3,0,3,4,9,7,5};
	Bubble(A);
}
