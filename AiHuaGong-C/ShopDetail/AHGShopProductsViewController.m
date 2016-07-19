
#import "AHGShopProductsViewController.h"
#import "AHGProductsCell.h"
@interface AHGShopProductsViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic, strong)UICollectionView  * collectionView;
@end

@implementation AHGShopProductsViewController
static NSString * const reuseIdentifier = @"productsCell";

- (void)viewDidLoad {
    [super viewDidLoad];
   self.title = @"商品列表";
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake((VIEW_WIDTH - MARGENT_DIS*3) /3, (VIEW_WIDTH - MARGENT_DIS*3) /3 + 45);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.minimumLineSpacing = 8;//设置每个item之间的间距
    
    UICollectionView * view = [[UICollectionView alloc]initWithFrame:CGRectMake(0, MARGENT_DIS, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:layout];
    view.delegate = self;
    view.dataSource = self;
    view.showsVerticalScrollIndicator = YES;
    //    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    _collectionView = view;
    _collectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.collectionView registerClass:[AHGProductsCell class] forCellWithReuseIdentifier:reuseIdentifier];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 15;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    AHGProductsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[AHGProductsCell alloc]init];
    }
    // Configure the cell
    [cell setImageName:@"interesting_card" content:@"爱化工测试数据"];
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    //上左下右
    return UIEdgeInsetsMake(0 ,0, 0, 4);
}



@end
