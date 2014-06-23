//
//  TableViewController.m
//  entitys4thWeek
//
//  Created by Miguel Santiago Rodríguez on 23/06/14.
//  Copyright (c) 2014 ironhack. All rights reserved.
//

#import "TableViewController.h"
#import "TVShow.h"
#import "TableViewCell.h"

static NSString *const savedShowsFileName = @"shows.txt";

@interface TableViewController ()
@property (strong, nonatomic) NSArray *showsArray;
@end

@implementation TableViewController

- (NSArray *)showsArray {
    if (!_showsArray) {
        _showsArray = [[NSArray alloc] init];
    }
    
    return _showsArray;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self loadShows];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Actions

- (IBAction)addShowPressed:(id)sender {
    [self addShow:[self generateRandomShow]];
    
    [self.tableView reloadData];
}

- (IBAction)savePressed:(id)sender {
    [NSKeyedArchiver archiveRootObject:self.showsArray toFile:[self archivePath]];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.showsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"showCell" forIndexPath:indexPath];
    
    TVShow *show = [self.showsArray objectAtIndex:indexPath.row];
    cell.showName.text = show.name;
    cell.showSummary.text = show.summary;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    TVShow *originShow = [self.showsArray objectAtIndex:indexPath.row];
    TVShow *copiedShow = originShow.copy;
    
    [self addShow:copiedShow];
    [self.tableView reloadData];
}

#pragma mark -
#pragma mark Helping Methods

- (void)loadShows {
    self.showsArray = [NSKeyedUnarchiver unarchiveObjectWithFile:[self archivePath]];
    [self.tableView reloadData];
}

- (void)addShow:(TVShow *)show {
    NSMutableArray *showsMutableCopy = [self.showsArray mutableCopy];
    [showsMutableCopy addObject:show];
    self.showsArray = showsMutableCopy.copy;
}

- (NSString *)archivePath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *documentsFolder = [paths firstObject];
    return [documentsFolder stringByAppendingPathComponent:savedShowsFileName];
}

#pragma mark -
#pragma mark Random Methods (FOR FORWARD DELETING)

- (TVShow *)generateRandomShow {
    TVShow *show = [[TVShow alloc] init];
    
    show.name = [self genRandStringLength:7];
    show.showId = [self genRandStringLength:7];
    show.summary = [self genRandStringLength:20];
    show.rating = arc4random() / 10.0f;
    show.creator = [self genRandStringLength:7];
    
    return  show;
}

- (NSString *)genRandStringLength:(int)len {
    static NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    NSMutableString *randomString = [NSMutableString stringWithCapacity: len];
    for (int i=0; i<len; i++) {
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random() % [letters length]]];
    }
    return randomString;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
