#include <stdio.h>
#include<string.h>


// Global Variables
int z = 0, i = 0, j = 0, c = 0;

// Modify array size to increase
// length of string to be parsed
char a[16], ac[20], stk[15], act[10];

// This Function will check whether
// the stack contain a production rule
// which is to be Reduce.
// Rules can be E->2E2 , E->3E3 , E->4        2->A  3->B 4->C
void check()
{
	// Coping string to be printed as action
	strcpy(ac, "REDUCE TO E -> ");

	// c=length of input string
	for (z = 0; z < c; z++)
	{
		// checking for producing rule E->4
		if (stk[z] == 'd')
		{
			printf("%sbb", ac);
			stk[z] = 'S';
			stk[z+1] = '\0';
			

			//pinting action
			printf("\n$%s\t%s$\t", stk, a);
			
		}
	}

	for (z = 0; z < c - 2; z++)
	{
		// checking for another production
		if (stk[z] == 'c' && stk[z + 1] == 'b' &&
			stk[z + 2] == 'S' && stk[z + 3] == 'a')
		{
			printf("%scbSa", ac);
			stk[z] = 'S';
			stk[z + 1] = '\0';
			stk[z + 2] = '\0';
			stk[z + 3] = '\0';
			printf("\n$%s\t%s$\t", stk, a);
			
			//Logic : i = i - stack_top
			i = i - 3;
		}
	}

	
	return; // return to main
}

// Driver Function
int main()
{
	printf("GRAMMAR is -\nS -> cbSa \n s-> d \n");

	// a is input string
	char inp[100];
	gets(inp);
	strcpy(a, inp);//a <- inp

	// strlen(a) will return the length of a to c
	c = strlen(a);

	// "SHIFT" is copied to act to be printed
	strcpy(act, "SHIFT");

	// This will print Lables (column name)
	printf("\nstack \t input \t action");

	// This will print the initial
	// values of stack and input
	printf("\n$\t%s$\t", a);

	// This will Run upto length of input string
	for (i = 0; j < c; i++, j++)
	{
		// Printing action
		printf("%s", act);

		// Pushing into stack
		stk[i] = a[j];
		stk[i + 1] = '\0';

		// Moving the pointer
		a[j] = ' ';

		// Printing action
		printf("\n$%s\t%s$\t", stk, a);

		// Call check function ..which will
		// check the stack whether its contain
		// any production or not
		check();
	}

	// Rechecking last time if contain
	// any valid production then it will
	// replace otherwise invalid
	check();

	// if top of the stack is E(starting symbol)
	// then it will accept the input
	if (stk[0] == 'S' && stk[1] == '\0')
		printf("Accept\n");
	else //else reject
		printf("Reject\n");
}
