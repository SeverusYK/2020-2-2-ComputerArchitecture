#include <stdio.h>

extern void quicksort(int arr[], int first, int last);


int main()
{
	int arr[8] = {5,1,4,3,2,8,7,6};
	int i;
		
	printf("Array before sorting :");
	for(i = 0; i < sizeof(arr)/sizeof(int); i++)
		printf(" %d ",arr[i]);
	printf("\n");
		
	quicksort(arr, 0, 7);

	printf("Array after sorting :");
	for(i = 0; i < sizeof(arr)/sizeof(int); i++)
		printf(" %d ",arr[i]);
	printf("\n");
	
	return 0;
}
