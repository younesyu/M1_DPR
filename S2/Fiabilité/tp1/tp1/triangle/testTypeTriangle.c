/**
* @author Sébastien Gonzalez
* @author Younes Rouahbia
* Utilisation : obtenir le fichier .o de triangle.c
*			gcc -c triangle.c
*  			obtenir l'executable du fichier testTypeTriangle.c
*			 gcc -Wall -o testTypeTriangle testTypeTriangle.c triangle.o -lcunit
**/
#include "triangle.h"
#include <CUnit/CUnit.h>
#include <CUnit/Basic.h>

/*Test suites and clean up functions*/
int init_suite(void) { return 0;}
int clean_suite(void){return 0;}

void testTypeTriangleEquilateral(void) {
    double a = 10;
    CU_ASSERT_EQUAL(typeTriangle(a,a,a), 3);
}

void testTypeTriangleIsocele(void) {
    double a = 10;
    double b=15;
    CU_ASSERT_EQUAL(typeTriangle(a,a,b), 2);
}

void testTypeTriangleScalene(void) {
    double a = 10;
    double b = 11;
    double c = 12;
    CU_ASSERT_EQUAL(typeTriangle(a,b,c), 1);
}

void testTriangleIncorrect(void) {
	double a=12;
	double b=1;
	CU_ASSERT_EQUAL(typeTriangle(a,b,b), -1);
}

void testTriangleValeurNulle(void) {
	double a=0;
	CU_ASSERT_EQUAL(typeTriangle(a,a,a), -1);
}

void testTriangleValeurNegative(void) {
	double a=-1;
	CU_ASSERT_EQUAL(typeTriangle(a,a,a), -1);
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
  if (   (CU_add_test(pSuite,"testTypeTriangleEquilateral", testTypeTriangleEquilateral) == NULL) 
      || (CU_add_test(pSuite,"testTypeTriangleIsocele", testTypeTriangleIsocele) == NULL)
      || (CU_add_test(pSuite,"testTypeTriangleScalene", testTypeTriangleScalene) == NULL)
	  || (CU_add_test(pSuite,"testTriangleIncorrect", testTriangleIncorrect) == NULL)
	  || (CU_add_test(pSuite,"testTriangleValeurNulle", testTriangleValeurNulle) == NULL)
	  || (CU_add_test(pSuite,"testTriangleValeurNegative", testTriangleValeurNegative) == NULL) )
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


