//
//  MainTableViewController.m
//  Loodos
//
//  Created by macbookair on 27.09.2018.
//  Copyright © 2018 Erim Kurt. All rights reserved.
//

#import "MainTableViewController.h"
#import "MainTableViewCell.h"

@interface MainTableViewController ()
{
    SearchModel *contentArray;
}
@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    contentArray = [[SearchModel alloc] init];
    [self setTitle:[Config sharedInstance].nameString];
    [self requestSearchApi:@""];
}

#pragma mark - Rest Api
-(void)requestSearchApi:(NSString *)searchKey{
    [[WebHelper sharedInstance] getSearchContent:searchKey successBlock:^(id result) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self->contentArray = [[SearchModel alloc] initWithString:result error:nil];
            [self.tableView reloadData];
        });
    } errorBlock:^(id result) {
        dispatch_async(dispatch_get_main_queue(), ^{
        });
    }];
}

#pragma mark - Table view data source
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return contentArray.Search.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *tableIdentifier = @"MainCell";
    ContentPreview *content = contentArray.Search[indexPath.row];
    
    MainTableViewCell *cell = (MainTableViewCell *)[tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    cell.content = content;
    [cell setupCell];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
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
