//
//  ViewController.m
//  MCMS
//
//  Created by Atousa Duprat on 3/22/16.
//  Copyright © 2016 Atousa Duprat. All rights reserved.
//

#import "ViewController.h"
#import "MagicalCreature.h"
#import "creatureViewController.h"

@interface ViewController () <UITableViewDelegate,UITableViewDataSource, UITextFieldDelegate>

@property NSMutableArray *creatures;
@property (weak, nonatomic) IBOutlet UITableView *MyTableView;
@property (weak, nonatomic) IBOutlet UITextField *myTextField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MagicalCreature *c1 = [MagicalCreature new];
    c1.name = @"E.T";
    c1.creatureDescription = @"a cool alien that likes tacos";
    
    MagicalCreature *c2 = [MagicalCreature new];
    c2.name = @"Octopuuuut";
    
    c2.creatureDescription = @"A octopus of two heads that loves bowling";
    MagicalCreature *c3 = [MagicalCreature new];
    
    c3.name = @"Tiger";
    c3.creatureDescription = @"a tiger with wings and snake tail";
    
    
    //REMEMBER THAT WE ARE STORING OBJECT IN THE ARRAY
    self.creatures = [NSMutableArray arrayWithObjects:c1,c2,c3,nil];
    
}


//remember that when the tableView loads in viewDidLoad thats it, you need to reaload the data when the viewDidAppear;
-(void)viewDidAppear:(BOOL)animated
{
    [self.MyTableView  reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.creatures.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    MagicalCreature *m = [self.creatures objectAtIndex:indexPath.row];
    cell.textLabel.text = m.name;
    cell.detailTextLabel.text = m.creatureDescription;
    return cell;
    
}

- (IBAction)onPressedAddButton:(UIButton *)sender {
    
    //adding a new item to the array first we create a new instance of the class
    MagicalCreature *creatureTextField = [MagicalCreature new];
    
    //then we take the input from the mytextfield and set it to the property
    creatureTextField.name = self.myTextField.text;
    
    //second textfield for the description

    creatureTextField.creatureDescription = self.descriptionTextField.text;
    
    //and then we push the complete object to the array
    [self.creatures addObject:creatureTextField];

    
    [self.MyTableView reloadData];
    self.myTextField.text = nil;
}

    

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [self.MyTableView indexPathForCell:sender];
    
    MagicalCreature *creatureSegue = [self.creatures objectAtIndex:indexPath.row];
    
    creatureViewController *desVC = segue.destinationViewController;
    
    
    //here we pass the full monster object
    //we already import the file "creatureViewController.h"
    
    //this property creature is in the creatureviewcontroller.h
    desVC.creature = creatureSegue;
    

    
}



@end



















