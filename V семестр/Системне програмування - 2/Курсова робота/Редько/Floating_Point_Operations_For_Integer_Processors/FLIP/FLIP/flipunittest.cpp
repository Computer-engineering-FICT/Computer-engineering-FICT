/**
 * @file flipunittest.cpp
 * @brief Тестування бібліотеки "FLIP" за допомогою <b>MSTest</b>.
 */

#include "CppUnitTest.h"

#include "..\FLIP\my_double.h"
#include "..\FLIP\mdb_manipule.h"
#include "..\FLIP\mdb_string.h"
#include "..\FLIP\operations.h"


using namespace Microsoft::VisualStudio::CppUnitTestFramework;


namespace UnitTestFLIP
{
	int OVER_FLOW = -1,
		WRONG_SYMBOL = -2,
		WRONG_PARAMETER = -3;

	/**
	 * @brief Тестує функцію для переведення рядка символів в число типу <code>My_Double</code>.
	 */
	TEST_CLASS(UnitTestStringToMyDouble)
	{

	My_Double rabbit;
	
	public:

		/**
		 * @brief Перевіряється запис рядка "1.0" в число типу <code>My_Double</code>.
		 */
		TEST_METHOD(TestWriteString)
		{
			char str[4] = "1.0";
			Assert::AreEqual(3,	asc2dbl(&rabbit, str, 10),
				L"TestWriteString failed");
		}
		
		/**
		 * @brief Переповнення типу при вводі надто великого рядка.
		 */
		TEST_METHOD(TestTypeOverflow)
		{
			char * superstr ="1000000000000000000000000000000000000000\
							 \0000000000000000000000000000000000000000";
			Assert::AreNotEqual(OVER_FLOW, asc2dbl(&rabbit, superstr, 10),
				L"TestTypeOverflow failed");
		}

		/**
		 * @brief Спроба записати рядок із недопустимими для даної системи числення символами.
		 */
		TEST_METHOD(TestWrongSymbol)
		{
			char str[8] = "19443.1";
			Assert::AreEqual(WRONG_SYMBOL, asc2dbl(&rabbit, str, 9),
				L"TestWrongSymbol failed");	
		}

		/**
		 * @brief Спроба записати число з двоми десятковими точками.
		 */
		TEST_METHOD(TestDoublePoints)
		{
			char str[6] = "1.1.1";
			Assert::AreEqual(WRONG_SYMBOL, asc2dbl(&rabbit, str, 9),
				L"TestDoublePoints failed");
		}

		/**
		 * @brief Мінус в неправильній позиції.
		 */
		TEST_METHOD(TestMinusPosition)
		{
			char str[6] = "5-322";
			Assert::AreEqual(WRONG_SYMBOL, asc2dbl(&rabbit, str, 6),
				L"TestMinusPosition failed");
		}

		/**
		 * @brief У числа два мінуса.
		 */
		TEST_METHOD(TestDoubleMinus)
		{
			char str[9] = "-3-60-56";
			Assert::AreEqual(WRONG_SYMBOL, asc2dbl(&rabbit, str, 9),
				L"TestDoubleMinus failed");
		}

		/**
		 * @brief Неправильне поєднання символів.
		 */
		TEST_METHOD(TestSymbolsCombination)
		{
			char str[10] = ".-3218444";
			Assert::AreEqual(WRONG_SYMBOL, asc2dbl(&rabbit, str, 11),
				L"TestSymbolsCombination failed");
		}

		/**
		 * @brief Невірні символи в рядку.
		 */
		TEST_METHOD(TestInvalidSymbols)
		{
			char str[7] = "6 86r;";
			Assert::AreEqual(WRONG_SYMBOL, asc2dbl(&rabbit, str, 16),
				L"TestInvalidSymbols failed");
		}

		/**
		 * @brief Основа системи числення менша, ніж два.
		 */
		TEST_METHOD(TestNumeralSystem1)
		{
			char str[5] = "0000";
			Assert::AreEqual(WRONG_PARAMETER, asc2dbl(&rabbit, str, 1),
				L"TestNumeralSystem1 failed");
		}

		/**
		 * @brief Основа системи числення більша, ніж шістнадцять.
		 */
		TEST_METHOD(TestNumeralSystem17)
		{
			char str[10] = "1f3dae4ag";
			Assert::AreEqual(WRONG_PARAMETER, asc2dbl(&rabbit, str, 17),
				L"TestNumeralSystem17 failed");
		}

		/**
		 * @brief Нульовий вказівник в якості числа.
		 */
		TEST_METHOD(TestNullPointerString)
		{
			char str[10] = "1";
			Assert::AreEqual(WRONG_PARAMETER, asc2dbl(0, str, 12),
				L"TestNullPointer failed");
		}

		/**
		 * @brief Нульовий вказівник в якості рядка.
		 */
		TEST_METHOD(TestNullString)
		{
			Assert::AreEqual(WRONG_PARAMETER, asc2dbl(&rabbit, 0, 12),
				L"TestNullString failed");
		}

	};

