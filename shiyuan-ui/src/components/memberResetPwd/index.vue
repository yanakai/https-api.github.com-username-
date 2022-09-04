<template>
  <el-form ref="form" :model="member" :rules="rules" label-width="80px">
    <el-form-item label="旧密码" prop="oldPassword">
      <el-input v-model="member.oldPassword" placeholder="请输入旧密码" type="password" show-password/>
    </el-form-item>
    <el-form-item label="新密码" prop="newPassword">
      <el-input v-model="member.newPassword" placeholder="请输入新密码" type="password" show-password/>
    </el-form-item>
    <el-form-item label="确认密码" prop="confirmPassword">
      <el-input v-model="member.confirmPassword" placeholder="请确认新密码" type="password" show-password/>
    </el-form-item>
    <el-form-item>
      <el-button type="primary" size="mini" @click="submit">保存</el-button>
      <el-button type="danger" size="mini" @click="close">关闭</el-button>
    </el-form-item>
  </el-form>
</template>

<script>
import { updateMemberPwd } from "@/api/business/member";
export default {
  props: {
    // 会员信息对象
    memberInfo: {},
  },
  data() {
    const equalToPassword = (rule, value, callback) => {
      if (this.member.newPassword !== value) {
        callback(new Error("两次输入的密码不一致"));
      } else {
        callback();
      }
    };
    return {
      member: {
        oldPassword: undefined,
        newPassword: undefined,
        confirmPassword: undefined
      },
      // 表单校验
      rules: {
        oldPassword: [
          { required: true, message: "旧密码不能为空", trigger: "blur" }
        ],
        newPassword: [
          { required: true, message: "新密码不能为空", trigger: "blur" },
          {
            pattern: /^\d+(\.\d{0,2})?$/,
            message: "只能输入6位以内数字",
            trigger: "blur"
          }
        ],
        confirmPassword: [
          { required: true, message: "确认密码不能为空", trigger: "blur" },
          { required: true, validator: equalToPassword, trigger: "blur" }
        ]
      }
    };
  },
  methods: {
    submit() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          updateMemberPwd(this.memberInfo.memberId,this.member.oldPassword, this.member.newPassword).then(response => {
            this.$modal.msgSuccess("修改成功");
             // 调用父页面进行关闭当前弹窗
            this.closeCurrentPage();
          });
        }
      });
    },
    close() {
      this.closeCurrentPage();
    },
    // 调用父页面进行关闭当前弹窗
    closeCurrentPage(){
      // 调用父页面传递来的方法，逗号后面可以传递参数
      this.$emit("close-page-click");
      this.member={
        oldPassword: null,
        newPassword: null,
        confirmPassword: null
      };
      this.resetForm("form");
    },
  }
};
</script>
