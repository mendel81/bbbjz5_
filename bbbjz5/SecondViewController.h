//
//  SecondViewController.h
//  bbbjz5
//
//  Created by Synapse Asesores Informaticos, S.L. on 15/10/12.
//  Copyright (c) 2012 Synapse Asesores Informaticos, S.L. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController <UITextFieldDelegate>{

    IBOutlet UILabel *presentacion;
    IBOutlet UITextField *nombre;
    IBOutlet UISegmentedControl *background;
    
}

-(IBAction)hola:(id)sender;
-(IBAction)changeBackground:(id)sender;


@end
