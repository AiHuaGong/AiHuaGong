
#import "AHGOrderAllCell.h"

@implementation AHGOrderAllCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)showMoreProductButtonClicked:(id)sender {
    if ([self.delegate respondsToSelector:@selector(showMoreProductButtonClicked)]) {
        [ self.delegate showMoreProductButtonClicked];
    }
}
- (IBAction)payMentButtonClicked:(id)sender {
    if ([self.delegate respondsToSelector:@selector(buyActionWithProductId:)]) {
        [ self.delegate buyActionWithProductId:@"1"];
    }
}

- (IBAction)cancleOrderButtonClicked:(id)sender {
    if ([self.delegate respondsToSelector:@selector(cancleActionWithProductId:)]) {
        [ self.delegate cancleActionWithProductId:@"1"];
    }
}


@end
