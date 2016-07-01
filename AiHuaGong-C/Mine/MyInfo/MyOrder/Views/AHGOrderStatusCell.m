
#import "AHGOrderStatusCell.h"

@implementation AHGOrderStatusCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)secondButtonClicked:(id)sender {
    if ([self.delegate respondsToSelector:@selector(secondbuttonClicked:)]) {
        [self.delegate secondbuttonClicked:@"1"];
    }
}

- (IBAction)firstButtonClicked:(id)sender {
    if ([self.delegate respondsToSelector:@selector(firstbuttonClicked:)]) {
        [self.delegate firstbuttonClicked:@"1"];
    }

}


@end
