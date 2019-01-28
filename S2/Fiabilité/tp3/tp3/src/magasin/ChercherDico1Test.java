package magasin;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Before;
import org.junit.Test;

public class ChercherDico1Test {

	Magasin magasin;
	Magasin magasin2;
	Article article;
	Article article5;
	Article article2;
	Article article3;
	Article article4;
	Article article6;
	@Before
	public void init() {
		article = new Article("Chaussure", 25, 1);
		article5 = new Article("Chaussette", 30, 2);
		article2 = new Article("Pantoufle", 10, 3);
		article3 = new Article("Pancho", 45, 4);
		article4 = new Article("Burqua", 50, 5);
		article6 = new Article("Pas present", 20, 6);
		
		magasin = new Magasin(10);
		magasin.insererArticle(article);
		magasin.insererArticle(article2);
		magasin.insererArticle(article3);
		magasin.insererArticle(article4);
		magasin.insererArticle(article5);
		
		magasin2 = new Magasin(10);
	}
	
	@Test(timeout = 1000)
	public void testArticlePresent() {
		assertTrue(magasin.chercherDicho1(article));
	}
	
	@Test(timeout = 1000)
	public void testArticleIndice0() {
		assertTrue(magasin.chercherDicho1(article2));
	}
	
	@Test(timeout = 1000)
	public void testArticleDernierIndice() {
		assertTrue(magasin.chercherDicho1(article4));
	}
	
	@Test(timeout = 1000)
	public void testArticleNonPresent() {
		assertFalse(magasin.chercherDicho1(article6));
	}
	
	
	
	
}
