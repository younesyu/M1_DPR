/**
* @author Sébastien Gonzalez
* @author Younes Rouahbia
* Utilisation : obtenir le fichier .o de triangle.c
*			gcc -c triangle.c
*			Obtenir l'executable de mainTriangle.c
*			gcc -o mainTriangle mainTriangle.c triangle.o
**/
#include "triangle.h"

int main(int argc, char* argv[]) {
	if(argc-1 != 1) { fprintf(stderr, "Utilisation : %s 'nom_fichier'\n", argv[0]); exit(1); }

	double* tab = readData(argv[1]);
	if(tab[0] == -1) {
		printf("Fichier non conforme ou inexistant\n");
		return 1;
	}
	printf("Triangle : %f %f %f\n", tab[0], tab[1],tab[2]);
	int resultTypeTriangle = typeTriangle(tab[0], tab[1], tab[2]);
	switch(resultTypeTriangle) {
		case -1:
			printf("Triangle non valide\n");
			break;
		case 1:
			printf("Triangle scalène\n");
			break;
		case 2:
			printf("Triangle isocèle\n");
			break;
		case 3:
			printf("Triangle équilatéral\n");
			break;
		default:
			printf("Triangle inconnu\n");
	}
	return 0;
}
