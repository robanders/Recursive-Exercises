#include <stdio.h>
#include <string.h>
#include <stdlib.h>

main(){
	int looping = 1;
	int input, result;

	while(looping == 1){
		scanf("%d", &input);
		result = fibonacci(input);
	
		if(result == 0){
			looping = 0;
		}

		printf("%d\n", result);
	}

}

int fibonacci(int n){
	if(n == 0){
		return 0;
	}
	if(n == 1){
		return 1;
	} else {
		return fibonacci(n - 1) + fibonacci(n - 2);
	}
}
