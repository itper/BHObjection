//
//  file1.c
//  BHTest
//
//  Created by chendi on 15/8/10.
//  Copyright (c) 2015年 liupeng. All rights reserved.
//

#include "file1.h"

static int A;
static int power(int n){
    int i,y = 1;
    for (i = 1; i<10; i++) {
        y*=A;
    }
    return y;
}