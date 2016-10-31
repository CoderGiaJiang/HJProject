//
//  ViewController.m
//  HJProject
//
//  Created by User on 16/9/22.
//  Copyright © 2016年 Dellidc. All rights reserved.
//

#import "ViewController.h"
#import <Contacts/Contacts.h>
#import <ContactsUI/ContactsUI.h>

@interface ViewController ()<CNContactPickerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [HJCoreLocationManager hj_standardCoreLoactionManager].didUpdataBlock = ^(HJLocationModel *model){ self.navigationItem.title = model.name; };
    self.view.backgroundColor = [UIColor redColor];
    
    
//    //1 判断是否授权成功
//    if ([CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts] == CNAuthorizationStatusAuthorized) return;//授权成功直接返回
//    
//    //2 创建通讯录
//    CNContactStore *store = [[CNContactStore alloc] init];
//    //3授权
//    [store requestAccessForEntityType:CNEntityTypeContacts completionHandler:^(BOOL granted, NSError * _Nullable error) {
//        if (granted) {
//            NSLog(@"授权成功");
//        }else{
//            NSLog(@"授权失败");
//        }
//    }];
    
//
//    [self addContact];
//    [self readContact];

//    [self openContact];
    
//    UISegmentedControl *segment = [UISegmentedControl hj_segmentWithItems:@[@"1",@"2",@"3"] color:THEMECOLOR selectColor:TEXTGRAYCOLOR vauleChangeHandle:^(UIControl *sender) {
//        NSLog(@"点击 %ld", sender.tag);
//    }];
//    segment.frame = CGRectMake(0, 64, SCREEN_WIDTH, 40);
//    [segment hj_controlEvents:UIControlEventValueChanged actionHandle:^(UIControl *sender) {
//        NSLog(@"第二个点击");
//    }];
//    [self.view addSubview:segment];
}

/** 查看联系人列表信息 */
- (void)readContact {
    if ([CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts] != CNAuthorizationStatusAuthorized) return;//授权失败直接返回
    
    //创建通讯录对象
    CNContactStore *store = [[CNContactStore alloc] init];
    
    // 创建获取通信录的请求对象
    //拿到所有打算获取的属性对应的key（这里仅仅指定需要获取的数据，节约资源）
    //我们这里仅仅作为示例，所以获取了所有的信息数据
    NSArray *typeArray = @[CNContactGivenNameKey,CNContactFamilyNameKey,CNContactPhoneNumbersKey,CNContactEmailAddressesKey,CNContactBirthdayKey,CNContactDepartmentNameKey];
    
    //创建CNContactFetchRequest对象
    CNContactFetchRequest *request = [[CNContactFetchRequest alloc] initWithKeysToFetch:typeArray];
    
    
    [CNContactFormatter descriptorForRequiredKeysForStyle:CNContactFormatterStyleFullName];
    
    //遍历所有的联系人
    [store enumerateContactsWithFetchRequest:request error:nil usingBlock:^(CNContact * _Nonnull contact, BOOL * _Nonnull stop) {
        
        //名字
        NSString *firstName = contact.givenName;
        //姓氏
        NSString *lastName = contact.familyName;
        
        NSLog(@"%@ -- %@", firstName, lastName);
        
        //获取电话信息
        NSArray *phones = contact.phoneNumbers;
        for (int i = 0; i<phones.count; i++) {
            
            CNLabeledValue *phone = phones[i];
            
            //获取电话号码的KEY
            NSString *label = phone.label;
            
            //获取电话号码
            CNPhoneNumber *phoneNum = phone.value;
            NSString *num = phoneNum.stringValue;
            NSLog(@"name= %@ -- num = %@", label, num);
        }
    }];
    
    // 通过检索方式获取联系人
    CNContactStore * stroe = [[CNContactStore alloc]init];
    //检索条件，检索所有名字中有zhang的联系人
    NSPredicate *predicate = [CNContact predicateForContactsMatchingName:@"zhang"];
    //提取数据
    NSArray * contactsResult = [stroe unifiedContactsMatchingPredicate:predicate keysToFetch:@[CNContactGivenNameKey] error:nil];
    
}

/**
 *  添加联系人
 */
- (void)addContact {
    
    //1、联系人对象：CNContact
    
    //这个对象是用来配置联系人信息的，有可变的CNMutaleContact和CNContact，区别用来读取和创建联系人。CNContact对象中有许多属性，对应联系人的一些信息。
    
    //首先，创建CNMutableContact对象：
    CNMutableContact *contact = [[CNMutableContact alloc]init];
    
    //设置联系人数据
    [self setupContact:contact];
    
    
    //2、创建添加联系人请求：CNSaveRequest
    //CNSaveRequest是用于存储联系人的请求类，通过这个类，我们可以创建 **批量添加、修改或者删除** 联系人的请求，例如添加上面我们创建的联系人对象：
    
    //初始化方法
    CNSaveRequest * saveRequest = [[CNSaveRequest alloc] init];
    //添加联系人
    [saveRequest addContact:contact toContainerWithIdentifier:nil];
    
    //3 进行联系人的写入操作:CNContactStore
    //CNContactStore是一个用于存取联系人的上下文桥梁，现在，把我们创建的添加联系人的请求写入：
    CNContactStore * store = [[CNContactStore alloc]init];
    [store executeSaveRequest:saveRequest error:nil];
}

