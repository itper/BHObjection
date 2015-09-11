//
//  main.c
//  BHTest
//
//  Created by chendi on 15/8/10.
//  Copyright (c) 2015年 liupeng. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

struct Person{
    char name[20];
    int age;
} student1 = {"aaa",10};

int main(int argc, const char * argv[]) {
    
    FILE *fp;
    char ch,filename[10];
    printf("输入文件名：");
    scanf("%s",filename);
    if((fp=fopen(filename, "w"))==NULL){
        printf("无法打开文件");
        exit(0);
    }
    ch = getchar();
    printf("");
    ch = getchar();
    while (ch!='#') {
        fputc(ch, fp);
        putchar(ch);
        ch = getchar();
    }
    fclose(fp);
    putchar(10);
    
    
    
    
    void change(struct Person);
    struct Person st2 = {"123123",.age=20};
    struct Person st3;
    st3.age = 100;
    change(st3);
    printf("st3:%d\n",st3.age);
    printf("%s",student1.name);
    printf("%s",st2.name);
    // insert code here...
//    char string[] = "hello world";
    char *string = "hello world";
    char *p = string;
    printf("%c,%lu",*(p++),sizeof(string));
    for (int i = 0; string[i]!='\0'; i++) {
        printf("%c-\n",*(string+i));
    }
    return 0;
}

void change(struct Person p){
    p.age = 0;
}
