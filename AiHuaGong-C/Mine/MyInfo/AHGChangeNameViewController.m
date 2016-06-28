
#import "AHGChangeNameViewController.h"

@interface AHGChangeNameViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *mailTextField;

@end

@implementation AHGChangeNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.nameTextField becomeFirstResponder];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
- (IBAction)saveChangeAction:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
