//
//  StoreTableViewCell.h
//  MenuSelect
//
//  Created by admin on 2017/11/20.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XHLevelView.h"
@class DisCountView;
@interface StoreTableViewCell : UITableViewCell
@property(nonatomic,strong)UIImageView *storeImgView;
@property(nonatomic,strong)UILabel *storeName;
@property(nonatomic,strong)XHLevelView *scoreImg;
@property(nonatomic,strong)UILabel *salesCount;
@property(nonatomic,strong)UILabel *minPrice;
@property(nonatomic,strong)UILabel *transPrice;
@property(nonatomic,strong)DisCountView *discountView;
@property(nonatomic,strong)UIScrollView *goodsView;
@property(nonatomic,strong)UILabel *distance;
@property(nonatomic,strong)id data;
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
-(void)setCellData:(id)data;
@end


@interface DisCountView:UIView
@property(nonatomic,strong)UIImageView *disCountImg;
@property(nonatomic,strong)UIView *discountView;
-(id)init;
-(void)setData:(NSArray *)discountList;
@end


@interface GoodsCardView:UIButton
@property(nonatomic,strong)UIImageView *goodImg;
@property(nonatomic,strong)UIImageView *hotSaleImg;
@property(nonatomic,strong)UILabel *priceLab;
@property(nonatomic,strong)id data;
-(id)initWithFrame:(CGRect)frame data:(id)data;
@end
