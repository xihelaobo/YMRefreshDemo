# YMRefreshDemo
这是一个基于MJRefresh库的二次封装类,使用起来更加方便简洁,具体的使用方法请见demo.

//使用方法

第一步
首先,我们的YMRefresh是基于MJRefresh的二次封装,当然,第一步是引入MJRefresh三方库,这里不再赘述.

第二步
初始化UITableView,并添加到当前view上

第三步
调用

//正常情况下的调用例子
```
//eg:1
[_ymRefresh normalModelRefresh:_tableView refreshType:RefreshTypeDropDown firstRefresh:NO timeLabHidden:NO stateLabHidden:YES dropDownBlock:^{
NSLog(@"只支持下拉");
if ([weakSelf.tableView.mj_header isRefreshing]) {
[weakSelf.tableView.mj_header endRefreshing];
}
} upDropBlock:nil];
```
```
//eg:2
[_ymRefresh normalModelRefresh:_tableView refreshType:RefreshTypeUpDrop firstRefresh:NO timeLabHidden:NO stateLabHidden:NO dropDownBlock:nil upDropBlock:^{
NSLog(@"只支持上拉");
if ([weakSelf.tableView.mj_footer isRefreshing]) {
[weakSelf.tableView.mj_footer endRefreshing];
}
}];
```
```
//eg:3
[_ymRefresh normalModelRefresh:_tableView refreshType:RefreshTypeDouble firstRefresh:NO timeLabHidden:NO stateLabHidden:YES dropDownBlock:^{
NSLog(@"下拉");
if ([weakSelf.tableView.mj_header isRefreshing]) {
[weakSelf.tableView.mj_header endRefreshing];
}
} upDropBlock:^{
NSLog(@"上拉");
if ([weakSelf.tableView.mj_footer isRefreshing]) {
[weakSelf.tableView.mj_footer endRefreshing];
weakSelf.tableView.mj_footer = nil;
}else{

}
}];
```

//gif情况下的调用
```
//eg.1
[_ymRefresh gifModelRefresh:_tableView refreshType:RefreshTypeDropDown firstRefresh:NO timeLabHidden:YES stateLabHidden:NO dropDownBlock:^{
NSLog(@"gif下拉");
if ([weakSelf.tableView.mj_header isRefreshing]) {
[weakSelf.tableView.mj_header endRefreshing];
}
} upDropBlock:nil];
```
```
//eg.2
[_ymRefresh gifModelRefresh:_tableView refreshType:RefreshTypeUpDrop firstRefresh:NO timeLabHidden:NO stateLabHidden:NO dropDownBlock:nil upDropBlock:^{
NSLog(@"gif上拉");
if ([weakSelf.tableView.mj_footer isRefreshing]) {
[weakSelf.tableView.mj_footer endRefreshing];
}
}];
```
```
//eg.3
[_ymRefresh gifModelRefresh:_tableView refreshType:RefreshTypeDouble firstRefresh:NO timeLabHidden:YES stateLabHidden:NO dropDownBlock:^{
if ([weakSelf.tableView.mj_header isRefreshing]) {
[weakSelf.tableView.mj_header endRefreshing];
}
} upDropBlock:^{
if ([weakSelf.tableView.mj_footer isRefreshing]) {
[weakSelf.tableView.mj_footer endRefreshing];
}
}];
```

具体的请看demo
//自定义部分有待开发
