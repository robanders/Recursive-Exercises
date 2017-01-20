#include <stdio.h>
#include <string.h>
#include <stdlib.h>

main(){
	int num = 0, looping = 1, i;
	char names[20][15];

	while(looping == 1){
		fgets(names[num], 15, stdin);

		int length = strlen(names[num]);
		if(names[num][length - 1] == '\n'){
			names[num][length - 1] = '\0';
		}
		if(strcmp(names[num], "END") == 0){
			looping = 0;
		} else {
			num++;
		}
	}
	bedtimestory(names, 0, num);	

}

bedtimestory(char words[20][15], int current, int number){
	int i;

	if(current < number - 1){
		for(i = 0; i < current; i++){
			printf("  ");
		}

		if(current == 0){
			printf("A %s couldn't sleep, so her mother told a story about a little %s,\n", words[current], words[current + 1]);

		} else {
			printf("who couldn't sleep, so the %s's mother told a story about a little %s,\n", words[current], words[current + 1]);
		}
		bedtimestory(words, current + 1, number);
	}

	for(i = 0; i < current; i++){
		printf("  ");
	}

	if(current == number - 1){
		printf("... who fell asleep.\n");
	} else if(current == 0){
		printf("... and then the %s fell asleep.\n", words[current]);
	} else if(current < number - 1){
		printf("... and then the little %s fell asleep;\n", words[current]);
	}
}
