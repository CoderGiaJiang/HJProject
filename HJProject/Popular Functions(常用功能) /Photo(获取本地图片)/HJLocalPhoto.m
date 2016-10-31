//
//  HJLocalPhoto.m
//  HJProject
//
//  Created by User on 16/10/11.
//  Copyright © 2016年 Dellidc. All rights reserved.
//

#import "HJLocalPhoto.h"

@interface HJLocalPhoto ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@end

@implementation HJLocalPhoto

/**
 选择图片(通过 相册 和 照相 获得)
 
 @param viewController 推出的源视图控制器
 @param completion     获取图片回调
 */
- (void)hj_selectPhotoWithViewController:(UIViewController *)viewController completion:(HJImageBlcok)completion
{
    // 标题置空
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *albumAction = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self hj_openAlbumWithViewController:viewController completion:^(UIImage *image) {
            // 压缩图片
            UIImage *resizedImage = [image hj_compressImageWithCompressionQuality:0.5 scaleToSize:CGSizeMake(120.0, 120.0)];
            if (completion) {
                completion(resizedImage);
            }
        }];
    }];
    UIAlertAction *camareAction = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self hj_openCameraWithViewController:viewController completion:^(UIImage *image) {
            // 压缩图片
            UIImage *resizedImage = [image hj_compressImageWithCompressionQuality:0.5 scaleToSize:CGSizeMake(120.0, 120.0)];
            if (completion) {
                completion(resizedImage);
            }
        }];
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [alertController dismissViewControllerAnimated:YES completion:nil];
    }];
    [alertController addAction:albumAction];
    [alertController addAction:camareAction];
    [alertController addAction:cancelAction];
    [viewController presentViewController:alertController animated:YES completion:nil];
}

/**
 *  打开系统相机
 *
 *  @param completion 返回图片回调
 */
- (void)hj_openCameraWithViewController:(UIViewController *)viewController completion:(HJImageBlcok)completion
{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
        [imagePickerController setDelegate:self];
        [imagePickerController setAllowsEditing:YES];
        [imagePickerController setSourceType:UIImagePickerControllerSourceTypeCamera];
        [viewController presentViewController:imagePickerController animated:YES completion:nil];
        objc_setAssociatedObject(self, (__bridge const void *)(imagePickerController), completion, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

/**
 *  打开系统相册
 *
 *  @param completion 返回图片回调
 */
- (void)hj_openAlbumWithViewController:(UIViewController *)viewController completion:(HJImageBlcok)completion
{
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    [imagePickerController setDelegate:self];
    [imagePickerController setAllowsEditing:YES];
    [imagePickerController setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [viewController presentViewController:imagePickerController animated:YES completion:nil];
    objc_setAssociatedObject(self, (__bridge const void *)(imagePickerController), completion, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
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


@end
