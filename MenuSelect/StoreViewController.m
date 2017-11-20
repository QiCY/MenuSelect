//
//  StoreViewController.m
//  MenuSelect
//
//  Created by admin on 2017/11/20.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "StoreViewController.h"
#import "StoreTableViewCell.h"
@interface StoreViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray *dataList;
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation StoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dataList = [[NSMutableArray alloc] init];
    NSDictionary *data1 = @{@"storeImg":@"icon",@"storeName":@"舒心便利",@"score":@"4",@"distance":@"200公里",@"salescount":@"88",@"minprice":@"18",@"transprice":@"3",@"discount":@[@"满20减15",@"满40减19"],@"goods":@[@{@"name":@"黄瓜",@"img":@"icon",@"price":@"88"},@{@"name":@"黄瓜",@"img":@"icon",@"price":@"88"},@{@"name":@"黄瓜",@"img":@"icon",@"price":@"88"}]
                            };
    NSDictionary *data2 = @{@"storeImg":@"icon",@"storeName":@"舒心便利",@"score":@"4",@"distance":@"200公里",@"salescount":@"88",@"minprice":@"18",@"transprice":@"3",@"discount":@[],@"goods":@[@{@"name":@"黄瓜",@"img":@"icon",@"price":@""},@{@"name":@"黄瓜",@"img":@"icon",@"price":@""},@{@"name":@"黄瓜",@"img":@"icon",@"price":@"88"},@{@"name":@"黄瓜",@"img":@"icon",@"price":@"88"},@{@"name":@"黄瓜",@"img":@"icon",@"price":@"88"},@{@"name":@"黄瓜",@"img":@"icon",@"price":@"88"},@{@"name":@"黄瓜",@"img":@"icon",@"price":@"88"},@{@"name":@"黄瓜",@"img":@"icon",@"price":@"88"}]
                            };
    
    NSDictionary *data3 = @{@"storeImg":@"icon",@"storeName":@"舒心便利",@"score":@"4",@"distance":@"200公里",@"salescount":@"88",@"minprice":@"18",@"transprice":@"3",@"discount":@[@"满20减15",@"满40减19"],@"goods":@[]
                            };
    
    NSDictionary *data4 = @{@"storeImg":@"icon",@"storeName":@"舒心便利",@"score":@"4",@"distance":@"200公里",@"salescount":@"88",@"minprice":@"18",@"transprice":@"3",@"discount":@[],@"goods":@[]
                            };
    [self.dataList addObject:data1];
    [self.dataList addObject:data2];
    [self.dataList addObject:data3];
    [self.dataList addObject:data4];
    [self.tableView reloadData];
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc] init];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 2) {
        return _dataList.count;
    }
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (CGFloat)getRowHeightWithData:(NSDictionary *)data{
    NSArray *disList = data[@"discount"];
    NSArray *goodsList = data[@"goods"];
    CGFloat h = 80;
    if (disList.count>0) {
        h+=20*disList.count;
    }
    if (goodsList.count>0) {
        h+=100;
    }
    return h;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
        static NSString *cellid = @"celluserid";
        StoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
        if (!cell) {
            cell = [[StoreTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        }
        [cell setCellData:_dataList[indexPath.row]];
        return cell;
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
        return  [self getRowHeightWithData:_dataList[indexPath.row]];
 
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