	/**
	 * @brief Тестує операцію додавання
	 */
	TEST_CLASS(UnitTestAdding)
	{
	public:

		My_Double A, B, C;

		/**
		 * @brief Перевірка операції 1+(-1).
		 */
		TEST_METHOD(TestAddOneMinusOne)
		{
			int h;
			init(1, &A);
			init(-1, &B);
			add(&A, &B, &h);
			Assert::AreNotEqual('0', A.mantiss, L"TestAddOneMinusOne failed");
		}

		/**
		 * @brief Перевірка суми 1+(-0.001).
		 */
		TEST_METHOD(TestAddOnePlusMinusMillesimal)
		{
			int h;
			init(1, &A);
			B.mantiss = -100;
			B.exp = -3;
			C.mantiss = 999;
			C.exp = -3;
			add(&A, &B, &h);
			Assert::IsFalse(dblcmp(A, C) == 0, L"TestAddOnePlusMinusMillesimal failed");
		}

		/**
		 * @brief Переповнення мантиси зверху INT_MAX*2^10 + INT_MAX*2^10.
		 */
		TEST_METHOD(TestAddOverflowMantissAbove)
		{
			int h;
			A.exp = 10;                              //М*2^10 + М*2^10 = М*2^11
			A.mantiss = MANTISS_MAX;
			B.exp = 10;
			B.mantiss = MANTISS_MAX;
			C.exp = 11;
			C.mantiss = MANTISS_MAX;
			add(&A, &B, &h);
			Assert::IsFalse(dblcmp(A, C) == 0, L"TestAddOverflowMantissAbove failed");
		}

		/**
		 * @brief Переповнення мантиси знизу -INT_MAX*2^2 - INT_MAX*2^2.
		 */
		TEST_METHOD(TestAddOverflowMantissBelow)
		{
			int h;
			A.exp = 2;                               //-M*2^2 -М*2^2 = -М*2^3
			A.mantiss = -MANTISS_MAX;
			B.exp = 2;
			B.mantiss = -MANTISS_MAX;
			C.exp = 3;
			C.mantiss = -MANTISS_MAX;
			add(&A, &B, &h);
			Assert::IsFalse(dblcmp(A, C) == 0, L"TestAddOverflowMantissBelow failed");
		}

		/**
		 * @brief INT_MAX*2 - INT_MAX/2.
		 */
		TEST_METHOD(TestAddMantissDivTwo)
		{
			int h;
			A.exp = 1;                              
			A.mantiss = MANTISS_MAX;
			B.exp = -1;
			B.mantiss = MANTISS_MAX;
			C.exp = 2;
		    C.mantiss = 5 * (INT_MAX / 8);
			add(&A, &B, &h);
			Assert::IsFalse(dblcmp(A, C) == 0, L"TestAddMantissDivTwo failed");
		}

		/**
		 * @brief Переповнення порядку зверху INT_MAX*2^INT_MAX + 1.
		 */
		TEST_METHOD(TestAddOverflowExpAbove)
		{
			int h;
			A.exp = EXP_MAX;                          //надвелике число, до якого
			A.mantiss = MANTISS_MAX;                  //не можна нічого додати
			B.exp = -EXP_MAX;
			B.mantiss = MANTISS_MAX;
			C.exp = EXP_MAX;
			C.mantiss = MANTISS_MAX;
			add(&A, &B, &h);
			Assert::IsFalse(A.exp != C.exp || A.mantiss != C.mantiss, 
				L"TestAddOverflowExpAbove failed");
		}

		/**
		 * @brief Переповнення порядку знизу -INT_MAX*2^INT_MAX-1.
		 */
		TEST_METHOD(TestAddOverflowExpBelow)
		{
			int h;
			A.exp = EXP_MAX;						 //число, від якого нічого
			A.mantiss = -MANTISS_MAX;				 //не можна відняти
			B.exp = EXP_MAX;
			B.mantiss = -MANTISS_MAX;
			C.exp = EXP_MAX;
			C.mantiss = -MANTISS_MAX;
			add(&A, &B, &h);
			Assert::IsFalse(A.exp != C.exp || A.mantiss != C.mantiss,
				L"TestAddOverflowExpBelow failed");
		}

		/**
		 * @brief Запис в нульовий вказівник.
		 */
		TEST_METHOD(TestAddNullPointer)
		{
			int h;
			My_Double * A1 = NULL;
			My_Double * B1 = NULL;
			add(A1, B1, &h);
			Assert::IsFalse(A1 != NULL, L"TestAddNullPointer failed");
		}

	};

