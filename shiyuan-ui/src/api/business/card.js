import request from '@/utils/request'

// 查询业务--会员卡信息列表
export function listCard(query) {
  return request({
    url: '/business/card/list',
    method: 'get',
    params: query
  })
}

// 查询业务--会员卡信息详细
export function getCard(cardId) {
  return request({
    url: '/business/card/' + cardId,
    method: 'get'
  })
}

// 新增业务--会员卡信息
export function addCard(data) {
  return request({
    url: '/business/card',
    method: 'post',
    data: data
  })
}

// 修改业务--会员卡信息
export function updateCard(data) {
  return request({
    url: '/business/card',
    method: 'put',
    data: data
  })
}

// 删除业务--会员卡信息
export function delCard(cardId) {
  return request({
    url: '/business/card/' + cardId,
    method: 'delete'
  })
}


// 查询业务--会员卡信息不分页
export function getCardList(query) {
  return request({
    url: '/business/card/getList',
    method: 'get',
    params: query
  })
}