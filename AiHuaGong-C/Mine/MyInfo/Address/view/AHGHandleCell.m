
#import "AHGHandleCell.h"

@implementation AHGHandleCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.chooseButton setImage:[UIImage imageNamed:@"cart_selected_btn"] forState:UIControlStateSelected];
    [self.chooseButton setImage:[UIImage imageNamed:@"cart_unSelect_btn"] forState:UIControlStateNormal];
    self.chooseButton.selected = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)chooseAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(changeSelectState:)]) {
        [self.delegate changeSelectState:sender];
    }
}

@end
