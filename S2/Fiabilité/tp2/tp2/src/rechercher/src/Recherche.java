/**
 * @authror Sébastien Gonzalez
 * @author Younes Rouabhia
 */
package rechercher.src;

public class Recherche {

	public static int chercherElt(int val, int[] tab) {
		if(tab == null) return -1;
		for(int i=0; i<tab.length; i++) {
			if(tab[i] == val) return i;
		}
		return -1;
	}
}
