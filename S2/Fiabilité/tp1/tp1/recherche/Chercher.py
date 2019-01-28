"""
@author Sébastien Gonzalez
@author Younes Rouahbia
"""
class Chercher:
	def __init__(self, tab=[]):
		self.tab = tab;

	def ChercherElement(self, elt):
		if(self.tab is None):
			return -1
		i=0
		for nombre in self.tab:
			if nombre==elt:
				return i
			i+=1;
		return -1