/** 设置联系人信息 */
- (void)setupContact:(CNMutableContact *)contact{
    //设置联系人头像：
//    contact.imageData = UIImagePNGRepresentation([UIImage imageNamed:@"tour"]);
    
    //设置联系人姓名：
    //设置名字
    contact.givenName = @"xiao";
    //设置姓氏
    contact.familyName = @"zhang";
    
    //设置联系人邮箱(这里需要注意，emailAddresses属性是一个数组，数组中是才CNLabeledValue对象)
    CNLabeledValue *homeEmail = [CNLabeledValue labeledValueWithLabel:CNLabelHome value:@"3242523553@qq.com"];
    CNLabeledValue *workEmail =[CNLabeledValue labeledValueWithLabel:CNLabelWork value:@"324266653@qq.com"];
    contact.emailAddresses = @[homeEmail,workEmail];
    
    // 家庭 CNLabelHome
    // 工作 CNLabelWork
    // 其他 CNLabelOther
    // 邮箱地址 CNLabelEmailiCloud
    // url地址 CNLabelURLAddressHomePage
    // 日期 CNLabelDateAnniversary
    
    // 联系人电话
//    CNLabelPhoneNumberiPhone
//    CNLabelPhoneNumberMobile
//    CNLabelPhoneNumberMain
//    CNLabelPhoneNumberHomeFax
//    CNLabelPhoneNumberWorkFax
//    CNLabelPhoneNumberOtherFax
//    CNLabelPhoneNumberPager
    
    //设置联系人电话(和邮箱类似)
    CNLabeledValue *mianPhone = [CNLabeledValue labeledValueWithLabel:CNLabelPhoneNumberMain value:[CNPhoneNumber phoneNumberWithStringValue:@"6363524"]];
    CNLabeledValue *homePhone = [CNLabeledValue labeledValueWithLabel:CNLabelPhoneNumberHomeFax value:[CNPhoneNumber phoneNumberWithStringValue:@"1536312321"]];
    contact.phoneNumbers = @[mianPhone, homePhone];
    
    //设置联系人地址
    CNMutablePostalAddress * homeAdress = [[CNMutablePostalAddress alloc]init];
    homeAdress.street = @"大雁塔";
    homeAdress.city = @"西安";
    homeAdress.state = @"中国";
    homeAdress.postalCode = @"xxxxx";
    contact.postalAddresses = @[[CNLabeledValue labeledValueWithLabel:CNLabelHome value:homeAdress]];
    
    //设置联系人生日
    NSDateComponents * birthday = [[NSDateComponents  alloc] init];
    birthday.day=7;
    birthday.month=9;
    birthday.year=1998;
    contact.birthday=birthday;
}

//打开通讯录
- (void)openContact {
    //初始化ContactPickerViewController
    CNContactPickerViewController *pickVc = [[CNContactPickerViewController alloc] init]; // 联系人列表
    //成为自己的代理
    pickVc.delegate = self;
    //跳转控制器
    [self presentViewController:pickVc animated:YES completion:nil];
}

#pragma mark - CNContactPickerDelegate
// 点击cancle按钮时候就会调用
- (void)contactPickerDidCancel:(CNContactPickerViewController *)picker{
    NSLog(@"%s", __func__);
    [picker dismissViewControllerAnimated:YES completion:nil];
}

//  选中某一个联系人就会调用
//注意：只要实现了这个方法, 就不会进行下一步操作(进入详情), iOS9的做法是默认返回NO
- (void)contactPicker:(CNContactPickerViewController *)picker didSelectContact:(CNContact *)contact{
    NSLog(@"%s", __func__);
    //姓氏
    NSString *firstName = contact.familyName;
    //名字
    NSString *lastName = contact.givenName;
    NSLog(@"%@---%@", firstName, lastName);
    //电话信息
    NSArray *phones = contact.phoneNumbers;
    for (CNLabeledValue *phone in phones) {
        //电话名称
        NSString *name = phone.label;
        //电话号码详情
        CNPhoneNumber *phoneNum = phone.value;
        NSLog(@"name = %@, phoneNum = %@", name, phoneNum.stringValue);
    }
    
}

// 选中某一个联系人的某一个属性时就会调用
- (void)contactPicker:(CNContactPickerViewController *)picker didSelectContactProperty:(CNContactProperty *)contactProperty{
    NSLog(@"%s", __func__);
}


/*
 CNAuthorizationStatusNotDetermined = 0,
 CNAuthorizationStatusRestricted,
 CNAuthorizationStatusDenied,
 CNAuthorizationStatusAuthorized
 
 NotDetermined：表示用户还没有允许或禁止访问通讯录数据库。首次安装的应用软件处于这种状态。
 Restricted：不仅应用软件无法访问通讯录数据，就连用户也无法通过设置修改授权状态。该状态是由于其他限制，也就是家长控制（parental control）所导致。
 Denied：表示用户不允许访问通讯录数据。只有用户才能够修改该状态。
 Authorized：这是每个应用软件期望得到的状态。在该状态下，应用软件可以随意访问通讯录数据库，使用通讯录数据执行操作。
 */


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
