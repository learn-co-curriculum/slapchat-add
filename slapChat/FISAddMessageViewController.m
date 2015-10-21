//
//  FISAddMessageViewController.m
//  slapChat
//
//  Created by Chris Gonzales on 9/15/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISAddMessageViewController.h"
#import "FISMessage.h"
#import "FISDataStore.h"

@interface FISAddMessageViewController ()

@property (weak, nonatomic) IBOutlet UITextField *messageContentField;
@end

@implementation FISAddMessageViewController

- (IBAction)saveMessageButtonTapped:(id)sender {
    FISDataStore *store = [FISDataStore sharedDataStore];
    FISMessage *newMessage = [NSEntityDescription insertNewObjectForEntityForName:@"FISMessage" inManagedObjectContext:store.managedObjectContext];
    newMessage.content = self.messageContentField.text;
    newMessage.createdAt = [NSDate date];
    [store saveContext];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)cancelButtonTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
