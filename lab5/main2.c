#include <stdio.h>
#include <stdlib.h>

extern void matrix(int **A,int (**B),int (**C),int (*index));

int main(){
	int Array_size[3];
	int idx = 0;	
	int i = 0 ;
	int j = 0 ;
	int k = 0 ;
	int **A;
	int **B;
	int **C;

	printf("Input values of s,u,v: ");
	while(idx <3){
		Array_size[idx] = getchar() - '0';
		idx++;
	}


	printf( "%d %d %d\n",Array_size[0],Array_size[1],Array_size[2]);

	A = (int **) malloc(sizeof(int)* Array_size[0]);
	for(idx =0; idx <Array_size[0]; idx++){
		A[idx] = (int *)malloc (sizeof(int)*Array_size[1]);
	}
	B = (int **) malloc(sizeof(int)*Array_size[1]);
	for(idx = 0; idx<Array_size[1]; idx++){
		B[idx] = (int *)malloc(sizeof(int)*Array_size[2]);
	}
 	
	C = (int **) malloc(sizeof(int)*Array_size[0]);
	for(idx = 0; idx<Array_size[0]; idx++){
		C[idx] = (int *)malloc(sizeof(int)*Array_size[2]);
	}

	getchar();	
	printf("\nInput value of A : ");
	for(i=0; i < Array_size[0]; i++){
		for(j=0; j < Array_size[1]; j++){       
			A[i][j] = getchar()-'0';
		}
	}
	j=0; i=0;
	getchar();
		
	printf("\nInput value of B : ");
	for(j=0; j < Array_size[1]; j++){
		for(k=0; k < Array_size[2]; k++){       
			B[j][k] = getchar()-'0';
		}
	}
	k=0; j=0;	
		
	printf("\nArray A \n");
	for(i=0; i < Array_size[0]; i++){
		for(j=0; j < Array_size[1]; j++){  
		printf("%d ",A[i][j]);
		}
		printf("\n");	
	}
	i=0;
	j=0;
		
	printf("Array B \n");
	for(j=0; j < Array_size[1]; j++){
		for(k=0; k < Array_size[2]; k++){   
		printf("%d ",B[j][k]);
		}
		printf("\n");	
	}
	j=0;
	k=0;

	
	matrix( A, B, C, Array_size);
	printf("Array C after Operating : \n");
	for(i=0; i < Array_size[0]; i++){
		for(k=0; k < Array_size[2]; k++){  
			printf("%d ",C[i][k]);
		}
		printf("\n");	
	}

	for(i=0; i < Array_size[0]; i++){
		free(A[i]);	
	}
	free(A);
	
	for(i=0 ; i<Array_size[1]; i++){
		free(B[i]);
	}
	free(B);
	for( i=0; i<Array_size[0]; i++){
		free(C[i]);
	}
	free(C);
	
	return 0;
}
