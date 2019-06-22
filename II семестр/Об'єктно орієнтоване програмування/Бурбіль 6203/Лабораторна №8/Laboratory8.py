from OOP.LAB7 import DoubleList as DL
import unittest

class Tests(unittest.TestCase, DL):

    def test_add(self):
        self.res = a.add(3)
        self.assertTrue(self.res)

    def test_add_v2(self):
        self.res = a.add(3)
        self.assertFalse(self.res)

    def test_addALL(self):
        self.res = a.addAll(5, 6, 7)
        self.assertTrue(self.res)

    def test_addALL_v2(self):
        self.res = a.addAll(4, 5, 8, "a")
        self.assertTrue(self.res)

    def test_addALL_v20(self):
        self.res = a.addAll()
        self.assertFalse(self.res)

    def test_remove(self):
        self.res = a.remove(6)
        self.assertEqual(self.res, [3, 5, 7, 4, 8, "a"])

    def test_remove_v2(self):
        self.res = a.remove(9)
        self.assertFalse(self.res)

    def test_remove_v20(self):
        self.res = a.remove()
        self.assertFalse(self.res)

    def test_removeALL(self):
        self.res = a.removeAll(3, 5, 7)
        self.assertEqual(self.res, [4, 8, "a"])

    def test_removeALL_v2(self):
        self.res = a.removeAll()
        self.assertFalse(self.res)

    def test_removeALL_v20(self):
        self.res = a.removeAll(9, 10)
        self.assertFalse(self.res)

    def test_equals(self):
        self.res = a.equals()
        self.assertFalse(self.res)
        self.res = a.equals(12, 0)
        self.assertFalse(self.res)
        self.res = a.equals(*a.toArray())
        self.assertTrue(self.res)

    def test_retain(self):
        self.res = a.retainAll(4)
        self.assertTrue(self.res)
        self.res = a.retainAll()
        self.assertFalse(self.res)
        self.res = a.retainAll(12)
        self.assertFalse(self.res)

    def test_size(self):
        self.res = a.size
        self.assertEqual(self.res, 1)

    def test_to_array(self):
        self.res = a.toArray()
        self.assertEqual(self.res, [4])

    def test_empty(self):
        self.res = a.isEmpty()
        self.assertFalse(self.res)
        self.res = b.isEmpty()
        self.assertTrue(self.res)

    def test_containsALL(self):
        self.res = a.containsAll(4, 8, "a")
        self.assertTrue(self.res)
        self.res = a.containsAll(4, 8, 9)
        self.assertFalse(self.res)
        self.res = a.containsAll()
        self.assertFalse(self.res)

    def test_contains(self):
        self.res = a.contains(4)
        self.assertTrue(self.res)
        self.res = b.contains(45)
        self.assertFalse(self.res)
        self.res = a.contains()
        self.assertFalse(self.res)

a = DL()
b = DL()
if __name__ == "__main__":
    unittest.main()
