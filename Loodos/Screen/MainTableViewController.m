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
    NSString *searchKey;
}
@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [WebHelper sharedInstance].pageNumber = 1;
    contentArray = [[SearchModel alloc] init];
    [self setTitle:[Config sharedInstance].nameString];
}

#pragma mark - Rest Api
-(void)requestSearchApi:(NSString *)searchKey{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [[WebHelper sharedInstance] getSearchContent:searchKey successBlock:^(id result) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [hud hideAnimated:YES];
            SearchModel *response = [[SearchModel alloc] initWithString:result error:nil];
            if ([response.Response boolValue]) {
                if (self->contentArray.Search) {
                    self->contentArray.Search = [self->contentArray.Search arrayByAddingObjectsFromArray:response.Search];
                }else{
                    self->contentArray = response;
                }
            }else{
                //NO Result
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Error", nil)
                                                                message:[NSString stringWithFormat:NSLocalizedString(@"NoResult", nil),self->searchKey]
                                                               delegate:self
                                                      cancelButtonTitle:NSLocalizedString(@"Ok", nil)
                                                      otherButtonTitles:nil];
                [alert show];
            }
            [self.tableView reloadData];
        });
    } errorBlock:^(id result) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [hud hideAnimated:YES];
        });
    }];
}

#pragma mark - Table view data source
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ContentPreview *content = contentArray.Search[indexPath.row];
    [self performSegueWithIdentifier:@"detailContent" sender:content];
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

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqual:@"detailContent"]) {
        DetailViewController *vc = (DetailViewController*)segue.destinationViewController;
        vc.contentPreview = (ContentPreview *)sender;
    }
}

#pragma mark - Search Bar
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
    contentArray = [[SearchModel alloc] init];
    searchKey = [searchBar.text stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    [WebHelper sharedInstance].pageNumber = 1;
    [self requestSearchApi:searchKey];
}

#pragma mark Scroll view delegate
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    float bottomEdge = scrollView.contentOffset.y + scrollView.frame.size.height;
    if (bottomEdge >= scrollView.contentSize.height)
    {
        [WebHelper sharedInstance].pageNumber += 1;
        [self requestSearchApi:searchKey];
    }
}

@end
