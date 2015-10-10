//
//  BHGreaterThanOrEqualsToController.m
//  BHAutolayout
//
//  Created by chendi on 15/9/21.
//  Copyright © 2015年 liupeng. All rights reserved.
//

#import "BHGreaterThanOrEqualsToController.h"

@interface BHGreaterThanOrEqualsToController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *ratioConstraint;
@property (nonatomic,retain)NSLayoutConstraint *constraint;
@property (nonatomic,retain)UIView *testView;
@property (nonatomic,assign)NSInteger *tag;
@end

@implementation BHGreaterThanOrEqualsToController{
    NSArray *friend;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tag = 0;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    self->friend = [NSMutableArray array];
    BHGreaterThanOrEqualsToController *controller;
    controller->friend = [NSArray array];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    if(self.tag == 0){
        
        [self createView];
    }else{
        
        [self.view removeConstraint:_constraint];
        NSLayoutConstraint *equal = [NSLayoutConstraint
                                     constraintWithItem:self.testView
                                     attribute:NSLayoutAttributeWidth
                                     relatedBy:NSLayoutRelationEqual
                                     toItem:self.view
                                     attribute:NSLayoutAttributeWidth
                                     multiplier:_constraint.multiplier-0.1
                                     constant:0
                                     ];
        equal.priority = _constraint.priority;
        [self.view addConstraint:equal];
        _constraint = equal;
        [UIView animateWithDuration:0.33 animations:^{
            [self.view layoutIfNeeded];
        }];
    }
    
    
    self.tag++;
}

-(void)createView{
    
    UIView *view1 = UIView.new;
    view1.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:view1];
    view1.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:view1
                              attribute:NSLayoutAttributeTop
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.view
                              attribute:NSLayoutAttributeTop
                              multiplier:1
                              constant:10]];
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:view1
                              attribute:NSLayoutAttributeBottom
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.view
                              attribute:NSLayoutAttributeBottom
                              multiplier:1
                              constant:-10]];
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:view1
                              attribute:NSLayoutAttributeLeft
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.view
                              attribute:NSLayoutAttributeLeft
                              multiplier:1
                              constant:10]];
    
    NSLayoutConstraint *equal1 = [NSLayoutConstraint
                                  constraintWithItem:view1
                                  attribute:NSLayoutAttributeWidth
                                  relatedBy:NSLayoutRelationGreaterThanOrEqual
                                  toItem:nil
                                  attribute:NSLayoutAttributeWidth
                                  multiplier:1
                                  constant:110
                                  ];
    [self.view addConstraint:equal1];

//    [self.view addConstraint:[NSLayoutConstraint
//                              constraintWithItem:view1
//                              attribute:NSLayoutAttributeRight
//                              relatedBy:NSLayoutRelationEqual
//                              toItem:self.view
//                              attribute:NSLayoutAttributeRight
//                              multiplier:1
//                              constant:-10]];
    NSLayoutConstraint *equal = [NSLayoutConstraint
                                 constraintWithItem:view1
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                 toItem:self.view
                                 attribute:NSLayoutAttributeWidth
                                 multiplier:1
                                 constant:0
                                 ];
    
    equal.priority = 750;
    
    _constraint = equal;
    self.testView = view1;
    [self.view addConstraint:equal];
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
