//
//  creatureViewController.h
//  MCMS
//
//  Created by Atousa Duprat on 3/22/16.
//  Copyright © 2016 Atousa Duprat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MagicalCreature.h"

@interface creatureViewController : UIViewController


//we use this to display the values of the string
@property (weak, nonatomic) IBOutlet UILabel *creatureLabel;
//we use this one to store the value of the name
@property NSString *creatureDetails;

///////////////////////////////////////////

//we use this for the descriptions
@property (weak, nonatomic) IBOutlet UITextView *creatureDescription;
@property NSString *creatureDescriptionDetails;


///////////////////////////

//We need to create a new creature porperty so we can use it to pass the full object

@property MagicalCreature *creature;





@end
