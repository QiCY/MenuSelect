//
//  ViewController.m
//  MenuSelect
//
//  Created by admin on 2017/11/15.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "ViewController.h"
#import "StoreTableViewCell.h"
#import "StoreViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *selectedList;
@property(nonatomic,strong)NSMutableArray *recommedList;
@property(nonatomic,strong)NSMutableArray *storeList;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.selectedList = [[NSMutableArray alloc] init];
    self.recommedList = [[NSMutableArray alloc] init];
    self.storeList = [[NSMutableArray alloc] init];
    NSDictionary *data1 = @{@"storeImg":@"icon",@"storeName":@"舒心便利",@"score":@"4",@"distance":@"200公里",@"salescount":@"88",@"minprice":@"18",@"transprice":@"3",@"discount":@[@"满20减15",@"满40减19"],@"goods":@[@{@"name":@"黄瓜",@"img":@"icon",@"price":@"88"},@{@"name":@"黄瓜",@"img":@"icon",@"price":@"88"},@{@"name":@"黄瓜",@"img":@"icon",@"price":@"88"}]
                           };
    NSDictionary *data2 = @{@"storeImg":@"icon",@"storeName":@"舒心便利",@"score":@"4",@"distance":@"200公里",@"salescount":@"88",@"minprice":@"18",@"transprice":@"3",@"discount":@[],@"goods":@[@{@"name":@"黄瓜",@"img":@"icon",@"price":@""},@{@"name":@"黄瓜",@"img":@"icon",@"price":@""},@{@"name":@"黄瓜",@"img":@"icon",@"price":@"88"},@{@"name":@"黄瓜",@"img":@"icon",@"price":@"88"},@{@"name":@"黄瓜",@"img":@"icon",@"price":@"88"},@{@"name":@"黄瓜",@"img":@"icon",@"price":@"88"},@{@"name":@"黄瓜",@"img":@"icon",@"price":@"88"},@{@"name":@"黄瓜",@"img":@"icon",@"price":@"88"}]
                            };
    
    NSDictionary *data3 = @{@"storeImg":@"icon",@"storeName":@"舒心便利",@"score":@"4",@"distance":@"200公里",@"salescount":@"88",@"minprice":@"18",@"transprice":@"3",@"discount":@[@"满20减15",@"满40减19"],@"goods":@[]
                            };
    
    NSDictionary *data4 = @{@"storeImg":@"icon",@"storeName":@"舒心便利",@"score":@"4",@"distance":@"200公里",@"salescount":@"88",@"minprice":@"18",@"transprice":@"3",@"discount":@[],@"goods":@[]
                            };
    [self.storeList addObject:data1];
    [self.storeList addObject:data2];
    [self.storeList addObject:data3];
    [self.storeList addObject:data4];
   
    NSArray *typeList = @[@"民生",@"民生",@"民生",@"民生",@"民生",@"民生",@"民生",@"民生",@"民生",@"民生"];
    [self.selectedList addObjectsFromArray:typeList];
    [self.recommedList addObjectsFromArray:typeList];
    
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
#pragma mark UITableViewDelegate and UItableViewDatasource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
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
  
        static NSString *cellreuserId = @"cellid";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellreuserId];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellreuserId];
        }
        if (indexPath.section == 0) {
            [self setContentView:cell dataArray:self.selectedList section:indexPath.section];
        }else{
            [self setContentView:cell dataArray:self.recommedList section:indexPath.section];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return  [self calculateCellHeight:self.selectedList];
    } else{
        return  [self calculateCellHeight:self.recommedList];
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"我的订阅：";
    }else{
        return @"推荐分类：";
    }
}
#pragma mark 计算cell高度
-(CGFloat)calculateCellHeight:(NSMutableArray *)dataList{
    if (dataList.count == 0) {
        return 44;
    }else{
        int row = dataList.count / 4;
        int colum = dataList.count % 4;
        if (colum == 0) {
            return 10+row*(40+10);
        }
        return 10+(row + 1)*(40+10);
    }
}
-(UITableViewCell *)setContentView:(UITableViewCell *)cell dataArray:(NSMutableArray *)dataList section:(NSInteger)section{
    for (UIView *subView in cell.contentView.subviews) {
        [subView removeFromSuperview];
    }
    CGFloat width = (self.view.frame.size.width- 50)/4;
    int row = dataList.count / 4;
    int colum = dataList.count % 4;
    for (int i = 0; i<4; i++) {
        for (int j = 0; j<row+1; j++) {
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(10+(width+10)*i, 10+50*j, width, 40)];
            if (j >= row && i >= colum ) {
                break;
            }
            button.tag = 4*j+i;
            NSLog(@"button tag is %d 🌧",button.tag);
            NSString *title = [NSString stringWithFormat:@"%@-%d",dataList[button.tag],button.tag];
            button.layer.cornerRadius = 5;
            [button setTitle:title forState:UIControlStateNormal];
            [button setBackgroundColor:[UIColor brownColor]];
           
            if (section == 0) {
                [button addTarget:self action:@selector(selectMenuBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
            }else{
                [button addTarget:self action:@selector(recommedMenuBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
            }
            [cell.contentView addSubview:button];
        }
    }
    return cell;
}

-(void)selectMenuBtnClicked:(UIButton *)sender{
    
    [self.recommedList addObject:self.selectedList[sender.tag]];
    [self.selectedList removeObjectAtIndex:sender.tag];
    [_tableView reloadData];
}
-(void)recommedMenuBtnClicked:(UIButton *)sender{
    [self.selectedList addObject:self.recommedList[sender.tag]];
    [self.recommedList removeObjectAtIndex:sender.tag];
    [_tableView reloadData];
    
    StoreViewController *storeVC = [[StoreViewController alloc] init];
    [self presentViewController:storeVC animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

