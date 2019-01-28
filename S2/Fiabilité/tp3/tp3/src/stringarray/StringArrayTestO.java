package stringarray;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.Before;
import org.junit.After;

import stringarray.StringArray;

public class StringArrayTestO{

	private static String[] slist1={
			"a","b","ccc","ccd","d","e","f","g"
		};
		private static String[] slist2={
			"ab","ccd","ccc","g","f","e","d"
		};
		
		private static String[] slist3 = { "ab", "ab"};

		private StringArray array1;
		private StringArray array2;
		private StringArray array3;

		@Before
		public void setUp() throws Exception {		
	        System.out.println("debut du test");
		}
		@After
		public void tearDown() {
			System.out.println("fini");
		}
		
		@Test
		public void testStringArray() {
			array1=new StringArray(slist1);
			array2=new StringArray(slist2);	
			assertEquals(8,array1.size());		
			assertEquals(7,array2.size());	
		}
		
		@Test
		public void testStringArray3() {
			array3 = new StringArray(slist3);
			assertEquals(1, array3.size());
		}

		@Test
		public void test1IndexOf() {
			array2=new StringArray(slist2);
			assertEquals(-1,array2.IndexOf("ee"));
		}
		
		@Test
		public void test2IndexOf() {
			array2=new StringArray(slist2);
			assertEquals(3,array2.IndexOf("d"));
		}
		
		@Test
		public void testGetString() {
			array2 = new StringArray(slist2);
			assertEquals("ccd", array2.getString(2));
		}
		
}
