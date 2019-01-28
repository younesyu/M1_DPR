/**
* @author Sébastien Gonzalez
* @author Younes Rouahbia
* Utilisation : obtenir le fichier .o de triangle.c
*			gcc -c triangle.c
*  			obtenir l'executable du fichier testReadData.c
*			 gcc -Wall -o testReadData testReadData.c triangle.o -lcunit
**/
#include "triangle.h"
#include <CUnit/CUnit.h>
#include <CUnit/Basic.h>

double tabValide[3] = {12,12,12};
double tabErreur[3] = {-1,-1,-1};

int init_suite(void) { return 0;}
int clean_suite(void){return 0;}

void testFichierValide(void) {
	double* tab2 = readData("FichierTriangle/Valide.txt");
	CU_ASSERT_EQUAL(tab2[0], tabValide[0]);
	CU_ASSERT_EQUAL(tab2[1], tabValide[1]);
	CU_ASSERT_EQUAL(tab2[2], tabValide[2]);
}

void testFichierMauvaisNombreDeLigne(void) {
	double* tab2 = readData("FichierTriangle/MauvaisNombreDeLigne.txt");
	CU_ASSERT_EQUAL(tab2[0], tabErreur[0]);
	CU_ASSERT_EQUAL(tab2[1], tabErreur[1]);
	CU_ASSERT_EQUAL(tab2[2], tabErreur[2]);
}

void testFichierMauvaisFormatDeLigne(void) {
	double* tab2 = readData("FichierTriangle/LigneIncorrect.txt");
	CU_ASSERT_EQUAL(tab2[0], tabErreur[0]);
	CU_ASSERT_EQUAL(tab2[1], tabErreur[1]);
	CU_ASSERT_EQUAL(tab2[2], tabErreur[2]);
}

void testFichierInexistant(void) {
	double* tab2 = readData("FichierTriangle/ceFichierExistePas.txt");
	CU_ASSERT_EQUAL(tab2[0], tabErreur[0]);
	CU_ASSERT_EQUAL(tab2[1], tabErreur[1]);
	CU_ASSERT_EQUAL(tab2[2], tabErreur[2]);
}

void testFichierBinaire(void) {
	double* tab2 = readData("FichierTriangle/binaire");
	CU_ASSERT_EQUAL(tab2[0], tabErreur[0]);
	CU_ASSERT_EQUAL(tab2[1], tabErreur[1]);
	CU_ASSERT_EQUAL(tab2[2], tabErreur[2]);
}

/* Mise en place des tests via main */
int main(void){
  CU_pSuite pSuite = NULL;
  /*initialise le catalogue de tests*/
  printf("initialize test registry\n");
  if (CUE_SUCCESS != CU_initialize_registry()) {
    return CU_get_error();
  }
  printf("add suite to testregistry\n");
  /*ajoute une suite de tests au catalogue */
  /*la suite de test n'a qu'un seul test ici!!!*/
  pSuite = CU_add_suite("essaiTestSuite", init_suite, clean_suite);
  if (pSuite == NULL){
    CU_cleanup_registry();
    return CU_get_error();
  }

  /*ajouter les  tests � la suite */
  printf("add first test\n");
  if (     (CU_add_test(pSuite,"testFichierValide", testFichierValide) == NULL)
	|| (CU_add_test(pSuite,"testFichierMauvaisNombreDeLigne", testFichierMauvaisNombreDeLigne) == NULL)
	|| (CU_add_test(pSuite,"testFichierMauvaisFormatDeLigne", testFichierMauvaisFormatDeLigne) == NULL)
	|| (CU_add_test(pSuite,"testFichierInexistant", testFichierInexistant) == NULL)
	|| (CU_add_test(pSuite,"testFichierBinaire", testFichierBinaire) == NULL))
	 {
    CU_cleanup_registry();
    return CU_get_error();
  }

  /*Run all tests using the basic interface */
  printf("start execution\n");
  CU_basic_set_mode(CU_BRM_VERBOSE);
  CU_basic_run_tests();
  printf("termine\n\n");
  CU_basic_show_failures(CU_get_failure_list());

  /*Clean up registry and return*/
  CU_cleanup_registry();
  return CU_get_error();

}


