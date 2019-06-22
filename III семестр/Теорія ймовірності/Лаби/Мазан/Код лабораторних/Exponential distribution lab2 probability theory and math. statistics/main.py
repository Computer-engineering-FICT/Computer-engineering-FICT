import random
import math

#random.seed(0)
# function_lambda = float(input("Input lambda: "))

x_i = lambda u_i, func_lambda: (-1/func_lambda)*math.log(1-u_i,math.e)
#
# initials = [random.random() for i in range(5000)]
# exponential_distr = [x_i(i) for i in initials]
#
# summary = sum(exponential_distr)


#print("Probability of appearance of generated number in range [3,6]: " + str(probability))
# print("\nGenerated numbers with exponential distribution:")
# print(exponential_distr)
# print(summary)

def test():
    counter = 0
    for k in range(10000):
        test_lambda = 10.0
        initials = [random.random() for i in range(5000)]
        exponential_distr_test = [x_i(i, test_lambda) for i in initials]
        test_sum = sum(exponential_distr_test)
        #print(exponential_distr_test)
        print("Test sum number "+ str(k+1) + ": " + str(test_sum))
        if test_sum > 480:
            counter+=1
    print("Tested probability: " + str(counter/10000.0))


test()
#math_expectation = sum(exponential_distr)/counter
#print("Calculated expected value for generated numbers: " + str(math_expectation))

#variance = sum([i**2 for i in exponential_distr])/counter-math_expectation**2
#print("\nCalculated variance for generated numbers: " + str(variance))