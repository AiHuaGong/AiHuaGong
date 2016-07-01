
#import "AHGOrderFinishCell.h"

@implementation AHGOrderFinishCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)replyAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(replybuttonClicked:)]) {
        [self.delegate replybuttonClicked:@"的ddd"];
    }
}

- (IBAction)reBuyAction:(id)sender {

    if ([self.delegate respondsToSelector:@selector(bugAgainbuttonClicked:)]) {
        [self.delegate bugAgainbuttonClicked:@"的"];
    }
}


@end
