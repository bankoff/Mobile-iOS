//
//  main.m
//  Objective-C-Fundamentals
//
//  Created by Admin on 10/23/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

NSArray *createSpiralMatrix(int matrixSize) {

  NSMutableArray *matrix = [NSMutableArray arrayWithCapacity:matrixSize];
  for (int i = 0; i < matrixSize; i++) {
    matrix[i] = [NSMutableArray arrayWithCapacity:matrixSize];

    for (int j = 0; j < matrixSize; j++) {
      matrix[i][j] = @"0";
    }
  }

  int maxNumber = matrixSize * matrixSize;

  int number = 1;
  int left = 0;
  int rigth = matrixSize - 1;
  int up = 0;
  int down = matrixSize - 1;

  while (number <= maxNumber) {
    for (int i = left; i <= rigth; i++) {
      matrix[up][i] = [NSString stringWithFormat:@"%i", number];
      number++;
    }
    up++;

    for (int i = up; i <= down; i++) {
      matrix[i][rigth] = [NSString stringWithFormat:@"%i", number];
      number++;
    }
    rigth--;

    for (int i = rigth; i >= left; i--) {
      matrix[down][i] = [NSString stringWithFormat:@"%i", number];
      number++;
    }
    down--;

    for (int i = down; i >= up; i--) {
      matrix[i][left] = [NSString stringWithFormat:@"%i", number];
      number++;
    }
    left++;
  }

  return matrix;
}

void printMatrix(NSArray *matrix) {
  NSMutableString *result = [[NSMutableString alloc] init];
  [result appendString:@"\n"];

  for (int i = 0; i < matrix.count; i++) {
    for (int j = 0; j < matrix.count; j++) {
      NSString *str = [NSString stringWithFormat:@"%@", matrix[i][j]];
      NSString *resultStr =
          [NSString stringWithFormat:@"%-5s", [str UTF8String]];
      [result appendString:resultStr];
    }
    [result appendString:@"\n"];
  }

  NSLog(@"%@", result);
}

int main(int argc, const char *argv[]) {
  @autoreleasepool {
    //      1. Create a matrix (array of arrays) that contains integer values
    //      using the schema and print them to the console

    //      1    2    3
    //      8    9    4
    //      7    6    5
    //
    //      1    2    3    4
    //      12   13   14   5
    //      11   16   15   6
    //      10   9    8    7
    //
    //      1    2    3    4    5
    //      16   17   18   19   6
    //      15   24   25   20   7
    //      14   23   22   21   8
    //      13   12   11   10   9

    NSArray *matrixWithSize3 = createSpiralMatrix(3);
    printMatrix(matrixWithSize3);

    NSArray *matrixWithSize4 = createSpiralMatrix(4);
    printMatrix(matrixWithSize4);

    NSArray *matrixWithSize5 = createSpiralMatrix(5);
    printMatrix(matrixWithSize5);

    //    2. Create a function that generates the above matrix by a given N
    NSLog(@"\n\nPlease enter matrix size:");
    int matrixSize;
    scanf("%d", &matrixSize);
    NSArray *matrixWithSizeN = createSpiralMatrix(matrixSize);
    printMatrix(matrixWithSizeN);
  }

  return 0;
}