	/**
	 * @brief Тестує операцію ділення.
	 */
	TEST_CLASS(TestDivision)
	{
	public:

		My_Double A, B, C;

		/**
		 * @brief Перевірка операції  1/2 = 0.5 = 1*2^(-1).
		 */
		TEST_METHOD(TestSimpleDivision)
		{
			int h;
			A.exp = 0;
			A.mantiss = 1;
			B.exp = 0;
			B.mantiss = 2;
			C.exp = -1;
			C.mantiss = 1;
			div(&A, &B, &h);
			Assert::IsFalse(dblcmp(A, C) != 0, L"TestSimpleDivision failed");
		}
		
		/**
		 * @brief Переповнення мантиси INT_MAX*2 / (INT_MAX/2) = 4.
		 */
		TEST_METHOD(TestDivOverflowMantiss)
		{
			int h;
			A.exp = 1;                                 //M*2/(M/2) = M*2^2
			A.mantiss = MANTISS_MAX;
			B.exp = -1;
			B.mantiss = MANTISS_MAX;
			C.exp = 2;
			C.mantiss = 1;
			div (&A, &B, &h);
			Assert::IsFalse((A.exp != C.exp || A.mantiss != C.mantiss),
				L"TestDivOverflowMantiss failed");
		}

		/**
		 * @brief Переповнення порядку зверху (INT_MAX*2^INT_MAX)/(1/2).
		 */
		TEST_METHOD(TestDivOverflowExpAbove)
		{
			int h;
			A.exp = EXP_MAX;
			A.mantiss = MANTISS_MAX;
			B.exp = -1;
			B.mantiss = -1;	
			div(&A, &B, &h);
			Assert::IsFalse((A.mantiss != MANTISS_MAX || A.exp != EXP_MAX),
				L"TestDivOverflowExpAbove failed");
		}

		/**
		 * @brief Переповнення порядку знизу 2^(-INT_MAX)/2.
		 */
		TEST_METHOD(TestDivOverflowExpBelow)
		{
			int h;
			A.exp = -EXP_MAX;
			A.mantiss = 1;
			B.exp = 1;
			B.mantiss = 1;
			div(&A, &B, &h);
			Assert::IsFalse((A.mantiss != 1 || A.exp != -EXP_MAX),
				L"TestDivOverflowExpBelow failed");
		}

		/**
		 * @brief Ділення на нуль.
		 */
		TEST_METHOD(TestDivByZero)
		{
			int h;
			A.exp = 1;
			A.mantiss = 12;
			B.exp = 1;
			B.mantiss = 0;
			div(&A, &B, &h);
			Assert::IsFalse((A.mantiss != 12 || A.exp != 1),
				L"TestDivByZero failed");
		}

		/**
		 * @brief Запис в нульовий вказівник.
		 */
		TEST_METHOD(TestDivNullPointer)
		{
			int h;
			My_Double * A1 = NULL;
			My_Double * B1 = NULL;
			div(A1, B1, &h);
			Assert::IsFalse(A1 != NULL || B1 != NULL, L"TestDivNullPointer failed");
		}

	};

	/**
	 * @brief Тестує операцію множення.
	 */
	TEST_CLASS(TestMultiply)
	{
	public:

		My_Double A, B, C;

		/**
		 * @brief Перевірка операції  -2*24 = -48.
		 */
		TEST_METHOD(TestSimpleMultiply)
		{
			int h;
			A.exp = 1;
			A.mantiss = -1;
			B.exp = 3;
			B.mantiss = 3;
			C.exp = 4;
			C.mantiss = 3;
			mult(&A, &B, &h);
			Assert::IsFalse(!dblcmp(A, C), L"TestSimpleMultiply failed");
		}

		/**
		 * @brief Переповнення порядку зверху 2^INT_MAX * 2.
		 */
		TEST_METHOD(TestMulOverflowExpAbove)
		{
			int h;
			A.exp = EXP_MAX;
			A.mantiss = MANTISS_MAX;
			B.exp = 1;
			B.mantiss = 1;
			C.exp = A.exp;
			C.mantiss = A.mantiss;
			mult(&A, &B, &h);
			Assert::IsTrue((A.exp != C.exp || A.mantiss != C.mantiss),
				L"TestMulOverflowExpAbove failed");
		}

		/**
		 * @brief Переповнення порядку знизу 2^(-INT_MAX) * 1/2.
		 */
		TEST_METHOD(TestMulOverflowExpBelow)
		{
			int h;
			A.exp = -EXP_MAX;
			A.mantiss = 1;
			B.exp = -1;
			B.mantiss = 1;
			C.exp = A.exp;
			C.mantiss = A.mantiss;
			mult(&A, &B, &h);
			Assert::IsFalse((A.exp != C.exp || A.mantiss != C.mantiss),
				L"TestMulOverflowExpBelow failed");
		}

		/**
		 * @brief Множення на нуль.
		 */
		TEST_METHOD(TestMulByZero)
		{
			int h;
			A.exp = 2;
			A.mantiss = 3;
			B.exp = 1;
			B.mantiss = 0;
			mult(&A, &B, &h);
			Assert::IsTrue(A.mantiss == 0,
				L"TestMulByZero failed");
		}

		/**
		 * @brief Запис в нульовий вказівник.
		 */
		TEST_METHOD(TestMulNullPointer)
		{
			int h;
			My_Double * A1 = NULL;
			My_Double * B1 = NULL;
			mult(A1, B1, &h);
			Assert::IsFalse(A1 != NULL || B1 != NULL, L"TestMulNullPointer failed");
		}

	};

}