//
//  MasterViewController.m
//  SuperShopper
//
//  Created by Jim Rollenhagen on 7/25/13.
//  Copyright (c) 2013 Jim Rollenhagen. All rights reserved.
//

#import <Dropbox/Dropbox.h>
#import "MasterViewController.h"
#import "DetailViewController.h"
#import "NewStoreAlertViewDelegate.h"
#import "ShopperStore.h"

@interface MasterViewController () {
    NSMutableArray *_objects;
}

@end

@implementation MasterViewController

- (void)awakeFromNib
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
    }
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    NSMutableArray *rightButtons = [[NSMutableArray alloc] init];
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(requestStoreName:)];
    [rightButtons addObject:addButton];
    
    // only show dropbox button if account is not yet linked
    DBAccount *account = [[DBAccountManager sharedManager] linkedAccount];
    if (!account) {
        UIBarButtonItem *dbButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(setUpDropbox:)];
        [rightButtons addObject:dbButton];
    }

    self.navigationItem.rightBarButtonItems = rightButtons;
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NewStoreAlertViewDelegate*)getDelegate {
    return [[NewStoreAlertViewDelegate alloc] initWithSender:self];
}

- (void)setUpDropbox:(id)sender {
    // sets up dropbox auth
    DBAccount *account = [[DBAccountManager sharedManager] linkedAccount];
    if (account) {
        NSLog(@"App already linked");
    } else {
        [[DBAccountManager sharedManager] linkFromController:self];
    }
}

- (void)requestStoreName:(id)sender {
    self.delegate = [self getDelegate];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Add a store" message:@"Enter the store name:" delegate:self.delegate cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert show];
}

- (void)insertNewObject:(id)sender withName:(NSString*) name
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    ShopperStore *store = [ShopperStore initWithName: name];
    NSInteger row = _objects.count;
    [_objects insertObject: store atIndex:row];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    ShopperStore *object = _objects[indexPath.row];
    cell.textLabel.text = [object name];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        NSDate *object = _objects[indexPath.row];
        self.detailViewController.detailItem = object;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = _objects[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}

@end
