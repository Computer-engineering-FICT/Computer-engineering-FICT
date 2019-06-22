package com.lab111;

import com.lab111.labwork2.Cl1;
import com.lab111.labwork2.Cl2;
import com.lab111.labwork2.Cl3;

/**
 * @author Anastasia Brovchenko
 *
 */
public final class TestC1 {

  private TestC1() {
    super();
  }

  public static void main(final String[] args) {
    Cl1 a = new Cl1();
    a.meth1();
    a.meth2();
    a.meth3();

    Cl2 b = new Cl2();
    b.meth2();

    Cl3 c = new Cl3();
    c.meth2();
    c.meth3();
  }
}
