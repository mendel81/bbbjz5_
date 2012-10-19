//
//  FourthViewController.m
//  bbbjz5
//
//  Created by Synapse Asesores Informaticos, S.L. on 15/10/12.
//  Copyright (c) 2012 Synapse Asesores Informaticos, S.L. All rights reserved.
//

#import "FourthViewController.h"

#import "FifthViewController.h"

@interface FourthViewController ()

@end

@implementation FourthViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Asistentes", @"Asistentes");
        self.tabBarItem.image = [UIImage imageNamed:@"four"];
        //reservamos memoria para el controlador de la vista que será la inicial en el navigation Controller
        FifthViewController *asistentes = [[FifthViewController alloc] initWithNibName:@"FifthViewController" bundle:nil];
        [self addChildViewController:asistentes];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
