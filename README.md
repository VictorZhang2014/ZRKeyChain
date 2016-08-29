# ZRKeyChain
A keychain library for storing accounts and passwords and sharing data between multiple applications in Objective-C. 
You have to config one item if you wanna share the accounts and passwords amongst multiple applications.

- 1.KeyChain is a way that is storing data in safety and security.
- 2.It still stay in your KeyChain even though you uninstall the application.
- 3.A new installed app can get these former data from KeyChain .
- 4.Sharing data that requires two more application that their KeyChain string are the same.

## How to get started
-----------------------------------

- [Download ZRKeyChain](https://github.com/VictorZhang2014/ZRKeyChain) try out the example app


## Installation
-----------------------------------

[CocoaPods](http://cocoapods.org) is a dependency manager for Objective-C , which anutomates and simplifies the process of using 3rd-party libraries like ZRKeyChain in you projects.

```bash
$ gem install cocoapods
```

> Cocoapods 1.0.0+ is required to build ZRKeyChain 1.1

#### podfile

To integrate ZRKeyChain into your Xcode project using Cocoapods, specify it in your `Podfile`:

```ruby
source 'https://github.com/VictorZhang2014/ZRKeyChain'
platform :ios, '7.0'  

pod 'ZRKeyChain', '~>1.1'
```
Then, run the following command:

```bash
$ pod install
```


## Usage
----------------------------------

### Storing data to Keychain, 
```objective-c
    [ZRKeyChain saveKeychain:@"server.name" account:@"server.name" data:@"password"];
    or
    [ZRKeyChain saveKeychain:@"server.name" account:@"account.name" data:@"password"];
```

### Getting data from Keychain
```objective-c
    id value1 = [ZRKeyChain loadKeychain:@"server.name" account:@"server.name"];
    or
    id value2 = [ZRKeyChain loadKeychain:@"server.name" account:@"account.name"];
```

## Note
- 1. A server.name can contain several accounts and passwords. Or A server.name only store an account and password.
- 2. A server.name can get an account and password that deponds on @"server.name" or @"account.name".
- 3. Sharing accounts and passwords amongst mutiple applications that deponds on the config of the screenshot below.
![ZRKeychain Effect Photo 3](https://github.com/VictorZhang2014/ZRKeyChain/blob/master/screenshots/keychain.png "ZRKeychain")
-     select step
-     project  ->  target  ->  Capacities  ->  Keychain Sharing 


# ZRKeyChain
Keychain 钥匙串 存储账号和密码，还可以多个应用之间分享此账号和密码，只需要配置一项，如下一张图片

- 1.iOS的keychain提供一种安全保存信息的方式，
- 2.可以保存密码等数据，而且keychain中的数据不会因为你删除app而丢失，
- 3.你可以在重新安装后继续读取keychain中的数据。
- 4.通常每个应用程序只允许访问自己在keychain中保存的数据，不过假如你使用同一个证书的话，不同的app也可以通过keychain来实现应用间的数据共享

## 如何开始
-----------------------------------

- [下载ZRKeyChain](https://github.com/VictorZhang2014/ZRKeyChain) 下载试试吧


## 安装
-----------------------------------

[CocoaPods](http://cocoapods.org)  是一个Objective-C的依赖管理器，它可以自动地并简化第三方库的集成流程

```bash
$ gem install cocoapods
```

> 编译ZRKeyChain 1.1 要求Cocoapods 1.0.0+ 

#### podfile

集成ZRKeyChain到你的项目，请使用Cocoapods ,并指定Podfile配置文件

```ruby
source 'https://github.com/VictorZhang2014/ZRKeyChain'
platform :ios, '7.0'  

pod 'ZRKeyChain', '~>1.1'
```
然后，运行以下命令

```bash
$ pod install
```


## Usage
----------------------------------

### 存储数据到KeyChain
```objective-c
    [ZRKeyChain saveKeychain:@"server.name" account:@"server.name" data:@"password"];
    or
    [ZRKeyChain saveKeychain:@"server.name" account:@"account.name" data:@"password"];
```

### 从KeyChain获取数据
```objective-c
    id value1 = [ZRKeyChain loadKeychain:@"server.name" account:@"server.name"];
    or
    id value2 = [ZRKeyChain loadKeychain:@"server.name" account:@"account.name"];
```

## Note
- 1. 一个server.name可以包含多个账号和密码，或者一个server.name只存储一对账号密码。
-    server.name 一般是以公司的域名倒着写，如com.domain.ios.zhidao
- 2. 一个server.name可以获取一对账号密码，这取决于server.name或account.name
-    account.name 一般是要保存的账户名，如myaccountone
- 3. 在多个应用之间分享账号和密码，需要配置如下图片
-     配置选择项步骤
-     project  ->  target  ->  Capacities  ->  Keychain Sharing 
![ZRKeychain Effect Photo 3](https://github.com/VictorZhang2014/ZRKeyChain/blob/master/screenshots/keychain.png "ZRKeychain")

