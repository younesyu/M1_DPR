"""
@author Sébastien Gonzalez
@author Younes Rouabhia
Utilisation : "python3 testChercher" pour executer l'ensemble des tests
"""
from Chercher import Chercher
import unittest

class testChercher(unittest.TestCase):

	#Creation du tableau au démarrage pour l'utiliser dans chaque test
	def setUp(self):
		self.test = Chercher([5,1,5,8])
		self.test2 = Chercher([])
		self.test3 = Chercher(None)

	def test_value_existante(self):
		self.assertEqual(1, self.test.ChercherElement(1) )	
		
	def test_value_indice_0(self):
		self.assertEqual(0, self.test.ChercherElement(5) )
	
	def test_value_indice_dernier(self):
		self.assertEqual(3, self.test.ChercherElement(8) )	
	
	def test_value_multi(self):
		self.assertEqual(0, self.test.ChercherElement(5) )

	def test_value_inconnue(self):
		self.assertEqual(-1, self.test.ChercherElement(15) )

	def test_tableau_vide(self):
		self.assertEqual(-1, self.test2.ChercherElement(15) )

	def test_tableau_nul(self):
		self.assertEqual(-1, self.test3.ChercherElement(15) )

unittest.main()
