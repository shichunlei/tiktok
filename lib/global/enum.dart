/// 页面状态类型
enum ViewState {
  success,
  loading, //加载中
  empty, // 加载成功，但数据为空
  error, //加载失败
  noNetwork, // 没网
}

enum RefreshState { none, refresh, load, error }