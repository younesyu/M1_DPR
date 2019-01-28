package partialcovering;

import static org.junit.Assert.*;
import org.junit.Test;
import org.junit.Before;

public class TestPartialCover {
	private PartialCover obj = new PartialCover();

	@Before
	public void initTest() {
		@SuppressWarnings("unused")
		PartialCover obj = new PartialCover();
	}

	@Test
	public void  testZeroZero() {
		int x =0;
		int y = 0;
		int expected = 0;
		int value = obj.returnZeroOrOne(x, y);
		assertTrue(value == expected);
	}

	@Test
	public void  testOneZero() {
		int x = 1;
		int y = 0;
		int expected = 0;
		int value = obj.returnZeroOrOne(x, y);
		assertTrue(value == expected);
	}

	@Test
	public void  testZerOne() {
		int x = 0;
		int y = 1;
		int expected = 0;
		int value = obj.returnZeroOrOne(x, y);
		assertTrue(value == expected);
	}

	@Test
	public void  testOneOne() {
		int x = 1;
		int y = 1;
		int expected = 0;
		int value = obj.returnZeroOrOne(x, y);
		assertTrue(value == expected);
	}

}
