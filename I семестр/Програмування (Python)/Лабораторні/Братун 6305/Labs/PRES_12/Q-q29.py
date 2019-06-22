arr1 = [1, 2, 3, 4, 5]
arr2 = [10, 20, 30, 40, 50]
arr3 = [100, 200, 300, 400]
arr=[min(x,y,z) for (x, y, z) in zip(arr1,arr2,arr3)]
print(arr)
                                                                                                                    #[1, 2, 3, 4]
