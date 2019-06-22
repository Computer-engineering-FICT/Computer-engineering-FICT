package lab62;

import static org.junit.Assert.*;

import java.util.Iterator;

import org.junit.Before;
import org.junit.Test;

public class TestReadWriteSweets {
	CollectionSweets col;
	ReadWriteSwets r ;
	Sweets sweets1;
	Sweets sweets2;
	@Before
	public void setUp() throws Exception {
		Sweets sw1= new Sweets(10, 50, 90, "name");
		Sweets sw2 = new Sweets(20, 40, 60, "name");
		col = new CollectionSweets();
		col.add(sw1);
		r = new ReadWriteSwets(col);
		sweets1=sw1;
		sweets2 = sw2;
	}

	@Test
	public final void testWriteReadCollection() {
		Sweets sw1 = null;
		try {
			sw1= new Sweets(10, 50, 90, "name");
		} catch (SweetException e) {
			e.printStackTrace();
		}
		r.writeCollection();
		CollectionSweets colsw = r.readCollection();
		assertTrue(colsw.add(sw1)==false);
	}

	@Test
	public final void testWriteReadMasSweets() {
		col.add(sweets2);
		r.writeMasSweets();
		Sweets [] sw = r.readMasSweets();
		assertTrue(sw[0].getOtherInfo().equals(sweets1.getOtherInfo()));
		assertTrue(sw[1].getOtherInfo().equals(sweets2.getOtherInfo()));
	}


	@Test
	public final void testWriteReadInfoSweets() throws SweetException {
		CollectionSweets sweets = new CollectionSweets();
		sweets.add(sweets1);
		ReadWriteSwets rws = new ReadWriteSwets(sweets);
		rws.writeInfoSweets();
		assertTrue(rws.readInfoSweets().equals(sweets1.getOtherInfo().concat(" ")));
	}

}
