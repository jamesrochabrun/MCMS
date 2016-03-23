//
//  creatureViewController.m
//  MCMS
//
//  Created by Atousa Duprat on 3/22/16.
//  Copyright © 2016 Atousa Duprat. All rights reserved.
//

#import "creatureViewController.h"
#import "ViewController.h"

@interface creatureViewController ()
@property (weak, nonatomic) IBOutlet UITextField *editNameTextField;
@property (weak, nonatomic) IBOutlet UILabel *changedLabel;


@end

@implementation creatureViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //this properties are in the MagicalCreature.h
    //here we bind the infor mation from the viewcontroller to this view
    self.creatureLabel.text = self.creature.name;
    
    //Here we bind the description to the textView
    self.creatureDescription.text = self.creature.creatureDescription;
    
    //passing the object
    
//    self.creature =


    //setting the textfield to hide by default
    self.editNameTextField.hidden = YES;
    
  
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//here we change the button style

- (IBAction)onEditmode:(UIBarButtonItem *)sender {
    if (self.editing) {
        self.editing = false;
        sender.style = UIBarButtonItemStylePlain;
        sender.title = @"Edit";
        self.editNameTextField.hidden = YES;
        
        //updating the values of the object in the textfields
        self.creature.name = self.editNameTextField.text;
        self.changedLabel.text = self.editNameTextField.text;
        
      //updating the values in the text field
        
        
        
    } else {
        self.editing = true;
        sender.style = UIBarButtonItemStyleDone;
        sender.title = @"Done";
        self.editNameTextField.hidden = NO ;
        

    }
    
}













@end
