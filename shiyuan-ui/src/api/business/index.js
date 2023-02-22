import request from '@/utils/request'


// 订单首页统计功能
export function orderStatistics(query) {
  return request({
    url: '/business/order/getOrderStatistics',
    method: 'get',
    params: query
  })
}


