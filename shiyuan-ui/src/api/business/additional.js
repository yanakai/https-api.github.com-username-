import request from '@/utils/request'

// 查询附加项单次金额列表
export function listAdditional(query) {
  return request({
    url: '/business/additional/list',
    method: 'get',
    params: query
  })
}

// 查询附加项单次金额详细
export function getAdditional(additionalId) {
  return request({
    url: '/business/additional/' + additionalId,
    method: 'get'
  })
}

// 新增附加项单次金额
export function addAdditional(data) {
  return request({
    url: '/business/additional',
    method: 'post',
    data: data
  })
}

// 修改附加项单次金额
export function updateAdditional(data) {
  return request({
    url: '/business/additional',
    method: 'put',
    data: data
  })
}

// 删除附加项单次金额
export function delAdditional(additionalId) {
  return request({
    url: '/business/additional/' + additionalId,
    method: 'delete'
  })
}
