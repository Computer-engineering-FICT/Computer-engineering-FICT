package com.lab111.labwork2;

/**
 * Class for testing.
 * @author Nightingale
 *
 */
public final class Test {

  /**
   * Constructor.
   *
   */
  private Test() {
    super();
  }
  
  /**
   * Invokes at application startup.
   * @param args Parameters from command line
   */
  public static void main(final String[] args) {
	  Cl1 censoredCl1 = new Cl1();
	  Cl2 censoredCl2 = new Cl2();
	  Cl3 mostlyCensoredCl3 = new Cl3();
	  
	  censoredCl1.meth1(); // de-bill
	  censoredCl2.meth2(); // If2 is implemented too
	  censoredCl2.meth3(); // also we dance a polka
	  mostlyCensoredCl3.meth3(); // surely, it is almost tricky
	  censoredCl1.meth2(); // yep, this is also an instance of buried
	  censoredCl1.meth3(); // in a lab works
  
  

  }

}
