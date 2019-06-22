import sys, traceback
try:
    х = 1 / 0
except ZeroDivisionError:
    (Type, Value, Trace) = sys.exc_info()
    print ("Туре: ", Type)
    print("Value:", Value)
    print("Trace:", Trace)

print("\n", "print exception()".center(40, "-"))
traceback.print_exception(Type, Value, Trace, file=sys.stdout)
print("\n", "print_tb()".center(40, "-" ))
traceback.print_tb(Trace, file=sys.stdout)
print("\n", "format_exception()". center ( 40, "-") )
print(traceback.format_exception(Type, Value, Trace, limit=5))
print("\n", "format_exception_only()".center(40, "-"))
print(traceback.format_exception_only(Type, Value))
