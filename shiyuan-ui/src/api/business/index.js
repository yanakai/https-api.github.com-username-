import request from '@/utils/request'


// 首页订单统计功能
export function orderStatistics(query) {
  return request({
    url: '/business/order/getOrderStatistics',
    method: 'get',
    params: query
  })
}
// 首页--技师结单统计功能
export function artificerStatistics(query) {
  return request({
    url: '/business/order/getArtificerStatistics',
    method: 'get',
    params: query
  })
}



