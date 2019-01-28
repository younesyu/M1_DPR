/**
* @author Sébastien Gonzalez
* @author Younes Rouahbia
**/
#include "triangle.h"
#include <errno.h>
#include <ctype.h>

double* readData(char* nomFichier) {
    double* tab;
    tab = malloc(3*sizeof(double));
	tab[0] = -1; tab[1] = -1; tab[2] = -1;

    FILE* fichier = NULL;

    fichier = fopen(nomFichier, "r+");

    if (fichier != NULL) {
        for(int i=0; i<3; i++) {
            char chaine[1024];
            if(fgets(chaine, 1024, fichier) <= 0) {
				tab[0] = -1; tab[1] = -1;
               break;
            }
			char *err;
			double valeur = strtod(chaine, &err); //convertion en double
			if(!isspace((unsigned char)*err)) { //si la ligne contient autre chose qu'un chiffre
				tab[0] = -1; tab[1] = -1;
				break;
			}
            tab[i] = valeur;
        }

		fclose(fichier);
    }


    return tab;
}

int typeTriangle(double a, double b, double c) {
    if( a<0 || b<0 || c<0) return -1;
    if(c >= a+b || b >= a+c || a>=b+c ) return -1; //si ce n'est pas un triangle
    if(a==b && a==c) return 3;
    if(a==b || a==c || b==c) return 2;
    return 1;
}
