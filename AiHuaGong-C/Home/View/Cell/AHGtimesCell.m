
#import "AHGtimesCell.h"

@implementation AHGtimesCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.bugButton.layer.cornerRadius = 5;
    self.bugButton.clipsToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)buyActiob:(id)sender {
    if ([self.delegate respondsToSelector:@selector(buyButtonClickedWithProductId:)]) {
        [self.delegate buyButtonClickedWithProductId:1];
    }
    
}

@end
