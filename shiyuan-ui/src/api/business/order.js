import request from '@/utils/request'

// 查询订单信息列表
export function listOrder(query) {
  return request({
    url: '/business/order/list',
    method: 'get',
    params: query
  })
}

// 查询订单信息详细
export function getOrder(orderId) {
  return request({
    url: '/business/order/' + orderId,
    method: 'get'
  })
}
// 查询订单信息所有详情
export function getOrderInfoDetails(orderId) {
  return request({
    url: '/business/order/getOrderInfoDetails/' + orderId,
    method: 'get'
  })
}




// 新增订单信息
export function addOrder(data) {
  return request({
    url: '/business/order',
    method: 'post',
    data: data
  })
}

// 修改订单信息
export function updateOrder(data) {
  return request({
    url: '/business/order',
    method: 'put',
    data: data
  })
}

// 删除订单信息
export function delOrder(orderId) {
  return request({
    url: '/business/order/' + orderId,
    method: 'delete'
  })
}

// 保存结账信息
export function savePaymentData(data) {
  return request({
    url: '/business/order/savePaymentData',
    method: 'post',
    data: data
  })
}



