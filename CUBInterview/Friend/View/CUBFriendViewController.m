//
//  CUBFriendViewController.m
//  CUBInterview
//
//  Created by KunChan on 2019/10/17.
//  Copyright © 2019 KunChan. All rights reserved.
//

#import "CUBFriendViewController.h"
#import "Masonry.h"
#import "CUBTableViewCellBaseClass.h"
#import "CUBUserTableViewCell.h"
#import "CUBSearchTableViewCell.h"
#import "CUBNoFriendTableViewCell.h"
#import "CUBFriendTableViewCell.h"
#import "CUBInviteTableViewCell.h"
#import "CUBFriendModel.h"
#import "CUBTableViewCellProtocol.h"
#import "CUBSearchModel.h"
#import "CUBInviteModel.h"

@interface CUBFriendViewController () <UITableViewDataSource, UISearchResultsUpdating, CUBTableViewCellProtocol, UISearchControllerDelegate, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, strong) UIRefreshControl *refreshControl;

@end

@implementation CUBFriendViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupUI];
    [self setupAutolayout];

    [self setupPresenterDate];
    [self.eventHandler get_status_no_friend:^(NSArray *dataSource) {
        [self.eventHandler updateDataSource:dataSource];
        [self.tableView reloadData];
    }];
    
}


- (void) setupUI {
    
    self.tableView = [[UITableView alloc] init];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.estimatedRowHeight = 60;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.tableView];
    
    [self.tableView registerClass:[CUBUserTableViewCell class] forCellReuseIdentifier:@"CUBUserModel"];
    [self.tableView registerClass:[CUBNoFriendTableViewCell class] forCellReuseIdentifier:@"CUBNoFriendModel"];
    [self.tableView registerClass:[CUBSearchTableViewCell class] forCellReuseIdentifier:@"CUBSearchModel"];
    [self.tableView registerClass:[CUBFriendTableViewCell class] forCellReuseIdentifier:@"CUBFriendModel"];
    [self.tableView registerClass:[CUBInviteTableViewCell class] forCellReuseIdentifier:@"CUBInviteModel"];
    
    self.searchController = [[UISearchController alloc]initWithSearchResultsController:nil];
    self.searchController.searchResultsUpdater = self;
    self.searchController.delegate = self;
    self.searchController.searchBar.placeholder = @"想轉一筆給誰呢？";
    self.searchController.searchBar.tintColor = [UIColor colorWithRed:236/255.0f green:0/255.0f blue:140/255.0f alpha:1.0f];
    
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    self.tableView.refreshControl = self.refreshControl;
    [self.refreshControl addTarget:self action:@selector(refresh) forControlEvents:UIControlEventValueChanged];
    
}

- (void)setupAutolayout {
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsZero);
        
    }];
    
}

- (void)setupPresenterDate {
    [self.eventHandler updateTestType:CUBTestType1];
    [self.eventHandler updateDataSource:@[].mutableCopy];
    [self.eventHandler updateResults:@[].mutableCopy];
}

- (void)refresh {
    
    switch ([self.eventHandler getTestType]) {
        case CUBTestType1: {
            
            [self.eventHandler get_status_no_friend:^(NSArray *dataSource) {
                [self.eventHandler updateDataSource:dataSource];
                
                [self.tableView reloadData];
                [self.refreshControl endRefreshing];
            }];
            
        }
            break;
            
        case CUBTestType2: {
            
            [self.eventHandler get_status_friend:^(NSArray *dataSource) {
                [self.eventHandler updateDataSource:dataSource];
                [self.tableView reloadData];
                [self.refreshControl endRefreshing];
            }];
            
        }
            break;
            
        case CUBTestType3: {
            
            [self.eventHandler get_status_friend_and_invite:^(NSArray *dataSource) {
                [self.eventHandler updateDataSource:dataSource];
                [self.tableView reloadData];
                [self.refreshControl endRefreshing];
            }];
            
        }
            break;
            
        default:
            break;
    }
    
}

