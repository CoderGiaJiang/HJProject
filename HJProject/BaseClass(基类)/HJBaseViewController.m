//
//  HJBaseViewController.m
//  NormalAppFramework-noVersionInfo.
//
//  Created by User on 16/7/18.
//  Copyright © 2016年 AdwardWang. All rights reserved.
//

#import "HJBaseViewController.h"
#import "Header.h"

@interface HJBaseViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>

/**
 *  存放通知的数组
 */
@property (nonatomic, strong) NSMutableArray *notifiNameArr;

@end

@implementation HJBaseViewController

- (void)dealloc
{
    [self hj_removeAllNotification];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.backItemTitle = @"返回";
    // Do any additional setup after loading the view.
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: [UIColor whiteColor], NSForegroundColorAttributeName, [UIFont fontWithName:@"PingFangSC-Regular" size:20], NSFontAttributeName,nil]];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (_isNagationBarHidden) {
        [self.navigationController setNavigationBarHidden:YES animated:YES];
    }
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Notification
/**
 *  根据名字添加通知
 *
 *  @param name     通知名字
 *  @param recetive 接收通知回调
 */
- (void)hj_addNotificationCenterWithName:(NSString *)name recetive:(HJNoticationBlock)recetive
{
    if ([self.notifiNameArr containsObject:name]) {
        return;
    }
    
    [self.notifiNameArr addObject:name];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hj_executeNotificationMethod:) name:name object:nil];
    objc_setAssociatedObject(self, (__bridge const void *)(name), recetive, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)hj_executeNotificationMethod:(NSNotification *)notification
{
    for (NSString *name in self.notifiNameArr) {
        HJNoticationBlock block = objc_getAssociatedObject(self, (__bridge const void *)(name));
        if (block) {
            block(notification);
        }
    }
}

/**
 *  根据名字删除通知
 *
 *  @param name 通知名字
 */
- (void)hj_removeNotificationWithName:(NSString *)name
{
    if ([self.notifiNameArr containsObject:name]) {
        [[NSNotificationCenter defaultCenter] removeObserver:self name:name object:nil];
        objc_setAssociatedObject(self, (__bridge const void *)(name), nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [self.notifiNameArr removeObject:name];
    }
}

/**
 *  移除所有通知
 */
- (void)hj_removeAllNotification
{
    for (NSString *name in self.notifiNameArr) {
        [[NSNotificationCenter defaultCenter] removeObserver:self name:name object:nil];
        objc_setAssociatedObject(self, (__bridge const void *)(name), nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    [self.notifiNameArr removeAllObjects];
    
}

#pragma mark - ImagePickerController
/**
 *  打开系统相机
 *
 *  @param completion 返回图片回调
 */
- (void)hj_openCameraCompletion:(HJImageBlcok)completion
{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
        [imagePickerController setDelegate:self];
        [imagePickerController setAllowsEditing:YES];
        [imagePickerController setSourceType:UIImagePickerControllerSourceTypeCamera];
        [self presentViewController:imagePickerController animated:YES completion:nil];
        objc_setAssociatedObject(self, (__bridge const void *)(imagePickerController), completion, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

/**
 *  打开系统相册
 *
 *  @param completion 返回图片回调
 */
- (void)hj_openAlbumCompletion:(HJImageBlcok)completion
{
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    [imagePickerController setDelegate:self];
    [imagePickerController setAllowsEditing:YES];
    [imagePickerController setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [self presentViewController:imagePickerController animated:YES completion:nil];
    objc_setAssociatedObject(self, (__bridge const void *)(imagePickerController), completion, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

/**
 *  保存图片到相册
 */
- (void)hj_saveImageToAlbumWithImage:(UIImage *)image complection:(HJCompletionBlcok)completion
{
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(hj_image:didFinishSavingWithError:contextInfo:), NULL);
    
    objc_setAssociatedObject(self, (__bridge const void *)(image), completion, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

/**
 *  指定回调方法
 *
 *  @param image       保存的图片
 *  @param error       错误信息
 *  @param contextInfo 上下文信息
 */
- (void)hj_image: (UIImage *) image didFinishSavingWithError: (NSError *) error contextInfo: (void *) contextInfo
{
    NSString *msg = nil ;
    if(error != NULL){
        msg = @"保存图片失败";
    }else{
        msg = @"保存图片成功";
    }
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:msg preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        HJCompletionBlcok block = objc_getAssociatedObject(self, (__bridge const void *)(image));
        if (block) {
            block();
        }
    }];
    
    [alertController addAction:alertAction];
    [self presentViewController:alertController animated:YES completion:nil];
}


#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = info[UIImagePickerControllerEditedImage];
    HJImageBlcok block = objc_getAssociatedObject(self, (__bridge const void *)(picker));
    if (block) {
        block(image);
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 是否隐藏状态栏
- (BOOL)prefersStatusBarHidden {
    
    if (_isStatusBarHidden) {
        return YES;
    }
    return NO;
}

#pragma mark - setter and getter
- (void)setIsTopBarNightMode:(BOOL)isTopBarNightMode
{
    _isTopBarNightMode = isTopBarNightMode;
    if (_isTopBarNightMode) {
        [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
    }
}

- (void)setBackItemTitle:(NSString *)backItemTitle
{
    backItemTitle = _backItemTitle;
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButtonItem;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
