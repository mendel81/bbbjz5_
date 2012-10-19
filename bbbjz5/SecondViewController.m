//
//  SecondViewController.m
//  bbbjz5
//
//  Created by Synapse Asesores Informaticos, S.L. on 15/10/12.
//  Copyright (c) 2012 Synapse Asesores Informaticos, S.L. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Second", @"Second");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//! IBAction del boton insertado en la vista. Nos modifica el UILabel presentación con lo que contiene el UITextFiel y nos esconde el teclado (resignFirstResponder)
//! @param sender
//! @return 
-(IBAction)hola:(id)sender{
    presentacion.text =[NSString stringWithFormat:@"Buenas tardes: %@", nombre.text];
    [nombre resignFirstResponder];
}

-(IBAction)changeBackground:(id)sender{

    switch (background.selectedSegmentIndex) {
        case 0:
            self.view.backgroundColor= [UIColor redColor];
            break;
        case 1:
            self.view.backgroundColor= [UIColor greenColor];
            break;
        case 2:
            self.view.backgroundColor= [UIColor blueColor];
            break;
        case 3:
            self.view.backgroundColor= [UIColor whiteColor];
            break;
        default:
            break;
    }
}

@end
