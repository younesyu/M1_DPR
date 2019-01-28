package stringarray;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.After;

public class StringArrayTest {

	private static String[] slist1 = { "a", "b", "ccc", "ccd", "d", "e", "f", "g" };
	private static String[] slist2 = { "ab", "ccd", "ccc", "g", "f", "e", "d" };
	private static String[] slist3 = { "ab", "ab"};
	private static String[] slist4 = { "ab", "c", "ab", "c"};

	private StringArray array1;
	private StringArray array2;
	private StringArray array3;
	private StringArray array4;

	@Before
	public void setUp() throws Exception {
		//System.out.println("debut du test");
	}

	@After
	public void tearDown() {
		//System.out.println("fini");
	}

	@Test
	public void testStringArray() {
		array1 = new StringArray(slist1);
		assertEquals(8, array1.size());
	}

	@Test
	public void testStringArray2() {
		array2 = new StringArray(slist2);
		assertEquals(7, array2.size());
	}
	
	@Test
	public void testStringArray3() {
		array3 = new StringArray(slist3);
		assertEquals(1, array3.size());
	}
	
	@Test
	public void testStringArray4() {
		array4 = new StringArray(slist4);
		assertEquals(3, array4.size());
	}
	
	@Test
	public void testStringArrayVide() {
		array4 = new StringArray(new String[] {});
		assertEquals(0, array4.size());
	}

	@Test
	public void test1IndexOf() {
		array2 = new StringArray(slist2);
		assertEquals(-1, array2.IndexOf("ee"));
	}

	@Test
	public void test2IndexOf() {
		array2 = new StringArray(slist2);
		assertEquals(3, array2.IndexOf("d"));
	}

	@Test
	public void testGetString() {
		array2 = new StringArray(slist2);
		assertEquals("ccd", array2.getString(2));
	}
	
	@Test
	public void testSlistArray() {
		array1 = new StringArray(slist1);
		assertEquals(slist1[2], array1.getString(2));
	}

}
