//
//  StoreTableViewCell.m
//  MenuSelect
//
//  Created by admin on 2017/11/20.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "StoreTableViewCell.h"
#define  kScreenWidth  [UIScreen mainScreen].bounds.size.width
@implementation StoreTableViewCell


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createHeadView];
    }
    
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)createHeadView{
    self.storeImgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, 80, 60)];
    [self.contentView addSubview:self.storeImgView];
    
    self.storeName = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.storeImgView.frame)+10, 5, 200, 20)];
    self.storeName.textColor = [UIColor blackColor];
    self.storeName.font = [UIFont systemFontOfSize:16];
    [self.contentView addSubview:self.storeName];
    
    self.scoreImg = [[XHLevelView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.storeImgView.frame)+10, 30, 60, 20)];
    [self.contentView addSubview:self.scoreImg];
    
    self.salesCount = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.scoreImg.frame)+10, 25, 100, 20)];
    self.salesCount.textColor = [UIColor blackColor];
    self.salesCount.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:self.salesCount];
    
    self.distance = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth - 60, 25, 60, 20)];
    self.distance.textColor = [UIColor redColor];
    self.distance.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:self.distance];
    
    self.minPrice = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.storeImgView.frame)+10, 45, 100, 20)];
    self.minPrice.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:self.minPrice];
    
    self.transPrice = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.minPrice.frame)+10, 45, 100, 20)];
    self.transPrice.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:self.transPrice];
    
    self.discountView = [[DisCountView alloc] init];
    [self.contentView addSubview:self.discountView];
    
    
    self.goodsView = [[UIScrollView alloc] init];
    [self.contentView addSubview:self.goodsView];
    
}
-(void)setCellData:(id)data{
    NSArray *discountList = data[@"discount"];
    if (discountList.count>0) {
        self.discountView.frame = CGRectMake(CGRectGetMaxX(self.storeImgView.frame)+10, 65, kScreenWidth -CGRectGetMaxX(self.storeImgView.frame)-10 , 20*discountList.count);
        [self.discountView setData:discountList];
        self.discountView.hidden = NO;
    }else{
        self.discountView.hidden = YES;
    }
//    @{@"storeImg":@"icon",@"storeName":@"舒心便利",@"score":@"4",@"distance":@"200公里",@"salescount":@"88",@"minprice":@"18",@"transprice":@"3",@"discount":@[@"满20减15",@"满40减19"],@"goods":@[@{@"name":@"黄瓜",@"img":@"icon",@"price":@"88"},@{@"name":@"黄瓜",@"img":@"icon",@"price":@"88"},@{@"name":@"黄瓜",@"img":@"icon",@"price":@"88"}]
//      };
    NSArray *goodsList = data[@"goods"];
    [self setGoodsViewWithData:goodsList];
    self.storeImgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",data[@"storeImg"]]];
    self.storeName.text = data[@"storeName"];
    self.scoreImg.level = [data[@"score"] floatValue];
    self.salesCount.text = [NSString stringWithFormat:@"月销量%@",data[@"salescount"]];
    self.distance.text = data[@"distance"];
    self.minPrice.text = data[@"minprice"];
    self.transPrice.text = data[@"transprice"];
    
}

- (void)setGoodsViewWithData:(NSArray *)datalist
{
    for (UIView *subView in self.goodsView.subviews) {
        [subView removeFromSuperview];
    }
 
    self.goodsView.contentSize = CGSizeMake(80*datalist.count, 100);
    if (datalist.count>0) {
        self.goodsView.frame = CGRectMake(CGRectGetMaxX(self.storeImgView.frame)+10,self.discountView.hidden?CGRectGetMaxY(self.storeImgView.frame)+10:CGRectGetMaxY(self.discountView.frame), kScreenWidth -CGRectGetMaxX(self.storeImgView.frame)-10 , 100);
        self.goodsView.hidden = NO;
        for (int i = 0; i<datalist.count; i++) {
            GoodsCardView *card = [[GoodsCardView alloc] initWithFrame:CGRectMake(i*80, 0, 80, 100) data:datalist[i]];
            [self.goodsView addSubview:card];
        }
    }else{
        self.goodsView.hidden = YES;
    }
}
@end

@implementation DisCountView
-(id)init
{
    if (self = [super init]) {
        self.disCountImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 15)];
        self.disCountImg.backgroundColor = [UIColor orangeColor];
        [self addSubview:self.disCountImg];
       
    }
    return self;
}
-(void)setData:(NSArray *)discountList{
    if (!_discountView) {
        _discountView = [[UIView alloc] initWithFrame:CGRectMake(40, 0, 200, 20*discountList.count)];
        [self addSubview:_discountView];
    }
    for (UIView *subView in _discountView.subviews) {
        [subView removeFromSuperview];
    }
    for (int i = 0; i<discountList.count; i++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, i*20, 200, 20)];
        label.textColor = [UIColor blackColor];
        label.text = discountList[i];
        label.font = [UIFont systemFontOfSize:12];
        [_discountView addSubview:label];
    }
}
@end


@implementation GoodsCardView
-(id)initWithFrame:(CGRect)frame data:(id)data{
    if (self = [super initWithFrame:frame]) {
        self.data = data;
        self.goodImg = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 70, 70)];
        self.goodImg.image = [UIImage imageNamed:@"icon.jpg"];
        [self addSubview:self.goodImg];
        
        self.hotSaleImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 15)];
        self.hotSaleImg.backgroundColor = [UIColor orangeColor];
        [self addSubview:self.hotSaleImg];
        
        self.priceLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 80, 80, 20)];
        self.priceLab.textColor = [UIColor redColor];
        self.priceLab.text = data[@"price"];
        self.priceLab.font = [UIFont systemFontOfSize:14];
        self.priceLab.textAlignment = 1;
        [self addSubview:self.priceLab];
    }
    return self;
}
@end