- (void)openGroup:(NSIndexPath *)indexPath andLeader:(CUBInviteModel *)leaderModel{
    
    dispatch_queue_t createQueue = dispatch_queue_create("SerialQueue", nil);
    
    dispatch_async(createQueue, ^(){
        
        NSMutableArray *indexPaths = @[].mutableCopy;
        for (int i=1; i<=leaderModel.group.count; i++) {
            NSIndexPath *insterIndexPath = [NSIndexPath indexPathForRow:(indexPath.row+i) inSection:0];
            [indexPaths addObject:insterIndexPath];
        }
        
        NSMutableIndexSet *idxSet = [NSMutableIndexSet indexSetWithIndexesInRange:NSMakeRange(indexPath.row+1, leaderModel.group.count)];
        [[self.eventHandler getDataSource] insertObjects:leaderModel.group atIndexes:idxSet];
        
        dispatch_async(dispatch_get_main_queue(), ^(){
            
            [self.tableView beginUpdates];
            
            leaderModel.isClose = NO;
            
            [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            
            [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationTop];
            
            [self.tableView endUpdates];
            
        });
        
    });
    
}

- (void)closeGroup {
    
    dispatch_queue_t createQueue = dispatch_queue_create("SerialQueue", nil);
    
    dispatch_async(createQueue, ^(){
        
        NSPredicate *p = [NSPredicate predicateWithFormat:@"self isMemberOfClass: %@", [CUBInviteModel class]];
        NSArray * filtered = [[self.eventHandler getDataSource] filteredArrayUsingPredicate:p];
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat: @"isLeader == YES"];
        CUBInviteModel *leaderModel = nil;
        for (CUBInviteModel *model in filtered) {
            if ([predicate evaluateWithObject:model]) {
                leaderModel = model;
            }
        }
        
        if (!leaderModel) return;
        
        NSInteger row = [[self.eventHandler getDataSource] indexOfObject:leaderModel];
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:0];
        
        NSMutableArray *indexPaths = @[].mutableCopy;
        for (int i=1; i<=leaderModel.group.count; i++) {
            NSIndexPath *insterIndexPath = [NSIndexPath indexPathForRow:(indexPath.row+i) inSection:0];
            [indexPaths addObject:insterIndexPath];
        }
        
        [[self.eventHandler getDataSource] removeObjectsInRange:NSMakeRange(indexPath.row+1, leaderModel.group.count)];
        
        dispatch_async(dispatch_get_main_queue(), ^(){
            
            [self.tableView beginUpdates];
            
            leaderModel.isClose = YES;
            
            [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            
            [self.tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationTop];
            
            [self.tableView endUpdates];
            
        });
        
    });
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (self.searchController.active) {
        
        return [self.eventHandler getResults].count ;
    }
    
    return [self.eventHandler getDataSource].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    id model = (self.searchController.active)?[[self.eventHandler getResults] objectAtIndex:indexPath.row]:[[self.eventHandler getDataSource] objectAtIndex:indexPath.row];
    
    NSString *cellReuseIdentifier = NSStringFromClass([model class]);
    
    CUBTableViewCellBaseClass *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseIdentifier];
    cell.delegate = self;
    cell.entity = model;
    
    return cell;
    
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.searchController.active) return;
    
    id model = [[self.eventHandler getDataSource] objectAtIndex:indexPath.row];
    
    if ([model isMemberOfClass:[CUBInviteModel class]]) {
        CUBInviteModel *leaderModel = (CUBInviteModel *)model;
        
        if (leaderModel.isLeader && leaderModel.isClose) {
            [self openGroup:indexPath andLeader:leaderModel];
            return;
        }
        
        if (leaderModel.isClose == NO) {
            [self closeGroup];
            return;
        }
    }
    
}

#pragma mark - UISearchResultsUpdating
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    
    NSString *inputStr = searchController.searchBar.text ;
       if ([self.eventHandler getResults].count > 0) {
           [[self.eventHandler getResults] removeAllObjects];
       }
       for (id model in [self.eventHandler getDataSource]) {
           
           CUBFriendModel *memberFriendModel = nil;
           if ([model isMemberOfClass:[CUBFriendModel class]]) {
               memberFriendModel = model;
               
               if ([memberFriendModel.name.lowercaseString rangeOfString:inputStr.lowercaseString].location != NSNotFound) {
                   [[self.eventHandler getResults] addObject:memberFriendModel];
               }
           }
       }
       
       [self.tableView reloadData];
    
}

#pragma mark - UISearchControllerDelegate
- (void)didPresentSearchController:(UISearchController *)searchController {
    
    [self.searchController.searchBar becomeFirstResponder];
    
}

- (void)willDismissSearchController:(UISearchController *)searchController {

    self.tableView.tableHeaderView = nil;

}

#pragma mark - CUBTableViewCellProtocol
- (void)search {
    
    NSPredicate *p = [NSPredicate predicateWithFormat:@"self isMemberOfClass: %@", [CUBSearchModel class]];
    NSArray * filtered = [[self.eventHandler getDataSource] filteredArrayUsingPredicate:p];
    NSInteger row = [[self.eventHandler getDataSource] indexOfObject:[filtered firstObject]];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:0];
    
    dispatch_async(dispatch_get_main_queue(), ^(){
        [UIView animateWithDuration:0.5f animations:^{
            
            [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
            
        } completion:^(BOOL finished){
            
            self.tableView.tableHeaderView = self.searchController.searchBar;
            
            self.searchController.active = YES;
            
        }];
    });
    
}

- (void)test1 {
    
    [self.eventHandler get_status_no_friend:^(NSArray *dataSource) {
        [self.eventHandler updateTestType:CUBTestType1];
        [self.eventHandler updateDataSource:dataSource];
        [self.tableView reloadData];
    }];
    
}

- (void)test2 {
    
    [self.eventHandler get_status_friend:^(NSArray *dataSource) {
        [self.eventHandler updateTestType:CUBTestType2];
        [self.eventHandler updateDataSource:dataSource];
        [self.tableView reloadData];
    }];
    
}

- (void)test3 {
    
    [self.eventHandler get_status_friend_and_invite:^(NSArray *dataSource) {
        [self.eventHandler updateTestType:CUBTestType3];
        [self.eventHandler updateDataSource:dataSource];
        [self.tableView reloadData];
    }];
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
    

@end
