//
//  NotePadTableTableViewController.m
//  Ingrating Dropbox
//
//  Created by Manoj Tammina on 3/31/15.
//  Copyright (c) 2015 tammia. All rights reserved
//

#import "NotePadTableTableViewController.h"


@interface NotePadTableTableViewController ()

@property (nonatomic,strong) NSMutableArray *notes;

@end

@implementation NotePadTableTableViewController

-(NSMutableArray *)notes
{
    if(!_notes)
    {
        _notes=[[NSMutableArray alloc]init];
    }
    return _notes;
}

- (void)viewDidLoad {
    [super viewDidLoad];
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.notes.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text=[self.notes objectAtIndex:indexPath.row];
    
    return cell;
}





#pragma mark - Notepad Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.destinationViewController isKindOfClass:[NewNote class]])
    {
        NewNote *newNote=(NewNote *)segue.destinationViewController;
        newNote.del=self;
    }

    else if([segue.identifier isEqualToString:@"showNoteDetail"]){
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NoteDetailView *noteDetail = segue.destinationViewController;
        noteDetail.noteString = [_notes objectAtIndex:indexPath.row];
    }
}

-(void)add:(NSString *)note
{
    if([note length]>0){
    [self.notes addObject:note];
    [self.tableView reloadData];
        [self.navigationController popViewControllerAnimated:YES];}
    
}
- (IBAction)newNote:(UIBarButtonItem *)sender
{
    [self performSegueWithIdentifier:@"newSegue" sender:sender];
}
@end
