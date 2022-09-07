import request from '@/utils/request'

// 查询会员信息列表
export function listMember(query) {
  return request({
    url: '/business/member/list',
    method: 'get',
    params: query
  })
}

// 查询会员信息详细
export function getMember(memberId) {
  return request({
    url: '/business/member/' + memberId,
    method: 'get'
  })
}

// 新增会员信息
export function addMember(data) {
  return request({
    url: '/business/member',
    method: 'post',
    data: data
  })
}

// 修改会员信息
export function updateMember(data) {
  return request({
    url: '/business/member',
    method: 'put',
    data: data
  })
}

// 删除会员信息
export function delMember(memberId) {
  return request({
    url: '/business/member/' + memberId,
    method: 'delete'
  })
}
// 会员密码重置
export function updateMemberPwd(memberId,oldPassword, newPassword) {
  const data = {
    memberId,
    oldPassword,
    newPassword
  }
  return request({
    url: '/business/member/updatePwd',
    method: 'put',
    params: data
  })
}

// 通过会员卡id和会员手机号查询需要合并的会员信息
export function getMergeMemberList(query) {
  return request({
    url: '/business/member/getMergeMemberList' ,
    method: 'get',
    params: query
  })
}
// 合并会员信息实现
export function handleMergeMemberList(memberId,memberIds) {
  const data = {
    memberId,
    memberIds
  }
  return request({
    url: '/business/member/handleMergeMemberList',
    method: 'put',
    params: data
  })
}


