import request from '@/utils/request'

// 查询业务--技师列表
export function listArtificer(query) {
  return request({
    url: '/business/artificer/list',
    method: 'get',
    params: query
  })
}

// 查询业务--技师详细
export function getArtificer(artificerId) {
  return request({
    url: '/business/artificer/' + artificerId,
    method: 'get'
  })
}

// 新增业务--技师
export function addArtificer(data) {
  return request({
    url: '/business/artificer',
    method: 'post',
    data: data
  })
}

// 修改业务--技师
export function updateArtificer(data) {
  return request({
    url: '/business/artificer',
    method: 'put',
    data: data
  })
}

// 删除业务--技师
export function delArtificer(artificerId) {
  return request({
    url: '/business/artificer/' + artificerId,
    method: 'delete'
  })
}

// 查询业务--技师列表不分页
export function getArtificerList(query) {
  return request({
    url: '/business/artificer/getList',
    method: 'get',
    params: query
  })
}
