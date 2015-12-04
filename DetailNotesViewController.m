//
//  DetailNotesViewController.m
//  MC
//
//  Created by Tcacenco Daniel on 5/4/15.
//  Copyright (c) 2015 PlayerMD. All rights reserved.
//

#import "DetailNotesViewController.h"
#import <Social/Social.h>

@interface DetailNotesViewController ()

@end

@implementation DetailNotesViewController

-(NSManagedObjectContext *)manageObjectContext{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication]delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    
    return context;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _textNotes.delegate = self;
   
    if (self.textObject) {
        [self.textNotes setText:[self.textObject valueForKey:@"text"]];
    }
}

-(void)viewDidAppear:(BOOL)animated{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)cancel:(id)sender {
    [[self navigationController]popViewControllerAnimated:YES];
}

- (IBAction)save:(id)sender {
    NSManagedObjectContext *context = [self manageObjectContext];
    

        if (![_textNotes.text length]){
            UIAlertView *myAlert = [[UIAlertView  alloc]initWithTitle:@"Avertisment"message:@"Nu ai introdus nimic, în caz că vrai sa eși făra sa introduci nimic apasa Cancel" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [myAlert show];
        }else{

        if (self.textObject) {
        [self.textObject setValue:self.textNotes.text forKeyPath:@"text"];
    }
    else{
        NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"Notes" inManagedObjectContext:context];
        [newDevice setValue:self.textNotes.text forKey:@"text"];
    }
              [[self navigationController]popViewControllerAnimated:YES];
        }
  
            
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView{
    [_textNotes resignFirstResponder];
    return YES;
}

- (IBAction)post:(id)sender {
    if (![_textNotes.text length]){
        UIAlertView *myAlert = [[UIAlertView  alloc]initWithTitle:@"Avertisment"message:@"Nu ai introdus nimic pentru a fi ceva de postat." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [myAlert show];
    }else{
   UIActivityViewController *activityViewController = [[UIActivityViewController alloc]initWithActivityItems:[NSArray arrayWithObjects:_textNotes.text ,[UIImage imageNamed:@"scene3.jpg"],nil] applicationActivities:nil];
        
        activityViewController.excludedActivityTypes = @[UIActivityTypePostToWeibo, UIActivityTypeAssignToContact];
        [self presentViewController:activityViewController animated:YES completion:nil];
        }
}
@end
